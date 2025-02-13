Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E475A33418
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 01:38:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A523610E9B4;
	Thu, 13 Feb 2025 00:38:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="dgVq7TJx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9832210E9B4;
 Thu, 13 Feb 2025 00:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1739407123;
 bh=IPzcCW/wkX/SsTcdmBGtL1c+s6DP4mP3oycSgC4PCRU=;
 h=Date:From:To:Cc:Subject:From;
 b=dgVq7TJx23Kr2OSBLtVq3jmgNEpfvmzrfZ2ck7wa31q/FTARq9VU+knQlMDesFoIZ
 TFug3+le9aPwgqmbyt/ewH1y/m2GaZ37VrNR65DlFim/RumChKd0xuD7svzPU7mV7e
 qd2/MywWPQjrLLLy9jhPehY/4KH6UhxGJkETuY0rUGntAAdnv1qTWbjrCb+J8Luj2B
 mUlrQdx8I1YujYwH40yjaFLpDh0vTlj7Z9QhkzgASbe/u8b5KdbdOwLa4HXr2MpwHG
 oKUry1eTmM4dNyNuECohfjkAYDDUdoLOEf/lvCU03uKmcaIXC0R51uX4qOLO0vlwFe
 ZvHCT+MIt0BHA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Ytbry3nZWz4wgp;
 Thu, 13 Feb 2025 11:38:42 +1100 (AEDT)
Date: Thu, 13 Feb 2025 11:38:41 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Simona Vetter <simona.vetter@ffwll.ch>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, DRI
 <dri-devel@lists.freedesktop.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the drm-misc tree
Message-ID: <20250213113841.7645b74c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/nu0_pdHUy5xh14kssKSMdWk";
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

--Sig_/nu0_pdHUy5xh14kssKSMdWk
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-misc tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

scripts/Makefile.build:41: drivers/gpu/drm/i2c/Makefile: No such file or di=
rectory
make[7]: *** No rule to make target 'drivers/gpu/drm/i2c/Makefile'.  Stop.

Presuably caused by commit

  325ba852d148 ("drm/i2c: move TDA998x driver under drivers/gpu/drm/bridge")

I have used the drm-misc tree from next-20250212 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/nu0_pdHUy5xh14kssKSMdWk
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmetPxEACgkQAVBC80lX
0GybTwf/fZgvgmlIcAQoYIEcQr55HAwS5Q9gZHTxh/Hu6nQSfTROQVeGMD6eqPfU
XYzSwuJZ2RUSVQUVlqWw6760iwne6oZeE6W+WIV/4rdqS1x7v0ieTRjEMJeNve5c
QK2EdHjN71kostGOC628P2X8Xcr/zeQ8YxWT53CSXbNcUm7Ijo1jDa8Ta2E5X+Jk
nFzatQdslal3Nx7Uz9C7BTXdm8HWCBAB4yrvANqd8EBLXdsJ6Dp2PQg4Eaw/WcXJ
SieDLmi+BZhA9vvXBdyq9pxIkTMCOmKgCvn/19jXxwOGzgoRvlWCJgts7XIwy1o4
0i1JOR/BCbRyTxlhI71tBTSDVEh1Og==
=3Iek
-----END PGP SIGNATURE-----

--Sig_/nu0_pdHUy5xh14kssKSMdWk--
