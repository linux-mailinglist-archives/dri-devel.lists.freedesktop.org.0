Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A11E1292F7
	for <lists+dri-devel@lfdr.de>; Mon, 23 Dec 2019 09:14:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34F116E573;
	Mon, 23 Dec 2019 08:14:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2D0F6E07B
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2019 07:45:49 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id A5D916662;
 Fri, 20 Dec 2019 02:45:45 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Fri, 20 Dec 2019 02:45:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=IernsQDish/tY0fKm35BITr1oVw
 IrtJ2huVtA+lAAII=; b=Hg9dNTefPxrRFhFJ7/0oUiZL6B4ocQSvTjiEVlQpMyk
 EIjn9yLUKda5vGMynmFHdu2X2i/gp7SBl/xGG6bDPgH6BmY46/IEarofgmxehViK
 zTCZOawJbYOj8Jg+XHEFYBh7rf+WEljwfaynw9+DnKs192p/avjStagYZDO/JUts
 Wvri5vUPP+1OyFA0yaqXVtx/YgKRfbcLia/1QVLqd1TL9SaN/y77JH5wYK6wbWKz
 iBQLhmjGUbAf9CzEOtUJhTfkBaHzMpfyIm8txmS6adGdfcyB1UYPnk5Z32bCVds5
 W066SqyxEgL0nhCaaqzZ5HLHXSEsD3uK5SXnvMnK3Jw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=IernsQ
 Dish/tY0fKm35BITr1oVwIrtJ2huVtA+lAAII=; b=Js7NxNuNEGi8SGQaWMKYFk
 T7Rb3OfZda/GoAZkf3N7AcdAhXNF8bsEuKQSeOzbCoA/ajB9Nvxzx1nMGT+FH/a4
 et2AGMLDkKNtIVfO6oEk7SPeigsfI42GRa41/ZQx1FpE74X8cy6oZNHsIOoeei/5
 ry10PxuT8UVq4iVMXr96s/rZwgYShuUHJS0eM9/A1NAw/XDmpMSUMStZ7NQNII+E
 OwzVKzhTbshZ66/ugAuxjFvCD4k9efQ2y737gwsFEGDwAB8jpkLJYHT34nAhwf9q
 soRcMhWleGuKzKZXxRuSWg0u5d27eVDPoVLtVKRYxJfOYk1A7FFkmijMRc6Fq9Hg
 ==
X-ME-Sender: <xms:KHz8XcQ9Wzvi-Mi3QDBZb7PGLgHuBtiXinkVi-4WicdPDu_2unOTYw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvdduvddguddtkecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucffohhmrg
 hinhepuggvvhhitggvthhrvggvrdhorhhgnecukfhppeeltddrkeelrdeikedrjeeinecu
 rfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghhnecuve
 hluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:KHz8Xd6Kqfr7snzeQ_H2Fi37n3PHftUjvD5edtn-kHZAO4dnV2AumA>
 <xmx:KHz8XeXyfMrwDB11jp0_oumgeYD3VhcRPNl_nISlT-nuFuDPwR7nyQ>
 <xmx:KHz8XQsGXJhNFN08aUmphTpo_f3HP_tOVvSVnOrr_4NNul0Lm6M4fA>
 <xmx:KXz8XSwJRpIMKTywUxiLKJXr8l8J0nQdMDOY2Fe-yqKeyU4o25saQA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 3B4B480059;
 Fri, 20 Dec 2019 02:45:44 -0500 (EST)
Date: Fri, 20 Dec 2019 08:45:42 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Jyri Sarha <jsarha@ti.com>
Subject: Re: [PATCH v4 3/5] dt-bindings: display: ti, j721e-dss: Add dt-schema
 yaml binding
Message-ID: <20191220074542.x7czuhefup3xmujp@gilmour.lan>
References: <cover.1576704528.git.jsarha@ti.com>
 <89db418c91689beb6e63e0c3c99b39655948b429.1576704528.git.jsarha@ti.com>
 <20191219083839.lmuhxynbbqy4d4hp@gilmour.lan>
 <2acd648f-6532-c7d8-c9d0-f4c5229c7923@ti.com>
MIME-Version: 1.0
In-Reply-To: <2acd648f-6532-c7d8-c9d0-f4c5229c7923@ti.com>
X-Mailman-Approved-At: Mon, 23 Dec 2019 08:10:46 +0000
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
 sjakhade@cadence.com, dri-devel@lists.freedesktop.org, peter.ujfalusi@ti.com,
 robh+dt@kernel.org, tomi.valkeinen@ti.com, laurent.pinchart@ideasonboard.com,
 subhajit_paul@ti.com, sam@ravnborg.org
Content-Type: multipart/mixed; boundary="===============0879696846=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0879696846==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="m6jygddtlvecxjhx"
Content-Disposition: inline


