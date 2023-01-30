Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC0D2681B3D
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jan 2023 21:19:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F5B210E12B;
	Mon, 30 Jan 2023 20:19:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FEFE10E12B;
 Mon, 30 Jan 2023 20:19:35 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 hn2-20020a05600ca38200b003dc5cb96d46so1972986wmb.4; 
 Mon, 30 Jan 2023 12:19:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tpokIJDSZzqHSJDGhqSzmkBsCKFTZDnMLuN4zymXWTA=;
 b=p0UiG900WXM2A1Fw8OzsI7ZJbtaO5S/zOqJ68ReWdWUGEETyfIgZhSr8TogTAmOUtq
 FGOfY4ejyAUFdAXWBgIgnYX09kyG47Iz/0DmwrUdtGMl255wduEBtfpXNIrlkd4AF2wH
 /k3vqPQMwPAMHtK5EtZ/8OQyIkZ0awmbXkYq8cAh7u0fBQeGiJGjcM5Ip5tQ/Z1UTOjQ
 gQ6VBau0vwbxmXQyBKzT2XjrCPXBrsuwpHM2r5cLId6VeyDlv1mvRSoCIDNo00NKToco
 farotpQCLy8Myx3/gRvHW6leR0rEeTJxi2IgyK3A8g8A8Srf16agT7LStEEaY+AtrwHN
 ru5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tpokIJDSZzqHSJDGhqSzmkBsCKFTZDnMLuN4zymXWTA=;
 b=KA0FstKdvW8LNeAoCMXYGqGnJ+PMYezkLjLBSlExCb667xGOYIAKoMezBK2h3BOZym
 ijmzVal3Ewjbd5aglQ4iRyPBc2PELlrP0yBE5e+Oip3cKRvSvUSCfshIGQSaW4AdM09v
 cWzN9dGxYsLn9XuYuzbYg8+m64WpsdNS6FwrjZ8WZC/DBcno6Lf4/1kImooudsfbhyP3
 omYy70i+Kk4E8UW+GmxiUKOczrkyhnwXBplEaqRhecRbgKooe/lUk50LAwvs6y7G0x82
 8M9OPDeDl6qIKcooWKmrWgwlKtFE4/HUXep4OxAX/3rySA5RLxh0y7zpRU7b7rtFDMaH
 OuSQ==
X-Gm-Message-State: AO0yUKVcCAHJ3G61WZ0BFgCnF+BrnVKzW8je92aUae+5U4+DPlMWWnFX
 CL1Tc5BFe01NHkLM5efGM2Q=
X-Google-Smtp-Source: AK7set8tk0+2xec7Ji1+1KYZ/rXzoxz5g1DJTJYwKacFFYysSvaTKfa7csgh4CGcQ6aRjmeSF23oIg==
X-Received: by 2002:a7b:c44a:0:b0:3dc:46f6:e5fd with SMTP id
 l10-20020a7bc44a000000b003dc46f6e5fdmr9804066wmi.7.1675109973685; 
 Mon, 30 Jan 2023 12:19:33 -0800 (PST)
Received: from [192.168.1.10] (97e09f27.skybroadband.com. [151.224.159.39])
 by smtp.googlemail.com with ESMTPSA id
 d33-20020a05600c4c2100b003dc41a9836esm9851172wmp.43.2023.01.30.12.19.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Jan 2023 12:19:32 -0800 (PST)
Message-ID: <1cdb84ac-f7a8-66ba-98fc-3db302b49a5a@googlemail.com>
Date: Mon, 30 Jan 2023 20:19:29 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: linux-6.2-rc4+ hangs on poweroff/reboot: Bisected
To: Ben Skeggs <skeggsb@gmail.com>
References: <b64705e3-2e63-a466-f829-f9568b06766a@googlemail.com>
 <fcec3c78-b5d9-eb48-0fc0-d1f27de87f23@leemhuis.info>
 <b21fa1f6-a71d-5657-8596-ee0be73185ea@leemhuis.info>
 <3ab28896-70e9-6f90-5b97-e5397b06e715@googlemail.com>
 <a163dd7b-c5d1-a07b-a816-7a2dfd3edfd4@leemhuis.info>
 <ab1b0f73-6b4e-8602-2999-b7bec25d92db@googlemail.com>
 <CACAvsv4sOtPjCVnEcKd2RCUqYWxSn5XKyksbS-Bds2qCqyusVw@mail.gmail.com>
Content-Language: en-GB
From: Chris Clayton <chris2553@googlemail.com>
In-Reply-To: <CACAvsv4sOtPjCVnEcKd2RCUqYWxSn5XKyksbS-Bds2qCqyusVw@mail.gmail.com>
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
Cc: Linux regressions mailing list <regressions@lists.linux.dev>,
 Karol Herbst <kherbst@redhat.com>, ML nouveau <nouveau@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>, bskeggs@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thanks, Ben.

