Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 42EC41E4E17
	for <lists+dri-devel@lfdr.de>; Wed, 27 May 2020 21:25:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9D7F6E3A6;
	Wed, 27 May 2020 19:24:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FAFF6E3A6
 for <dri-devel@lists.freedesktop.org>; Wed, 27 May 2020 19:24:56 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id b6so30395254ljj.1
 for <dri-devel@lists.freedesktop.org>; Wed, 27 May 2020 12:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anholt-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=B06LJB5h/zgyW4gA7PYFxNZx20JgVf522YB+3F5h4TA=;
 b=u+9b6a0UuzqNEdKrRRYp74xaFel684WNim59ka+OYrYbmLKL+H/nprkX7vFkVdiCUa
 +O86fHKLZqw/5tvWP3hqw33ak6tHjf4NSI1j5fKipCDJdZkSuCUv1XCSLH8Tfb6vMsFa
 +KsDYhqcUq9p3f4rUyvTwRp9v9Amptoi+GEESpmqsgMwwWNwe5Zu3KFM4nYbIyauEQQW
 Usd8sT8LWVX1IsdfL24D+BCSQx7pVofPBfOZl09tfusTjauehsiP52sutkoRRUjTp+ui
 nESEZOg8iF63hA/Zd9X5L9zSoARxejFqZOUOXEg2msmKduDEaDnFqQPCGDpRoIWyLiqu
 vDtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=B06LJB5h/zgyW4gA7PYFxNZx20JgVf522YB+3F5h4TA=;
 b=jeYbjaIQjIlcne/ILFwiKOOTTFp/4a+TwKJ8XPgCHg3LDyvKkfHpKRkDY518bYhHJG
 3IY+i++OOvHFKSb/97D0mmwV9saclUYiDm4R7Z/pgQme88N3D2+Q+8jaf0rBB2S7n41K
 tAEjD69ioyee+6n9zbo8+sXub4LwR7vcNWP8YNyHhPyaVZ4WCUq0qoLQ3/4T8tbYpgHP
 BS7R6r4KaApEKhTI75KYb419LVxPitvaZ5NQQ+/FM+RqQ6vfk/ip9fPWFj+tBJAMkXuG
 1QCrHbyQbeGckT8k0iwNewxr8ZhTzHQUwwnEEzpvoNEPcqlfXrwfnuhOE8cabyQXcbnb
 d7DA==
X-Gm-Message-State: AOAM530cR0OYuqwI8LnQCybStlM2LDr8Nodob6FIfTubF0UlV21UfvGx
 G4aboWzxVJTxaEvreA8anoPJDTzmRn14sSosZiTt2Q==
X-Google-Smtp-Source: ABdhPJwwWyamvPVDkwG/N5cdNWA1k5bhKyYHl2B8H32SDSArpyPTtBHqXMrv/ns/v1MgZiZHuBPsS7jNbWkMbQJkOuA=
X-Received: by 2002:a2e:b0ec:: with SMTP id h12mr3493066ljl.269.1590607494583; 
 Wed, 27 May 2020 12:24:54 -0700 (PDT)
MIME-Version: 1.0
References: <cover.aaf2100bd7da4609f8bcb8216247d4b4e4379639.1590594512.git-series.maxime@cerno.tech>
 <eb489952ba212a84dbe3d369371c0ee75b9a2d3e.1590594512.git-series.maxime@cerno.tech>
In-Reply-To: <eb489952ba212a84dbe3d369371c0ee75b9a2d3e.1590594512.git-series.maxime@cerno.tech>
From: Eric Anholt <eric@anholt.net>
Date: Wed, 27 May 2020 12:24:43 -0700
Message-ID: <CADaigPXm-ap=FxVV0_BPJmoL7A2cteVcD+EU3i954ParbyP7wA@mail.gmail.com>
Subject: Re: [PATCH v3 059/105] drm/vc4: crtc: Add BCM2711 pixelvalves
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 DRI Development <dri-devel@lists.freedesktop.org>,
 bcm-kernel-feedback-list@broadcom.com,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 27, 2020 at 8:50 AM Maxime Ripard <maxime@cerno.tech> wrote:
>
> The BCM2711 has 5 pixelvalves, so now that our driver is ready, let's add
> support for them.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  drivers/gpu/drm/vc4/vc4_crtc.c | 84 ++++++++++++++++++++++++++++++++++-
>  drivers/gpu/drm/vc4/vc4_regs.h |  6 +++-
>  2 files changed, 88 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
> index 9efd7cb25590..a577ed8f929f 100644
> --- a/drivers/gpu/drm/vc4/vc4_crtc.c
> +++ b/drivers/gpu/drm/vc4/vc4_crtc.c
> @@ -229,6 +229,13 @@ static u32 vc4_get_fifo_full_level(struct vc4_crtc *vc4_crtc, u32 format)
>         case PV_CONTROL_FORMAT_24:
>         case PV_CONTROL_FORMAT_DSIV_24:
>         default:
> +               /*
> +                * For some reason, the pixelvalve4 doesn't work with
> +                * the usual formula and will only work with 32.
> +                */
> +               if (vc4_crtc->data->hvs_output == 5)
> +                       return 32;
> +
>                 return fifo_len_bytes - 3 * HVS_FIFO_LATENCY_PIX;
>         }
>  }
> @@ -237,9 +244,14 @@ static u32 vc4_crtc_get_fifo_full_level_bits(struct vc4_crtc *vc4_crtc,
>                                              u32 format)
>  {
>         u32 level = vc4_get_fifo_full_level(vc4_crtc, format);
> +       u32 ret = 0;
>
> -       return VC4_SET_FIELD(level & 0x3f,
> -                            PV_CONTROL_FIFO_LEVEL);
> +       if (level > 0x3f)
> +               ret |= VC4_SET_FIELD((level >> 6) & 0x3,
> +                                    PV5_CONTROL_FIFO_LEVEL_HIGH);
> +

I would drop the conditional here (ORing in zero is fine), and also
the & 3 because it would be good to get a warning if you picked a fifo
full level that doesn't fit in the field.

> +       return ret | VC4_SET_FIELD(level & 0x3f,
> +                                  PV_CONTROL_FIFO_LEVEL);
>  }
>
>  /*
> @@ -277,6 +289,8 @@ static void vc4_crtc_pixelvalve_reset(struct drm_crtc *crtc)
>
>  static void vc4_crtc_config_pv(struct drm_crtc *crtc)
>  {
> +       struct drm_device *dev = crtc->dev;
> +       struct vc4_dev *vc4 = to_vc4_dev(dev);
>         struct drm_encoder *encoder = vc4_get_crtc_encoder(crtc);
>         struct vc4_encoder *vc4_encoder = to_vc4_encoder(encoder);
>         struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
> @@ -356,6 +370,10 @@ static void vc4_crtc_config_pv(struct drm_crtc *crtc)
>         if (is_dsi)
>                 CRTC_WRITE(PV_HACT_ACT, mode->hdisplay * pixel_rep);
>
> +       if (vc4->hvs->hvs5)
> +               CRTC_WRITE(PV_MUX_CFG,
> +                          VC4_SET_FIELD(8, PV_MUX_CFG_RGB_PIXEL_MUX_MODE));

Can we get some #defines in the reg header instead of a magic value?

Other than that, r-b.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
