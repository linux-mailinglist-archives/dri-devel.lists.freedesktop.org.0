Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 304FA67E389
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jan 2023 12:35:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1B6D10E45B;
	Fri, 27 Jan 2023 11:35:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94DFD10E454
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jan 2023 11:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674819323;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=poqA6RHKV0v9iLyMFWGM9vfyO+m9ySeX6jjTFbMjzpk=;
 b=aQUG2l5H4fObiEYmWK485V2evImoVueVFexEPsAYIreB+Bia+v4ZnABKi32Ju1n6nTV1Xv
 ikYxkgweguHpHMq4MSM9VULkDsyj+D03HeR72vAk3DnjjYUZLQAHGBv2iZfihzM8YD/5cf
 40O4oVJLlWlhDnjqevBtDnJ1SwoHOiM=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-648-nODawBN5NK6uEm-jAbxE_A-1; Fri, 27 Jan 2023 06:35:22 -0500
X-MC-Unique: nODawBN5NK6uEm-jAbxE_A-1
Received: by mail-lj1-f199.google.com with SMTP id
 by38-20020a05651c1a2600b0028b8260999eso1267918ljb.7
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jan 2023 03:35:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=poqA6RHKV0v9iLyMFWGM9vfyO+m9ySeX6jjTFbMjzpk=;
 b=N9oam8+vjHyxXIAF80wrce+TFhzrDihVL4seF/9NtolNb9jkaKY8cpjW0n52O8e4I4
 aXDQOySXZj8EUX24/G/7+bZJlvLXIC6WWOCK/GSg0J5KTBOzvj86lW59LCqbMKaGtIkA
 /vAROHcZ+ImajumdZVhaWYbbAcnRP3brog2E9MeLYQbJ7f4Jw7Q9fWKn3xHj1oq3Tkjc
 BK1f648b3/YAipA4HtxhSzqDuRzUtcRheDv+NUyVp9GQ3R6Qfs7aBI7XKlkP0JVkjfgw
 DnajENxGOJHTzYm/ADftwU/r55fZMao2zFeQZ/toROVlMrSNXIz0g/MI9bx1BFJ/CTzM
 hlww==
X-Gm-Message-State: AFqh2kpTkylBtPVXWtswLLSt3OVU7RggsfknpyFNlv/n1/fPQlqDtl7e
 dCpqEGBZGeDmd3EmTZ9P6swdf40SCUx16LeAWJfe5Js9W4Eguc6poY18YCxAo8Y7dOQy2vc+A+o
 KkCuhzk73n+pRTZF+DZrV20Uwdc/6ZCVOXpOEPdhvZkYj
X-Received: by 2002:ac2:4bd5:0:b0:4d5:76af:f890 with SMTP id
 o21-20020ac24bd5000000b004d576aff890mr2351459lfq.228.1674819320542; 
 Fri, 27 Jan 2023 03:35:20 -0800 (PST)
X-Google-Smtp-Source: AMrXdXui82HUdxbT8XcUd+t5khVAAaqiRUAf8yYK1febBIf6BtoEPVLmD26XmE6V5geG4mseiUv9bSQx4PG0c4B4//A=
X-Received: by 2002:ac2:4bd5:0:b0:4d5:76af:f890 with SMTP id
 o21-20020ac24bd5000000b004d576aff890mr2351452lfq.228.1674819320042; Fri, 27
 Jan 2023 03:35:20 -0800 (PST)
MIME-Version: 1.0
References: <b64705e3-2e63-a466-f829-f9568b06766a@googlemail.com>
 <fcec3c78-b5d9-eb48-0fc0-d1f27de87f23@leemhuis.info>
 <b21fa1f6-a71d-5657-8596-ee0be73185ea@leemhuis.info>
In-Reply-To: <b21fa1f6-a71d-5657-8596-ee0be73185ea@leemhuis.info>
From: Karol Herbst <kherbst@redhat.com>
Date: Fri, 27 Jan 2023 12:35:08 +0100
Message-ID: <CACO55tsgc7mmmYBQATqG=zUmO22A1uA3_+A0krdCoORj4PirXg@mail.gmail.com>
Subject: Re: linux-6.2-rc4+ hangs on poweroff/reboot: Bisected
To: Linux regressions mailing list <regressions@lists.linux.dev>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
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
 Chris Clayton <chris2553@googlemail.com>, LKML <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>, bskeggs@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Where was the original email sent to anyway, because I don't have it at all.

Anyhow, I suspect we want to fetch logs to see what's happening, but
due to the nature of this bug it might get difficult.

I'm checking out the laptops I have here if I can reproduce this
issue, but I think all mine with Turing GPUs are fine.

Maybe Ben has any idea what might be wrong with
0e44c21708761977dcbea9b846b51a6fb684907a or if that's an issue which
is already fixed by not upstreamed patches as I think I remember Ben
to talk about something like that recently.

Karol