On 30/01/2023 01:09, Ben Skeggs wrote:
> On Sat, 28 Jan 2023 at 21:29, Chris Clayton <chris2553@googlemail.com> wrote:
>>
>>
>>
>> On 28/01/2023 05:42, Linux kernel regression tracking (Thorsten Leemhuis) wrote:
>>> On 27.01.23 20:46, Chris Clayton wrote:
>>>> [Resend because the mail client on my phone decided to turn HTML on behind my back, so my reply got bounced.]
>>>>
>>>> Thanks Thorsten.
>>>>
>>>> I did try to revert but it didnt revert cleanly and I don't have the knowledge to fix it up.
>>>>
>>>> The patch was part of a merge that included a number of related patches. Tomorrow, I'll try to revert the lot and report
>>>> back.
>>>
>>> You are free to do so, but there is no need for that from my side. I
>>> only wanted to know if a simple revert would do the trick; if it
>>> doesn't, it in my experience often is best to leave things to the
>>> developers of the code in question,
>>
>> Sound advice, Thorsten. Way to many conflicts for me to resolve.
> Hey,
> 
> This is a complete shot-in-the-dark, as I don't see this behaviour on
> *any* of my boards.  Could you try the attached patch please?

Unfortunately, the patch made no difference.

I've been looking at how the graphics on my laptop is set up, and have a bit of a worry about whether the firmware might
be playing a part in this problem. In order to offload video decoding to the NVidia TU117 GPU, it seems the scrubber
firmware must be available, but as far as I know,that has not been released by NVidia. To get it to work, I followed
what ubuntu have done and the scrubber in /lib/firmware/nvidia/tu117/nvdec/ is a symlink to
../../tu116/nvdev/scrubber.bin. That, of course, means that some of the firmware loaded is for a different card is being
loaded. I note that processing related to firmware is being changed in the patch. Might my set up be at the root of my
problem?

I'll have a fiddle an see what I can work out.

Chris

