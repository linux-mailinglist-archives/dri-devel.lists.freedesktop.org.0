Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 22EEE7F6AA2
	for <lists+dri-devel@lfdr.de>; Fri, 24 Nov 2023 03:25:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 536B410E798;
	Fri, 24 Nov 2023 02:25:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3A8110E798
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Nov 2023 02:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1700792748;
 bh=Mo4Vg0x4Tn1NUCtfTQlN1y65FYD9yKKHBRdITJKRr8M=;
 h=Date:From:To:Cc:Subject:From;
 b=MNFwLHZ8ZPZCtEEnNcb9Bf/Db/cAB9wZWBOQ66GN5sdys9bH9nO1nKqdptpOxHLT6
 /++Nh+9YPRx+T7WUO46uSY2oP3SBQdeDwQILrx7cNsuAo8W2Nnp4koZ+eQkjFyn0Mo
 mCAW/Rm2yafb5kdmfLgSrgLEAgM1PLt0f8fMs9pSZDMQ5wmlnxHNNRCTWW6TMEO+Pj
 t0CpTf5fnByCxaz0fE/K/lGFlwKHbscLvUH15CE+slFdQWFH8QdFecN1vyCHdGEIlO
 N3azyH9IpOUI6PFgrTcoaBy64ZxR35PFd4l7HDToD/TCgbJKgD0XMqmzcpNZClChUL
 D5O9Iziw8n5lQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4SbzNq6Nmvz4wcX;
 Fri, 24 Nov 2023 13:25:47 +1100 (AEDT)
Date: Fri, 24 Nov 2023 13:25:47 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@redhat.com>, DRI <dri-devel@lists.freedesktop.org>
Subject: linux-next: build warning after merge of the drm tree
Message-ID: <20231124132547.00f7e599@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/QOy1sNj_Z7qHo9VKn37dU9+";
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
Cc: Sarah Walker <sarah.walker@imgtec.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Maxime Ripard <mripard@kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Matt Coster <matt.coster@imgtec.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Donald Robson <donald.robson@imgtec.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/QOy1sNj_Z7qHo9VKn37dU9+
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm tree, today's linux-next build (htmldocs) produced
this warning:

include/uapi/drm/pvr_drm.h:1: warning: 'Flags for DRM_PVR_DEV_QUERY_HEAP_IN=
FO_GET.' not found

Introduced by commit

  1088d89e5515 ("drm/imagination/uapi: Add PowerVR driver UAPI")

--=20
Cheers,
Stephen Rothwell

--Sig_/QOy1sNj_Z7qHo9VKn37dU9+
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmVgCasACgkQAVBC80lX
0GwdZQf+J8wlWgeQszsEbsJAC8oGRCweif258C339Hc83kwzrGcvzs0dSnQUF2PX
xJ6FC+zf6gJpexBwMHHXRYRv3KrVek56Jllo9BoHHHeXoNKowPlvfDNhga2IIxOc
aa/P+PabhE5cGBE/NqsGRBSizNMa3xLrmR55kx5LcuVlj1OKj1pM8uuJErNeLekY
Ep65b7+iXQinfj0W3G4sJCv6CLl6/QHFSUu9qxywPm+9LUFFE4KGMxa8CnDgs0AI
99Qv/oKBwN7Oo1XisHMxK7EjSYaxWLoM5Xw0q6onUupFxKuR4Ttokc0SO30h7JLA
hYrejy90N7C3hRjH+Ol8sQZ837hIBg==
=q6XM
-----END PGP SIGNATURE-----

--Sig_/QOy1sNj_Z7qHo9VKn37dU9+--
