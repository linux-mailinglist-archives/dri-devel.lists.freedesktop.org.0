Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CCAB7717DD
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 03:37:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B52AB10E07C;
	Mon,  7 Aug 2023 01:36:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9DA810E057
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Aug 2023 01:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1691372215;
 bh=qYPlWaK95QOudWfmyyYQimN/oDRqRiEx4gbDGuC/L2U=;
 h=Date:From:To:Cc:Subject:From;
 b=RAr4mIkwQW2hGPy5ZYiTUz/cAuUG/ChZyigawb8Nr4wEQ1D0osIJNMQBuAEVek6TP
 UkTMZlGE4nuiadTj0quLFRWXIN+VGzzCC5ds2/iUX4eaxmhwjYVKKuuDQx4iYXNA3s
 eKps1Z4ERlwdE7sTcgCeCErl2AlFZ90/H0tma070IZ6nVwQDcWPLaw9BksPX9JpvOs
 UYvvxN9b1080nLPrJj2g416Gbg5ECNBoh9TWCV5OVCXS7JnPAL8JTu60rraEIt7KdX
 0j/3/nAhyBmGo1Sn+uVxb4qQ9oWuBojtKfCN5hpNkk81kwMW+z6g9A0ro6SMSp4zwu
 uxOaM4XPMVE2w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4RJzSl31Mnz4wxQ;
 Mon,  7 Aug 2023 11:36:55 +1000 (AEST)
Date: Mon, 7 Aug 2023 11:36:54 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: linux-next: build failure after merge of the drm-misc tree
Message-ID: <20230807113654.2979f61d@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/P.sraW1v6VilysQk=hTs9d8";
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
 Danilo Krummrich <dakr@redhat.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/P.sraW1v6VilysQk=hTs9d8
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-misc tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/gpu/drm/nouveau/nouveau_dmem.c: In function 'nouveau_dmem_migrate_c=
hunk':
drivers/gpu/drm/nouveau/nouveau_dmem.c:681:43: error: 'chunk' undeclared (f=
irst use in this function)
  681 |                 nouveau_fence_emit(fence, chunk->drm->dmem->migrate=
.chan);
      |                                           ^~~~~

Caused by commit

  7f2a0b50b2b2 ("drm/nouveau: fence: separate fence alloc and emit")

I have used the drm-misc tree from next-20230804 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/P.sraW1v6VilysQk=hTs9d8
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmTQSrYACgkQAVBC80lX
0GxyLAf9GHKNNoetGmEyq0zMc8qYcdTC3jBt2sIP4QnQwkPsjDuWvsNUfqTLtJTC
F3oxGntYtxBWW4Au7Oku8xOY1PZKCGbS8toY/FmYTO6ZYniLcngSuaLHLvDMZqov
M3mS6iUVQTxJKH/8V4koVBD7I0U5QZZqM66P+MqET6XJlUfBGP9S3Pt5lI5oRvg2
FviknAGPk3+dGKLKkv6/yowtYHVhHVFZKXzV4nXQ3Tw3dwZKF7KqgOnwAerZCZqX
eKJufgIHBoTp23AiHoGfb8xs6tqVX/2komDOSsnwTqny9l6J+OXx6HUYcHlAovDB
bPgj9q6lurdEyiW+YwVwuN5fi3l+fQ==
=vXDQ
-----END PGP SIGNATURE-----

--Sig_/P.sraW1v6VilysQk=hTs9d8--
