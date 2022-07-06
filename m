Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F958568986
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jul 2022 15:32:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2896C11B746;
	Wed,  6 Jul 2022 13:32:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51A8111B746
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Jul 2022 13:32:27 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id q6so27079368eji.13
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Jul 2022 06:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=g9HAQqgyURl+ouDivemUY+dX9J4cm+NptrUO4Hcj5d0=;
 b=X3f68EZH3kHW3/Oti5BLp7t4zE4yxsB6ARRjDmSxjn2rnOllpcF1XwJrGveX+G+KWa
 EcNTY+3Gq6jcX8Q193xVg9gUFB9Lk6oEknHMyAvbJxeuvAXQQrJVF94pvpXCui0NVzT7
 Kg35RjLlCgGsDenGpsodyu2Ye1sPTqDdaZ7/g3KbYCAXNUU/Q+dthxcMySgFDkqj+kDr
 5HJqNIqQFS+FmHNKaRd8FK7C3HbHhnb7rihCyMqQPdJbQCxwc3zkC1H83naTViFPhIH0
 Wh6gL2nQJZShMTTXow3f/qKmfmIeS4ajfFxUl5ATIzyu3fXU4I2klc0OH+6lXTlVF8M6
 BMPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=g9HAQqgyURl+ouDivemUY+dX9J4cm+NptrUO4Hcj5d0=;
 b=3ceboJ7Isb6jZet09HSTREGJNomgOXkAVyWNxoWJa9flRNpXHcdPV5TZWDuvWRAiCn
 a3H0AXqTMkcHDq7cP4K3Dnthq4WAMAfV0bC01AVrACEjvEhkI7KxKLa+Q31mzQzzrwCW
 TiSZNF45Y8xCWH2bk8KXOme/PbEEtPubXR0ve89jgDOf69XD5xoDqXGOJdpEsxuIhrFc
 nsxua0cH2naYCYkmzTP5gtXtZxmuTw4HfZJEZYBou63lJobdZxWy6JssujQLutY074tN
 pHp8kZj1QrI/jLig3VsyFJBUob3MbECuKx73uRqix0rMS1GrNTT+9XY1oRmINvEwSgCg
 gVmw==
X-Gm-Message-State: AJIora+TfBxOq02nlZzdWr2pzC4DRDhiDKsUPk768wCIlL67rrL6lJ/X
 eaaYrBmHzkU82uOSf6xAy10I4H1WMlFFGzGzWYiDMw==
X-Google-Smtp-Source: AGRyM1syN81lQb5Rp8VUWsYGZBEDJSzvu5nQlPt3ClUfqyFJNEQYZSTgQYa5iSn7Rc6pbgj/g97Cv6h6DewNlv+s9Xc=
X-Received: by 2002:a17:906:8459:b0:72a:ee63:ca58 with SMTP id
 e25-20020a170906845900b0072aee63ca58mr6644034ejy.487.1657114345772; Wed, 06
 Jul 2022 06:32:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220630174031.92354-1-marex@denx.de>
In-Reply-To: <20220630174031.92354-1-marex@denx.de>
From: Robert Foss <robert.foss@linaro.org>
Date: Wed, 6 Jul 2022 15:32:14 +0200
Message-ID: <CAG3jFytfqkgg+20-bcpB=6sHCo42To0r+Vgi0FvTjwvGu55VxA@mail.gmail.com>
Subject: Re: [PATCH] drm: bridge: ldb: Drop DE flip from Freescale i.MX8MP LDB
 bridge
To: Marek Vasut <marex@denx.de>
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
Cc: Peng Fan <peng.fan@nxp.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>,
 Robby Cai <robby.cai@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 30 Jun 2022 at 19:40, Marek Vasut <marex@denx.de> wrote:
>
> The DE inversion is implemented in LCDIFv3 driver and is no longer
> needed in the LDB bridge which does not invert the DE signal. Drop
> the inversion.
>
> Fixes: 463db5c2ed4ae ("drm: bridge: ldb: Implement simple Freescale i.MX8MP LDB bridge")
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Maxime Ripard <maxime@cerno.tech>
> Cc: Peng Fan <peng.fan@nxp.com>
> Cc: Robby Cai <robby.cai@nxp.com>
> Cc: Robert Foss <robert.foss@linaro.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> To: dri-devel@lists.freedesktop.org
> ---
>  drivers/gpu/drm/bridge/fsl-ldb.c | 17 -----------------
>  1 file changed, 17 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/fsl-ldb.c b/drivers/gpu/drm/bridge/fsl-ldb.c
> index b2675c769a550..10077d4aed358 100644
> --- a/drivers/gpu/drm/bridge/fsl-ldb.c
> +++ b/drivers/gpu/drm/bridge/fsl-ldb.c
> @@ -74,22 +74,6 @@ static int fsl_ldb_attach(struct drm_bridge *bridge,
>                                  bridge, flags);
>  }
>
> -static int fsl_ldb_atomic_check(struct drm_bridge *bridge,
> -                               struct drm_bridge_state *bridge_state,
> -                               struct drm_crtc_state *crtc_state,
> -                               struct drm_connector_state *conn_state)
> -{
> -       /* Invert DE signal polarity. */
> -       bridge_state->input_bus_cfg.flags &= ~(DRM_BUS_FLAG_DE_LOW |
> -                                              DRM_BUS_FLAG_DE_HIGH);
> -       if (bridge_state->output_bus_cfg.flags & DRM_BUS_FLAG_DE_LOW)
> -               bridge_state->input_bus_cfg.flags |= DRM_BUS_FLAG_DE_HIGH;
> -       else if (bridge_state->output_bus_cfg.flags & DRM_BUS_FLAG_DE_HIGH)
> -               bridge_state->input_bus_cfg.flags |= DRM_BUS_FLAG_DE_LOW;
> -
> -       return 0;
> -}
> -
>  static void fsl_ldb_atomic_enable(struct drm_bridge *bridge,
>                                   struct drm_bridge_state *old_bridge_state)
>  {
> @@ -241,7 +225,6 @@ fsl_ldb_mode_valid(struct drm_bridge *bridge,
>
>  static const struct drm_bridge_funcs funcs = {
>         .attach = fsl_ldb_attach,
> -       .atomic_check = fsl_ldb_atomic_check,
>         .atomic_enable = fsl_ldb_atomic_enable,
>         .atomic_disable = fsl_ldb_atomic_disable,
>         .atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
> --
> 2.35.1
>

Reviewed-by: Robert Foss <robert.foss@linaro.org>

Applied to drm-misc-next.
