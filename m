Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 748D5A0AE96
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2025 06:03:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 627A910E400;
	Mon, 13 Jan 2025 05:03:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="V2gBNrQn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53B8A10E400
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 05:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1736744608;
 bh=yMYUVdKiQc1gQZ7Tf3KQn3ZaPzIwNokYINqh23B5kCg=;
 h=Date:From:To:Cc:Subject:From;
 b=V2gBNrQnkTyapQtehlXahvjneOO0x1vHRuyHa/qFN2eFtz9en5UWWMT0Kz+KXSHNe
 yl6W1eZUfRXiGlZwKienJ1tXqzHT0rLeKEj4OFPO3RhVfR1rBl2BO5AJTh+RA2fuhO
 dzOGgF3ArBW2d3W029iowAyYBRMQF4P9vNQ2tNvrjD2E1+3PDuFO1s7fFIyj4CSpJA
 KQh/woAIY+V7yE0oRzx9CFCa725XEFsP0XAEOF/qS1whaIycMqxtDvY/1B37S0kZW6
 SzeqQWkDXcIdDwNZBZ+oaHg0x5CQRypRwNL9Wea8+LpFOQ3KT4LdgxsmPre25rqnuR
 /TIx4IV4uBGaw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4YWgBm0dgbz4wvb;
 Mon, 13 Jan 2025 16:03:28 +1100 (AEDT)
Date: Mon, 13 Jan 2025 16:03:34 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@redhat.com>, DRI <dri-devel@lists.freedesktop.org>
Cc: Friedrich Vock <friedrich.vock@gmx.de>, Maarten Lankhorst
 <dev@lankhorst.se>, Maxime Ripard <mripard@kernel.org>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warnings after merge of the drm tree
Message-ID: <20250113160334.1f09f881@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Hutv5y9_DgXrsftH63naBGD";
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

--Sig_/Hutv5y9_DgXrsftH63naBGD
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm tree, today's linux-next build (htmldocs) produced
this warning:

kernel/cgroup/dmem.c:300: warning: Excess function parameter 'dev' descript=
ion in 'dmem_cgroup_state_evict_valuable'
kernel/cgroup/dmem.c:300: warning: Excess function parameter 'index' descri=
ption in 'dmem_cgroup_state_evict_valuable'
kernel/cgroup/dmem.c:635: warning: Function parameter or struct member 'reg=
ion' not described in 'dmem_cgroup_try_charge'
kernel/cgroup/dmem.c:635: warning: Excess function parameter 'dev' descript=
ion in 'dmem_cgroup_try_charge'

Introduced by commit

  b168ed458dde ("kernel/cgroup: Add "dmem" memory accounting cgroup")

--=20
Cheers,
Stephen Rothwell

--Sig_/Hutv5y9_DgXrsftH63naBGD
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmeEnqYACgkQAVBC80lX
0Gz3dQf+J8bDaYxs9MuSCBgwHQoq74a5xncmyg24Py7N5srX+HbQ8Uxd5aaCTEO2
IOr8r8sCPdumLKNe4wV+W7yVrwukV8xpC2+j7lCzjB1axTXezbSU72XmAGavUKhy
8YZNIMlPIgSH6sc1O3+v6Fdmk4ytrxpoW3CIaJfNTsR3PA7QT0g41Mz1jIwlwjCu
Ou227nF2CmLJ8UfpZzcs6Mbf7t69rENsxHBScp5WAkxvIW3BrIPS4ATu8n3PAR/z
JxH47ejDzn4KQjNKO540D9Vy3NIL6UauK83vJ+Wm+FD+hHRrMxKEdlJzLMh6vk1f
Lo9z47Uq7DQMQP6TXKfuHc2Gm0Iu/w==
=oIX1
-----END PGP SIGNATURE-----

--Sig_/Hutv5y9_DgXrsftH63naBGD--