--m6jygddtlvecxjhx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Thu, Dec 19, 2019 at 04:01:58PM +0200, Jyri Sarha wrote:
> On 19/12/2019 10:38, Maxime Ripard wrote:
> > On Thu, Dec 19, 2019 at 10:23:17AM +0200, Jyri Sarha wrote:
> >> Add dt-schema yaml bindig for J721E DSS, J721E version TI Keystone
> >> Display SubSystem.
> >>
> >> Version history:
> >>
> >> v2: no change
> >>
> >> v3: - reg-names: "wp" -> "wb"
> >>     - Add ports node
> >>     - Add includes to dts example
> >>     - reindent dts example
> >>
> >> v4: - Add descriptions to reg, clocks, and interrups properties
> >>     - Remove minItems when its value is the same as maxItems value
> >>
> >> Signed-off-by: Jyri Sarha <jsarha@ti.com>
> >> ---
> >>  .../bindings/display/ti/ti,j721e-dss.yaml     | 209 ++++++++++++++++++
> >>  1 file changed, 209 insertions(+)
> >>  create mode 100644 Documentation/devicetree/bindings/display/ti/ti,j721e-dss.yaml
> >>
> >> diff --git a/Documentation/devicetree/bindings/display/ti/ti,j721e-dss.yaml b/Documentation/devicetree/bindings/display/ti/ti,j721e-dss.yaml
> >> new file mode 100644
> >> index 000000000000..cd68c4294f9a
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/display/ti/ti,j721e-dss.yaml
> >> @@ -0,0 +1,209 @@
> >> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> >> +# Copyright 2019 Texas Instruments Incorporated
> >> +%YAML 1.2
> >> +---
> >> +$id: "http://devicetree.org/schemas/display/ti/ti,j721e-dss.yaml#"
> >> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> >> +
> >> +title: Texas Instruments J721E Display Subsystem
> >> +
> >> +maintainers:
> >> +  - Jyri Sarha <jsarha@ti.com>
> >> +  - Tomi Valkeinen <tomi.valkeinen@ti.com>
> >> +
> >> +description: |
> >> +  The J721E TI Keystone Display SubSystem with four output ports and
> >> +  four video planes. There is two full video planes and two "lite
> >> +  planes" without scaling support. The video ports can be connected to
> >> +  the SoC's DPI pins or to integrated display bridges on the SoC.
> >> +
> >> +properties:
> >> +  compatible:
> >> +    const: ti,j721e-dss
> >> +
> >> +  reg:
> >> +    maxItems: 17
> >> +    description: |
> >> +      Addresses to each DSS memory region described in the SoC's TRM.
> >> +      The reg-names refer to memory regions as follows:
> >> +      reg-names: Region Name in TRM:     Description:
> >> +      common_m   DSS0_DISPC_0_COMMON_M   DSS Master common register area
> >> +      common_s0  DSS0_DISPC_0_COMMON_SO  DSS Shared common register area 0
> >> +      common_s1  DSS0_DISPC_0_COMMON_S1  DSS Shared common register area 1
> >> +      common_s2  DSS0_DISPC_0_COMMON_S2  DSS Shared common register area 2
> >> +      vidl1      DSS0_VIDL1              VIDL1 light video plane 1
> >> +      vidl2      DSS0_VIDL2              VIDL2 light video plane 2
> >> +      vid1       DSS0_VID1               VID1 video plane 1
> >> +      vid2       DSS0_VID2               VID1 video plane 2
> >> +      ovr1       DSS0_OVR1               OVR1 overlay manager for vp1
> >> +      ovr2       DSS0_OVR2               OVR2 overlay manager for vp2
> >> +      ovr3       DSS0_OVR3               OVR1 overlay manager for vp3
> >> +      ovr4       DSS0_OVR4               OVR2 overlay manager for vp4
> >> +      vp1        DSS0_VP1                VP1 video port 1
> >> +      vp2        DSS0_VP2                VP1 video port 2
> >> +      vp3        DSS0_VP3                VP1 video port 3
> >> +      vp4        DSS0_VP4                VP1 video port 4
> >> +      wp         DSS0_WB                 Write Back registers
> >
> > I guess it applies to all your schemas in that patch series, but you
> > could just do something like
> >
> > reg:
> >   items:
> >     - description: DSS Master common register area
> >     - description: DSS Shared common register area 0
> >     - description: DSS Shared common register area 1
> >
>
> Ok, thanks. I was not sure if you can do that (still a newbie with
> yaml). What do you think about Peter Ujfalusi's suggestion of putting
> the descriptions to reg-names (and clock-names and  interrupt-names)?
> e.g. something like this:
>
>   reg-names:
>     items:
>       - const: common_m
>       - description: DSS Master common register area
>       - const: common_s0
>       - description: DSS Master common register area

No, you can't really intertwin them like this, this would mean that
you would expect twice the number of items.

You could do something like this:
reg-names:
  items:
    - const: common_m
      description: DSS Master common register area
    - const: common_s0
      description: DSS Master common register area

But on a more fundamental level, the register area is stored under
regs, while reg-names is just a label for that area, so having the
description under reg, and the labels under reg-names makes more sense
(well, to me at least :))

Maxiem

--m6jygddtlvecxjhx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXfx8JgAKCRDj7w1vZxhR
xR53AQDNPULr/AXZ/AaAZP0f7WH6pDb2CP3Iz6tXFoTQSOP37gD+PCEqh9OCtiun
rg1q2pzSB/RjPdqP7AAv6jmJnqFcSAo=
=t4NP
-----END PGP SIGNATURE-----

--m6jygddtlvecxjhx--

--===============0879696846==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0879696846==--
