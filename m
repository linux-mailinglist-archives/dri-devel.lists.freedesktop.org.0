Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 794EC8993B4
	for <lists+dri-devel@lfdr.de>; Fri,  5 Apr 2024 05:16:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 471051137F0;
	Fri,  5 Apr 2024 03:16:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="gFm4eiwS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F1841137F0;
 Fri,  5 Apr 2024 03:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1712287002;
 bh=d5cgo064iDyl0ySWVajO9U2m2sHPbkAkT/2ugofzNXU=;
 h=Date:From:To:Cc:Subject:From;
 b=gFm4eiwSlb1thp61U8UQRQfKjOVqzHSKpTYaU+poLY27T7aNIEQwlhtPURYRUHMNU
 5mY8BoDc2Shc2dITpsYIfMm598kZPtvHa/7fCEnUy2/Rozqhox4eLpxpn7HUqv9dg3
 6e0sk3RIu0e33HDabGUExacqRUiWV/9SpD8yLGxKJjVrd3hL3Z2ngFiVNIPD/6O0Ei
 Uuc5SRb3V1/x/esBD32hx+hIi6KsHwYt0Rtke+A0rMs1gnagSfH01DPKmmq99TMUUm
 ElFPUXDKVFK6RsY0GPJgDX5uCMF1lO8mQlcMAu1O6M4EYOvJr6YtnShRCAHV6BRzl1
 Bm6ZpyJvHzgBw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4V9kD86bwDz4wyl;
 Fri,  5 Apr 2024 14:16:40 +1100 (AEDT)
Date: Fri, 5 Apr 2024 14:16:40 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>, Mitul Golani
 <mitulkumar.ajitkumar.golani@intel.com>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warnings after merge of the drm-intel tree
Message-ID: <20240405141640.09b0bdbf@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/U1sk1SgAMcc8AgI/HojegJ9";
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

--Sig_/U1sk1SgAMcc8AgI/HojegJ9
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-intel tree, today's linux-next build (htmldocs)
produced these warnings:

include/drm/display/drm_dp_helper.h:126: warning: Function parameter or str=
uct member 'mode' not described in 'drm_dp_as_sdp'
include/drm/display/drm_dp_helper.h:126: warning: Excess struct member 'ope=
ration_mode' description in 'drm_dp_as_sdp'

Introduced by commit

  0bbb8f594e33 ("drm/dp: Add Adaptive Sync SDP logging")

--=20
Cheers,
Stephen Rothwell

--Sig_/U1sk1SgAMcc8AgI/HojegJ9
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmYPbRgACgkQAVBC80lX
0GwBIAf7BbIxxemjhKlaFZ8aVADC9tnt9y2IsHb4DtzmX5GPMZZlGv42O9jCzcec
ttpPKV7UEOeSuB7Sis7gG+7JtNIF2TE7yeLrdB+Q3wcMeyvKtIitCIszuTeGG9v9
NEAoElKZnBBZptvysMtyfs2czU5hiHIfVZm/Jjg9Gg51SQt3Hh9aTPsuvD3D0hmB
I/956/7a8SEbQcCnfIN3XZ2JNJp4yATCvPQfCu1qWR1Xauu9OHT/eScDezwgkr7x
QJqTpKs1r+C0LJ7aALjBa881xp7ilUMWnCFdPFtPRTILuhx8poGR4TItAInpm/hi
zZ63sYuLlD3tmbUt1gJ2CjuvtTLG6Q==
=Lxwm
-----END PGP SIGNATURE-----

--Sig_/U1sk1SgAMcc8AgI/HojegJ9--
