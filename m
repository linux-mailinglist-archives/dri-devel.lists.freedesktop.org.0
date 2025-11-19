Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD0A2C6D986
	for <lists+dri-devel@lfdr.de>; Wed, 19 Nov 2025 10:09:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E3C410E5AF;
	Wed, 19 Nov 2025 09:09:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="p4sJxhsc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B105610E235;
 Wed, 19 Nov 2025 09:09:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id C3D6260126;
 Wed, 19 Nov 2025 09:09:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D90FEC19422;
 Wed, 19 Nov 2025 09:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763543356;
 bh=+1HPP22PaKWLUevFX1vAmOxfjO0b8JOvbGvTRPjJYUA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=p4sJxhsck9IfFgog3AIfaPf7AtGxvdSlsYPWuh91c7Ec6+x6rmfH6elMA0GZuvaUj
 QslVhHp2JVo2NFayZQR9MTnizjOB+IRzc7d72FpI9rfwp2YcLMWFfjQ3D9VTjabp9J
 r15J3D/nn8Gh2hdxqEV6yYVGDD0QDuVuLOgfTlEVwn6VxCZNKfHs1bH/l1qlfYPhI5
 aKTqL8xrZZkKTIkG9wOAvImZZuj9yYmZfl6og/9rNlhs6gkaeQt/Zlyk+lnOTsTNOm
 8Lk3S+r3L3IGNmz+CGBHJruzHLKyfH0xkf7QNouQy+dZgVgV/f7ywQwpJBsLyzhKnc
 94/2LYXtk7ESQ==
Date: Wed, 19 Nov 2025 10:09:12 +0100
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
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH v4 07/10] drm/display: hdmi-state-helper: Act on color
 format DRM property
Message-ID: <4wt5dbvseauo2bvi66ohtk445zsfjtpjwgvochwwlyk4uugcmy@5ubwtkxyy2ax>
References: <20251117-color-format-v4-0-0ded72bd1b00@collabora.com>
 <20251117-color-format-v4-7-0ded72bd1b00@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="g7dod4m5dqesnsxw"
Content-Disposition: inline
In-Reply-To: <20251117-color-format-v4-7-0ded72bd1b00@collabora.com>
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


--g7dod4m5dqesnsxw
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 07/10] drm/display: hdmi-state-helper: Act on color
 format DRM property
MIME-Version: 1.0

Hi,

On Mon, Nov 17, 2025 at 08:11:51PM +0100, Nicolas Frattaroli wrote:
> With the introduction of the "color format" DRM property, which allows
> userspace to request a specific color format, the HDMI state helper
> should implement this.
>=20
> Implement it by checking whether the property is set and set to
> something other than auto. If so, pass the requested color format, and
> otherwise set RGB.
>=20
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  drivers/gpu/drm/display/drm_hdmi_state_helper.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gp=
u/drm/display/drm_hdmi_state_helper.c
> index a561f124be99..add0d51fce33 100644
> --- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> +++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> @@ -650,9 +650,15 @@ hdmi_compute_config(const struct drm_connector *conn=
ector,
>  				       conn_state->max_bpc,
>  				       8, connector->max_bpc);
>  	int ret;
> +	enum hdmi_colorspace hdmi_colorspace;
> +
> +	if (conn_state->color_format && conn_state->color_format !=3D DRM_COLOR=
_FORMAT_AUTO)
> +		hdmi_colorspace =3D color_format_to_hdmi_colorspace(conn_state->color_=
format);
> +	else
> +		hdmi_colorspace =3D HDMI_COLORSPACE_RGB;
> =20
>  	ret =3D hdmi_compute_format_bpc(connector, conn_state, mode, max_bpc,
> -				      HDMI_COLORSPACE_RGB);
> +				      hdmi_colorspace);

I don't think we want the fallback to yuv420 for anything but auto, so
I'd rather have something like

if (conn_state->color_format !=3D DRM_COLOR_FORMAT_AUTO)
   return hdmi_compute_format_bpc(connector, conn_state, mode, max_bpc,
                                  color_format_to_hdmi_colorspace(conn_stat=
e->color_format))

We'll also need unit tests.

Maxime

--g7dod4m5dqesnsxw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaR2JOAAKCRAnX84Zoj2+
dtEmAYCp/6Dikm0A/x5gqwTVUmwZFV53JoaGeoIBiA4pwEOAowFsKpI+xugmq2Uy
GW952vEBf3XTTy8QUzalFvvMIp7d4/Zyq/l8DlUQ1t9FE1TDq1Y6M/VjZ52F+Hka
Dd3K483MMQ==
=xANH
-----END PGP SIGNATURE-----

--g7dod4m5dqesnsxw--
