Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yPMYCPb1hWnHIgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 15:08:54 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C79FEA36
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 15:08:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D27410E7BD;
	Fri,  6 Feb 2026 14:08:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="m4RMr14q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7621210E7B8;
 Fri,  6 Feb 2026 14:08:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 59BB960122;
 Fri,  6 Feb 2026 14:08:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 831ACC19421;
 Fri,  6 Feb 2026 14:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1770386929;
 bh=+lIi82NYDZHy3722msFtnCnh1tdb9jn2hqegryuZsv4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=m4RMr14qRzstPqItXkr/5OrxYDpSQG71tOjhHOic63cYTk2SvrNErOgO5dHJfp3e+
 w7mK5YUkXGNJsdh25Qt6kj+8LUHS80HPi0P5lONF4st4Nco+/Sofu1DKJuGM4rIyVK
 ++miMRAzAaKZ+aYUde9ZK/SSUFkNgF7GDYMJGbJidLXVGRq/X/9SvV68gm3Mm1OolL
 UQxfwaFyVy1yBltxH4sPXnnMsuuaLmfTlQtUHylW1jIt+1zqA6J+LKbJolNgvTMPSR
 kCEyA7JrZKZFYDLSIcn+HvgY63cZPo4nIIpoFQ/M8EaON7rZbm/BPoEFaso2y0rDs2
 OB1otDCYh9zwQ==
Date: Fri, 6 Feb 2026 15:08:46 +0100
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
 linux-doc@vger.kernel.org, Marius Vlad <marius.vlad@collabora.com>
Subject: Re: [PATCH v7 03/22] drm: Add enum conversions between
 DRM_COLOR_FORMAT and HDMI_COLORSPACE
Message-ID: <20260206-angelic-crimson-bug-aaab40@houat>
References: <20260121-color-format-v7-0-ef790dae780c@collabora.com>
 <20260121-color-format-v7-3-ef790dae780c@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="7kyo6gozxaybulie"
Content-Disposition: inline
In-Reply-To: <20260121-color-format-v7-3-ef790dae780c@collabora.com>
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
	FREEMAIL_CC(0.00)[amd.com,igalia.com,gmail.com,ffwll.ch,linux.intel.com,suse.de,intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,rock-chips.com,sntech.de,ursulin.net,pengutronix.de,lwn.net,collabora.com,lists.freedesktop.org,vger.kernel.org,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[mripard@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,collabora.com:email]
X-Rspamd-Queue-Id: A8C79FEA36
X-Rspamd-Action: no action


--7kyo6gozxaybulie
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v7 03/22] drm: Add enum conversions between
 DRM_COLOR_FORMAT and HDMI_COLORSPACE
MIME-Version: 1.0

On Wed, Jan 21, 2026 at 03:45:10PM +0100, Nicolas Frattaroli wrote:
> While the two enums have similar values, they're not identical, and
> HDMI's enum is defined as per the HDMI standard.
>=20
> Add a simple conversion function from DRM to HDMI. Unexpected inputs
> aren't handled in any clever way, DRM_COLOR_FORMAT_AUTO and any other
> value that doesn't cleanly map to HDMI just gets returned as
> HDMI_COLORSPACE_RGB.
>=20
> Add a second conversion function that gets a DRM_COLOR_FORMAT from an
> HDMI_COLORSPACE as well. In this case, reserved HDMI values that can't
> be converted will result in an -EINVAL return value.
>=20
> Co-developed-by: Marius Vlad <marius.vlad@collabora.com>
> Signed-off-by: Marius Vlad <marius.vlad@collabora.com>
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  include/drm/drm_connector.h | 54 +++++++++++++++++++++++++++++++++++++++=
++++++
>  1 file changed, 54 insertions(+)
>=20
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index b5604dca728a..ffeb42f3b4a3 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -2612,6 +2612,60 @@ int drm_connector_attach_color_format_property(str=
uct drm_connector *connector);
> =20
>  const char *drm_get_color_format_name(enum drm_color_format color_fmt);
> =20
> +/**
> + * drm_color_format_to_hdmi_colorspace - convert DRM color format to HDMI
> + * @fmt: the &enum drm_color_format to convert
> + *
> + * Convert a given &enum drm_color_format to an equivalent
> + * &enum hdmi_colorspace. For non-representable values and
> + * %DRM_COLOR_FORMAT_AUTO, the value %HDMI_COLORSPACE_RGB is returned.
> + *
> + * Returns: the corresponding &enum hdmi_colorspace value
> + */
> +static inline enum hdmi_colorspace __pure
> +drm_color_format_to_hdmi_colorspace(enum drm_color_format fmt)
> +{
> +	switch (fmt) {
> +	default:
> +	case DRM_COLOR_FORMAT_AUTO:
> +	case DRM_COLOR_FORMAT_RGB444:
> +		return HDMI_COLORSPACE_RGB;

I don't think that's correct. What auto ends up as totally depends on
the atomic state it comes with.

At the very least, you should output a warning there, because that case
should never happen.

> +	case DRM_COLOR_FORMAT_YCBCR444:
> +		return HDMI_COLORSPACE_YUV444;
> +	case DRM_COLOR_FORMAT_YCBCR422:
> +		return HDMI_COLORSPACE_YUV422;
> +	case DRM_COLOR_FORMAT_YCBCR420:
> +		return HDMI_COLORSPACE_YUV420;
> +	}
> +}
> +
> +/**
> + * drm_color_format_from_hdmi_colorspace - convert HDMI color format to =
DRM
> + * @fmt: the &enum hdmi_colorspace to convert
> + *
> + * Convert a given &enum hdmi_colorspace to an equivalent
> + * &enum drm_color_format. For non-representable values,
> + * %-EINVAL is returned.
> + *
> + * Returns: the corresponding &enum drm_color_format value, or %-EINVAL
> + */
> +static inline enum drm_color_format __pure
> +drm_color_format_from_hdmi_colorspace(enum hdmi_colorspace fmt)
> +{
> +	switch (fmt) {
> +	default:
> +		return -EINVAL;

Wait, what?

-EINVAL is not a valid value for your enum.

Maxime

--7kyo6gozxaybulie
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaYX17QAKCRAnX84Zoj2+
dhqKAX9uCw/1iLG+7nCh7iWCwrhqxfm0JVwIRRQh/zjRf8Wet9GKZ9b66ZGwYC8M
tXJZuowBgKH3e2XNrltRlENhX1pPWeDhYlezTP12g5E34y5OGMYep2YcNBUO0/Ck
6YOwGJvwTQ==
=PPqS
-----END PGP SIGNATURE-----

--7kyo6gozxaybulie--
