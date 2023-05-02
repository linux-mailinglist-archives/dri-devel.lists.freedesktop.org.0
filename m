Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4199B6F518F
	for <lists+dri-devel@lfdr.de>; Wed,  3 May 2023 09:31:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA03C10E1D1;
	Wed,  3 May 2023 07:30:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dijkstra.felixrichter.tech (dijkstra.felixrichter.tech
 [37.120.184.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB6F510E26F;
 Tue,  2 May 2023 13:48:53 +0000 (UTC)
Received: from [10.130.10.2] (unknown [10.130.10.2])
 by dijkstra.felixrichter.tech (Postfix) with ESMTPSA id 035BE1A024E;
 Tue,  2 May 2023 15:49:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=felixrichter.tech;
 s=20210926; t=1683035362;
 bh=4NZnipmb6YLcla5+VI50cBbXH7XresFxdMeUMfT+nFs=;
 h=Date:To:Cc:References:From:Subject:In-Reply-To;
 b=iWA+eweRcLqlXCVN87Vx0b4EpJ7S7jpTwjJxOxliVP8RbRV4bhr9pIZ8zTVuH7vxo
 xlyiuiuI+TOEhfIjpkM7XRPNqAtdXTJpexdaYgOxj8pjmpY41D2zKM2yWnED3AcDyu
 f5nHXISSfEQ038flnICYalca658j9VYWOEDUWPMI=
Message-ID: <0cac032a-0f65-5134-cde5-f535fc58c5ab@felixrichter.tech>
Date: Tue, 2 May 2023 15:48:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
To: Linux regressions mailing list <regressions@lists.linux.dev>,
 Alex Deucher <alexdeucher@gmail.com>
References: <46a7eb80-5f09-4f6a-4fd3-9550dafd497c@felixrichter.tech>
 <1efbf587-e7b5-74a3-89e4-ca70386bd191@leemhuis.info>
 <CADnq5_M-5SD6HDRVtFHPNF3q9XKz75PECdUxR-OaVpPe2Zw=EQ@mail.gmail.com>
 <8d23a70e-b132-9b25-917a-1f45918533cc@leemhuis.info>
From: Felix Richter <judge@felixrichter.tech>
Subject: Re: PROBLEM: AMD Ryzen 9 7950X iGPU - Blinking Issue
In-Reply-To: <8d23a70e-b132-9b25-917a-1f45918533cc@leemhuis.info>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 03 May 2023 07:30:49 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/2/23 15:34, Linux regression tracking (Thorsten Leemhuis) wrote:
> On 02.05.23 15:13, Alex Deucher wrote:
>> On Tue, May 2, 2023 at 7:45 AM Linux regression tracking (Thorsten
>> Leemhuis) <regressions@leemhuis.info> wrote:
>>
>>> On 30.04.23 13:44, Felix Richter wrote:
>>>> Hi,
>>>>
>>>> I am running into an issue with the integrated GPU of the Ryzen 9 7950X. It seems to be a regression from kernel version 6.1 to 6.2.
>>>> The bug materializes in from of my monitor blinking, meaning it turns full white shortly. This happens very often so that the system becomes unpleasant to use.
>>>>
>>>> I am running the Archlinux Kernel:
>>>> The Issue happens on the bleeding edge kernel: 6.2.13
>>>> Switching back to the LTS kernel resolves the issue: 6.1.26
>>>>
>>>> I have two monitors attached to the system. One 42 inch 4k Display and a 24 inch 1080p Display and am running sway as my desktop.
>>>>
>>>> Let me know if there is more information I could provide to help narrow down the issue.
>>> Thanks for the report. To be sure the issue doesn't fall through the
>>> cracks unnoticed, I'm adding it to regzbot, the Linux kernel regression
>>> tracking bot:
>>>
>>> #regzbot ^introduced v6.1..v6.2
>>> #regzbot title drm: amdgpu: system becomes unpleasant to use after
>>> monitor starts blinking and turns full white
>>> #regzbot ignore-activity
>>>
>>> This isn't a regression? This issue or a fix for it are already
>>> discussed somewhere else? It was fixed already? You want to clarify when
>>> the regression started to happen? Or point out I got the title or
>>> something else totally wrong? Then just reply and tell me -- ideally
>>> while also telling regzbot about it, as explained by the page listed in
>>> the footer of this mail.
>>>
>>> Developers: When fixing the issue, remember to add 'Link:' tags pointing
>>> to the report (the parent of this mail). See page linked in footer for
>>> details.
>> This sounds exactly like the issue that was fixed in this patch which
>> is already on it's way to Linus:
>> https://gitlab.freedesktop.org/agd5f/linux/-/commit/08da182175db4c7f80850354849d95f2670e8cd9
> FWIW, you in the flood of emails likely missed that this is the same
> thread where you yesterday replied "If the module parameter didn't help
> then perhaps you are seeing some other issue.  Can you bisect?". That's
> why I decided to add this to the tracking. Or am I missing something
> obvious here?
>
> /me looks around again and can't see anything, but that doesn't have to
> mean anything...
>
> Felix, btw, this guide might help you with the bisection, even if it's
> just for kernel compilation:
>
> https://docs.kernel.org/next/admin-guide/quickly-build-trimmed-linux.html
>
> And to indirectly reply to your mail from yesterday[1]. You might want
> to ignore the arch linux kernel git repo and just do a bisection between
> 6.1 and the latest 6.2.y kernel using upstream repos; and if I were you
> I'd also try 6.3 or even mainline before that, in case the issue was
> fixed already.
>
> [1]
> https://lore.kernel.org/all/04749ee4-0728-92fe-bcb0-a7320279eaac@felixrichter.tech/
>
> Ciao, Thorsten
Thanks for the pointers, I'll do a bisection on my desktop from 6.1 to 
the newest commit. That was the part I was mostly unsure about … where 
to start from.

I was planning to use PKGBUILD scripts from arch to achieve the same 
configuration as I would when installing
the package and just rewrite the script to use a local copy of the 
source code instead of the repository.
That way I can just use the bisect command, rebuild the package and test 
again.

But I probably won't be able to finish it this week, since I am on 
vacation starting tomorrow and will not have access to the computer in 
question. I will be back next week, by that time the patch Alex is 
talking about might
already be in mainline. So if that fixes it, I will notice and let you 
know. If not I will do the bisection to figure out what the actual issue is.

Kind regards,
Felix
