Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D4CC91AA14
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2024 17:00:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B176D10E0A7;
	Thu, 27 Jun 2024 15:00:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="QuTRXVnx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7201610E0F7
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2024 15:00:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C912B61DE2;
 Thu, 27 Jun 2024 15:00:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E79CC2BBFC;
 Thu, 27 Jun 2024 15:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1719500448;
 bh=tRy9SRr/CPS5is3VqgbmrQWOvnGMxmc+yYVzPk/KzTA=;
 h=Date:From:To:Cc:Subject:From;
 b=QuTRXVnx6PQBh3Ifc3bXcfIpsmGSUWK7UmFsmOtWiClWmmiX1jZ7d9kZJJyoJVDf1
 KrxjtYz3bOxoHEuohXern8M3GICcIMBn42oioz2FlVKAkA/b6uIRoRnbdgDsCD9781
 AzgDDSt3oQzO6+B6P2WXTlomfFvWZVIQRVfmo3MLUJUByOXt78cl5e2XreZ+kCqr5I
 6CIoBryX3TjHSM5FiurxGeaudMw8gBB5qTAsfsPhNGYoxt7D/WA3tEJDLPde7s9SXe
 dxCq10u0biT1f8z05cIX2gnoWy2Xx8wSGM5PuB6Ti8yRXmhEM/EQZDwDfp1o0ljKtq
 eOiq6lLGp5vng==
Date: Thu, 27 Jun 2024 16:00:43 +0100
From: Mark Brown <broonie@kernel.org>
To: Dave Airlie <airlied@redhat.com>, DRI <dri-devel@lists.freedesktop.org>
Cc: Alex Deucher <alexander.deucher@amd.com>, Frank Min <Frank.Min@amd.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the drm tree with the drm-fixes tree
Message-ID: <Zn1-m_-MGxsjV9Se@sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ue3LuKhK8SGwUSeP"
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


--ue3LuKhK8SGwUSeP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c

between commit:

  f6f49dda49db7 ("drm/amdgpu/atomfirmware: fix parsing of vram_info")

=66rom the drm-fixes tree and commit:

  9a55c77978308 ("drm/amdgpu: fix getting vram info for gfx12")

=66rom the drm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c
index 2e13c7c4b2b41,f932bec6e5345..0000000000000
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c

--ue3LuKhK8SGwUSeP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZ9fpsACgkQJNaLcl1U
h9CRsAf+LW2q7qC2ENz5xQFPQCynOBKV+Y8tZnTt/hPYgOCAVPjdfE9Xf9jOheq1
8TsaTh6EnBEQgfvjE2wa4x5Jb4oEzmhq97vbvE9QGsvS6g6SgJqgZf3ErW52jklc
06jh3/iZFbrLV/mRIXfw92Mk45gNc4B5/wsEP+5b3oij3Rp29bkyp4CpiSQTKmWG
S3nj601uy2iGqmhscshng6neVOFAc+rqhnWsWKhE/lbOO17hJCul7GWsjrYXwZFy
wDeNTwjbuJpqsiqmjOCtJHJwftxmLY1nT3xzGX5lcZK6Hll+VA3KoBLCjvW9GZoC
TpSv+z6ZW8hTd+xl3rS+WoWkqK8txw==
=16uz
-----END PGP SIGNATURE-----

--ue3LuKhK8SGwUSeP--
