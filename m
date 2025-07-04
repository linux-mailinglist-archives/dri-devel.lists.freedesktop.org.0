Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC716AF9645
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 17:07:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D90D110E02E;
	Fri,  4 Jul 2025 15:07:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="S3C1949L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 864F210E02E
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Jul 2025 15:07:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 6D046A53C59;
 Fri,  4 Jul 2025 15:07:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF17AC4CEE3;
 Fri,  4 Jul 2025 15:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751641661;
 bh=xY/yriO6tBXfy5srN553QPb2aXYA16dzeg1QniS6sGE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=S3C1949LJUYLkuDiWGT3TQF97d10CRTILMNnFMrDU8BasTdu+D1z7NslqV7Mwnt3B
 tWZRqRWBjDuwqGAR3WJ2iR8T4mAsTVoNSRZJjD4iKOCdC6rZFfZ/PlFoOAn4BShq3S
 lwXdMu4kaA+UXlgPSnpAnObWhmg5qWwIu5gtbggwCK5b7l8vf//Mez1ov5ym16rWKv
 BPagAflTusNu+6uh+4hlgIIyrTvaA6aVFEy0aplzhe1zC4p6QDqNyqB/BCFigTxdzH
 RBY3HIKxJhdpcRNbX8zhCy3JDBoRkyxXONeZohARzWT/qAe2dfU6DW58jbHLS7sg29
 QUVPtYv+5JXDg==
Date: Fri, 4 Jul 2025 17:07:38 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Sandy Huang <hjc@rock-chips.com>, 
 Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] drm/rockchip: dw_hdmi_qp: Provide ref clock rate in
 dw_hdmi_qp_plat_data
Message-ID: <20250704-granite-piculet-of-elevation-f01e08@houat>
References: <20250704-rk3588-hdmi-cec-v1-0-2bd8de8700cd@collabora.com>
 <20250704-rk3588-hdmi-cec-v1-3-2bd8de8700cd@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="oszopqzjak6ldkji"
Content-Disposition: inline
In-Reply-To: <20250704-rk3588-hdmi-cec-v1-3-2bd8de8700cd@collabora.com>
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


--oszopqzjak6ldkji
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 3/5] drm/rockchip: dw_hdmi_qp: Provide ref clock rate in
 dw_hdmi_qp_plat_data
MIME-Version: 1.0

On Fri, Jul 04, 2025 at 05:23:24PM +0300, Cristian Ciocaltea wrote:
> In order to support correct initialization of the timer base in the HDMI
> QP IP block, extend the platform data to provide the necessary reference
> clock rate.
>=20
> While at it, ensure plat_data is zero-initialized in
> dw_hdmi_qp_rockchip_bind().
>=20
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c | 13 ++++++++++++-
>  include/drm/bridge/dw_hdmi_qp.h                |  1 +
>  2 files changed, 13 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/gpu=
/drm/rockchip/dw_hdmi_qp-rockchip.c
> index 126e556025961e8645f3567b4d7a1c73cc2f2e7f..8c1185490009c5f1bc658998a=
868f8b18dc479a3 100644
> --- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
> +++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
> @@ -431,8 +431,8 @@ static int dw_hdmi_qp_rockchip_bind(struct device *de=
v, struct device *master,
>  				    void *data)
>  {
>  	struct platform_device *pdev =3D to_platform_device(dev);
> +	struct dw_hdmi_qp_plat_data plat_data =3D {};
>  	const struct rockchip_hdmi_qp_cfg *cfg;
> -	struct dw_hdmi_qp_plat_data plat_data;
>  	struct drm_device *drm =3D data;
>  	struct drm_connector *connector;
>  	struct drm_encoder *encoder;
> @@ -515,6 +515,17 @@ static int dw_hdmi_qp_rockchip_bind(struct device *d=
ev, struct device *master,
>  		return ret;
>  	}
> =20
> +	for (i =3D 0; i < ret; i++) {
> +		if (!strcmp(clks[i].id, "ref")) {
> +			plat_data.ref_clk_rate =3D clk_get_rate(clks[i].clk);
> +			break;
> +		}
> +	}
> +	if (!plat_data.ref_clk_rate) {
> +		dev_err(hdmi->dev, "Missing ref clock\n");
> +		return -EINVAL;
> +	}
> +

You'd be better off not using clk_bulk, or calling an additional clk_get
for the ref clock only.

Maxime

--oszopqzjak6ldkji
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaGfuNQAKCRAnX84Zoj2+
dpLOAX9Fn+AyL0zuC8EJRGUMhLDwcaUmA/NnkN/yj+RvnyGSEiCcN475EqSfs8Ar
XN9rlt8BgIP56Bw6kg86quaBe4oPgxNoKon98/DCRRHYCKPCWZeNss8Bcb7pDsas
Q/Kd1zxghA==
=fwlI
-----END PGP SIGNATURE-----

--oszopqzjak6ldkji--
