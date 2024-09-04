Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C48C96B197
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2024 08:30:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F8FD10E5BB;
	Wed,  4 Sep 2024 06:30:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="MfnFYDnh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2303010E144;
 Wed,  4 Sep 2024 06:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1725431419;
 bh=JGgIk/EiekwZAX0A7RvQM/XMomC9Q+y6SpRBDDwzKfY=;
 h=Date:From:To:Cc:Subject:From;
 b=MfnFYDnhyd05wDe6EwHfZN9jS7Zq1GPWTXdYkcxMya6T6D6u4J+pDYc7iVgA9GT+h
 g/iqhjsZNvsbCdt0G4IOuKUPPVLI+USXgTuVhgiwvTWw++e3GHfkrmH/65IlW7HxbA
 OjcgZKFLfXexFwbHCOF+G6/us6n7mE/ibdyJqo2QH3s6UO/ot/tq7PSncahy8DPSfo
 Su5GUwzq6UMzc70cn+CJk7zmfy6+nB18wCmEt4zt+nZD+VwL+c478J+lz3ulkCxdoI
 xW3BjiXx1OOmJAQIEwKhobsOSDUKQmQKl/Bh4VYMjW8/2ty6dgmQvAQ9Hgd2d0kccg
 BqSedoDUU4CPQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4WzCKR2z0zz4wb0;
 Wed,  4 Sep 2024 16:30:19 +1000 (AEST)
Date: Wed, 4 Sep 2024 16:30:18 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Maxime Ripard
 <mripard@kernel.org>, Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI
 <dri-devel@lists.freedesktop.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the drm-misc-fixes tree
Message-ID: <20240904163018.214efaa7@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/5HyTQZioDubndSE4yOjw/8D";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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

--Sig_/5HyTQZioDubndSE4yOjw/8D
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-misc-fixes tree, today's linux-next build (htmldocs)
produced this warning:

Error: Cannot open file drivers/gpu/drm/drm_bridge_connector.c

Introduced by commit

  9da7ec9b19d8 ("drm/bridge-connector: move to DRM_DISPLAY_HELPER module")

--=20
Cheers,
Stephen Rothwell

--Sig_/5HyTQZioDubndSE4yOjw/8D
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbX/noACgkQAVBC80lX
0Gw71Af/U8tOm4G12SSD3WRwgEEgCXPW8uJN48HMl/i9OgHwzXPXRFp5smIVHpOL
hKn7n/wB8xbKRe6nGmfENARWh9LHdSDLABrR8DYWUUs3yOLzMSnujpuGz3hIpTjA
OimdN0/GdmBPQsD/3K02ybAaLI+uDdR1NzOQs6QbfFk0pvvKIM252zq7bsVtlDpx
KYDAwEGHB0NkujENwrL1gD09kZZDStdx4VVw15RBivi4t5pgE5zC0H4Q3N/5t7jR
l5luvwacoZDASk4vMeVxKZuHPfULH46kMit2OLVDuAy6UZOmJ6MLd3fF+Ksqn6QJ
RA0ffY/DwWxB62m29AP7bjWEeJaJDQ==
=MFbq
-----END PGP SIGNATURE-----

--Sig_/5HyTQZioDubndSE4yOjw/8D--
