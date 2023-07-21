Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A020F75BC22
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jul 2023 04:11:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67ABD10E165;
	Fri, 21 Jul 2023 02:11:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E9F210E165
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jul 2023 02:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1689905468;
 bh=+F9Do2iPt8eaNfQKYFsnAMNyDwy1yHR6Xpybwtn95uI=;
 h=Date:From:To:Cc:Subject:From;
 b=e+KEDlEBUOjoXbz3y46/lQGEc8g3q3c9Z7yg2vKWxWmzXc0qimJT5g73yhm1o/ZPr
 85KZ+/b9JmHrBPJj/VCji8iWkboBGS7KNHSNoUqwPDpzvBIw7gWHAY2jb0ZK5yH3Sj
 xO6iasddA3kQ29qG8RMkmbG6Fa8q673NPizT5f/VQnc121cf/YjFAtxnhKUKIzv+N9
 O/Uu1S331lSNmOKTgrAGAnkvWkHDBvi0ZIJY8la+M+M6SgVMc5uoVtWKTFO9rLnKnl
 mzb2PZl949batyA4fSHY67RczhccCj14NYXOAvAyUNLPiAN9t0ob7FP1dpzQQ11Su3
 0FWQ/yeNm2uYA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4R6Y20612Mz4wxn;
 Fri, 21 Jul 2023 12:11:04 +1000 (AEST)
Date: Fri, 21 Jul 2023 11:51:50 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Oded Gabbay <ogabbay@kernel.org>, Dave Airlie <airlied@redhat.com>
Subject: linux-next: manual merge of the accel tree with the drm-fixes tree
Message-ID: <20230721115150.39142d89@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/b0oUpqwa9ypfXxxU53K.z=.";
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
Cc: Arnd Bergmann <arnd@arndb.de>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Tomer Tayar <ttayar@habana.ai>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/b0oUpqwa9ypfXxxU53K.z=.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the accel tree got a conflict in:

  drivers/accel/habanalabs/common/habanalabs.h

between commit:

  78e9b217d78e ("accel/habanalabs: add more debugfs stub helpers")

from the drm-fixes tree and commit:

  32055d39a2bb ("accel/habanalabs: register compute device as an accel devi=
ce")

from the accel tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/accel/habanalabs/common/habanalabs.h
index 2f027d5a8206,834f8cbf080a..000000000000
--- a/drivers/accel/habanalabs/common/habanalabs.h
+++ b/drivers/accel/habanalabs/common/habanalabs.h
@@@ -3972,23 -4002,6 +4002,15 @@@ void hl_debugfs_set_state_dump(struct h
 =20
  #else
 =20
- static inline void __init hl_debugfs_init(void)
- {
- }
-=20
- static inline void hl_debugfs_fini(void)
- {
- }
-=20
 +static inline int hl_debugfs_device_init(struct hl_device *hdev)
 +{
 +	return 0;
 +}
 +
 +static inline void hl_debugfs_device_fini(struct hl_device *hdev)
 +{
 +}
 +
  static inline void hl_debugfs_add_device(struct hl_device *hdev)
  {
  }

--Sig_/b0oUpqwa9ypfXxxU53K.z=.
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmS55LYACgkQAVBC80lX
0Gzt8Qf9HjJt7tjvEztvAjv+OX1LSGlmesquKwuFDX+VuXNWIVnuma/tJdxBwVCz
P9ghW6JYvrQpjFQdnUT3JSE9dlVvqx19t/zD9L4yqJv5TAHBW3mbgr6rbEAxQMQP
HKriXAfbs/8ASRMY0YQPnNS3ie4es87LDjVUfu6r1RWugsExOGOp9i9/0e6QDgE3
ffeWUrZbLYFAZTWSry2nvEhZVdTZRzrJy79A7DPpnGQW+ox3vRXSlJbhEYEjc25R
OWuMr4S4lk7MSzInX5vGR5vuLzlDtjkjLRBLRpuL92bZkvqfHSjc6zcRJRjRhvjI
1xfC8VqSRZDxtM7aP2epL5IkzaiRZg==
=sO4I
-----END PGP SIGNATURE-----

--Sig_/b0oUpqwa9ypfXxxU53K.z=.--
