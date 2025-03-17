Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0330BA6493D
	for <lists+dri-devel@lfdr.de>; Mon, 17 Mar 2025 11:16:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF45310E3DE;
	Mon, 17 Mar 2025 10:16:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="XKssg8TU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7355710E3DE
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Mar 2025 10:16:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id BF74B5C2759;
 Mon, 17 Mar 2025 10:14:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 305E7C4CEE3;
 Mon, 17 Mar 2025 10:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742206594;
 bh=sP4X9ex47Eoc3cg4rQs7gDQnP2lwOT6Ng96xEHp5bpc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XKssg8TUZ5+m1VIovlpPgOH6cGDAjiCgJFKBg3GDqN0btvpR3dHJ6TyY+skOWvbtd
 KnGPYnXyGykeNE29+ZWjQ09jMghib1rb/SVMTb9hMwzUR9LV1IKDzQvHyBd6JU5I/v
 KO43YlLYEqMkP06G0M51sAHs/3wSuBZrb9oGAs0UkBZzS2+0ZUJ50//XqBD+Zoc9zF
 cDuUfU9VrSuaoSGQCpl28iPpYEcsABMur2XKSq53tzn3GmdOH5a7MqaDZx5NueROex
 AaOdj7CQypr0dewZ5r0T3o06v29t4MErGk4z48cjhGfP6XElp5Kf2LBPFPI6PF4F7Z
 Zsc/MHyh70nYQ==
Received: by venus (Postfix, from userid 1000)
 id 00B9F18079B; Mon, 17 Mar 2025 11:16:31 +0100 (CET)
Date: Mon, 17 Mar 2025 11:16:31 +0100
From: Sebastian Reichel <sre@kernel.org>
To: Andy Yan <andyshrk@163.com>
Cc: heiko@sntech.de, cristian.ciocaltea@collabora.com, hjc@rock-chips.com, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH] drm/rockchip: dw_hdmi_qp: Fix io init for
 dw_hdmi_qp_rockchip_resume
Message-ID: <p53hbl4vt7vy6srctswjpmlj2rsvnyop4zcszlwrwdd4nogsj3@utqc25oaccfb>
References: <20250317082047.564404-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="hbprtcna6txu5faw"
Content-Disposition: inline
In-Reply-To: <20250317082047.564404-1-andyshrk@163.com>
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


--hbprtcna6txu5faw
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] drm/rockchip: dw_hdmi_qp: Fix io init for
 dw_hdmi_qp_rockchip_resume
MIME-Version: 1.0

Hi,

On Mon, Mar 17, 2025 at 04:20:39PM +0800, Andy Yan wrote:
> From: Andy Yan <andy.yan@rock-chips.com>
>=20
> Use cfg->ctrl_ops->io_init callback make it work for all platform.
>=20
> Fixes: 3f60dbd40d3f ("drm/rockchip: dw_hdmi_qp: Add platform ctrl callbac=
k")
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> ---

It also gets rid of code duplication :)

>=20
>  .../gpu/drm/rockchip/dw_hdmi_qp-rockchip.c    | 23 +++----------------
>  1 file changed, 3 insertions(+), 20 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/gpu=
/drm/rockchip/dw_hdmi_qp-rockchip.c
> index 3d1dddb34603..631a7080862b 100644
> --- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
> +++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
> @@ -600,27 +600,10 @@ static void dw_hdmi_qp_rockchip_remove(struct platf=
orm_device *pdev)
>  static int __maybe_unused dw_hdmi_qp_rockchip_resume(struct device *dev)
>  {
>  	struct rockchip_hdmi_qp *hdmi =3D dev_get_drvdata(dev);
> -	u32 val;
> -
> -	val =3D HIWORD_UPDATE(RK3588_SCLIN_MASK, RK3588_SCLIN_MASK) |
> -	      HIWORD_UPDATE(RK3588_SDAIN_MASK, RK3588_SDAIN_MASK) |
> -	      HIWORD_UPDATE(RK3588_MODE_MASK, RK3588_MODE_MASK) |
> -	      HIWORD_UPDATE(RK3588_I2S_SEL_MASK, RK3588_I2S_SEL_MASK);
> -	regmap_write(hdmi->vo_regmap,
> -		     hdmi->port_id ? RK3588_GRF_VO1_CON6 : RK3588_GRF_VO1_CON3,
> -		     val);
> -
> -	val =3D HIWORD_UPDATE(RK3588_SET_HPD_PATH_MASK,
> -			    RK3588_SET_HPD_PATH_MASK);
> -	regmap_write(hdmi->regmap, RK3588_GRF_SOC_CON7, val);
> +	const struct rockchip_hdmi_qp_cfg *cfg;
> =20
> -	if (hdmi->port_id)
> -		val =3D HIWORD_UPDATE(RK3588_HDMI1_GRANT_SEL,
> -				    RK3588_HDMI1_GRANT_SEL);
> -	else
> -		val =3D HIWORD_UPDATE(RK3588_HDMI0_GRANT_SEL,
> -				    RK3588_HDMI0_GRANT_SEL);
> -	regmap_write(hdmi->vo_regmap, RK3588_GRF_VO1_CON9, val);
> +	cfg =3D of_device_get_match_data(dev);
> +	cfg->ctrl_ops->io_init(hdmi);

I think it would be better to store the ctrl_ops (or io_init)
callback in struct rockchip_hdmi_qp during driver probe and avoid
another lookup of the match_data, which involves string comparisons.

Otherwise:

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Greetings,

-- Sebastian

--hbprtcna6txu5faw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmfX9ngACgkQ2O7X88g7
+pqM3A/9EYnXD5oDYwTqakdXJIlFb5r0EhLAlJJCWtEYxOxa340HJlmcPAei3QlR
kV1q1zemGSOd+3SS5fwmb6kARERRKRZKz59f8uRXO9PEuVT9xm+3sR9UqwmTB8iH
TTaUHR08eYemlbhPVWgPf5AVstz77PN+WmJdAgqORI0URlqBnhIAN1hbYWk1HzMt
H+8WNlCfESWoVYSGzHsi4gLoL55K5RTkUSxEgpszQBQ4Cs5Tl/GPhNbmVDA29kxi
QDNMqksGoZ3A4lz9k0dOhO3Qe19FmCFHUjkCOLD/7Eq6TcbMpYVG2xE3Yzz+R11f
zPUfYxXe+QzM9nuFLUEQ/aV0MuT+gU1VltGg+VtinmoEw6incZI51QNmB24rHpS0
Wr1v9lsOmIhlB3Kn5N7/eZGhLboe1ukmiRS2kHMCOze/vYg9m4EUG+ZaBP4gt/L9
3c8ajXV0l+CGyc0SQeo2JDu5CtURVlt1X9LcUJSoM8urpw8lp6R68FJJDEgPgHRR
p+ruw3C+qrvWGOXeLV3e6xCYGcGCdToZ/r2T9Whq8HRY8RtAdskqFRTg6mqOnmVg
YSmAv8jbSlVuYfFoLoM4USx7BimM5PxzpqoOoQOFiBghtsquezBs0gscL56mAuqo
BC+WYm6BkFjM434NHE9x51tIA8UgUKbi01jjHXlHExcXpbtICys=
=mbY1
-----END PGP SIGNATURE-----

--hbprtcna6txu5faw--
