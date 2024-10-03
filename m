Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C998898E7F8
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 03:04:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6D5810E07D;
	Thu,  3 Oct 2024 01:04:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="u0uEohHN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44BB310E07D;
 Thu,  3 Oct 2024 01:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1727917473;
 bh=X/YYsEKEor7BsDLH5o98zBdgxxt28r7iTiDpVYQK73Y=;
 h=Date:From:To:Cc:Subject:From;
 b=u0uEohHN8Dq1XXlZt8fnzUOWGGYtsGuwaBZ6Cgc6jbw9tR0aE+jZ1bpKWee93cT+J
 fwKvT4GdCM7SktY9DqB/Idm4WEbP39m0oWQoVm2kc+ovsEmOlAlU857Hn63u3Re1nU
 DV7naRg7PJqPnCfvSx/Qwnvr3Xx/gDTmFYMoHasEC6FRcidwEDHzqh3CVPzQkCuScG
 RbvQIp7K4klT0ypFrkVjLTpJNfZe+ZE194UMakNN6+gKbhdjggQyfweehhDPgBl/U/
 BqJnRucH+KPGFsMzGb5gytSeg0dOTQLVQw/wQa2IwrL7YU81rIO3EH249dCL9T1zRX
 UKFYH2HwpViKw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4XJtk807Zlz4wbr;
 Thu,  3 Oct 2024 11:04:31 +1000 (AEST)
Date: Thu, 3 Oct 2024 11:04:31 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Simona Vetter <simona.vetter@ffwll.ch>
Cc: =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>, Boris
 Brezillon <boris.brezillon@collabora.com>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Liviu Dudau
 <liviu.dudau@arm.com>
Subject: linux-next: manual merge of the drm-misc tree with the
 drm-misc-fixes tree
Message-ID: <20241003110431.4bbfd467@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Y4XmcyjBBi1VuD=v6iR9R+b";
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

--Sig_/Y4XmcyjBBi1VuD=v6iR9R+b
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-misc tree got a conflict in:

  drivers/gpu/drm/panthor/panthor_drv.c

between commit:

  2b55639a4e25 ("drm/panthor: Add FOP_UNSIGNED_OFFSET to fop_flags")

from the drm-misc-fixes tree and commit:

  e16635d88fa0 ("drm/panthor: add DRM fdinfo support")

from the drm-misc tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/panthor/panthor_drv.c
index c520f156e2d7,f9b93f84d611..000000000000
--- a/drivers/gpu/drm/panthor/panthor_drv.c
+++ b/drivers/gpu/drm/panthor/panthor_drv.c
@@@ -1383,7 -1476,7 +1476,8 @@@ static const struct file_operations pan
  	.read =3D drm_read,
  	.llseek =3D noop_llseek,
  	.mmap =3D panthor_mmap,
 +	.fop_flags =3D FOP_UNSIGNED_OFFSET,
+ 	.show_fdinfo =3D drm_show_fdinfo,
  };
 =20
  #ifdef CONFIG_DEBUG_FS

--Sig_/Y4XmcyjBBi1VuD=v6iR9R+b
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmb97Z8ACgkQAVBC80lX
0GzE6gf/c+S9TSnISE26vBOeap0FH86mtSRUJiSJ6ameIHRJjSIT/+sDxhf5CiG8
+tB+9/a5n48kRrrNVA48wtRqi81UUo0bp2+GWA4VMj4Bb011MeCte23mF68mssyF
72iYSp22x5n8FlNTtTJW5hrSwj69p0UlDJgs2Uce/rX0I+24ewXDq71iMus6Mk7l
9bhzugePKWcQVA1wR3ugJHk6M5EggPIOq5mX1ITKPbZwmom3vqtdS6BqPx7fHAjS
3mZeC/btok+2gN0SJ7qfY4rixLoVQt2F5QuQuRa4QBqBjMI1IbHqiwTXZSsRh08c
ixCkOtFnsQfTsCwR/9lvI86VgF+vwA==
=fEHS
-----END PGP SIGNATURE-----

--Sig_/Y4XmcyjBBi1VuD=v6iR9R+b--