> 
> Thanks,
> Ben.
> 
>>
>> as they know it best and thus have a
>>> better idea which hidden side effect a more complex revert might have.
>>>
>>> Ciao, Thorsten
>>>
>>>> On 27/01/2023 11:20, Linux kernel regression tracking (Thorsten Leemhuis) wrote:
>>>>> Hi, this is your Linux kernel regression tracker. Top-posting for once,
>>>>> to make this easily accessible to everyone.
>>>>>
>>>>> @nouveau-maintainers, did anyone take a look at this? The report is
>>>>> already 8 days old and I don't see a single reply. Sure, we'll likely
>>>>> get a -rc8, but still it would be good to not fix this on the finish line.
>>>>>
>>>>> Chris, btw, did you try if you can revert the commit on top of latest
>>>>> mainline? And if so, does it fix the problem?
>>>>>
>>>>> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
>>>>> --
>>>>> Everything you wanna know about Linux kernel regression tracking:
>>>>> https://linux-regtracking.leemhuis.info/about/#tldr
>>>>> If I did something stupid, please tell me, as explained on that page.
>>>>>
>>>>> #regzbot poke
>>>>>
>>>>> On 19.01.23 15:33, Linux kernel regression tracking (Thorsten Leemhuis)
>>>>> wrote:
>>>>>> [adding various lists and the two other nouveau maintainers to the list
>>>>>> of recipients]
>>>>>
>>>>>> On 18.01.23 21:59, Chris Clayton wrote:
>>>>>>> Hi.
>>>>>>>
>>>>>>> I build and installed the lastest development kernel earlier this week. I've found that when I try the laptop down (or
>>>>>>> reboot it), it hangs right at the end of closing the current session. The last line I see on  the screen when rebooting is:
>>>>>>>
>>>>>>>   sd 4:0:0:0: [sda] Synchronising SCSI cache
>>>>>>>
>>>>>>> when closing down I see one additional line:
>>>>>>>
>>>>>>>   sd 4:0:0:0 [sda]Stopping disk
>>>>>>>
>>>>>>> In both cases the machine then hangs and I have to hold down the power button fot a few seconds to switch it off.
>>>>>>>
>>>>>>> Linux 6.1 is OK but 6.2-rc1 hangs, so I bisected between this two and landed on:
>>>>>>>
>>>>>>>   # first bad commit: [0e44c21708761977dcbea9b846b51a6fb684907a] drm/nouveau/flcn: new code to load+boot simple HS FWs
>>>>>>> (VPR scrubber)
>>>>>>>
>>>>>>> I built and installed a kernel with f15cde64b66161bfa74fb58f4e5697d8265b802e (the parent of the bad commit) checked out
>>>>>>> and that shuts down and reboots fine. It the did the same with the bad commit checked out and that does indeed hang, so
>>>>>>> I'm confident the bisect outcome is OK.
>>>>>>>
>>>>>>> Kernels 6.1.6 and 5.15.88 are also OK.
>>>>>>>
>>>>>>> My system had dual GPUs - one intel and one NVidia. Related extracts from 'lscpi -v' is:
>>>>>>>
>>>>>>> 00:02.0 VGA compatible controller: Intel Corporation CometLake-H GT2 [UHD Graphics] (rev 05) (prog-if 00 [VGA controller])
>>>>>>>         Subsystem: CLEVO/KAPOK Computer CometLake-H GT2 [UHD Graphics]
>>>>>>>
>>>>>>>         Flags: bus master, fast devsel, latency 0, IRQ 142
>>>>>>>
>>>>>>>         Memory at c2000000 (64-bit, non-prefetchable) [size=16M]
>>>>>>>
>>>>>>>         Memory at a0000000 (64-bit, prefetchable) [size=256M]
>>>>>>>
>>>>>>>         I/O ports at 5000 [size=64]
>>>>>>>
>>>>>>>         Expansion ROM at 000c0000 [virtual] [disabled] [size=128K]
>>>>>>>
>>>>>>>         Capabilities: [40] Vendor Specific Information: Len=0c <?>
>>>>>>>
>>>>>>>         Capabilities: [70] Express Root Complex Integrated Endpoint, MSI 00
>>>>>>>
>>>>>>>         Capabilities: [ac] MSI: Enable+ Count=1/1 Maskable- 64bit-
>>>>>>>
>>>>>>>         Capabilities: [d0] Power Management version 2
>>>>>>>
>>>>>>>         Kernel driver in use: i915
>>>>>>>
>>>>>>>         Kernel modules: i915
>>>>>>>
>>>>>>>
>>>>>>> 01:00.0 VGA compatible controller: NVIDIA Corporation TU117M [GeForce GTX 1650 Ti Mobile] (rev a1) (prog-if 00 [VGA
>>>>>>> controller])
>>>>>>>         Subsystem: CLEVO/KAPOK Computer TU117M [GeForce GTX 1650 Ti Mobile]
>>>>>>>         Flags: bus master, fast devsel, latency 0, IRQ 141
>>>>>>>         Memory at c4000000 (32-bit, non-prefetchable) [size=16M]
>>>>>>>         Memory at b0000000 (64-bit, prefetchable) [size=256M]
>>>>>>>         Memory at c0000000 (64-bit, prefetchable) [size=32M]
>>>>>>>         I/O ports at 4000 [size=128]
>>>>>>>         Expansion ROM at c3000000 [disabled] [size=512K]
>>>>>>>         Capabilities: [60] Power Management version 3
>>>>>>>         Capabilities: [68] MSI: Enable+ Count=1/1 Maskable- 64bit+
>>>>>>>         Capabilities: [78] Express Legacy Endpoint, MSI 00
>>>>>>>         Kernel driver in use: nouveau
>>>>>>>         Kernel modules: nouveau
>>>>>>>
>>>>>>> DRI_PRIME=1 is exported in one of my init scripts (yes, I am still using sysvinit).
>>>>>>>
>>>>>>> I've attached the bisect.log, but please let me know if I can provide any other diagnostics. Please cc me as I'm not
>>>>>>> subscribed.
>>>>>>
>>>>>> Thanks for the report. To be sure the issue doesn't fall through the
>>>>>> cracks unnoticed, I'm adding it to regzbot, the Linux kernel regression
>>>>>> tracking bot:
>>>>>>
>>>>>> #regzbot ^introduced e44c2170876197
>>>>>> #regzbot title drm: nouveau: hangs on poweroff/reboot
>>>>>> #regzbot ignore-activity
>>>>>>
>>>>>> This isn't a regression? This issue or a fix for it are already
>>>>>> discussed somewhere else? It was fixed already? You want to clarify when
>>>>>> the regression started to happen? Or point out I got the title or
>>>>>> something else totally wrong? Then just reply and tell me -- ideally
>>>>>> while also telling regzbot about it, as explained by the page listed in
>>>>>> the footer of this mail.
>>>>>>
>>>>>> Developers: When fixing the issue, remember to add 'Link:' tags pointing
>>>>>> to the report (the parent of this mail). See page linked in footer for
>>>>>> details.
>>>>>>
>>>>>> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
>>>>>> --
>>>>>> Everything you wanna know about Linux kernel regression tracking:
>>>>>> https://linux-regtracking.leemhuis.info/about/#tldr
>>>>>> That page also explains what to do if mails like this annoy you.
>>>>
>>>>
