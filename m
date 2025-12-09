Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D04DCB03D1
	for <lists+dri-devel@lfdr.de>; Tue, 09 Dec 2025 15:18:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9721110E607;
	Tue,  9 Dec 2025 14:18:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="SuP8V9x3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F49010E1DE;
 Tue,  9 Dec 2025 14:18:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 404A6600B0;
 Tue,  9 Dec 2025 14:18:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C13DC4CEF5;
 Tue,  9 Dec 2025 14:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1765289907;
 bh=naGFcg1q7wl/HAtjaNYwVakwwLo0ymXGoAp/qkubAUE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SuP8V9x3aF9kDJn4UnCqh/LsdlUD5P3wnfrG538Ft0xBvC6Pt8WDfAP8ederos+u9
 XNsaWRnvG9gj2jGek+ighc8FaV31sGfD6DZ22CGLED4j+ZNWnYJ7zL+mrsoC+KbaWW
 mu1gDVD71lLpZaIpKcSXUlHNxNZfBUtlTZIF8N7lmijURe+dnQ6sQseKTCgjyEtQlX
 WrG8faAdFkh50dxiiRkj3t/49/YVq/ZemgnWAbCJYEFwdn5WT9fUxvqg76CJxROwk7
 6fH1QBVb52kN1XQSRzhjQdEPn8TOWJAdhVeDZjmN3l+OjHbgzGnCw3KRJg1Jj34HVq
 2lpJCmO7ACp7w==
Date: Tue, 9 Dec 2025 15:18:25 +0100
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
 Tvrtko Ursulin <tursulin@ursulin.net>, 
 Dmitry Baryshkov <lumag@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Rob Herring <robh@kernel.org>, kernel@collabora.com,
 amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH v5 06/17] drm/display: hdmi-state-helper: Try subsampling
 in mode_valid
Message-ID: <20251209-dramatic-caiman-of-luck-db9d0f@houat>
References: <20251128-color-format-v5-0-63e82f1db1e1@collabora.com>
 <20251128-color-format-v5-6-63e82f1db1e1@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="yxo2br3bzecmdszc"
Content-Disposition: inline
In-Reply-To: <20251128-color-format-v5-6-63e82f1db1e1@collabora.com>
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


--yxo2br3bzecmdszc
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v5 06/17] drm/display: hdmi-state-helper: Try subsampling
 in mode_valid
MIME-Version: 1.0

On Fri, Nov 28, 2025 at 10:05:42PM +0100, Nicolas Frattaroli wrote:
> drm_hdmi_connector_mode_valid assumes modes are only valid if they work
> with RGB. The reality is more complex however: YCbCr 4:2:0
> chroma-subsampled modes only require half the pixel clock that the same
> mode would require in RGB.
>=20
> This leads to drm_hdmi_connector_mode_valid rejecting perfectly valid
> 420-only modes.
>=20
> Fix this by checking whether the mode is 420-only first. If so, then
> proceed by checking it with HDMI_COLORSPACE_YUV420 so long as the
> connector has legalized 420, otherwise error out. If the mode is not
> 420-only, check with RGB as was previously always the case.
>=20
> Fixes: 47368ab437fd ("drm/display: hdmi: add generic mode_valid helper")
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  drivers/gpu/drm/display/drm_hdmi_state_helper.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gp=
u/drm/display/drm_hdmi_state_helper.c
> index 5da956bdd68c..1800e00b30c5 100644
> --- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> +++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> @@ -892,8 +892,18 @@ drm_hdmi_connector_mode_valid(struct drm_connector *=
connector,
>  			      const struct drm_display_mode *mode)
>  {
>  	unsigned long long clock;
> +	enum hdmi_colorspace fmt;
> +
> +	if (drm_mode_is_420_only(&connector->display_info, mode)) {
> +		if (connector->ycbcr_420_allowed)
> +			fmt =3D HDMI_COLORSPACE_YUV420;
> +		else
> +			return MODE_NO_420;
> +	} else {
> +		fmt =3D HDMI_COLORSPACE_RGB;
> +	}
> =20
> -	clock =3D drm_hdmi_compute_mode_clock(mode, 8, HDMI_COLORSPACE_RGB);
> +	clock =3D drm_hdmi_compute_mode_clock(mode, 8, fmt);

I agree on principle, but we need to have a test for this.

Maxime

--yxo2br3bzecmdszc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaTgvsAAKCRAnX84Zoj2+
dpZUAX41Qku7HK51QFuHnPNqkFC6QPCPqvYd1L2dj5jW84noRXFIzMeW5xGaIeQR
gUtLvc8Bf2X/OfEFvCBHbET5lU94V8iwQEiZrfF7/NF+nmd5jhNG1djOHzfUfGSY
LcABmHyY4A==
=nuaG
-----END PGP SIGNATURE-----

--yxo2br3bzecmdszc--
