Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EFE862DF15
	for <lists+dri-devel@lfdr.de>; Thu, 17 Nov 2022 16:08:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB11F10E61D;
	Thu, 17 Nov 2022 15:08:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B34310E61D
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Nov 2022 15:08:43 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 98F8C929;
 Thu, 17 Nov 2022 16:08:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1668697721;
 bh=KDmMkOo4Xq7I/fLq82DmVwTZhsTmGJ8/nd1M+JpkZMQ=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=c1+44ai1zErA1wfRkm8rT9CNxu4WbWDyEWYQpBQg+fuyPi2R+LVBDA9k4pIgKjVUY
 qH1MRmAYZ4UbF9+N607NvKwj2GoKLHVRhaQgAF61iXRqEcWU6eKFP5unX7fhYNwFs0
 x192SP/P4YCTsm4xR8ccAJN/vJ8kLyQ0mwwYZNfw=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20221117122547.809644-7-tomi.valkeinen@ideasonboard.com>
References: <20221117122547.809644-1-tomi.valkeinen@ideasonboard.com>
 <20221117122547.809644-7-tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v1 6/8] drm: rcar-du: Add r8a779g0 support
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
Date: Thu, 17 Nov 2022 15:08:38 +0000
Message-ID: <166869771876.50677.1905794243575000038@Monstersaurus>
User-Agent: alot/0.10
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Robert Foss <robert.foss@linaro.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Tomi Valkeinen (2022-11-17 12:25:45)
> From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
>=20
> Add support for DU on r8a779g0, which is identical to DU on r8a779a0.
>=20
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> ---
>  drivers/gpu/drm/rcar-du/rcar_du_drv.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar=
-du/rcar_du_drv.c
> index d003e8d9e7a2..b1761d4ec4e5 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> @@ -524,6 +524,27 @@ static const struct rcar_du_device_info rcar_du_r8a7=
79a0_info =3D {
>         .dsi_clk_mask =3D  BIT(1) | BIT(0),
>  };
> =20
> +static const struct rcar_du_device_info rcar_du_r8a779g0_info =3D {
> +       .gen =3D 3,

Given that this is the V4H ... I wonder if this should be bumped
already. I guess that has knock on effects through the driver though...

Aside from that, Which may need more work to handle correctly:

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>


> +       .features =3D RCAR_DU_FEATURE_CRTC_IRQ
> +                 | RCAR_DU_FEATURE_VSP1_SOURCE
> +                 | RCAR_DU_FEATURE_NO_BLENDING,
> +       .channels_mask =3D BIT(1) | BIT(0),
> +       .routes =3D {
> +               /* R8A779G0 has two MIPI DSI outputs. */
> +               [RCAR_DU_OUTPUT_DSI0] =3D {
> +                       .possible_crtcs =3D BIT(0),
> +                       .port =3D 0,
> +               },
> +               [RCAR_DU_OUTPUT_DSI1] =3D {
> +                       .possible_crtcs =3D BIT(1),
> +                       .port =3D 1,
> +               },
> +       },
> +       .num_rpf =3D 5,
> +       .dsi_clk_mask =3D  BIT(1) | BIT(0),
> +};
> +
>  static const struct of_device_id rcar_du_of_table[] =3D {
>         { .compatible =3D "renesas,du-r8a7742", .data =3D &rcar_du_r8a779=
0_info },
>         { .compatible =3D "renesas,du-r8a7743", .data =3D &rzg1_du_r8a774=
3_info },
> @@ -549,6 +570,7 @@ static const struct of_device_id rcar_du_of_table[] =
=3D {
>         { .compatible =3D "renesas,du-r8a77990", .data =3D &rcar_du_r8a77=
99x_info },
>         { .compatible =3D "renesas,du-r8a77995", .data =3D &rcar_du_r8a77=
99x_info },
>         { .compatible =3D "renesas,du-r8a779a0", .data =3D &rcar_du_r8a77=
9a0_info },
> +       { .compatible =3D "renesas,du-r8a779g0", .data =3D &rcar_du_r8a77=
9g0_info },
>         { }
>  };
> =20
> --=20
> 2.34.1
>
