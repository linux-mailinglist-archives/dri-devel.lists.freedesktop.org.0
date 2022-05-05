Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC82E51B4F4
	for <lists+dri-devel@lfdr.de>; Thu,  5 May 2022 03:01:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1520D10F9B3;
	Thu,  5 May 2022 01:01:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A28D710F9B3
 for <dri-devel@lists.freedesktop.org>; Thu,  5 May 2022 01:01:42 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4KtwPr07YBz4xR1;
 Thu,  5 May 2022 11:01:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1651712497;
 bh=O28Fz7CzvoTnkVVnMBqZtMC7csy8lC3fCl7PzbR9WiA=;
 h=Date:From:To:Cc:Subject:From;
 b=cBi4I9HcmQDMj8QReRCBCp/GPiHAorpSaeNiugQPggK2XbDMO3OYef89INv9pjE3d
 l7bGcKwm4zT+KnFCmdhFw+JenbQf5xByIZT2gxi+OtH+FNQdtOueO2jO/20l3T9dua
 OBaqrMGpu12obgdwXWkAa8pbzpJkmmkbTfdHn5iAAdaLsXl1o2E0ddABMLLFb4iFK+
 fQ15I0liLzRaMvdPA9hSIkw4aPOL/9zkwjYkJ16/YdpDvwzgJaJoa3w2BMKwz8VTTl
 JwOY38F3AKEZVfbbqysuC2a+Gr3drhJmcGqmNvT+jb+BJBE1IVZClgD1CoVCAhXoi7
 KObhTpAHn/VYA==
Date: Thu, 5 May 2022 11:01:34 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <seanpaul@chromium.org>, Dave
 Airlie <airlied@linux.ie>
Subject: linux-next: manual merge of the drm-msm tree with the drm tree
Message-ID: <20220505110134.583417b5@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/p6pn4M.mqrHXcKuX5ZM2SLb";
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
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/p6pn4M.mqrHXcKuX5ZM2SLb
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-msm tree got a conflict in:

  drivers/gpu/drm/msm/Kconfig

between commit:

  1e0f66420b13 ("drm/display: Introduce a DRM display-helper module")

from the drm tree and commit:

  f5d01644921b ("drm/msm: select DRM_DP_AUX_BUS for the AUX bus support")

from the drm-msm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/msm/Kconfig
index 864fdc20afef,a6110fc67ac4..000000000000
--- a/drivers/gpu/drm/msm/Kconfig
+++ b/drivers/gpu/drm/msm/Kconfig
@@@ -12,8 -12,8 +12,9 @@@ config DRM_MS
  	select IOMMU_IO_PGTABLE
  	select QCOM_MDT_LOADER if ARCH_QCOM
  	select REGULATOR
+ 	select DRM_DP_AUX_BUS
 -	select DRM_DP_HELPER
 +	select DRM_DISPLAY_DP_HELPER
 +	select DRM_DISPLAY_HELPER
  	select DRM_KMS_HELPER
  	select DRM_PANEL
  	select DRM_BRIDGE

--Sig_/p6pn4M.mqrHXcKuX5ZM2SLb
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmJzIe4ACgkQAVBC80lX
0GzzDggAgSZws/i/jFHBCSWfn/YAZYkglT/enoDLpdwpBCkILZB9zse94cdeCSGz
P00mBrENxEVy2MFyx/Q9xbzqwpKzFAKTQ4Mvu+OndxiVL92hSjagBniR2IqGAFD1
21CAiNWZdRtGwRfRrO01Z65EAKA6VLE9xmg+S7M9VqcY9AFeOum3ReZFgr1l+8fp
SDnFoN1hp26HuNrwUVCaeAwFEGgQ7CYLFHEr0htko3VCnQ7fiA5q9I1nvLrN6hgr
Flo0E1tkysgmYFaB+c/fma0HMT2rBBSTzl184Y6Kd8kKLiyhapAoSQ3M+cp0dIev
n64Bv2btx3aFaB1TQo6Uwctg9sAAGQ==
=clpE
-----END PGP SIGNATURE-----

--Sig_/p6pn4M.mqrHXcKuX5ZM2SLb--
