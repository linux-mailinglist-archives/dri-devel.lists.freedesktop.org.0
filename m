Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eDevAFdOpWnS8QUAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 09:46:15 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5E4B1D4D1C
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 09:46:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E68AE10E1ED;
	Mon,  2 Mar 2026 08:46:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="s5TC01pa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CBBE10E1D7;
 Mon,  2 Mar 2026 08:46:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id D42EB437BD;
 Mon,  2 Mar 2026 08:46:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A83AC19423;
 Mon,  2 Mar 2026 08:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772441169;
 bh=YLIStkIR1KJnf5YwD17+MZnntYrS4W0CEDe/6e+dJPw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=s5TC01paLL43eTxonms1l0UTMB4QscnLOYJJh0RDmcC95ZK4NIh4yD4712OZgUuCL
 tGqNwHCeuKPPfd/Y9RMuzjFpMVmtx4gMtyFak2D4RcHbIe5Vj6uBb69MFJcJn8i1MV
 LZ3G6cmaomOi4BrrxqreSH1M6xtIAVmo/cePrRxgpg98RMOH0Y27kjzCOFgFY32W9Z
 YScYRspyy630xCT3XFhu+bPmy9R1s9nWAjo80hSv3xIbOX0venX94Nvrxjj1aRNf4p
 kRf4aeZrCSzUJ13Por+I5nwALTVi5dTSqYKsEbG78P6SkwRUpll2ijXXo3iGzov5Qj
 htsykmjAjatjw==
Date: Mon, 2 Mar 2026 09:46:06 +0100
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
 Shuah Khan <skhan@linuxfoundation.org>, kernel@collabora.com,
 amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-doc@vger.kernel.org
Subject: Re: [PATCH v9 04/19] drm/display: hdmi-state-helper: Act on color
 format DRM property
Message-ID: <20260302-literate-shrew-of-health-ec19d2@houat>
References: <20260227-color-format-v9-0-658c3b9db7ef@collabora.com>
 <20260227-color-format-v9-4-658c3b9db7ef@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="vlv6rbxnnxkik4dv"
Content-Disposition: inline
In-Reply-To: <20260227-color-format-v9-4-658c3b9db7ef@collabora.com>
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
	RCPT_COUNT_TWELVE(0.00)[37];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FREEMAIL_CC(0.00)[amd.com,igalia.com,gmail.com,ffwll.ch,linux.intel.com,suse.de,intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,rock-chips.com,sntech.de,ursulin.net,pengutronix.de,lwn.net,linuxfoundation.org,collabora.com,lists.freedesktop.org,vger.kernel.org,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FROM_NEQ_ENVFROM(0.00)[mripard@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: A5E4B1D4D1C
X-Rspamd-Action: no action


--vlv6rbxnnxkik4dv
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v9 04/19] drm/display: hdmi-state-helper: Act on color
 format DRM property
MIME-Version: 1.0

Hi,

On Fri, Feb 27, 2026 at 08:20:09PM +0100, Nicolas Frattaroli wrote:
> With the introduction of the "color format" DRM property, which allows
> userspace to request a specific color format, the HDMI state helper
> should implement this.
>=20
> Implement it by translating the requested drm_connector_color_format to
> a drm_output_color_format enum value as per the logic HDMI should use
> for this: Auto is translated to RGB, and a fallback to YUV420 is only
> performed if the original color format was auto.
>=20
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  drivers/gpu/drm/display/drm_hdmi_state_helper.c | 28 +++++++++++++++++++=
++++--
>  1 file changed, 26 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gp=
u/drm/display/drm_hdmi_state_helper.c
> index 9f3b696aceeb..31c6d55fa995 100644
> --- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> +++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> @@ -669,10 +669,34 @@ hdmi_compute_config(const struct drm_connector *con=
nector,
>  	unsigned int max_bpc =3D clamp_t(unsigned int,
>  				       conn_state->max_bpc,
>  				       8, connector->max_bpc);
> +	enum drm_output_color_format fmt;
>  	int ret;
> =20
> -	ret =3D hdmi_compute_format_bpc(connector, conn_state, mode, max_bpc,
> -				      DRM_OUTPUT_COLOR_FORMAT_RGB444);
> +	switch (conn_state->color_format) {
> +	case DRM_CONNECTOR_COLOR_FORMAT_AUTO:
> +	case DRM_CONNECTOR_COLOR_FORMAT_RGB444:
> +		fmt =3D DRM_OUTPUT_COLOR_FORMAT_RGB444;
> +		break;
> +	case DRM_CONNECTOR_COLOR_FORMAT_YCBCR444:
> +		fmt =3D DRM_OUTPUT_COLOR_FORMAT_YCBCR444;
> +		break;
> +	case DRM_CONNECTOR_COLOR_FORMAT_YCBCR422:
> +		fmt =3D DRM_OUTPUT_COLOR_FORMAT_YCBCR422;
> +		break;
> +	case DRM_CONNECTOR_COLOR_FORMAT_YCBCR420:
> +		fmt =3D DRM_OUTPUT_COLOR_FORMAT_YCBCR420;
> +		break;
> +	default:
> +		drm_dbg_kms(connector->dev, "HDMI does not support color format '%d'.\=
n",
> +			    conn_state->color_format);
> +		return -EINVAL;
> +	}
> +
> +	ret =3D hdmi_compute_format_bpc(connector, conn_state, mode, max_bpc, f=
mt);
> +
> +	if (conn_state->color_format !=3D DRM_CONNECTOR_COLOR_FORMAT_AUTO)
> +		return ret;
> +

We discussed it before, and it wasn't as trivial as it should have been,
but now, I really feel something like the following would be simpler:

if (conn_state->color_format !=3D DRM_CONNECTOR_COLOR_FORMAT_AUTO) {
	enum drm_output_color_format fmt;

	switch (conn_state->color_format) {
	case DRM_CONNECTOR_COLOR_FORMAT_AUTO:
	     drm_warn(connector->dev, "The format shouldn't be auto here"); // or =
any better message
	     fallthrough;
	case DRM_CONNECTOR_COLOR_FORMAT_RGB444:
	     fmt =3D DRM_OUTPUT_COLOR_FORMAT_RGB444;
	     break;
	....
	}

	return hdmi_compute_format_bpc(connector, conn_state, mode, max_bpc, fmt);
}

ret =3D hdmi_compute_format_bpc(connector, conn_state, mode, max_bpc,
			      DRM_OUTPUT_COLOR_FORMAT_RGB444);

It makes it much clearer what the two branches are, and we don't have to
test for auto multiple times.

Maxime

--vlv6rbxnnxkik4dv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaaVOSgAKCRAnX84Zoj2+
duj9AYC6G+CPt23Nm72keJB2VkI/OrdBkSffWrgwixDMIES2m/uxHVPMi8koLjpl
BYFiCIUBf0RielKN8kXZvqBYg3FOuVBkylhQtEUK3blNIgR3cHtExnVL3+ecatTR
DqljNp/Vrw==
=9ih2
-----END PGP SIGNATURE-----

--vlv6rbxnnxkik4dv--
