Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 77C3E2046C4
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jun 2020 03:35:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81BBA6E1D5;
	Tue, 23 Jun 2020 01:35:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23C3F89FA7;
 Tue, 23 Jun 2020 01:35:41 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49rTPQ5Cvmz9sPF;
 Tue, 23 Jun 2020 11:35:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1592876139;
 bh=gv/mXw/BbJZGLfHpBd4783FUndIhkUoL0uMKLMWOnn4=;
 h=Date:From:To:Cc:Subject:From;
 b=BJSylrnTPaBKP3LK6PNDofs1RnT+g7l1YfMYAGBd3EnjVtth5ia4iuBnm4u04bhun
 MvcmtyRM2G07GsiYMldltLpYjiZN0/8/rIea7rbpJSqvv0fWe5BWWV4xmYiJf8P5NL
 YIEaCVNzK8/PQEgMaJnI7nTnUBkEsYIrkRMu5U7IBxd7B9LtcTHUi1Fx7ZMU0muE6t
 06wKEZh1GSFww8fT0WvqhSZJ+fFbt8DOCL/gFFw2+KtmbS+047vnEmb/EcpRicfXY2
 5gks9kilXCz4o5WQApI+3+wA8xfSrD2ErsD0DwNMOuYepINzQg4nFdkchqeNG3G+ud
 J4pu8GDsenzWA==
Date: Tue, 23 Jun 2020 11:35:36 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI
 <dri-devel@lists.freedesktop.org>
Subject: linux-next: manual merge of the drm-intel tree with Linus' tree
Message-ID: <20200623113536.427ba57a@canb.auug.org.au>
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: multipart/mixed; boundary="===============0567347959=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0567347959==
Content-Type: multipart/signed; boundary="Sig_/SABs9GvvEkfEy8uX9Ob=Io1";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/SABs9GvvEkfEy8uX9Ob=Io1
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-intel tree got a conflict in:

  drivers/gpu/drm/i915/i915_drv.h

between commit:

  7fb81e9d8073 ("drm/i915: Use drmm_add_final_kfree")

from Linus' tree and commit:

  8a25c4be583d ("drm/i915/params: switch to device specific parameters")

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

diff --cc drivers/gpu/drm/i915/i915_drv.h
index adb9bf34cf97,2697960f15a9..000000000000
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@@ -826,9 -827,9 +827,12 @@@ struct i915_selftest_stash=20
  struct drm_i915_private {
  	struct drm_device drm;
 =20
+ 	/* i915 device parameters */
+ 	struct i915_params params;
+=20
 +	/* FIXME: Device release actions should all be moved to drmm_ */
 +	bool do_release;
 +
  	const struct intel_device_info __info; /* Use INTEL_INFO() to access. */
  	struct intel_runtime_info __runtime; /* Use RUNTIME_INFO() to access. */
  	struct intel_driver_caps caps;

--Sig_/SABs9GvvEkfEy8uX9Ob=Io1
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7xXGgACgkQAVBC80lX
0Gw8KQf/fWB/Dh7RSZ0e3knufDjbCy+pXUVrrSwOakMzSkHde+laUhmZQK8ckJvL
v3sb+TPv2YlNKmY7tcSrkVnfKIaVw+scdrl0MUJHAg0qumJ3Y58CCGG7loFZNfQp
H+4+LIQt/3/LudgUMDs4faUYdqVe7t/JNLlu7afcGACB95rZUHOuFyGp9A46Xsiv
qowZISoffQTut1+Ry4fbVodArQRx+JlYLXXQEpVDN4z49kLYeX5/jFEeyzgM971J
bmsai0wv8lSUNR+N2iqe2l81jZVmLINqpNfPtpfLbtbWztOGYJMsL5JqCL3DRizE
cHcj2zjyOdmjvL4tm9IBoUFfSCbuYQ==
=7AvC
-----END PGP SIGNATURE-----

--Sig_/SABs9GvvEkfEy8uX9Ob=Io1--

--===============0567347959==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0567347959==--
