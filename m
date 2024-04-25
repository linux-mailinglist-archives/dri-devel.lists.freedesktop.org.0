Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D618B29D4
	for <lists+dri-devel@lfdr.de>; Thu, 25 Apr 2024 22:30:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E68311A8AE;
	Thu, 25 Apr 2024 20:30:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mpByIFzd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6318311A8AE
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Apr 2024 20:30:15 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id
 41be03b00d2f7-53fbf2c42bfso972436a12.3
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Apr 2024 13:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714077015; x=1714681815; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9PzTk/0GTrpkXInH9ZwioMKJlS+GbN8syGyhHAUyME8=;
 b=mpByIFzdOsQLhekloBuCnh//bkIGLxnVQ6sNaIzHnuSA+JBt+gmCcu4P/ezM2Tfl1e
 +Aj7ZORqmPrRAbuYba/BG4CckCbvdjyHFk9zFeRnrZ8TnOjut9g/akFMwK429zyL60BS
 qTELSvb/E2h4wsjIr/96UigUjrukn3jgkbQp0/teWQfVxZH/IDVR7uQsj4ZM0PYJTX08
 V+OgOfiitjLwFYe2IzLd70K4uKzWMHrRvvZStnyuqpL38kZGwYlEPKxb7H2KHiuW09zx
 PB843rUhpTU90vHJ/RbnY2PjSL+n19Iy7u8RGvvI8pTD305p54FDHlxAS0z8GKaWnFj1
 0d4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714077015; x=1714681815;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9PzTk/0GTrpkXInH9ZwioMKJlS+GbN8syGyhHAUyME8=;
 b=WrwwLCmv+Q/9+PPaoyju0mv3BSI6mCUU6IOi07d7eOSA2wN2n0OczD38RAKs/hrOB9
 nOcVSROAujKoJBJAHQtcqVSvXRb6eu3WeI4Fenxj9Ir0VFiJep1R4+LjBt0Rfvli2ngu
 SPj94zE/++zopw4Tp5QIgru8wENTv3ydV9vqQUjwRxBliNRH7hQ+dfpkoGzcoKpyqirA
 lM3IaVfcuwn33X6a/jrKgLJZxUk+mSkWJx1e03VSz8QhzniqAVcwCwrxQt17KlKL1N8u
 jdTUkrcQjRYtIWn0NYh4Eg+nWKKqYVuO7GIiMm/p2HxwDGXjS2mt2jSIzpq4mbAduoPd
 Z7VA==
X-Gm-Message-State: AOJu0YxRCAPss4HFe1XenE8kdn16x+O2shfxxpFVVobtOyMVt9fQxnfh
 5pPxyinUQcR9PWrtXQ0EO+O6aSbKSRpOOiHdmh2RLQ8KUCn3wnNlH0oGKx/4L6x9TSOEGqRR92k
 nFTSCwmyVqkqd25H9/YoSqeH50MI=
X-Google-Smtp-Source: AGHT+IGuNAaAcfQIDo2pmo/7gSrHvac1vDktSrMNsPTwLAjcvb2ez0/759mAyT0aMzMQCabBlxlT/NjCU+DIoIaVvWU=
X-Received: by 2002:a17:90a:c292:b0:2ae:814f:43fa with SMTP id
 f18-20020a17090ac29200b002ae814f43famr666154pjt.46.1714077014367; Thu, 25 Apr
 2024 13:30:14 -0700 (PDT)
MIME-Version: 1.0
References: <20240211230931.188194-1-aford173@gmail.com>
 <CGME20240211230945eucas1p1863deb244ef4fdc68825ff01d082e270@eucas1p1.samsung.com>
 <20240211230931.188194-2-aford173@gmail.com>
 <6fcfe1bb-a1e9-4d7c-aff7-e572bcdf5d31@samsung.com>
In-Reply-To: <6fcfe1bb-a1e9-4d7c-aff7-e572bcdf5d31@samsung.com>
From: Adam Ford <aford173@gmail.com>
Date: Thu, 25 Apr 2024 15:30:02 -0500
Message-ID: <CAHCN7xJRgW4Y3YML+tToPw1TgA3o158XCEUcb9p-S+nvDWgzRQ@mail.gmail.com>
Subject: Re: [PATCH V2 2/2] drm/bridge: samsung-dsim: Fix porch calcalcuation
 rounding
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: dri-devel@lists.freedesktop.org, marex@denx.de, aford@beaconembedded.com, 
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Marco Felsch <m.felsch@pengutronix.de>,
 Michael Tretter <m.tretter@pengutronix.de>, linux-kernel@vger.kernel.org
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

On Thu, Apr 25, 2024 at 4:19=E2=80=AFAM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
>
> On 12.02.2024 00:09, Adam Ford wrote:
> > When using video sync pulses, the HFP, HBP, and HSA are divided between
> > the available lanes if there is more than one lane.  For certain
> > timings and lane configurations, the HFP may not be evenly divisible.
> > If the HFP is rounded down, it ends up being too small which can cause
> > some monitors to not sync properly. In these instances, adjust htotal
> > and hsync to round the HFP up, and recalculate the htotal.
> >
> > Tested-by: Frieder Schrempf <frieder.schrempf@kontron.de> # Kontron BL =
i.MX8MM with HDMI monitor
> > Signed-off-by: Adam Ford <aford173@gmail.com>
>
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>

Thank you very much for testing!

>
> > ---
> > V2:  No changes
> >
> > diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/br=
idge/samsung-dsim.c
> > index 8476650c477c..52939211fe93 100644
> > --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> > +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> > @@ -1606,6 +1606,27 @@ static int samsung_dsim_atomic_check(struct drm_=
bridge *bridge,
> >               adjusted_mode->flags |=3D (DRM_MODE_FLAG_PHSYNC | DRM_MOD=
E_FLAG_PVSYNC);
> >       }
> >
> > +     /*
> > +      * When using video sync pulses, the HFP, HBP, and HSA are divide=
d between
> > +      * the available lanes if there is more than one lane.  For certa=
in
> > +      * timings and lane configurations, the HFP may not be evenly div=
isible.
> > +      * If the HFP is rounded down, it ends up being too small which c=
an cause
> > +      * some monitors to not sync properly. In these instances, adjust=
 htotal
> > +      * and hsync to round the HFP up, and recalculate the htotal. Thr=
ough trial
> > +      * and error, it appears that the HBP and HSA do not appearto nee=
d the same
> > +      * correction that HFP does.
> > +      */
> > +     if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE && dsi->lane=
s > 1) {

Frieder  &  Marek S,

Marek V is proposing we eliminate the check against the flags and do
it unconditionally.  If I send you both a different patch, would you
be willing to try them on your platforms?  I don't want to risk
breaking a board.
I used the check above from the NXP downstream kernel, so it felt
safe, but I am not as familiar with the different DSI modes, so I am
not sure what the impact would be if this read:

 if (dsi->lanes > 1) {

Does anyone else have an opinion on this?
> > +             int hfp =3D adjusted_mode->hsync_start - adjusted_mode->h=
display;
> > +             int remainder =3D hfp % dsi->lanes;
> > +
> > +             if (remainder) {
> > +                     adjusted_mode->hsync_start +=3D remainder;
> > +                     adjusted_mode->hsync_end   +=3D remainder;
> > +                     adjusted_mode->htotal      +=3D remainder;
> > +             }
> > +     }
> > +
> >       return 0;
> >   }
> >
>
> Best regards
> --
> Marek Szyprowski, PhD
> Samsung R&D Institute Poland
>
