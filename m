Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 10A1F29192
	for <lists+dri-devel@lfdr.de>; Fri, 24 May 2019 09:13:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 623446E059;
	Fri, 24 May 2019 07:13:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A0336E059;
 Fri, 24 May 2019 07:12:58 +0000 (UTC)
X-Originating-IP: 90.88.147.134
Received: from localhost (aaubervilliers-681-1-27-134.w90-88.abo.wanadoo.fr
 [90.88.147.134]) (Authenticated sender: maxime.ripard@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 8206DFF80C;
 Fri, 24 May 2019 07:12:53 +0000 (UTC)
Date: Fri, 24 May 2019 09:12:53 +0200
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: linux-next: manual merge of the drm-misc tree with Linus' tree
Message-ID: <20190524071253.xfimg5mlvzevj2nk@flea>
References: <20190521105151.51ffa942@canb.auug.org.au>
 <20190523115355.joyeqlmbjkufueyn@flea>
 <CAL_JsqKN6+f5FXUVs03VSv2AKvqaS0XemKFSYFthaxPoHJVwEg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAL_JsqKN6+f5FXUVs03VSv2AKvqaS0XemKFSYFthaxPoHJVwEg@mail.gmail.com>
User-Agent: NeoMutt/20180716
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Marco Felsch <m.felsch@pengutronix.de>, Jyri Sarha <jsarha@ti.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>, Thierry Reding <treding@nvidia.com>
Content-Type: multipart/mixed; boundary="===============1769505778=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1769505778==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="hfshwxlp636xi7sx"
Content-Disposition: inline


--hfshwxlp636xi7sx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 23, 2019 at 11:10:39AM -0500, Rob Herring wrote:
> On Thu, May 23, 2019 at 6:54 AM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
> >
> > On Tue, May 21, 2019 at 10:51:51AM +1000, Stephen Rothwell wrote:
> > > Hi all,
> > >
> > > Today's linux-next merge of the drm-misc tree got a conflict in:
> > >
> > >   Documentation/devicetree/bindings/vendor-prefixes.txt
> > >
> > > between commit:
> > >
> > >   8122de54602e ("dt-bindings: Convert vendor prefixes to json-schema")
> > >
> > > from Linus' tree and commits:
> > >
> > >   b4a2c0055a4f ("dt-bindings: Add vendor prefix for VXT Ltd")
> > >   b1b0d36bdb15 ("dt-bindings: drm/panel: simple: Add binding for TFC S9700RTWV43TR-01B")
> > >   fbd8b69ab616 ("dt-bindings: Add vendor prefix for Evervision Electronics")
> > >
> > > from the drm-misc tree.
> > >
> > > I fixed it up (I deleted the file and added the patch below) and can
> > > carry the fix as necessary. This is now fixed as far as linux-next is
> > > concerned, but any non trivial conflicts should be mentioned to your
> > > upstream maintainer when your tree is submitted for merging.  You may
> > > also want to consider cooperating with the maintainer of the conflicting
> > > tree to minimise any particularly complex conflicts.
> >
> > I just took your patch and pushed a temp branch there:
> > https://git.kernel.org/pub/scm/linux/kernel/git/mripard/linux.git/commit/?h=drm-misc-next&id=3832f2cad5307ebcedeead13fbd8d3cf06ba5e90
> >
> > Rob, Stephen, are you ok with the change? If so, I'll push it.
>
> The 'tfc' line is missing a ':' on the end.

That's on me, sorry.

> Does the file pass dt_binding_check like that?

No, it didn't but I overlooked it somehow. I've pushed that patch with
the extra semi-column.

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--hfshwxlp636xi7sx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXOeZdQAKCRDj7w1vZxhR
xZr9AP9GA2LoSNSb8Aw3lEDA0VSIAbX2AciLEGPTA/XJg9DJNQEAjA43h9VqiTXF
qjCOtN/i2lxT8YXjFbrhoaQuY7/4yQU=
=kgcI
-----END PGP SIGNATURE-----

--hfshwxlp636xi7sx--

--===============1769505778==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1769505778==--
