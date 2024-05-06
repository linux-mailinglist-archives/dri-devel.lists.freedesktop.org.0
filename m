Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16E578BC5B5
	for <lists+dri-devel@lfdr.de>; Mon,  6 May 2024 04:18:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C44210E615;
	Mon,  6 May 2024 02:18:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="kywDGneH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE99410E615;
 Mon,  6 May 2024 02:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1714961881;
 bh=soFSD916NRLT6/m2clSFEXil9meuREHqNYpgRHAYDh4=;
 h=Date:From:To:Cc:Subject:From;
 b=kywDGneH6DxElX/YlYI2lslELIDY3H1jOiGgsRvvLkFfKNGGgy6fVDZA7paVXffDQ
 68pSP7Onlq64BJ57ZjgKKWbIjeC+xvFjsJBFYHf6g7USYssLvMBtDpDDKbplkoJ7Bv
 hHwwpEqE8Sux3K3PGelvJjrIs0K5+BH7nBzUu4SgDinGEgqFNP4kCjorFiThqs9Nrd
 E+MIXDnMiGnnnhBAkyLIMfynX/kDW6+xnhhgpsGnLf4FiRxMMlCPc0+n0Uufg1QRJh
 DnFy1yaH7x2/Htg1847HpB5kU/dlQCFF+Bak7toYjAqpPrQpYlsY2F5hM6SKaKKniH
 s9VZ3LRYmtxzg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4VXlS77221z4x0x;
 Mon,  6 May 2024 12:17:59 +1000 (AEST)
Date: Mon, 6 May 2024 12:17:59 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Lucas De Marchi <lucas.demarchi@intel.com>, Oded Gabbay
 <ogabbay@kernel.org>, Thomas =?UTF-8?B?SGVsbHN0csO2bQ==?=
 <thomas.hellstrom@linux.intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI
 <dri-devel@lists.freedesktop.org>, DRM XE List
 <intel-xe@lists.freedesktop.org>, Balasubramani Vivekanandan
 <balasubramani.vivekanandan@intel.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Matthew Auld <matthew.auld@intel.com>, Nirmoy
 Das <nirmoy.das@intel.com>, Radhakrishna Sripada
 <radhakrishna.sripada@intel.com>
Subject: linux-next: manual merge of the drm-xe tree with the drm-intel tree
Message-ID: <20240506121759.5b6c6a7c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/7Wi8_X7WNQwmePZdKHLY9jd";
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

--Sig_/7Wi8_X7WNQwmePZdKHLY9jd
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-xe tree got a conflict in:

  drivers/gpu/drm/xe/xe_device.h

between commit:

  c01c6066e6fa ("drm/xe/device: implement transient flush")

from the drm-intel tree and commits:

  fb74b205cdd2 ("drm/xe: Introduce a simple wedged state")
  8ed9aaae39f3 ("drm/xe: Force wedged state and block GT reset upon any GPU=
 hang")
  6b8ef44cc0a9 ("drm/xe: Introduce the wedged_mode debugfs")

from the drm-xe tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/xe/xe_device.h
index 7524a71c0d84,82317580f4bf..000000000000
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@@ -167,6 -167,11 +167,13 @@@ void xe_device_snapshot_print(struct xe
  u64 xe_device_canonicalize_addr(struct xe_device *xe, u64 address);
  u64 xe_device_uncanonicalize_addr(struct xe_device *xe, u64 address);
 =20
 +void xe_device_td_flush(struct xe_device *xe);
 +
+ static inline bool xe_device_wedged(struct xe_device *xe)
+ {
+ 	return atomic_read(&xe->wedged.flag);
+ }
+=20
+ void xe_device_declare_wedged(struct xe_device *xe);
+=20
  #endif

--Sig_/7Wi8_X7WNQwmePZdKHLY9jd
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmY4PdcACgkQAVBC80lX
0Gw7Gwf+MQ1FKfb1l4Fje3jDfpRrK+62r1mwZXibfC3BqZQ6M4oFZ+ME7KEeKcn8
bh4F87u44sK00j/pdLqHB8V4JnZlIfEBRVGSCd9cMLLfjXLi/fd1Yu9RlL5izbWf
d2U9Is+FKq5AoZwAMatw2LTdb0EgH6xQ01nNJnMvDCu9g8BztuAcuuZimEbNRzgt
5DX1LkSQdbgfylYR1TWr3o3kD76jsmyOa/Znctsty2ejdNzQLFAxO/+YZp6ZP6xC
1qIQft83W3bq+SzZJ5UT9ckohvBxvr8cvpCs/PiqZOlnHzq61c7KcphP5l1OCOID
78urM3wwUWGJI/gVfNpXlw1lc2zbkA==
=rp0r
-----END PGP SIGNATURE-----

--Sig_/7Wi8_X7WNQwmePZdKHLY9jd--
