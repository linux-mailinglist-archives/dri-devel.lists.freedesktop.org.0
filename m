Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sLUoHKtYi2ljUAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 17:11:23 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 039F011CF18
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 17:11:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 262D910E5D1;
	Tue, 10 Feb 2026 16:11:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="XSXXGD/3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FBCF10E5C3;
 Tue, 10 Feb 2026 16:11:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 11B16436D0;
 Tue, 10 Feb 2026 16:11:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67E66C116C6;
 Tue, 10 Feb 2026 16:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1770739876;
 bh=ITzsRriLdI5AlO8qTFsF93iE7x8hevfEpKEaEvWHfiY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XSXXGD/3560UYv7bxgkmpAZgbTUAwlwIcztwT5II4ShE8gEXmGpMND8quWyNmJi+g
 He+nm9YGb92CvSobiaD08rbOxRJgi00yV7zkNyfq5zpOgtZphiJ2+T6rSlw3U2o/K7
 UuhDTCszBnAB5Fe5T3XVhC5W5sZOMKv4lDaIpiecXfluZb/8+G4xp/Zs4XjnkXZ++T
 mvpvlotwNKRfDGVlQuio+OqM1/fF0Ui+GTmnME01SH3J4QlTKv843SYRg+JGERs1ye
 Hxd+P+8wcYXukEJ/MdkL74ar3rtG+mvvnR2B1TzRuc/iWzz60MWYo/P9z1pfa7MEtU
 I8W9RRabxeYBQ==
Date: Tue, 10 Feb 2026 17:11:14 +0100
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
Subject: Re: [PATCH v7 21/22] drm/tests: bridge: Add KUnit tests for bridge
 chain format selection
Message-ID: <20260210-dancing-thankful-booby-dab0ed@houat>
References: <20260121-color-format-v7-0-ef790dae780c@collabora.com>
 <20260121-color-format-v7-21-ef790dae780c@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="g6geynrgndywzzd4"
Content-Disposition: inline
In-Reply-To: <20260121-color-format-v7-21-ef790dae780c@collabora.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[36];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FROM_NEQ_ENVFROM(0.00)[mripard@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[amd.com,igalia.com,gmail.com,ffwll.ch,linux.intel.com,suse.de,intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,rock-chips.com,sntech.de,ursulin.net,pengutronix.de,lwn.net,collabora.com,lists.freedesktop.org,vger.kernel.org,lists.infradead.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,collabora.com:email]
X-Rspamd-Queue-Id: 039F011CF18
X-Rspamd-Action: no action


--g6geynrgndywzzd4
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v7 21/22] drm/tests: bridge: Add KUnit tests for bridge
 chain format selection
MIME-Version: 1.0

Hi,

