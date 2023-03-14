Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AC966B86C6
	for <lists+dri-devel@lfdr.de>; Tue, 14 Mar 2023 01:19:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C94C410E69F;
	Tue, 14 Mar 2023 00:19:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28E4D10E69F;
 Tue, 14 Mar 2023 00:19:17 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4PbDfS2kpdz4whr;
 Tue, 14 Mar 2023 11:19:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1678753152;
 bh=RvgXDWT0B/3pVtS5a3R9IwdksaQYKBwWnd/n3mYIF6Q=;
 h=Date:From:To:Cc:Subject:From;
 b=VWNibYsrBi0G1m0sPOGtvW+AwNXObOJQ0uUdU8RvEGUiFl2ewoJCzd/6S7yyK2ljX
 eY5vXbAz9qOCHr0eaZFfyWbzvfDWo0SHu3rCrMcwVBc6UZpyaLBYjiGXxy/hfR5S7Z
 2kt9MhmX4E5gWqEePsNJ08pYv85+cTMa0dzwz88bgWSNlM8I92GnwIUo5ZGfOzRK51
 FV+08MoRrQMV17bhOy9NR9yeniFzNp63LdQgx00jWO39CoLDOgBhQlATDcQnkgt+Wh
 YiYYld2IrwSIt4ilwRS3frohJQXyDYVueB/2xYA5ll6MkhlWypAHnbd5L0WzZ8kt4G
 9FAeSOe3nAULQ==
Date: Tue, 14 Mar 2023 11:19:11 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>
Subject: linux-next: manual merge of the drm-misc tree with Linus' tree
Message-ID: <20230314111911.62a3e636@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/tDg50K40RUE_6_OJTRl_W8o";
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
Cc: Alexandr Sapozhnikov <alsp705@gmail.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/tDg50K40RUE_6_OJTRl_W8o
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-misc tree got a conflict in:

  drivers/gpu/drm/tiny/cirrus.c

between commit:

  7245e629dcaa ("drm/cirrus: NULL-check pipe->plane.state->fb in cirrus_pip=
e_update()")

from Linus' tree and commits:

  d99c028941b3 ("drm/cirrus: Convert to regular atomic helpers")
  03e7ac67e743 ("drm/cirrus: Enable damage clipping on primary plane")

from the drm-misc tree.

I fixed it up (I just used the latter version) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/tDg50K40RUE_6_OJTRl_W8o
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmQPvX8ACgkQAVBC80lX
0GwdJQgAkZ3A5Z1Zy4b6++ltoWXQsioiTemCgR9WcX3GuPntiblvL8xPt0vB6OVj
ba2LPj/xgxI7pGyDks1TvfCVOfsYVuhUo3QEycs/cX3EfV7xvaDoL60K3Gkean3S
FxGRCMPAaFTLOG9URh1drgzaQf6JRxfy+w3IJyyN6uanslhBm1NnmaOodUqNDtTT
zFR/JHPDF1ftGvXYbGXmSHFiN78yKNKskyRnlAKzu3SP8QYD10fHDSv/OF2Po1ZF
1DXLuHEwTlHV3kAOkOcIlFv78yhJ78V3XzlKZPOfdhtQcjnzKdt1SkjaUg6icF4m
zFcdSVE+3hL1z9oS/Vl7VaWtKEbdPA==
=lQRK
-----END PGP SIGNATURE-----

--Sig_/tDg50K40RUE_6_OJTRl_W8o--
