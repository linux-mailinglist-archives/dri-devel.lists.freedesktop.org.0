Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD38050062
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2019 05:54:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED3F5898C6;
	Mon, 24 Jun 2019 03:53:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1B12898BF;
 Mon, 24 Jun 2019 03:53:56 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 45XFlP3YK6z9s7h;
 Mon, 24 Jun 2019 13:53:52 +1000 (AEST)
Date: Mon, 24 Jun 2019 13:53:52 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: DRI <dri-devel@lists.freedesktop.org>, Bjorn Helgaas
 <bhelgaas@google.com>, Dave Airlie <airlied@linux.ie>
Subject: Re: linux-next: manual merge of the drm-intel tree with the pci tree
Message-ID: <20190624135352.18b7dd23@canb.auug.org.au>
In-Reply-To: <20190617132027.3e34597d@canb.auug.org.au>
References: <20190617132027.3e34597d@canb.auug.org.au>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=canb.auug.org.au; s=201702; t=1561348435;
 bh=VGIluw6Hvk7T/j5RUdomh0qB2Y2R8PaWhs0YvojBVVI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Kshrg/nNzmsnx243Egr3ezPv5vwk/kYDsT8+lE6SKNkh2pveGDlbta+3tOnjwK7y1
 lUnGKsTaJkb3OzafcN+QmaJiiK+V71m19UsbVBYo5bH/ucE2xrzZxJR++zMJkTgKpr
 WAbqsBSY3kgEtz+2ABXEFfP0/zEqPeqUz9kzbOqtYB/G6y8e3tjt3lekyMX3m5mAkw
 +GlnoR8qXL0El0aL9jNJGbZrYgGGkcc2td0wIpyUmJSuIexSQDcfw2RmJmkVfkd5xG
 FGbH8V4HiSF2hnBZS/saJVUT9T+aEOtalu8jNX70Eyo4K1CEs1AbDOAlV99Bk/yF/h
 Cs1gR1oWw1cZA==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Content-Type: multipart/mixed; boundary="===============1160655914=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1160655914==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/D/pPn=xabmgy+IeW5=LwFxy"; protocol="application/pgp-signature"

--Sig_/D/pPn=xabmgy+IeW5=LwFxy
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 17 Jun 2019 13:20:27 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the drm-intel tree got a conflict in:
>=20
>   drivers/gpu/drm/i915/i915_drv.h
>=20
> between commit:
>=20
>   151f4e2bdc7a ("docs: power: convert docs to ReST and rename to *.rst")
>=20
> from the pci tree and commit:
>=20
>   1bf676cc2dba ("drm/i915: move and rename i915_runtime_pm")
>=20
> from the drm-intel tree.
>=20
> I fixed it up (I just removed the struct definition form this files as
> the latter did - its comment will need to be fixed up in its new file)
> and can carry the fix as necessary. This is now fixed as far as linux-next
> is concerned, but any non trivial conflicts should be mentioned to your
> upstream maintainer when your tree is submitted for merging.  You may
> also want to consider cooperating with the maintainer of the conflicting
> tree to minimise any particularly complex conflicts.

This is now a conflict between the drm and pci trees.
--=20
Cheers,
Stephen Rothwell

--Sig_/D/pPn=xabmgy+IeW5=LwFxy
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl0QSVAACgkQAVBC80lX
0GwM7gf9GK6qzUpAzdlZxWPsizUemMk0hlu06vCfFkvj4DMv6FYsDDyE7Pgt1OHm
XGAE9GIE5qFu5DuesAChmzvOcMVg1kvp8oclWH/OFHCzBS87wDPE2MV0L3WDb+rb
MgGgvDWdG2CJ12ztOdw+3Am1FBmIBVtQ7e1ss2kYERCtCWbwwnN5iJpt9MBpx8/8
f+bHM4Um3Sttm9pTmYGg4tWzsSKY1NE3FouOZCVVUdUsbeNBDL2ACDmBOmg/zoZA
LrVQ+xhPlU0q0fXVREO/A+TW3Ndba+UhQsPYHoIsOMaZeo4juJhdMGZt7EYZJhpz
+pSKH2SGBt35p0xFQLbfFvATmfcGog==
=jGei
-----END PGP SIGNATURE-----

--Sig_/D/pPn=xabmgy+IeW5=LwFxy--

--===============1160655914==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1160655914==--
