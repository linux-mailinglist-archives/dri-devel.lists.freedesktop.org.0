Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 564BE360495
	for <lists+dri-devel@lfdr.de>; Thu, 15 Apr 2021 10:42:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80D6C6E4F1;
	Thu, 15 Apr 2021 08:42:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 959976E4F1
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Apr 2021 08:42:34 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id B491E5806CD;
 Thu, 15 Apr 2021 04:42:33 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Thu, 15 Apr 2021 04:42:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=GW8n0s7NGEU++w2zgBGmnzhZ7ST
 D4akNONxdJj8wiSU=; b=pAYkdDGgCvqWvjWhl45AZAWK54u6p48mjD8JQeB1kxw
 htQjEUpYvLqAHeN8HJSPXJG19Qy4uY5nXIIWZafMBNTglHVJiQdxjND7tuOvKrr5
 ZG5+d3FrOvXT7J9iiBveZTNDwxPcxAQNGFgQKmTSbmDLnLP4niXvo+AHIlyKvoW4
 tBzag6WM4IrCFyz2EruyiwP2Cs9+cUGxAQ2qVS07+LN+3ZmoiptOqU4ETZ8lFsja
 8T1K0sWeyL8u/N+x7Usiped7It8me2fAjaRJxVw8MAVgSXP4lhxruLV6JjLoIZFg
 agrCvBl3oiUcHsph+K7aT9qz6+l1JKAh75UOMyFkDzw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=GW8n0s
 7NGEU++w2zgBGmnzhZ7STD4akNONxdJj8wiSU=; b=ckYYBa/o1ySg985iSXQLWF
 cyzD9BOWQ8blRA0XPGSMJ2/bf0w7SbDvdKMybOQ8gYV7owpUEaPDEG9ILVU76Yq0
 SplBZhEfQX4MdYLG7YRhf7/cQdCV+xkbpGWupPno0lZrVOjozZjC6BHZh4tHzWqB
 YGPdIfKvkzARfyKYAhy+t/nFvYSaPOyP5ch92e8HPq0aXMtMMIGXHZDldIkB84UV
 hJ456oIB5xcKl+xtorGlhZxVreIDAgfbFILxNnMR0eUcTZuwj0pGkTKB+WNaqwHn
 PTCgXTapIizYhljuRB+aVnolIPOD6mGwbxuXcyaGmBLZST1GAL3vcyyjiHzvcqbg
 ==
X-ME-Sender: <xms:ePx3YJjhFzZEC_FTczHfsd4XhulLXBw66yoUtZobkBOsmi0v4OSl7A>
 <xme:ePx3YOC574yYK9q2mziH6f3ISJLB2Hcb1It86T3fHMHogZiELTaQd-5iXuOZls2BX
 OsmEEhDAnk-CgjL150>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudelfedgtdejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepuddvledvtdejgfehjeehtdeugeetjeehfedvffdthffhffeugeektdeitddv
 fedunecuffhomhgrihhnpeguvghvihgtvghtrhgvvgdrohhrghdpkhgvrhhnvghlrdhorh
 hgnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenucfr
 rghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:ePx3YJG88fQCtB6Uw6IofzbleWCTEDlner1oWdXJcywcvW1pYr1Qmw>
 <xmx:ePx3YOT75lL8ZwFYdjYs8D0tnnCNGHIzaieLgY0-BhKV_MZXemFryA>
 <xmx:ePx3YGzcG_0wgyw_ieWUm8JyJoUucntRBPFWr-kKg-mD2ILd-Mgujw>
 <xmx:efx3YKfdAps6LbYVfEt-cnOiCyhmI9qF9-TDtb4r80ry7XPjo6QfBw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 335EB240054;
 Thu, 15 Apr 2021 04:42:32 -0400 (EDT)
Date: Thu, 15 Apr 2021 10:42:30 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Kevin Tang <kevin3.tang@gmail.com>
Subject: Re: [PATCH v4 5/6] dt-bindings: display: add Unisoc's mipi dsi
 controller bindings
Message-ID: <20210415084230.moqxuy3caym3kupk@gilmour>
References: <20210222132822.7830-1-kevin3.tang@gmail.com>
 <20210222132822.7830-6-kevin3.tang@gmail.com>
 <20210324111316.ggo5deacaoecu27q@gilmour>
 <CAFPSGXah3gKKHXhukRAPT=RjQZTnvDznG+619+8tah-hfFrUzA@mail.gmail.com>
 <20210407104653.l4xwfl3qshaimat3@gilmour>
 <CAFPSGXaQKeKMKC7MGXhxQErB_yh_eE8khk1hOrjHnuOH20Gg4Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFPSGXaQKeKMKC7MGXhxQErB_yh_eE8khk1hOrjHnuOH20Gg4Q@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============0390957046=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0390957046==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="grolchpxzvyplpoi"
Content-Disposition: inline


