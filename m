Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F52C1FC2F2
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jun 2020 02:46:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37F4A6E0EA;
	Wed, 17 Jun 2020 00:46:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C8516E9BF;
 Wed, 17 Jun 2020 00:46:19 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49mmbB5nnlz9sRR;
 Wed, 17 Jun 2020 10:46:13 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1592354777;
 bh=T7qDNiqsatPfNcwtP0ZohdxGPF6aYtQjyqHRxGYm7cU=;
 h=Date:From:To:Cc:Subject:From;
 b=pHh4NI1/wal/nqwh4V9pAygXci55K+deTqM5K75m44IbyLCOrZ9fmT9b9ila/LY5R
 cnsDjoePOqcX5jNS6gP8nU5paAMg+/KKs8lCyT1ON/WLz1YPbXTNRhCk9DPb2xbMsT
 /uPUhMrFvfXHdECDwfC7qSqBiPUKxVRMw4+3hCiGFFWXQ7cfQi2EMdx6rQ7cTE32il
 QWbZMUkdJSJ845mnOv1R8hC4YPYSwa9wctSUiGH0zAaKmQng43wQso/+hapE0CvIQB
 0Cb08FWxF0Z7ggmpBkxuIdhRDjYmHXDD1q5+QGseZIqBZjdVcgwCTy1gEP37XUaSq3
 FMZqBfUBNbaJQ==
Date: Wed, 17 Jun 2020 10:46:12 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>
Subject: linux-next: manual merge of the drm-misc tree with Linus' tree
Message-ID: <20200617104612.59695467@canb.auug.org.au>
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
Cc: Emil Velikov <emil.velikov@collabora.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Ben Skeggs <bskeggs@redhat.com>
Content-Type: multipart/mixed; boundary="===============0836555365=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0836555365==
Content-Type: multipart/signed; boundary="Sig_/rikD_NWmqy+j.E+hnL9Xc1Y";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/rikD_NWmqy+j.E+hnL9Xc1Y
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-misc tree got a conflict in:

  drivers/gpu/drm/nouveau/nouveau_display.c

between commit:

  183405879255 ("drm/nouveau/kms: Remove field nvbo from struct nouveau_fra=
mebuffer")

from Linus' tree and commit:

  cdc194cebd71 ("drm/nouveau: remove _unlocked suffix in drm_gem_object_put=
_unlocked")

from the drm-misc tree.

I fixed it up (the former just removed one of the functions modified
by the latter) and can carry the fix as necessary. This is now fixed as
far as linux-next is concerned, but any non trivial conflicts should be
mentioned to your upstream maintainer when your tree is submitted for
merging.  You may also want to consider cooperating with the maintainer
of the conflicting tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/rikD_NWmqy+j.E+hnL9Xc1Y
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7pZ9QACgkQAVBC80lX
0GyMgQf9EC+fyUxPHDxIaHdqW/A/aJmzP80NUP6WRiSVK37CRpUhsZ5vBGn4Nm0E
XRMyhHMH6EQe5xa4wyrB/BfNdH1BTw9bwJ0NhnD4kksZxL1eyaPhA2haHhj1NigQ
gCE2Ec6EWzXGHfy6Hd/ggpAEfdrYofYnGi53aApJl818U3U+uSdXuZrhqu/mHJEL
rEC9xRmmVRkbiS5MaqbTReNivX/N7AH3GB8JZHi1gyfZ3iCOwck3XZtuyDocx3Kd
UUG21mz8jn3FaHUmeGLra5+JojgFrToChWIBL32tP2UN6Qaz+etZQWLkSpcw3G3c
XG53EMDhYBMrVUH4whMQ3vYp5KR6lQ==
=xOTL
-----END PGP SIGNATURE-----

--Sig_/rikD_NWmqy+j.E+hnL9Xc1Y--

--===============0836555365==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0836555365==--
