Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09EDF356A21
	for <lists+dri-devel@lfdr.de>; Wed,  7 Apr 2021 12:47:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 260186E0AA;
	Wed,  7 Apr 2021 10:46:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AAF06E0AA
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Apr 2021 10:46:56 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id EB0E658046F;
 Wed,  7 Apr 2021 06:46:55 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Wed, 07 Apr 2021 06:46:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=uuZ/xLH9WHKeCmiTekVN25bn/7g
 Vztg7LVdMBHeux9Y=; b=mNHdhzXhjvauBndx+BnWlTKDA50OgamEX487wmmyF0e
 BTktqsjNxXxQaXGuGZSJJaI2aplx2G1dxmjhVuX7RtyQTafD+6SOTBq7RVozYsbi
 U3S4oLKvu8r9QjnaiKQxm5q6A143RfOIcoJ35k7xYBETkW+KZGONxTCdL5bvI7bK
 O0Y9LTELkZ+SQ7eXW4eY1Ev0dTs3/1Wm1rWs2BdFNvWpI3fsOUoQpopxnYyWdIo0
 4TVM3W7xNaoWfJbTjxVkLSdG6RkxB/+TasuX5QSHcZzdEPBuiiNA02PK/cDVZX7L
 kSCD17aOtOK0jiKEPEO1no3Q1Paeqk9Ge/9x9yXXBmg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=uuZ/xL
 H9WHKeCmiTekVN25bn/7gVztg7LVdMBHeux9Y=; b=M04d/GbuP8UHXoN/ULG1jc
 BNSkmu3nEZ7KorNsnWCj9u0YkHjeHZtTWL8curDOBxorWvsi6Lph6jeaQY7YUrG8
 mmU99L/2GiO23RRKL7sKjAvJymX01ZFAbrOQtLIU0lDhlPUzHNmzFREvWicTPd07
 6AR1F+m6nOcLJQrUeFyZTFR8uSLk92mpEqvNRu6mTYhF/LBeIiffeI+cyIDodZQi
 l2MKH/KNnAiMhi7gmwhnfYwGdBeTsaCDFmDONSQwnZajoCrfjK7TsfNgIaN1LhLg
 vQFGuJg/R/KV0dkBTHqwN3vHx3EqywI66lXKtRLFzZSWxGmalPmQ7O8pEScvIg6w
 ==
X-ME-Sender: <xms:n41tYMnGV2cpL1HZ6eOkfwYGDJlMNsYSALoGOSk-jPjPKqiPNBf73A>
 <xme:n41tYL1VOrTsIGTSgAHH6PRkhHG21g9d0xp07mlhohYEq356I3R-fTHisIUkq2MLW
 0N2w4iTfVyQeBsWlx8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudejjedgfedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepgeeigfekgeeuvdevieeuleefffetudelffefudetfedvhfeiueeftdekheeg
 tdeknecuffhomhgrihhnpeguvghvihgtvghtrhgvvgdrohhrghenucfkphepledtrdekle
 drieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhr
 ohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:n41tYKqneg3-ksIq24MmLKnKUB3oXtunMOoK3GbXjoQJUR1WnDg_cQ>
 <xmx:n41tYImLdzEX1WvNXxg7TwMYizFaWGRpQh9sDvylxOjJy0g2FomDXQ>
 <xmx:n41tYK1D0yMWA3qzfMehQb-WbolVw74Tnod81A4DbTPh6ubdAnN_WA>
 <xmx:n41tYIygmjX87A6WQ9JYBj0P3BC3jVT5H3gIMJJNI-wRSG4E5SKwoQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 7AEA11080054;
 Wed,  7 Apr 2021 06:46:55 -0400 (EDT)
Date: Wed, 7 Apr 2021 12:46:53 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Kevin Tang <kevin3.tang@gmail.com>
Subject: Re: [PATCH v4 5/6] dt-bindings: display: add Unisoc's mipi dsi
 controller bindings
Message-ID: <20210407104653.l4xwfl3qshaimat3@gilmour>
References: <20210222132822.7830-1-kevin3.tang@gmail.com>
 <20210222132822.7830-6-kevin3.tang@gmail.com>
 <20210324111316.ggo5deacaoecu27q@gilmour>
 <CAFPSGXah3gKKHXhukRAPT=RjQZTnvDznG+619+8tah-hfFrUzA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFPSGXah3gKKHXhukRAPT=RjQZTnvDznG+619+8tah-hfFrUzA@mail.gmail.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Chunyan Zhang <zhang.lyra@gmail.com>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Rob Herring <robh+dt@kernel.org>, Orson Zhai <orsonzhai@gmail.com>,
 Sean Paul <sean@poorly.run>
