Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F39C8AD618C
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jun 2025 23:39:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03E3D10E73A;
	Wed, 11 Jun 2025 21:39:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="lFjxWUJ3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F4A510E73B
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jun 2025 21:38:59 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-234bfe37cccso4360095ad.0
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jun 2025 14:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1749677936; x=1750282736;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dWt7b+ImqtoWAiZlh6Cce7mreaqBJVy9uH7u+QDcU9Q=;
 b=lFjxWUJ3LlLP8HZ2E+wqOwwXKkFnqQ1VrnHjEX9DSgFU9YIwCNnR05aIyNWu+VMVpC
 +kENaGK1vIbL7o35f2GBYENOXVk0goRSj+kQEvDzlEDggR+GOh9eb9vd6HenKRnE5DKj
 vXkOVrWRNRbPvsWt100JyjCmdBuEyZCIdLfXs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749677936; x=1750282736;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dWt7b+ImqtoWAiZlh6Cce7mreaqBJVy9uH7u+QDcU9Q=;
 b=fADEyFigM+rT8G8iDeTOzyTKt3d3GVnyd5mlmtVpAolevQeNHR6fw/qBMeJ90LgBof
 WnnpkZ2x+AyD6OK43YhD8EQQzgUoVT+XS2Ue7MrnApQ71ZniioMna41dSAT8rLrv6Stj
 hn6AWqlMk2tbeZWDeUR5gxThVCSR7+cs6BpL4X+WUgaGQ7R1an+g7fIbQbNROTyytRJn
 7/qx7w8utjN0ujopNZk4uS6u6vnFTucRdt/s82TZzMMMjdpKfJF5R43JOlIgrhHfG2Ij
 /cFZaMaMwy2oMyMZJL0jdfVjYNyw8ne8bSwZNhcKHYyt31GuPgWZjnO1X6hR/y15l1K1
 vPyQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXhlnvH6Sj/JcjB3nc9RpYkWeBe25NpPb6bNJe3lyi+y6iuixsgUvohY1GwczZdwv1IO/6SR9fpKbM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywy8ElTXFgE2Zw3eqH4gPggoY3kyFSqnK2uPgCm6NJ33nLC14WG
 4hZdxR+wqqIf5nGFqzXESliNESs/5+XQlrljOuH55T/EsoDXJps/Oz+wAs0To9F5qm3aSAirj0g
 D7Q8=
X-Gm-Gg: ASbGncuHsScFT/ZqmZ/BcDcG8KNJIfI4giVMqKs5mo+GU5EzHeA6CyzX2E/7eyERil2
 wcCIadlTXGHgR/x93W7mz/N9b0AxUUp2DgfTHmKGm1+y90B5RC64xW3UcideEu5vTY89Dn6TCn4
 RffoWALKb2htOZ93qBgLMIHXlGx6+mQ6m9qFNNbkE8F3+0aO1zg51ubf43d2pigvCPKFj85SDaU
 QKyU3A8IRSBFG4D+u0F1c6BkLMLSvFn+2IuJ2ft3iekgJQoHAkbpd7NHkVEjijfBeZWu5WzsMux
 33clOwa6pPageOBQfknSqgD9DdjUoO5NE8AjN2UUClyeC9zJIBAdPpmbcLqFY1rw/QST7TppBI8
 kaBu1gKFcRafhi7t+K9Rdxqbk9Q==
X-Google-Smtp-Source: AGHT+IGOd6z4Pgzf5NAoUZi3X5HAapl6z71xsMqJ8PjXRbmrex23v57cJhzr933UX2HL24utpwRVsA==
X-Received: by 2002:a17:903:1a8c:b0:22f:c19c:810c with SMTP id
 d9443c01a7336-2364cabb390mr13280855ad.51.1749677936410; 
 Wed, 11 Jun 2025 14:38:56 -0700 (PDT)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com.
 [209.85.216.47]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2364e7171b5sm344505ad.194.2025.06.11.14.38.56
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jun 2025 14:38:56 -0700 (PDT)
Received: by mail-pj1-f47.google.com with SMTP id
 98e67ed59e1d1-3122368d7cfso334320a91.1
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jun 2025 14:38:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWJtJ7l9y1SCSJSUkD/6d2oVFhKGa+4ZH5Gv+WqGG9EkHCkDYiLiSVPaWy45iIC919Wzx3ZaTqwL64=@lists.freedesktop.org
X-Received: by 2002:a17:90b:3d87:b0:313:2adc:b4c4 with SMTP id
 98e67ed59e1d1-313bfbdb37bmr1609467a91.24.1749677935135; Wed, 11 Jun 2025
 14:38:55 -0700 (PDT)
MIME-Version: 1.0
References: <20250611052947.5776-1-j-choudhary@ti.com>
In-Reply-To: <20250611052947.5776-1-j-choudhary@ti.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 11 Jun 2025 14:38:43 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WvH73d78De3PrbiG7b6OaS_BysGtxQ=mJTj4z-h0LYWA@mail.gmail.com>
X-Gm-Features: AX0GCFt8rakO8gJRiwfAIPFbP6QcoyCGjlAjSHLBCdKw389Bce6LPh81MDUm4uI
Message-ID: <CAD=FV=WvH73d78De3PrbiG7b6OaS_BysGtxQ=mJTj4z-h0LYWA@mail.gmail.com>
Subject: Re: [PATCH v4] drm/bridge: ti-sn65dsi86: Add HPD for DisplayPort
 connector type
