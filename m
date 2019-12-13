Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 81BC011F246
	for <lists+dri-devel@lfdr.de>; Sat, 14 Dec 2019 15:44:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8324E6E392;
	Sat, 14 Dec 2019 14:43:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0885C6E44A
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 10:42:27 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 75F6E5DBA;
 Fri, 13 Dec 2019 05:42:25 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Fri, 13 Dec 2019 05:42:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=vgk7FL9HE/DhoT+VdhEoE7vu/ra
 uoTEyo8weCVOH8SA=; b=RpFkaa9J+pcmp6q042NfBbI+t4NPy44WfK7eZAubKAs
 ZKmfz+/gQwdfw1VGjcCP+TdJtLpuWqWnNnhhbKHE2CH3XRisIvVteygfQ57kgJIh
 5Z41vC5AaG/c0m6i2kvDEKdKH2AryU2VlZDn9Tp5wgzGHu0/qYBnWgaS8JPryXju
 UbWLNXvcYi6Oj6GdPr61Q1gpdYMHe7o4Zht6oWpo+zpjLNAkBCvV6QaIpL2Snz91
 XN2ZptryfOMVfuOpgtbXYoIbXMihPb0jGhEaCB7x9IwFt0evCzXkhg+0DFjubWe7
 dR0EGJUd0AHegkEHACR6ir4Ti5qUmRoK0mDxFMzIxSA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=vgk7FL
 9HE/DhoT+VdhEoE7vu/rauoTEyo8weCVOH8SA=; b=QbEiOiTNPE4vD8e/j0D6Xz
 hHkAJO9PuQOnrlRvK0TlELR1Obr+MrBiuuswLxi7Q3mS8oN/vNVAYtWU9Oq7h3Yv
 Yjmxk4cvIjlZugr4tv0TeRqVxbeR+eUdshIWKLJq6B3l0b/epJTZLEnnCbNo8jQv
 +r5b4Qzh0yb4K4c07DS2cYxLqx1TXi7LDs8CxvBcbJ64NNYHJGlKXMOAnIOpp+YJ
 hrjk+lSxeylKsjso+5EAs515iBCaOCERQHOhBd8/hYgpwkhL+4qZVmaIjv72/UKa
 5wqVWweRSSQ+vIS/1xKtttFZXsgccfp2L/Gdf9mngF7wEDEoIwERndy7ZMbjTxLg
 ==
X-ME-Sender: <xms:EGvzXaWsPeAoZSrolyzvTW9LlB-g28VteYOcfsoU5i36WZ1vL3LUpw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudelledgudelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuffhomhgrih
 hnpeguvghvihgtvghtrhgvvgdrohhrghenucfkphepledtrdekledrieekrdejieenucfr
 rghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthhenucevlh
 hushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:EGvzXZLVgHDuGQlZli344liZwYvtfwgs-eiRQu2IdBbpEuf_EENilw>
 <xmx:EGvzXVjism9prFcsHIdmqepdKm3Dnqcevmf2NqkpaIDFrKsDkm4DNA>
 <xmx:EGvzXZk1lj4Xasztv1_-P3ol-owH8fF-NI_OA7SHt3KUCpt2hVa85w>
 <xmx:EWvzXZiSmSwJzI-7t7-Mit9M7DaCXnPWb3Vi_3NGoSes6QqBt6GP0A>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 98B163060158;
 Fri, 13 Dec 2019 05:42:24 -0500 (EST)
Date: Fri, 13 Dec 2019 11:42:23 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Jyri Sarha <jsarha@ti.com>
Subject: Re: [PATCH v3 1/5] dt-bindings: display: ti, k2g-dss: Add dt-schema
 yaml binding
Message-ID: <20191213104223.u55zlm2zwpgarvil@gilmour.lan>
References: <cover.1576158368.git.jsarha@ti.com>
 <7c2e386d48cf0c8b932804f24e3f6ea81fe3d3a3.1576158368.git.jsarha@ti.com>
