Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A99CE453C3B
	for <lists+dri-devel@lfdr.de>; Tue, 16 Nov 2021 23:30:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58F2489F92;
	Tue, 16 Nov 2021 22:30:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B01E289F92;
 Tue, 16 Nov 2021 22:30:05 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Hv12w0kRMz4xbP;
 Wed, 17 Nov 2021 09:29:59 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1637101800;
 bh=Xw7trDkD7uY90Smie1IcmfEkVeFAgUDQ41gh0T+Nw/U=;
 h=Date:From:To:Cc:Subject:From;
 b=EA7JT3mSR14XgUMj2/qGbJ91bAdcHdTPP11x2oaU/IGmmstuybWDFG9jwALFxiEt7
 59MibmHOJyO3j8bgiqtqWdLu6bJ9GjJ9HuvZAnixDkT001IGjWZkIZPutTMbYHRiN+
 GtTk0+sufe1wXE6cPdY9vzlAsgcq12B9KB/IWyVrUHs1cR3DoJxwoXr0P18m+C8d8e
 QyaduGC8HyS9916dyEHGMHjrhxqRgZlcbKhu0SYGZxmogIcZf41iNpcNjZhlAiNRmf
 HxawsQEWUNw/EOlHLoy8X079GjmWQMs1+2TVs0xtdV5ns6R9RDzKKcEpT8SBUvyfao
 131Enj600ZtqA==
Date: Wed, 17 Nov 2021 09:29:57 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>
Subject: linux-next: manual merge of the drm-misc tree with Linus' tree
Message-ID: <20211117092957.5f2daa9e@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/gEh0b4qnm/AUfoV6WAuGq0u";
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
Cc: Karol Herbst <kherbst@redhat.com>, Luo Jiaxing <luojiaxing@huawei.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Fangzhi Zuo <Jerry.Zuo@amd.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Ben Skeggs <bskeggs@redhat.com>, Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/gEh0b4qnm/AUfoV6WAuGq0u
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-misc tree got a conflict in:

  drivers/gpu/drm/nouveau/dispnv50/disp.c

between commit:

  d6c6a76f80a1 ("drm: Update MST First Link Slot Information Based on Encod=
ing Format")

from Linus' tree and commit:

  606be062c2e5 ("drm/nouveau/kms/nv50-: Remove several set but not used var=
iables "ret" in disp.c")

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

diff --cc drivers/gpu/drm/nouveau/dispnv50/disp.c
index 8e28403ea9b1,23fa9ecc2296..000000000000
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@@ -1411,10 -1413,9 +1413,9 @@@ nv50_mstm_prepare(struct nv50_mstm *mst
  {
  	struct nouveau_drm *drm =3D nouveau_drm(mstm->outp->base.base.dev);
  	struct drm_encoder *encoder;
- 	int ret;
 =20
  	NV_ATOMIC(drm, "%s: mstm prepare\n", mstm->outp->base.base.name);
- 	ret =3D drm_dp_update_payload_part1(&mstm->mgr, 1);
 -	drm_dp_update_payload_part1(&mstm->mgr);
++	drm_dp_update_payload_part1(&mstm->mgr, 1);
 =20
  	drm_for_each_encoder(encoder, mstm->outp->base.base.dev) {
  		if (encoder->encoder_type =3D=3D DRM_MODE_ENCODER_DPMST) {

--Sig_/gEh0b4qnm/AUfoV6WAuGq0u
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmGUMOUACgkQAVBC80lX
0Gy1Vgf+JEOJpbZK0OirBcbUj7sM2euc70VF6iKjHF7s8xnqIEtbwZikq7g98xTX
6IaVncGZgtMYtYy8gsNk9zBPSQ34uMs2mjst2oqFouCUcgRv3CbV62O8kwisfK4v
DsRifZtQ3xTsMprHOVWhZ4rQJ0ZZkhG2HceI6JpEydGFKpEk1slidOQGHWq919Rn
TfSFYJ8DGK50C95Qdh9xbmhh169s0kclRiwkwTQm35ERVQeuu5m07BwgQzG72UZS
JSGE7D9RPrdX3G2ChgfzeJm+3RMTj+LeVy7uwjcV0h66HsCrIhr958DTVWTBP3HF
KhuXU566fkYp8+1hU4JcrNvNpdOYZA==
=KubD
-----END PGP SIGNATURE-----

--Sig_/gEh0b4qnm/AUfoV6WAuGq0u--
