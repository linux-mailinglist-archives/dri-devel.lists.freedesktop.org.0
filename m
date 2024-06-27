Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 065BC91AA75
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2024 17:06:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7298A10E0F7;
	Thu, 27 Jun 2024 15:06:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="rSrvCMgN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DD6D10E0F7
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2024 15:06:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 4E84DCE2F7A;
 Thu, 27 Jun 2024 15:06:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97395C32786;
 Thu, 27 Jun 2024 15:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1719500796;
 bh=Gm2UFxhA+RaA9MN0RMcn3u6Nvg2T9TqR9643ksfP5cE=;
 h=Date:From:To:Cc:Subject:From;
 b=rSrvCMgNNT2qxLrnn2He3h4Rb9n202E6mjGezePttfjt7jd4jXvZkNS7WIs8zbLVb
 1UxWtBBk1aMlYdC/v+F9D0M3OoU9bKoH5P13MBeVUZLsYf3PqVHui3oD0z5Rzc6rGN
 usBUeKl3PhMh5xqNcbMO61p2R6KlW/BV6Asi+P+SkKvD+lMeTaB6msoqNON3EIe3cx
 tBBeZhtRyGCYO5cx6k/SiVJKIIW/6i1V1idNVyVwek4qJTq24rZNruxx68apLBVfJj
 YWyqV14phrHuRYs5afm/Fz3n8t77bCPX2DNCXz3DsWZNxRYZldrCvkdL2/OpQhf/KT
 WtVSJFqQ/iVzQ==
Date: Thu, 27 Jun 2024 16:06:31 +0100
From: Mark Brown <broonie@kernel.org>
To: Dave Airlie <airlied@redhat.com>, DRI <dri-devel@lists.freedesktop.org>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Dillon Varone <dillon.varone@amd.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Michael Strauss <michael.strauss@amd.com>
Subject: linux-next: manual merge of the drm tree with the origin tree
Message-ID: <Zn1_91pUC7YENzRY@sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="M50tsz2cPts8X1x/"
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


--M50tsz2cPts8X1x/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/amd/display/dc/hwss/dcn35/dcn35_init.c

between commit:

  c03d770c0b014 ("drm/amd/display: Attempt to avoid empty TUs when endpoint=
 is DPIA")

=66rom the origin tree and commit:

  0127f0445f7c1 ("drm/amd/display: Refactor input mode programming for DIG =
FIFO")

=66rom the drm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/gpu/drm/amd/display/dc/hwss/dcn35/dcn35_init.c
index 199781233fd5f,428912f371291..0000000000000
--- a/drivers/gpu/drm/amd/display/dc/hwss/dcn35/dcn35_init.c
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn35/dcn35_init.c

--M50tsz2cPts8X1x/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZ9f/YACgkQJNaLcl1U
h9BKpwf/ctDg3kmV6vtDRNYOgTngHtqfriBgFenwSMMLV+Qw0ujIMej39V4TQLUP
8U90dPj3nI3xMrC7Sqc6bvMQKnnmYcYuUDXIzHZ0BcqYUa2qn8bzi3EPzDVKTiMg
YbFpjKdb5g2ffm04j+LHSJ7h+pBH214lDyceFxE2Ap/OidYoBzTFUaFS2/P5muDs
AoAotaPxRYYyb9quZAV8TRFQnUeEW9SpfYqh4c/TgCV4Pzv6wusR6Bvfo3BbiRrT
he69Im2SkVUYf4IWWSNJgCGQmT2l5RH/la/oc3zNG+J9Sfr0NVNey7VrMJ1RNC2K
d3oHmebOefsd4nQIdsLEK4XH050ukA==
=zMEz
-----END PGP SIGNATURE-----

--M50tsz2cPts8X1x/--
