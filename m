Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FA4F935008
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2024 17:37:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5681D10E07B;
	Thu, 18 Jul 2024 15:36:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="OxvTosPE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DE4E10E07B
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2024 15:36:56 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-58ba3e38027so822591a12.1
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2024 08:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721317014; x=1721921814; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BVeii/OxO9OmPKHmSe8CmSnaEo17pSKoTgl51HUdVxU=;
 b=OxvTosPE7GW0oCo4O4gUumAjnNsMeh91K3rJJyNjkBJLlSADtFTWARyRpotcll6a5K
 T7lY4xJ9ws0Kfwt2FtOR+YuOoA/cmaxNJLEPUbfgnuk2erZMrzUsdATLMzUCwENXQswN
 qT089qTjbuYP43nWPysFiMFwEKnRQdC2Pej5B+KHlED3lqtYJrLk5iLADK0sEB3WG85T
 A1yiDtc9keoOw34TztyHL8GwMTIpdHje1ghZLVaB5vi6/6smvIjmYeKVmcQoMcK1k2+9
 QFmR5zhLsjYqADpl8R4synycMMqNvWLJhbOg7MJYrFuKJnV7egLgiW9e2VVqLot3tG4v
 LwbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721317014; x=1721921814;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BVeii/OxO9OmPKHmSe8CmSnaEo17pSKoTgl51HUdVxU=;
 b=v8FXVtl3y0K03js+q5APV89O5q1feCbBvM9kKjoo9+kBCxePRlWNy8XFx4A/9+kaU2
 uC9SR3aNAIuiDrUeIwolwkkwy6WXFLDdpBtw6L2dJ1Au/9tgaQxX1Kq+DkJQ74U6a0Kd
 iN8QsQqtuc5nDVIhdRvpDTSMkJ4L9LEmlSTRZm8UpSZiSL0gTk3YLpFJSVraNEK3KCiF
 LICPMstVgZrHNfxcWRUTEZL2BN6B55wNgkmGSeFxtCSo9AWX6nzmzHJUqipO2Ajd9Lil
 qxmfNtRRYWH/LnyEH3PYB0Sl7qorpRZaG1vBEB0fhB9z3xA+BABnV6kcpdTLNVgN0Nxj
 Zqjg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW/Y3JVfcAqEUthRx366sN/p56QFcqW0PnqxMHrRIqRbFXMhkIR/Pp3dw49nq7ABhr1Y1WM6MUr3+l6kq9pPLGfKsNhcQN/W1EJVlJoG7Xr
X-Gm-Message-State: AOJu0YxZjDdPC79vN9hYEy3aMyymCnO81eC7LpVSRm0SauSFBQdsnu2U
 snrlVmjGz3vS72iK0oKMtkWpsoJGtXepS6eDswYSXFCytQrNx2gBR/y/Ga6/TuFQ5Gy5oakw1X0
 8xn7I8xBMM09DdU83wRLq9eC6/Dg=
X-Google-Smtp-Source: AGHT+IFBVJ8w2xbQHZeBGl7vKPDXYF9c+PaKm7qiUaGkAVR3bkdEWI/f9Fuq+mErnUAwA4VeMFu6xSAhuoPulh1vcBY=
X-Received: by 2002:a50:8d51:0:b0:5a1:3b03:d0cb with SMTP id
 4fb4d7f45d1cf-5a13b03d7b5mr2240672a12.32.1721317013848; Thu, 18 Jul 2024
 08:36:53 -0700 (PDT)
MIME-Version: 1.0
References: <20240717215847.5310-1-robdclark@gmail.com>
 <CAD=FV=XCOKJHJ-yzENpvm_MD34tMR5LRy2m2jYdcWzZXP4pfXQ@mail.gmail.com>
 <CAF6AEGuBZqV4zg1asUNbMLvq0-i-iyFwfi37uKS3kWNuRSOU+g@mail.gmail.com>
 <d5vfynn6ba4fwkaw7cegzillhw5qkl5z5huw2xb347j3tv7gnu@etgiotbc2x3r>
