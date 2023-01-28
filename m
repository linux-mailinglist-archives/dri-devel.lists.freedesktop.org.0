Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 534CD67F78E
	for <lists+dri-devel@lfdr.de>; Sat, 28 Jan 2023 12:29:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D3C710E17C;
	Sat, 28 Jan 2023 11:29:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80B2810E17C;
 Sat, 28 Jan 2023 11:29:37 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id m7so7141291wru.8;
 Sat, 28 Jan 2023 03:29:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JZ1xTDKyjH5p8vliIZMR6idzBEt9CT83BKCLR4uL47U=;
 b=b8ycbPxp3whx6/XEh4a8jC6lqNyM4v4LqLtl0bW6c/TrTn68SSFdUqkyQpIUbg3iJb
 vOsQu/p7o0zfr8vrTD8mw4O3zgFPAYBtSOMGZDrNwCdJpu7H0zt0FFSxsj09d4SXoAtZ
 8FDpWyUq4YaQWsZe30AqU6CjJNvErLG0MEEt6Tad9U95F+F5tXFki/4SG3U5ksJIXDjn
 tq/Zx6Ay0O5slTRzkxbwz0Tg83IRFQ7IdqJUFBflg/hKLJKRhIq69B+bNnullCdr+h/v
 dUPickcVjXMYwXMhTLHzg+WlT0gGBZl/cAtrOJDJ09zWKshm6qKDhFWmrWz3YgVJg4I3
 QvtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JZ1xTDKyjH5p8vliIZMR6idzBEt9CT83BKCLR4uL47U=;
 b=0/vS+/N/FJEfmwY83wFCvR0S4BQKd9OvkrWnPReA1xUWtTbBx9T+vlWYeWUBU5hy/k
 2AnZPeXQKeQGMLrJtTuF7MItEVa4Cc2r5TD3aB6PqPzdVnSlt2m46pEHPcHX08ECn5c7
 7JBiotyCB0+It7KaMRX1dn2VjJBDRzIh+1dX3VT7AusQAmq+8U32HVJYENfK18GKrkm7
 XFmtgJFUddrYvT06JJvVwApi/ECk2MJF330qWDdvi8yZ8vwLimRAVP0jlXKiDhzEA1A6
 4EH3JXQKOA+brpGdhnQyXesGvECyuizUXqUiU6F2dGgejESLxG1eZDKOW0BOwatDxstI
 iZTA==
X-Gm-Message-State: AO0yUKVj1Wt7fS+xkI8zBPxeSIxlri1sckOFqChP77AmhXHXlmwX3GHT
 VBhKbLeAYC4dyfHhJLwnH/I=
X-Google-Smtp-Source: AK7set8jZBChQ4Mh1964/1gOr1EHny2Xr+bR6F+kxFYXVwe6cfyTwJ7DZORX26wfiUEPOtTTV23brQ==
X-Received: by 2002:a5d:534c:0:b0:2bf:cfc0:ac71 with SMTP id
 t12-20020a5d534c000000b002bfcfc0ac71mr6538619wrv.53.1674905375766; 
 Sat, 28 Jan 2023 03:29:35 -0800 (PST)
Received: from [192.168.1.10] (97e09f27.skybroadband.com. [151.224.159.39])
 by smtp.googlemail.com with ESMTPSA id
 x26-20020a1c7c1a000000b003db01178b62sm10298989wmc.40.2023.01.28.03.29.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 28 Jan 2023 03:29:35 -0800 (PST)
Message-ID: <ab1b0f73-6b4e-8602-2999-b7bec25d92db@googlemail.com>
Date: Sat, 28 Jan 2023 11:29:33 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: linux-6.2-rc4+ hangs on poweroff/reboot: Bisected
To: Linux regressions mailing list <regressions@lists.linux.dev>,
 bskeggs@redhat.com, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>