To: Jayesh Choudhary <j-choudhary@ti.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
 Laurent.pinchart@ideasonboard.com, dri-devel@lists.freedesktop.org, 
 tomi.valkeinen@ideasonboard.com, max.krummenacher@toradex.com, 
 ernestvanhoecke@gmail.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, simona@ffwll.ch, kieran.bingham+renesas@ideasonboard.com, 
 linux-kernel@vger.kernel.org, max.oss.09@gmail.com, devarsht@ti.com, 
 geert@linux-m68k.org
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

Hi,

On Tue, Jun 10, 2025 at 10:29=E2=80=AFPM Jayesh Choudhary <j-choudhary@ti.c=
om> wrote:
>
> @@ -1195,9 +1203,17 @@ static enum drm_connector_status ti_sn_bridge_dete=
ct(struct drm_bridge *bridge)
>         struct ti_sn65dsi86 *pdata =3D bridge_to_ti_sn65dsi86(bridge);
>         int val =3D 0;
>
> -       pm_runtime_get_sync(pdata->dev);
> +       /*
> +        * The chip won't report HPD right after being powered on as
> +        * HPD_DEBOUNCED_STATE reflects correct state only after the
> +        * debounce time (~100-400 ms).
> +        * So having pm_runtime_get_sync() and immediately reading
> +        * the register in detect() won't work, and adding delay()
> +        * in detect will have performace impact in display.
> +        * So remove runtime calls here.

That last sentence makes sense in a commit message, but not long term.
Someone reading the code later won't understand what "remove" means.
If you change "remove" to "omit" then it all makes sense, though. You
could also say that a pm_runtime reference will be grabbed by
ti_sn_bridge_hpd_enable().


> +        */
> +
>         regmap_read(pdata->regmap, SN_HPD_DISABLE_REG, &val);
> -       pm_runtime_put_autosuspend(pdata->dev);
>
>         return val & HPD_DEBOUNCED_STATE ? connector_status_connected
>                                          : connector_status_disconnected;
> @@ -1220,6 +1236,20 @@ static void ti_sn65dsi86_debugfs_init(struct drm_b=
ridge *bridge, struct dentry *
>         debugfs_create_file("status", 0600, debugfs, pdata, &status_fops)=
;
>  }
>
> +static void ti_sn_bridge_hpd_enable(struct drm_bridge *bridge)
> +{
> +       struct ti_sn65dsi86 *pdata =3D bridge_to_ti_sn65dsi86(bridge);
> +
> +       pm_runtime_get_sync(pdata->dev);
> +}
> +
> +static void ti_sn_bridge_hpd_disable(struct drm_bridge *bridge)
> +{
> +       struct ti_sn65dsi86 *pdata =3D bridge_to_ti_sn65dsi86(bridge);
> +
> +       pm_runtime_put_sync(pdata->dev);
> +}
> +
>  static const struct drm_bridge_funcs ti_sn_bridge_funcs =3D {
>         .attach =3D ti_sn_bridge_attach,
>         .detach =3D ti_sn_bridge_detach,
> @@ -1234,6 +1264,8 @@ static const struct drm_bridge_funcs ti_sn_bridge_f=
uncs =3D {
>         .atomic_duplicate_state =3D drm_atomic_helper_bridge_duplicate_st=
ate,
>         .atomic_destroy_state =3D drm_atomic_helper_bridge_destroy_state,
>         .debugfs_init =3D ti_sn65dsi86_debugfs_init,
> +       .hpd_enable =3D ti_sn_bridge_hpd_enable,
> +       .hpd_disable =3D ti_sn_bridge_hpd_disable,
>  };
>
>  static void ti_sn_bridge_parse_lanes(struct ti_sn65dsi86 *pdata,
> @@ -1322,7 +1354,8 @@ static int ti_sn_bridge_probe(struct auxiliary_devi=
ce *adev,
>                            ? DRM_MODE_CONNECTOR_DisplayPort : DRM_MODE_CO=
NNECTOR_eDP;
>
>         if (pdata->bridge.type =3D=3D DRM_MODE_CONNECTOR_DisplayPort)
> -               pdata->bridge.ops =3D DRM_BRIDGE_OP_EDID | DRM_BRIDGE_OP_=
DETECT;
> +               pdata->bridge.ops =3D DRM_BRIDGE_OP_EDID | DRM_BRIDGE_OP_=
DETECT |
> +                                   DRM_BRIDGE_OP_HPD;

I think you also need this in the "DRM_MODE_CONNECTOR_DisplayPort" if test:

/*
 * If comms were already enabled they would have been enabled
 * with the wrong value of HPD_DISABLE. Update it now. Comms
 * could be enabled if anyone is holding a pm_runtime reference
 * (like if a GPIO is in use). Note that in most cases nobody
 * is doing AUX channel xfers before the bridge is added so
 * HPD doesn't _really_ matter then. The only exception is in
 * the eDP case where the panel wants to read the EDID before
 * the bridge is added. We always consistently have HPD disabled
 * for eDP.
 */
mutex_lock(&pdata->comms_mutex);
if (pdata->comms_enabled)
  regmap_update_bits(pdata->regmap, SN_HPD_DISABLE_REG,
    HPD_DISABLE, 0);
mutex_unlock(&pdata->comms_mutex);

Does that sound right?
