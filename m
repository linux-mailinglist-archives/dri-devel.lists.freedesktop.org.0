Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2745B2EC04
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 05:35:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C3F710E860;
	Thu, 21 Aug 2025 03:35:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="P3+GrhxA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F02710E860;
 Thu, 21 Aug 2025 03:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=202503; t=1755747342;
 bh=1AKuf7vxx8IeHIhpQuTZq8jiosjOGEqTIkKTv6PxRs0=;
 h=Date:From:To:Cc:Subject:From;
 b=P3+GrhxAIBPNPn+zw4qVZPknRcJwjnxqWw+WwGevuEzBDBzLu4hCH9pa4UOhoSLZ6
 EA+eu6vlNF628RYJUSb/a3Q1vIGlyjxu7fev8E+75cHlAuKUE/8ak64dxXTTtQqKdE
 8NIuouscHGTKVXRE28BexQ5GH4KuJOACmdb8ARK38jSJy/wDzwBlcxNgXPbRhlopxK
 gB2dV62gE89wRAbxGXZYCs+PKSuE8Kky+gvF0Bwbq+P4AaeVp7uVLKW+n+GfnaqcXx
 dH8YceJs4rfvuiTn+dtoQrvUblCEZde7TPrYiiuWp572aJKDn4F3/fpuZfg6jslCc6
 LRhfmGfITk04Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4c6pqx2d1lz4x7B;
 Thu, 21 Aug 2025 13:35:41 +1000 (AEST)
Date: Thu, 21 Aug 2025 13:35:39 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Simona Vetter <simona.vetter@ffwll.ch>
Cc: Boris Brezillon <boris.brezillon@collabora.com>, Himal Prasad Ghimiray
 <himal.prasad.ghimiray@intel.com>, Matthew Brost <matthew.brost@intel.com>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI
 <dri-devel@lists.freedesktop.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the drm-misc tree
Message-ID: <20250821133539.03aa298e@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/MerbLpHnCb_izFKYbRB=67x";
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

--Sig_/MerbLpHnCb_izFKYbRB=67x
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-misc tree, today's linux-next build (htmldocs)
produced this warning:

WARNING: include/drm/drm_gpuvm.h:1059 struct member 'map' not described in =
'drm_gpuvm_map_req'

Introduced by commit

  000a45dce7ad ("drm/gpuvm: Pass map arguments through a struct")

--=20
Cheers,
Stephen Rothwell

--Sig_/MerbLpHnCb_izFKYbRB=67x
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmimlAsACgkQAVBC80lX
0GyRIAf7BHOuRQZf/Orkw0SVZ3FevVsN9zBulFjPOaUxUnZJuEH9YDaJZWJpNG54
Ln2SyRaKVTwR/T/ks9iSpxICnmWbjAjYrA8C4AMrhItTAWHcWiibuNUwx16UzvHz
V0QDkQ6rWIzyrn1Wtm2/7KikbsSpot7yt3okcSGIUQjn1dYkCr4/4J9HsVgNCXwr
9PfFFGRv4UZ+ssQkpCMMZBA/bAQDn9+dpoWLhrO38EnY9l55y7HK0MtL8PfWZ9UP
tBU+KifXlUeknNVOim4YDo4cCkUiRtB+16rhIdkUPzFaMGCq0XDgugS03fOkDrlv
GfbxQyar5j/w9tgzkLujOmO39MLM9Q==
=yPRe
-----END PGP SIGNATURE-----

--Sig_/MerbLpHnCb_izFKYbRB=67x--
