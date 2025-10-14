Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD009BD9569
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 14:29:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0FD010E5DD;
	Tue, 14 Oct 2025 12:29:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="SxyDwdxr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33B8610E224;
 Tue, 14 Oct 2025 12:29:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id C30E044E62;
 Tue, 14 Oct 2025 12:29:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0F43C4CEE7;
 Tue, 14 Oct 2025 12:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760444962;
 bh=+dANSiTL0H12KnLe6qhjXfPuJ5JC6wEBsW+kIkDejso=;
 h=Date:From:To:Cc:Subject:From;
 b=SxyDwdxrGZ6NkZCxsuj6pznUMaCnKl8ODTCENcX720rCW2u3ZLnIv3Qw/gXNQWBj6
 jktdCyPsoVfffWFtKhGkj7AIuA2Hv8XWiQbmQM1p4M7+A1PFUYbAywis1joiotilAg
 yAhH+dHVNwRgthJHR89hockSiwFIXlhEOsaCIKrM7j84rRiJIyda5kkOE0hMbnoCzW
 kYEsM4aumNN0qdYWFzDEAvwSbepaGNU/nSnvF59DWwXPKgqR6qtOnCaKsdoz0ep1gT
 +59eOAeCH0K788GMI7HSReJ+ish5YmRKCLc4w8+Ig6uQClk9XMLPoZNQD3u1VOYNea
 P0ouqi6fYEy3w==
Date: Tue, 14 Oct 2025 13:29:17 +0100
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
Message-ID: <aO5CHSMNxGMZsUPd@sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="R9j/QHozM9Mndnk6"
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


--R9j/QHozM9Mndnk6
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
index b817ff44c0439,9c256a2805e40..0000000000000
--- a/drivers/gpu/drm/i915/display/intel_fb.c
+++ b/drivers/gpu/drm/i915/display/intel_fb.c

--R9j/QHozM9Mndnk6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjuQh0ACgkQJNaLcl1U
h9DCwAf8DToewlBYi1iWpDOvN0TRvqMkhHvzYDD7bYPTtcDpaf7pW5T/xDK4M5lG
DhQVdnVrlTOK0g7yz8NgSE4h8urwHoj0ovu0V5lo6IJ5U+rdAkjSNZVxXBHWRYnl
Iy8rPxWkzvdIETYk5090rwm1pbkA3edocday97Lja568kXyqWzjtTetyQzmnxVpn
IY0wi0Y30BR/HIs739NmOOwJL+lZtC69khvJ7lYhW38jBdV3hcAf5OVOoAyaSO4S
KNre4ceoLg3fBY/Ls+YR9QRjFQKbi8UkkuXIUzxgf4UIwOwJUB9cDqTfdGjn/kiC
8bqHz6veLrUIo73Rpe+N5xBIbTiXBA==
=w8mK
-----END PGP SIGNATURE-----

--R9j/QHozM9Mndnk6--
