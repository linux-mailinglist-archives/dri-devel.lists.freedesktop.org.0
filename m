Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4461E8A6A7A
	for <lists+dri-devel@lfdr.de>; Tue, 16 Apr 2024 14:15:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76B15112C14;
	Tue, 16 Apr 2024 12:15:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="L4EQqAI3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2175A112C14
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Apr 2024 12:15:24 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id
 41be03b00d2f7-5d42e7ab8a9so2195610a12.3
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Apr 2024 05:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713269723; x=1713874523; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wlWFv7cOcND2wnTqRNzMBr2pMz9vnQZWAIMjfeiHzPY=;
 b=L4EQqAI34Dnv6i0Fh61Vk3UfaQr/HnulJ6h3SoqfV+5/QNNNR8uQ+Bt1wxEp0cBL1P
 IaBLRawmjXuddcy1lapJC0LBIlLCIck4CPLU7FHVwpqbCZd47w/6MKZd26z3YBKEgchr
 Q0rv/2QiOseocnQzgLtnT9jpl4pHKFNdlFs53ZUP1E94U1/64xzD6G/PGt3o5uMJAlG9
 kHi4d1ouI3lhnfuCntD7i3PEaRz+gWQLXuuRwa16y+POnzE4ZVsq5xajGkWYjM6Bwoe7
 ac3uhDcL0b+OrKcA3lxoK/zk+rHHdfVfwPYRqIODMO8MDFAMZsyWEq1GETPeuMDzLo0X
 yWmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713269723; x=1713874523;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wlWFv7cOcND2wnTqRNzMBr2pMz9vnQZWAIMjfeiHzPY=;
 b=bMPF9+5LSd+uZf16grhN3/HAM3g0QgRr1lZY2fy/kp6D8w2RWvrsLcEEzSkUN92tIV
 SqupZVEpnyxivVgttCTbWr2ElP8KxRwioQB6SjjDSKt7NvC3m1+mFFnbRxWFUcXd8tQP
 Ui5uwFYDu1lZ+V/ZgkkgHNoawS4dhxpUdRMUIDsGXBkqjlKSgNMDhbmOT5CgYWu2k+8x
 fkZtL4AzH7sLDvyX0R1WaO4KQ7aPQMWaEVsHaA2qkLqbUVK5MF5lWV35d54iBhwalhtj
 ww9Xm0+jvYjUrL6gvDw4V8+nhQPJLIKm9sUaHncpqi9qi9+06gusFyNNyHRdrQ9pL90r
 Wt/g==
X-Gm-Message-State: AOJu0Yw1GlIULlTsFELDpAbb5zyYv9QldcIHj7EJ034MD3F40nn6u6s1
 dtuSyPeK58Ev1xGHbPNmHLl+iyBThQe7sCUskahDf8fEaNA/DaUPaQuC1b6v2kFcgch4tlYvN3D
 S6csp+h7rL91HXlwCUnwtHlEhIpnNKiRF
X-Google-Smtp-Source: AGHT+IG9hOFw3v1uT3o6QNr5qi+vZ+K75rWTQ53HPPqtkAcjF7Uht+4xETvra13YCmgVQ5ljS387JCgjPcZmuOU008s=
X-Received: by 2002:a17:90b:4b48:b0:2a2:227a:50fc with SMTP id
 mi8-20020a17090b4b4800b002a2227a50fcmr9557932pjb.41.1713269722636; Tue, 16
 Apr 2024 05:15:22 -0700 (PDT)
MIME-Version: 1.0
References: <20240211230931.188194-1-aford173@gmail.com>
 <20240211230931.188194-2-aford173@gmail.com>
In-Reply-To: <20240211230931.188194-2-aford173@gmail.com>
From: Adam Ford <aford173@gmail.com>
Date: Tue, 16 Apr 2024 07:15:10 -0500
Message-ID: <CAHCN7x+9YUj9xW-ytUqPeQBdwaRE0T5VVJyiL9cTss-EyihK8Q@mail.gmail.com>
Subject: Re: [PATCH V2 2/2] drm/bridge: samsung-dsim: Fix porch calcalcuation
 rounding
To: dri-devel@lists.freedesktop.org
Cc: marex@denx.de, aford@beaconembedded.com, 
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

On Sun, Feb 11, 2024 at 5:09=E2=80=AFPM Adam Ford <aford173@gmail.com> wrot=
e:
>
> When using video sync pulses, the HFP, HBP, and HSA are divided between
> the available lanes if there is more than one lane.  For certain
> timings and lane configurations, the HFP may not be evenly divisible.
> If the HFP is rounded down, it ends up being too small which can cause
> some monitors to not sync properly. In these instances, adjust htotal
> and hsync to round the HFP up, and recalculate the htotal.
>

Marek V and Marek S,

Would either of you be willing to test that this doesn't break your
applications?

thanks

adam

> Tested-by: Frieder Schrempf <frieder.schrempf@kontron.de> # Kontron BL i.=
MX8MM with HDMI monitor
> Signed-off-by: Adam Ford <aford173@gmail.com>
> ---
> V2:  No changes
>
> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/brid=
ge/samsung-dsim.c
> index 8476650c477c..52939211fe93 100644
> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> @@ -1606,6 +1606,27 @@ static int samsung_dsim_atomic_check(struct drm_br=
idge *bridge,
>                 adjusted_mode->flags |=3D (DRM_MODE_FLAG_PHSYNC | DRM_MOD=
E_FLAG_PVSYNC);
>         }
>
> +       /*
> +        * When using video sync pulses, the HFP, HBP, and HSA are divide=
d between
> +        * the available lanes if there is more than one lane.  For certa=
in
> +        * timings and lane configurations, the HFP may not be evenly div=
isible.
> +        * If the HFP is rounded down, it ends up being too small which c=
an cause
> +        * some monitors to not sync properly. In these instances, adjust=
 htotal
> +        * and hsync to round the HFP up, and recalculate the htotal. Thr=
ough trial
> +        * and error, it appears that the HBP and HSA do not appearto nee=
d the same
> +        * correction that HFP does.
> +        */
> +       if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE && dsi->lane=
s > 1) {
> +               int hfp =3D adjusted_mode->hsync_start - adjusted_mode->h=
display;
> +               int remainder =3D hfp % dsi->lanes;
> +
> +               if (remainder) {
> +                       adjusted_mode->hsync_start +=3D remainder;
> +                       adjusted_mode->hsync_end   +=3D remainder;
> +                       adjusted_mode->htotal      +=3D remainder;
> +               }
> +       }
> +
>         return 0;
>  }
>
> --
> 2.43.0
>
