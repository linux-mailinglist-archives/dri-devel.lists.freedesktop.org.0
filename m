Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E7208D489F
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2024 11:34:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1812111A9A2;
	Thu, 30 May 2024 09:34:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="uJyu+LBg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E5E611A8AF
 for <dri-devel@lists.freedesktop.org>; Thu, 30 May 2024 09:34:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 470B3CE1802;
 Thu, 30 May 2024 09:34:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F31D2C2BBFC;
 Thu, 30 May 2024 09:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1717061667;
 bh=tEQu35CaxhT9+Q6qAEJEskYUshMXy0do6KkUt7ceXLw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uJyu+LBgo9JPAAsFFLlXJ1qJFP+qD0BC7jiXxbKMh0txds+0+h8QZeLsZs5yn95tj
 rIBoQINUONJ1IgqwfT+eXCz7QwhlNHCdJTj9uHbAcpmwFbhLTzjMbp8PmZ5uQhcJ4q
 Y2rlMKe+XYLdEFmN0vvC7xw4YLX68qGDBrUEP1fdvx0mxVGbHVNnh8rOc5145zvEWT
 4NEuknsI7Q1I7vpgAC2eBqe2fxpawGQ4UxsKqZo8dMU17QNWb6kjRL/lz8qxfQ50d8
 /smnXzxTnDqo2ql3epJ2Hs0c+hYeH615vfDPT43W4MVaqEjCghDVG4XMAtUJ2RlAPl
 7JjMDbNIB+hWg==
Date: Thu, 30 May 2024 11:34:24 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Jayesh Choudhary <j-choudhary@ti.com>
Cc: linux-kernel@vger.kernel.org, dmitry.baryshkov@linaro.org, 
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
 Laurent.pinchart@ideasonboard.com, sam@ravnborg.org, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, 
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@gmail.com,
 daniel@ffwll.ch, a-bhatia1@ti.com, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v4 2/2] drm/bridge: Add pixel clock check in atomic_check
Message-ID: <20240530-spiked-psychedelic-monkey-ddd0b0@houat>
References: <20240530092930.434026-1-j-choudhary@ti.com>
 <20240530092930.434026-3-j-choudhary@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="eqvyt5rrxiedz2k4"
Content-Disposition: inline
In-Reply-To: <20240530092930.434026-3-j-choudhary@ti.com>
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


--eqvyt5rrxiedz2k4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, May 30, 2024 at 02:59:30PM GMT, Jayesh Choudhary wrote:
> Check the pixel clock for the mode in atomic_check and ensure that
> it is within the range supported by the bridge.
>=20
> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
> ---
>  drivers/gpu/drm/bridge/sii902x.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/bridge/sii902x.c b/drivers/gpu/drm/bridge/si=
i902x.c
> index 6a6055a4ccf9..1bf2f14a772d 100644
> --- a/drivers/gpu/drm/bridge/sii902x.c
> +++ b/drivers/gpu/drm/bridge/sii902x.c
> @@ -494,6 +494,12 @@ static int sii902x_bridge_atomic_check(struct drm_br=
idge *bridge,
>  				       struct drm_crtc_state *crtc_state,
>  				       struct drm_connector_state *conn_state)
>  {
> +	if (crtc_state->mode.clock < SII902X_MIN_PIXEL_CLOCK_KHZ)
> +		return MODE_CLOCK_LOW;
> +
> +	if (crtc_state->mode.clock > SII902X_MAX_PIXEL_CLOCK_KHZ)
> +		return MODE_CLOCK_HIGH;
> +

atomic_check doesn't return drm_mode_status but regular error codes (0
on success, negative error code on failure)

Maxime

--eqvyt5rrxiedz2k4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZlhIIAAKCRAnX84Zoj2+
dmtDAYDKG/BmH6pQDT3/a9jAZw6MLC3PDP1ck88oGHUNjjKiyUhwBwrTl/m0ZG4E
BnoybWsBgMVO4kmBlXkJ4Ee2H26nQTt68ithsfMMFyxYYmZ6gS2qoV6snRnbJ9SF
KUcF31qy8g==
=SvhA
-----END PGP SIGNATURE-----

--eqvyt5rrxiedz2k4--
