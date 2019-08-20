Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDC0B9543F
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2019 04:20:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 952516E5B3;
	Tue, 20 Aug 2019 02:20:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FF626E5B3;
 Tue, 20 Aug 2019 02:19:59 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 46CDyh66bmz9s00;
 Tue, 20 Aug 2019 12:19:56 +1000 (AEST)
Date: Tue, 20 Aug 2019 12:19:55 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>,
 Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: linux-next: manual merge of the drm-misc tree with the drm-intel tree
Message-ID: <20190820121955.55c9b9f1@canb.auug.org.au>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=canb.auug.org.au; s=201702; t=1566267597;
 bh=G3CcDYSV9aTwPBVzg4lK6cMgQnzXOfARUYQzz0uvdak=;
 h=Date:From:To:Cc:Subject:From;
 b=LBfxPa5RkvNqkYhoDMzW45uA1cXIjSVg2MO5WOIETH+ERJvDH3d1mT9f+aRkCNOsf
 cPkJZOsctR2Jpr6Jj36gMSlyH6z3t1aIYhjDsEJ2epRIKqb5//qd/VJQFc3cWY3/o8
 e2tFgJwkr3DQgwOxuXPDPi/Iuw1u6QOG5Hcj7ClZEvaoDeNOKWpI1MIeDnt7H85RN/
 FAKDSq8/H+yWBb6P+SjJ0oEheJZgSGmlo8u6OqfSUvYSO38VV1csqWYthLuKlGYzXV
 2zMHYa8VuE+YfvksOKvqqjCYTWa73Yoy1ovP0c2Eompy5fHm9kVJy+hrBkg8DyKMsZ
 yMoG2ZDhCIPLQ==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Content-Type: multipart/mixed; boundary="===============1477693361=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1477693361==
Content-Type: multipart/signed; boundary="Sig_/Bzvt5qLq9P9NLVxxhaIymc=";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Bzvt5qLq9P9NLVxxhaIymc=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-misc tree got a conflict in:

  drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c

between commit:

  70d6894d1456 ("drm/i915: Serialize against vma moves")

from the drm-intel tree and commit:

  52791eeec1d9 ("dma-buf: rename reservation_object to dma_resv")

from the drm-misc tree.

I fixed it up (the former removed the code changed by the latter) and
can carry the fix as necessary. This is now fixed as far as linux-next
is concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.



--=20
Cheers,
Stephen Rothwell

--Sig_/Bzvt5qLq9P9NLVxxhaIymc=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1bWMsACgkQAVBC80lX
0Gz+Ngf5AdkyGgbLri4kc0dpaxwEYeoK+87N+hxcF62nF0lwnU6cYfWLTgOHP3kI
+xKxdf+3ZhsPlIACcucM6LvRhzLK6nD7Ka2m6OS7GmSx+Hd9eDVayrWUQ6D0JNFC
HveEU/ktdUol6wuDYDWtNydLajq3CNEYB/YMo/YMP90KGbOxbaR1XV2+DYjIdHT9
egmT3HcWWBl7uCQ+oXJS5VHg5H9QPTJj8Sfy1IpmsWVr7U1PdQPSaiw6BiKDfff5
5U3vs8u/lsoPUx73FXSuwIVKfqOS5bei3boaUe+B2Wtl+nkOrA5uzsAN9T8kNr3n
7YDsadtq6GAJk2/UCkRqKgowSnGzlw==
=W4Hi
-----END PGP SIGNATURE-----

--Sig_/Bzvt5qLq9P9NLVxxhaIymc=--

--===============1477693361==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1477693361==--
