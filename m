Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C1AC16B1581
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 23:46:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92E1610E08D;
	Wed,  8 Mar 2023 22:46:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.rmail.be (mail.rmail.be [85.234.218.189])
 by gabe.freedesktop.org (Postfix) with ESMTP id 44E1010E08D
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Mar 2023 22:46:43 +0000 (UTC)
Received: from mail.rmail.be (domotica.rmail.be [10.238.9.4])
 by mail.rmail.be (Postfix) with ESMTP id 34E0834811;
 Wed,  8 Mar 2023 23:46:42 +0100 (CET)
MIME-Version: 1.0
Date: Wed, 08 Mar 2023 23:46:42 +0100
From: AL13N <alien@rmail.be>
To: Maxime Ripard <maxime@cerno.tech>, dri-devel@lists.freedesktop.org
Subject: Re: [regression] RPI4B drm vc4: no crtc or sizes since 5.17 (works in
 5.16; and still broken in at least 6.1)
In-Reply-To: <004db85e5114674bfc432043376bcd00@rmail.be>
References: <7d216faea9647d328651460167bc27f6@rmail.be>
 <f9499ac65afe3d23079c5bca5e3c40bd@rmail.be>
 <CAPY8ntAGvQdSVt7meb2ddz+UejxpKPvmAcgYUyPWR2+R3e=wRg@mail.gmail.com>
 <20230308123540.zqqe4mnhzumvnjfk@houat>
 <004db85e5114674bfc432043376bcd00@rmail.be>
Message-ID: <4862350fa507612e03bb6a73977db178@rmail.be>
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
Cc: Emma Anholt <emma@anholt.net>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

