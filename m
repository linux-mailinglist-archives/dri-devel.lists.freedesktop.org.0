Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 740EFABF20E
	for <lists+dri-devel@lfdr.de>; Wed, 21 May 2025 12:49:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 987E910F2E0;
	Wed, 21 May 2025 10:49:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="VLX0rgfr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69DC91120F6
 for <dri-devel@lists.freedesktop.org>; Wed, 21 May 2025 10:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=202503; t=1747824552;
 bh=U8Kum45Soj1YdBMA948I7gV1KcZcpl8+JJ7xVSf4/EM=;
 h=Date:From:To:Cc:Subject:From;
 b=VLX0rgfrZNZswyEh6zlSqTxPcO3RFrbJhcv8iLdFLOrK2zhH7liADeiAHNm/jSreU
 epJc1BEttiBsH6sJUd5Z9AG9Wc3jhiD56eJ3RNCRBn8V4q3vBK/FnDD2C84tEs/qO2
 93UTRGtFgHQ+iFtQ+88DKooe0g95S1weQ3rbMMULHRi2vl1kIQ9tpMI7RZwFuUl8dK
 fezrqIlwaKypj/NLvZjAMZ+gZSG9de64IJpKLTq+OmJjbW9gSd8d1/G36X161hMBhh
 F7fsYzuUCIEE+Dx8xHHgEWb/8CJ5x7bfSYglNsqnQ5LJuNDwB7H/cGxjI292lJUNTn
 rwEKiCI6emwxg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4b2Spc30nCz4xM2;
 Wed, 21 May 2025 20:49:12 +1000 (AEST)
Date: Wed, 21 May 2025 20:49:11 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@redhat.com>, DRI <dri-devel@lists.freedesktop.org>
Cc: Ben Skeggs <bskeggs@nvidia.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the drm tree
Message-ID: <20250521204911.0266f4d3@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/+E.CrsXL.3kfQOTMBk0EHeK";
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

--Sig_/+E.CrsXL.3kfQOTMBk0EHeK
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm tree, today's linux-next build (htmldocs) produced
this warning:

Error: Cannot open file drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c

Introduced by commit

  c472d828348c ("drm/nouveau/gsp: move subdev/engine impls to subdev/gsp/rm=
/r535/")

--=20
Cheers,
Stephen Rothwell

--Sig_/+E.CrsXL.3kfQOTMBk0EHeK
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgtr6cACgkQAVBC80lX
0GygLwf/YK4BWSNTJs7KHU6PcKmiYb5AU6rzo8UX264WliJEvk2J+RALl+n2+OHp
EO3Na/00d7NeYp1ftqa+UwullZ6/msQ6akwjv5TNsJlwh7dnHX7VtWmyhBJV6aB1
xPBmg5Lbvyppa8nRpujPKMBHzWX0+dmS7Ue1eXPPf7oa5ISJhjHDW9MW+Q3fbv7j
P2yqE9D5nc5hW4mFiKIEbVAlB+EUG18lyvqg4o9ie8eXDi5WLhUGLyOt+Nc8Mmrz
v4Xwzv+vjCQMtrOB1CZa4heSCOwdDlgEISYbLmE2Dr24yAKAJ6pJ+0fWKRBzI9Ep
IntBHKkodjzveNIelAW7T9JZQtMlbQ==
=XpP1
-----END PGP SIGNATURE-----

--Sig_/+E.CrsXL.3kfQOTMBk0EHeK--
