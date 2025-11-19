Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3907DC6D9A8
	for <lists+dri-devel@lfdr.de>; Wed, 19 Nov 2025 10:10:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF08A10E5B2;
	Wed, 19 Nov 2025 09:10:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="WYkwxoEo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7FA010E235;
 Wed, 19 Nov 2025 09:10:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id B191640B05;
 Wed, 19 Nov 2025 09:10:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B977DC2BC9E;
 Wed, 19 Nov 2025 09:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763543429;
 bh=0ooC3zk40bMIfdzUa/d1KFYHBm62ThIBveVi/NzSqME=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WYkwxoEoIY0kEfPKwxkhEOyIUknU4PaoqDuimh3ALPGiCRcpCW5HFYuw8iKBHE1Vv
 180AdCb62rhuKbfWe234uQJOIp5/qWcB6yAsB3sixNgrkOu9jSCKcopJLH8pjraeIC
 locvCj98kCc1UrD6NTZ6Z0ZRM/JxH0dHkhkJefUzpxY5Go9pAH1/v4bq+/wgEqiHH/
 zDi2tPuYk6EzRZ5dv0rIDTy+Sssko9WHvNfGBIIfcOgPrz6nd9Pclbj7QAQ844Sjei
 t0L2dLYM2T36xrEhcVkJHxclpHi8DB7wUjWR39ndJN8LUBzLJMwPZLtWYGqB0LQZWH
 FSbL9E3053pUg==
Date: Wed, 19 Nov 2025 10:10:26 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>, 
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Sandy Huang <hjc@rock-chips.com>, 
 Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, kernel@collabora.com, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 Derek Foreman <derek.foreman@collabora.com>,
 Marius Vlad <marius.vlad@collabora.com>
Subject: Re: [PATCH v4 10/10] drm/rockchip: Implement "color format" DRM
 property
Message-ID: <irl64vwqiwdgxwwvim62qm55fc36p6fyduxlnc23zkotsr6726@4zswp4rjdtu4>
References: <20251117-color-format-v4-0-0ded72bd1b00@collabora.com>
 <20251117-color-format-v4-10-0ded72bd1b00@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="g3dvg44f3him5ido"
Content-Disposition: inline
In-Reply-To: <20251117-color-format-v4-10-0ded72bd1b00@collabora.com>
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


--g3dvg44f3him5ido
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 10/10] drm/rockchip: Implement "color format" DRM
 property
MIME-Version: 1.0

On Mon, Nov 17, 2025 at 08:11:54PM +0100, Nicolas Frattaroli wrote:
> From: Derek Foreman <derek.foreman@collabora.com>
>=20
> Register the color format property in the dw_hdmi_qp-rockchip driver,
> and act on requested format changes as part of the connector state in
> the vop2 video output driver.
>=20
> Signed-off-by: Derek Foreman <derek.foreman@collabora.com>
> Signed-off-by: Marius Vlad <marius.vlad@collabora.com>
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c |  3 ++
>  drivers/gpu/drm/rockchip/rockchip_drm_vop2.c   | 46 ++++++++++++++++++++=
++++++
>  drivers/gpu/drm/rockchip/rockchip_drm_vop2.h   |  2 ++
>  3 files changed, 51 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/gpu=
/drm/rockchip/dw_hdmi_qp-rockchip.c
> index 7c294751de19..7028166fdace 100644
> --- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
> +++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
> @@ -635,6 +635,9 @@ static int dw_hdmi_qp_rockchip_bind(struct device *de=
v, struct device *master,
>  		return dev_err_probe(hdmi->dev, PTR_ERR(connector),
>  				     "Failed to init bridge connector\n");
> =20
> +	if (!drm_mode_create_hdmi_color_format_property(connector, supported_co=
lorformats))
> +		drm_connector_attach_color_format_property(connector);
> +

Why shouldn't we register the property in drmm_connector_hdmi_init directly?

Maxime

--g3dvg44f3him5ido
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaR2JgQAKCRAnX84Zoj2+
dmvfAYDCo+PJW5u5/sNK3esukJxyFfwo+aBeX8aZqtnXuZcqKb9iKdX/e3Bpfnj4
tNf3U7gBf0YrO/GhoJ/IYd6OFABbqrfpJOXtt98+CfuhHB+6M0WlyQ3jg6ddDDok
C7UgUczAhA==
=94DU
-----END PGP SIGNATURE-----

--g3dvg44f3him5ido--
