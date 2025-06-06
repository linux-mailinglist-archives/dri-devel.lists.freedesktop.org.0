Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B362ACFDA4
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jun 2025 09:43:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8731210E8D2;
	Fri,  6 Jun 2025 07:43:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="fYvLvEL1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95D8110E8D2
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Jun 2025 07:43:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 3CF624347E;
 Fri,  6 Jun 2025 07:43:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2512C4CEEB;
 Fri,  6 Jun 2025 07:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749195826;
 bh=FeqFlRXei5D6XMZZBI3v85lB/5WTd3THlFqOr1fZKQE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fYvLvEL1yTHZ6PhNXkA9kTXW+DZOoSUUIvW30trqhfz7hg4gmv3aFx0fpVFDj0Dl9
 ergl/vonJvDJ3rFu6AIUhHdy1vR8wced53xbMjueaFEEEOFCS7jnO3/+5UYfQmHVnl
 GoMFOTyszlpVOJrTgCYKjN5EMWF1ZAJShy14isEp8n7IPw4n2zJ1VjrTPZpSEJO5Au
 msVkEXlYE7iY5LfBhRCJ+a3BLjRTj7xfnZrlR9f+7F7vuWFvhcKp0brDBejCYKdx2R
 IeDKOZsQsTFFG4Igmmtd/QKeuLMNvU0saKOpwUgXYkQAMn7OvGBkoiPvqBjMionGXV
 kNJ7J3JCwNUnQ==
Date: Fri, 6 Jun 2025 09:43:43 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: arthurgrillo@riseup.net, jose.exposito89@gmail.com, javierm@redhat.com, 
 maarten.lankhorst@linux.intel.com, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 2/3] drm/tests: Test drm_fb_build_fourcc_list() in
 separate test suite
Message-ID: <20250606-attentive-tactful-toad-afd9c7@houat>
References: <20250604154844.28995-1-tzimmermann@suse.de>
 <20250604154844.28995-3-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="vu47axhtnytjguql"
Content-Disposition: inline
In-Reply-To: <20250604154844.28995-3-tzimmermann@suse.de>
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


--vu47axhtnytjguql
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 2/3] drm/tests: Test drm_fb_build_fourcc_list() in
 separate test suite
MIME-Version: 1.0

Hi,

On Wed, Jun 04, 2025 at 05:45:43PM +0200, Thomas Zimmermann wrote:
> Only sysfb drivers use drm_fb_build_fourcc_list(). The helper will
> be moved from format helpers to sysfb helpers. Moving the related
> tests to their own test suite.
>=20
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/tests/Makefile                |   3 +-
>  .../gpu/drm/tests/drm_format_helper_test.c    | 142 ---------------
>  drivers/gpu/drm/tests/drm_sysfb_helper_test.c | 166 ++++++++++++++++++
>  3 files changed, 168 insertions(+), 143 deletions(-)
>  create mode 100644 drivers/gpu/drm/tests/drm_sysfb_helper_test.c
>=20
> diff --git a/drivers/gpu/drm/tests/Makefile b/drivers/gpu/drm/tests/Makef=
ile
> index 3afd6587df08..a3ad1f0879cc 100644
> --- a/drivers/gpu/drm/tests/Makefile
> +++ b/drivers/gpu/drm/tests/Makefile
> @@ -23,6 +23,7 @@ obj-$(CONFIG_DRM_KUNIT_TEST) +=3D \
>  	drm_modes_test.o \
>  	drm_plane_helper_test.o \
>  	drm_probe_helper_test.o \
> -	drm_rect_test.o
> +	drm_rect_test.o \
> +	drm_sysfb_helper_test.o

We've tried to keep the same name than where the implementation of what
we're testing was so far. Judging by patch 3, that would be
drm_sysfb_modeset_test.c here.

Once fixed,

Acked-by: Maxime Ripard <mripard@kernel.org>

Maxime

--vu47axhtnytjguql
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaEKcLgAKCRAnX84Zoj2+
dmRvAYDlimzWbrEPT19fdsAbJz+ytIJjQYluzVHq6+CgeIwMICTZLv2H/gwdRpSi
uIwrcYQBfRRs8GlbpLfiMUOjWVC6yc2XSEDD8cwwY8ladCjFTh2E0U2k4yHXWdT7
zLdxTMGHkg==
=Sgyl
-----END PGP SIGNATURE-----

--vu47axhtnytjguql--
