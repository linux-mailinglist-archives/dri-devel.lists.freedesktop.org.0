Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B84912688
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2024 15:21:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EB1E10F188;
	Fri, 21 Jun 2024 13:21:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="JqVRAuVn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57C6410F188
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 13:21:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A387D626B6;
 Fri, 21 Jun 2024 13:21:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8955CC2BBFC;
 Fri, 21 Jun 2024 13:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718976079;
 bh=eEBjK7L9zo7dYznjm4ZoCU0EEdJVjmtajHqCxc1dnhI=;
 h=Date:From:To:Cc:Subject:From;
 b=JqVRAuVnTHIw6D5/uqDKXXNm7JNokOfiLq8/btn0kxMfp1kd2uq1YrOaR0i2I9naV
 VcMeTW3EPsY69Hy87DN1ljANH5fesyYF+U/K9VlG4yqb0QcA903TyXcg2EwxCaIimy
 aZBdng5s5nySzZbIIxumy9Eq3qSkSGI9SflGzObEdz8F61YrGom6eaFDIwiAex84HH
 z43lJtMcpBYMRRSBarhkSHh3FfRk8nR3tfR+iSuX6uzSLA5OcleTC7af19fP4zsRIx
 YtftL3nqhr6BiHku+Pj3q+pyr+RI1cGTXSr7Tj7Tjr6Q7edwErule1YwdWjuYIuaUt
 OClFU/D2DXZEw==
Date: Fri, 21 Jun 2024 14:21:14 +0100
From: Mark Brown <broonie@kernel.org>
To: Dave Airlie <airlied@redhat.com>, DRI <dri-devel@lists.freedesktop.org>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Dillon Varone <dillon.varone@amd.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Michael Strauss <michael.strauss@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Subject: linux-next: manual merge of the drm tree with the drm-fixes tree
Message-ID: <ZnV-SlwKvgfpYYK9@sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="6v7f5m3wwL3qaoRy"
Content-Disposition: inline
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


--6v7f5m3wwL3qaoRy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/amd/display/dc/hwss/dcn35/dcn35_init.c

between commit:

  c03d770c0b014 ("drm/amd/display: Attempt to avoid empty TUs when endpoint=
 is DPIA")

=66rom the drm-fixes tree and commits:

  47745acc5e8dd ("drm/amd/display: Add trigger FIFO resync path for DCN35")
  0127f0445f7c1 ("drm/amd/display: Refactor input mode programming for DIG =
FIFO")

=66rom the drm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn35/dcn35_init.c b/drive=
rs/gpu/drm/amd/display/dc/hwss/dcn35/dcn35_init.c
index 199781233fd5f..30e6a63988391 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dcn35/dcn35_init.c
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn35/dcn35_init.c
@@ -157,8 +160,8 @@ static const struct hwseq_private_funcs dcn35_private_f=
uncs =3D {
 	.set_mcm_luts =3D dcn32_set_mcm_luts,
 	.setup_hpo_hw_control =3D dcn35_setup_hpo_hw_control,
 	.calculate_dccg_k1_k2_values =3D dcn32_calculate_dccg_k1_k2_values,
-	.set_pixels_per_cycle =3D dcn32_set_pixels_per_cycle,
-	.is_dp_dig_pixel_rate_div_policy =3D dcn35_is_dp_dig_pixel_rate_div_polic=
y,
+	.resync_fifo_dccg_dio =3D dcn314_resync_fifo_dccg_dio,
+	.is_dp_dig_pixel_rate_div_policy =3D dcn32_is_dp_dig_pixel_rate_div_polic=
y,
 	.dsc_pg_control =3D dcn35_dsc_pg_control,
 	.dsc_pg_status =3D dcn32_dsc_pg_status,
 	.enable_plane =3D dcn35_enable_plane,

--6v7f5m3wwL3qaoRy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZ1fkkACgkQJNaLcl1U
h9AyjQf+NYcwSmnP3xpW16rF7WaCcqQmKBlzH6VMIQFcNdUDyyfKEifrumflFV7G
p0DY+ttTzgrKcKh5TNxzgxFK/Zrc9RCzhnqZpsbCz5dfr9YSuUGoK9tcnoMfUgXL
Cii+JhXyM+t18tu53iT6XlOLGl1GzrC2fMT2N4R5AeIvhL25my7PErl92VchvncQ
IkN0EiS6KHH0PwSt7omzgnpq3ovdZYXE8F7+HmJyVLTYFoXCOkeYYDLK0fv/3Auh
llfyOYxdp8BWXPDH11D1bkkcw72FZpAI4NXX/lmVMWQ1qkCa3l11marLj3R6QhbE
txUFOeftL7zzc6HHDW3RwR799O4V1Q==
=Pcbk
-----END PGP SIGNATURE-----

--6v7f5m3wwL3qaoRy--
