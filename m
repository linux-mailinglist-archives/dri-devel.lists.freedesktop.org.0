Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CD5567EEBA
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jan 2023 20:46:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99DA010E1A9;
	Fri, 27 Jan 2023 19:46:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ED9F10E1A2;
 Fri, 27 Jan 2023 19:46:42 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 q10-20020a1cf30a000000b003db0edfdb74so5920945wmq.1; 
 Fri, 27 Jan 2023 11:46:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZzZrYwfIlsg/hf+UKa25iBP/Yd649/iUcqSOcRI8zd0=;
 b=moD7pz8Se0LDrliwZSOCOVz8TOFfh4e0O7LJI7iUl3rQjUn9v4sT++TSKODZNQWdVo
 T/M/mBvwYQd8NRHZnOFMsVp9KyjOvVU5fD6venKfI/SAXHyDuy7IYOkE5JgBeVgAM2Gt
 3oSjh8kJ8tV4KjAmOvDB7PaUfq8LnKzq8tK8c/IksBeIovCr17xxYpUYYZfA+ZB/QOBQ
 JrbF0v1Ye2w+jH6JLhRZimAVqS7YTC7XK35v/hM8Bf3X/NHfQ6o5DYSdgpbw4bRcv0ZI
 b/44bQBDPTHxMqPZKMAmWv74KIl78PqpX/Z65wk9UnH6ySIWu5dXfwfv5YLtmCJvirlE
 KNhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZzZrYwfIlsg/hf+UKa25iBP/Yd649/iUcqSOcRI8zd0=;
 b=AttCrCk2k7ur7bcryO/IfTFxW3zxA2ztbXzjJrTV6ypnuOzV1gFOkLMvAuCXwE+vQt
 85PXuz5tPCLgPOgaZZGgO1HPoOqyTqALkD0FFhQaO5LArNvnrhY9pzPn3o5o3ORZVDSC
 tgT0dJALH/R2MVsi1fWpYIXMsmYjjPAX94r/lOaDjpN+s+DW0GfGyNWkrBZ9wkBGG4hO
 UZ0gaeQuyAXrNsGNgmldhMsYbq+AZVCEOLVnl838ZcGVdd2JwFfBfq0yGfKzQZgr31J7
 +9LByXUl5WqlJ9F/PAbE1waGdYCiRC9s62mUSD8zZm28IZTb410aN4vHxV0ytugz8/Kb
 yFlA==
X-Gm-Message-State: AO0yUKVnLx8/D6NjSRKaohrSd/QdS2rjLoO+mbdjV3aDL8IEScNBm5P9
 WCBUkIKjQrFctoHFTZ7ViPc=
X-Google-Smtp-Source: AK7set/F3D5hmuWY6i4mvWWxz8kB8LJ8aiAEziUlyT0SDsrz1+0Q5Yevv2ZMl6Ud+pw70D01kVH00Q==
X-Received: by 2002:a05:600c:1ca0:b0:3dc:433a:e952 with SMTP id
 k32-20020a05600c1ca000b003dc433ae952mr1216612wms.33.1674848800805; 
 Fri, 27 Jan 2023 11:46:40 -0800 (PST)
Received: from [192.168.1.10] (97e09f27.skybroadband.com. [151.224.159.39])
 by smtp.googlemail.com with ESMTPSA id
 bd16-20020a05600c1f1000b003d1f3e9df3csm8975103wmb.7.2023.01.27.11.46.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Jan 2023 11:46:40 -0800 (PST)
Message-ID: <3ab28896-70e9-6f90-5b97-e5397b06e715@googlemail.com>
Date: Fri, 27 Jan 2023 19:46:37 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: linux-6.2-rc4+ hangs on poweroff/reboot: Bisected
Content-Language: en-GB
To: Linux regressions mailing list <regressions@lists.linux.dev>,
 bskeggs@redhat.com, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>
References: <b64705e3-2e63-a466-f829-f9568b06766a@googlemail.com>
 <fcec3c78-b5d9-eb48-0fc0-d1f27de87f23@leemhuis.info>
 <b21fa1f6-a71d-5657-8596-ee0be73185ea@leemhuis.info>
From: Chris Clayton <chris2553@googlemail.com>
In-Reply-To: <b21fa1f6-a71d-5657-8596-ee0be73185ea@leemhuis.info>
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

[Resend because the mail client on my phone decided to turn HTML on behind my back, so my reply got bounced.]

Thanks Thorsten.

I did try to revert but it didnt revert cleanly and I don't have the knowledge to fix it up.

The patch was part of a merge that included a number of related patches. Tomorrow, I'll try to revert the lot and report
back.

Chris



