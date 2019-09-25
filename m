Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD85CBDEB4
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2019 15:14:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A10C6E82D;
	Wed, 25 Sep 2019 13:14:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 15885 seconds by postgrey-1.36 at gabe;
 Wed, 25 Sep 2019 13:14:33 UTC
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52FDD6E844
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2019 13:14:33 +0000 (UTC)
X-Originating-IP: 86.250.200.211
Received: from aptenodytes (lfbn-1-17395-211.w86-250.abo.wanadoo.fr
 [86.250.200.211])
 (Authenticated sender: paul.kocialkowski@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 2E2C7C000A;
 Wed, 25 Sep 2019 13:14:29 +0000 (UTC)
Date: Wed, 25 Sep 2019 15:14:28 +0200
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: display: Document the Xylon LogiCVC
 display controller
Message-ID: <20190925131428.GA207379@aptenodytes>
References: <20190925084932.147971-1-paul.kocialkowski@bootlin.com>
 <20190925084932.147971-2-paul.kocialkowski@bootlin.com>
 <CAL_JsqJY+d9frxuxspvo2SQ=vpWMCAWZfMODA-jm_rKu1GOEaw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAL_JsqJY+d9frxuxspvo2SQ=vpWMCAWZfMODA-jm_rKu1GOEaw@mail.gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>
Content-Type: multipart/mixed; boundary="===============1575775487=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1575775487==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="vtzGhvizbBRQ85DL"
Content-Disposition: inline


--vtzGhvizbBRQ85DL
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed 25 Sep 19, 08:07, Rob Herring wrote:
> On Wed, Sep 25, 2019 at 3:49 AM Paul Kocialkowski
> <paul.kocialkowski@bootlin.com> wrote:
> >
> > The Xylon LogiCVC is a display controller implemented as programmable
> > logic in Xilinx FPGAs.
> >
> > Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > ---
> >  .../display/xylon,logicvc-display.yaml        | 314 ++++++++++++++++++
> >  1 file changed, 314 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/xylon,log=
icvc-display.yaml
>=20
> Error: Documentation/devicetree/bindings/display/xylon,logicvc-display.ex=
ample.dts:17.1-6
> syntax error
> FATAL ERROR: Unable to parse input tree
> scripts/Makefile.lib:321: recipe for target
> 'Documentation/devicetree/bindings/display/xylon,logicvc-display.example.=
dt.yaml'
> failed
> make[1]: *** [Documentation/devicetree/bindings/display/xylon,logicvc-dis=
play.example.dt.yaml]
> Error 1
> Makefile:1282: recipe for target 'dt_binding_check' failed
> make: *** [dt_binding_check] Error 2

Okay I hadn't realized the example is extracted and tested, so I included .=
=2E.
in there. My mistake, sorry.

I did the testing with the dt-schema tools directly, on an out-of-tree dts,
not in-kernel-tree.

Will fix with v3 then.

Cheers,

Paul

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--vtzGhvizbBRQ85DL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAl2LaDQACgkQ3cLmz3+f
v9GDfAf7BGkW/MJkbSMHAOH7JJPvjMO6DZKdGlxsc7aseFvyex7joJAYutxV5TeF
zo5GZKigVItIuoKdkctHGdFJ/W/13C90SOMEx8NntTFv4Aan00ZF2/PPypkCQUKO
bPbIDnRC6lvdCb5L5ZP+y7d08yrq3Vbhoyz37LUyXahd3eqYS2EwS4m43jtEKsz2
lSTQ2BGmRth/wDJrFVoq1H40+JRX6GsePcmhOuXmKiAx9a2LErnbhgbWKo+48var
m1BxAMtecR4lFp7qWE7L1OdKGy4L3VlzszEcUEMtdb/zPWy8o6pJMaySL5aQtyjI
Ps/os9b9Kh316ykRUf5mkAuHk5izdg==
=9Fif
-----END PGP SIGNATURE-----

--vtzGhvizbBRQ85DL--

--===============1575775487==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1575775487==--
