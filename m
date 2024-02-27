Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19A24868592
	for <lists+dri-devel@lfdr.de>; Tue, 27 Feb 2024 02:10:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70AA010F218;
	Tue, 27 Feb 2024 01:10:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="OdMtJ6nX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com
 [209.85.210.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEACA10EE72
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 01:10:22 +0000 (UTC)
Received: by mail-ot1-f48.google.com with SMTP id
 46e09a7af769-6e432514155so1853008a34.1
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 17:10:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1708996221; x=1709601021;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2nONMEgiFSJu48ujRsgQ7k5P30oEYUyNKo29jK5bJDE=;
 b=OdMtJ6nXjUtA1IiJLsiZTEeXVCTrDGe9RA2EjvBEXqcyVrFiueROLr6tkA1B/ngomL
 wPqP0v5Jg9RP04qelifWWtx40ryDr/7YHmwBC4STdDEF+Qf3loPOhbJJSW2p5G4ScqDw
 vy+qZFqRtltapLZwfCpi9bCL5iRaWS9zxiPWw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708996221; x=1709601021;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2nONMEgiFSJu48ujRsgQ7k5P30oEYUyNKo29jK5bJDE=;
 b=D3GMgpHUiTq/XHqMBcovFct82hEi8b/gMnpjWl3jrsinnYBbRsToMEBM4sd9AsmK8P
 rCVErajBp/I2Q7pKys6XugOhJzTfpcyMcFoFQqGFY4K3DsmIULz6GMcmtroX652lfYf8
 +9N3s3muFgJiMRr2b+j3LEVL2M2/GLLOo90aLlY8Yh1XYWvzCOE9587CIynUcOGzt0Gy
 DL0C2u9R9TYIfbJWLc4V1dI6frvnaVKL+JqE9kGcFdig89tjp8l+5yvA6M5PYS7umAiM
 uVdoWkN44aStubn88tOoi72w+lTP537nQcgWquXQuj9dryaAI4Q10Aaj8hnjZzMB7EDJ
 TmgA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWhlUhEyrs2B+Xo861Eh5QIaElCFD0HGpcHsdPUg+t0UlxWQCXMhqZyKJsbXI4UpPap1BRxR29fivJV87gui2GJl4QHOmcvMJMhgMZU0hsP
X-Gm-Message-State: AOJu0Yx/zuAVRXqgeu7xsqqDwQMG8oeF0itE3gcFXdhXyr+uMVZ0C3oH
 ufki7AlQrPeHS68o+eV0jPZng88OFt1PlgxjyPscNLtiHI0zPy3JX7/3R3+ZTlt+O0+SPp9SgjP
 53fqxJeGhX7IZr++f4gd17OV0zvmG8zq4f8YU
X-Google-Smtp-Source: AGHT+IFws5Kxdb14MQ1Ej+HyXspa2sh+2n9Wu72IIuj/Ruv+O9s0INJzZGTh7MdiL1GKFOMwujxIFZOuAcC7yoIIv08=
X-Received: by 2002:a9d:6c43:0:b0:6e4:8086:571 with SMTP id
 g3-20020a9d6c43000000b006e480860571mr8748620otq.26.1708996221486; Mon, 26 Feb
 2024 17:10:21 -0800 (PST)
MIME-Version: 1.0
References: <20240223223958.3887423-1-hsinyi@chromium.org>
 <CAA8EJpre_HOY1xzOZPv5gPiJ-kEZEJiEm8oyYzXTiPj66vY8aw@mail.gmail.com>
In-Reply-To: <CAA8EJpre_HOY1xzOZPv5gPiJ-kEZEJiEm8oyYzXTiPj66vY8aw@mail.gmail.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Mon, 26 Feb 2024 17:09:55 -0800
Message-ID: <CAJMQK-gfKbdPhYJeCJ5UX0dNrx3y-EmLsTiv9nj+U3Rmej38pw@mail.gmail.com>
Subject: Re: [PATCH 0/2] Match panel hash for overridden mode
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Douglas Anderson <dianders@chromium.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

On Mon, Feb 26, 2024 at 4:37=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Sat, 24 Feb 2024 at 00:40, Hsin-Yi Wang <hsinyi@chromium.org> wrote:
> >
> > This series is a follow up for 1a5e81de180e ("Revert "drm/panel-edp: Ad=
d
> > auo_b116xa3_mode""). It's found that 2 different AUO panels use the sam=
e
> > product id. One of them requires an overridden mode, while the other sh=
ould
> > use the mode directly from edid.
> >
> > Since product id match is no longer sufficient, EDP_PANEL_ENTRY2 is ext=
ended
> > to check the crc hash of the entire edid base block.
>
> Do you have these EDIDs posted somewhere? Can we use something less
> cryptic than hash for matching the panel, e.g. strings from Monitor
> Descriptors?
>

Panel 1:

00 ff ff ff ff ff ff 00 06 af 5c 40 00 00 00 00
00 1a 01 04 95 1a 0e 78 02 99 85 95 55 56 92 28
22 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
01 01 01 01 01 01 12 1b 56 5a 50 00 19 30 30 20
46 00 00 90 10 00 00 18 00 00 00 0f 00 00 00 00
00 00 00 00 00 00 00 00 00 20 00 00 00 fe 00 41
55 4f 0a 20 20 20 20 20 20 20 20 20 00 00 00 fe
00 42 31 31 36 58 41 4b 30 31 2e 30 20 0a 00 cc

----------------

Block 0, Base EDID:
  EDID Structure Version & Revision: 1.4
  Vendor & Product Identification:
    Manufacturer: AUO
    Model: 16476
    Made in: 2016
  Basic Display Parameters & Features:
    Digital display
    Bits per primary color channel: 6
    DisplayPort interface
    Maximum image size: 26 cm x 14 cm
    Gamma: 2.20
    Supported color formats: RGB 4:4:4
    First detailed timing includes the native pixel format and
preferred refresh rate
  Color Characteristics:
    Red  : 0.5839, 0.3330
    Green: 0.3378, 0.5712
    Blue : 0.1582, 0.1328
    White: 0.3134, 0.3291
  Established Timings I & II: none
  Standard Timings: none
  Detailed Timing Descriptors:
    DTD 1:  1366x768    60.020 Hz 683:384  47.596 kHz   69.300 MHz
(256 mm x 144 mm)
                 Hfront   48 Hsync  32 Hback  10 Hpol N
                 Vfront    4 Vsync   6 Vback  15 Vpol N
    Manufacturer-Specified Display Descriptor (0x0f): 00 0f 00 00 00
00 00 00 00 00 00 00 00 00 00 20 '............... '
    Alphanumeric Data String: 'AUO'
    Alphanumeric Data String: 'B116XAK01.0 '
Checksum: 0xcc


Panel 2:

00 ff ff ff ff ff ff 00 06 af 5c 40 00 00 00 00
00 19 01 04 95 1a 0e 78 02 99 85 95 55 56 92 28
22 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
01 01 01 01 01 01 ce 1d 56 ea 50 00 1a 30 30 20
46 00 00 90 10 00 00 18 d4 17 56 ea 50 00 1a 30
30 20 46 00 00 90 10 00 00 18 00 00 00 fe 00 41
55 4f 0a 20 20 20 20 20 20 20 20 20 00 00 00 fe
00 42 31 31 36 58 41 4e 30 34 2e 30 20 0a 00 94

----------------

Block 0, Base EDID:
  EDID Structure Version & Revision: 1.4
  Vendor & Product Identification:
    Manufacturer: AUO
    Model: 16476
    Made in: 2015
  Basic Display Parameters & Features:
    Digital display
    Bits per primary color channel: 6
    DisplayPort interface
    Maximum image size: 26 cm x 14 cm
    Gamma: 2.20
    Supported color formats: RGB 4:4:4
    First detailed timing includes the native pixel format and
preferred refresh rate
  Color Characteristics:
    Red  : 0.5839, 0.3330
    Green: 0.3378, 0.5712
    Blue : 0.1582, 0.1328
    White: 0.3134, 0.3291
  Established Timings I & II: none
  Standard Timings: none
  Detailed Timing Descriptors:
    DTD 1:  1366x768    60.059824 Hz 683:384   47.688 kHz
76.300000 MHz (256 mm x 144 mm)
                 Hfront   48 Hsync  32 Hback  154 Hpol N
                 Vfront    4 Vsync   6 Vback   16 Vpol N
    DTD 2:  1366x768    48.016373 Hz 683:384   38.125 kHz
61.000000 MHz (256 mm x 144 mm)
                 Hfront   48 Hsync  32 Hback  154 Hpol N
                 Vfront    4 Vsync   6 Vback   16 Vpol N
    Alphanumeric Data String: 'AUO'
    Alphanumeric Data String: 'B116XAN04.0 '
Checksum: 0x94

In this example, Descriptors can also be used to distinguish. But it's
possible that the name field is also reused by mistake, for the same
reason as model id is reused.


> >
> > Hsin-Yi Wang (2):
> >   drm_edid: Add a function to get EDID base block
> >   drm/panel: panel-edp: Match with panel hash for overridden modes
> >
> >  drivers/gpu/drm/drm_edid.c        | 55 +++++++++++++++-------------
> >  drivers/gpu/drm/panel/panel-edp.c | 60 ++++++++++++++++++++++++++-----
> >  include/drm/drm_edid.h            |  3 +-
> >  3 files changed, 84 insertions(+), 34 deletions(-)
> >
> > --
> > 2.44.0.rc0.258.g7320e95886-goog
> >
>
>
> --
> With best wishes
> Dmitry
