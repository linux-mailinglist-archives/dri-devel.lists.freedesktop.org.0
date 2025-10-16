Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E61FEBE3D2C
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 15:56:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9677D10E095;
	Thu, 16 Oct 2025 13:56:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="bE7rEyBd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4439D10E095;
 Thu, 16 Oct 2025 13:56:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 1149743611;
 Thu, 16 Oct 2025 13:56:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17CE2C4CEF1;
 Thu, 16 Oct 2025 13:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760623002;
 bh=GRMrHfu8qqOJHXTQAvotFtKcTP9Xxjk2kf9bouP7CMc=;
 h=Date:From:To:Cc:Subject:From;
 b=bE7rEyBdYOxlWsGO/dXqVV/CZ5ONu2lLjvBLlesHj8bEXI1S+Xeq84kJN9FMWzajR
 oe19zMQe4HwiySUUDJ0YZvRk4VIUcoeyfrsMX+n36C90LkygwzD308tn6Xrqk58bH8
 vtiATeiY8xiMzGMjzU6BPLuZpx/JdDil1OzFg5lGMxtXOmTxYb2/LgWRuqaSlhP1D9
 FMF2682dwQE6EZoCIgWXeN8i9hjRB7juPSGEYoYDKpVPUxHZqB5HWEphFExUd+JHC6
 vHIPTjjYVARx2hWudygfhdUuNlfxMinpaXqQpLQMwUrDIdlbfCtZf4MXplHb8aEM/G
 lhk18FfgTQ5yg==
Date: Thu, 16 Oct 2025 14:56:38 +0100
From: Mark Brown <broonie@kernel.org>
To: Simona Vetter <simona.vetter@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 DRI <dri-devel@lists.freedesktop.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: linux-next: manual merge of the drm-intel tree with the
 drm-intel-fixes tree
Message-ID: <aPD5lh67aWgLCzTl@sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="9iKBVB9RjFSWzKZi"
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


--9iKBVB9RjFSWzKZi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-intel tree got a conflict in:

  drivers/gpu/drm/i915/display/intel_fb.c

between commit:

  86af6b90e0556 ("drm/i915/fb: Fix the set_tiling vs. addfb race, again")

=66rom the drm-intel-fixes tree and commits:

  1d1e4ded21601 ("drm/i915/fb: Fix the set_tiling vs. addfb race, again")
  d76eeea515700 ("drm/i915/fb: Drop the 'fb' argument from intel_fb_bo_fram=
ebuffer_init()")

=66rom the drm-intel tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/gpu/drm/i915/display/intel_fb.c
index b817ff44c0439,3958628c73e97..0000000000000
--- a/drivers/gpu/drm/i915/display/intel_fb.c
+++ b/drivers/gpu/drm/i915/display/intel_fb.c
@@@ -2323,6 -2327,9 +2327,8 @@@ err_bo_framebuffer_fini
  	intel_fb_bo_framebuffer_fini(obj);
  err_frontbuffer_put:
  	intel_frontbuffer_put(intel_fb->frontbuffer);
+ err_free_panic:
+ 	kfree(intel_fb->panic);
 -
  	return ret;
  }
 =20

--9iKBVB9RjFSWzKZi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjw+ZUACgkQJNaLcl1U
h9A3Hwf+IHG/SVHPFaVvtxq01tpNJPB/TJCiHWBI4N2lFXEHpSo+u7I+Lt/opDdz
kpgqinlNOnUgY7ymhwW7ao0gTVaS1QMQfwdRvtSE3i6ZnIxFvMPHnNWPuwSkNG1H
hCIJ+6DPeXx8pWn22CYCYjEmc95V0xZMiQA4b7rMsmPiEyKGOo9S9qOaETC0eLJ5
PDiUHqn36KZFketdD73KMfS4AAEld9urZA9qqI5sf3DxOgvvSNooM8iqlFNIHxda
J5Y3854bIU/pcIBtr4a7VwqDEDYMOF98vXIAY9KO48BcYINJaVtJzZHsRJongoTh
c4b10c5Nr3zAxcwubMej8D2uPRZHbA==
=yC1O
-----END PGP SIGNATURE-----

--9iKBVB9RjFSWzKZi--
