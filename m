Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 515D88C45B6
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2024 19:09:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F15D010E8B5;
	Mon, 13 May 2024 17:09:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ARmBpdZ9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E28DE10E8B5
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 17:09:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5779D60DB7
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 17:09:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 094F9C2BD11
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 17:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715620186;
 bh=NUKDNm9YYmo0TWz565PZu1Vg4+IaNQPFBZdIUqn+A4s=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ARmBpdZ9rVYY+LfdsxAJz2UOqv8EVDWTuC3c8u5cKhT40STjSNvUifoicx+r0sWfv
 XX4AI1h11XWe/j0HVv+pkk3K1wtL+0eym9COpxwyRUpZ4xMiYK9Lw/5Ok70r5IXl3u
 xghiDb7rOddSCBpywexEx7MzE/kJz6deiRNRwr7pLvefzOpBjQeLjvKrMQOgp+vrR0
 FYYse3JnwK9lewca6fyuyYIGtPZqky2KwUUznp2ceo3vH9qpnF1U6HWn5yLZibdIQm
 PEZowHV0NGGaaoPi2l2O+y3e4OnfzrKslkTtt+cIQezTg50YvlCAn52IisEp83BTcy
 e9IbdBQu6dTwA==
Received: by mail-oo1-f43.google.com with SMTP id
 006d021491bc7-5acb737b508so1932912eaf.0
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 10:09:46 -0700 (PDT)
X-Gm-Message-State: AOJu0YxgU5UfjW7Flt+tgjBGT3mfhWouhr/1xxaMMQJ6A/gac/I6FSY2
 fTRqKffbRWKy3GfxRdZoTs3v7P5AMu7ed0yndAAr/QTu7MbYPCEhSOySrPytckXPWhHD4RS2ntJ
 kIdQZ00fwvJRbzUFOLxrRHlAnqKoKPmR/28hJbQ==
X-Google-Smtp-Source: AGHT+IF2Ffpde5HkpcU33neHNG69ERzJu0l1dy+KxdZ5vQVzS5h8n6cnJybu9TGTf3mzh6eldjN3LiRONBn4UB4CvxM=
X-Received: by 2002:a05:6870:71d4:b0:244:c312:4c7c with SMTP id
 586e51a60fabf-244c3125884mr6908894fac.16.1715620185339; Mon, 13 May 2024
 10:09:45 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1715347488.git.jani.nikula@intel.com>
 <035c7c31a3e096625a69eb4657c1727da4021a62.1715347488.git.jani.nikula@intel.com>
In-Reply-To: <035c7c31a3e096625a69eb4657c1727da4021a62.1715347488.git.jani.nikula@intel.com>
From: Robert Foss <rfoss@kernel.org>
Date: Mon, 13 May 2024 19:09:32 +0200
X-Gmail-Original-Message-ID: <CAN6tsi59FK=z_nt+XrV1W3nUNOE+jfYRQ140YzEWvc4EGuroig@mail.gmail.com>
Message-ID: <CAN6tsi59FK=z_nt+XrV1W3nUNOE+jfYRQ140YzEWvc4EGuroig@mail.gmail.com>
Subject: Re: [RESEND 2/6] drm/bridge/analogix/anx78xx: switch to struct
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
>  .../drm/bridge/analogix/analogix-anx78xx.c    | 23 ++++++++++---------
>  1 file changed, 12 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c b/drivers=
/gpu/drm/bridge/analogix/analogix-anx78xx.c
> index 5748a8581af4..ae79bcd8fa55 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
> @@ -67,7 +67,7 @@ struct anx78xx {
>         struct drm_dp_aux aux;
>         struct drm_bridge bridge;
>         struct i2c_client *client;
> -       struct edid *edid;
> +       const struct drm_edid *drm_edid;
>         struct drm_connector connector;
>         struct anx78xx_platform_data pdata;
>         struct mutex lock;
> @@ -830,8 +830,8 @@ static int anx78xx_get_modes(struct drm_connector *co=
nnector)
>         if (WARN_ON(!anx78xx->powered))
>                 return 0;
>
> -       if (anx78xx->edid)
> -               return drm_add_edid_modes(connector, anx78xx->edid);
> +       if (anx78xx->drm_edid)
> +               return drm_edid_connector_add_modes(connector);
>
>         mutex_lock(&anx78xx->lock);
>
> @@ -841,20 +841,21 @@ static int anx78xx_get_modes(struct drm_connector *=
connector)
>                 goto unlock;
>         }
>
> -       anx78xx->edid =3D drm_get_edid(connector, &anx78xx->aux.ddc);
> -       if (!anx78xx->edid) {
> +       anx78xx->drm_edid =3D drm_edid_read_ddc(connector, &anx78xx->aux.=
ddc);
> +
> +       err =3D drm_edid_connector_update(connector, anx78xx->drm_edid);
> +
> +       if (!anx78xx->drm_edid) {
>                 DRM_ERROR("Failed to read EDID\n");
>                 goto unlock;
>         }
>
> -       err =3D drm_connector_update_edid_property(connector,
> -                                                anx78xx->edid);
>         if (err) {
>                 DRM_ERROR("Failed to update EDID property: %d\n", err);
>                 goto unlock;
>         }
>
> -       num_modes =3D drm_add_edid_modes(connector, anx78xx->edid);
> +       num_modes =3D drm_edid_connector_add_modes(connector);
>
>  unlock:
>         mutex_unlock(&anx78xx->lock);
> @@ -1091,8 +1092,8 @@ static bool anx78xx_handle_common_int_4(struct anx7=
8xx *anx78xx, u8 irq)
>                 event =3D true;
>                 anx78xx_poweroff(anx78xx);
>                 /* Free cached EDID */
> -               kfree(anx78xx->edid);
> -               anx78xx->edid =3D NULL;
> +               drm_edid_free(anx78xx->drm_edid);
> +               anx78xx->drm_edid =3D NULL;
>         } else if (irq & SP_HPD_PLUG) {
>                 DRM_DEBUG_KMS("IRQ: Hot plug detect - cable plug\n");
>                 event =3D true;
> @@ -1363,7 +1364,7 @@ static void anx78xx_i2c_remove(struct i2c_client *c=
lient)
>
>         unregister_i2c_dummy_clients(anx78xx);
>
> -       kfree(anx78xx->edid);
> +       drm_edid_free(anx78xx->drm_edid);
>  }
>
>  static const struct of_device_id anx78xx_match_table[] =3D {
> --
> 2.39.2
>

Reviewed-by: Robert Foss <rfoss@kernel.org>
