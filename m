Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E53B3228
	for <lists+dri-devel@lfdr.de>; Sun, 15 Sep 2019 23:18:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52B0E6E042;
	Sun, 15 Sep 2019 21:18:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 996B56E042
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Sep 2019 21:18:24 +0000 (UTC)
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1i9buV-0001PF-0w; Sun, 15 Sep 2019 21:18:19 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 412E627415FF; Sun, 15 Sep 2019 22:18:18 +0100 (BST)
Date: Sun, 15 Sep 2019 22:18:18 +0100
From: Mark Brown <broonie@kernel.org>
To: Vasily Khoruzhick <anarsoul@gmail.com>, Qiang Yu <yuq825@gmail.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Chris Wilson <chris@chris-wilson.co.uk>, Dave Airlie <airlied@linux.ie>,
 DRI <dri-devel@lists.freedesktop.org>
Subject: linux-next: manual merge of the drm tree with the drm-misc-fixes tree
Message-ID: <20190915211818.GH4352@sirena.co.uk>
MIME-Version: 1.0
X-Cookie: Man and wife make one fool.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=sirena.org.uk; s=20170815-heliosphere; h=Content-Type:MIME-Version:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=D/Z/DXNZ/ZVcvc0jLU37vcbECmBAnSYgyR5Gc9IOvzA=; b=LwZp3BUvgprsHm2BIbc+p9Jjs
 10cJCpaldCpKGLrnvqE+TW+71VDIrzIoqvk6/y9cWe8lXdt4qGDlsRwm5PbCXm2tZJ5pFb6+MHZnt
 DrNrJPafofm90sgUHeRxtU9ex9wTdMjxlqQvUd6UB3Ib4327PzCPnqFwHDwSROCe9u2OQ=;
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
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: multipart/mixed; boundary="===============1329180433=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1329180433==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ISKrrfpKsPiF35CV"
Content-Disposition: inline


--ISKrrfpKsPiF35CV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/lima/lima_gem.c

between commit:

  21670bd78a25001cf8e ("drm/lima: fix lima_gem_wait() return value")

=66rom the drm-misc-fixes tree and commit:

  52791eeec1d9f4a7e7f ("dma-buf: rename reservation_object to dma_resv")

=66rom the drm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/gpu/drm/lima/lima_gem.c
index b609dc030d6ca,ff3d9acc24fcf..0000000000000
--- a/drivers/gpu/drm/lima/lima_gem.c
+++ b/drivers/gpu/drm/lima/lima_gem.c
@@@ -341,8 -341,8 +341,8 @@@ int lima_gem_wait(struct drm_file *file
 =20
  	timeout =3D drm_timeout_abs_to_jiffies(timeout_ns);
 =20
- 	ret =3D drm_gem_reservation_object_wait(file, handle, write, timeout);
+ 	ret =3D drm_gem_dma_resv_wait(file, handle, write, timeout);
 -	if (ret =3D=3D 0)
 +	if (ret =3D=3D -ETIME)
  		ret =3D timeout ? -ETIMEDOUT : -EBUSY;
 =20
  	return ret;

--ISKrrfpKsPiF35CV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1+qpkACgkQJNaLcl1U
h9BdyQf+NBR+OtiuVpJuBrAynzBaPQz4b6bfcATyxJIDwwtTqUsI4xcGXwnn+Tag
FOfoQit1DM4gnslG1PodBwMU5ieaQXCTLNqZhCBXpG4QMAqaGt3KKzoODqAPYu/r
X90diF77RxAKDFrqCXtl32zCVKc3J/HaP15P2lw5r7bEell5CRz9R0kMRCl8fBvk
0hwWoTPlvEkQmpZkxhv89/4CU0pNjOgrDF90QldzJ9AlXsc+E+Tk0uwcF0XG1VJp
KdFEEUzCOiDWBUZJNeRySXCXbF41TN8yqHUJQjRCiSHnvOobLIebo7qWCh8oALHR
hSRfz7GzhnIt8KzUiXAwm8CGfD+giw==
=qRpR
-----END PGP SIGNATURE-----

--ISKrrfpKsPiF35CV--

--===============1329180433==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1329180433==--
