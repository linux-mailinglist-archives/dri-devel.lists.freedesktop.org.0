Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED949180E25
	for <lists+dri-devel@lfdr.de>; Wed, 11 Mar 2020 03:44:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69010892A1;
	Wed, 11 Mar 2020 02:44:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 443 seconds by postgrey-1.36 at gabe;
 Wed, 11 Mar 2020 02:44:37 UTC
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77CF5892A1
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Mar 2020 02:44:37 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 48cbgs1DRzz9sPF;
 Wed, 11 Mar 2020 13:36:36 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1583894228;
 bh=+JH45CaJ8RQ/br5Hf0W4Xq5hn+PXWNj2y+4emeie5wI=;
 h=Date:From:To:Cc:Subject:From;
 b=byC3Zym4NutwqTImCcrtNlHWWJ7KK3rLjQP5yRiWg9wgwsBYwuNKh9HflAVBDQcNm
 ocfdgkGgFozYLDZUhQrH1lPoHBuI0avdI5uD6v6NyqtbB3fUWEEhacgV/WHmUlNYU3
 dx1y376SwRSWyIU58Yls8ihRzOMgMinuypHeIeQ+2irvEvsVT/j/ZyYZHnvnPaBp+w
 Qu0eTtrc7NUywKnQj2OpbIut6NbOuClNq4qCf6Jvvzl4w7VojsviW1JBVzi/es0gWb
 lN8sNUChe4zF58IA4N/LxWqa1eJzWfBraK/vqzp9R1SpZSr1n7Ta6ltldYbuasoqD7
 bOWgfB5URtq0Q==
Date: Wed, 11 Mar 2020 13:36:35 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI
 <dri-devel@lists.freedesktop.org>
Subject: linux-next: manual merge of the drm-intel tree with the
 drm-intel-fixes tree
Message-ID: <20200311133635.7fcb422e@canb.auug.org.au>
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
Cc: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: multipart/mixed; boundary="===============1505191041=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1505191041==
Content-Type: multipart/signed; boundary="Sig_/Cm=kxNYzaFTdCCtVhbFDBzh";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Cm=kxNYzaFTdCCtVhbFDBzh
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-intel tree got a conflict in:

  drivers/gpu/drm/i915/gvt/vgpu.c

between commit:

  04d6067f1f19 ("drm/i915/gvt: Fix unnecessary schedule timer when no vGPU =
exits")

from the drm-intel-fixes tree and commit:

  12d5861973c7 ("drm/i915/gvt: Make WARN* drm specific where vgpu ptr is av=
ailable")

from the drm-intel tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/i915/gvt/vgpu.c
index 345c2aa3b491,abcde8ce1a9a..000000000000
--- a/drivers/gpu/drm/i915/gvt/vgpu.c
+++ b/drivers/gpu/drm/i915/gvt/vgpu.c
@@@ -271,18 -272,12 +272,19 @@@ void intel_gvt_release_vgpu(struct inte
  void intel_gvt_destroy_vgpu(struct intel_vgpu *vgpu)
  {
  	struct intel_gvt *gvt =3D vgpu->gvt;
+ 	struct drm_i915_private *i915 =3D gvt->gt->i915;
 =20
- 	WARN(vgpu->active, "vGPU is still active!\n");
 -	mutex_lock(&vgpu->vgpu_lock);
 -
+ 	drm_WARN(&i915->drm, vgpu->active, "vGPU is still active!\n");
 =20
 +	/*
 +	 * remove idr first so later clean can judge if need to stop
 +	 * service if no active vgpu.
 +	 */
 +	mutex_lock(&gvt->lock);
 +	idr_remove(&gvt->vgpu_idr, vgpu->id);
 +	mutex_unlock(&gvt->lock);
 +
 +	mutex_lock(&vgpu->vgpu_lock);
  	intel_gvt_debugfs_remove_vgpu(vgpu);
  	intel_vgpu_clean_sched_policy(vgpu);
  	intel_vgpu_clean_submission(vgpu);

--Sig_/Cm=kxNYzaFTdCCtVhbFDBzh
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5oTrMACgkQAVBC80lX
0GxCfwf8DF6UZIwJBxtfb8gzkqDJvX/8pPbpOWpeUrdQTiqxjvVkMLh9wg2em+U5
TeNW2XcAameNYoShX3Vd1m72DRtsBhkzWSlhDvvTcb/bJ26nFUAUqZmR8UouGCnw
99Sfw5k13EFOYXN9hLocEEi63T5Stlo9Sd97XyJuky3MFObStnc+38WAAspTioyC
FNIZwHjC6+MtY95jeuH81GlsjQcDl42GrK+/Quxc2xEi61BI5FrTFC20TskItmYp
0beAHa0nZ42ZoMwU7QhCTzDMzcFD1O/GRhmTxEtcm0BxXnz5G+Z+oTmkkEwQWbgg
QufOTS0DpsdJ3dogPO5z1Ew4wr3AIA==
=H4EQ
-----END PGP SIGNATURE-----

--Sig_/Cm=kxNYzaFTdCCtVhbFDBzh--

--===============1505191041==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1505191041==--
