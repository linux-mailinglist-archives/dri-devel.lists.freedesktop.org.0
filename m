Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 359CF995FBF
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2024 08:27:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F234110E652;
	Wed,  9 Oct 2024 06:26:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="PD/e9pS6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6366410E650;
 Wed,  9 Oct 2024 06:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1728455211;
 bh=7P9XX0NI6swUo/7q0hxI88EQjQYARABt9gplTZyTjmc=;
 h=Date:From:To:Cc:Subject:From;
 b=PD/e9pS6Pwz5IPZL6WQCETZMsidRPgUOXguQZrhBGJI32d0IHwyNS5S6yN11bfRn8
 Kuh3o+QvcNaLmXIVLUagolffKp1RJ8AcYd5uYZqcmL19lFMKZ34246eXWfwghub6Yc
 YeDk/bC2dI2aWAIkjT3NSo0QShM0u4/szEYsYsuYE0NXtzYlA3tXOzKgLb5K4s8ZSn
 Fo7U/WHssFXu6uRK04QzRyDIAObgRHSRpcFCfPGKpv0gZlPJuA5dhjYrucQq2UPRh2
 tb2rlkJ1fYVDtRaSVg4/fbyaRpqXT6lkU6t/VoqrfWGFL6J+Rvr9upLNJX3sbtiPcN
 CORNtQI/gxefA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4XNjbH0bjwz4wc3;
 Wed,  9 Oct 2024 17:26:50 +1100 (AEDT)
Date: Wed, 9 Oct 2024 17:26:50 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Simona Vetter <simona.vetter@ffwll.ch>
Cc: Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>, Pierre-Eric
 Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the drm-misc tree
Message-ID: <20241009172650.29169e6f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/3.yCEScp.iBobUH9X0xGTCu";
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

--Sig_/3.yCEScp.iBobUH9X0xGTCu
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-misc tree, today's linux-next build (htmldocs)
produced this warning:

include/drm/drm_file.h:400: warning: Function parameter or struct member 'c=
lient_name_lock' not described in 'drm_file'
include/drm/drm_file.h:400: warning: Excess struct member 'name_lock' descr=
iption in 'drm_file'

Introduced by commit

  56c594d8df64 ("drm: add DRM_SET_CLIENT_NAME ioctl")

--=20
Cheers,
Stephen Rothwell

--Sig_/3.yCEScp.iBobUH9X0xGTCu
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcGIioACgkQAVBC80lX
0GxqAAf/WTCPEBONare0NFaBPSwyE3+rbXD3ZBePxOBMbAkhk8vlf7cS48XGu2QY
pqvfVu+Y5AxpXO+uWI5E6PhCEdb8IhP9mJLNIW9R08ALMhiFGrZMJ//5GAKMMEoI
45NuSl1QPvCO7yC2VORc91d8e6tMNcv+G3rOT3CW+Ifx8TljHyBjY4q7hSwNMrAp
BU1mHbBh+FqegE7PuR0Kxi/iISu0nldN5W+sU4/S/JUmt4tLw4SbCitzoPz9BIaf
lHluzPYQBMX4+Vv+gGXHXDWeezVBEmzmzCbSHgEwWFLlplBpEEILLyKkCSRib/Vx
6CgT+Z2+EA16Rk96BaWlrHU51P8P0w==
=lH2n
-----END PGP SIGNATURE-----

--Sig_/3.yCEScp.iBobUH9X0xGTCu--
