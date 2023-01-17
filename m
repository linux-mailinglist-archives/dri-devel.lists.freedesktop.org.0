Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE23866D53C
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jan 2023 05:02:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E4E210E2C4;
	Tue, 17 Jan 2023 04:02:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B18BC10E17B;
 Tue, 17 Jan 2023 04:02:23 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4NwwFd1wkYz4xG5;
 Tue, 17 Jan 2023 15:02:13 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1673928138;
 bh=2qpPai3BgTFTEZX1KZ0Zi6XZsGeUp/ttq0RbwfUGf3M=;
 h=Date:From:To:Cc:Subject:From;
 b=kYjpzomioue+iEV3NtalCMmH/3FnOSdNAsrVYrYwHuMC0jnk7bwQhlswVInyEx+mm
 YIcJ/TJ84C6EPtvSnUNVQl4izfXSZsPHpktVxisi31TA8nJamWK1BXAUref1g12lDo
 62J5bXijW2X3pr33PSE5WxZbJtPpQvuW07nDlKS5Z/hE/XoBSmlDC/2K+Znes23d0K
 eS7EME18sPiKCJSjwk1TcumvVFHYhmBiysuP05EGKDwQAPDI+D7HPkRuF3rL6y23gn
 O6x7bSu5ez1iYs13UnUwvB1tgnWJJ+JrIZVSqacEzYZE+0WxbUhcjgqXWjtuMQJUGJ
 BNkTEjhnmQBMg==
Date: Tue, 17 Jan 2023 15:02:12 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Kees Cook <keescook@chromium.org>
Subject: linux-next: duplicate patch in the kspp tree
Message-ID: <20230117150212.3d8ee843@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/lMsSSd.Bnty+VoZEgKzKb3T";
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
Cc: Karol Herbst <kherbst@redhat.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/lMsSSd.Bnty+VoZEgKzKb3T
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the drm-misc tree as a different commit
(but the same patch):

  06b19f46455c ("drm/nouveau/fb/ga102: Replace zero-length array of trailin=
g structs with flex-array")

This is commit

  54d47689c6e3 ("drm/nouveau/fb/ga102: Replace zero-length array of trailin=
g structs with flex-array")

in the drm-misc tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/lMsSSd.Bnty+VoZEgKzKb3T
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmPGHcQACgkQAVBC80lX
0GxjOQf9GO7ydxY4+ty1jB0BbyM2nHdEYNJViyXF2DraiqxraNEJ8Dqo2P5joFN5
SUUEVbHKX6aXhs6EcsZ+nPwangDzZ3/XwmeYzGZUrtbP8qEQyqBlvCoEaNxLUoRY
qt5eg48H2lr0CEPQxg1ZKDwSWVyLNhuXoJwydc7GVdoI5juQtRS0u+LxzbZ9VJ/4
DfzVe0ddRH991YNnpeq/HgIFa3blY8uDNRq4ApbFfCsqDU777xvEp4LBuICDBG/N
dh8Wm55SDjQWyBt/5t4kgivGniMxgLoFcEfgOmbtnX6ssy+PUCSeKgH2UWc4h17p
AuJexnI/tmUpqv/BzjovV1WObOUxLw==
=Wu9q
-----END PGP SIGNATURE-----

--Sig_/lMsSSd.Bnty+VoZEgKzKb3T--
