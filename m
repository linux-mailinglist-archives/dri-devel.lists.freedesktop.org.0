Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC54927955
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2019 11:34:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C01E589C51;
	Thu, 23 May 2019 09:34:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5649E89C3F;
 Thu, 23 May 2019 09:34:50 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 458kqV1y1Qz9s9T;
 Thu, 23 May 2019 19:34:46 +1000 (AEST)
Date: Thu, 23 May 2019 19:34:02 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: linux-next: manual merge of the drm-misc tree with Linus' tree
Message-ID: <20190523193402.60dc0812@canb.auug.org.au>
In-Reply-To: <20190523081022.cbirvf2vucbyc34r@flea>
References: <20190521105151.51ffa942@canb.auug.org.au>
 <20190523081022.cbirvf2vucbyc34r@flea>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=canb.auug.org.au; s=201702; t=1558604087;
 bh=w6loxVXiUPCui8tllc+juimOSwqBjbTphljski1VjmM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=bIEO04C0QrgzXApoXOW/gC+6BD/B2SzTlGzHnAnVBmXNHLrK6bUXriS0HkRpzLRCJ
 h51yRP5j5xzH1qb2jtDllIMxCfOYM1PtfRhz+AaDQ3fhrZ/CsTtyrPkY2NvoSAtbfo
 sYulquD1yJEvJ7AHN8XeX/jeLGQwfVQT6E0sT9K+SidRsrvszw/afyUZr6gFXdp5y3
 goUmbh6xLa11urwI7BO7kyQyZwD+bkpSQLsKRdga6mGgT+zfPMueBjNLp4xnVEgiFB
 cDImQYmkEIYR/ZmhgGcMUGwpfXFS1gildaKUoYf73eyYuX9csS7Pq8uwvWAr2906CP
 RMFqwntzCuZaQ==
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jyri Sarha <jsarha@ti.com>, Marco Felsch <m.felsch@pengutronix.de>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Sean Paul <seanpaul@chromium.org>, DRI <dri-devel@lists.freedesktop.org>,
 Thierry Reding <treding@nvidia.com>
Content-Type: multipart/mixed; boundary="===============0638524432=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0638524432==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/M4TugNSXYXC94YDxNnBwkzN"; protocol="application/pgp-signature"

--Sig_/M4TugNSXYXC94YDxNnBwkzN
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Maxime,

On Thu, 23 May 2019 10:10:22 +0200 Maxime Ripard <maxime.ripard@bootlin.com=
> wrote:
>
> Hi Stephen,
>=20
> On Tue, May 21, 2019 at 10:51:51AM +1000, Stephen Rothwell wrote:
> > Hi all,
> >
> > Today's linux-next merge of the drm-misc tree got a conflict in:
> >
> >   Documentation/devicetree/bindings/vendor-prefixes.txt
> >
> > between commit:
> >
> >   8122de54602e ("dt-bindings: Convert vendor prefixes to json-schema")
> >
> > from Linus' tree and commits:
> >
> >   b4a2c0055a4f ("dt-bindings: Add vendor prefix for VXT Ltd")
> >   b1b0d36bdb15 ("dt-bindings: drm/panel: simple: Add binding for TFC S9=
700RTWV43TR-01B")
> >   fbd8b69ab616 ("dt-bindings: Add vendor prefix for Evervision Electron=
ics")
> >
> > from the drm-misc tree.
> >
> > I fixed it up (I deleted the file and added the patch below) and can
> > carry the fix as necessary. This is now fixed as far as linux-next is
> > concerned, but any non trivial conflicts should be mentioned to your
> > upstream maintainer when your tree is submitted for merging.  You may
> > also want to consider cooperating with the maintainer of the conflicting
> > tree to minimise any particularly complex conflicts.
> >
> > --
> > Cheers,
> > Stephen Rothwell
> >
> > From: Stephen Rothwell <sfr@canb.auug.org.au>
> > Date: Tue, 21 May 2019 10:48:36 +1000
> > Subject: [PATCH] dt-bindings: fix up for vendor prefixes file conversion
> >
> > Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > ---
> >  Documentation/devicetree/bindings/vendor-prefixes.yaml | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/D=
ocumentation/devicetree/bindings/vendor-prefixes.yaml
> > index 83ca4816a78b..749e3c3843d0 100644
> > --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > @@ -287,6 +287,8 @@ patternProperties:
> >      description: Everest Semiconductor Co. Ltd.
> >    "^everspin,.*":
> >      description: Everspin Technologies, Inc.
> > +  "^evervision,.*":
> > +    description: Evervision Electronics Co. Ltd.
> >    "^exar,.*":
> >      description: Exar Corporation
> >    "^excito,.*":
> > @@ -851,6 +853,8 @@ patternProperties:
> >      description: Shenzhen Techstar Electronics Co., Ltd.
> >    "^terasic,.*":
> >      description: Terasic Inc.
> > +  "^tfc,.*":
> > +    description: Three Five Corp
> >    "^thine,.*":
> >      description: THine Electronics, Inc.
> >    "^ti,.*":
> > @@ -925,6 +929,8 @@ patternProperties:
> >      description: Voipac Technologies s.r.o.
> >    "^vot,.*":
> >      description: Vision Optical Technology Co., Ltd.
> > +  "^vxt,.*"
> > +    description: VXT Ltd =20
>=20
> I'm not sure whether or not you can change it, but this breaks the
> users of that file.
>=20
> What you want is:
>=20
> - "^vxt,.*"
> + "^vxt,.*:"

I have fixed my version (but I put the ':' after the '"' like the
others).

Thanks for letting me know.
--=20
Cheers,
Stephen Rothwell

--Sig_/M4TugNSXYXC94YDxNnBwkzN
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzmaQoACgkQAVBC80lX
0GxmJQf/SjSWc6s/V4yp7MSJOXV7fj4rbcZvA9A6yD2j8kZMDC2DF2xv1yZ/9fKL
RDOBP4djWQOeFqd7HGliFFrlL899cNsOHHuhfaAa2cBSnHu1RfQAchRMtMsIv2yW
YtZ3P3TYohfBbOYS2kjKIkE+ITQEA7C8ZNhZCh6XoJ6iLmz7z83IyqACDHdTbxqW
nU0YcUtSnVf1b2WE3W/WVG+Z0ZKdGqmZ6lXXvtYX7A69YTFrjmU/3AYaQjLEq48y
AjSxJGWWkkysxsz+zSz0221MsakKDIYBcbuBA9Wh31XAqeedRVoTxN+kxQg4IIJ0
kzVUroPXneQc88gr0PFJ9YqltgTxUA==
=HfDy
-----END PGP SIGNATURE-----

--Sig_/M4TugNSXYXC94YDxNnBwkzN--

--===============0638524432==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0638524432==--