MIME-Version: 1.0
In-Reply-To: <7c2e386d48cf0c8b932804f24e3f6ea81fe3d3a3.1576158368.git.jsarha@ti.com>
X-Mailman-Approved-At: Sat, 14 Dec 2019 14:42:54 +0000
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
Cc: devicetree@vger.kernel.org, yamonkar@cadence.com, praneeth@ti.com,
 tomi.valkeinen@ti.com, subhajit_paul@ti.com, dri-devel@lists.freedesktop.org,
 peter.ujfalusi@ti.com, robh+dt@kernel.org, laurent.pinchart@ideasonboard.com,
 sjakhade@cadence.com, sam@ravnborg.org
Content-Type: multipart/mixed; boundary="===============1052170838=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1052170838==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="h7rjevoyojpmg3m3"
Content-Disposition: inline


--h7rjevoyojpmg3m3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Thu, Dec 12, 2019 at 03:51:57PM +0200, Jyri Sarha wrote:
> Add dt-schema yaml bindig for K2G DSS, an ultra-light version of TI
> Keystone Display SubSystem.
>
> Version history:
>
> v2: no change
>
> v3: - Add ports node
>     - Add includes to dts example
>     - reindent dts example
>
> Signed-off-by: Jyri Sarha <jsarha@ti.com>
> ---
>  .../bindings/display/ti/ti,k2g-dss.yaml       | 118 ++++++++++++++++++
>  1 file changed, 118 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/ti/ti,k2g-dss.yaml
>
> diff --git a/Documentation/devicetree/bindings/display/ti/ti,k2g-dss.yaml b/Documentation/devicetree/bindings/display/ti/ti,k2g-dss.yaml
> new file mode 100644
> index 000000000000..90158e8b6aad
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/ti/ti,k2g-dss.yaml
> @@ -0,0 +1,118 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +# Copyright 2019 Texas Instruments Incorporated
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/display/ti/ti,k2g-dss.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Texas Instruments K2G Display Subsystem
> +
> +maintainers:
> +  - Jyri Sarha <jsarha@ti.com>
> +  - Tomi Valkeinen <tomi.valkeinen@ti.com>
> +
> +description: |
> +  The K2G DSS is an ultra-light version of TI Keystone Display
> +  SubSystem. It has only one output port and video plane. The
> +  output is DPI.
> +
> +properties:
> +  compatible:
> +    const: ti,k2g-dss
> +
> +  reg:
> +    maxItems: 5
> +    minItems: 5

When they are equal, you need only one of the two, the tools will add
the other.

Also, adding a description of what those registers are supposed to be
would be great.

> +
> +  reg-names:
> +    items:
> +      - const: cfg
> +      - const: common
> +      - const: vid1
> +      - const: ovr1
> +      - const: vp1
> +
> +  clocks:
> +    maxItems: 2
> +    minItems: 2

Ditto

> +
> +  clock-names:
> +    items:
> +      - const: fck
> +      - const: vp1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  power-domains:
> +    maxItems: 1
> +    description: phandle to the associated power domain
> +
> +  ports:
> +    type: object
> +    description:
> +      Ports as described in Documentation/devictree/bindings/graph.txt
> +    properties:
> +      "#address-cells":
> +        const: 1
> +
> +      "#size-cells":
> +        const: 0
> +
> +      port@0:
> +        type: object
> +        description:
> +          The DSS DPI output port node

If there's only one port, why do you need ports in the first place?

Thanks!
Maxime

--h7rjevoyojpmg3m3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXfNrDwAKCRDj7w1vZxhR
xXoAAP4+hx3XYi8AsAWRYJersbx7MZ2tEkHeK0WLriGTWXJ5fwEAyV7WaqLUhkzn
qbrivmLoR+AKdYiDgIO+USQn229uMwE=
=vNap
-----END PGP SIGNATURE-----

--h7rjevoyojpmg3m3--

--===============1052170838==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1052170838==--