References: <b64705e3-2e63-a466-f829-f9568b06766a@googlemail.com>
 <fcec3c78-b5d9-eb48-0fc0-d1f27de87f23@leemhuis.info>
 <b21fa1f6-a71d-5657-8596-ee0be73185ea@leemhuis.info>
 <3ab28896-70e9-6f90-5b97-e5397b06e715@googlemail.com>
 <a163dd7b-c5d1-a07b-a816-7a2dfd3edfd4@leemhuis.info>
Content-Language: en-GB
From: Chris Clayton <chris2553@googlemail.com>
In-Reply-To: <a163dd7b-c5d1-a07b-a816-7a2dfd3edfd4@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: ML nouveau <nouveau@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 28/01/2023 05:42, Linux kernel regression tracking (Thorsten Leemhuis) wrote:
> On 27.01.23 20:46, Chris Clayton wrote:
>> [Resend because the mail client on my phone decided to turn HTML on behind my back, so my reply got bounced.]
>>
>> Thanks Thorsten.
>>
>> I did try to revert but it didnt revert cleanly and I don't have the knowledge to fix it up.
>>
>> The patch was part of a merge that included a number of related patches. Tomorrow, I'll try to revert the lot and report
>> back.
> 
> You are free to do so, but there is no need for that from my side. I
> only wanted to know if a simple revert would do the trick; if it
> doesn't, it in my experience often is best to leave things to the
> developers of the code in question, 

Sound advice, Thorsten. Way to many conflicts for me to resolve.

