Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D74B67EE72
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jan 2023 20:41:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AD9C10E1A4;
	Fri, 27 Jan 2023 19:41:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82CE110E1A6;
 Fri, 27 Jan 2023 19:41:49 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id t18so5931608wro.1;
 Fri, 27 Jan 2023 11:41:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8sqgBAHL6reJV8ollJKxBdeycbLwtiWt9lw7yHofJ+o=;
 b=ev754F3r9umuRR7Kd1IlwkH/wy1GsuX/xv2o8gjfTHfnw2jZIxdec6h8OZ7A4U1Ie/
 Ixle02lE+0cjC7sF3HFxWrLT6RMcefSg1cSAoyX3uo/I7Q1BuU4XoaGZIU48jWninUhy
 zubv0TlYkmFKyOVxz4XkDmLQ84GBH3cemG2GLVq6c5xgKmiq+m5WFM8FawXz1FWs99M6
 MRaw7MiY9axrRcZ1OEaAzzqHIqFwPQnjpvlUm2j+aL0etaDwCFPZLS0Tk1FEHjNDW1X6
 LPCls/N89/lpJl66pw4pXbObmrkRFp0iQKjMAme9dbe1+6VBN3lJ6o2FVxpNtgnUbFbS
 PUmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8sqgBAHL6reJV8ollJKxBdeycbLwtiWt9lw7yHofJ+o=;
 b=gqQ8p+uwD0AO5eRHYa/m28zGVETTeQLUcoTKTQuFud/YnmSeBALZU4YpmNcZ4Z5q7p
 11wZ7rlxvn1aWVBvFnOP1bsNF3+QNYwuJsqI+p4zBN33GuaNsiFDa1UDFuZ2syz3yPZC
 AXeSlNIiL66R/AaPRf1YnnyJ68Kr1IadX3UqhhyC50l43FgZl/LxKR83ImTH912/iC+v
 4gwAINto6n4UZgLHgpd7zAHwCk0hWY8uwtLZmq86A37k7zr/X9WbV9fhAlUM5LmeaYhU
 FfP48bXj0m+4uQcPH8qtyAOXrSvqTix3XgDbii8J+5rX7K0JU/ZYCziuug0q0ZDhapWU
 Th9Q==
X-Gm-Message-State: AFqh2krLwENWw1KexkIXQreq+5xnG4i2NE574uNbkWe9xhnx8GQPE5p6
 Lr4V6wtk4+1vWkbTr7s68vO83R9ejVM=
X-Google-Smtp-Source: AMrXdXvgdY8iMSHPg3caqt8+mznS+ppnCOCN8jFs3bKnFQP3cGJZMJhfvzEIJelSi4nyVe5HeBtf8g==
X-Received: by 2002:a5d:6a46:0:b0:2bd:c856:6de0 with SMTP id
 t6-20020a5d6a46000000b002bdc8566de0mr38199087wrw.21.1674848507822; 
 Fri, 27 Jan 2023 11:41:47 -0800 (PST)
Received: from [192.168.1.10] (97e09f27.skybroadband.com. [151.224.159.39])
 by smtp.googlemail.com with ESMTPSA id
 n9-20020a5d4c49000000b002bfb7c2430bsm4827027wrt.19.2023.01.27.11.41.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Jan 2023 11:41:47 -0800 (PST)
Message-ID: <eb3c6b89-b6f2-311b-7387-14a9014bd36c@googlemail.com>
Date: Fri, 27 Jan 2023 19:41:44 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: linux-6.2-rc4+ hangs on poweroff/reboot: Bisected
To: Karol Herbst <kherbst@redhat.com>,
 Linux regressions mailing list <regressions@lists.linux.dev>
References: <b64705e3-2e63-a466-f829-f9568b06766a@googlemail.com>
 <fcec3c78-b5d9-eb48-0fc0-d1f27de87f23@leemhuis.info>
 <b21fa1f6-a71d-5657-8596-ee0be73185ea@leemhuis.info>
 <CACO55tsgc7mmmYBQATqG=zUmO22A1uA3_+A0krdCoORj4PirXg@mail.gmail.com>
Content-Language: en-GB
From: Chris Clayton <chris2553@googlemail.com>
In-Reply-To: <CACO55tsgc7mmmYBQATqG=zUmO22A1uA3_+A0krdCoORj4PirXg@mail.gmail.com>
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
Cc: ML nouveau <nouveau@lists.freedesktop.org>, bskeggs@redhat.com,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[Resend because the mail client on my phone dedcided to turn HTML on behinf my back, so my repluy got bounced.]

Thanks Karol.

I sent the original report to Ben and LKML. Thorsten then added you, Lyude Paul and the dri-devel and nouveau  mail
lists. So you should have received this report on or about January 19.

Chris

