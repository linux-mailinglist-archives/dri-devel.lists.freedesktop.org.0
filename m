Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DEE42A74B4
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 02:12:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EBBD6E8FC;
	Thu,  5 Nov 2020 01:12:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B1FE6E8FC
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Nov 2020 01:12:14 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4CRQV36PYdz9sTK;
 Thu,  5 Nov 2020 12:12:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1604538732;
 bh=VAlFI4XMN6eTaAbjjjkOrxdNBpK/KCzOLmOXnS2QvBk=;
 h=Date:From:To:Cc:Subject:From;
 b=MMBFxumTrIHj20xbLZbDa3UmnxiFgqQn3xK5K8668IkhPMQxcrr07aSWqyqyiAWiQ
 mD131Ul2PNPrdSifA25eXK7S8Aidf19UgVpaE5xYCPIRjghb8+P34iRmr2HwcqEGuF
 XO0QZy3Fumg+fsomX3t0qaSmLrG9KYifzXUpZZ0KYk9mpMqfL5RPwek9ByV+Lj1Y2o
 LbVWqxcLpbFXHaIU24aQdq+9DBRhhfZqDMrMo5h2pIYYxaWVQ7XPkH8tkjQ3iiDzmf
 +xrSqNV4onjs0QO5bDIDmZ6N50dbIFyGu2jhPZvww/TcJ7ikIR2HZYpazFA1gAKyHF
 rGyxgAnWhzrzw==
Date: Thu, 5 Nov 2020 12:12:11 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <seanpaul@chromium.org>, Dave
 Airlie <airlied@linux.ie>, DRI <dri-devel@lists.freedesktop.org>
Subject: linux-next: manual merge of the drm-msm tree with the drm tree
Message-ID: <20201105121211.0342302f@canb.auug.org.au>
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
Cc: Rob Clark <robdclark@chromium.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: multipart/mixed; boundary="===============1610819434=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1610819434==
Content-Type: multipart/signed; boundary="Sig_/HKw2_5wHhMEYNQRMrIWYit1";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/HKw2_5wHhMEYNQRMrIWYit1
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-msm tree got a conflict in:

  drivers/gpu/drm/msm/msm_drv.h

between commit:

  3c9edd9c85f5 ("drm/msm: Introduce GEM object funcs")

from the drm tree and commit:

  8f642378bfe5 ("drm/msm/gem: Move prototypes to msm_gem.h")

from the drm-msm tree.

I fixed it up (I used the former version of this flie and added the
following fix patch) and can carry the fix as necessary. This is now fixed
as far as linux-next is concerned, but any non trivial conflicts should
be mentioned to your upstream maintainer when your tree is submitted for
merging.  You may also want to consider cooperating with the maintainer
of the conflicting tree to minimise any particularly complex conflicts.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 5 Nov 2020 12:10:23 +1100
Subject: [PATCH] drm/msm/gem: fix up for "drm/msm: Introduce GEM object fun=
cs"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/gpu/drm/msm/msm_gem.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index d79e7019cc88..9c422af6dd49 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -94,7 +94,6 @@ struct msm_gem_object {
 int msm_gem_mmap_obj(struct drm_gem_object *obj,
 			struct vm_area_struct *vma);
 int msm_gem_mmap(struct file *filp, struct vm_area_struct *vma);
-vm_fault_t msm_gem_fault(struct vm_fault *vmf);
 uint64_t msm_gem_mmap_offset(struct drm_gem_object *obj);
 int msm_gem_get_iova(struct drm_gem_object *obj,
 		struct msm_gem_address_space *aspace, uint64_t *iova);
--=20
2.28.0

--=20
Cheers,
Stephen Rothwell

--Sig_/HKw2_5wHhMEYNQRMrIWYit1
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+jUWsACgkQAVBC80lX
0GwljwgAgw+7BqWWL4s+lxlnRO5JkJ0kfD5PZczl0mjQsZjICkodrG48KQiBwyBe
PH0Y+CY/+TrdT1kB1F/tMMsgrLvhcT8w3K6qdN0iIozM1WPvM4my5Qs7mYPtGSwH
nV/dwgvSCC5uQ5QN6oHimHVYYa6qMNusyHZXrWQz0m5gDjoPNvhC6UkERLaeZfQL
QhqK11jPUI7PN37Wa+GWtfAVFmL5bqvBUfJkH+4ERSLnCNL2tlNvYC/47/Zbv/cR
7lYvlhnLtK8iaEgnFLdKNY3NnD8+NhoSCdxp5rK3I7Ud09+Y29t9qMTpzCwbnGpE
fh6pcm7JVax67YvTRFgtqU1k+X0HCQ==
=DGF6
-----END PGP SIGNATURE-----

--Sig_/HKw2_5wHhMEYNQRMrIWYit1--

--===============1610819434==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1610819434==--
