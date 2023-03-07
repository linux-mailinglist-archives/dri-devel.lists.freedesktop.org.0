Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04DBA6AE7F8
	for <lists+dri-devel@lfdr.de>; Tue,  7 Mar 2023 18:10:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D86F410E0F7;
	Tue,  7 Mar 2023 17:10:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe35.google.com (mail-vs1-xe35.google.com
 [IPv6:2607:f8b0:4864:20::e35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8507410E0F7
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Mar 2023 17:10:34 +0000 (UTC)
Received: by mail-vs1-xe35.google.com with SMTP id f13so12934481vsg.6
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Mar 2023 09:10:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1678209033;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=OB4n9NrEZLLLcCwlt8NGHLmv+Xrqk6ci4fN1QSWcPKA=;
 b=Gy+ObzFrdpcgLaZiqTxPXzpGmZ2OphvdY7j+BBGcmBkvX6P/BwTmeT+X/sTAWmYSlM
 H/rMej8oCkRXt5nqBc+CXzoPthSjTyFLOE1yj8gNR9X5NstaNJBFwqKvougn6jeQE+5X
 FYqp97u6+EUYcIC67CwzChok3KQF39qu8f3rsiNIy0smqIrmhp0vpYZwKl5GhVb28MMg
 nlG5+RJ+Tg+ZX0mEYZTRwkFM46Yl8AA46tHAJ11RCFb7mpNZEeVlqHwUscPtH3jPg/np
 /LDiFO+k/dxPntpEUsNzRLcNsuvnGxACyB3jfWJKwE5XT/Ya/DVdVZ3V9hFkOaWdikoL
 9dUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678209033;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OB4n9NrEZLLLcCwlt8NGHLmv+Xrqk6ci4fN1QSWcPKA=;
 b=yq7mXkMAt/cBJNXfFJmGNXlEEWrsGvmNz7hPStVOt4C8V37erJojttKabC4ZS/vMqB
 Z6V/ONnXCUbLKRL4jkljbGMo26A1PawnGGlC7QKZKvfJoE5wdBTjHk5zuyaG2ZqARNuF
 IZKR2bE0UzAhjA1k7j/k+VICVgwPr8Gwa5+LNG1cnKWZPPcA6O38HzQ8EPNYubdvqod/
 A+hWkPp61DpRxs9+G7wYEc2AA80wr/dWvqnaxs2hCIGCz74SDzkBN8bjkUJkaFtddsmx
 i4f2zywZqbQiCnmx6zvX5UwNGCmwmUkNuJn/ewHs1uq1CroKyUigMJ2P1CRyEU8ozSYa
 q0Hw==
X-Gm-Message-State: AO0yUKU0O59L67aPEkLj9gsvGyc5wDz0JOEXW7HmrZSm0s8/EQpyrzfJ
 WbsxeEhYqj0ws0XzSSYnu6VDTwXDMln+8RBPc3OnuFBu9bYSPM+ONqs=
X-Google-Smtp-Source: AK7set/3gPR4E9cMQaX/73Se9lzxtCbJV/ysTeZTMFfFha9dZKn3vdSSGAfEs2N/XdEjpcPj/srUnh/4IQAFSht2z8M=
X-Received: by 2002:a05:6102:1266:b0:412:a97:4c11 with SMTP id
 q6-20020a056102126600b004120a974c11mr10190024vsg.1.1678209033513; Tue, 07 Mar
 2023 09:10:33 -0800 (PST)
MIME-Version: 1.0
References: <7d216faea9647d328651460167bc27f6@rmail.be>
 <f9499ac65afe3d23079c5bca5e3c40bd@rmail.be>
In-Reply-To: <f9499ac65afe3d23079c5bca5e3c40bd@rmail.be>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 7 Mar 2023 17:10:16 +0000
Message-ID: <CAPY8ntAGvQdSVt7meb2ddz+UejxpKPvmAcgYUyPWR2+R3e=wRg@mail.gmail.com>
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
Cc: dri-devel@lists.freedesktop.org, Emma Anholt <emma@anholt.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maarten

On Tue, 7 Mar 2023 at 16:25, AL13N <alien@rmail.be> wrote:
>
> AL13N schreef op 2023-03-06 17:34:
> > Hi,
> >
> > I have a RPI4B connected on 2nd HDMI port (furthest away from power)
> > to a 4K TV, which works until 5.16, from 5.17 there is no X (or
> > plymouth), the cause of no X is that EDID gives nothing, and in the
> > journal; there is "Cannot find any crct or sizes". Only the kernel is
> > changed for this.
> >
> > In 5.16 instead of this message there is a bunch of hex lines prefixed
> > with BAD.
> >
> > It is still broken in 6.1 at the very least.
> >
> > I donno if this is related to this part, but I wanted to try a newer
> > kernel, because the RPI4 seems to do all the video decoding in
> > software and cannot seem to handle it.
> >
> >
> > logs:
> > vc4-drm gpu: bound fef05700.hdmi (ops vc4_hdmi_ops [vc4])
> > vc4-drm gpu: bound fe004000.txp (ops vc4_txp_ops [vc4])
> > vc4-drm gpu: bound fe206000.pixelvalve (ops vc4_crtc_ops [vc4])
> > vc4-drm gpu: bound fe207000.pixelvalve (ops vc4_crtc_ops [vc4])
> > vc4-drm gpu: bound fe20a000.pixelvalve (ops vc4_crtc_ops [vc4])
> > vc4-drm gpu: bound fe216000.pixelvalve (ops vc4_crtc_ops [vc4])
> > vc4-drm gpu: bound fec12000.pixelvalve (ops vc4_crtc_ops [vc4])
> > checking generic (3ea81000 12c000) vs hw (0 ffffffffffffffff)
> > fb0: switching to vc4 from simple
> > Console: switching to colour dummy device 80x25
> > [drm] Initialized vc4 0.0.0 20140616 for gpu on minor 0
> > vc4-drm gpu: [drm] Cannot find any crtc or sizes
>
> 5.16 log has:
>
> vc4-drm gpu: bound fef05700.hdmi (ops vc4_hdmi_ops [vc4])
> vc4-drm gpu: bound fe004000.txp (ops vc4_txp_ops [vc4])
> vc4-drm gpu: bound fe206000.pixelvalve (ops vc4_crtc_ops [vc4])
> vc4-drm gpu: bound fe207000.pixelvalve (ops vc4_crtc_ops [vc4])
> vc4-drm gpu: bound fe20a000.pixelvalve (ops vc4_crtc_ops [vc4])
> vc4-drm gpu: bound fe216000.pixelvalve (ops vc4_crtc_ops [vc4])
> vc4-drm gpu: bound fec12000.pixelvalve (ops vc4_crtc_ops [vc4])
> [drm] Initialized vc4 0.0.0 20140616 for gpu on minor 0
>         [00] BAD  00 ff ff ff ff ff ff 00 36 74 00 00 00 00 00 00
>         [00] BAD  0b 1f 01 03 00 23 01 78 0a cf 74 a3 57 4c b0 23
>         [00] BAD  09 48 4c 00 00 00 01 01 01 ff 01 ff ff 01 01 01
>         [00] BAD  01 01 01 01 01 20 08 e8 00 30 f2 70 5a 80 b0 58
>         [00] BAD  8a 00 c4 8e 21 00 00 1e 02 3a 80 18 71 38 2d 40
>         [00] BAD  58 2c 45 00 c4 8e 21 00 00 1e 00 00 00 fc 00 53
>         [00] BAD  41 4c 4f 52 41 0a 20 20 20 20 20 20 00 00 00 fd
>         [00] BAD  00 3b 46 1f 8c 3c 00 0a 20 20 20 20 20 20 01 aa
> Console: switching to colour frame buffer device 240x67
> vc4-drm gpu: [drm] fb0: vc4drmfb frame buffer device
>
>
> i donno what this bad is, but it doesn't happen in 5.17... maybe these
> BAD got filtered out, but they did end up working for me? or something?
> i donno...

Run it through edid-decode - the checksum is wrong.

Block 0, Base EDID:
  EDID Structure Version & Revision: 1.3
  Vendor & Product Identification:
    Manufacturer: MST
    Model: 0
    Made in: week 11 of 2021
  Basic Display Parameters & Features:
    Analog display
    Input voltage level: 0.7/0.3 V
    Blank level equals black level
    Maximum image size: 35 cm x 1 cm
    Gamma: 2.20
    RGB color display
    First detailed timing is the preferred timing
  Color Characteristics:
    Red  : 0.6396, 0.3398
    Green: 0.2998, 0.6904
    Blue : 0.1376, 0.0380
    White: 0.2822, 0.2968
  Established Timings I & II: none
  Standard Timings:
    GTF     :  2288x1432   61.000 Hz  16:10   90.463 kHz 282.245 MHz
  Detailed Timing Descriptors:
    DTD 1:  3840x2160   60.000 Hz  16:9   135.000 kHz 594.000 MHz (708
mm x 398 mm)
                 Hfront  176 Hsync  88 Hback 296 Hpol P
                 Vfront    8 Vsync  10 Vback  72 Vpol P
    DTD 2:  1920x1080   60.000 Hz  16:9    67.500 kHz 148.500 MHz (708
mm x 398 mm)
                 Hfront   88 Hsync  44 Hback 148 Hpol P
                 Vfront    4 Vsync   5 Vback  36 Vpol P
    Display Product Name: 'SALORA'
  Display Range Limits:
    Monitor ranges (GTF): 59-70 Hz V, 31-140 kHz H, max dotclock 600 MHz
  Extension blocks: 1
Checksum: 0xaa (should be 0xeb)

Weird that it also says that it's an analog display when it's
connected over HDMI. Something rather bizarre there, and I think it'll
hit problems in drm_edid at [1] as we end up with a connector having
no color_formats defined. I was discussing this with Maxime only last
week, but in relation to VGA monitors connected through HDMI to VGA
adapters without rewriting the EDID.


If you have an issue between 5.16 and 5.17, then I'd guess at [2] and
your monitor not asserting hotplug correctly. The raw hotplug status
is reported in /sys/kernel/debug/dri/N/hdmi0_regs (N will be either 0
or 1 depending on the probe order of the vc4 and v3d drivers). Grep
for HDMI_HOTPLUG.

Incorrect hotplug behaviour causes grief when combined with HDMI2.0
and scrambling. If you don' t know the other end has been
disconnected, then you never know that scrambling needs to be
re-negotiated over SCDC, and the display will typically end up just
being blank.

[1] https://github.com/torvalds/linux/blob/master/drivers/gpu/drm/drm_edid.c#L6460
[2] https://github.com/torvalds/linux/commit/cc5f1cbbc1e12ad5b11d594159fe793eb03c70fa

> I also noticed that earlier in the logs there are more bound lines:
> (some are double)
>
> vc4-drm gpu: bound fe400000.hvs (ops vc4_hvs_ops [vc4])
> vc4-drm gpu: bound fe400000.hvs (ops vc4_hvs_ops [vc4])
>
> and then here for some reason systemd does modprobe@drm.service ? is
> this just a delayed starting log line, or does it actually try to unload
> drm and reload? i doubt it?
> in any case there is more that appears before:
>
> vc4-drm gpu: bound fe400000.hvs (ops vc4_hvs_ops [vc4])
> vc4-drm gpu: bound fe400000.hvs (ops vc4_hvs_ops [vc4])
> vc4-drm gpu: bound fe400000.hvs (ops vc4_hvs_ops [vc4])
> vc4-drm gpu: bound fef00700.hdmi (ops vc4_hdmi_ops [vc4])
> vc4-drm gpu: bound fe400000.hvs (ops vc4_hvs_ops [vc4])
> vc4-drm gpu: bound fef00700.hdmi (ops vc4_hdmi_ops [vc4])
>
>
> so, the error message is weird, as it implies 2 possibilities. however,
> i think it did find a crtc since all those pixelvalve things use crtc
> functions?
>
> So then why do i have this problem on my RPI4? do most people just use
> the raspberry pi kernels?

Largely, yes, people use our vendor kernels.

Stefan Wahren has been co-ordinating Pi4 support in mainline. I
believe [3] is tracking the current state.
Maxime has been working on the vc4 driver, and it should be functional
on most hardware. It looks like yours is not complying with the
standards.

  Dave

[3] https://github.com/lategoodbye/rpi-zero/issues/43

> I looked at what was changed in crtc between 5.16 and 5.17, but not
> much:
>
> 2022-02-17      drm/vc4: crtc: Fix runtime_pm reference counting        Maxime
> Ripard  1       -3/+5
> 2022-02-07      drm/vc4: crtc: Fix redundant variable assignment        Maxime
> Ripard  1       -1/+0
> 2021-11-05      drm/vc4: crtc: Copy assigned channel to the CRTC        Maxime
> Ripard  1       -2/+2
> 2021-11-05      drm/vc4: Fix non-blocking commit getting stuck forever  Maxime
> Ripard  1       -1/+4
> 2021-11-05      drm/vc4: crtc: Drop feed_txp from state Maxime Ripard   1       -2/+1
> 2021-11-04      drm/vc4: Increase the core clock based on HVS load      Maxime
> Ripard  1       -0/+15
> 2021-11-04      drm/vc4: crtc: Add some logging Maxime Ripard   1       -0/+6
> 2021-11-04      drm/vc4: crtc: Rework the encoder retrieval code
> (again) Maxime Ripard   1       -21/+9
> 2021-11-04      drm/vc4: crtc: Add encoder to vc4_crtc_config_pv
> prototype       Maxime Ripard   1       -4/+3
> 2021-11-04      drm/vc4: Make vc4_crtc_get_encoder public       Maxime
> Ripard  1       -4/+4
> 2021-10-25      drm/vc4: crtc: Make sure the HDMI controller is powered when
> disabling       Maxime Ripard   1       -1/+18
>
>
> I looked at them, but in my layman's knowledge, none of those really
> seemed to have any impact?
>
> So, maybe the problem is someplace else?
>
> Can anyone help to find out where this problem might be? even though
> this is old code, i still have this issue at least on 6.1 ?
>
> Regards,
>
> Maarten
