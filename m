Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1BB7668708
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jan 2023 23:34:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3D7010E945;
	Thu, 12 Jan 2023 22:34:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2457410E944;
 Thu, 12 Jan 2023 22:34:05 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4NtK8l48kJz4wgq;
 Fri, 13 Jan 2023 09:33:59 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1673562840;
 bh=PhoSnUakHyuJvTd+/WoPTqSpYsR8TzsBlmVWBiKMjPc=;
 h=Date:From:To:Cc:Subject:From;
 b=cEyFwdPgADBVaoQnWnuORqQzlSNCEeMxpb1XEsweyOGXh4DBk/vW+IKPDrkO/CDda
 Iy+ZRSEVEkPhEO1DY2VRo1U1I8nfzUJcM8wpPHTamU/xh/vKW3MOlvEULWZtlqrOak
 kNPjctGlcYRCbTgP7bnanMywaCGm8Pz/SoWgZ4JTVCeJyD5LXJjC1SN8W9KHc/h4nY
 WVdqdiyV4b4/Tme2IAv8n93XjyxH9Y2tRBeS0+TxkVLunhP47p5s3ECsolDvbiKBmg
 rD5Cva3AlJTkvxQDtQDVxPHIynGxyoAgApXL3ZUMVG9a2ftobGQv1SkJJsZWANTUvF
 iCPRa67EzWCqQ==
Date: Fri, 13 Jan 2023 09:33:58 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: linux-next: build failure after merge of the drm-misc-fixes tree
Message-ID: <20230113093358.45a00788@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/DTkdQoO84Te2p8NDHJMhYBg";
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
Cc: Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Maxime Ripard <maxime@cerno.tech>, DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/DTkdQoO84Te2p8NDHJMhYBg
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-misc-fixes tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/gpu/drm/vc4/vc4_bo.c: In function 'vc4_create_object':
drivers/gpu/drm/vc4/vc4_bo.c:398:13: warning: unused variable 'ret' [-Wunus=
ed-variable]
  398 |         int ret;
      |             ^~~

Caused by commit

  07a2975c65f2 ("drm/vc4: bo: Fix drmm_mutex_init memory hog")

I have used the drm-misc-fixes tree from next-20230112 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/DTkdQoO84Te2p8NDHJMhYBg
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmPAitYACgkQAVBC80lX
0Gy3SAgAgrOdVqEDfP+xxKnErHNmM9Au/FaYVo/KCi0HIbCdryKbzfVfVYqMQppV
DbN2/OK1hwaA8mVtnG5XIYs5HyMfEJF08IeCmVMW4pG7ZaPJHOMt9fhR1vn0YlCP
ooOAaO0x+dcJrNWMxJ1QtVeldybXQ+4n+/g2tkakpaflRsSVF24lG4d0a9FfNt/A
PZskOM7hMTAdVUP3vpBH2GLn+1wTEXFszoOvYs5irmkeKglag1mAuuf8LUbc0XPQ
+5+jch2OgEBNgGJVWy7mLs6o5v08P5yHZcEKYcEhJDLelOmK/Tn5H9Msw2LRmjRu
9tt8P/DG+9FKsc5L5Hqowi+Gmlp0Kw==
=fiE3
-----END PGP SIGNATURE-----

--Sig_/DTkdQoO84Te2p8NDHJMhYBg--
