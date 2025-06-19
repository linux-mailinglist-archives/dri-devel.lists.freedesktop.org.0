Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7A93AE0766
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jun 2025 15:34:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F65310EA53;
	Thu, 19 Jun 2025 13:34:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b="jQcBGJRu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F29EB10EA53
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jun 2025 13:34:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1750340072; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=QQsSrN4Dkjsu5zTv7CLcp2MysHYWKvRp55QFeGAgNKlql/zQHvYu+AOh6QPwWftbJAaGpfLXJ+8cv+/Zx7hr+mLBEeqZuuAYI3lRV5RbePLXFMEMnYbHdbLeHiYuxrBZwUGS/kv5MTwgZohm57t7sHcIuT2+7dCf6Bop4+FJEGc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1750340072;
 h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=qWNEcMBoxu8wUH3B/aSwOcDmxt4JxKtTOFWBvNpr6T4=; 
 b=PMEQKHu0UwJn5LBzFo6dwmsa5MR8YiXKxeNBEE7DabwhaSeycq5JZ5oqjb/bOVQZDQ1vLQ3YQsGjgymzf+rrrBsMm4LfQc2S2txvZInKbVBYWA4dDncjM1vmEd1qNY6EsfGsxgUtES72mIj9Srj4nmFU3IIVET99W+UjDKhsl8c=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
 dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1750340072; 
 s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
 h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
 bh=qWNEcMBoxu8wUH3B/aSwOcDmxt4JxKtTOFWBvNpr6T4=;
 b=jQcBGJRu6QaEZqEhNDwkfp6y3DPalwwRYLWgZ9K0i5BdSEbx21Q5gEYmVhs3T4u4
 7QJn22A1cC/OX06PNaGMlEtwlSdtc+0hFIHZOoAhmPG/pMH4+MYcpjMVfyrBSHxbKJk
 mC/bC5LVD/D3DSSoNJwBG+Xbcjb4DH2bRLQireBI=
Received: by mx.zohomail.com with SMTPS id 1750340070603195.6541748579583;
 Thu, 19 Jun 2025 06:34:30 -0700 (PDT)
Received: by venus (Postfix, from userid 1000)
 id E8BE21805A8; Thu, 19 Jun 2025 15:34:26 +0200 (CEST)
Date: Thu, 19 Jun 2025 15:34:26 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Andy Yan <andyshrk@163.com>
Cc: neil.armstrong@linaro.org, conor+dt@kernel.org, 
 quic_jesszhan@quicinc.com, krzk+dt@kernel.org, robh@kernel.org,
 tzimmermann@suse.de, 
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH 2/2] drivers/panel: raydium-rm67200: Make reset-gpio
 optional
Message-ID: <ydqx6qhm53m5p7g3ust7jsdaftqugdfp65m223zoo6awy5qsgb@s4fzof6e3oh2>
References: <20250616070536.670519-1-andyshrk@163.com>
 <20250616070536.670519-2-andyshrk@163.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="bguhyq47rfsodvla"
Content-Disposition: inline
In-Reply-To: <20250616070536.670519-2-andyshrk@163.com>
X-Zoho-Virus-Status: 1
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-1.4.2/250.326.2
X-ZohoMailClient: External
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


--bguhyq47rfsodvla
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 2/2] drivers/panel: raydium-rm67200: Make reset-gpio
 optional
MIME-Version: 1.0

Hi,

On Mon, Jun 16, 2025 at 03:05:17PM +0800, Andy Yan wrote:
> From: Andy Yan <andy.yan@rock-chips.com>
>=20
> Although the datasheet of the panel module describes that it has a
> reset pin, in the actual hardware design, we often use an RC circuit
> to control the reset, and rarely use GPIO to control the reset. This
> is the way it is done on our numerous development boards (such as
> RK3568/RK3576 EVB).
>=20
> So make the reset-gpio optional.
>=20
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> ---

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Greetings,

