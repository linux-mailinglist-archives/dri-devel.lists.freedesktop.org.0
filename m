Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F218A6525
	for <lists+dri-devel@lfdr.de>; Tue, 16 Apr 2024 09:31:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04F8D10EEFB;
	Tue, 16 Apr 2024 07:31:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="fLbbpvtq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABA4310EEFB;
 Tue, 16 Apr 2024 07:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1713252675;
 bh=eOK/bCV7IyfygWV9u4shyKXmqc9QPsYNWN/ruKFTjn0=;
 h=Date:From:To:Cc:Subject:From;
 b=fLbbpvtqB5ohUbohD+5h0tTJFVqVyLEOJdJziboW0356r5MKQEkZqAbhfp1clFcey
 +LFSNWb/hV47tZfyzxiREouTRd8su67dnHBgW0YXkQp+6EQIRAImVZHmcSYOXOy6Sy
 XY1P4Oah3eKDhVuyBtMAD7Z4vNJIOReRqUCfFddPv2tFC29c1RjnZZBPJKbydbUUw7
 dIA4aYJTpwDvp6VwKYJgau6N4GkEOtNrqv3njMgYDwG4+AlfBn+zDp7VrZ93GoFNKa
 VHsbVO+3AHpfc4t+3/DDIzDEompn2pt96XO+efd7SziDDnB3lbNp4MyEe/CXJ/m3CL
 gpdwArMAPLmDA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4VJbLp6YNdz4wnv;
 Tue, 16 Apr 2024 17:31:14 +1000 (AEST)
Date: Tue, 16 Apr 2024 17:31:12 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Jocelyn Falempe <jfalempe@redhat.com>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warnings after merge of the drm-misc tree
Message-ID: <20240416173112.04579e40@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/jKM7rW28KcV_xG8kmBaV5Jf";
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

--Sig_/jKM7rW28KcV_xG8kmBaV5Jf
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-misc tree, today's linux-next build (htmldocs)
produced these warnings:

drivers/gpu/drm/drm_fb_dma_helper.c:166: warning: Excess function parameter=
 'drm_scanout_buffer' description in 'drm_fb_dma_get_scanout_buffer'
drivers/gpu/drm/drm_fb_dma_helper.c:166: warning: Function parameter or str=
uct member 'sb' not described in 'drm_fb_dma_get_scanout_buffer'
drivers/gpu/drm/drm_fb_dma_helper.c:166: warning: Excess function parameter=
 'drm_scanout_buffer' description in 'drm_fb_dma_get_scanout_buffer'

Introduced by commit

  879b3b6511fe ("drm/fb_dma: Add generic get_scanout_buffer() for drm_panic=
")

--=20
Cheers,
Stephen Rothwell

--Sig_/jKM7rW28KcV_xG8kmBaV5Jf
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmYeKUAACgkQAVBC80lX
0Gw/Ugf9GCtTwfsqYN6Q9KQJP18BmL2JZH5PKYqdWlunZ5miF5JWklZFbmtc/c+y
3OSqOq9JJEQYZjENLc8JuaiRfljIzOWXa8rDPY5ozXTIRaJYaWcEJcBeoQtkgUvM
fyfM6hxh6NvtxZ+m4p5UxPt+rJloNc/I2QADH91xkLzD2SaXBR7Cby35sSj37K3S
SVx52L7Kia/A3DCb6QRzYEBPvY+waP2geLe+UJk8e049itVjYFvzV9bZjT0phRj1
dMZ+KraFIktK8AhJsi5Z9HdKi8liTgfxMMMMGgioR6OZ+ZxMPU/IdfFLuY6xDKap
sIzKNEQ3ExRB1BpsOZoRKA/EXx0FTg==
=NNr4
-----END PGP SIGNATURE-----

--Sig_/jKM7rW28KcV_xG8kmBaV5Jf--