On 27/01/2023 11:35, Karol Herbst wrote:
> Where was the original email sent to anyway, because I don't have it at all.
> 
> Anyhow, I suspect we want to fetch logs to see what's happening, but
> due to the nature of this bug it might get difficult.
> 
> I'm checking out the laptops I have here if I can reproduce this
> issue, but I think all mine with Turing GPUs are fine.
> 
> Maybe Ben has any idea what might be wrong with
> 0e44c21708761977dcbea9b846b51a6fb684907a or if that's an issue which
> is already fixed by not upstreamed patches as I think I remember Ben
> to talk about something like that recently.
> 
> Karol
> 
> On Fri, Jan 27, 2023 at 12:20 PM Linux kernel regression tracking
> (Thorsten Leemhuis) <regressions@leemhuis.info> wrote:
>>
>> Hi, this is your Linux kernel regression tracker. Top-posting for once,
>> to make this easily accessible to everyone.
>>
>> @nouveau-maintainers, did anyone take a look at this? The report is
>> already 8 days old and I don't see a single reply. Sure, we'll likely
>> get a -rc8, but still it would be good to not fix this on the finish line.
>>
>> Chris, btw, did you try if you can revert the commit on top of latest
>> mainline? And if so, does it fix the problem?
>>
>> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
>> --
>> Everything you wanna know about Linux kernel regression tracking:
>> https://linux-regtracking.leemhuis.info/about/#tldr
>> If I did something stupid, please tell me, as explained on that page.
>>
>> #regzbot poke
>>
>> On 19.01.23 15:33, Linux kernel regression tracking (Thorsten Leemhuis)
>> wrote:
>>> [adding various lists and the two other nouveau maintainers to the list
>>> of recipients]
>>
>>> On 18.01.23 21:59, Chris Clayton wrote:
>>>> Hi.
>>>>
>>>> I build and installed the lastest development kernel earlier this week. I've found that when I try the laptop down (or
>>>> reboot it), it hangs right at the end of closing the current session. The last line I see on  the screen when rebooting is:
>>>>
>>>>      sd 4:0:0:0: [sda] Synchronising SCSI cache
>>>>
>>>> when closing down I see one additional line:
>>>>
>>>>      sd 4:0:0:0 [sda]Stopping disk
>>>>
>>>> In both cases the machine then hangs and I have to hold down the power button fot a few seconds to switch it off.
>>>>
>>>> Linux 6.1 is OK but 6.2-rc1 hangs, so I bisected between this two and landed on:
>>>>
>>>>      # first bad commit: [0e44c21708761977dcbea9b846b51a6fb684907a] drm/nouveau/flcn: new code to load+boot simple HS FWs
>>>> (VPR scrubber)
>>>>
>>>> I built and installed a kernel with f15cde64b66161bfa74fb58f4e5697d8265b802e (the parent of the bad commit) checked out
>>>> and that shuts down and reboots fine. It the did the same with the bad commit checked out and that does indeed hang, so
>>>> I'm confident the bisect outcome is OK.
>>>>
>>>> Kernels 6.1.6 and 5.15.88 are also OK.
>>>>
>>>> My system had dual GPUs - one intel and one NVidia. Related extracts from 'lscpi -v' is:
>>>>
>>>> 00:02.0 VGA compatible controller: Intel Corporation CometLake-H GT2 [UHD Graphics] (rev 05) (prog-if 00 [VGA controller])
>>>>         Subsystem: CLEVO/KAPOK Computer CometLake-H GT2 [UHD Graphics]
>>>>
>>>>         Flags: bus master, fast devsel, latency 0, IRQ 142
>>>>
>>>>         Memory at c2000000 (64-bit, non-prefetchable) [size=16M]
>>>>
>>>>         Memory at a0000000 (64-bit, prefetchable) [size=256M]
>>>>
>>>>         I/O ports at 5000 [size=64]
>>>>
>>>>         Expansion ROM at 000c0000 [virtual] [disabled] [size=128K]
>>>>
>>>>         Capabilities: [40] Vendor Specific Information: Len=0c <?>
>>>>
>>>>         Capabilities: [70] Express Root Complex Integrated Endpoint, MSI 00
>>>>
>>>>         Capabilities: [ac] MSI: Enable+ Count=1/1 Maskable- 64bit-
>>>>
>>>>         Capabilities: [d0] Power Management version 2
>>>>
>>>>         Kernel driver in use: i915
>>>>
>>>>         Kernel modules: i915
>>>>
>>>>
>>>> 01:00.0 VGA compatible controller: NVIDIA Corporation TU117M [GeForce GTX 1650 Ti Mobile] (rev a1) (prog-if 00 [VGA
>>>> controller])
>>>>         Subsystem: CLEVO/KAPOK Computer TU117M [GeForce GTX 1650 Ti Mobile]
>>>>         Flags: bus master, fast devsel, latency 0, IRQ 141
>>>>         Memory at c4000000 (32-bit, non-prefetchable) [size=16M]
>>>>         Memory at b0000000 (64-bit, prefetchable) [size=256M]
>>>>         Memory at c0000000 (64-bit, prefetchable) [size=32M]
>>>>         I/O ports at 4000 [size=128]
>>>>         Expansion ROM at c3000000 [disabled] [size=512K]
>>>>         Capabilities: [60] Power Management version 3
>>>>         Capabilities: [68] MSI: Enable+ Count=1/1 Maskable- 64bit+
>>>>         Capabilities: [78] Express Legacy Endpoint, MSI 00
>>>>         Kernel driver in use: nouveau
>>>>         Kernel modules: nouveau
>>>>
>>>> DRI_PRIME=1 is exported in one of my init scripts (yes, I am still using sysvinit).
>>>>
>>>> I've attached the bisect.log, but please let me know if I can provide any other diagnostics. Please cc me as I'm not
>>>> subscribed.
>>>
>>> Thanks for the report. To be sure the issue doesn't fall through the
>>> cracks unnoticed, I'm adding it to regzbot, the Linux kernel regression
>>> tracking bot:
>>>
>>> #regzbot ^introduced e44c2170876197
>>> #regzbot title drm: nouveau: hangs on poweroff/reboot
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
>>>
>>> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
>>> --
>>> Everything you wanna know about Linux kernel regression tracking:
>>> https://linux-regtracking.leemhuis.info/about/#tldr
>>> That page also explains what to do if mails like this annoy you.
>>
> 