AL13N schreef op 2023-03-08 22:16:
> Maxime Ripard schreef op 2023-03-08 13:35:
>> Hi,
>> 
>> On Tue, Mar 07, 2023 at 05:10:16PM +0000, Dave Stevenson wrote:
>>> On Tue, 7 Mar 2023 at 16:25, AL13N <alien@rmail.be> wrote:
>>> > AL13N schreef op 2023-03-06 17:34:
>>> > > I have a RPI4B connected on 2nd HDMI port (furthest away from power)
>>> > > to a 4K TV, which works until 5.16, from 5.17 there is no X (or
>>> > > plymouth), the cause of no X is that EDID gives nothing, and in the
>>> > > journal; there is "Cannot find any crct or sizes". Only the kernel is
>>> > > changed for this.
>>> > >
>>> > > In 5.16 instead of this message there is a bunch of hex lines prefixed
>>> > > with BAD.
>>> > >
>>> > > It is still broken in 6.1 at the very least.
>>> > >
>>> > > I donno if this is related to this part, but I wanted to try a newer
>>> > > kernel, because the RPI4 seems to do all the video decoding in
>>> > > software and cannot seem to handle it.
>>> > >
>>> > >
>>> > > logs:
>>> > > vc4-drm gpu: bound fef05700.hdmi (ops vc4_hdmi_ops [vc4])
>>> > > vc4-drm gpu: bound fe004000.txp (ops vc4_txp_ops [vc4])
>>> > > vc4-drm gpu: bound fe206000.pixelvalve (ops vc4_crtc_ops [vc4])
>>> > > vc4-drm gpu: bound fe207000.pixelvalve (ops vc4_crtc_ops [vc4])
>>> > > vc4-drm gpu: bound fe20a000.pixelvalve (ops vc4_crtc_ops [vc4])
>>> > > vc4-drm gpu: bound fe216000.pixelvalve (ops vc4_crtc_ops [vc4])
>>> > > vc4-drm gpu: bound fec12000.pixelvalve (ops vc4_crtc_ops [vc4])
>>> > > checking generic (3ea81000 12c000) vs hw (0 ffffffffffffffff)
>>> > > fb0: switching to vc4 from simple
>>> > > Console: switching to colour dummy device 80x25
>>> > > [drm] Initialized vc4 0.0.0 20140616 for gpu on minor 0
>>> > > vc4-drm gpu: [drm] Cannot find any crtc or sizes
>>> >
>>> > 5.16 log has:
>>> >
>>> > vc4-drm gpu: bound fef05700.hdmi (ops vc4_hdmi_ops [vc4])
>>> > vc4-drm gpu: bound fe004000.txp (ops vc4_txp_ops [vc4])
>>> > vc4-drm gpu: bound fe206000.pixelvalve (ops vc4_crtc_ops [vc4])
>>> > vc4-drm gpu: bound fe207000.pixelvalve (ops vc4_crtc_ops [vc4])
>>> > vc4-drm gpu: bound fe20a000.pixelvalve (ops vc4_crtc_ops [vc4])
>>> > vc4-drm gpu: bound fe216000.pixelvalve (ops vc4_crtc_ops [vc4])
>>> > vc4-drm gpu: bound fec12000.pixelvalve (ops vc4_crtc_ops [vc4])
>>> > [drm] Initialized vc4 0.0.0 20140616 for gpu on minor 0
>>> >         [00] BAD  00 ff ff ff ff ff ff 00 36 74 00 00 00 00 00 00
>>> >         [00] BAD  0b 1f 01 03 00 23 01 78 0a cf 74 a3 57 4c b0 23
>>> >         [00] BAD  09 48 4c 00 00 00 01 01 01 ff 01 ff ff 01 01 01
>>> >         [00] BAD  01 01 01 01 01 20 08 e8 00 30 f2 70 5a 80 b0 58
>>> >         [00] BAD  8a 00 c4 8e 21 00 00 1e 02 3a 80 18 71 38 2d 40
>>> >         [00] BAD  58 2c 45 00 c4 8e 21 00 00 1e 00 00 00 fc 00 53
>>> >         [00] BAD  41 4c 4f 52 41 0a 20 20 20 20 20 20 00 00 00 fd
>>> >         [00] BAD  00 3b 46 1f 8c 3c 00 0a 20 20 20 20 20 20 01 aa
>>> > Console: switching to colour frame buffer device 240x67
>>> > vc4-drm gpu: [drm] fb0: vc4drmfb frame buffer device
>>> >
>>> >
>>> > i donno what this bad is, but it doesn't happen in 5.17... maybe these
>>> > BAD got filtered out, but they did end up working for me? or something?
>>> > i donno...
>>> 
>>> Run it through edid-decode - the checksum is wrong.
>>> 
>>> Block 0, Base EDID:
>>>   EDID Structure Version & Revision: 1.3
>>>   Vendor & Product Identification:
>>>     Manufacturer: MST
>>>     Model: 0
>>>     Made in: week 11 of 2021
>>>   Basic Display Parameters & Features:
>>>     Analog display
>>>     Input voltage level: 0.7/0.3 V
>>>     Blank level equals black level
>>>     Maximum image size: 35 cm x 1 cm
>>>     Gamma: 2.20
>>>     RGB color display
>>>     First detailed timing is the preferred timing
>>>   Color Characteristics:
>>>     Red  : 0.6396, 0.3398
>>>     Green: 0.2998, 0.6904
>>>     Blue : 0.1376, 0.0380
>>>     White: 0.2822, 0.2968
>>>   Established Timings I & II: none
>>>   Standard Timings:
>>>     GTF     :  2288x1432   61.000 Hz  16:10   90.463 kHz 282.245 MHz
>>>   Detailed Timing Descriptors:
>>>     DTD 1:  3840x2160   60.000 Hz  16:9   135.000 kHz 594.000 MHz 
>>> (708
>>> mm x 398 mm)
>>>                  Hfront  176 Hsync  88 Hback 296 Hpol P
>>>                  Vfront    8 Vsync  10 Vback  72 Vpol P
>>>     DTD 2:  1920x1080   60.000 Hz  16:9    67.500 kHz 148.500 MHz 
>>> (708
>>> mm x 398 mm)
>>>                  Hfront   88 Hsync  44 Hback 148 Hpol P
>>>                  Vfront    4 Vsync   5 Vback  36 Vpol P
>>>     Display Product Name: 'SALORA'
>>>   Display Range Limits:
>>>     Monitor ranges (GTF): 59-70 Hz V, 31-140 kHz H, max dotclock 600 
>>> MHz
>>>   Extension blocks: 1
>>> Checksum: 0xaa (should be 0xeb)
>>> 
>>> Weird that it also says that it's an analog display when it's
>>> connected over HDMI. Something rather bizarre there, and I think 
>>> it'll
>>> hit problems in drm_edid at [1] as we end up with a connector having
>>> no color_formats defined. I was discussing this with Maxime only last
>>> week, but in relation to VGA monitors connected through HDMI to VGA
>>> adapters without rewriting the EDID.
>>> 
>>> If you have an issue between 5.16 and 5.17, then I'd guess at [2] and
>>> your monitor not asserting hotplug correctly. The raw hotplug status
>>> is reported in /sys/kernel/debug/dri/N/hdmi0_regs (N will be either 0
>>> or 1 depending on the probe order of the vc4 and v3d drivers). Grep
>>> for HDMI_HOTPLUG.
>> 
>> If it's an option, bisecting between 5.16 and 5.17 which commit
>> introduced the regression would be nice.
>> 
>>> Incorrect hotplug behaviour causes grief when combined with HDMI2.0
>>> and scrambling. If you don' t know the other end has been
>>> disconnected, then you never know that scrambling needs to be
>>> re-negotiated over SCDC, and the display will typically end up just
>>> being blank.
>>> 
>>> [1] 
>>> https://github.com/torvalds/linux/blob/master/drivers/gpu/drm/drm_edid.c#L6460
>>> [2] 
>>> https://github.com/torvalds/linux/commit/cc5f1cbbc1e12ad5b11d594159fe793eb03c70fa
>> 
>> We can easily test that: could you try booting with video=HDMI-A-1:D 
>> (or
>> HDMI-A-2, depending on whether you use HDMI0 or HDMI1) and see if it
>> helps?
> 
> in kernel 6.1 or kernel 5.17 ?

