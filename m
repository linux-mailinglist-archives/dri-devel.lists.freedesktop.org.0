Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDACB997C1C
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2024 07:05:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 358B210E859;
	Thu, 10 Oct 2024 05:05:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="PuSUaA+q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 937BD10E857;
 Thu, 10 Oct 2024 05:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1728536695;
 bh=fijtcdxdrZ665Q/BtLmU4Byqk9VH161emL4XWOqA/Aw=;
 h=Date:From:To:Cc:Subject:From;
 b=PuSUaA+qJbLS9j58FxGirA076c7K3l1IpcFP8IQocxEOaxI1jf07qhomDDLhgBJ/g
 cHt6W+4VJCQUI54O3N2WRlYKVrVzWOmAnAv1J2bckjyaVLxtNwEX1EqP6rwUlJgAQU
 UuPYg7a8q78XMWJbLt1t2vQ0QVwQUx/0H8wzZMgQRQpX3hJg8FH2AGfSUTF2kEWZ8s
 GNytSTxzwWIehGsSLUrquo6Z9b0/zBDM3KJDPNhYV7ijJj73Ggme/ADm/jlj8ZD9sd
 qcjmrjQdMLffTk5Zc29/j8IYUbT2FSWuCg1YEMgzLnmOmbz2To2BaKsOxahS0Ll8Xt
 ow9+d4NuvFgVQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4XPHkG6nPMz4wnw;
 Thu, 10 Oct 2024 16:04:54 +1100 (AEDT)
Date: Thu, 10 Oct 2024 16:04:54 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Simona Vetter <simona.vetter@ffwll.ch>
Cc: Dzmitry Sankouski <dsankouski@gmail.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warnings after merge of the drm-misc tree
Message-ID: <20241010160454.60466ebe@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/W_eVme5ixBJu0oC.Htdu_TM";
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

--Sig_/W_eVme5ixBJu0oC.Htdu_TM
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-misc tree, today's linux-next build (htmldocs)
produced these warnings:

drivers/gpu/drm/drm_mipi_dsi.c:1533: warning: Excess function parameter 'ds=
i' description in 'mipi_dsi_compression_mode_multi'
drivers/gpu/drm/drm_mipi_dsi.c:1533: warning: Function parameter or struct =
member 'ctx' not described in 'mipi_dsi_compression_mode_multi'
drivers/gpu/drm/drm_mipi_dsi.c:1533: warning: Excess function parameter 'ds=
i' description in 'mipi_dsi_compression_mode_multi'

Introduced by commit

  975bdea8c470 ("drm/mipi-dsi: add mipi_dsi_compression_mode_multi")

--=20
Cheers,
Stephen Rothwell

--Sig_/W_eVme5ixBJu0oC.Htdu_TM
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcHYHYACgkQAVBC80lX
0GzXggf8DCdxh8u8+Reh4BVD40uzGiZD6jjsOHHJRDvtdyUn4UHrS+4hEaTRTXF5
ecBEjkOl4gwsprWVQwl6GTN2MCpnC1I/scg/+Nn3qQ0juEXoQ/O7084AyRORrAy/
iUBGWyqDDkJWs47RGbc5OrorRkC5P6+pDIQJwf9B7UDAaMyLbdgl6JtehE0pIajz
TdzPfNjSgYj1V5a1KdbRP7CwPt1DTEYBFqc6tJ2W9rgoLzsiuj6nEi+2mkL3TLrx
ROwuht0IB0CZIpTOh8W4myJ49ivDm8UlOGcyk8lcmMh+/zN6OrigY9pTQ6hTZFoS
oXU9YrSfEqz9UmD4UJ8W/uTLw213Kg==
=JrHx
-----END PGP SIGNATURE-----

--Sig_/W_eVme5ixBJu0oC.Htdu_TM--
