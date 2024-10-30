Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E1F59B5A7F
	for <lists+dri-devel@lfdr.de>; Wed, 30 Oct 2024 04:51:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 206A810E047;
	Wed, 30 Oct 2024 03:51:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="aDn53dxU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1298910E047
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Oct 2024 03:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1730260296;
 bh=6wsNVS3QJIKHN/XDPgf/6Kmvha5nzhZNmINi0ham8RE=;
 h=Date:From:To:Cc:Subject:From;
 b=aDn53dxUOv4Ma6kz8AO3RM/wItWj2ZXeVfM0dTOyi/VivoO2tKDYRjRSsOo37lmjz
 kS6yQkuVzP2mZ1IXgKpFCbZ6w2hSpDPRSCcdfOigyW2f54DLM5/i0LqolDnNUaikEG
 v54HWoI76v6pvEoQ2jqNCD/na1VBto/bRBFnL4UKucHH/fi9MevQCMdiR18MJmNpo2
 VLDasRyUrkHygC0a/WSz21obL9Yquma9vfFDLLs7Ioucdpy8sVZF1L2v4bEaGyjiVU
 RoSH0Em4FQDMvr3TY+Kkp3T8UOLB6OXTEXaIRDPMbtI2FBBMURP+Fk0DmTu0UeEG7+
 zFtmwAVuTarEQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4XdY8R6FlKz4wb7;
 Wed, 30 Oct 2024 14:51:35 +1100 (AEDT)
Date: Wed, 30 Oct 2024 14:51:35 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Joerg Roedel <joro@8bytes.org>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Dave Airlie <airlied@redhat.com>
Cc: DRI <dri-devel@lists.freedesktop.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the iommu tree
Message-ID: <20241030145135.7851a2ae@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/fw2GqG3kOCLjZTUbllDNwjT";
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

--Sig_/fw2GqG3kOCLjZTUbllDNwjT
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in other trees as a different commits
(but the same patches):

  0c069019f33d ("media: nvidia: tegra: Use iommu_paging_domain_alloc()")
  ba1057ab5d01 ("drm/nouveau/tegra: Use iommu_paging_domain_alloc()")

These are commits

  bf7835facc09 ("drm/nouveau/tegra: Use iommu_paging_domain_alloc()")

in the drm tree and

  93ee2d7ce266 ("media: nvidia: tegra: Use iommu_paging_domain_alloc()")

in the v4l-dvb tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/fw2GqG3kOCLjZTUbllDNwjT
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmchrUcACgkQAVBC80lX
0GxEGAf+MvQGB9j2ChxjLi3itY0LABtv+Cd3eQu5CQ0Xa3s3dXnHSsRCxizH83it
KAuZcG3NDSkHsNV1o78cgRLsKOfXR95lR7xuLlcVMaPEZtMYfJJUOpkHukIeXQAt
WxKyGdYk09ZOnyrDUyuJxY9mJxk7Kycx/ah1CXGSV4vV4QzfRbMsNse6YKGdTMHU
C73jOlfokuBtVF4DelUnipg1Kwg0FNNEih9ljDCfoJHGOMsNQEec3sBQQDAWiYm9
Dfbcur8kPJuAaTDtWaqMBPrPpIDgDSr6TFPswK0dU4SYSJ9AgWWysYn0hVrrVo9D
wjsmDEZBoq8njw+vDjDshA9e/daWKw==
=q/IT
-----END PGP SIGNATURE-----

--Sig_/fw2GqG3kOCLjZTUbllDNwjT--
