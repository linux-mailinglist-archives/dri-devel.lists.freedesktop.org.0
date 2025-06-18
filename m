Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2987FADE2EB
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 07:13:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E96F10E1E1;
	Wed, 18 Jun 2025 05:13:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="TpCiFQh9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B29410E1E1;
 Wed, 18 Jun 2025 05:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=202503; t=1750223588;
 bh=yIHVCIPxF7xdB0tqcZOY3hEED87RnCBwqBxtmKp7hmo=;
 h=Date:From:To:Cc:Subject:From;
 b=TpCiFQh9kvhJWgj9JxwNb2Nfc55tOzD01dd05A4Xqz6XN7IK7bO3SUjD08ea4uQFu
 I1rwvOpBBnR+5huRJgsB4plZrVp9Ht9pi0eo3cZTg9BM7lHBgLEGRkC0QMZQbVP0u9
 gAGHcaHr6Io4ru4cWvifYCDo2ruz++JUrqEa5Y7a2B/mBcy5KgGM2NKoODni8YGH47
 46dQYQziBn5G0EFd92FqivcbV00Ar40yuXniEWrzdyztvcHexvO7CCSodjRU5rRnJa
 5dtnVpKuhkM/QYvjNCwNKPNJgbKmj6OB4TZpkVqW4J9fA6Kzk2ttALg/74ygRzjVw4
 CtZiq38hoEGjg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4bMX1v41RXz4wb0;
 Wed, 18 Jun 2025 15:13:07 +1000 (AEST)
Date: Wed, 18 Jun 2025 15:13:06 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Simona Vetter <simona.vetter@ffwll.ch>
Cc: =?UTF-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>, Krzysztof Karas
 <krzysztof.karas@intel.com>, Raag Jadav <raag.jadav@intel.com>, Intel
 Graphics <intel-gfx@lists.freedesktop.org>, DRI
 <dri-devel@lists.freedesktop.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warnings after merge of the drm-misc tree
Message-ID: <20250618151307.4a1a5e17@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/iD+KY8PERACOXW4l=/R4X9O";
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

--Sig_/iD+KY8PERACOXW4l=/R4X9O
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-misc tree, today's linux-next build (htmldocs)
produced these warnings:

include/drm/drm_device.h:40: warning: Function parameter or struct member '=
pid' not described in 'drm_wedge_task_info'
include/drm/drm_device.h:40: warning: Function parameter or struct member '=
comm' not described in 'drm_wedge_task_info'

Introduced by commit

  183bccafa176 ("drm: Create a task info option for wedge events")

--=20
Cheers,
Stephen Rothwell

--Sig_/iD+KY8PERACOXW4l=/R4X9O
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhSSuMACgkQAVBC80lX
0Gyqygf+OaQ5moAPkZ0CrA2HsLYfWC+3PSQzbVJK61WL5jsOOCtl73OWV62/u7wt
iHfwz1WjzQsR5zcNebpOj9D8cvSBQl98iBdPEASFgrFHTS16JHdOgv+QL/p5ckq/
AHztYucQAD63GZ3alDPJtdCXAiXCbeQgi7COOo0sM4Wt9hBbNvuhHXQsAtBFBCLy
XFrthPeB4kvxlzY/73gEL6OyE1eLTxaSDzouKyerECIooEOcdkVjoTCNIeyCB999
j9wy6b1/3kxs9ts9B2hqViQaVQzopOj9RQrIDi2ny4zpE/ISa7EGFmxcw3sOUH3p
/I7BMoZADm/aWcRrotCKScGWsmgcOQ==
=5AOb
-----END PGP SIGNATURE-----

--Sig_/iD+KY8PERACOXW4l=/R4X9O--
