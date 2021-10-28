Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C81343DBFF
	for <lists+dri-devel@lfdr.de>; Thu, 28 Oct 2021 09:28:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 972CE6E917;
	Thu, 28 Oct 2021 07:28:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC4CD6E909;
 Thu, 28 Oct 2021 07:27:59 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Hfxwp5Hh5z4xYy;
 Thu, 28 Oct 2021 18:27:54 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1635406077;
 bh=Qcv0WIWBqgF7S3Hx8WF1gQA6e3vrfumd7O64F1UC2XU=;
 h=Date:From:To:Cc:Subject:From;
 b=dteowK2iy6rMIyEGowhklT5fLwvmRbh3E/otbGJ68i/5MHgwMXUCkwq7IDT8J6Pjj
 khzcJOW9FDVdxT9s7f0DpcZyfd267CrcAbIarL0nImIYlpTAVXXVo7k081S8d7X24w
 65bl+38Yag7DfqvLZRGZgB41tEWzU8D3+M6tGmIyddIO+GdTHpaUXLDWH2nF67YBS4
 pg/vuZAOjiZ1/yVAt7Owjh9WBcJCILnUPrUZTdVw4Tqhra2itSe2NgxcbMmD1UR0FW
 seh6DVyaCZd1z64nsI8Ta3c2BT5o9Agx80kgHgztPtfxhR79VtjK6zA0r17pvNwFqU
 EKPB9ukJwQjAg==
Date: Thu, 28 Oct 2021 18:27:53 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>, Daniel Vetter
 <daniel.vetter@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>, Joonas
 Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Intel Graphics <intel-gfx@lists.freedesktop.org>,
 DRI <dri-devel@lists.freedesktop.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linux Kernel Mailing
 List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Matthew Auld <matthew.auld@intel.com>
Subject: linux-next: manual merge of the char-misc tree with the drm-intel tree
Message-ID: <20211028182753.56b6a174@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ZxH8PJt7z=AaYJvoJhDlVz7";
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

--Sig_/ZxH8PJt7z=AaYJvoJhDlVz7
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the char-misc tree got a conflict in:

  drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c

between commit:

  5740211ea442 ("drm/i915/dmabuf: fix broken build")

from the drm-intel tree and commit:

  16b0314aa746 ("dma-buf: move dma-buf symbols into the DMA_BUF module name=
space")

from the char-misc tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
index a45d0ec2c5b6,abb854281347..000000000000
--- a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
@@@ -12,13 -13,8 +13,15 @@@
  #include "i915_gem_object.h"
  #include "i915_scatterlist.h"
 =20
 +#if defined(CONFIG_X86)
 +#include <asm/smp.h>
 +#else
 +#define wbinvd_on_all_cpus() \
 +	pr_warn(DRIVER_NAME ": Missing cache flush in %s\n", __func__)
 +#endif
 +
+ MODULE_IMPORT_NS(DMA_BUF);
+=20
  I915_SELFTEST_DECLARE(static bool force_different_devices;)
 =20
  static struct drm_i915_gem_object *dma_buf_to_obj(struct dma_buf *buf)

--Sig_/ZxH8PJt7z=AaYJvoJhDlVz7
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmF6UPkACgkQAVBC80lX
0GzRngf/eUNxuO7M1M1QXanRfCOH/GCb3ybr/TsDwmInoK3A3IJQe3/Btjt5lbUE
uh+KLTNNclL/Wk+batwFzkuNjjswFkkEGNVUjK4DEJkOKzKmPgl8LQ/BjpbGF+fv
OnHbqb6Zj3DYyP0aWxkicTas83i2gK2DEbMfvTTRWI5S5pExoXc60Mhc3MsgGcPE
xekDfHCTWEjzU4XzRLQeTgTCOj9n8s5b242gjc0wZizoP2L1y3lUab+2QauYxroL
IVVegaFuTTZEuriepSs1jtFnYlyzFD57jS1AKi+hi/QU0EBJU4DhezFxw7p+AMil
EIiCJ8jZZsCSPk59brKDGG46KQ7EIw==
=as+o
-----END PGP SIGNATURE-----

--Sig_/ZxH8PJt7z=AaYJvoJhDlVz7--
