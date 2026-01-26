Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8K2ELTird2kZkAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 18:58:16 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 472DC8BD53
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 18:58:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F4AE10E08C;
	Mon, 26 Jan 2026 17:58:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ZcIJGIkH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D48110E08C
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jan 2026 17:58:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 7660B60097;
 Mon, 26 Jan 2026 17:58:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70E1DC116C6;
 Mon, 26 Jan 2026 17:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769450292;
 bh=kuQG20g8zvZ5vAgg1w+mMVMd7qWXKLVSY6x84fQoFos=;
 h=Date:From:To:Cc:Subject:From;
 b=ZcIJGIkHyPYQJGCDm5Cq4L3c54KQnahQcHg3FMYMCrpI9SXEimKRCKhc5t8Ls+ZLm
 p/UcO05fDt1uezQObCWXqZFl6SYTYqoYMK7fC5cZtiD0e0U3WrBWJpWeWaT9vp/O37
 Cg5515GDAEO+sSoyhvPs2n8LTpoKHwZyH0eAoUj080D6TEgVZXQCQxrKa7JdPYOn3h
 YTBQiB8XnL98UrSA69klL468I3mHwvWIKlUULqKhMwqfcAuNAzNtRD63aEEfgZo7VI
 RmTNOA0rkMsowVqETGOg6HwZlVSrDxzpG5KjtKAIJ/GKh2n3j4QB5bfmul3uVznKY4
 yIST0dkiKTpVw==
Date: Mon, 26 Jan 2026 17:58:07 +0000
From: Mark Brown <broonie@kernel.org>
To: Dave Airlie <airlied@redhat.com>, DRI <dri-devel@lists.freedesktop.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 =?iso-8859-1?Q?Lo=EFc?= Molinari <loic.molinari@collabora.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Subject: linux-next: manual merge of the drm tree with the mm-unstable tree
Message-ID: <aXerLzIbpMy9d4lx@sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="1eFnNaNa6x8oeO9X"
Content-Disposition: inline
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-3.41 / 15.00];
	SIGNED_PGP(-2.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[broonie@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:airlied@redhat.com,m:akpm@linux-foundation.org,m:boris.brezillon@collabora.com,m:linux-kernel@vger.kernel.org,m:linux-next@vger.kernel.org,m:loic.molinari@collabora.com,m:lorenzo.stoakes@oracle.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sirena.org.uk:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 472DC8BD53
X-Rspamd-Action: no action


--1eFnNaNa6x8oeO9X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/i915/gem/i915_gem_shmem.c

between commit:

  0c21ec1416a33 ("mm: update shmem_[kernel]_file_*() functions to use vma_f=
lags_t")

=66rom the mm-unstable tree and commit:

  a8a9a590221c1 ("drm/i915: Use huge tmpfs mountpoint helpers")

=66rom the drm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/gpu/drm/i915/gem/i915_gem_shmem.c
index fe1843497b27d,6ad1d6f99363e..0000000000000
--- a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
@@@ -494,9 -496,11 +496,11 @@@ const struct drm_i915_gem_object_ops i9
 =20
  static int __create_shmem(struct drm_i915_private *i915,
  			  struct drm_gem_object *obj,
- 			  resource_size_t size)
+ 			  resource_size_t size,
+ 			  unsigned int flags)
  {
- 	const vma_flags_t flags =3D mk_vma_flags(VMA_NORESERVE_BIT);
 -	unsigned long shmem_flags =3D VM_NORESERVE;
++	const vma_flags_t shmem_flags =3D mk_vma_flags(VMA_NORESERVE_BIT);
+ 	struct vfsmount *huge_mnt;
  	struct file *filp;
 =20
  	drm_gem_private_object_init(&i915->drm, obj, size);

--1eFnNaNa6x8oeO9X
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAml3qy4ACgkQJNaLcl1U
h9ACgAf/VRMmmY0iN/iFkpxw/bHJPUPV20kF7BeELc1R2cRNJ6Yu8t3LAHatkbm0
VljYl/3OOgvd2U3npfpxd8DBngWRQ2o7M5yjOm/u5VNBWhWXgGBg0huXQDaZFM3m
taf+9S40UnxhGwsF0SynJ/F/0+gxflqRfcdork/srOzWQG6tOdV/chMGSmogSq03
MbqkSxuitXyb4EyFx5VN0tuAkOQQaD4HGX1TYupsBn5aedz444bJ9i6ahk2uNymi
XUxndnzogDUXlV5L3GVeKcnaM6EL31tC+dmp0rFzTL6Ln+mXt+feTGb4DP3nfEvY
I/Q92Ub5c1i6pBPRhc9hnIhtNZr2Cw==
=oFVz
-----END PGP SIGNATURE-----

--1eFnNaNa6x8oeO9X--
