Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F9B890C546
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 11:25:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F2C310E5F4;
	Tue, 18 Jun 2024 09:25:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="E8SErcXM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04A9810E5F4
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 09:25:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 0A085CE0FD5;
 Tue, 18 Jun 2024 09:25:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDD1EC3277B;
 Tue, 18 Jun 2024 09:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718702700;
 bh=Ou1sGHAbYcRCnm339FMZGstvc9ucxrLdTk4uuMunyiE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=E8SErcXM7F1aNs3h1/MxkKXf9Y+taXsmk3Fnzmi7cydDy5lEq0yfT/ZPjae/6aiNR
 RULI75IExAujDKTorcgzcpnRQOVKF2TMg4iknvl4aK/GrNUl4bpLZKuh4qghdOGHj4
 aR0CCgqy0ArtBt+NZvXYrb135B8Vptz+hUEwxFgLh/mlBGzFLI8V/N+Kjvjq3goEeA
 1H77V8iBeiAiOIyY5dat4m0LZin2muNP3TQCXhmDwkfBl6WuGpTimZK76YmOA5x27V
 X4RPoROgGkkVpGErHN4XiwhAA6qT6bStKw1la7ciOpfiWsCQIV1lwidt0eBFO4XgmB
 nvw9HQheoMTog==
Date: Tue, 18 Jun 2024 11:24:56 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: dri-devel@lists.freedesktop.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Nick Hollinghurst <nick.hollinghurst@raspberrypi.com>
Subject: Re: [PATCH 1/3] drm: Add DRM_MODE_TV_MODE_MONOCHROME
Message-ID: <20240618-nostalgic-warm-ibex-3fcf8a@houat>
References: <20240216184857.245372-1-dave.stevenson@raspberrypi.com>
 <20240216184857.245372-2-dave.stevenson@raspberrypi.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="qtb7mt3xe37zrhq2"
Content-Disposition: inline
In-Reply-To: <20240216184857.245372-2-dave.stevenson@raspberrypi.com>
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


--qtb7mt3xe37zrhq2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Feb 16, 2024 at 06:48:55PM GMT, Dave Stevenson wrote:
> From: Nick Hollinghurst <nick.hollinghurst@raspberrypi.com>
>=20
> Add this as a value for enum_drm_connector_tv_mode, represented
> by the string "Mono", to generate video with no colour encoding
> or bursts. Define it to have no pedestal (since only NTSC-M calls
> for a pedestal).
>=20
> Change default mode creation to acommodate the new tv_mode value
> which comprises both 525-line and 625-line formats.
>=20
> Signed-off-by: Nick Hollinghurst <nick.hollinghurst@raspberrypi.com>
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---
>  drivers/gpu/drm/drm_connector.c    | 7 +++++++
>  drivers/gpu/drm/drm_modes.c        | 5 ++++-
>  drivers/gpu/drm/drm_probe_helper.c | 5 +++--
>  include/drm/drm_connector.h        | 7 +++++++
>  4 files changed, 21 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connec=
tor.c
> index b0516505f7ae..fe05d27f3404 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -1005,6 +1005,7 @@ static const struct drm_prop_enum_list drm_tv_mode_=
enum_list[] =3D {
>  	{ DRM_MODE_TV_MODE_PAL_M, "PAL-M" },
>  	{ DRM_MODE_TV_MODE_PAL_N, "PAL-N" },
>  	{ DRM_MODE_TV_MODE_SECAM, "SECAM" },
> +	{ DRM_MODE_TV_MODE_MONOCHROME, "Mono" },
>  };
>  DRM_ENUM_NAME_FN(drm_get_tv_mode_name, drm_tv_mode_enum_

We'll need to have kunit tests here for that value in:

* drm_cmdline_parser_test to make sure it's properly read from the
  command line
* drm_connector_test to make sure the name is properly associated to its
  enum value
* drm_modes_test to make sure the modes generated for that tv mode
  actually returns 625 lines

Those would all have been additional patches, and the next patches need
a new version as well so please add them to your v2.

Maxime

--qtb7mt3xe37zrhq2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZnFSaAAKCRDj7w1vZxhR
xQ3GAQDkEuMOr0cEJm4voetgdtKkRTO0uUD+42jWelNCEaXMmwD9Eu2j7J0HW6y3
F4OunLAttRVujp4LXIVObjfTT4QIFAI=
=E8nL
-----END PGP SIGNATURE-----

--qtb7mt3xe37zrhq2--