as they know it best and thus have a
> better idea which hidden side effect a more complex revert might have.
> 
> Ciao, Thorsten
> 
>> On 27/01/2023 11:20, Linux kernel regression tracking (Thorsten Leemhuis) wrote:
>>> Hi, this is your Linux kernel regression tracker. Top-posting for once,
>>> to make this easily accessible to everyone.
>>>
>>> @nouveau-maintainers, did anyone take a look at this? The report is
>>> already 8 days old and I don't see a single reply. Sure, we'll likely
>>> get a -rc8, but still it would be good to not fix this on the finish line.
>>>
>>> Chris, btw, did you try if you can revert the commit on top of latest
>>> mainline? And if so, does it fix the problem?
>>>
>>> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
>>> --
>>> Everything you wanna know about Linux kernel regression tracking:
>>> https://linux-regtracking.leemhuis.info/about/#tldr
>>> If I did something stupid, please tell me, as explained on that page.
>>>
>>> #regzbot poke
>>>
>>> On 19.01.23 15:33, Linux kernel regression tracking (Thorsten Leemhuis)
>>> wrote:
>>>> [adding various lists and the two other nouveau maintainers to the list
>>>> of recipients]
>>>
>>>> On 18.01.23 21:59, Chris Clayton wrote:
>>>>> Hi.
>>>>>
>>>>> I build and installed the lastest development kernel earlier this week. I've found that when I try the laptop down (or
>>>>> reboot it), it hangs right at the end of closing the current session. The last line I see on  the screen when rebooting is:
>>>>>
>>>>> 	sd 4:0:0:0: [sda] Synchronising SCSI cache
>>>>>
>>>>> when closing down I see one additional line:
>>>>>
>>>>> 	sd 4:0:0:0 [sda]Stopping disk
>>>>>
>>>>> In both cases the machine then hangs and I have to hold down the power button fot a few seconds to switch it off.
>>>>>
>>>>> Linux 6.1 is OK but 6.2-rc1 hangs, so I bisected between this two and landed on:
>>>>>
>>>>> 	# first bad commit: [0e44c21708761977dcbea9b846b51a6fb684907a] drm/nouveau/flcn: new code to load+boot simple HS FWs
>>>>> (VPR scrubber)
>>>>>
>>>>> I built and installed a kernel with f15cde64b66161bfa74fb58f4e5697d8265b802e (the parent of the bad commit) checked out
>>>>> and that shuts down and reboots fine. It the did the same with the bad commit checked out and that does indeed hang, so
>>>>> I'm confident the bisect outcome is OK.
>>>>>
>>>>> Kernels 6.1.6 and 5.15.88 are also OK.
>>>>>
>>>>> My system had dual GPUs - one intel and one NVidia. Related extracts from 'lscpi -v' is:
>>>>>
>>>>> 00:02.0 VGA compatible controller: Intel Corporation CometLake-H GT2 [UHD Graphics] (rev 05) (prog-if 00 [VGA controller])
>>>>>         Subsystem: CLEVO/KAPOK Computer CometLake-H GT2 [UHD Graphics]
>>>>>
>>>>>         Flags: bus master, fast devsel, latency 0, IRQ 142
>>>>>
>>>>>         Memory at c2000000 (64-bit, non-prefetchable) [size=16M]
>>>>>
>>>>>         Memory at a0000000 (64-bit, prefetchable) [size=256M]
>>>>>
>>>>>         I/O ports at 5000 [size=64]
>>>>>
>>>>>         Expansion ROM at 000c0000 [virtual] [disabled] [size=128K]
>>>>>
>>>>>         Capabilities: [40] Vendor Specific Information: Len=0c <?>
>>>>>
>>>>>         Capabilities: [70] Express Root Complex Integrated Endpoint, MSI 00
>>>>>
>>>>>         Capabilities: [ac] MSI: Enable+ Count=1/1 Maskable- 64bit-
>>>>>
>>>>>         Capabilities: [d0] Power Management version 2
>>>>>
>>>>>         Kernel driver in use: i915
>>>>>
>>>>>         Kernel modules: i915
>>>>>
>>>>>
>>>>> 01:00.0 VGA compatible controller: NVIDIA Corporation TU117M [GeForce GTX 1650 Ti Mobile] (rev a1) (prog-if 00 [VGA
>>>>> controller])
>>>>>         Subsystem: CLEVO/KAPOK Computer TU117M [GeForce GTX 1650 Ti Mobile]
>>>>>         Flags: bus master, fast devsel, latency 0, IRQ 141
>>>>>         Memory at c4000000 (32-bit, non-prefetchable) [size=16M]
>>>>>         Memory at b0000000 (64-bit, prefetchable) [size=256M]
>>>>>         Memory at c0000000 (64-bit, prefetchable) [size=32M]
>>>>>         I/O ports at 4000 [size=128]
>>>>>         Expansion ROM at c3000000 [disabled] [size=512K]
>>>>>         Capabilities: [60] Power Management version 3
>>>>>         Capabilities: [68] MSI: Enable+ Count=1/1 Maskable- 64bit+
>>>>>         Capabilities: [78] Express Legacy Endpoint, MSI 00
>>>>>         Kernel driver in use: nouveau
>>>>>         Kernel modules: nouveau
>>>>>
>>>>> DRI_PRIME=1 is exported in one of my init scripts (yes, I am still using sysvinit).
>>>>>
>>>>> I've attached the bisect.log, but please let me know if I can provide any other diagnostics. Please cc me as I'm not
>>>>> subscribed.
>>>>
>>>> Thanks for the report. To be sure the issue doesn't fall through the
>>>> cracks unnoticed, I'm adding it to regzbot, the Linux kernel regression
>>>> tracking bot:
>>>>
>>>> #regzbot ^introduced e44c2170876197
>>>> #regzbot title drm: nouveau: hangs on poweroff/reboot
>>>> #regzbot ignore-activity
>>>>
>>>> This isn't a regression? This issue or a fix for it are already
>>>> discussed somewhere else? It was fixed already? You want to clarify when
>>>> the regression started to happen? Or point out I got the title or
>>>> something else totally wrong? Then just reply and tell me -- ideally
>>>> while also telling regzbot about it, as explained by the page listed in
>>>> the footer of this mail.
>>>>
>>>> Developers: When fixing the issue, remember to add 'Link:' tags pointing
>>>> to the report (the parent of this mail). See page linked in footer for
>>>> details.
>>>>
>>>> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
>>>> --
>>>> Everything you wanna know about Linux kernel regression tracking:
>>>> https://linux-regtracking.leemhuis.info/about/#tldr
>>>> That page also explains what to do if mails like this annoy you.
>>
>>
