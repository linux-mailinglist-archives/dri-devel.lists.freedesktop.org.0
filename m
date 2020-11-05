Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15DA12A7791
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 07:50:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0553E6E0EC;
	Thu,  5 Nov 2020 06:50:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEB176E0EC
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Nov 2020 06:50:37 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4CRZ0S4yqvz9sSs;
 Thu,  5 Nov 2020 17:50:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1604559035;
 bh=KMFs+51xchVCny2BoseXOTP3DtQHswbvOZzcGNF4J2w=;
 h=Date:From:To:Cc:Subject:From;
 b=L56AONlEzqN0j9OPe+mUDe1lzfvLXmeqZsm8xKN0olUICORmH4EXxdqvXIlMLdIJn
 1A39yilzL0vdkzavLRiCFU+5kO6q5yPpg7YQJyTwvyHdZLByeAHw0Qis+a6Zup18id
 CCNqcU2jU8Xd7ksZAcsJd+gSyB0kSYVDj+6M5Po0HiaV3MJWTPMJJkx6hAc2cEofRa
 ELF37570g6m+epatuMRkleELbxHvQwZUTaQbUES8YJnFpQ3rUAsKC7SWTW3CWoPJaQ
 odM2jAVw64bMGXCaJhNWhxhQO2SlMdHzW19IprmYcP3i5KEXDtOo5dZ/CQK6j/wrMu
 EJjTPWRNXsBxw==
Date: Thu, 5 Nov 2020 17:50:31 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@linux.ie>, DRI <dri-devel@lists.freedesktop.org>
Subject: linux-next: build warnings after merge of the drm tree
Message-ID: <20201105175031.00e0b081@canb.auug.org.au>
MIME-Version: 1.0
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: multipart/mixed; boundary="===============1455612003=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1455612003==
Content-Type: multipart/signed; boundary="Sig_/OtWQb0KYZWLwU0EAd1tNEa7";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/OtWQb0KYZWLwU0EAd1tNEa7
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm tree, today's linux-next build (htmldocs) produced
these warnings:

include/linux/dma-buf-map.h:106: warning: Excess function parameter 'vaddr'=
 description in 'DMA_BUF_MAP_INIT_VADDR'
include/linux/dma-buf-map.h:106: warning: Function parameter or member 'vad=
dr_' not described in 'DMA_BUF_MAP_INIT_VADDR'
include/linux/dma-buf-map.h:106: warning: Excess function parameter 'vaddr'=
 description in 'DMA_BUF_MAP_INIT_VADDR'

Introduced by commit

  20e76f1a7059 ("dma-buf: Use struct dma_buf_map in dma_buf_vunmap() interf=
aces")

--=20
Cheers,
Stephen Rothwell

--Sig_/OtWQb0KYZWLwU0EAd1tNEa7
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+joLcACgkQAVBC80lX
0GyHYQgAkcUWDWS7Qp7s0NEcKvGQ/fTY0dfJzESnLSpe9hcFHjexq850QfyN79D3
3Rg7X2iEUzXpIJhay2uhoD64rGPc0CoMNr45pbPOydAQwak5vKFqeZQTpGjRUur1
HmqUMK+9tnqJaI7aP0LijNn8nWYL7eds8izd8Rn1+R1QKLVKT66e3ofBJ/7IPcs8
fmUmgxow2oaBeuS8GmI7J96dFY+0GrB9egzwL2rIgTMgVl9lBTOsqf9s+veKmrlM
8e8YWuyXwpaHzB3YlUO6aVdCOEgeTaZDdLcRKNGiMnrFLX7YxKAKY2hK4hp1D14r
zKc7aPjLxTo4cvRtKT8cXbcHHU2n/w==
=DIsL
-----END PGP SIGNATURE-----

--Sig_/OtWQb0KYZWLwU0EAd1tNEa7--

--===============1455612003==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1455612003==--
