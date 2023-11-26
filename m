Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA4C7F9582
	for <lists+dri-devel@lfdr.de>; Sun, 26 Nov 2023 22:32:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE00B10E03A;
	Sun, 26 Nov 2023 21:32:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD7B410E03A;
 Sun, 26 Nov 2023 21:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1701034344;
 bh=m4c3MMaM5Jb7y6O4jt1oh7KB9TXWPcvGPoYTaAvC0B8=;
 h=Date:From:To:Cc:Subject:From;
 b=SzyGJoTLFpWl6ZtOWy5XSVpRhF0kxQbLmQCcOwunKR4x48vZDuCHejxKAk/ihRGDb
 ieFkZTlUSEOuTIM+Z4NHeZCxMIrHXEjFXPYcAra5ltQoY15e6b70CmL4ivOHnCSkqW
 tBrVpFSmYaG21ujFXIVHNKQZrW57Ry2E8BtnZfPH29yZ+8DSUvMXjAze+TB7VvEPwb
 w0WD0meVuy3z3BiQoFPpzNkTokCwitPgWyKD5tX6Ra54EfhKRhiz7jXmyNKUOW23C3
 KOB4JZTtpsb28HIk0BUVz/Qw4uh2ssZXb6rRV27H91gELqHq2f1RfiUrNhVk6ZUS5w
 lJJVaJ8b3Gftg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Sdhkv0QBJz4wc8;
 Mon, 27 Nov 2023 08:32:22 +1100 (AEDT)
Date: Mon, 27 Nov 2023 08:32:05 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: linux-next: build failure after merge of the drm-misc-fixes tree
Message-ID: <20231127083205.44b25fa8@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/hIMrf_P/ckwsQ.=GozpjKyq";
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
Cc: Liu Ying <victor.liu@nxp.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/hIMrf_P/ckwsQ.=GozpjKyq
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-misc-fixes tree, today's linux-next build (x86_64
allmodconfig) failed like this:

ERROR: modpost: "device_is_dependent" [drivers/gpu/drm/drm_kms_helper.ko] u=
ndefined!

Caused by commit

  39d5b6a64ace ("drm/bridge: panel: Check device dependency before managing=
 device link")

I have used the drm-misc-fixes tree from next-20231124 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/hIMrf_P/ckwsQ.=GozpjKyq
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmVjuVUACgkQAVBC80lX
0GyZ8Qf/QyUqgY9MYX9H3CKy5c82Isrenp7R03/3/+WZDEg0qyGKST7nbmdXMuqo
gYIS9KqTd7NDY/S/D+cBHq/7ih8U1cwPLZwDPONhWMkGTuGAYKb2lHAORvVG34f8
v2IFY0337RvARAO+tg2sRZSCS9y0xZRAls6sx9q3zeT0MIMw3tn/z46aZrSCxta4
rIZhRvNXby0/zG2IIUt3CaD8keFjJAP7foNVyXWMpqjc9BCO5VfS8eRvgyEzARVR
6BCTWs0P7oMsBxTyGd/Q0PVZqm0lhOuVNuaW9fSAfpSI8W3cH1/2Amt+23XyXycg
4Q5kCiernY7N5w4NSh+mx+RlwJXHPg==
=y/AT
-----END PGP SIGNATURE-----

--Sig_/hIMrf_P/ckwsQ.=GozpjKyq--
