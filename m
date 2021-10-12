Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA0FB429B5F
	for <lists+dri-devel@lfdr.de>; Tue, 12 Oct 2021 04:18:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72AA689DA4;
	Tue, 12 Oct 2021 02:18:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2599C89DA4
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Oct 2021 02:18:44 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4HSzqL3w2Bz4xqP;
 Tue, 12 Oct 2021 13:18:37 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1634005120;
 bh=7TdwyrOsBCjwW6kUZLQ0ge42Vqvzaat+9cR/oYtHFUQ=;
 h=Date:From:To:Cc:Subject:From;
 b=VYfu0/fB6iI+Rzc+h/RAHVjla9SGIeXzax2RuDc9USZYB0FKyd66GQ3M3d3yo0kWF
 8B9dYbG2roCO0ayVXP40pFmaB8zo0rUMJdabTcQ095IbcCgzqmVcwMoj3GbJTKeYgK
 oA0SI+7kltUIfPiczgIcKPRXQAy32Xm1rc8jYhKCRCY3ary5kknqpOndLBzdDkBCXz
 UvXicU9Oz5RMvz0A99R0zFRtesl67NPRJmSW5/vYmorARw7sFftx2KRMs7BGQtkNvp
 G0Mo5TkxuJioVdXYC/f+QjpzVbWe/LJIbCq0LRctDR8yCo5QzgoNcHWIyXYM4g8Wkt
 tfl+nEJwBISCA==
Date: Tue, 12 Oct 2021 13:18:36 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>
Cc: Karol Herbst <kherbst@redhat.com>, Luo penghao <luo.penghao@zte.com.cn>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the drm-misc tree
Message-ID: <20211012131836.4e17a031@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/aSVkmKQBx7LDjmkhgmtejTx";
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

--Sig_/aSVkmKQBx7LDjmkhgmtejTx
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-misc tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c: In function 'gp100_vmm_=
fault_cancel':
drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c:491:6: error: unused var=
iable 'inst' [-Werror=3Dunused-variable]
  491 |  u32 inst, aper;
      |      ^~~~
cc1: all warnings being treated as errors

Caused by commit

  404046cf4805 ("drm/nouveau/mmu/gp100-: drop unneeded assignment in the if=
 condition.")

I have used the drm-misc tree from next-20211011 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/aSVkmKQBx7LDjmkhgmtejTx
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFk8HwACgkQAVBC80lX
0GxR9gf/dWV2TjBgsZxX9IdzhcV03t7T1O/NqxYkgb8OAGgM4dTbIKVqPLoHPOHN
C+S/I6iPKyiFKcMhdzepdt3VDZJ11Ww4vauK3NWQTZ9a+SgmaH9ykbDp6+nkOrzS
PfPi4mEMnfS//WmCgd8PWgULRkOcoFvwuGpy7kml4TLGTI06i9tHZreRQKkUzBN8
Oy+k1ev2ZPh9g0aqeBxucB4yXHxGSPNON3XqIO8/91qPFtTubJ8wrFBg6CIJw2gl
I3Qp+EnJ35kWlszJQiHmmTzVQzbBw7Lw1Ztz8ZgZblUCgvBtEjoA6a1KHBw89Jnv
rzbtA1U9Xx8IcRqtnUygkFvxySkvjA==
=O10a
-----END PGP SIGNATURE-----

--Sig_/aSVkmKQBx7LDjmkhgmtejTx--
