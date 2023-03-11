Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99FED6B5A82
	for <lists+dri-devel@lfdr.de>; Sat, 11 Mar 2023 11:32:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFFC510E08B;
	Sat, 11 Mar 2023 10:32:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.rmail.be (mail.rmail.be [85.234.218.189])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0A34A10E08B
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Mar 2023 10:32:02 +0000 (UTC)
Received: from mail.rmail.be (domotica.rmail.be [10.238.9.4])
 by mail.rmail.be (Postfix) with ESMTP id 2F226349E0;
 Sat, 11 Mar 2023 11:32:01 +0100 (CET)
MIME-Version: 1.0
Date: Sat, 11 Mar 2023 11:32:01 +0100
From: AL13N <alien@rmail.be>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org
Subject: Re: [regression] RPI4B drm vc4: no crtc or sizes since 5.17 (works in
 5.16; and still broken in at least 6.1)
In-Reply-To: <2835cfc754ebc29561bcb053cadcd528@rmail.be>
References: <7d216faea9647d328651460167bc27f6@rmail.be>
 <f9499ac65afe3d23079c5bca5e3c40bd@rmail.be>
 <CAPY8ntAGvQdSVt7meb2ddz+UejxpKPvmAcgYUyPWR2+R3e=wRg@mail.gmail.com>
 <20230308123540.zqqe4mnhzumvnjfk@houat>
 <004db85e5114674bfc432043376bcd00@rmail.be>
 <4862350fa507612e03bb6a73977db178@rmail.be>
 <CAPY8ntB6WaCF4H2Bk7Zq9cCE-iR8fMFq-vDULH_rp_+O4xp+EA@mail.gmail.com>
 <2835cfc754ebc29561bcb053cadcd528@rmail.be>
Message-ID: <ee435a6edcb7f09af4fb9f1cff8f3113@rmail.be>
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
Cc: Maxime Ripard <maxime@cerno.tech>, Emma Anholt <emma@anholt.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

