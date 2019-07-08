Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F207862CD4
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2019 01:55:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9752C899B5;
	Mon,  8 Jul 2019 23:55:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80A50899B0;
 Mon,  8 Jul 2019 23:55:31 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 45jMlN26mWz9s7T;
 Tue,  9 Jul 2019 09:55:28 +1000 (AEST)
Date: Tue, 9 Jul 2019 09:55:27 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: DRI <dri-devel@lists.freedesktop.org>, Bjorn Helgaas
 <bhelgaas@google.com>, Dave Airlie <airlied@linux.ie>
Subject: Re: linux-next: manual merge of the drm-intel tree with the pci tree
Message-ID: <20190709095527.6c5118c4@canb.auug.org.au>
In-Reply-To: <20190624135352.18b7dd23@canb.auug.org.au>
References: <20190617132027.3e34597d@canb.auug.org.au>
 <20190624135352.18b7dd23@canb.auug.org.au>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=canb.auug.org.au; s=201702; t=1562630129;
 bh=Ym/EKIz5+mGt0NSG1eoSDd4Mz2GAB/KfhmkvnjZb7sU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=qN1ubgHHJ6+n51Yf/AmKngEf4pkDeQV5YH/6hhgU5oBBd3/x7Oo0S+YJbpcspIz+Z
 /DJW9PrFULQsgrUNJ5tpTIibDVuYimm6VWt/OcoNl+39eW5n8gIxU1iC4dKccXFdRN
 syRoAi/12QsyW9HYSAKhWz5Aeby71k0/XpKcRHoe08QrT2qkvMojO86jdIF0+XW0eA
 QvNAf5D7t1hR0MS2TJlmy3vscd7nsPpQJ5xsib9ESMi+5554KAdkdJG6111btvyy8D
 EsYLNT/+OmTWRXu1NsXodpFdQAnZdNdZYVJ6DbXQsdmiBqCv98+CWitEP/dFt6GPC5
 vPORr1u5tKdng==
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
Content-Type: multipart/mixed; boundary="===============0524195625=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0524195625==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/D1G4KJeDENqWWOoBEugAETS"; protocol="application/pgp-signature"

--Sig_/D1G4KJeDENqWWOoBEugAETS
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 24 Jun 2019 13:53:52 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> On Mon, 17 Jun 2019 13:20:27 +1000 Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> >
> > Today's linux-next merge of the drm-intel tree got a conflict in:
> >=20
> >   drivers/gpu/drm/i915/i915_drv.h
> >=20
> > between commit:
> >=20
> >   151f4e2bdc7a ("docs: power: convert docs to ReST and rename to *.rst")
> >=20
> > from the pci tree and commit:
> >=20
> >   1bf676cc2dba ("drm/i915: move and rename i915_runtime_pm")
> >=20
> > from the drm-intel tree.
> >=20
> > I fixed it up (I just removed the struct definition from this files as
> > the latter did - its comment will need to be fixed up in its new file)
> > and can carry the fix as necessary. This is now fixed as far as linux-n=
ext
> > is concerned, but any non trivial conflicts should be mentioned to your
> > upstream maintainer when your tree is submitted for merging.  You may
> > also want to consider cooperating with the maintainer of the conflicting
> > tree to minimise any particularly complex conflicts. =20
>=20
> This is now a conflict between the drm and pci trees.

I am still getting this conflict (the commit ids may have changed).
Just a reminder in case you think Linus may need to know.

--=20
Cheers,
Stephen Rothwell

--Sig_/D1G4KJeDENqWWOoBEugAETS
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl0j1+8ACgkQAVBC80lX
0GyJTgf/cBbLXDHFPdz3+Zmf+6DPtIEhbm4KguM5dpbf8q2ytStyp4y5gYf72eNt
P0enaV0V3uLxcUtPIp8EtFrdHBHKmtuUfXs0ZhcnJ2UFJNevDRtcm47gi6UQ97bb
LV3Z/hj3ioUV2T/rq7FnBWU05wjMd3fyoJxb3qUsejOkIKenthyjueVVnOHBgKiW
u5JIIwPcfYN3ykYPhQAbc4KZJH4GIezgAOwmhkP+aWco+Pj/Y3VOzXosK49WjWyj
Ag4nvuxUsi+d0O2KuqXFxdGw68UqFQ8pexjbbHCCKmkCUm/muYJmR244DHXle2aX
HFNyj0Ui07q0a3mcfxBbh7qX1wS6kg==
=6X62
-----END PGP SIGNATURE-----

--Sig_/D1G4KJeDENqWWOoBEugAETS--

--===============0524195625==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0524195625==--