in 6.1 at least i booted with video=HDMI-A-2:D (i'm plugged into the 
hdmi farthest from the power)

and I did see BAD stuff here too:


[drm] Initialized v3d 1.0.0 20180419 for fec00000.v3d on minor 0
vc4-drm gpu: bound fe400000.hvs (ops vc4_hvs_ops [vc4])
Registered IR keymap rc-cec
rc rc0: vc4 as /devices/platform/soc/fef00700.hdmi/rc/rc0
input: vc4 as /devices/platform/soc/fef00700.hdmi/rc/rc0/input0
vc4-drm gpu: bound fef00700.hdmi (ops vc4_hdmi_ops [vc4])
[drm] forcing HDMI-A-2 connector on
Registered IR keymap rc-cec
rc rc1: vc4 as /devices/platform/soc/fef05700.hdmi/rc/rc1
input: vc4 as /devices/platform/soc/fef05700.hdmi/rc/rc1/input1
vc4-drm gpu: bound fef05700.hdmi (ops vc4_hdmi_ops [vc4])
vc4-drm gpu: bound fe004000.txp (ops vc4_txp_ops [vc4])
vc4-drm gpu: bound fe206000.pixelvalve (ops vc4_crtc_ops [vc4])
vc4-drm gpu: bound fe207000.pixelvalve (ops vc4_crtc_ops [vc4])
vc4-drm gpu: bound fe20a000.pixelvalve (ops vc4_crtc_ops [vc4])
vc4-drm gpu: bound fe216000.pixelvalve (ops vc4_crtc_ops [vc4])
vc4-drm gpu: bound fec12000.pixelvalve (ops vc4_crtc_ops [vc4])
[drm] Initialized vc4 0.0.0 20140616 for gpu on minor 1
EDID block 0 (tag 0x00) checksum is invalid, remainder is 235
        [00] BAD  00 ff ff ff ff ff ff 00 36 74 00 00 00 00 00 00
        [00] BAD  0b 1f 01 03 00 23 01 78 0a cf 74 a3 57 4c b0 23
        [00] BAD  09 48 4c 00 00 00 01 01 01 ff 01 ff ff 01 01 01
        [00] BAD  01 01 01 01 01 20 08 e8 00 30 f2 70 5a 80 b0 58
        [00] BAD  8a 00 c4 8e 21 00 00 1e 02 3a 80 18 71 38 2d 40
        [00] BAD  58 2c 45 00 c4 8e 21 00 00 1e 00 00 00 fc 00 53
        [00] BAD  41 4c 4f 52 41 0a 20 20 20 20 20 20 00 00 00 fd
        [00] BAD  00 3b 46 1f 8c 3c 00 0a 20 20 20 20 20 20 01 aa
