Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21464C9F74
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2019 15:30:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3FD46E9D3;
	Thu,  3 Oct 2019 13:30:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D7796E9D3
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Oct 2019 13:30:34 +0000 (UTC)
Received: from localhost (lfbn-1-10718-76.w90-89.abo.wanadoo.fr [90.89.68.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 87D85207FF;
 Thu,  3 Oct 2019 13:30:33 +0000 (UTC)
Date: Thu, 3 Oct 2019 15:30:31 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Icenowy Zheng <icenowy@aosc.io>
Subject: Re: [PATCH v11 4/7] dt-bindings: sun6i-dsi: Add VCC-DSI supply
 property
Message-ID: <20191003133031.gowixvfbdaif4sdf@gilmour>
References: <20191003064527.15128-1-jagan@amarulasolutions.com>
 <20191003064527.15128-5-jagan@amarulasolutions.com>
 <20191003114733.56mlar666l76uoyb@gilmour>
 <0086CD40-F161-4B33-8D76-8DCA20E7DB07@aosc.io>
MIME-Version: 1.0
In-Reply-To: <0086CD40-F161-4B33-8D76-8DCA20E7DB07@aosc.io>
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1570109434;
 bh=/PbXIGt0UaMtnHakh0maKsJfjC9hWocWlO7+FUASxAs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=2QzvAZ+ZKgdOJ80qmd9SOJ5LSwKyk4G/pw5n8Gp/a2xELivFH5ULWHtb4eAgV9ans
 E48i9e22CPdnXQuE2n7GWOtdKqOw4VSGKA0OvZ19/QyJ2q0J6pwyokSdaw/GXyAOMy
 RBSZCDf5+Mji9yipjs10suznOE6Etm80OulAKWYY=
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
Cc: devicetree@vger.kernel.org, michael@amarulasolutions.com,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-sunxi <linux-sunxi@googlegroups.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Chen-Yu Tsai <wens@csie.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============1685277540=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1685277540==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xl6ox63chtxqzxbp"
Content-Disposition: inline


--xl6ox63chtxqzxbp
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 03, 2019 at 09:04:03PM +0800, Icenowy Zheng wrote:
> =E4=BA=8E 2019=E5=B9=B410=E6=9C=883=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=88=
7:47:33, Maxime Ripard <mripard@kernel.org> =E5=86=99=E5=88=B0:
> >On Thu, Oct 03, 2019 at 12:15:24PM +0530, Jagan Teki wrote:
> >> Allwinner MIPI DSI controllers are supplied with SoC DSI
> >> power rails via VCC-DSI pin.
> >>
> >> Some board still work without supplying this but give more
> >> faith on datasheet and hardware schematics and document this
> >> supply property in required property list.
> >>
> >> Reviewed-by: Rob Herring <robh@kernel.org>
> >> Tested-by: Merlijn Wajer <merlijn@wizzup.org>
> >> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> >> ---
> >>  .../bindings/display/allwinner,sun6i-a31-mipi-dsi.yaml         | 3
> >+++
> >>  1 file changed, 3 insertions(+)
> >>
> >> diff --git
> >a/Documentation/devicetree/bindings/display/allwinner,sun6i-a31-mipi-dsi=
=2Eyaml
> >b/Documentation/devicetree/bindings/display/allwinner,sun6i-a31-mipi-dsi=
=2Eyaml
> >> index 47950fced28d..9d4c25b104f6 100644
> >> ---
> >a/Documentation/devicetree/bindings/display/allwinner,sun6i-a31-mipi-dsi=
=2Eyaml
> >> +++
> >b/Documentation/devicetree/bindings/display/allwinner,sun6i-a31-mipi-dsi=
=2Eyaml
> >> @@ -36,6 +36,9 @@ properties:
> >>    resets:
> >>      maxItems: 1
> >>
> >> +  vcc-dsi-supply:
> >> +    description: VCC-DSI power supply of the DSI encoder
> >> +
> >
> >The driver treats it as mandatory, so I've added it to the binding, as
> >suggested by the commit log.
>
> No. The regulator_get function will return dummy regulator, rather than
> fail, if the regulator is not specified.

Yes. And this deals nicely with the backward compatibility case. The
regulator is there on all the SoCs, so there's no reason to leave it
out.

Maxime

--xl6ox63chtxqzxbp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXZX39wAKCRDj7w1vZxhR
xfdtAP9iY02ClBdX7PytSYTVv7u9rk5qFxNbRhfligYsza6diwEA+bXtRpDjiCDy
YsfwN2Wm3Vvp2K/WtdvzfKezGk0WpAo=
=iYP9
-----END PGP SIGNATURE-----

--xl6ox63chtxqzxbp--

--===============1685277540==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1685277540==--
