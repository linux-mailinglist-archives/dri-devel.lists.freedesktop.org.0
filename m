Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E2736B243B
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 13:34:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EB9210E7FF;
	Thu,  9 Mar 2023 12:34:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe34.google.com (mail-vs1-xe34.google.com
 [IPv6:2607:f8b0:4864:20::e34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4646710E7FF
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Mar 2023 12:34:47 +0000 (UTC)
Received: by mail-vs1-xe34.google.com with SMTP id o6so1439505vsq.10
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Mar 2023 04:34:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1678365286;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=DiUE/zZiBTgyj/KKxOe5nkZzMMtjm6bLreQ7dc3Bso0=;
 b=Mq8IlDtRAQ0k6mhcnoYCUPnOHXfJlbiAQ6U1xC10KPigpc/OX66Jddu+Q4g5xK24U7
 oInzPl1/2dLVsQIWRxDtt92cV8huwRX/zwEWzW1wa3bDvjilQdglCF3VeMePIMKBoNhu
 8SaGtuCMVuLzvTJ+o5Jn/0pvEpddxpbNN464xk/IEiYJ1hZcLLxtc2tCQJ3EmUITh1lc
 40ogvdJ69lgW2/92hJ9/JTQ4/+Z7noaugbSPHZ6QuRVK1MbmnjKgD1b2z+Ki2lke5/Zm
 ++fMd7HluzzHhdYh1eW5ubbvNbPc6gU++YB6cnNChlHATRlwV62kU/XN6l6mh9aZsnHg
 bfgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678365286;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DiUE/zZiBTgyj/KKxOe5nkZzMMtjm6bLreQ7dc3Bso0=;
 b=2GhynuWkByY3hZlFEr6I7svzwnxCemG1ODKJDTBFZRtILLKK/un9jH7pgew7XDwAJO
 CaRCD4iILzzhHh4pX7k/yB1aWmxgVYx4x6EeGFOhDK0F42TbEjrmhM2kpPqOXrOErqCU
 LVVh8vyUzydkS05GxuzLRa0J/9L+CwrvxbkafOLFXvWF9DI5EiYug1f/021zCkNhMOlJ
 ATCHVwdOlt3D+ru/IxnALB5tpHLowrk3MV0EpcNcCF7fnYjl1lIn0ok/fLTTLbqwirlG
 WzJq0rJ38M4Io2372ELNNrHkCu2lO1VZOHd0Q+trsRZfU9LRU/tkyKpXmPVG7IhzCl5A
 p/iw==
X-Gm-Message-State: AO0yUKU2VH3L8OpeE98efkRuzY0cLcspJ8U8W3GAA/JArqHczHb92fwW
 9HYcYf5eqvWXBA4m/rViJ2tRe4aJApyz7YOuYPxCdAWDq+HfNjg/JM8=
X-Google-Smtp-Source: AK7set+EIG7OKQ7+IcNXgIuLP/ZGbOglAr3aSzjgTP64ZqXLstESPC8NQdLtyXDWGRnyPnSWM2t+HPqf/Ie2JPxdRiQ=
X-Received: by 2002:a67:f71a:0:b0:415:8696:291d with SMTP id
 m26-20020a67f71a000000b004158696291dmr14469721vso.1.1678365286259; Thu, 09
 Mar 2023 04:34:46 -0800 (PST)
MIME-Version: 1.0
References: <7d216faea9647d328651460167bc27f6@rmail.be>
 <f9499ac65afe3d23079c5bca5e3c40bd@rmail.be>
 <CAPY8ntAGvQdSVt7meb2ddz+UejxpKPvmAcgYUyPWR2+R3e=wRg@mail.gmail.com>
 <fbf0bc1454b5ef81c916482c75d3492a@rmail.be>
In-Reply-To: <fbf0bc1454b5ef81c916482c75d3492a@rmail.be>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 9 Mar 2023 12:34:29 +0000
Message-ID: <CAPY8ntC5VSDU6=-cYip5F-WiUK+-YkPrhpaiwo33s0vQSJVjSA@mail.gmail.com>
Subject: Re: [regression] RPI4B drm vc4: no crtc or sizes since 5.17 (works in
 5.16; and still broken in at least 6.1)
To: AL13N <alien@rmail.be>
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
Cc: Emma Anholt <emma@anholt.net>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 9 Mar 2023 at 11:26, AL13N <alien@rmail.be> wrote:
>
> Dave Stevenson schreef op 2023-03-07 18:10:
> > Hi Maarten
> >
> > On Tue, 7 Mar 2023 at 16:25, AL13N <alien@rmail.be> wrote:
> >>
> >> AL13N schreef op 2023-03-06 17:34:
> >> > Hi,
> >> >
> >> > I have a RPI4B connected on 2nd HDMI port (furthest away from power)
> >> > to a 4K TV, which works until 5.16, from 5.17 there is no X (or
> >> > plymouth), the cause of no X is that EDID gives nothing, and in the
> >> > journal; there is "Cannot find any crct or sizes". Only the kernel is
> >> > changed for this.
> >> >
> >> > In 5.16 instead of this message there is a bunch of hex lines prefixed
> >> > with BAD.
> >> >
> >> > It is still broken in 6.1 at the very least.
> >> >
> >> > I donno if this is related to this part, but I wanted to try a newer
> >> > kernel, because the RPI4 seems to do all the video decoding in
> >> > software and cannot seem to handle it.
> >> >
> >> >
> >> > logs:
> >> > vc4-drm gpu: bound fef05700.hdmi (ops vc4_hdmi_ops [vc4])
> >> > vc4-drm gpu: bound fe004000.txp (ops vc4_txp_ops [vc4])
> >> > vc4-drm gpu: bound fe206000.pixelvalve (ops vc4_crtc_ops [vc4])
> >> > vc4-drm gpu: bound fe207000.pixelvalve (ops vc4_crtc_ops [vc4])
> >> > vc4-drm gpu: bound fe20a000.pixelvalve (ops vc4_crtc_ops [vc4])
> >> > vc4-drm gpu: bound fe216000.pixelvalve (ops vc4_crtc_ops [vc4])
> >> > vc4-drm gpu: bound fec12000.pixelvalve (ops vc4_crtc_ops [vc4])
> >> > checking generic (3ea81000 12c000) vs hw (0 ffffffffffffffff)
> >> > fb0: switching to vc4 from simple
> >> > Console: switching to colour dummy device 80x25
> >> > [drm] Initialized vc4 0.0.0 20140616 for gpu on minor 0
> >> > vc4-drm gpu: [drm] Cannot find any crtc or sizes
> >>
> >> 5.16 log has:
> >>
> >> vc4-drm gpu: bound fef05700.hdmi (ops vc4_hdmi_ops [vc4])
> >> vc4-drm gpu: bound fe004000.txp (ops vc4_txp_ops [vc4])
> >> vc4-drm gpu: bound fe206000.pixelvalve (ops vc4_crtc_ops [vc4])
> >> vc4-drm gpu: bound fe207000.pixelvalve (ops vc4_crtc_ops [vc4])
> >> vc4-drm gpu: bound fe20a000.pixelvalve (ops vc4_crtc_ops [vc4])
> >> vc4-drm gpu: bound fe216000.pixelvalve (ops vc4_crtc_ops [vc4])
> >> vc4-drm gpu: bound fec12000.pixelvalve (ops vc4_crtc_ops [vc4])
> >> [drm] Initialized vc4 0.0.0 20140616 for gpu on minor 0
> >>         [00] BAD  00 ff ff ff ff ff ff 00 36 74 00 00 00 00 00 00
> >>         [00] BAD  0b 1f 01 03 00 23 01 78 0a cf 74 a3 57 4c b0 23
> >>         [00] BAD  09 48 4c 00 00 00 01 01 01 ff 01 ff ff 01 01 01
> >>         [00] BAD  01 01 01 01 01 20 08 e8 00 30 f2 70 5a 80 b0 58
> >>         [00] BAD  8a 00 c4 8e 21 00 00 1e 02 3a 80 18 71 38 2d 40
> >>         [00] BAD  58 2c 45 00 c4 8e 21 00 00 1e 00 00 00 fc 00 53
> >>         [00] BAD  41 4c 4f 52 41 0a 20 20 20 20 20 20 00 00 00 fd
> >>         [00] BAD  00 3b 46 1f 8c 3c 00 0a 20 20 20 20 20 20 01 aa
> >> Console: switching to colour frame buffer device 240x67
> >> vc4-drm gpu: [drm] fb0: vc4drmfb frame buffer device
> >>
> >>
> >> i donno what this bad is, but it doesn't happen in 5.17... maybe these
> >> BAD got filtered out, but they did end up working for me? or
> >> something?
> >> i donno...
> >
> > Run it through edid-decode - the checksum is wrong.
> >
> > Block 0, Base EDID:
> >   EDID Structure Version & Revision: 1.3
> >   Vendor & Product Identification:
> >     Manufacturer: MST
> >     Model: 0
> >     Made in: week 11 of 2021
> >   Basic Display Parameters & Features:
> >     Analog display
> >     Input voltage level: 0.7/0.3 V
> >     Blank level equals black level
> >     Maximum image size: 35 cm x 1 cm
> >     Gamma: 2.20
> >     RGB color display
> >     First detailed timing is the preferred timing
> >   Color Characteristics:
> >     Red  : 0.6396, 0.3398
> >     Green: 0.2998, 0.6904
> >     Blue : 0.1376, 0.0380
> >     White: 0.2822, 0.2968
> >   Established Timings I & II: none
> >   Standard Timings:
> >     GTF     :  2288x1432   61.000 Hz  16:10   90.463 kHz 282.245 MHz
> >   Detailed Timing Descriptors:
> >     DTD 1:  3840x2160   60.000 Hz  16:9   135.000 kHz 594.000 MHz (708
> > mm x 398 mm)
> >                  Hfront  176 Hsync  88 Hback 296 Hpol P
> >                  Vfront    8 Vsync  10 Vback  72 Vpol P
> >     DTD 2:  1920x1080   60.000 Hz  16:9    67.500 kHz 148.500 MHz (708
> > mm x 398 mm)
> >                  Hfront   88 Hsync  44 Hback 148 Hpol P
> >                  Vfront    4 Vsync   5 Vback  36 Vpol P
> >     Display Product Name: 'SALORA'
> >   Display Range Limits:
> >     Monitor ranges (GTF): 59-70 Hz V, 31-140 kHz H, max dotclock 600
> > MHz
> >   Extension blocks: 1
> > Checksum: 0xaa (should be 0xeb)
> >
> > Weird that it also says that it's an analog display when it's
> > connected over HDMI. Something rather bizarre there, and I think it'll
> > hit problems in drm_edid at [1] as we end up with a connector having
> > no color_formats defined. I was discussing this with Maxime only last
> > week, but in relation to VGA monitors connected through HDMI to VGA
> > adapters without rewriting the EDID.
> >
> >
> > If you have an issue between 5.16 and 5.17, then I'd guess at [2] and
> > your monitor not asserting hotplug correctly. The raw hotplug status
> > is reported in /sys/kernel/debug/dri/N/hdmi0_regs (N will be either 0
> > or 1 depending on the probe order of the vc4 and v3d drivers). Grep
> > for HDMI_HOTPLUG.
> >
> > Incorrect hotplug behaviour causes grief when combined with HDMI2.0
> > and scrambling. If you don' t know the other end has been
> > disconnected, then you never know that scrambling needs to be
> > re-negotiated over SCDC, and the display will typically end up just
> > being blank.
> >
> > [1]
> > https://github.com/torvalds/linux/blob/master/drivers/gpu/drm/drm_edid.c#L6460
> > [2]
> > https://github.com/torvalds/linux/commit/cc5f1cbbc1e12ad5b11d594159fe793eb03c70fa
>
> So, i looked at these hdmi0_regs (and hdmi1_regs) and that seemed empty
> in 5.16 ? i did a cat on them, but nothing came out... (5.16 doesn't
> have v3d, so there was only one dri)

So what did a more recent kernel report? Your display isn't going to
change hotplug behaviour just because you changed kernel version.

The fact that it works with "video=HDMI-A-2:D" on the kernel command
line implies that it is incorrect hotplug behaviour in your monitor.
There's very little that can be done in software to fix that.

  Dave

> >> I also noticed that earlier in the logs there are more bound lines:
> >> (some are double)
> >>
> >> vc4-drm gpu: bound fe400000.hvs (ops vc4_hvs_ops [vc4])
> >> vc4-drm gpu: bound fe400000.hvs (ops vc4_hvs_ops [vc4])
> >>
> >> and then here for some reason systemd does modprobe@drm.service ? is
> >> this just a delayed starting log line, or does it actually try to
> >> unload
> >> drm and reload? i doubt it?
> >> in any case there is more that appears before:
> >>
> >> vc4-drm gpu: bound fe400000.hvs (ops vc4_hvs_ops [vc4])
> >> vc4-drm gpu: bound fe400000.hvs (ops vc4_hvs_ops [vc4])
> >> vc4-drm gpu: bound fe400000.hvs (ops vc4_hvs_ops [vc4])
> >> vc4-drm gpu: bound fef00700.hdmi (ops vc4_hdmi_ops [vc4])
> >> vc4-drm gpu: bound fe400000.hvs (ops vc4_hvs_ops [vc4])
> >> vc4-drm gpu: bound fef00700.hdmi (ops vc4_hdmi_ops [vc4])
> >>
> >>
> >> so, the error message is weird, as it implies 2 possibilities.
> >> however,
> >> i think it did find a crtc since all those pixelvalve things use crtc
> >> functions?
> >>
> >> So then why do i have this problem on my RPI4? do most people just use
> >> the raspberry pi kernels?
> >
> > Largely, yes, people use our vendor kernels.
> >
> > Stefan Wahren has been co-ordinating Pi4 support in mainline. I
> > believe [3] is tracking the current state.
> > Maxime has been working on the vc4 driver, and it should be functional
> > on most hardware. It looks like yours is not complying with the
> > standards.
> >
> >   Dave
> >
> > [3] https://github.com/lategoodbye/rpi-zero/issues/43
> [snip]
>
> Yeah, lategoodbye pointed me here