vc4-drm gpu: [drm] Cannot find any crtc or sizes
EDID block 0 (tag 0x00) checksum is invalid, remainder is 125
vc4-drm gpu: [drm] Cannot find any crtc or sizes


a bit puzzling why it does EDID block twice and it's twice checksum 
invalid?
I also see forcing connector on.

earlier, i did try to make an edid file from a modeline that worked on 
5.16 and pass it using drm_kms_helper.edid_firmware= ; but that didn't 
work, there only was some kind of warning that i should use something 
else...

reading through all your messages, does this mean, that i should be able 
to boot if we were to "fix" this edid file? and pass it? or is this 
something that needs change in kernel?

> 
>>> > I also noticed that earlier in the logs there are more bound lines:
>>> > (some are double)
>>> >
>>> > vc4-drm gpu: bound fe400000.hvs (ops vc4_hvs_ops [vc4])
>>> > vc4-drm gpu: bound fe400000.hvs (ops vc4_hvs_ops [vc4])
>>> >
>>> > and then here for some reason systemd does modprobe@drm.service ? is
>>> > this just a delayed starting log line, or does it actually try to unload
>>> > drm and reload? i doubt it?
>>> > in any case there is more that appears before:
>>> >
>>> > vc4-drm gpu: bound fe400000.hvs (ops vc4_hvs_ops [vc4])
>>> > vc4-drm gpu: bound fe400000.hvs (ops vc4_hvs_ops [vc4])
>>> > vc4-drm gpu: bound fe400000.hvs (ops vc4_hvs_ops [vc4])
>>> > vc4-drm gpu: bound fef00700.hdmi (ops vc4_hdmi_ops [vc4])
>>> > vc4-drm gpu: bound fe400000.hvs (ops vc4_hvs_ops [vc4])
>>> > vc4-drm gpu: bound fef00700.hdmi (ops vc4_hdmi_ops [vc4])
>>> >
>>> >
>>> > so, the error message is weird, as it implies 2 possibilities. however,
>>> > i think it did find a crtc since all those pixelvalve things use crtc
>>> > functions?
>>> >
>>> > So then why do i have this problem on my RPI4? do most people just use
>>> > the raspberry pi kernels?
>>> 
>>> Largely, yes, people use our vendor kernels.
>> 
>> tbf, the downstream kernel has pretty much the same code here, so the
>> issue is very likely to affect it too.
>> 
>> I would just assume that your TV has some unusual behaviour that 
>> throws
>> the driver off, and most people won't.
> 
> IC, the TV also has an option somewhere to choose EDID 2.0, i thought
> i chose that but if that decode says 1.3, maybe i didn't... Is it
> worth it to retry this?

actually, the TV was set to EDID 2.0 the other option was 1.4 (?)