Content-Type: multipart/mixed; boundary="===============0992020913=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0992020913==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="553br3zebnro57nf"
Content-Disposition: inline


--553br3zebnro57nf
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 31, 2021 at 09:49:14AM +0800, Kevin Tang wrote:
> Hi Maxime,
>=20
> Maxime Ripard <maxime@cerno.tech> =E4=BA=8E2021=E5=B9=B43=E6=9C=8824=E6=
=97=A5=E5=91=A8=E4=B8=89 =E4=B8=8B=E5=8D=887:13=E5=86=99=E9=81=93=EF=BC=9A
>=20
> > On Mon, Feb 22, 2021 at 09:28:21PM +0800, Kevin Tang wrote:
> > > From: Kevin Tang <kevin.tang@unisoc.com>
> > >
> > > Adds MIPI DSI Controller
> > > support for Unisoc's display subsystem.
> > >
> > > Cc: Orson Zhai <orsonzhai@gmail.com>
> > > Cc: Chunyan Zhang <zhang.lyra@gmail.com>
> > > Signed-off-by: Kevin Tang <kevin.tang@unisoc.com>
> > > Reviewed-by: Rob Herring <robh@kernel.org>
> > > ---
> > >  .../display/sprd/sprd,sharkl3-dsi-host.yaml   | 102 ++++++++++++++++=
++
> > >  1 file changed, 102 insertions(+)
> > >  create mode 100644
> > Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dsi-host.ya=
ml
> > >
> > > diff --git
> > a/Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dsi-host.=
yaml
> > b/Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dsi-host.=
yaml
> > > new file mode 100644
> > > index 000000000..d439f688f
> > > --- /dev/null
> > > +++
> > b/Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dsi-host.=
yaml
> > > @@ -0,0 +1,102 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id:
> > http://devicetree.org/schemas/display/sprd/sprd,sharkl3-dsi-host.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Unisoc MIPI DSI Controller
> > > +
> > > +maintainers:
> > > +  - Kevin Tang <kevin.tang@unisoc.com>
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: sprd,sharkl3-dsi-host
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  interrupts:
> > > +    maxItems: 2
> > > +
> > > +  clocks:
> > > +    minItems: 1
> > > +
> > > +  clock-names:
> > > +    items:
> > > +      - const: clk_src_96m
> > > +
> > > +  power-domains:
> > > +    maxItems: 1
> > > +
> > > +  ports:
> > > +    type: object
> > > +
> > > +    properties:
> > > +      "#address-cells":
> > > +        const: 1
> > > +
> > > +      "#size-cells":
> > > +        const: 0
> > > +
> > > +      port@0:
> > > +        type: object
> > > +        description:
> > > +          A port node with endpoint definitions as defined in
> > > +          Documentation/devicetree/bindings/media/video-interfaces.t=
xt.
> > > +          That port should be the input endpoint, usually coming from
> > > +          the associated DPU.
> > > +      port@1:
> > > +        type: object
> > > +        description:
> > > +          A port node with endpoint definitions as defined in
> > > +          Documentation/devicetree/bindings/media/video-interfaces.t=
xt.
> > > +          That port should be the output endpoint, usually output to
> > > +          the associated panel.
> >
> > The DSI generic binding asks that peripherals that are controlled
> > through a DCS be a subnode of the MIPI-DSI bus, not through a port
> > endpoint.
> >
>  Our DSI controller don't support DCS now...

I'm not sure I follow you, you mentionned in the patch 4 that you were
testing for a device to be in command mode, how would that work without
DCS support?

Maxime

--553br3zebnro57nf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYG2NnQAKCRDj7w1vZxhR
xVXLAP9mO7vK4MgZb5e9M+aCHBwStSrV5sbLOHevE9lEn9wIZAD+K7HId42Flb03
dZShTQ4fnrJqUoVS3Qq0p3QyDtmtRwI=
=Pfzm
-----END PGP SIGNATURE-----

--553br3zebnro57nf--

--===============0992020913==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0992020913==--