On Fri, Jan 27, 2023 at 12:20 PM Linux kernel regression tracking
(Thorsten Leemhuis) <regressions@leemhuis.info> wrote:
>
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
> > [adding various lists and the two other nouveau maintainers to the list
> > of recipients]
>
> > On 18.01.23 21:59, Chris Clayton wrote:
> >> Hi.
> >>
> >> I build and installed the lastest development kernel earlier this week. I've found that when I try the laptop down (or
> >> reboot it), it hangs right at the end of closing the current session. The last line I see on  the screen when rebooting is:
> >>
> >>      sd 4:0:0:0: [sda] Synchronising SCSI cache
> >>
> >> when closing down I see one additional line:
> >>
> >>      sd 4:0:0:0 [sda]Stopping disk
> >>
> >> In both cases the machine then hangs and I have to hold down the power button fot a few seconds to switch it off.
> >>
> >> Linux 6.1 is OK but 6.2-rc1 hangs, so I bisected between this two and landed on:
> >>
> >>      # first bad commit: [0e44c21708761977dcbea9b846b51a6fb684907a] drm/nouveau/flcn: new code to load+boot simple HS FWs
> >> (VPR scrubber)
> >>
> >> I built and installed a kernel with f15cde64b66161bfa74fb58f4e5697d8265b802e (the parent of the bad commit) checked out
> >> and that shuts down and reboots fine. It the did the same with the bad commit checked out and that does indeed hang, so
> >> I'm confident the bisect outcome is OK.
> >>
> >> Kernels 6.1.6 and 5.15.88 are also OK.
> >>
> >> My system had dual GPUs - one intel and one NVidia. Related extracts from 'lscpi -v' is:
> >>
> >> 00:02.0 VGA compatible controller: Intel Corporation CometLake-H GT2 [UHD Graphics] (rev 05) (prog-if 00 [VGA controller])
> >>         Subsystem: CLEVO/KAPOK Computer CometLake-H GT2 [UHD Graphics]
> >>
> >>         Flags: bus master, fast devsel, latency 0, IRQ 142
> >>
> >>         Memory at c2000000 (64-bit, non-prefetchable) [size=16M]
> >>
> >>         Memory at a0000000 (64-bit, prefetchable) [size=256M]
> >>
> >>         I/O ports at 5000 [size=64]
> >>
> >>         Expansion ROM at 000c0000 [virtual] [disabled] [size=128K]
> >>
> >>         Capabilities: [40] Vendor Specific Information: Len=0c <?>
> >>
> >>         Capabilities: [70] Express Root Complex Integrated Endpoint, MSI 00
> >>
> >>         Capabilities: [ac] MSI: Enable+ Count=1/1 Maskable- 64bit-
> >>
> >>         Capabilities: [d0] Power Management version 2
> >>
> >>         Kernel driver in use: i915
> >>
> >>         Kernel modules: i915
> >>
> >>
> >> 01:00.0 VGA compatible controller: NVIDIA Corporation TU117M [GeForce GTX 1650 Ti Mobile] (rev a1) (prog-if 00 [VGA
> >> controller])
> >>         Subsystem: CLEVO/KAPOK Computer TU117M [GeForce GTX 1650 Ti Mobile]
> >>         Flags: bus master, fast devsel, latency 0, IRQ 141
> >>         Memory at c4000000 (32-bit, non-prefetchable) [size=16M]
> >>         Memory at b0000000 (64-bit, prefetchable) [size=256M]
> >>         Memory at c0000000 (64-bit, prefetchable) [size=32M]
> >>         I/O ports at 4000 [size=128]
> >>         Expansion ROM at c3000000 [disabled] [size=512K]
> >>         Capabilities: [60] Power Management version 3
> >>         Capabilities: [68] MSI: Enable+ Count=1/1 Maskable- 64bit+
> >>         Capabilities: [78] Express Legacy Endpoint, MSI 00
> >>         Kernel driver in use: nouveau
> >>         Kernel modules: nouveau
> >>
> >> DRI_PRIME=1 is exported in one of my init scripts (yes, I am still using sysvinit).
> >>
> >> I've attached the bisect.log, but please let me know if I can provide any other diagnostics. Please cc me as I'm not
> >> subscribed.
> >
> > Thanks for the report. To be sure the issue doesn't fall through the
> > cracks unnoticed, I'm adding it to regzbot, the Linux kernel regression
> > tracking bot:
> >
> > #regzbot ^introduced e44c2170876197
> > #regzbot title drm: nouveau: hangs on poweroff/reboot
> > #regzbot ignore-activity
> >
> > This isn't a regression? This issue or a fix for it are already
> > discussed somewhere else? It was fixed already? You want to clarify when
> > the regression started to happen? Or point out I got the title or
> > something else totally wrong? Then just reply and tell me -- ideally
> > while also telling regzbot about it, as explained by the page listed in
> > the footer of this mail.
> >
> > Developers: When fixing the issue, remember to add 'Link:' tags pointing
> > to the report (the parent of this mail). See page linked in footer for
> > details.
> >
> > Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
> > --
> > Everything you wanna know about Linux kernel regression tracking:
> > https://linux-regtracking.leemhuis.info/about/#tldr
> > That page also explains what to do if mails like this annoy you.
>

