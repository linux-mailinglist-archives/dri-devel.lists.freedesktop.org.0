Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B73FE8C45B3
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2024 19:09:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBC1710E6D4;
	Mon, 13 May 2024 17:09:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Yf7Rf/6u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E63310E6D4
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 17:09:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9DB9860E65
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 17:09:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FCE8C4AF0A
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 17:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715620151;
 bh=uizGtLDrTeb2d0DjGuA8RAWUiB6hehpo96IvkgRaQA0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Yf7Rf/6umcwHW1DaVOS7hFH9vi4irWieqIZCVL7ChA3N0qJhf0VTsjWDPDukh8M2O
 ONAvwUl1FSUZqpf1p5jIJ0yI4rTH4KaEGcTHV3JsgoSNlLHoj3muNJ7AYpRw1+Dlg6
 tffJiYI21CHDcUImh2+cOXlvjyu9WwkIqYMXjrqlMKdvBUF5ge1fGnj3fDk9VMBl+Z
 HF99LyRedKGpoIIWmj/Eu8MJpLET6UeH1X7vSlk1G+r371BXZQM8+RgkyRt2OTZT+O
 7hAywYovgb+2pt36fZVH8cizGnOZHmp6OGRm5eKReBlg9MvAUkN5im4/ZXdyZ3+jem
 eo6a8OhEHdv7g==
Received: by mail-ot1-f44.google.com with SMTP id
 46e09a7af769-6f0277767fbso2117008a34.3
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 10:09:11 -0700 (PDT)
X-Gm-Message-State: AOJu0YxDTX4B/Y+ItFuqD1afLgKgqk5gEAXxdJDFoL3FHG5/XzMicCLn
 lXYWQ8AVReCWqMCcyF9dGdi1uPjUZCDBFDePP6sDmmerPYHJuJVzUr7gUfZltxhWTEQ/WEtQvrL
 26sqmtLqJ8wA5ZY5FJ4hNs/MJiX0yHonIpT+akQ==
X-Google-Smtp-Source: AGHT+IGR5gi89x3ZgpxVdFSwafEZk+KzsvizL1SkxFW/kprZMFvA+iDcEXFh8wAZHWE22dTyWuW8KReS753SHBv13GY=
X-Received: by 2002:a05:6870:1593:b0:244:ad4a:4c31 with SMTP id
 586e51a60fabf-244ad4a8288mr9121813fac.44.1715620150414; Mon, 13 May 2024
 10:09:10 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1715347488.git.jani.nikula@intel.com>
 <74b2f00e17b2614b44955cf0cbae270f3c31d91a.1715347488.git.jani.nikula@intel.com>
In-Reply-To: <74b2f00e17b2614b44955cf0cbae270f3c31d91a.1715347488.git.jani.nikula@intel.com>
From: Robert Foss <rfoss@kernel.org>
Date: Mon, 13 May 2024 19:08:59 +0200
X-Gmail-Original-Message-ID: <CAN6tsi41fpzxi1sB8zMB38ekcFmkumXz1jkGqC8XKNBGvhkhqA@mail.gmail.com>
Message-ID: <CAN6tsi41fpzxi1sB8zMB38ekcFmkumXz1jkGqC8XKNBGvhkhqA@mail.gmail.com>
Subject: Re: [RESEND 1/6] drm/bridge/analogix/anx6345: switch to struct
 drm_edid
To: Jani Nikula <jani.nikula@intel.com>
Cc: dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
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

On Fri, May 10, 2024 at 3:26=E2=80=AFPM Jani Nikula <jani.nikula@intel.com>=
 wrote:
>
> Prefer struct drm_edid based functions over struct edid.
>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>
> ---
>
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Robert Foss <rfoss@kernel.org>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> ---
>  .../gpu/drm/bridge/analogix/analogix-anx6345.c    | 15 +++++++--------
>  1 file changed, 7 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c b/drivers=
/gpu/drm/bridge/analogix/analogix-anx6345.c
> index c9e35731e6a1..42ab6014fe12 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
> @@ -47,7 +47,7 @@ struct anx6345 {
>         struct drm_dp_aux aux;
>         struct drm_bridge bridge;
>         struct i2c_client *client;
> -       struct edid *edid;
> +       const struct drm_edid *drm_edid;
>         struct drm_connector connector;
>         struct drm_panel *panel;
>         struct regulator *dvdd12;
> @@ -458,7 +458,7 @@ static int anx6345_get_modes(struct drm_connector *co=
nnector)
>
>         mutex_lock(&anx6345->lock);
>
> -       if (!anx6345->edid) {
> +       if (!anx6345->drm_edid) {
>                 if (!anx6345->powered) {
>                         anx6345_poweron(anx6345);
>                         power_off =3D true;
> @@ -470,19 +470,18 @@ static int anx6345_get_modes(struct drm_connector *=
connector)
>                         goto unlock;
>                 }
>
> -               anx6345->edid =3D drm_get_edid(connector, &anx6345->aux.d=
dc);
> -               if (!anx6345->edid)
> +               anx6345->drm_edid =3D drm_edid_read_ddc(connector, &anx63=
45->aux.ddc);
> +               if (!anx6345->drm_edid)
>                         DRM_ERROR("Failed to read EDID from panel\n");
>
> -               err =3D drm_connector_update_edid_property(connector,
> -                                                        anx6345->edid);
> +               err =3D drm_edid_connector_update(connector, anx6345->drm=
_edid);
>                 if (err) {
>                         DRM_ERROR("Failed to update EDID property: %d\n",=
 err);
>                         goto unlock;
>                 }
>         }
>
> -       num_modes +=3D drm_add_edid_modes(connector, anx6345->edid);
> +       num_modes +=3D drm_edid_connector_add_modes(connector);
>
>         /* Driver currently supports only 6bpc */
>         connector->display_info.bpc =3D 6;
> @@ -793,7 +792,7 @@ static void anx6345_i2c_remove(struct i2c_client *cli=
ent)
>
>         unregister_i2c_dummy_clients(anx6345);
>
> -       kfree(anx6345->edid);
> +       drm_edid_free(anx6345->drm_edid);
>
>         mutex_destroy(&anx6345->lock);
>  }
> --
> 2.39.2
>

Reviewed-by: Robert Foss <rfoss@kernel.org>