In-Reply-To: <d5vfynn6ba4fwkaw7cegzillhw5qkl5z5huw2xb347j3tv7gnu@etgiotbc2x3r>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 18 Jul 2024 08:36:41 -0700
Message-ID: <CAF6AEGuTjQ2QLUmp2+LhhCwJvyNX243CvgXV5BjtuPmL7_Rvfw@mail.gmail.com>
Subject: Re: [RFC] drm/panel/simple-edp: Add Samsung ATNA45DC02
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Doug Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, Rob Clark <robdclark@chromium.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Thu, Jul 18, 2024 at 5:31=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Wed, Jul 17, 2024 at 06:09:29PM GMT, Rob Clark wrote:
> > On Wed, Jul 17, 2024 at 5:19=E2=80=AFPM Doug Anderson <dianders@chromiu=
m.org> wrote:
> > >
> > > Hi,
> > >
> > > On Wed, Jul 17, 2024 at 2:58=E2=80=AFPM Rob Clark <robdclark@gmail.co=
m> wrote:
> > > >
> > > > From: Rob Clark <robdclark@chromium.org>
> > > >
> > > > Just a guess on the panel timings, but they appear to work.
> > > >
> > > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > > ---
> > > > This adds the panel I have on my lenovo yoga slim 7x laptop.  I cou=
ldn't
> > > > find any datasheet so timings is just a guess.  But AFAICT everythi=
ng
> > > > works fine.
> > > >
> > > >  drivers/gpu/drm/panel/panel-edp.c | 2 ++
> > > >  1 file changed, 2 insertions(+)
> > >
> > > Given that this is a Samsung ATNA<mumble>, is there any chance it's a=
n
> > > OLED panel? Should it be supported with the Samsung OLED panel driver
> > > like this:
> > >
> > > https://lore.kernel.org/r/20240715-x1e80100-crd-backlight-v2-0-31b7f2=
f658a3@linaro.org
> >
> > it is an OLED panel, and I did see that patchset and thought that
> > samsung panel driver would work.  But changing the compat string on
> > the yoga dts only gave me a black screen (and I didn't see any of the
> > other mentioned problems with bl control or dpms with panel-edp).  So
> > :shrug:?  It could be I overlooked something else, but it _seems_ like
> > panel-edp is fine for this panel. Plus, it would avoid awkwardness if
> > it turned out there were other non-samsung 2nd sources, but so far
> > with a sample size of two 100% of these laptops have the same panel
> > ;-)
> >
> > But that was the reason for posting this as an RFC.  I was hoping
> > someone had some hint about where to find datasheets (my google'ing
> > was not successful), etc.
>
> Panelook has a datasheet for ATNA45DC01. It's behind a 'register new
> business email' paywall.

but it does not appear to have ATNA45DC02

fwiw, edid:

----------------
edid-decode (hex):

00 ff ff ff ff ff ff 00 4c 83 89 41 00 00 00 00
00 21 01 04 b5 1f 14 78 02 0b d1 af 51 3d b6 23
0b 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
01 01 01 01 01 01 1e cc 80 50 b0 30 10 74 08 20
88 00 38 c3 10 00 00 1b 1e cc 80 50 b0 30 50 70
08 20 88 00 38 c3 10 00 00 1b 00 00 00 fe 00 53
44 43 20 20 20 20 20 20 20 20 20 20 00 00 00 fe
00 41 54 4e 41 34 35 44 43 30 32 2d 30 20 01 06

02 03 0f 00 e3 05 80 00 e6 06 05 01 8a 6a 02 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 9c

----------------

Block 0, Base EDID:
  EDID Structure Version & Revision: 1.4
  Vendor & Product Identification:
    Manufacturer: SDC
    Model: 16777
    Made in: 2023
  Basic Display Parameters & Features:
    Digital display
    Bits per primary color channel: 10
    DisplayPort interface
    Maximum image size: 31 cm x 20 cm
    Gamma: 2.20
    Supported color formats: RGB 4:4:4
    First detailed timing includes the native pixel format and
preferred refresh rate
  Color Characteristics:
    Red  : 0.6835, 0.3164
    Green: 0.2402, 0.7138
    Blue : 0.1396, 0.0439
    White: 0.3125, 0.3291
  Established Timings I & II: none
  Standard Timings: none
  Detailed Timing Descriptors:
    DTD 1:  2944x1840   59.999173 Hz  16:10   172.798 kHz
522.540000 MHz (312 mm x 195 mm)
                 Hfront    8 Hsync  32 Hback   40 Hpol P
                 Vfront    8 Vsync   8 Vback 1024 Vpol N
    DTD 2:  2944x1840   89.998760 Hz  16:10   172.798 kHz
522.540000 MHz (312 mm x 195 mm)
                 Hfront    8 Hsync  32 Hback   40 Hpol P
                 Vfront    8 Vsync   8 Vback   64 Vpol N
    Alphanumeric Data String: 'SDC          '
    Alphanumeric Data String: 'ATNA45DC02-0 '
  Extension blocks: 1
Checksum: 0x06

----------------

Block 1, CTA-861 Extension Block:
  Revision: 3
  Native detailed modes: 0
  Colorimetry Data Block:
    BT2020RGB
  HDR Static Metadata Data Block:
    Electro optical transfer functions:
      Traditional gamma - SDR luminance range
      SMPTE ST2084
    Supported static metadata descriptors:
      Static metadata type 1
    Desired content max luminance: 138 (993.486 cd/m^2)
    Desired content max frame-average luminance: 106 (496.743 cd/m^2)
    Desired content min luminance: 2 (0.001 cd/m^2)
Checksum: 0x9c  Unused space in Extension Block: 112 bytes
----------------


BR,
-R


> >
> > BR,
> > -R
>
> --
> With best wishes
> Dmitry
