Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53D3B93EFFA
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jul 2024 10:35:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4E2B10E03A;
	Mon, 29 Jul 2024 08:35:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=leemhuis.info header.i=@leemhuis.info header.b="cdFRv8UG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de
 [80.237.130.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E9A810E03A;
 Mon, 29 Jul 2024 08:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 In-Reply-To:References; bh=hCYlTQ17YHOGNp0OKHgpYTRh6FCoAUsIqBGDapwrN1A=;
 t=1722242132; x=1722674132; b=cdFRv8UGMiU1Gkh0fXHgcrfuLClQkgpb3Hon6/HenCMNMut
 xFwTl2F+jbdUA6XPFAzenOu3oMxBVLOgb2ouNDyhW74ugkRSFCGM03Uz9ghkW66riHvlYsu5LvjvJ
 NG2zEFqWv2++RbqvHVE52Y34iK6uwM0DL8UuX8Yk0oO55BAyvTDUELiC0/bg9AJr9mCqRV4dMwcWM
 I4pThVHkoWzs0R2jsYL3W3AjSiUHHyO96Ldim31qkZU58ytuGoa4/Htk11wcKnSWugGNrhAhtgejx
 w3TdA/OGtTbApooTmuFTEAS49L0Vk2XCbQ41EBbiNUUx9eD1CAni+FJTMFU5OHbw==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
 by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 id 1sYLqs-0004yw-5c; Mon, 29 Jul 2024 10:35:30 +0200
Message-ID: <e2050c2e-582f-4c6c-bf5f-54c5abd375cb@leemhuis.info>
Date: Mon, 29 Jul 2024 10:35:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] No image on 4k display port displays connected
 through usb-c dock in kernel 6.10
To: Greg KH <gregkh@linuxfoundation.org>, "Lin, Wayne" <Wayne.Lin@amd.com>
Cc: "stable@vger.kernel.org" <stable@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "Wu, Hersen" <hersenxs.wu@amd.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "kevin@holm.dev" <kevin@holm.dev>,
 Linux regressions mailing list <regressions@lists.linux.dev>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
References: <d74a7768e957e6ce88c27a5bece0c64dff132e24@holm.dev>
 <9ca719e4-2790-4804-b2cb-4812899adfe8@leemhuis.info>
 <fd8ece71459cd79f669efcfd25e4ce38b80d4164@holm.dev>
 <CO6PR12MB54897CE472F9271B25883DF6FCB72@CO6PR12MB5489.namprd12.prod.outlook.com>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Content-Language: en-US, de-DE
In-Reply-To: <CO6PR12MB54897CE472F9271B25883DF6FCB72@CO6PR12MB5489.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de; regressions@leemhuis.info; 1722242132;
 19f7f9fa; 
X-HE-SMSGID: 1sYLqs-0004yw-5c
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
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[+Greg +stable]

On 29.07.24 10:16, Lin, Wayne wrote:
>
> Thanks for the report.
> 
> Patch fa57924c76d995 ("drm/amd/display: Refactor function dm_dp_mst_is_port_support_mode()")
> is kind of correcting problems causing by commit:
> 4df96ba6676034 ("drm/amd/display: Add timing pixel encoding for mst mode validation")
> 
> Sorry if it misses fixes tag and would suggest to backport to fix it. Thanks!

Greg, seem it would be wise to pick up fa57924c76d995 for 6.10.y as
well, despite a lack of Fixes or stable tags.

Ciao, Thorsten

>> -----Original Message-----
>> From: kevin@holm.dev <kevin@holm.dev>
>> Sent: Sunday, July 28, 2024 12:43 AM
>> To: Linux regressions mailing list <regressions@lists.linux.dev>; Deucher,
>> Alexander <Alexander.Deucher@amd.com>; Wu, Hersen
>> <hersenxs.wu@amd.com>; Lin, Wayne <Wayne.Lin@amd.com>
>> Cc: regressions@lists.linux.dev; stable@vger.kernel.org; LKML <linux-
>> kernel@vger.kernel.org>; ML dri-devel <dri-devel@lists.freedesktop.org>;
>> amd-gfx@lists.freedesktop.org
>> Subject: Re: [REGRESSION] No image on 4k display port displays connected
>> through usb-c dock in kernel 6.10
>>
>>> [adding a few people and lists to the recipients]
>>>
>>> Hi! Thx for your rpeort.
>>>
>>> On 27.07.24 18:07, kevin@holm.dev wrote:
>>>
>>>>
>>>> Connecting two 4k displays with display port through a lenovo usb-c
>>>>
>>>>  dock (type 40AS) to a Lenovo P14s Gen 2 (type 21A0) results in no
>>>>
>>>>  image on the connected displays.
>>>>
>>>>
>>>>
>>>>  The CPU in the Lenovo P14s is a 'AMD Ryzen 7 PRO 5850U with Radeon
>>>>
>>>>  Graphics' and it has no discrete GPU.
>>>>
>>>>
>>>>
>>>>  I first noticed the issue with kernel version '6.10.0-arch1-2'
>>>>
>>>>  provided by arch linux. With the previous kernel version
>>>>
>>>>  '6.9.10.arch1-1' both connected displays worked normally. I reported
>>>>
>>>>  the issue in the arch forums at
>>>>
>>>>  https://bbs.archlinux.org/viewtopic.php?id=297999 and was guided to
>>>>
>>>>  do a bisection to find the commit that caused the problem. Through
>>>>
>>>>  testing I identified that the issue is not present in the latest
>>>>
>>>>  kernel directly compiled from the trovalds/linux git repository.
>>>>
>>>>
>>>>
>>>>  With git bisect I identified
>> 4df96ba66760345471a85ef7bb29e1cd4e956057
>>>>
>>>
>>> That's 4df96ba6676034 ("drm/amd/display: Add timing pixel encoding for
>>>
>>> mst mode validation") [v6.10-rc1] from Hersen Wu.
>>>
>>> Did you try if reverting that commit is possible and might fix the problem?
>>
>> Reverting is not easily possible:
>>
>> $ git checkout v6.10
>> [...]
>> HEAD is now at 0c3836482481 Linux 6.10
>>
>> $ git revert 4df96ba66760345471a85ef7bb29e1cd4e956057
>> Auto-merging
>> drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
>> CONFLICT (content): Merge conflict in
>> drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
>> error: could not revert 4df96ba66760... drm/amd/display: Add timing pixel
>> encoding for mst mode validation
>>
>> I do not know enough to try and solve the conflict myself without breaking
>> more things.
>>
>>>
>>>>
>>>> as the first bad commit and
>> fa57924c76d995e87ca3533ec60d1d5e55769a27
>>>>
>>>
>>> That's fa57924c76d995 ("drm/amd/display: Refactor function
>>>
>>> dm_dp_mst_is_port_support_mode()") [v6.10-post] from Wayne Lin.
>>>
>>>>
>>>> as the first commit that fixed the problem again.
>>>>
>>>
>>> Hmm, the latter commit does not have a fixes tag and might or might not
>>>
>>> be to invasive to backport to 6.10. Let's see what the AMD developers say.
>>>
>>>>
>>>> The initial commit only still shows an image on one of the connected
>>>>
>>>>  4k screens. I have not investigated further to find out at what point
>>>>
>>>>  both displays stopped showing an image.
>>>>
>>>
>>> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
>>>
>>> --
>>>
>>> Everything you wanna know about Linux kernel regression tracking:
>>>
>>> https://linux-regtracking.leemhuis.info/about/#tldr
>>>
>>> If I did something stupid, please tell me, as explained on that page.
>>>
