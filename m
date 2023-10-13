Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D7CF7C7AF6
	for <lists+dri-devel@lfdr.de>; Fri, 13 Oct 2023 02:46:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98B6110E575;
	Fri, 13 Oct 2023 00:46:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC81F10E514;
 Fri, 13 Oct 2023 00:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1697157965;
 bh=Y2baROFxBkorrLhkUHImSq2kYpiq8E1PZRnYdQ6X+yo=;
 h=Date:From:To:Cc:Subject:From;
 b=lmxQcvtq92NM0e4MM/t52kHpPXhBP06zobAL8ZYfHoR4uKWfk0beJXNxUAYdMpt4z
 q+zm+qZLeYxLO8/GE1ey06jOp+xXBOEEx4wQzLcR0OaPnVUTXJPwhtb8x23d7WkA+r
 TOKWIXHf7Uv4vgkBwKPZ+7FyKpJ6NBeFCgp+1jad4IblYRFcl3sOXtX0t33b02imQW
 sYZmZ/Yi05vVdc+tbZW/NB9QW4EuvznCU94Q/JwVVLFfuzI8/UMxisNBfNvK6C7zA8
 nH6mHNZ+T1VPXujwE5HHRCwyHUvzK8GNPQUNR0EPPZmI9BzLXwnw7CZUiZDWxo+and
 upuXgCopENTyg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4S67981Smlz4xKl;
 Fri, 13 Oct 2023 11:46:03 +1100 (AEDT)
Date: Fri, 13 Oct 2023 11:46:02 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>,
 Arnd Bergmann <arnd@arndb.de>
Subject: linux-next: manual merge of the drm-misc tree with the asm-generic
 tree
Message-ID: <20231013114602.4cea19d1@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ztYj8dNvgOzPA7znF1RIfx_";
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
 Ard Biesheuvel <ardb@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/ztYj8dNvgOzPA7znF1RIfx_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-misc tree got a conflict in:

  arch/ia64/include/asm/fb.h

between commit:

  cf8e8658100d ("arch: Remove Itanium (IA-64) architecture")

from the asm-generic tree and commit:

  052ddf7b86d2 ("fbdev: Replace fb_pgprotect() with pgprot_framebuffer()")

from the drm-misc tree.

I fixed it up (I just removed the file) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/ztYj8dNvgOzPA7znF1RIfx_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmUok0sACgkQAVBC80lX
0GxB/wf/ROm0rGYuxU6UyfrdITGCdalANh65ZWTeadiilkzDmM3XJnoi/prT1yib
vMqGzRtE1FVU+axAP6e7KWCT6zkNkFB5dGcBy8wbq1tI2Tni0CH7gey3SeCdd9/o
4FWMP0WH7Mk9zAjNUU+hl/5aPvkSmLQtqZSoFpiFCrR4O+AzaSC0EmF9UEmmnvar
hh9ptCupqQsH7c/6eGtt/AS6biv6K448Uv6h0RJoY2TixDSeZyOly01sKWAesGmX
nol+1oi1pCrb8vw5HxrC+jPt61LbtCa+FKNXUWFB1q6qeBCsDGp812z95o7dxv4h
zb/s5SJY90S7TiFlQpfl/kFDxbi+Jg==
=huQp
-----END PGP SIGNATURE-----

--Sig_/ztYj8dNvgOzPA7znF1RIfx_--
