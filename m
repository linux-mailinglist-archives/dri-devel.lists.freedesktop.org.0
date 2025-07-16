Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D2CB07371
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jul 2025 12:31:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0A5A10E78E;
	Wed, 16 Jul 2025 10:31:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="qt1azQGH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1905010E78E;
 Wed, 16 Jul 2025 10:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=202503; t=1752661760;
 bh=YM5CD0wi9sXVlQrwReajd16Ogn8j5KZtBYTgVnrYdMc=;
 h=Date:From:To:Cc:Subject:From;
 b=qt1azQGHh0kTgPw2jZGT9ilbFZrb3b0Te1MdqZUbcTakVor0xMw55MvAc1HdGDsFO
 TF37qoiYms7nUa6mrtz7JBJjwfz3t+UwPemwQe+defX4qTD5i/FvjVX1zXKGS9YS/m
 X5LaVf1+1Zt3nRSCTQKR4gCbdVAcfQA4dWOqXQbFuR93Q91KaxaqitAqu9t6zZiuzm
 +JqSAkv8hUn2AzOx56zdcskq63SC73NhHIqUDaB9kuz+BF/VCCenh+vyPI4BpHuvSH
 xF3wdX5Fb9TUp5QlvAzfcQhWy74y06ZGpsbINV0uCuL0WNpkOI7CgysjZ9i8o/36Y1
 NfmlYdW+XD1Yw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4bhsjq4ZQWz4x4v;
 Wed, 16 Jul 2025 20:29:19 +1000 (AEST)
Date: Wed, 16 Jul 2025 20:31:15 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Simona Vetter <simona.vetter@ffwll.ch>
Cc: Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov
 <dmitry.baryshkov@oss.qualcomm.com>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the drm-misc tree
Message-ID: <20250716203115.6e02e50c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/b9i2EU98fNzWaJSltlNFa/h";
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

--Sig_/b9i2EU98fNzWaJSltlNFa/h
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-misc tree, today's linux-next build (htmldocs)
produced this warning:

drivers/gpu/drm/drm_bridge.c:1242: warning: Function parameter or struct me=
mber 'connector' not described in 'drm_bridge_detect'

Introduced by commit

  5d156a9c3d5e ("drm/bridge: Pass down connector to drm bridge detect hook")

--=20
Cheers,
Stephen Rothwell

--Sig_/b9i2EU98fNzWaJSltlNFa/h
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmh3f3MACgkQAVBC80lX
0GzJOQgAmpCq0YSRtNRb6Khe7E2WiPGc+ZxCfaVMDF6aBuTPhb4+A+FFEGHJdJbJ
7oPeiAhjpMAtE8nr+BprQibAu0n32wWfmypP0oA1Z4fyCe1T97OgNUfFnpM2cowD
KboyF/4H8NBV1fD8RDv+ISh7D/d2szo88SmOeYQASxntWgmx1kTNIP1dKkxK1YGM
VE+FoRtz1J5sHIKnsuNznPV06I6xlY0zHZylqdI7lmkdXN/6Ha8BJ7bu7lMvn90C
LOy2SgejWdVZFxUKnScONm5ke/5ifOmxhZ1YH2D5uXb/VdlfQMOqDA/Reuff7Vdv
Hic5HWcCy0iTmyzgqjVvr5sp6OeUxg==
=hdR0
-----END PGP SIGNATURE-----

--Sig_/b9i2EU98fNzWaJSltlNFa/h--
