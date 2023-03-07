Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB776AE665
	for <lists+dri-devel@lfdr.de>; Tue,  7 Mar 2023 17:25:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBAD710E626;
	Tue,  7 Mar 2023 16:25:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.rmail.be (mail.rmail.be [85.234.218.189])
 by gabe.freedesktop.org (Postfix) with ESMTP id 73BB210E626
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Mar 2023 16:25:10 +0000 (UTC)
Received: from mail.rmail.be (domotica.rmail.be [10.238.9.4])
 by mail.rmail.be (Postfix) with ESMTP id 7649C346A1;
 Tue,  7 Mar 2023 17:25:09 +0100 (CET)
MIME-Version: 1.0
Date: Tue, 07 Mar 2023 17:25:09 +0100
From: AL13N <alien@rmail.be>
To: Emma Anholt <emma@anholt.net>, Maxime Ripard <mripard@kernel.org>,
 dri-devel@lists.freedesktop.org
Subject: Re: [regression] RPI4B drm vc4: no crtc or sizes since 5.17 (works in
 5.16; and still broken in at least 6.1)
In-Reply-To: <7d216faea9647d328651460167bc27f6@rmail.be>
References: <7d216faea9647d328651460167bc27f6@rmail.be>
Message-ID: <f9499ac65afe3d23079c5bca5e3c40bd@rmail.be>
X-Sender: alien@rmail.be
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

AL13N schreef op 2023-03-06 17:34:
> Hi,
> 
> I have a RPI4B connected on 2nd HDMI port (furthest away from power)
> to a 4K TV, which works until 5.16, from 5.17 there is no X (or
> plymouth), the cause of no X is that EDID gives nothing, and in the
> journal; there is "Cannot find any crct or sizes". Only the kernel is
> changed for this.
> 
> In 5.16 instead of this message there is a bunch of hex lines prefixed 
> with BAD.
> 
> It is still broken in 6.1 at the very least.
> 
> I donno if this is related to this part, but I wanted to try a newer
> kernel, because the RPI4 seems to do all the video decoding in
> software and cannot seem to handle it.
> 
> 
> logs:
> vc4-drm gpu: bound fef05700.hdmi (ops vc4_hdmi_ops [vc4])
> vc4-drm gpu: bound fe004000.txp (ops vc4_txp_ops [vc4])
> vc4-drm gpu: bound fe206000.pixelvalve (ops vc4_crtc_ops [vc4])
> vc4-drm gpu: bound fe207000.pixelvalve (ops vc4_crtc_ops [vc4])
> vc4-drm gpu: bound fe20a000.pixelvalve (ops vc4_crtc_ops [vc4])
> vc4-drm gpu: bound fe216000.pixelvalve (ops vc4_crtc_ops [vc4])
> vc4-drm gpu: bound fec12000.pixelvalve (ops vc4_crtc_ops [vc4])
> checking generic (3ea81000 12c000) vs hw (0 ffffffffffffffff)
> fb0: switching to vc4 from simple
> Console: switching to colour dummy device 80x25
> [drm] Initialized vc4 0.0.0 20140616 for gpu on minor 0
> vc4-drm gpu: [drm] Cannot find any crtc or sizes

5.16 log has:

vc4-drm gpu: bound fef05700.hdmi (ops vc4_hdmi_ops [vc4])
vc4-drm gpu: bound fe004000.txp (ops vc4_txp_ops [vc4])
vc4-drm gpu: bound fe206000.pixelvalve (ops vc4_crtc_ops [vc4])
vc4-drm gpu: bound fe207000.pixelvalve (ops vc4_crtc_ops [vc4])
vc4-drm gpu: bound fe20a000.pixelvalve (ops vc4_crtc_ops [vc4])
vc4-drm gpu: bound fe216000.pixelvalve (ops vc4_crtc_ops [vc4])
vc4-drm gpu: bound fec12000.pixelvalve (ops vc4_crtc_ops [vc4])
[drm] Initialized vc4 0.0.0 20140616 for gpu on minor 0
        [00] BAD  00 ff ff ff ff ff ff 00 36 74 00 00 00 00 00 00
        [00] BAD  0b 1f 01 03 00 23 01 78 0a cf 74 a3 57 4c b0 23
        [00] BAD  09 48 4c 00 00 00 01 01 01 ff 01 ff ff 01 01 01
        [00] BAD  01 01 01 01 01 20 08 e8 00 30 f2 70 5a 80 b0 58
        [00] BAD  8a 00 c4 8e 21 00 00 1e 02 3a 80 18 71 38 2d 40
        [00] BAD  58 2c 45 00 c4 8e 21 00 00 1e 00 00 00 fc 00 53
        [00] BAD  41 4c 4f 52 41 0a 20 20 20 20 20 20 00 00 00 fd
        [00] BAD  00 3b 46 1f 8c 3c 00 0a 20 20 20 20 20 20 01 aa