On Wed, Jan 21, 2026 at 03:45:28PM +0100, Nicolas Frattaroli wrote:
> With the "color format" property, the bridge chain format selection has
> gained increased complexity. Instead of simply finding any sequence of
> bus formats that works, the bridge chain format selection needs to pick
> a sequence that results in the requested color format.
>=20
> Add KUnit tests for this new logic. These take the form of some pleasant
> preprocessor macros to make it less cumbersome to define test bridges
> with a set of possible input and output formats.
>=20
> The input and output formats are defined for bridges in the form of
> tuples, where the first member defines the input format, and the second
> member defines the output format that can be produced from this input
> format. This means the tests can construct scenarios in which not all
> inputs can be converted to all outputs.
>=20
> Some tests are added to test interesting scenarios to exercise the bus
> format selection in the presence of a specific color format request.
>=20
> Furthermore, tests are added to verify that bridge chains that end in an
> HDMI connector will always prefer RGB when the color format is
> DRM_COLOR_FORMAT_AUTO, as is the behaviour in the HDMI state helpers.
>=20
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  drivers/gpu/drm/tests/drm_bridge_test.c | 812 ++++++++++++++++++++++++++=
++++++
>  1 file changed, 812 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/tests/drm_bridge_test.c b/drivers/gpu/drm/te=
sts/drm_bridge_test.c
> index 887020141c7f..ac86f3dfe518 100644
> --- a/drivers/gpu/drm/tests/drm_bridge_test.c
> +++ b/drivers/gpu/drm/tests/drm_bridge_test.c
> @@ -2,15 +2,23 @@
>  /*
>   * Kunit test for drm_bridge functions
>   */
> +#include <linux/cleanup.h>
> +#include <linux/media-bus-format.h>
> +
>  #include <drm/drm_atomic_state_helper.h>
> +#include <drm/drm_atomic_uapi.h>
>  #include <drm/drm_bridge.h>
>  #include <drm/drm_bridge_connector.h>
>  #include <drm/drm_bridge_helper.h>
> +#include <drm/drm_edid.h>
>  #include <drm/drm_kunit_helpers.h>
> +#include <drm/drm_managed.h>
> =20
>  #include <kunit/device.h>
>  #include <kunit/test.h>
> =20
> +#include "drm_kunit_edid.h"
> +
>  /*
>   * Mimick the typical "private" struct defined by a bridge driver, which
>   * embeds a bridge plus other fields.
> @@ -37,6 +45,27 @@ struct drm_bridge_init_priv {
>  	bool destroyed;
>  };
> =20
> +struct drm_bridge_chain_priv {
> +	struct drm_device drm;
> +	struct drm_encoder encoder;
> +	struct drm_plane *plane;
> +	struct drm_crtc *crtc;
> +	struct drm_connector *connector;
> +	unsigned int num_bridges;
> +
> +	/**
> +	 * @test_bridges: array of pointers to &struct drm_bridge_priv entries
> +	 *                of which the first @num_bridges entries are valid.
> +	 */
> +	struct drm_bridge_priv **test_bridges;
> +	/**
> +	 * @destroyed: bool array of size @num_bridges serving the same function
> +	 *             as &struct drm_bridge_init_priv::destroyed does for a
> +	 *             single bridge test.
> +	 */
> +	bool *destroyed;

AFAIK, the destroyed field was added to test the refcounting work. We
don't really need it here, so there's no point in adding it I.

> +};
> +
>  static struct drm_bridge_priv *bridge_to_priv(struct drm_bridge *bridge)
>  {
>  	return container_of(bridge, struct drm_bridge_priv, bridge);
> @@ -50,6 +79,21 @@ static void drm_test_bridge_priv_destroy(struct drm_br=
idge *bridge)
>  	priv->destroyed =3D true;
>  }
> =20
> +static void drm_test_bridge_chain_priv_destroy(struct drm_bridge *bridge)
> +{
> +	struct drm_bridge_priv *bridge_priv =3D bridge_to_priv(bridge);
> +	struct drm_bridge_chain_priv *priv =3D (struct drm_bridge_chain_priv *)=
bridge_priv->data;
> +	unsigned int i;
> +
> +	for (i =3D 0; i < priv->num_bridges; i++) {
> +		if (priv->test_bridges[i] !=3D bridge_priv)
> +			continue;
> +
> +		priv->destroyed[i] =3D true;
> +		break;
> +	}
> +}
> +

And similarly, we probably can drop that hook.

With this fixed,
Reviewed-by: Maxime Ripard <mripard@kernel.org>

Maxime

--g6geynrgndywzzd4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaYtYoQAKCRAnX84Zoj2+
di5iAYD/lFm+vxmy4mdgQYgEVgUJL+5WwxuOrzELYFH6kZKY4kAa6NiKoFehFooW
3mN/uVsBfAq2ELgOmtJcqmMvvYIagFtwn5RS9WWH7gcGFwEMpd6VXibLSJV9d/2M
arOHW5vuZw==
=rs25
-----END PGP SIGNATURE-----

--g6geynrgndywzzd4--
