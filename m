Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 338DE1A08F7
	for <lists+dri-devel@lfdr.de>; Tue,  7 Apr 2020 10:09:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC83D6E5BF;
	Tue,  7 Apr 2020 08:09:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E0E66E44D
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Apr 2020 17:05:05 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id A5A695C00D6;
 Mon,  6 Apr 2020 13:05:02 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 06 Apr 2020 13:05:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=TdE1HrDFz4yrNizninaJxR7gmC9
 gTaFncKtkMVs1KSQ=; b=XsaM3b0zdSFYXhUE/TA/OyiGxuQFi2MoVpLAbePvEYJ
 IDpuT7aWRj0JPSDWcRRfs/wOvwy5FmN00qajZpiIPn6Z92vzUHbETQHyOSFbv1Hx
 ljy2IlOw6BiTPNZfN/iaJnCpCoDuAQFG3sR7f0p+dOws1R+LCrXaun53l0uUzhKy
 hs4kIv3Kncm9erQdBh6IaiFAuH6hOIlzrfDX4KLE4+0Sum0V/V/ealwfl0MWxIrU
 914LaP5zC363JAE1Q3NkDLN6WFvsF1WqhqVQ+U8WgxymUImml3W/aEFCtJbNbYf8
 pwfFcU0MApl5xl59nhnFmhAfpqfgoHHS4VhG/iIQUHw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=TdE1Hr
 DFz4yrNizninaJxR7gmC9gTaFncKtkMVs1KSQ=; b=MaP+HVk2tQR18gxuXhl4Rv
 ioQSs6EqEOI5WXmwPiy3seNpxm8bxZXHxy8L1YscTlivu8HGttPohrDaxDc7jufN
 Ga3gr15u3Y6Ar7TW9yr5rQLOVzTDZRziink+62rJgJsntxQV0lkmiELqw++mNQ8v
 gJqcYKenAO8Tro00L21gwltgj+I4x9s/2g9N/Ih2404xl04AnMlhP+5hpmryI2Z1
 YUj2pcvmau5oZe2b7Ys49KMW2R2755rokLKEHNGjuXk1WJhu3hK7GL21FQ5E2LAM
 RowS0csLFfIOm3P8q1WnCWvuHhdodD++CCtjGbW2FFpObPuWKyKGbNaHFyi7k+FQ
 ==
X-ME-Sender: <xms:PWGLXjfWVngoYDf7nOgYv5BuY40_hczK54z9eqTpU3VhPl4CmCjeug>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrudefgddutddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecukfhppeeltd
 drkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghi
 lhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:PWGLXvQu3bInMbfXLhz-yMshc8UlApTdGf43Dz-yN3eICmYiEGYAOA>
 <xmx:PWGLXvyW1UFY2XXL8AaCFxmhWC8MJEJBmwWFbao1qqL_sQU61kOTKA>
 <xmx:PWGLXtFIjtXFWdt4bmDHkIqElyGp8KYvGk2MMchHbsA2m508x5Gq6g>
 <xmx:PmGLXrQ0HwmNAXtSPPr2179qcgVdzD9UUhKFl0LvPyFQ72wtdDcZvg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id E9EBF328005E;
 Mon,  6 Apr 2020 13:05:00 -0400 (EDT)
Date: Mon, 6 Apr 2020 19:04:59 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH/RFC 2/6] dt-bindings: display: bridge: renesas,dw-hdmi:
 Convert binding to YAML
Message-ID: <20200406170459.wwfxtsuvjuhlcyoe@gilmour.lan>
References: <20200405233935.27599-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200405233935.27599-3-laurent.pinchart+renesas@ideasonboard.com>
 <20200406075705.a67tjx7jamdvqpl3@gilmour.lan>
 <20200406112856.GE4757@pendragon.ideasonboard.com>
 <20200406113247.GF4757@pendragon.ideasonboard.com>
MIME-Version: 1.0
In-Reply-To: <20200406113247.GF4757@pendragon.ideasonboard.com>
X-Mailman-Approved-At: Tue, 07 Apr 2020 08:09:32 +0000
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
Cc: devicetree@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Sandy Huang <hjc@rock-chips.com>, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Yao <mark.yao@rock-chips.com>
Content-Type: multipart/mixed; boundary="===============0624305144=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0624305144==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jjly33wr43te7soq"
Content-Disposition: inline


--jjly33wr43te7soq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 06, 2020 at 02:32:47PM +0300, Laurent Pinchart wrote:
> > > > +
> > > > +  clock-names:
> > > > +    items:
> > > > +      - const: iahb
> > > > +      - const: isfr
> > > > +
> > > > +  interrupts: true
> > > > +
> > > > +  ports:
> > > > +    type: object
> > > > +    description: |
> > > > +      This device has three video ports. Their connections are modelled using the
> > > > +      OF graph bindings specified in Documentation/devicetree/bindings/graph.txt.
> > > > +      Each port shall have a single endpoint.
> > > > +
> > > > +    properties:
> > > > +      '#address-cells':
> > > > +        const: 1
> > > > +
> > > > +      '#size-cells':
> > > > +        const: 0
> > > > +
> > > > +      port@0:
> > > > +        type: object
> > > > +        description: Parallel RGB input port
> > > > +
> > > > +      port@1:
> > > > +        type: object
> > > > +        description: HDMI output port
> > > > +
> > > > +      port@2:
> > > > +        type: object
> > > > +        description: Sound input port
> > > > +
> > > > +    required:
> > > > +      - port@0
> > > > +      - port@1
> > > > +      - port@2
> > > > +
> > > > +    additionalProperties: false
>
> Would it also make sense to use unevaluatedProperties here, and drop
> #address-cells and #size-cells above as they're already evaluated in
> synopsys,dw-hdmi.yaml ?

Yup :)

> > > > +
> > > > +  power-domains:
> > > > +    maxItems: 1
> > > > +
> > > > +required:
> > > > +  - compatible
> > > > +  - reg
> > > > +  - clocks
> > > > +  - clock-names
> > > > +  - interrupts
> > > > +  - ports
> > > > +
> > > > +additionalProperties: false
> > >
> > > In the case where you have some kind of generic schema and then a more
> > > specific one like you have here, unevaluatedProperties make more sense
> > > that additionalProperties.
> > >
> > > additionalProperties checks that there are no extra properties on the
> > > current schema, which is a problem here since you have to duplicate
> > > the entire list of properties found in the generic schema, while
> > > unevaluatedProperties checks that there are no extra properties in the
> > > entire set of all schemas that apply to this node.
> > >
> > > This way, you can just put what is different from the generic schema,
> > > and you don't have to keep it in sync.
> > >
> > > It's a feature that has been added in the spec of the schemas that
> > > went on right after the one we support in the tools, so for now the
> > > kernel meta-schemas only allows that property to be there (just like
> > > deprecated) but won't do anything.
> > >
> > > This should be fixed quite soon however, the library we depend on
> > > has started to work on that spec apparently.
> >
> > Should I postpone this series until support for unevaluatedProperties is
> > available, to be able to test this ?
>
> Also, to make sure I understand this correctly, does it mean I can drop
> "reg: true" and "interrupts: true" ?

Ditto :)

Maxime

--jjly33wr43te7soq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXothOwAKCRDj7w1vZxhR
xfGKAP4s6mB0LoyQBJnjI1zv86BbMfARna9rT67dl0wWydot3gD/btht1OMEjHzO
c5B0gD7fVvyOgVGCkCLDa3NAQnb/tw8=
=uhCv
-----END PGP SIGNATURE-----

--jjly33wr43te7soq--

--===============0624305144==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0624305144==--