--grolchpxzvyplpoi
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 09, 2021 at 08:23:19AM +0800, Kevin Tang wrote:
> Maxime Ripard <maxime@cerno.tech> =E4=BA=8E2021=E5=B9=B44=E6=9C=887=E6=97=
=A5=E5=91=A8=E4=B8=89 =E4=B8=8B=E5=8D=886:46=E5=86=99=E9=81=93=EF=BC=9A
>=20
> > On Wed, Mar 31, 2021 at 09:49:14AM +0800, Kevin Tang wrote:
> > > Hi Maxime,
> > >
> > > Maxime Ripard <maxime@cerno.tech> =E4=BA=8E2021=E5=B9=B43=E6=9C=8824=
=E6=97=A5=E5=91=A8=E4=B8=89 =E4=B8=8B=E5=8D=887:13=E5=86=99=E9=81=93=EF=BC=
=9A
> > >
> > > > On Mon, Feb 22, 2021 at 09:28:21PM +0800, Kevin Tang wrote:
> > > > > From: Kevin Tang <kevin.tang@unisoc.com>
> > > > >
> > > > > Adds MIPI DSI Controller
> > > > > support for Unisoc's display subsystem.
> > > > >
> > > > > Cc: Orson Zhai <orsonzhai@gmail.com>
> > > > > Cc: Chunyan Zhang <zhang.lyra@gmail.com>
> > > > > Signed-off-by: Kevin Tang <kevin.tang@unisoc.com>
> > > > > Reviewed-by: Rob Herring <robh@kernel.org>
> > > > > ---
> > > > >  .../display/sprd/sprd,sharkl3-dsi-host.yaml   | 102
> > ++++++++++++++++++
> > > > >  1 file changed, 102 insertions(+)
> > > > >  create mode 100644
> > > >
> > Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dsi-host.ya=
ml
> > > > >
> > > > > diff --git
> > > >
> > a/Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dsi-host.=
yaml
> > > >
> > b/Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dsi-host.=
yaml
> > > > > new file mode 100644
> > > > > index 000000000..d439f688f
> > > > > --- /dev/null
> > > > > +++
> > > >
> > b/Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dsi-host.=
yaml
> > > > > @@ -0,0 +1,102 @@
> > > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > > +%YAML 1.2
> > > > > +---
> > > > > +$id:
> > > > http://devicetree.org/schemas/display/sprd/sprd,sharkl3-dsi-host.ya=
ml#
> > > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > > +
> > > > > +title: Unisoc MIPI DSI Controller
> > > > > +
> > > > > +maintainers:
> > > > > +  - Kevin Tang <kevin.tang@unisoc.com>
> > > > > +
> > > > > +properties:
> > > > > +  compatible:
> > > > > +    const: sprd,sharkl3-dsi-host
> > > > > +
> > > > > +  reg:
> > > > > +    maxItems: 1
> > > > > +
> > > > > +  interrupts:
> > > > > +    maxItems: 2
> > > > > +
> > > > > +  clocks:
> > > > > +    minItems: 1
> > > > > +
> > > > > +  clock-names:
> > > > > +    items:
> > > > > +      - const: clk_src_96m
> > > > > +
> > > > > +  power-domains:
> > > > > +    maxItems: 1
> > > > > +
> > > > > +  ports:
> > > > > +    type: object
> > > > > +
> > > > > +    properties:
> > > > > +      "#address-cells":
> > > > > +        const: 1
> > > > > +
> > > > > +      "#size-cells":
> > > > > +        const: 0
> > > > > +
> > > > > +      port@0:
> > > > > +        type: object
> > > > > +        description:
> > > > > +          A port node with endpoint definitions as defined in
> > > > > +
> > Documentation/devicetree/bindings/media/video-interfaces.txt.
> > > > > +          That port should be the input endpoint, usually coming
> > from
> > > > > +          the associated DPU.
> > > > > +      port@1:
> > > > > +        type: object
> > > > > +        description:
> > > > > +          A port node with endpoint definitions as defined in
> > > > > +
> > Documentation/devicetree/bindings/media/video-interfaces.txt.
> > > > > +          That port should be the output endpoint, usually outpu=
t to
> > > > > +          the associated panel.
> > > >
> > > > The DSI generic binding asks that peripherals that are controlled
> > > > through a DCS be a subnode of the MIPI-DSI bus, not through a port
> > > > endpoint.
> > > >
> > >  Our DSI controller don't support DCS now...
> >
> > I'm not sure I follow you, you mentionned in the patch 4 that you were
> > testing for a device to be in command mode, how would that work without
> > DCS support?
> >
> Sorry, I see DCS as DSC, pls ignore my previous comments.
>=20
> dsi input node is display controller and dsi output node is panel,
> I still don't understand what it has to do with dcs? and it seems that
> other vendors also like this.
>=20
> can you help provide some cases?

So the device tree is a tree organized through which bus controls which
device: Your DSI controller is accessed through a memory-mapped region
and is thus a child node of the main bus (I guess?) and then, since the
DSI panel is going to be controlled through the DSI controller and
MIPI-DCS, it needs to be a child of the display controller.

This is exactly what is being described here:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Doc=
umentation/devicetree/bindings/display/mipi-dsi-bus.txt#n42

The second port is thus not needed at all

Maxime

--grolchpxzvyplpoi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYHf8dgAKCRDj7w1vZxhR
xaWJAQDa4g+JQlJo7RK1O/eUA0Obqrlbnz+fucRtuGsvmSyfPAD/ZnyIEIiOEYjc
s+1BtXu7e0IGuspk16iOS2/ywpbqvgA=
=UFOF
-----END PGP SIGNATURE-----

--grolchpxzvyplpoi--

--===============0390957046==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0390957046==--
