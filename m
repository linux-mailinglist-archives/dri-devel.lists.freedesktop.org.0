Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A981299C7AA
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2024 12:54:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB0E610E11E;
	Mon, 14 Oct 2024 10:54:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="aFlR9QFH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com
 [209.85.219.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECE5110E11E
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 10:54:53 +0000 (UTC)
Received: by mail-yb1-f172.google.com with SMTP id
 3f1490d57ef6-e28ff55468dso4126326276.2
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 03:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1728903293; x=1729508093;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=EgAGDQvtdRjqcOtBAUhj4kfDmp6ALllf+mG2mu1RW44=;
 b=aFlR9QFH7+9kYNer/dnOAM88XG0CcbWlesn/QsmR2/lSUQYwq7sDGTT6YcOYFGi4Ib
 8HIJM2cOP8kQsrzwo4GxIQq+dzcwluHwW8QAzZ3K1bOICFi+7EkbLg2KXkcDpmAnH5hQ
 IJkbkU3hMJAtxZpGXO7QBEi8Igtpx+86r1sTPgQf04uHa/8MgD0KOKF1XhmnvVJyJX5D
 Cm/JtlQ/V/nxz7YiUL4Bs1czXjCvnB8wh0glR+6zP24g0W/WlAXbywdZrG0fZ3C9Za4e
 DYPRDxq+zg85Z7YSSgMKIZL3xHuO6xYYcWPshGXlvXN8xT+l1iA3qCcDo38OQP6XAImJ
 YSdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728903293; x=1729508093;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EgAGDQvtdRjqcOtBAUhj4kfDmp6ALllf+mG2mu1RW44=;
 b=O8b4R7rQXL4Wm2tqZe7As1GMIcS39E1Z1rVPygxthefJW6yo7SImiKj0w2txj6PkPO
 0qMrU668auxjUMGC3iXqlvA1IS8Jyn9wAcIS63bskgpb0V/KtysEs9bBAI9BbadWKcEP
 qGONlSH4d7EjuE8hAJKs+WqvhmEilGMdB7ZqNUz2Hcyr0DRzpvhgalL+V6Mhltsz0FuA
 TVj7CnPk2Xe6qQZWAAeVgtGuTSRMS+lWbkFpD5D5NKMBLUThN9Ju815bEIhCeuy9OpRH
 FCYMopqGRDPIb+3q+SRNpo1xL/flSQ+yPCmcAGKjMc5Eotcwcmq+qXjAQKf7UkBYVYtF
 rPNw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVMMEwztrJe74c8g+QqES2iqzceck+AT6m1Y4/VpTZ+fPkbYHfldq/yY1iCJVD2uy+MjOW9E5cF4hk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzfvVi952GFL6L2gLJPFQgfR+IFgz+2qDR5fdRNTtapESBSOINQ
 bVrI2FP3I6laEwnnzMIwOAOyf6OtcdaSv+QKdA8itT6432q7XNAQzG+/tSJS4uHveDN6Gs3UmCU
 BDQJoEWnIZnyM3tL0t1vArlEPvpAWnA5U1eAC6w==
X-Google-Smtp-Source: AGHT+IE7liY2XD9m2ircKpuFkkxqou8jMcx0wqiVS2dNQipjch3ISN0mJXIsVHRBN1h40LJmFALDnZ4blF4+C6Z7ai0=
X-Received: by 2002:a05:690c:4c0b:b0:6db:b8ff:9128 with SMTP id
 00721157ae682-6e347c6b94cmr68594827b3.46.1728903292897; Mon, 14 Oct 2024
 03:54:52 -0700 (PDT)
MIME-Version: 1.0
References: <c657d3e9-e4fb-4dac-a611-45655511e500@gmx.net>
 <CAPY8ntDAMq_oTM+ua0pcFroTiWkDyhXSj++oGxOq+ODajm8++Q@mail.gmail.com>
 <3f35403e-f42f-4936-9297-68b56818aeee@gmx.net>
 <20241014-warm-savvy-wrasse-ed984e@houat>
In-Reply-To: <20241014-warm-savvy-wrasse-ed984e@houat>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 14 Oct 2024 11:54:36 +0100
Message-ID: <CAPY8ntAFzT4uBT47kDnDjEcSZXLonV-n_ixZ6L1_LAcfQPwS8Q@mail.gmail.com>
Subject: Re: vc4: HDMI Sink doesn't support RGB, something's wrong.
To: Maxime Ripard <mripard@kernel.org>
Cc: Stefan Wahren <wahrenst@gmx.net>,
 =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
 DRI Development <dri-devel@lists.freedesktop.org>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Florian Fainelli <florian.fainelli@broadcom.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 14 Oct 2024 at 10:04, Maxime Ripard <mripard@kernel.org> wrote:
>
> Hi,
>
> On Sun, Oct 13, 2024 at 09:57:58PM GMT, Stefan Wahren wrote:
> > Am 13.10.24 um 21:11 schrieb Dave Stevenson:
> > > Hi Stefan.
> > >
> > > On Sun, 13 Oct 2024, 18:19 Stefan Wahren, <wahrenst@gmx.net> wrote:
> > >
> > >     Hi,
> > >
> > >     i recently switch for my suspend2idle tests from Raspberry Pi Bullseye
> > >     to Bookworm. After that testing suspend2idle shows a new warning
> > >     which i
> > >     never saw before:
> > >
> > >     HDMI Sink doesn't support RGB, something's wrong.
> > >
> > >
> > > Can you provide the edid of your display please?
> >
> > Sure
> >
> > [    27.145] (II) modeset(0): Monitor name: HP ZR2440w
> > [    27.145] (II) modeset(0): Serial No: CN423402RL
> >
> > ...
> >
> > [    27.146] (II) modeset(0): EDID (in hex):
> > [    27.146] (II) modeset(0):     00ffffffffffff0022f0562901010101
> > [    27.146] (II) modeset(0):     22160103803420782afc81a4554d9d25
> > [    27.146] (II) modeset(0):     125054210800d1c081c0814081809500
> > [    27.146] (II) modeset(0):     a940b3000101283c80a070b023403020
> > [    27.146] (II) modeset(0):     360006442100001a000000fd00183c18
> > [    27.146] (II) modeset(0):     5011000a202020202020000000fc0048
> > [    27.146] (II) modeset(0):     50205a5232343430770a2020000000ff
> > [    27.146] (II) modeset(0):     00434e343233343032524c0a2020015b
> > [    27.146] (II) modeset(0):     02031ff14c901f051404130302070612
> > [    27.147] (II) modeset(0):     0165030c001000230907078301000002
> > [    27.147] (II) modeset(0):     3a801871382d40582c45000644210000
> > [    27.147] (II) modeset(0):     1e023a80d072382d40102c4580064421
> > [    27.147] (II) modeset(0):     00001e011d007251d01e206e28550006
> > [    27.147] (II) modeset(0):     442100001e011d00bc52d01e20b82855
> > [    27.147] (II) modeset(0):     4006442100001e8c0ad08a20e02d1010
> > [    27.147] (II) modeset(0):     3e9600064421000018000000000000c1
>
> It's a bit hard to extract, could you provide the output of
>
> cat /sys/class/drm/card/cardX-HDMI-A-X/edid | edid-decode --check

I reformatted it.
00ffffffffffff0022f0562901010101
22160103803420782afc81a4554d9d25
125054210800d1c081c0814081809500
a940b3000101283c80a070b023403020
360006442100001a000000fd00183c18
5011000a202020202020000000fc0048
50205a5232343430770a2020000000ff
00434e343233343032524c0a2020015b
02031ff14c901f051404130302070612
0165030c001000230907078301000002
3a801871382d40582c45000644210000
1e023a80d072382d40102c4580064421
00001e011d007251d01e206e28550006
442100001e011d00bc52d01e20b82855
4006442100001e8c0ad08a20e02d1010
3e9600064421000018000000000000c1

$ ./build/edid-decode --check StefanEDID.txt
edid-decode (hex):

00 ff ff ff ff ff ff 00 22 f0 56 29 01 01 01 01
22 16 01 03 80 34 20 78 2a fc 81 a4 55 4d 9d 25
12 50 54 21 08 00 d1 c0 81 c0 81 40 81 80 95 00
a9 40 b3 00 01 01 28 3c 80 a0 70 b0 23 40 30 20
36 00 06 44 21 00 00 1a 00 00 00 fd 00 18 3c 18
50 11 00 0a 20 20 20 20 20 20 00 00 00 fc 00 48
50 20 5a 52 32 34 34 30 77 0a 20 20 00 00 00 ff
00 43 4e 34 32 33 34 30 32 52 4c 0a 20 20 01 5b

02 03 1f f1 4c 90 1f 05 14 04 13 03 02 07 06 12
01 65 03 0c 00 10 00 23 09 07 07 83 01 00 00 02
3a 80 18 71 38 2d 40 58 2c 45 00 06 44 21 00 00
1e 02 3a 80 d0 72 38 2d 40 10 2c 45 80 06 44 21
00 00 1e 01 1d 00 72 51 d0 1e 20 6e 28 55 00 06
44 21 00 00 1e 01 1d 00 bc 52 d0 1e 20 b8 28 55
40 06 44 21 00 00 1e 8c 0a d0 8a 20 e0 2d 10 10
3e 96 00 06 44 21 00 00 18 00 00 00 00 00 00 c1

----------------

Block 0, Base EDID:
  EDID Structure Version & Revision: 1.3
  Vendor & Product Identification:
    Manufacturer: HWP
    Model: 10582
    Serial Number: 16843009 (0x01010101)
    Made in: week 34 of 2012
  Basic Display Parameters & Features:
    Digital display
    Maximum image size: 52 cm x 32 cm
    Gamma: 2.20
    DPMS levels: Off
    RGB color display
    First detailed timing is the preferred timing
  Color Characteristics:
    Red  : 0.6435, 0.3349
    Green: 0.3037, 0.6132
    Blue : 0.1464, 0.0703
    White: 0.3125, 0.3291
  Established Timings I & II:
    DMT 0x04:   640x480    59.940476 Hz   4:3     31.469 kHz     25.175000 MHz
    DMT 0x09:   800x600    60.316541 Hz   4:3     37.879 kHz     40.000000 MHz
    DMT 0x10:  1024x768    60.003840 Hz   4:3     48.363 kHz     65.000000 MHz
  Standard Timings:
    DMT 0x52:  1920x1080   60.000000 Hz  16:9     67.500 kHz    148.500000 MHz
    DMT 0x55:  1280x720    60.000000 Hz  16:9     45.000 kHz     74.250000 MHz
    DMT 0x20:  1280x960    60.000000 Hz   4:3     60.000 kHz    108.000000 MHz
    DMT 0x23:  1280x1024   60.019740 Hz   5:4     63.981 kHz    108.000000 MHz
    DMT 0x2f:  1440x900    59.887445 Hz  16:10    55.935 kHz    106.500000 MHz
    DMT 0x33:  1600x1200   60.000000 Hz   4:3     75.000 kHz    162.000000 MHz
    DMT 0x3a:  1680x1050   59.954250 Hz  16:10    65.290 kHz    146.250000 MHz
  Detailed Timing Descriptors:
    DTD 1:  1920x1200   59.950171 Hz  16:10    74.038 kHz
154.000000 MHz (518 mm x 324 mm)
                 Hfront   48 Hsync  32 Hback   80 Hpol P
                 Vfront    3 Vsync   6 Vback   26 Vpol N
    Display Range Limits:
      Monitor ranges (GTF): 24-60 Hz V, 24-80 kHz H, max dotclock 170 MHz
    Display Product Name: 'HP ZR2440w'
    Display Product Serial Number: 'CN423402RL'
  Extension blocks: 1
Checksum: 0x5b

----------------

Block 1, CTA-861 Extension Block:
  Revision: 3
  Underscans IT Video Formats by default
  Basic audio support
  Supports YCbCr 4:4:4
  Supports YCbCr 4:2:2
  Native detailed modes: 1
  Video Data Block:
    VIC  16:  1920x1080   60.000000 Hz  16:9     67.500 kHz
148.500000 MHz (native)
    VIC  31:  1920x1080   50.000000 Hz  16:9     56.250 kHz    148.500000 MHz
    VIC   5:  1920x1080i  60.000000 Hz  16:9     33.750 kHz     74.250000 MHz
    VIC  20:  1920x1080i  50.000000 Hz  16:9     28.125 kHz     74.250000 MHz
    VIC   4:  1280x720    60.000000 Hz  16:9     45.000 kHz     74.250000 MHz
    VIC  19:  1280x720    50.000000 Hz  16:9     37.500 kHz     74.250000 MHz
    VIC   3:   720x480    59.940060 Hz  16:9     31.469 kHz     27.000000 MHz
    VIC   2:   720x480    59.940060 Hz   4:3     31.469 kHz     27.000000 MHz
    VIC   7:  1440x480i   59.940060 Hz  16:9     15.734 kHz     27.000000 MHz
    VIC   6:  1440x480i   59.940060 Hz   4:3     15.734 kHz     27.000000 MHz
    VIC  18:   720x576    50.000000 Hz  16:9     31.250 kHz     27.000000 MHz
    VIC   1:   640x480    59.940476 Hz   4:3     31.469 kHz     25.175000 MHz
  Vendor-Specific Data Block (HDMI), OUI 00-0C-03:
    Source physical address: 1.0.0.0
  Audio Data Block:
    Linear PCM:
      Max channels: 2
      Supported sample rates (kHz): 48 44.1 32
      Supported sample sizes (bits): 24 20 16
  Speaker Allocation Data Block:
    FL/FR - Front Left/Right
  Detailed Timing Descriptors:
    DTD 2:  1920x1080   60.000000 Hz  16:9     67.500 kHz
148.500000 MHz (518 mm x 324 mm)
                 Hfront   88 Hsync  44 Hback  148 Hpol P
                 Vfront    4 Vsync   5 Vback   36 Vpol P
    DTD 3:  1920x1080   50.000000 Hz  16:9     56.250 kHz
148.500000 MHz (518 mm x 324 mm)
                 Hfront  528 Hsync  44 Hback  148 Hpol P
                 Vfront    4 Vsync   5 Vback   36 Vpol P
    DTD 4:  1280x720    60.000000 Hz  16:9     45.000 kHz
74.250000 MHz (518 mm x 324 mm)
                 Hfront  110 Hsync  40 Hback  220 Hpol P
                 Vfront    5 Vsync   5 Vback   20 Vpol P
    DTD 5:  1280x720    50.000000 Hz  16:9     37.500 kHz
74.250000 MHz (518 mm x 324 mm)
                 Hfront  440 Hsync  40 Hback  220 Hpol P
                 Vfront    5 Vsync   5 Vback   20 Vpol P
    DTD 6:   720x480    59.940060 Hz   3:2     31.469 kHz
27.000000 MHz (518 mm x 324 mm)
                 Hfront   16 Hsync  62 Hback   60 Hpol N
                 Vfront    9 Vsync   6 Vback   30 Vpol N
Checksum: 0xc1  Unused space in Extension Block: 6 bytes

----------------

edid-decode SHA: 88d457cbcabc 2024-09-03 14:12:56

Warnings:

Block 0, Base EDID:
  Vendor & Product Identification: The serial number is one of the
known dummy values, it should probably be set to 0.
Block 1, CTA-861 Extension Block:
  Video Data Block: VIC 16 and the first DTD are not identical. Is
this intended?
  Display Product Serial Number is set, so the Serial Number in the
Base EDID should be 0.
  Add a Colorimetry Data Block with the sRGB colorimetry bit set to
avoid interop issues.
EDID:
  Base EDID: Some timings are out of range of the Monitor Ranges:
    Horizontal Freq: 15.734 - 75.000 kHz (Monitor: 24.000 - 80.000 kHz)

Failures:

Block 1, CTA-861 Extension Block:
  Missing VCDB, needed for Set Selectable RGB Quantization to avoid
interop issues.
EDID:
  CTA-861: Native progressive timings are a mix of several resolutions.

EDID conformity: FAIL


The failure is coming from sink_supports_format_bpc()[1], but the flag
for DRM_COLOR_FORMAT_RGB444 should have been set from
update_display_info()[2] parsing the EDID.

Loading that EDID in via drm.edid_firmware has given me a console at
1920x1200@60 without any issues, so I'm a little confused as to what
is going on.

  Dave

[1] https://elixir.bootlin.com/linux/v6.12-rc2/source/drivers/gpu/drm/display/drm_hdmi_state_helper.c#L130
[2] https://elixir.bootlin.com/linux/v6.12-rc2/source/drivers/gpu/drm/drm_edid.c#L6669
