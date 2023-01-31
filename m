Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94C976821D2
	for <lists+dri-devel@lfdr.de>; Tue, 31 Jan 2023 03:03:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C98310E30B;
	Tue, 31 Jan 2023 02:03:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3185810E30A;
 Tue, 31 Jan 2023 02:03:37 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4P5SyC5PCSz4xwq;
 Tue, 31 Jan 2023 13:03:31 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1675130613;
 bh=wMaAeKI0zF7GwzSps0H7CB6N6KHHwOabGNIZQ95HWBg=;
 h=Date:From:To:Cc:Subject:From;
 b=BVKQ98PvgZqHBLO2kR3gbz02EFoXyRvgJn7RDLChli+kDiMtRPGgobJWGfKsFhTc+
 tnVDdnFuw6ENs0lKFT6rghKG60ufhvd2OKPyysZvQvLus5kDvxX2/MtY21iGB3DC5a
 +RwKyJMApMj6umiLScqmyMqitWFnVfKMV/Mr+V7F8ZUva7d5h7tYt1u1F0lx/lzvY2
 Bt78VMJd4pxHH0oeYkRcAj0TeibDVxcIdDVI8oZrGVJJasodXGHC0pp7S3zxRi1LoZ
 kHRaD8F1fLb9PL8Ddvci328VeguR2xfRw7mw1Gx/JtMmkFhdfAiYjzMoCUf8DIRBfa
 X77dipw83qBYg==
Date: Tue, 31 Jan 2023 13:03:05 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Greg KH <greg@kroah.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Jani
 Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: linux-next: manual merge of the usb tree with the drm-intel-fixes tree
Message-ID: <20230131130305.019029ff@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/dTmyzOU1EnNXR2Sh6q=MHTo";
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 John Harrison <John.C.Harrison@Intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/dTmyzOU1EnNXR2Sh6q=MHTo
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the usb tree got a conflict in:

  drivers/gpu/drm/i915/gt/intel_engine_cs.c

between commit:

  5bc4b43d5c6c ("drm/i915: Fix up locking around dumping requests lists")

from the drm-intel-fixes tree and commit:

  4d70c74659d9 ("i915: Move list_count() to list.h as list_count_nodes() fo=
r broader use")

from the usb tree.

I fixed it up (the former removed the code changed by the latter) and
can carry the fix as necessary. This is now fixed as far as linux-next
is concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/dTmyzOU1EnNXR2Sh6q=MHTo
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmPYdtkACgkQAVBC80lX
0GzxOwf9H9KgKNxnEkcMqyn6HV7TCodkrJAi9nEvNMBrRRottaKd5N7bsouPLC/X
f0WfJlwSxldmWxwLCDfsjJwI62sXjaaSIaYDIYt5rXxChJvOD/URZMGK0bcwBCzV
ZGfWW0+zH7Qp8xYImST9wr2tuRn8SGivLr17oXd+Fj9Y24JRsWSPF22/Vpzu883e
LBiKJTJycDze69CBhu6LpAxmCv+H2RtrKdso2XKUFT9O70nCA0qoR525fZidU/P4
HUICvWbzPcBOGjdtmPIWiYssx/OsbFSW6bz/D1vjch5Bz8IKBwdF0HJoWh66cG6y
Vq5TGBAdcw9JnFEgYPqMQbt0bnDrNw==
=uMpd
-----END PGP SIGNATURE-----

--Sig_/dTmyzOU1EnNXR2Sh6q=MHTo--
