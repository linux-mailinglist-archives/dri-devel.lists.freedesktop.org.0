Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F9C868701
	for <lists+dri-devel@lfdr.de>; Tue, 27 Feb 2024 03:26:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9952A10F008;
	Tue, 27 Feb 2024 02:26:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="p3rB65hh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com
 [209.85.219.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABED810F212
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 02:26:18 +0000 (UTC)
Received: by mail-yb1-f175.google.com with SMTP id
 3f1490d57ef6-dccb1421bdeso3565852276.1
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 18:26:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709000777; x=1709605577; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FCEqoEe8h2ncNZO/H1zt/NRD5p1KyWoUZuyGGRZfeIQ=;
 b=p3rB65hhPxWbsoaaJXdJukz3s5KrNR1pAMDaDB2I85dZfBMqJZaJ+BaSvlCC1SNMPS
 mg31WbUIzTJdiJ2BYWjeGeRnjfgaxQGHcCulGVxLmPbWqXDndqt4nCe103EmM/lfNPYs
 LKvU7Md7HYniU7GjvVi8iWWlHWjP/c5W6a7fAdi3Fpyv6AFqqEdKrsdflLzB5oKBjpKb
 tVp0GX5TNnZSFzm/gtJfhBkLK55ZjXG4Zn1Hvgqjs339GUOOyDEyc3sW0Tb3kULc9TrU
 JSFk+aWDmWXQSn0MbFA1y3A+HEBwYfLNI4BOX+3P/MQsD8fZJkl/URBnTHFvD+sJDAsv
 ysTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709000777; x=1709605577;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FCEqoEe8h2ncNZO/H1zt/NRD5p1KyWoUZuyGGRZfeIQ=;
 b=mAIRvXcWkZGGB1WqE6X69ns0xHHfG+lx0HacclyLDHcpgkkkQP1aG135Vv95vvoXFB
 OXk+Aw4I0MyuA1gCSeF0a1U4kmcxoM9eKJwO509aYkPoflRpYklqI/nd92gXNWpgzLaR
 99qsdX0vMOdlcbLHjVYbMwJgFWfk2BKfZFRMYmsDWmt0DTtbD+j7ZIiXrqTBzI674SfF
 PLAzh58nib9LyJq4bwew6Hg/oYEu4MnI1kWymSAE8/ZeO1G61BlbV8zXJiOF0guG0lij
 5be2P3win584QiCJZLqyUTI5+uVRdESDgXDLbcA++aXUZt9rkTqEnz+WO+Lb8E771V6e
 ifRg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUKUA2n+eUIYVAl4UQfIvGG+9ZW0U9DdcUyp0QMeac5gE+huMMRsV+nCqP7ZfLWLTt0wsKhRAvBNiiH+L511taBp33q4cQctjz0RkjtB6UN
X-Gm-Message-State: AOJu0YyO1guNPZYuLAcvoNIL2xcFel9QSHfFURWpugjdvLaxwKg73z9n
 24ygzk+XNKs90d5eg2GrJhVAngM84vqNhA10fsWwx4iuhdEwJOmzuW8VfoU8HxmTLLa2sjQ77YD
 WcT3S9E0RSqT3vpa+8ln6mgbfp3q1VLHzrtj/Jw==
X-Google-Smtp-Source: AGHT+IH7xRwpzcLY0VJJqoX5vz9MVun2OqKl3Bo8ij6NiJtw3EMXFXzcV8WP0eTVFD1ncy1UG4d/acOy4fmEpynDYbg=
X-Received: by 2002:a25:9d8a:0:b0:dcc:35ca:aac4 with SMTP id
 v10-20020a259d8a000000b00dcc35caaac4mr965543ybp.51.1709000777563; Mon, 26 Feb
 2024 18:26:17 -0800 (PST)
MIME-Version: 1.0
References: <20240223223958.3887423-1-hsinyi@chromium.org>
 <CAA8EJpre_HOY1xzOZPv5gPiJ-kEZEJiEm8oyYzXTiPj66vY8aw@mail.gmail.com>
 <CAJMQK-gfKbdPhYJeCJ5UX0dNrx3y-EmLsTiv9nj+U3Rmej38pw@mail.gmail.com>
In-Reply-To: <CAJMQK-gfKbdPhYJeCJ5UX0dNrx3y-EmLsTiv9nj+U3Rmej38pw@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 27 Feb 2024 04:26:06 +0200
Message-ID: <CAA8EJprvk-MMrYhG0baT0OyOAGwOTVeHQvKmrvJPrc+KdbJaDw@mail.gmail.com>
Subject: Re: [PATCH 0/2] Match panel hash for overridden mode
To: Hsin-Yi Wang <hsinyi@chromium.org>
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

On Tue, 27 Feb 2024 at 03:10, Hsin-Yi Wang <hsinyi@chromium.org> wrote:
>
> On Mon, Feb 26, 2024 at 4:37=E2=80=AFPM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > On Sat, 24 Feb 2024 at 00:40, Hsin-Yi Wang <hsinyi@chromium.org> wrote:
> > >
> > > This series is a follow up for 1a5e81de180e ("Revert "drm/panel-edp: =
Add
> > > auo_b116xa3_mode""). It's found that 2 different AUO panels use the s=
ame
> > > product id. One of them requires an overridden mode, while the other =
should
> > > use the mode directly from edid.
> > >
> > > Since product id match is no longer sufficient, EDP_PANEL_ENTRY2 is e=
xtended
> > > to check the crc hash of the entire edid base block.
> >
> > Do you have these EDIDs posted somewhere? Can we use something less
> > cryptic than hash for matching the panel, e.g. strings from Monitor
> > Descriptors?
> >
>
> Panel 1:
>
> 00 ff ff ff ff ff ff 00 06 af 5c 40 00 00 00 00
> 00 1a 01 04 95 1a 0e 78 02 99 85 95 55 56 92 28
> 22 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
> 01 01 01 01 01 01 12 1b 56 5a 50 00 19 30 30 20
> 46 00 00 90 10 00 00 18 00 00 00 0f 00 00 00 00
> 00 00 00 00 00 00 00 00 00 20 00 00 00 fe 00 41
> 55 4f 0a 20 20 20 20 20 20 20 20 20 00 00 00 fe
> 00 42 31 31 36 58 41 4b 30 31 2e 30 20 0a 00 cc
>
> ----------------
>
> Block 0, Base EDID:
>   EDID Structure Version & Revision: 1.4
>   Vendor & Product Identification:
>     Manufacturer: AUO
>     Model: 16476
>     Made in: 2016
>   Basic Display Parameters & Features:
>     Digital display
>     Bits per primary color channel: 6
>     DisplayPort interface
>     Maximum image size: 26 cm x 14 cm
>     Gamma: 2.20
>     Supported color formats: RGB 4:4:4
>     First detailed timing includes the native pixel format and
> preferred refresh rate
>   Color Characteristics:
>     Red  : 0.5839, 0.3330
>     Green: 0.3378, 0.5712
>     Blue : 0.1582, 0.1328
>     White: 0.3134, 0.3291
>   Established Timings I & II: none
>   Standard Timings: none
>   Detailed Timing Descriptors:
>     DTD 1:  1366x768    60.020 Hz 683:384  47.596 kHz   69.300 MHz
> (256 mm x 144 mm)
>                  Hfront   48 Hsync  32 Hback  10 Hpol N
>                  Vfront    4 Vsync   6 Vback  15 Vpol N
>     Manufacturer-Specified Display Descriptor (0x0f): 00 0f 00 00 00
> 00 00 00 00 00 00 00 00 00 00 20 '............... '
>     Alphanumeric Data String: 'AUO'
>     Alphanumeric Data String: 'B116XAK01.0 '
> Checksum: 0xcc
>
>
> Panel 2:
>
> 00 ff ff ff ff ff ff 00 06 af 5c 40 00 00 00 00
> 00 19 01 04 95 1a 0e 78 02 99 85 95 55 56 92 28
> 22 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
> 01 01 01 01 01 01 ce 1d 56 ea 50 00 1a 30 30 20
> 46 00 00 90 10 00 00 18 d4 17 56 ea 50 00 1a 30
> 30 20 46 00 00 90 10 00 00 18 00 00 00 fe 00 41
> 55 4f 0a 20 20 20 20 20 20 20 20 20 00 00 00 fe
> 00 42 31 31 36 58 41 4e 30 34 2e 30 20 0a 00 94
>
> ----------------
>
> Block 0, Base EDID:
>   EDID Structure Version & Revision: 1.4
>   Vendor & Product Identification:
>     Manufacturer: AUO
>     Model: 16476
>     Made in: 2015
>   Basic Display Parameters & Features:
>     Digital display
>     Bits per primary color channel: 6
>     DisplayPort interface
>     Maximum image size: 26 cm x 14 cm
>     Gamma: 2.20
>     Supported color formats: RGB 4:4:4
>     First detailed timing includes the native pixel format and
> preferred refresh rate
>   Color Characteristics:
>     Red  : 0.5839, 0.3330
>     Green: 0.3378, 0.5712
>     Blue : 0.1582, 0.1328
>     White: 0.3134, 0.3291
>   Established Timings I & II: none
>   Standard Timings: none
>   Detailed Timing Descriptors:
>     DTD 1:  1366x768    60.059824 Hz 683:384   47.688 kHz
> 76.300000 MHz (256 mm x 144 mm)
>                  Hfront   48 Hsync  32 Hback  154 Hpol N
>                  Vfront    4 Vsync   6 Vback   16 Vpol N
>     DTD 2:  1366x768    48.016373 Hz 683:384   38.125 kHz
> 61.000000 MHz (256 mm x 144 mm)
>                  Hfront   48 Hsync  32 Hback  154 Hpol N
>                  Vfront    4 Vsync   6 Vback   16 Vpol N
>     Alphanumeric Data String: 'AUO'
>     Alphanumeric Data String: 'B116XAN04.0 '
> Checksum: 0x94
>
> In this example, Descriptors can also be used to distinguish. But it's
> possible that the name field is also reused by mistake, for the same
> reason as model id is reused.

Thank you! Let's settle the discussion at the cover letter.

>
>
> > >
> > > Hsin-Yi Wang (2):
> > >   drm_edid: Add a function to get EDID base block
> > >   drm/panel: panel-edp: Match with panel hash for overridden modes
> > >
> > >  drivers/gpu/drm/drm_edid.c        | 55 +++++++++++++++-------------
> > >  drivers/gpu/drm/panel/panel-edp.c | 60 ++++++++++++++++++++++++++---=
--
> > >  include/drm/drm_edid.h            |  3 +-
> > >  3 files changed, 84 insertions(+), 34 deletions(-)
> > >
> > > --
> > > 2.44.0.rc0.258.g7320e95886-goog
> > >
> >
> >
> > --
> > With best wishes
> > Dmitry



--=20
With best wishes
Dmitry
