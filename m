Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E2788B9AE
	for <lists+dri-devel@lfdr.de>; Tue, 26 Mar 2024 06:12:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D0F910EC8E;
	Tue, 26 Mar 2024 05:12:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="WIZW2SzY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 209D410EC8E;
 Tue, 26 Mar 2024 05:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1711429936;
 bh=lny3jrbC6XgEZG/JZJCH6Kp32eh40iJEAplAlnsOcwI=;
 h=Date:From:To:Cc:Subject:From;
 b=WIZW2SzYZqzbWZv7fEcxPH8qWJXx7mc/C8sWnGKA13Jvjl7QqoQN2Au8riyfKpDh6
 oICxoP0VJpHKPlCt2y/u7ky5i50VLsBfqpTEvIcpfMWw8NaX3ScpSqeg1++sAd+7cv
 YYKLKe0QhOIx1TNc/n+DdTOvzsFfoZ8ReLxE6IICRVVeLmzitmRxKcUUduKfVd5vjO
 SZa79K4UUFULrJpCM0UQU23+1DmL/DUpHlTjtRu8Ril76mMp8A4NUp5eJmMg+/Kb8A
 HLHiSHn5lj78YNxzr7qT6O0dehPBsKZALeaHju/kI+kz+6c2XI3nC2/kjWlwsMT9A6
 yCfnu8PrFSU2w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4V3dG828hKz4wnr;
 Tue, 26 Mar 2024 16:12:16 +1100 (AEDT)
Date: Tue, 26 Mar 2024 16:12:15 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Boris Brezillon <boris.brezillon@collabora.com>, Steven Price
 <steven.price@arm.com>, Intel Graphics <intel-gfx@lists.freedesktop.org>,
 DRI <dri-devel@lists.freedesktop.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warnings after merge of the drm-misc tree
Message-ID: <20240326161215.559b6366@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/hM/ZIU5C/yDn0fCAy.94Q2E";
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

--Sig_/hM/ZIU5C/yDn0fCAy.94Q2E
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-misc tree, today's linux-next build (htmldocs)
produced these warnings:

include/uapi/drm/panthor_drm.h:344: warning: Function parameter or struct m=
ember 'core_features' not described in 'drm_panthor_gpu_info'
include/uapi/drm/panthor_drm.h:344: warning: Function parameter or struct m=
ember 'pad' not described in 'drm_panthor_gpu_info'

Introduced by commit

  0f25e493a246 ("drm/panthor: Add uAPI")

--=20
Cheers,
Stephen Rothwell

--Sig_/hM/ZIU5C/yDn0fCAy.94Q2E
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmYCWS8ACgkQAVBC80lX
0Gx5WQf/WGVsdA3jyo4FbiK5FGKYIu7rgYqw8P3qqHNT1yxhFgFcser8YyTdhidh
8mQ3uOF/XllXbp/gWZzsbvE5wW3joR3sqAUJduI1wiAqKbO+9cSnGiRidivk9vG/
5woi791Ww+prKJAOzdubZ6lUbBlvPvHq9LC9ZgD8R9m19f6I4euqm9eeS7/Zu2KG
skDC3WWWTdIwgqioPKZsheaPPGEal+Q6jCDWKxMNvnUDns+2h9m+ufEg0GmYeOUr
ZW2fbyX8hydGF1/62taU1g+YociNyzCwfwbVJL6G0OGyhG1IxXnJlwX84Yrd8Ky2
aQNIuw52mOyEDs1f9faf4FN/HsMasg==
=6rk9
-----END PGP SIGNATURE-----

--Sig_/hM/ZIU5C/yDn0fCAy.94Q2E--
