Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2372AAD49F4
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jun 2025 06:09:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E724A10E39F;
	Wed, 11 Jun 2025 04:09:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="OrHStRM2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D688510E13D;
 Wed, 11 Jun 2025 04:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=202503; t=1749614975;
 bh=l6N6qBxGbKoR75gXRlJQAPx2Ke8Xm4jzW89L0JDBexM=;
 h=Date:From:To:Cc:Subject:From;
 b=OrHStRM2JMPQSfIiZhj3+tLjTPTvbat46PPxLn8Y3/CU9sosKWyrLlx8Cj+EZvnAB
 TSX0ui/NW7mPaD2omCsDPj03kXTFNAc5/3WKcuuNM6L0XiqiAGHR6Ubxt9cNbC+glO
 HKY/c8ABVdjI9J4W6X9AjyrlbIUdWefSQx26tq6+FXrZ4FtUm43cH8UbWrELukc67h
 7UEm0sgX6jMl3u8zDiUeb3zWy34mK1BwNmB5KLTeBHYRHP/LnQQ7LlCME+lOKre0lt
 csPX4+qSO46ZhBHU6KEo2pe959ipTCEOPf8rMdjDH346CycuQ5KwEnE0gMd5nlaEvu
 Fo7wVXhAIR8oA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4bHBxp5x1rz4wbR;
 Wed, 11 Jun 2025 14:09:34 +1000 (AEST)
Date: Wed, 11 Jun 2025 14:09:33 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Simona Vetter <simona.vetter@ffwll.ch>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Dmitry Baryshkov
 <dmitry.baryshkov@oss.qualcomm.com>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warnings after merge of the drm-misc tree
Message-ID: <20250611140933.1429a1b8@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/=ysdFscAmXuLr1BblmDBjb6";
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

--Sig_/=ysdFscAmXuLr1BblmDBjb6
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-misc tree, today's linux-next build (htmldocs)
produced these warnings:

include/drm/drm_bridge.h:943: warning: Function parameter or struct member =
'hdmi_cec_init' not described in 'drm_bridge_funcs'
include/drm/drm_bridge.h:943: warning: Function parameter or struct member =
'hdmi_cec_enable' not described in 'drm_bridge_funcs'
include/drm/drm_bridge.h:943: warning: Function parameter or struct member =
'hdmi_cec_log_addr' not described in 'drm_bridge_funcs'
include/drm/drm_bridge.h:943: warning: Function parameter or struct member =
'hdmi_cec_transmit' not described in 'drm_bridge_funcs'

Introduced by commit

  a74288c8ded7 ("drm/display: bridge-connector: handle CEC adapters")

--=20
Cheers,
Stephen Rothwell

--Sig_/=ysdFscAmXuLr1BblmDBjb6
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhJAX0ACgkQAVBC80lX
0GwMYwf9F6YQKrArb2QjOVGfFE6WQ2RdhLqrv3HI89g0k/5fpINHl922ZxuaKyYm
ScJ868bjjA6oFTENiuxtoZdx/xwO4y3aHRkuc+QND0o4QHr4Qhg6aw6QtTfMm4Pm
GeDO2wU8bYeQbYSe0VStLSonRAX5+tzHYoiBrIMiOg/kj2JoE3lFiM3y2j3qNPbU
/Gxc++SVzKVbmn/T8JcBjdxes3yvome+W6TgF05Yc1s/A7L50YUpkng/Erh8nSF2
yHwTtYY14wvdSAqr0d8KEP9RM8BXBe5Xk7mCRzz8PYnXDs0/rpeUwppm/cDCjc/6
kp4LRB7TscM60mQddnYa1Yr/G9boFw==
=8xyK
-----END PGP SIGNATURE-----

--Sig_/=ysdFscAmXuLr1BblmDBjb6--