AL13N schreef op 2023-03-10 13:38:
> Dave Stevenson schreef op 2023-03-09 13:59:
>> On Wed, 8 Mar 2023 at 22:46, AL13N <alien@rmail.be> wrote:
>>> 
>>> AL13N schreef op 2023-03-08 22:16:
>>> > Maxime Ripard schreef op 2023-03-08 13:35:
>>> >> Hi,
>>> >>
>>> >> On Tue, Mar 07, 2023 at 05:10:16PM +0000, Dave Stevenson wrote:
>>> >>> On Tue, 7 Mar 2023 at 16:25, AL13N <alien@rmail.be> wrote:
>>> >>> > AL13N schreef op 2023-03-06 17:34:
>>> >>> > > I have a RPI4B connected on 2nd HDMI port (furthest away from power)
>>> >>> > > to a 4K TV, which works until 5.16, from 5.17 there is no X (or
>>> >>> > > plymouth), the cause of no X is that EDID gives nothing, and in the
>>> >>> > > journal; there is "Cannot find any crct or sizes". Only the kernel is
>>> >>> > > changed for this.
>>> >>> > >
>>> >>> > > In 5.16 instead of this message there is a bunch of hex lines prefixed
>>> >>> > > with BAD.
>>> >>> > >
>>> >>> > > It is still broken in 6.1 at the very least.
>>> >>> > >
>>> >>> > > I donno if this is related to this part, but I wanted to try a newer
>>> >>> > > kernel, because the RPI4 seems to do all the video decoding in
>>> >>> > > software and cannot seem to handle it.
>>> >>> > >
>>> >>> > >
>>> >>> > > logs:
>>> >>> > > vc4-drm gpu: bound fef05700.hdmi (ops vc4_hdmi_ops [vc4])
>>> >>> > > vc4-drm gpu: bound fe004000.txp (ops vc4_txp_ops [vc4])
>>> >>> > > vc4-drm gpu: bound fe206000.pixelvalve (ops vc4_crtc_ops [vc4])
>>> >>> > > vc4-drm gpu: bound fe207000.pixelvalve (ops vc4_crtc_ops [vc4])
>>> >>> > > vc4-drm gpu: bound fe20a000.pixelvalve (ops vc4_crtc_ops [vc4])
>>> >>> > > vc4-drm gpu: bound fe216000.pixelvalve (ops vc4_crtc_ops [vc4])
>>> >>> > > vc4-drm gpu: bound fec12000.pixelvalve (ops vc4_crtc_ops [vc4])
>>> >>> > > checking generic (3ea81000 12c000) vs hw (0 ffffffffffffffff)
>>> >>> > > fb0: switching to vc4 from simple
>>> >>> > > Console: switching to colour dummy device 80x25
>>> >>> > > [drm] Initialized vc4 0.0.0 20140616 for gpu on minor 0
>>> >>> > > vc4-drm gpu: [drm] Cannot find any crtc or sizes
>>> >>> >
>>> >>> > 5.16 log has:
>>> >>> >
>>> >>> > vc4-drm gpu: bound fef05700.hdmi (ops vc4_hdmi_ops [vc4])
>>> >>> > vc4-drm gpu: bound fe004000.txp (ops vc4_txp_ops [vc4])
>>> >>> > vc4-drm gpu: bound fe206000.pixelvalve (ops vc4_crtc_ops [vc4])
>>> >>> > vc4-drm gpu: bound fe207000.pixelvalve (ops vc4_crtc_ops [vc4])
>>> >>> > vc4-drm gpu: bound fe20a000.pixelvalve (ops vc4_crtc_ops [vc4])
>>> >>> > vc4-drm gpu: bound fe216000.pixelvalve (ops vc4_crtc_ops [vc4])
>>> >>> > vc4-drm gpu: bound fec12000.pixelvalve (ops vc4_crtc_ops [vc4])
>>> >>> > [drm] Initialized vc4 0.0.0 20140616 for gpu on minor 0
>>> >>> >         [00] BAD  00 ff ff ff ff ff ff 00 36 74 00 00 00 00 00 00
>>> >>> >         [00] BAD  0b 1f 01 03 00 23 01 78 0a cf 74 a3 57 4c b0 23
>>> >>> >         [00] BAD  09 48 4c 00 00 00 01 01 01 ff 01 ff ff 01 01 01
>>> >>> >         [00] BAD  01 01 01 01 01 20 08 e8 00 30 f2 70 5a 80 b0 58
>>> >>> >         [00] BAD  8a 00 c4 8e 21 00 00 1e 02 3a 80 18 71 38 2d 40
>>> >>> >         [00] BAD  58 2c 45 00 c4 8e 21 00 00 1e 00 00 00 fc 00 53
>>> >>> >         [00] BAD  41 4c 4f 52 41 0a 20 20 20 20 20 20 00 00 00 fd
>>> >>> >         [00] BAD  00 3b 46 1f 8c 3c 00 0a 20 20 20 20 20 20 01 aa
>>> >>> > Console: switching to colour frame buffer device 240x67
>>> >>> > vc4-drm gpu: [drm] fb0: vc4drmfb frame buffer device
>>> >>> >
>>> >>> >
>>> >>> > i donno what this bad is, but it doesn't happen in 5.17... maybe these
>>> >>> > BAD got filtered out, but they did end up working for me? or something?
>>> >>> > i donno...
>>> >>>
>>> >>> Run it through edid-decode - the checksum is wrong.
>>> >>>
>>> >>> Block 0, Base EDID:
>>> >>>   EDID Structure Version & Revision: 1.3
>>> >>>   Vendor & Product Identification:
>>> >>>     Manufacturer: MST
>>> >>>     Model: 0
>>> >>>     Made in: week 11 of 2021
>>> >>>   Basic Display Parameters & Features:
>>> >>>     Analog display
>>> >>>     Input voltage level: 0.7/0.3 V
>>> >>>     Blank level equals black level
>>> >>>     Maximum image size: 35 cm x 1 cm
>>> >>>     Gamma: 2.20
>>> >>>     RGB color display
>>> >>>     First detailed timing is the preferred timing
>>> >>>   Color Characteristics:
>>> >>>     Red  : 0.6396, 0.3398
>>> >>>     Green: 0.2998, 0.6904
>>> >>>     Blue : 0.1376, 0.0380
>>> >>>     White: 0.2822, 0.2968
>>> >>>   Established Timings I & II: none
>>> >>>   Standard Timings:
>>> >>>     GTF     :  2288x1432   61.000 Hz  16:10   90.463 kHz 282.245 MHz
>>> >>>   Detailed Timing Descriptors:
>>> >>>     DTD 1:  3840x2160   60.000 Hz  16:9   135.000 kHz 594.000 MHz
>>> >>> (708
>>> >>> mm x 398 mm)
>>> >>>                  Hfront  176 Hsync  88 Hback 296 Hpol P
>>> >>>                  Vfront    8 Vsync  10 Vback  72 Vpol P
>>> >>>     DTD 2:  1920x1080   60.000 Hz  16:9    67.500 kHz 148.500 MHz
>>> >>> (708
>>> >>> mm x 398 mm)
>>> >>>                  Hfront   88 Hsync  44 Hback 148 Hpol P
>>> >>>                  Vfront    4 Vsync   5 Vback  36 Vpol P
>>> >>>     Display Product Name: 'SALORA'
>>> >>>   Display Range Limits:
>>> >>>     Monitor ranges (GTF): 59-70 Hz V, 31-140 kHz H, max dotclock 600
>>> >>> MHz
>>> >>>   Extension blocks: 1
>>> >>> Checksum: 0xaa (should be 0xeb)
>>> >>>
>>> >>> Weird that it also says that it's an analog display when it's
>>> >>> connected over HDMI. Something rather bizarre there, and I think
>>> >>> it'll
>>> >>> hit problems in drm_edid at [1] as we end up with a connector having
>>> >>> no color_formats defined. I was discussing this with Maxime only last
>>> >>> week, but in relation to VGA monitors connected through HDMI to VGA
>>> >>> adapters without rewriting the EDID.
>>> >>>
>>> >>> If you have an issue between 5.16 and 5.17, then I'd guess at [2] and
>>> >>> your monitor not asserting hotplug correctly. The raw hotplug status
>>> >>> is reported in /sys/kernel/debug/dri/N/hdmi0_regs (N will be either 0
>>> >>> or 1 depending on the probe order of the vc4 and v3d drivers). Grep
>>> >>> for HDMI_HOTPLUG.
>>> >>
>>> >> If it's an option, bisecting between 5.16 and 5.17 which commit
>>> >> introduced the regression would be nice.
>>> >>
>>> >>> Incorrect hotplug behaviour causes grief when combined with HDMI2.0
>>> >>> and scrambling. If you don' t know the other end has been
>>> >>> disconnected, then you never know that scrambling needs to be
>>> >>> re-negotiated over SCDC, and the display will typically end up just
>>> >>> being blank.
>>> >>>
>>> >>> [1]
>>> >>> https://github.com/torvalds/linux/blob/master/drivers/gpu/drm/drm_edid.c#L6460
>>> >>> [2]
>>> >>> https://github.com/torvalds/linux/commit/cc5f1cbbc1e12ad5b11d594159fe793eb03c70fa
>>> >>
>>> >> We can easily test that: could you try booting with video=HDMI-A-1:D
>>> >> (or
>>> >> HDMI-A-2, depending on whether you use HDMI0 or HDMI1) and see if it
>>> >> helps?
>>> >
>>> > in kernel 6.1 or kernel 5.17 ?
>>> 
>>> in 6.1 at least i booted with video=HDMI-A-2:D (i'm plugged into the
>>> hdmi farthest from the power)
>>> 
>>> and I did see BAD stuff here too:
>>> 
>>> 
>>> [drm] Initialized v3d 1.0.0 20180419 for fec00000.v3d on minor 0
>>> vc4-drm gpu: bound fe400000.hvs (ops vc4_hvs_ops [vc4])
>>> Registered IR keymap rc-cec
>>> rc rc0: vc4 as /devices/platform/soc/fef00700.hdmi/rc/rc0
>>> input: vc4 as /devices/platform/soc/fef00700.hdmi/rc/rc0/input0
>>> vc4-drm gpu: bound fef00700.hdmi (ops vc4_hdmi_ops [vc4])
>>> [drm] forcing HDMI-A-2 connector on
>>> Registered IR keymap rc-cec
>>> rc rc1: vc4 as /devices/platform/soc/fef05700.hdmi/rc/rc1
>>> input: vc4 as /devices/platform/soc/fef05700.hdmi/rc/rc1/input1
>>> vc4-drm gpu: bound fef05700.hdmi (ops vc4_hdmi_ops [vc4])
>>> vc4-drm gpu: bound fe004000.txp (ops vc4_txp_ops [vc4])
>>> vc4-drm gpu: bound fe206000.pixelvalve (ops vc4_crtc_ops [vc4])
>>> vc4-drm gpu: bound fe207000.pixelvalve (ops vc4_crtc_ops [vc4])
>>> vc4-drm gpu: bound fe20a000.pixelvalve (ops vc4_crtc_ops [vc4])
>>> vc4-drm gpu: bound fe216000.pixelvalve (ops vc4_crtc_ops [vc4])
>>> vc4-drm gpu: bound fec12000.pixelvalve (ops vc4_crtc_ops [vc4])
>>> [drm] Initialized vc4 0.0.0 20140616 for gpu on minor 1
>>> EDID block 0 (tag 0x00) checksum is invalid, remainder is 235
>>>         [00] BAD  00 ff ff ff ff ff ff 00 36 74 00 00 00 00 00 00
>>>         [00] BAD  0b 1f 01 03 00 23 01 78 0a cf 74 a3 57 4c b0 23
>>>         [00] BAD  09 48 4c 00 00 00 01 01 01 ff 01 ff ff 01 01 01
>>>         [00] BAD  01 01 01 01 01 20 08 e8 00 30 f2 70 5a 80 b0 58
>>>         [00] BAD  8a 00 c4 8e 21 00 00 1e 02 3a 80 18 71 38 2d 40
>>>         [00] BAD  58 2c 45 00 c4 8e 21 00 00 1e 00 00 00 fc 00 53
>>>         [00] BAD  41 4c 4f 52 41 0a 20 20 20 20 20 20 00 00 00 fd
>>>         [00] BAD  00 3b 46 1f 8c 3c 00 0a 20 20 20 20 20 20 01 aa
>>> vc4-drm gpu: [drm] Cannot find any crtc or sizes
>>> EDID block 0 (tag 0x00) checksum is invalid, remainder is 125
>>> vc4-drm gpu: [drm] Cannot find any crtc or sizes
>>> 
>>> 
>>> a bit puzzling why it does EDID block twice and it's twice checksum
>>> invalid?
>>> I also see forcing connector on.
>>> 
>>> earlier, i did try to make an edid file from a modeline that worked 
>>> on
>>> 5.16 and pass it using drm_kms_helper.edid_firmware= ; but that 
>>> didn't
>>> work, there only was some kind of warning that i should use something
>>> else...
>> 
>> It always helps to actually quote warnings or errors.
>> Almost certainly "drm_kms_helper.edid_firmware is deprecated, please
>> use drm.edid_firmware instead.", in which case do as it tells you and
>> use "drm.edid_firmware=<filename>".
>> 
>>> reading through all your messages, does this mean, that i should be 
>>> able
>>> to boot if we were to "fix" this edid file? and pass it? or is this
>>> something that needs change in kernel?
>> 
>> At present you have 2 issues
>> - the monitor or cable doesn't handle the hotplug line correctly
>> - the monitor doesn't provide a valid EDID.
>> 
>> The first you can workaround with "video=HDMI-A-2:D".
> 
> ok i retried 6.1 (with edid) and without hdmi_hotplug_force=1 and no
> rainbow, so i guess that is the reason why this video= parameter is
> needed, after all
> 
>> The second you can work around by capturing the EDID, fixing it, and
>> then using "drm.edid_firmware=<filename>".
>> The first fix is to just fixup the checksum (edid-decode even tells
>> you the correct value as 0xEB). That doesn't solve the fact that the
>> EDID contains other rubbish like being an analog display which may
>> cause further issues. The simplest fix for reporting as an analog
>> display is to change byte 20 from 0x00 to 0x80, and then correct the
>> checksum again.
>> 
>> The EDID advertises 4k60, 1080p60, and GTF 2288x1432 @ 61Hz.
>> In order to support 4k60 it needs to support HDMI2.0 and enabling
>> scrambling via SCDC. That should also be signalled in the EDID Sink
>> Capability Data Structure block but isn't, so 4k60 support may be
>> compromised.
>> 
>> Sorry, all of this comes back to the monitor vendor shipping rubbish.
>> None of this is the fault of the vc4 driver, and it only worked under
>> 5.16 by chance.
> 
> Ok, so i changed the EDID based on what you said, but me knowing 
> nothing:
> (since i didn't have the extension data, i removed the extension)...
> 
> 00 ff ff ff ff ff ff 00 36 74 00 00 00 00 00 00
> 0b 1f 01 03 80 23 01 78 0a cf 74 a3 57 4c b0 23
> 09 48 4c 00 00 00 01 01 01 01 01 01 01 01 01 01
> 01 01 01 01 01 01 08 e8 00 30 f2 70 5a 80 b0 58
> 8a 00 c4 8e 21 00 00 1e 02 3a 80 18 71 38 2d 40
> 58 2c 45 00 c4 8e 21 00 00 1e 00 00 00 fc 00 53
> 41 4c 4f 52 41 0a 20 20 20 20 20 20 00 00 00 fd
> 00 3b 46 1f 8c 3c 00 0a 20 20 20 20 20 20 00 85
> 
> i did this with:
> hdmi_enable_4kp60=1
> disable_fw_kms_setup=1
> hdmi_force_hotplug=1
> disable_overscan=1
> display_auto_detect=1
> arm_boost=1
> otg_mode=1
> max_framebuffers=2
> arm_64bit=1
> 
> commandline args:
> Kernel command line: coherent_pool=1M 8250.nr_uarts=0
> snd_bcm2835.enable_compat_alsa=0 snd_bcm2835.enable_hdmi=1
> smsc95xx.macaddr=01:23:34:56:78:9A vc_mem.mem_base=0x3ec00000
> vc_mem.mem_size=0x40000000  console=ttyS0,115200 console=tty1 rw
> ip=eth0:dhcp nameserver=10.A.B.1
> root=10.A.B.12:/data/nfs/aarch64/rpi4-mediabox-latest:nfsvers=3
> drm.edid_firmware=edid/salora-edid-fix.bin video=HDMI-A-1:D
> radeon.runpm=0 splash=silent quiet rootwait
> plymouth.ignore-serial-consoles
> Unknown kernel command line parameters "nameserver=10.A.B.1
> splash=silent", will be passed to user space.
> 
> and I have 1080p@60Hz, this is the drm output:
> 
> [drm] Initialized v3d 1.0.0 20180419 for fec00000.v3d on minor 0
> vc4-drm gpu: bound fe400000.hvs (ops vc4_hvs_ops [vc4])
> [drm] forcing HDMI-A-1 connector on
> Registered IR keymap rc-cec
> rc rc0: vc4 as /devices/platform/soc/fef00700.hdmi/rc/rc0
> input: vc4 as /devices/platform/soc/fef00700.hdmi/rc/rc0/input0
> vc4-drm gpu: bound fef00700.hdmi (ops vc4_hdmi_ops [vc4])
> Registered IR keymap rc-cec
> rc rc1: vc4 as /devices/platform/soc/fef05700.hdmi/rc/rc1
> input: vc4 as /devices/platform/soc/fef05700.hdmi/rc/rc1/input1
> vc4-drm gpu: bound fef05700.hdmi (ops vc4_hdmi_ops [vc4])
> vc4-drm gpu: bound fe004000.txp (ops vc4_txp_ops [vc4])
> vc4-drm gpu: bound fe206000.pixelvalve (ops vc4_crtc_ops [vc4])
> vc4-drm gpu: bound fe207000.pixelvalve (ops vc4_crtc_ops [vc4])
> vc4-drm gpu: bound fe20a000.pixelvalve (ops vc4_crtc_ops [vc4])
> vc4-drm gpu: bound fe216000.pixelvalve (ops vc4_crtc_ops [vc4])
> vc4-drm gpu: bound fec12000.pixelvalve (ops vc4_crtc_ops [vc4])
> [drm] Initialized vc4 0.0.0 20140616 for gpu on minor 1
> [drm] Got external EDID base block and 0 extensions from
> "edid/salora-edid-fix.bin" for connector "HDMI-A-1"
> vc4-drm gpu: [drm] The core clock cannot reach frequencies high enough
> to support 4k @ 60Hz.
> vc4-drm gpu: [drm] Please change your config.txt file to add 
> hdmi_enable_4kp60.
> Console: switching to colour frame buffer device 240x67
> vc4-drm gpu: [drm] fb0: vc4drmfb frame buffer device
> [drm] Got external EDID base block and 0 extensions from
> "edid/salora-edid-fix.bin" for connector "HDMI-A-1"
> [drm] Got external EDID base block and 0 extensions from
> "edid/salora-edid-fix.bin" for connector "HDMI-A-1"
> [drm] Got external EDID base block and 0 extensions from
> "edid/salora-edid-fix.bin" for connector "HDMI-A-1"
> [drm] Got external EDID base block and 0 extensions from
> "edid/salora-edid-fix.bin" for connector "HDMI-A-1"
> 
> weird that it asks to add the 4kp60, while i had added that? and the
> edid also contains that?

Do you have any idea on how to get the 4k@60Hz to work on this new EDID 
above, if 2.0 is required, Do I need to have this extension block, I 
tried looking for the EDID2.0 structure, but i only found references 
saying it's obsoleted? this is the X log part:

[    29.802] (II) modeset(0): EDID for output HDMI-1
[    29.803] (II) modeset(0): Manufacturer: MST  Model: 0  Serial#: 0
[    29.803] (II) modeset(0): Year: 2021  Week: 11
[    29.803] (II) modeset(0): EDID Version: 1.3
[    29.803] (II) modeset(0): Digital Display Input
[    29.803] (II) modeset(0): Max Image Size [cm]: horiz.: 35  vert.: 1
[    29.803] (II) modeset(0): Gamma: 2.20
[    29.803] (II) modeset(0): No DPMS capabilities specified
[    29.803] (II) modeset(0): Supported color encodings: RGB 4:4:4 YCrCb 
4:4:4
[    29.803] (II) modeset(0): First detailed timing is preferred mode
[    29.803] (II) modeset(0): redX: 0.640 redY: 0.340   greenX: 0.300 
greenY: 0.690
[    29.803] (II) modeset(0): blueX: 0.138 blueY: 0.038   whiteX: 0.282 
whiteY: 0.297
[    29.803] (II) modeset(0): Manufacturer's mask: 0
[    29.803] (II) modeset(0): Supported detailed timing:
[    29.803] (II) modeset(0): clock: 594.0 MHz   Image Size:  708 x 398 
mm
[    29.803] (II) modeset(0): h_active: 3840  h_sync: 4016  h_sync_end 
4104 h_blank_end 4400 h_border: 0
[    29.803] (II) modeset(0): v_active: 2160  v_sync: 2168  v_sync_end 
2178 v_blanking: 2250 v_border: 0
[    29.803] (II) modeset(0): Supported detailed timing:
[    29.803] (II) modeset(0): clock: 148.5 MHz   Image Size:  708 x 398 
mm
[    29.803] (II) modeset(0): h_active: 1920  h_sync: 2008  h_sync_end 
2052 h_blank_end 2200 h_border: 0
[    29.803] (II) modeset(0): v_active: 1080  v_sync: 1084  v_sync_end 
1089 v_blanking: 1125 v_border: 0
[    29.803] (II) modeset(0): Monitor name: SALORA
[    29.803] (II) modeset(0): Ranges: V min: 59 V max: 70 Hz, H min: 31 
H max: 140 kHz, PixClock max 605 MHz
[    29.803] (II) modeset(0): EDID (in hex):
[    29.803] (II) modeset(0):   00ffffffffffff003674000000000000
[    29.803] (II) modeset(0):   0b1f0103802301780acf74a3574cb023
[    29.803] (II) modeset(0):   09484c00000001010101010101010101
[    29.803] (II) modeset(0):   01010101010108e80030f2705a80b058
[    29.803] (II) modeset(0):   8a00c48e2100001e023a801871382d40
[    29.803] (II) modeset(0):   582c4500c48e2100001e000000fc0053
[    29.803] (II) modeset(0):   414c4f52410a202020202020000000fd
[    29.803] (II) modeset(0):   003b461f8c3c000a2020202020200085
[    29.804] (II) modeset(0): Printing probed modes for output HDMI-1
[    29.804] (II) modeset(0): Modeline "1920x1080"x60.0  148.50  1920 
2008 2052 2200  1080 1084 1089 1125 +hsync +vsync (67.5 kHz e)
