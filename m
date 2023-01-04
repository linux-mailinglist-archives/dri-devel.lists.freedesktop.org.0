Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26DC065DF48
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jan 2023 22:48:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0244E10E613;
	Wed,  4 Jan 2023 21:48:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81E9510E60E;
 Wed,  4 Jan 2023 21:48:12 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4NnNWV2Bb7z4xMy;
 Thu,  5 Jan 2023 08:48:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1672868887;
 bh=ppDAWVHpCKhnzv5Hmoe6tCuegfSNsAHt8u9zQlXSB6M=;
 h=Date:From:To:Cc:Subject:From;
 b=F0l7sRL8VMBJpGjCxUusXqfpbygOmQAQdGGDKLwT1DuWaeFQHd05dXQ4E7Neib3YK
 W3FUYX/wNloHO1WhtMDhpJGeF7UYvHy++ZGsQqvRSQMi21st537AytHOvaQ6IL2q1W
 obxAYqZg0p/vfdKFQLa7WXznQD4Azze79LFssFzoV0aGre8MBYbcxYv8nsYxUXP/eP
 ++d8Wcq/HmQnq40tLG97PY3ajh22zghbDMYyGjTla6eQIl7WUdw+h3MxHs217jiRMA
 1CwffwJE7r3U+PPu7CRo0tmnRVnd5tgCbDOxyicyDPPiRkS74HZN+GCgcxWXF6taPF
 21MTQHLD87jnA==
Date: Thu, 5 Jan 2023 08:48:04 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI
 <dri-devel@lists.freedesktop.org>
Subject: linux-next: duplicate patches in the drm-intel tree
Message-ID: <20230105084804.5db80fe0@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ZQoynXGs4CD5.84jRf9uSoB";
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/ZQoynXGs4CD5.84jRf9uSoB
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits already exist in Linus Torvald's tree as different
commits (but the same patches):

  50490ce05b7a ("drm/i915: Remove __maybe_unused from mtl_info")
  f087cfe6fcff ("drm/i915/dsi: add support for ICL+ native MIPI GPIO sequen=
ce")
  a561933c5717 ("drm/i915/dsi: fix MIPI_BKLT_EN_1 native GPIO index")

--=20
Cheers,
Stephen Rothwell

--Sig_/ZQoynXGs4CD5.84jRf9uSoB
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmO19BUACgkQAVBC80lX
0GyONwgAh/1YLxnu8kxqaK4pN3u993umujBtH4LbBM8WQUtat3sjSMX9bs8BX6sk
/QtDlh4GOwxOGYgZhjquQQFrzuFr0n/POjTwWLbxrziIEtyqGOn6eW1ogD9p7n4s
OzdvWoibImvBhCoo022fvncnDk41VE+wFFfjXg+OcXegA5DUqGw6P+OZM2GAbwnN
u+epG2sYT8uq0VYDolSbpamY7qObZFRJ+2sQubQ0pzhIu7q4mviRLA3lBewBsg5I
MCapYoQv8irjJQBblhBWVVib1UzwPNGyGInWnu43Gny4OeRGPhlAbIrvWF7D8jIQ
UjvW3hURXxJw5It5fc6l2UAFDz1EhQ==
=TfdY
-----END PGP SIGNATURE-----

--Sig_/ZQoynXGs4CD5.84jRf9uSoB--