-- Sebastian

>=20
>  drivers/gpu/drm/panel/panel-raydium-rm67200.c | 16 +++++++++-------
>  1 file changed, 9 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/panel/panel-raydium-rm67200.c b/drivers/gpu/=
drm/panel/panel-raydium-rm67200.c
> index 205273163cb97..add6099ae8a64 100644
> --- a/drivers/gpu/drm/panel/panel-raydium-rm67200.c
> +++ b/drivers/gpu/drm/panel/panel-raydium-rm67200.c
> @@ -36,12 +36,14 @@ static inline struct raydium_rm67200 *to_raydium_rm67=
200(struct drm_panel *panel
> =20
>  static void raydium_rm67200_reset(struct raydium_rm67200 *ctx)
>  {
> -	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
> -	msleep(60);
> -	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> -	msleep(60);
> -	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
> -	msleep(60);
> +	if (ctx->reset_gpio) {
> +		gpiod_set_value_cansleep(ctx->reset_gpio, 0);
> +		msleep(60);
> +		gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> +		msleep(60);
> +		gpiod_set_value_cansleep(ctx->reset_gpio, 0);
> +		msleep(60);
> +	}
>  }
> =20
>  static void raydium_rm67200_write(struct mipi_dsi_multi_context *ctx,
> @@ -412,7 +414,7 @@ static int raydium_rm67200_probe(struct mipi_dsi_devi=
ce *dsi)
>  	if (ret < 0)
>  		return ret;
> =20
> -	ctx->reset_gpio =3D devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
> +	ctx->reset_gpio =3D devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW=
);
>  	if (IS_ERR(ctx->reset_gpio))
>  		return dev_err_probe(dev, PTR_ERR(ctx->reset_gpio),
>  				     "Failed to get reset-gpios\n");
> --=20
> 2.43.0
>=20
> base-commit: 8c98c2c9ebeaa472e742d664b714aed5ab7c6f53
> branch: rk356x_rk3588_rk3576_dsi
>=20

--bguhyq47rfsodvla
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmhUEd4ACgkQ2O7X88g7
+poOug//apfY0XCMcV2DAO++NpXT0RHAyq8Aj7isCoLxs4sNs+S5ig+hPf0Fa139
fIkh8M6UcsNxlxu5/0nDTkf3tVtqANFjWaoCNoPnM8XJpISGJKXnuBKBIIh/kfLs
TbqXX2+Yg1l6lhDcSkDmahIp2zCg2Cz9t4vlbCKesgXb50paD0KRoHnWEcC6rK5N
0NayI5m7a9k12Ptdxkdy6vOz0YIa3JmzbAHH38zOHswNaIXNRJUqh43vIWXwZ/pg
A0Px1vXXnjqxxnbd6HFqMJUtWwiQ8BtxIyQ4uY8A1EtCHvEIMTsIRXIkM44dg83r
5s324sv3xeNh8nffl4oUVg+imgDi4PC3yWq9BygwmCp/0wgze+Wbgjhc5IL2HCu0
tzrl5nuN2zYIp8gJoqZBiEFcb2KyjPPVgKWAbYCbEhJawSOZSiiyg5n7+8WMG2Np
dUKzUGsjkGOk4fGA4gGPP4jRoaiKmHwahTLYQ01UFZdWI5fUg6JSmnXhkbKclruX
kQWLzjDwlGXdzdoB/NfJ0yZJa5cwp/P2nvUhSGHRWVY3uQCW6Op93m7E5WwsKUm3
b/50D1hN1gihDWoF4INM/JfQqXVwnMO5Fh/Y30d3Wo6+dYtZ4aqe/f1kodwDFW3A
FunJeIG7TCAcXTVSMLWc2zL0vuUfH4Ba6U3Yf+buu40nmstgbmQ=
=Rm48
-----END PGP SIGNATURE-----

--bguhyq47rfsodvla--
