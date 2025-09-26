Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A627BA3A4E
	for <lists+dri-devel@lfdr.de>; Fri, 26 Sep 2025 14:38:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C8A710EA4C;
	Fri, 26 Sep 2025 12:38:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="QHIYMopI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06EC910EA4C
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 12:38:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 99F6C403BD;
 Fri, 26 Sep 2025 12:38:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D88F1C4CEF4;
 Fri, 26 Sep 2025 12:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758890294;
 bh=r3+KoqyxYaumJVlhxlnDPVZa+TxdsWD5Z5JBjgUvoI0=;
 h=Date:From:To:Cc:Subject:From;
 b=QHIYMopIY+gQS3kKXdhPUcz8jiFap380Z47bFJf4Wcsa2aS+42YUndaWedYkYzlrf
 CV/HFUf8GTdz9n71aIKN9b/HLv0R8cOdoWaeBzafCFW/xWWcu1CoG3VtYjoW1UH1uP
 BHsXMaiRBVAzRqqWhuo+pjhsz8WUtGIB0oXF5rEJnW+LfEK370pksmtmQJ3nCYCHwT
 3aPcTxMXYjjrx+cybuzwwk0T7gX3kX6cabrVzGh1dnYN6K6cpb1j/MaJSQAD7mFHUT
 +swWShow5ORzYl5bGkTPauYF7RLBVZo7mpTQ1TQdylKB9sbD79T3mKi05h1jrtatZ5
 I4wWfd/6gVCnA==
Date: Fri, 26 Sep 2025 13:38:10 +0100
From: Mark Brown <broonie@kernel.org>
To: Dave Airlie <airlied@redhat.com>, DRI <dri-devel@lists.freedesktop.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Zongyao Bai <zongyao.bai@intel.com>
Subject: linux-next: manual merge of the drm tree with the origin tree
Message-ID: <aNaJMgOnsuoBywwH@sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="dFuDA49CIsVn8cs8"
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


--dFuDA49CIsVn8cs8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/xe/xe_device_sysfs.c

between commits:

  ff89a4d285c82 ("drm/xe/sysfs: Add cleanup action in xe_device_sysfs_init")
  500dad428e5b0 ("drm/xe/vf: Don't expose sysfs attributes not applicable f=
or VFs")

=66rom the origin tree and commits:

  1a869168d91f1 ("drm/xe/sysfs: Add cleanup action in xe_device_sysfs_init")
  a2d6223d224f3 ("drm/xe/vf: Don't expose sysfs attributes not applicable f=
or VFs")
  fb3c27a69c473 ("drm/xe/sysfs: Simplify sysfs registration")

=66rom the drm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/gpu/drm/xe/xe_device_sysfs.c
index 927ee7991696b,c5151c86a98ae..0000000000000
--- a/drivers/gpu/drm/xe/xe_device_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_device_sysfs.c

--dFuDA49CIsVn8cs8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjWiTEACgkQJNaLcl1U
h9DEmAf9GQ01UWfutzagSRDip7bv0ShVJC/eCrs98dxllk20nSbahausZ6G5iyeT
mgV5iHrDbjNBJFDNZhCOgVtnvkzDyrLpZJfUhXWv2GIQu4DjyhjCshN8ZTa6SbtZ
1b4RF+xyDUsXM4BDgeCGTwVlD/Rdux4Ez4auHP/CDIjobAh2wOPjSQ3hn2Vut366
0QmAumcSwfZzBw47J/gtM6Xt+3L9gmluKLzO1BIfwBu2ki43yrBrUpUAzEIK68om
7KmvV1SGzSfyg+DX6BrBoahQ6VT0KT8JK2kGX8Eyz149P/9XFgqqWNumk3NH5fbk
wU4fACxLSr6CPkm4YbTOJ5iQarWVQQ==
=VETx
-----END PGP SIGNATURE-----

--dFuDA49CIsVn8cs8--
