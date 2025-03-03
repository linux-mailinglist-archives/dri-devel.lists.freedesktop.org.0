Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE75DA4BFD0
	for <lists+dri-devel@lfdr.de>; Mon,  3 Mar 2025 13:06:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56B6310E3DD;
	Mon,  3 Mar 2025 12:06:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Mop+3CMW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4498310E289;
 Mon,  3 Mar 2025 12:06:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B0CC25C5851;
 Mon,  3 Mar 2025 12:03:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE0EFC4CED6;
 Mon,  3 Mar 2025 12:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741003566;
 bh=BYPlchQD1kkhJTSgYF2JWG5FBh+0zfFkLJMP1egeKqQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Mop+3CMWPRnWsZr+pBsrheco5VByfHkYQVZWucMP9x+bAF+AIyzmPYdsgIVIKx/Xi
 M1qK2qVUb/Zkykj9bol4N7uLcOtenupw5flQkLaIhPyf81LMt19tJP0yhoIQ9s2KgE
 tADfhHLOUrpih9KH/R9zobmyvAtZeFVZovf5ykzujM/nakUbTSj174DwAwkWwc6OhY
 D1KG7KmmEIf0K1K6e93y0DOo1VHM3c3/HT0GrtHVYZcJKQDVV+bi1O3HOjQT9EdybJ
 h1Lss6ct+5HEiRUzfHbd6/Xnhk0rfKapCw3QklEFyLEP/xoc23/vlEjjLpA/zVkrrx
 gePdE9yWvfP8A==
Date: Mon, 3 Mar 2025 13:06:03 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
Subject: Re: [PATCH] drm/client: Build the tests with CONFIG_DRM_KUNIT_TEST=m
Message-ID: <20250303-silent-brave-degu-c0cec0@houat>
References: <20250303094808.11860-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="fllvtl4gnemddhfe"
Content-Disposition: inline
In-Reply-To: <20250303094808.11860-1-ville.syrjala@linux.intel.com>
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


--fllvtl4gnemddhfe
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] drm/client: Build the tests with CONFIG_DRM_KUNIT_TEST=m
MIME-Version: 1.0

On Mon, Mar 03, 2025 at 11:48:08AM +0200, Ville Syrjala wrote:
> From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
>=20
> Use IS_ENABLED() to check for CONFIG_DRM_KUNIT_TEST so
> that it picks up the modular case as well.
>=20
> Cc: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>

Acked-by: Maxime Ripard <mripard@kernel.org>

Maxime

--fllvtl4gnemddhfe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ8WbJQAKCRAnX84Zoj2+
duUIAX9QZI9AFQ0K8i4nx/R2xjTCLEJHH+JkCNbJcxfj8D9Tjbhr7GrV9CbL4m5l
1AOwzi4BgOTYyD6l6hp1jjfTOlI4fG2E/LSwnHspC9670a0rNv1T+uJzak8pz3Os
DcX2zxxJ/Q==
=vZE3
-----END PGP SIGNATURE-----

--fllvtl4gnemddhfe--
