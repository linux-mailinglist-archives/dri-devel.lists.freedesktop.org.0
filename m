Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B055D8ACC7F
	for <lists+dri-devel@lfdr.de>; Mon, 22 Apr 2024 14:09:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 178D010F5CE;
	Mon, 22 Apr 2024 12:09:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WIp7A/VY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8D1310F5CE
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Apr 2024 12:09:26 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id
 41be03b00d2f7-5f7fc45fe1bso2171874a12.0
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Apr 2024 05:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713787766; x=1714392566; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nSYUfPUp3aHKYRSJHW3nsNdjnok3doEHFDPHNf1mUD8=;
 b=WIp7A/VY3oRDzEPKNU3bplQZo2FZQUtc31TxWZG5/ry+tYJUiiEe4k2GbwnhfnEkfb
 zvMi3D5C8ZxJne8Qxuw8FF8UrirrTTheUgqA4M+UTYF5ytpCShixE3V4Nx+25G6lt8Zu
 W+FskxrOWbWIzNJJhwwijL4NQtLRCAJ6a8T/mlITKvfYCIRXxN6ZozDNnNM60yCkzIlw
 3bKf/EE7ikzVDeqS3kKFzKUasRvxyn1hXiy00GyLjZz4coRIcL/O3y5YvCo4SPdtorDx
 lVz40tNRjPhctrrM8xuqv1HmY2A3bn05G+hTkhQ3xNbzz0+5jR2lRpYhdmqZS5aQDN5j
 BiJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713787766; x=1714392566;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nSYUfPUp3aHKYRSJHW3nsNdjnok3doEHFDPHNf1mUD8=;
 b=u/KOAGRUO0ky/ACjvp2NYoTh31OIrAP4xGLQXLnplqpULEAOIu6pmpTtr0SDSKkz8j
 G31uZY1XJ1fIJaA7NNgKYdvYTktG5pDWQ+uiSoKUMn1aKVdgMuISopNIAJYiYUu0LBPc
 WRG6P92Cn0N7z2CymGL1w+DjYNiND6uWk7+r7EoAIFw1D6s+nF7Bp/4KFQBX9hFrEQMh
 Y0wqZulOYeQtv7sqYoamKNkOKsV2ohhJvLOc0WAWsDSy+RzAEPVGBxbjRuGUhUqZk6MV
 XTARyuDX8LEw4dRe/dzNdBEO7gLo1f1g6aM1lHQ6QP0o8ITiFMvvmg6UrDjpOYrSbxGH
 Wi3Q==
X-Gm-Message-State: AOJu0YyXB6NBGUk2enSdIbwVEAtXOyZIcluNpUwvswTRRVb4dLb9AXgs
 ZxLakN8CkBHTt/hXekOPbuX9IX5cteO0MOsiG8M4LVlujY5sB3S9Pz7ZsnusqpFYKUGqAcwhBq3
 VMSEfUa+mq+eyBmhEnSIAAZlJ0TU=
X-Google-Smtp-Source: AGHT+IFConWUkZnbQRk4mS4bFa6lsrcKDBb9vKgKVpJXgVDjWzDvLQf0IWRNOLuTc1NoKmLWbeSfic7yMeiQEHlbacg=
X-Received: by 2002:a17:90b:384d:b0:2ae:5bdb:1960 with SMTP id
 nl13-20020a17090b384d00b002ae5bdb1960mr550537pjb.3.1713787765992; Mon, 22 Apr
 2024 05:09:25 -0700 (PDT)
MIME-Version: 1.0
References: <20240211230931.188194-1-aford173@gmail.com>
 <20240211230931.188194-2-aford173@gmail.com>
 <6111fe04-4ecb-428e-9a0c-dc02cadfe3e7@denx.de>
In-Reply-To: <6111fe04-4ecb-428e-9a0c-dc02cadfe3e7@denx.de>
From: Adam Ford <aford173@gmail.com>
Date: Mon, 22 Apr 2024 07:09:13 -0500
Message-ID: <CAHCN7x+DwSSabhGYZ1dnZzwRe+BJfz2H-AXbxjUQWytrq3OMpQ@mail.gmail.com>
Subject: Re: [PATCH V2 2/2] drm/bridge: samsung-dsim: Fix porch calcalcuation
 rounding
To: Marek Vasut <marex@denx.de>
Cc: dri-devel@lists.freedesktop.org, aford@beaconembedded.com, 
 Frieder Schrempf <frieder.schrempf@kontron.de>, Inki Dae <inki.dae@samsung.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
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

On Sun, Apr 21, 2024 at 9:36=E2=80=AFAM Marek Vasut <marex@denx.de> wrote:
>
> On 2/12/24 12:09 AM, Adam Ford wrote:
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
>
> Does this also apply to mode with sync events (I suspect it does), so
> the condition here should likely be if (!...burst mode) , right ?

Thanks for the review!

I was only able to test it with the DSI->ADV6535 bridge, and I'll
admit I don't know a lot about DSI interface since I don't have a copy
of the spec to read.

Are you proposing this should be:

 if (!(dsi->mode_flags & MIPI_DSI_MODE_VIDEO_BURST) && dsi->lanes > 1) {

I just want to make sure I understand what you're requesting.

thanks

adam