Console: switching to colour frame buffer device 240x67
vc4-drm gpu: [drm] fb0: vc4drmfb frame buffer device


i donno what this bad is, but it doesn't happen in 5.17... maybe these 
BAD got filtered out, but they did end up working for me? or something? 
i donno...


I also noticed that earlier in the logs there are more bound lines: 
(some are double)

vc4-drm gpu: bound fe400000.hvs (ops vc4_hvs_ops [vc4])
vc4-drm gpu: bound fe400000.hvs (ops vc4_hvs_ops [vc4])

and then here for some reason systemd does modprobe@drm.service ? is 
this just a delayed starting log line, or does it actually try to unload 
drm and reload? i doubt it?
in any case there is more that appears before:

vc4-drm gpu: bound fe400000.hvs (ops vc4_hvs_ops [vc4])
vc4-drm gpu: bound fe400000.hvs (ops vc4_hvs_ops [vc4])
vc4-drm gpu: bound fe400000.hvs (ops vc4_hvs_ops [vc4])
vc4-drm gpu: bound fef00700.hdmi (ops vc4_hdmi_ops [vc4])
vc4-drm gpu: bound fe400000.hvs (ops vc4_hvs_ops [vc4])
vc4-drm gpu: bound fef00700.hdmi (ops vc4_hdmi_ops [vc4])


so, the error message is weird, as it implies 2 possibilities. however, 
i think it did find a crtc since all those pixelvalve things use crtc 
functions?

So then why do i have this problem on my RPI4? do most people just use 
the raspberry pi kernels?

I looked at what was changed in crtc between 5.16 and 5.17, but not 
much:

2022-02-17	drm/vc4: crtc: Fix runtime_pm reference counting	Maxime 
Ripard	1	-3/+5
2022-02-07	drm/vc4: crtc: Fix redundant variable assignment	Maxime 
Ripard	1	-1/+0
2021-11-05	drm/vc4: crtc: Copy assigned channel to the CRTC	Maxime 
Ripard	1	-2/+2
2021-11-05	drm/vc4: Fix non-blocking commit getting stuck forever	Maxime 
Ripard	1	-1/+4
2021-11-05	drm/vc4: crtc: Drop feed_txp from state	Maxime Ripard	1	-2/+1
2021-11-04	drm/vc4: Increase the core clock based on HVS load	Maxime 
Ripard	1	-0/+15
2021-11-04	drm/vc4: crtc: Add some logging	Maxime Ripard	1	-0/+6
2021-11-04	drm/vc4: crtc: Rework the encoder retrieval code 
(again)	Maxime Ripard	1	-21/+9
2021-11-04	drm/vc4: crtc: Add encoder to vc4_crtc_config_pv 
prototype	Maxime Ripard	1	-4/+3
2021-11-04	drm/vc4: Make vc4_crtc_get_encoder public	Maxime 
Ripard	1	-4/+4
2021-10-25	drm/vc4: crtc: Make sure the HDMI controller is powered when 
disabling	Maxime Ripard	1	-1/+18


I looked at them, but in my layman's knowledge, none of those really 
seemed to have any impact?

So, maybe the problem is someplace else?

Can anyone help to find out where this problem might be? even though 
this is old code, i still have this issue at least on 6.1 ?

Regards,

Maarten
