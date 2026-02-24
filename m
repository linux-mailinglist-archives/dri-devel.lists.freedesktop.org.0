Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cG9yMIa4nWnERQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 15:41:10 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7801A18882C
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 15:41:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BC9A10E5AC;
	Tue, 24 Feb 2026 14:41:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="gA+g57Qa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20A3A10E5A6;
 Tue, 24 Feb 2026 14:41:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id B7CFB41791;
 Tue, 24 Feb 2026 14:41:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 125EFC116D0;
 Tue, 24 Feb 2026 14:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771944066;
 bh=dCGqyI+rHlM3XyQ2QUXSu5nZVqUPyjQmE2WK/m+d8es=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gA+g57QadLSgYtZf5xm7d+YH2vzWtEJsVtb2Yjxr294TnnPP+klHUGgRSnbPFMw4x
 vN4u/6wEExddpZypJjzNjT69Biz0S7GhYqq6J0L/D89mD25k39ddaOwSfiHZFcORpB
 MHAPLNeeqHAbnixkSvJidVV++YvN2rxpS7uIXzEFvqc3bY9BP8iOs2FUowmNn8CRfI
 s/uC/D5eHcKGqEVAipY4dqrtOP1JEAMVx/Cvtg+rY5lZdhIuEVymyUaO3aPbTphh/1
 0Aa45VuNgSw1tFOaTKc4DSFTJ5elMVbaSEJ5PHaSLECpTUgsK5Gs42ik0H0ntIdmDW
 VG5P3hlMYHljA==
Date: Tue, 24 Feb 2026 15:41:04 +0100
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
 Rob Herring <robh@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 kernel@collabora.com, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-doc@vger.kernel.org
Subject: Re: [PATCH v8 05/20] drm/display: hdmi-state-helper: Act on color
 format DRM property
Message-ID: <20260224-hot-adaptable-sawfish-dd0f7a@houat>
References: <20260216-color-format-v8-0-5722ce175dd5@collabora.com>
 <20260216-color-format-v8-5-5722ce175dd5@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="5cwb2y5kukdqwgqq"
Content-Disposition: inline
In-Reply-To: <20260216-color-format-v8-5-5722ce175dd5@collabora.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.41 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[36];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FREEMAIL_CC(0.00)[amd.com,igalia.com,gmail.com,ffwll.ch,linux.intel.com,suse.de,intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,rock-chips.com,sntech.de,ursulin.net,pengutronix.de,lwn.net,collabora.com,lists.freedesktop.org,vger.kernel.org,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	FROM_NEQ_ENVFROM(0.00)[mripard@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 7801A18882C
X-Rspamd-Action: no action


--5cwb2y5kukdqwgqq
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v8 05/20] drm/display: hdmi-state-helper: Act on color
 format DRM property
MIME-Version: 1.0

On Mon, Feb 16, 2026 at 02:01:19PM +0100, Nicolas Frattaroli wrote:
> With the introduction of the "color format" DRM property, which allows
> userspace to request a specific color format, the HDMI state helper
> should implement this.
>=20
> Implement it by translating the requested drm_color_format_enum to an
> hdmi_colorspace enum value. Auto is translated to RGB, and a fallback to
> YUV420 is only performed if the original color format was auto.
>=20
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  drivers/gpu/drm/display/drm_hdmi_state_helper.c | 28 +++++++++++++++++++=
++++--
>  1 file changed, 26 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gp=
u/drm/display/drm_hdmi_state_helper.c
> index a1d16762ac7a..3ba752200984 100644
> --- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> +++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> @@ -649,10 +649,34 @@ hdmi_compute_config(const struct drm_connector *con=
nector,
>  	unsigned int max_bpc =3D clamp_t(unsigned int,
>  				       conn_state->max_bpc,
>  				       8, connector->max_bpc);
> +	enum hdmi_colorspace fmt;
>  	int ret;
> =20
> -	ret =3D hdmi_compute_format_bpc(connector, conn_state, mode, max_bpc,
> -				      HDMI_COLORSPACE_RGB);
> +	switch (conn_state->color_format) {
> +	case DRM_COLOR_FORMAT_ENUM_AUTO:
> +	case DRM_COLOR_FORMAT_ENUM_RGB444:
> +		fmt =3D HDMI_COLORSPACE_RGB;
> +		break;
> +	case DRM_COLOR_FORMAT_ENUM_YCBCR444:
> +		fmt =3D HDMI_COLORSPACE_YUV444;
> +		break;
> +	case DRM_COLOR_FORMAT_ENUM_YCBCR422:
> +		fmt =3D HDMI_COLORSPACE_YUV422;
> +		break;
> +	case DRM_COLOR_FORMAT_ENUM_YCBCR420:
> +		fmt =3D HDMI_COLORSPACE_YUV420;
> +		break;
> +	default:
> +		drm_dbg_kms(connector->dev, "HDMI does not support color format '%s'.\=
n",
> +			    drm_get_color_format_name(conn_state->color_format));
> +		return -EINVAL;
> +	}
> +
> +	ret =3D hdmi_compute_format_bpc(connector, conn_state, mode, max_bpc, f=
mt);
> +
> +	if (conn_state->color_format !=3D DRM_COLOR_FORMAT_ENUM_AUTO)
> +		return ret;
> +

This should also be greatly simplified since you don't need to deal with
hdmi_colorspace anymore, and thus you'll just be able to use the
construct I hinted at in the previous version.

Maxime

--5cwb2y5kukdqwgqq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaZ24fwAKCRAnX84Zoj2+
dh+wAXwKmT5KayIifDoxyitEKWs6EiYUCC2SA4Bg4ruLTVA9Xs//EiWw+hYVo/kQ
7bFTr10BgODaA1IvjwBbTyIPz0upLTeNeVbfqL/ghdTyMm5jaRR3hNM7V9lXYvtY
SsWWbJGYdQ==
=YUqC
-----END PGP SIGNATURE-----

--5cwb2y5kukdqwgqq--
