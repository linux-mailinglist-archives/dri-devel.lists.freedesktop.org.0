Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0498691AA8E
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2024 17:09:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4D6510EADB;
	Thu, 27 Jun 2024 15:09:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="AFNSSQXQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80C0D10EADB
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2024 15:09:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 746A6CE2F69;
 Thu, 27 Jun 2024 15:08:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01736C2BBFC;
 Thu, 27 Jun 2024 15:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1719500938;
 bh=LVxAoDPFGgZta/AMaaDggih53NHmLZ1I0pcsnqXUfSI=;
 h=Date:From:To:Cc:Subject:From;
 b=AFNSSQXQU826EGPSnt8hDGS3yM7ebJ5j6lmsLr+XfXCKcBq29So9Be86QF9u/C6lr
 2xl/GOdZ/yvleIuyz9nmJ1KRJpQ6X4wpaPBxQAlDn3Os7Y/PMu+KbTyFmp1d/K8m7G
 e15tA01aP9bBg4kR2sf6o333KycCuUtu4XbmCK2dTp45ZtYhDBN0qC7pTu37A/28VH
 dvSiuvfEy1hhRAM5xZBNQqY1vYYVCKpdgiMaeHGgDHtKa7p+YxmdCudE6Ih+hBqUam
 p9pXUS5dRBmijM8Z/O+bxAWvEq7bc1kZ/Dp49BTeHUYBlqNsJ1rqG4XtSNYXu4wVJH
 UXQV/FNn9NPeQ==
Date: Thu, 27 Jun 2024 16:08:54 +0100
From: Mark Brown <broonie@kernel.org>
To: Dave Airlie <airlied@redhat.com>, DRI <dri-devel@lists.freedesktop.org>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Lijo Lazar <lijo.lazar@amd.com>, Li Ma <li.ma@amd.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the drm tree with the drm-fixes tree
Message-ID: <Zn2Ahpv6za3ef3LT@sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="BZArcoZlnFggJHEH"
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


--BZArcoZlnFggJHEH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/amd/pm/swsmu/inc/smu_types.h

between commit:

  c223376b3019a ("drm/amd/swsmu: add MALL init support workaround for smu_v=
14_0_1")

=66rom the drm-fixes tree and commit:

  ec41bdd82e9b0 ("drm/amd/pm: Update PMFW messages for SMUv13.0.6")

=66rom the drm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/gpu/drm/amd/pm/swsmu/inc/smu_types.h
index 2e32b085824ae,12a7b0634ed56..0000000000000
--- a/drivers/gpu/drm/amd/pm/swsmu/inc/smu_types.h
+++ b/drivers/gpu/drm/amd/pm/swsmu/inc/smu_types.h
@@@ -272,7 -272,8 +272,8 @@@
  	__SMU_DUMMY_MAP(SetSoftMinVpe), \
  	__SMU_DUMMY_MAP(GetMetricsVersion), \
  	__SMU_DUMMY_MAP(EnableUCLKShadow), \
 -	__SMU_DUMMY_MAP(RmaDueToBadPageThreshold),\
 +	__SMU_DUMMY_MAP(RmaDueToBadPageThreshold), \
+ 	__SMU_DUMMY_MAP(SelectPstatePolicy), \
  	__SMU_DUMMY_MAP(MALLPowerController), \
  	__SMU_DUMMY_MAP(MALLPowerState),
 =20

--BZArcoZlnFggJHEH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZ9gIUACgkQJNaLcl1U
h9B9+Af9HWLP9pwG99gRcjfbXtQXiTDTWOqY06cYsdplVD4imfZ8+fVA5i3eFuPW
nwKu3JTVbVFgB8PRq9mc6HKEAQCfatz+YMMlL911tbENXkeRor5VO65PrKP257G0
2yD1xGUyLRjacEJrC0CsvmqgZO6xhGbW/j5e+b5bJgZZHxfEOEkHzQj5/O0aoMQ6
Rd+69PBpIO8DkEoOZH0RfwpAKJp+rVfpHayqzIS3GXQNVrzQ3fQrcAXLEVzrp98e
EclOk5R/SiQ6z3kpyTgC1YwhSh53JSxsoxdhJnmYrksMBGBKFN6WRT5PJad2s+yS
zRj4RptDV6O/2+Mpe1mhEqbMvifNxw==
=1q1J
-----END PGP SIGNATURE-----

--BZArcoZlnFggJHEH--