On 27/01/2023 11:20, Linux kernel regression tracking (Thorsten Leemhuis) wrote:
> Hi, this is your Linux kernel regression tracker. Top-posting for once,
> to make this easily accessible to everyone.
> 
> @nouveau-maintainers, did anyone take a look at this? The report is
> already 8 days old and I don't see a single reply. Sure, we'll likely
> get a -rc8, but still it would be good to not fix this on the finish line.
> 
> Chris, btw, did you try if you can revert the commit on top of latest
> mainline? And if so, does it fix the problem?
> 
> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
> --
> Everything you wanna know about Linux kernel regression tracking:
> https://linux-regtracking.leemhuis.info/about/#tldr
> If I did something stupid, please tell me, as explained on that page.
> 
> #regzbot poke
> 
> On 19.01.23 15:33, Linux kernel regression tracking (Thorsten Leemhuis)
> wrote:
>> [adding various lists and the two other nouveau maintainers to the list
>> of recipients]
> 
>> On 18.01.23 21:59, Chris Clayton wrote:
>>> Hi.
>>>
>>> I build and installed the lastest development kernel earlier this week. I've found that when I try the laptop down (or
>>> reboot it), it hangs right at the end of closing the current session. The last line I see on  the screen when rebooting is:
>>>
>>> 	sd 4:0:0:0: [sda] Synchronising SCSI cache
>>>
>>> when closing down I see one additional line:
>>>
>>> 	sd 4:0:0:0 [sda]Stopping disk
>>>
>>> In both cases the machine then hangs and I have to hold down the power button fot a few seconds to switch it off.
>>>
>>> Linux 6.1 is OK but 6.2-rc1 hangs, so I bisected between this two and landed on:
>>>
>>> 	# first bad commit: [0e44c21708761977dcbea9b846b51a6fb684907a] drm/nouveau/flcn: new code to load+boot simple HS FWs
>>> (VPR scrubber)
>>>
>>> I built and installed a kernel with f15cde64b66161bfa74fb58f4e5697d8265b802e (the parent of the bad commit) checked out
>>> and that shuts down and reboots fine. It the did the same with the bad commit checked out and that does indeed hang, so
>>> I'm confident the bisect outcome is OK.
>>>
>>> Kernels 6.1.6 and 5.15.88 are also OK.
>>>
>>> My system had dual GPUs - one intel and one NVidia. Related extracts from 'lscpi -v' is:
>>>
>>> 00:02.0 VGA compatible controller: Intel Corporation CometLake-H GT2 [UHD Graphics] (rev 05) (prog-if 00 [VGA controller])
>>>         Subsystem: CLEVO/KAPOK Computer CometLake-H GT2 [UHD Graphics]
>>>
>>>         Flags: bus master, fast devsel, latency 0, IRQ 142
>>>
>>>         Memory at c2000000 (64-bit, non-prefetchable) [size=16M]
>>>
>>>         Memory at a0000000 (64-bit, prefetchable) [size=256M]
>>>
>>>         I/O ports at 5000 [size=64]
>>>
>>>         Expansion ROM at 000c0000 [virtual] [disabled] [size=128K]
>>>
>>>         Capabilities: [40] Vendor Specific Information: Len=0c <?>
>>>
>>>         Capabilities: [70] Express Root Complex Integrated Endpoint, MSI 00
>>>
>>>         Capabilities: [ac] MSI: Enable+ Count=1/1 Maskable- 64bit-
>>>
>>>         Capabilities: [d0] Power Management version 2
>>>
>>>         Kernel driver in use: i915
>>>
>>>         Kernel modules: i915
>>>
>>>
>>> 01:00.0 VGA compatible controller: NVIDIA Corporation TU117M [GeForce GTX 1650 Ti Mobile] (rev a1) (prog-if 00 [VGA
>>> controller])
>>>         Subsystem: CLEVO/KAPOK Computer TU117M [GeForce GTX 1650 Ti Mobile]
>>>         Flags: bus master, fast devsel, latency 0, IRQ 141
>>>         Memory at c4000000 (32-bit, non-prefetchable) [size=16M]
>>>         Memory at b0000000 (64-bit, prefetchable) [size=256M]
>>>         Memory at c0000000 (64-bit, prefetchable) [size=32M]
>>>         I/O ports at 4000 [size=128]
>>>         Expansion ROM at c3000000 [disabled] [size=512K]
>>>         Capabilities: [60] Power Management version 3
>>>         Capabilities: [68] MSI: Enable+ Count=1/1 Maskable- 64bit+
>>>         Capabilities: [78] Express Legacy Endpoint, MSI 00
>>>         Kernel driver in use: nouveau
>>>         Kernel modules: nouveau
>>>
>>> DRI_PRIME=1 is exported in one of my init scripts (yes, I am still using sysvinit).
>>>
>>> I've attached the bisect.log, but please let me know if I can provide any other diagnostics. Please cc me as I'm not
>>> subscribed.
>>
>> Thanks for the report. To be sure the issue doesn't fall through the
>> cracks unnoticed, I'm adding it to regzbot, the Linux kernel regression
>> tracking bot:
>>
>> #regzbot ^introduced e44c2170876197
>> #regzbot title drm: nouveau: hangs on poweroff/reboot
>> #regzbot ignore-activity
>>
>> This isn't a regression? This issue or a fix for it are already
>> discussed somewhere else? It was fixed already? You want to clarify when
>> the regression started to happen? Or point out I got the title or
>> something else totally wrong? Then just reply and tell me -- ideally
>> while also telling regzbot about it, as explained by the page listed in
>> the footer of this mail.
>>
>> Developers: When fixing the issue, remember to add 'Link:' tags pointing
>> to the report (the parent of this mail). See page linked in footer for
>> details.
>>
>> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
>> --
>> Everything you wanna know about Linux kernel regression tracking:
>> https://linux-regtracking.leemhuis.info/about/#tldr
>> That page also explains what to do if mails like this annoy you.
