Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E243E9BF2
	for <lists+dri-devel@lfdr.de>; Thu, 12 Aug 2021 03:28:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A1B96E221;
	Thu, 12 Aug 2021 01:28:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0C876E220;
 Thu, 12 Aug 2021 01:28:35 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4GlTbj0ShJz9t54;
 Thu, 12 Aug 2021 11:28:33 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1628731714;
 bh=6TdmRLm6DKip6vJXXjLuBmnBFxaoIwhh1f+X+BlI2EI=;
 h=Date:From:To:Cc:Subject:From;
 b=k9oUD6wxT7qZ4RruX8YAkfmGILfyo0dW9/vJd3VmvtWayGMqYyTBmX57g6gBf/SYJ
 rP09QeYsOJD2YCdx4PnzVNlq72ZOF/EbLes++uNPeW4YkJqvqKDbLujqMmP+L4+9hc
 nvKvwBMQax+9msF703vGZRYaMfty1WLquUyrhoriWuaxKfEJOtXrO7Qv4gOxraHK2F
 s0TISu8hzjVoy58uy7Ovn/eLKCbbU5sqRje0a5ir8JX9gkUbSEpfBoHDFbFmA2WkzH
 Xx8ZamLH2FairH+QBvdLjJjYi3fgWWCUMNEUs3jI17zKzi9dLz8mm4XmIED22mua8y
 kS0dsqAkCCp/Q==
Date: Thu, 12 Aug 2021 11:28:32 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>, Dave Airlie
 <airlied@linux.ie>, DRI <dri-devel@lists.freedesktop.org>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>, Paulo Zanoni
 <paulo.r.zanoni@intel.com>, Tomasz Lis <tomasz.lis@intel.com>
Subject: linux-next: manual merge of the drm-intel tree with the drm tree
Message-ID: <20210812112832.0c51632b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/0ccK2z.2lY0XR7PKc4K0bD0";
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

--Sig_/0ccK2z.2lY0XR7PKc4K0bD0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-intel tree got a conflict in:

  drivers/gpu/drm/i915/intel_device_info.h

between commit:

  3ffe82d701a4 ("drm/i915/xehp: handle new steering options")

from the drm tree and commit:

  22e26af76903 ("drm/i915: Fork DG1 interrupt handler")

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

diff --cc drivers/gpu/drm/i915/intel_device_info.h
index f88be11a3570,ef1eecd259e0..000000000000
--- a/drivers/gpu/drm/i915/intel_device_info.h
+++ b/drivers/gpu/drm/i915/intel_device_info.h
@@@ -133,8 -131,6 +131,7 @@@ enum intel_ppgtt_type=20
  	func(has_llc); \
  	func(has_logical_ring_contexts); \
  	func(has_logical_ring_elsq); \
- 	func(has_master_unit_irq); \
 +	func(has_mslices); \
  	func(has_pooled_eu); \
  	func(has_rc6); \
  	func(has_rc6p); \

--Sig_/0ccK2z.2lY0XR7PKc4K0bD0
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmEUeUAACgkQAVBC80lX
0GzycAgAoEoEXuz2v+VRpVNn0G9uqcHZ2Gii0F3udUHqILFdSV7QcV0dIxiOtcn9
G/K1fBq6YbOsFYxLep8tXQVFi83SQFQ+zfmVOcq4btaYWz7DYCyOWTk6PF869mgw
gRkHPBJ4wECsk+PETDyoFt4GhFQJQODrG7v/+oHJTtM8Nc+mIaLvqQPJrIXrnMJc
yDnJQ/vohM6yYb8FvrevxaTH/ETFO3lDEq4GNzuL1JM6nbbx8z1Xgd+TEFFyGNWA
GpA7fMHZJZr7M8JlFlWaBgFZzdGqSj2n3/ZsUyWKcmGI+glWe/n+HwqzYDsK08Qe
ImT1wZeo0Klc2v/JrrBInLY8O9VoZg==
=E6b0
-----END PGP SIGNATURE-----

--Sig_/0ccK2z.2lY0XR7PKc4K0bD0--
