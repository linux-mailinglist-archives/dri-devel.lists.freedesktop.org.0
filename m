Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64CD6A6BCC7
	for <lists+dri-devel@lfdr.de>; Fri, 21 Mar 2025 15:18:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5079F10E00D;
	Fri, 21 Mar 2025 14:18:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="h28JaQj+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67A0610E00D
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Mar 2025 14:18:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id F28D4A468B3;
 Fri, 21 Mar 2025 14:12:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77ACFC4CEEC;
 Fri, 21 Mar 2025 14:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742566680;
 bh=0amfkrO3B1zq5t8fnOfrUB4M+QOIpfFLARmwtZZfJw4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=h28JaQj+Cuj1LkqH51sg7oXGnIp4dVVxPZLz+0RAoJ/cvMEaPF8oIsuaNLxg6oydV
 r1yJNsBhghnpG5hehz+YWKOib6wlXmRNYJP7ecTb3km28qnRD6pBOoGxDewxc4Udqp
 M3VCQqx7xzCwXw05YFYf0I++tTrBW3LCeKuiIctyDlwgH9flhmRhKbywagZErNUwkl
 z+mg2s7FssEr24uOfvVkTLbAuEnEKhf3y/Qzh1gNfpYQYjqJpFejFsahS/CASq8/IB
 ZlJyi2L7eqISoLmTCRdL3u9zf1QNz6RraU3518vXPG/QTtwiQLFWd2PA6UUZZMcqLT
 qZ8Zkfy0Bycew==
Date: Fri, 21 Mar 2025 15:17:57 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Jyri Sarha <jyri.sarha@iki.fi>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org, Francesco Dolcini <francesco@dolcini.it>, 
 Aradhya Bhatia <aradhya.bhatia@linux.dev>, Devarsh Thakkar <devarsht@ti.com>
Subject: Re: [PATCH 03/18] drm/tidss: Add mode_fixup to adjust the clock
 based on HW
Message-ID: <20250321-adaptable-astonishing-adder-ceeb6f@houat>
References: <20250320-cdns-dsi-impro-v1-0-725277c5f43b@ideasonboard.com>
 <20250320-cdns-dsi-impro-v1-3-725277c5f43b@ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="bchtvmz6w2bii2si"
Content-Disposition: inline
In-Reply-To: <20250320-cdns-dsi-impro-v1-3-725277c5f43b@ideasonboard.com>
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


--bchtvmz6w2bii2si
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 03/18] drm/tidss: Add mode_fixup to adjust the clock
 based on HW
MIME-Version: 1.0

On Thu, Mar 20, 2025 at 05:59:58PM +0200, Tomi Valkeinen wrote:
> At the moment the driver just sets the clock rate with clk_set_rate(),
> and if the resulting rate is not the same as requested, prints a debug
> print, but nothing else.
>=20
> Add mode_fixup(), in which the clk_round_rate() is used to get the
> "rounded" rate, and set that to the adjusted_mode.
>=20
> In practice, with the current K3 SoCs, the display PLL is capable of
> producing very exact clocks, so most likely the rounded rate is the same
> as the original one.
>=20
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/gpu/drm/tidss/tidss_crtc.c  | 22 ++++++++++++++++++++++
>  drivers/gpu/drm/tidss/tidss_dispc.c |  6 ++++++
>  drivers/gpu/drm/tidss/tidss_dispc.h |  2 ++
>  3 files changed, 30 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/tidss/tidss_crtc.c b/drivers/gpu/drm/tidss/t=
idss_crtc.c
> index 1604eca265ef..b3338dac25bc 100644
> --- a/drivers/gpu/drm/tidss/tidss_crtc.c
> +++ b/drivers/gpu/drm/tidss/tidss_crtc.c
> @@ -309,7 +309,29 @@ enum drm_mode_status tidss_crtc_mode_valid(struct dr=
m_crtc *crtc,
>  	return dispc_vp_mode_valid(tidss->dispc, tcrtc->hw_videoport, mode);
>  }
> =20
> +static bool tidss_crtc_mode_fixup(struct drm_crtc *crtc,
> +				  const struct drm_display_mode *mode,
> +				  struct drm_display_mode *adjusted_mode)
> +{
> +	struct tidss_crtc *tcrtc =3D to_tidss_crtc(crtc);
> +	struct drm_device *ddev =3D crtc->dev;
> +	struct tidss_device *tidss =3D to_tidss(ddev);
> +	long rate;
> +
> +	rate =3D dispc_vp_round_clk_rate(tidss->dispc, tcrtc->hw_videoport,
> +				       adjusted_mode->clock * 1000);
> +	if (rate < 0)
> +		return false;
> +
> +	adjusted_mode->clock =3D rate / 1000;
> +
> +	drm_mode_set_crtcinfo(adjusted_mode, 0);
> +
> +	return true;
> +}

mode_fixup is deprecated in favor of atomic_check. If you can't use it
for some reason, it should be documented one way or another.

Maxime

--bchtvmz6w2bii2si
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ911EQAKCRAnX84Zoj2+
dgndAYCh/YgKmD2eT0IGBSW4oFScUbO0JiE0c6rJgT/fOlLd8ZyEQUmNR3/ihtKv
L3mLPUwBgN2SlLXG4F2ri8LKeYXjbpOagi9fMufwxwGrEzWDluOQ6RSb6Ak7/Y/H
uemPVUoFyg==
=QyZO
-----END PGP SIGNATURE-----

--bchtvmz6w2bii2si--
