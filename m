Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22B651A08F1
	for <lists+dri-devel@lfdr.de>; Tue,  7 Apr 2020 10:09:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E9386E59B;
	Tue,  7 Apr 2020 08:09:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C06296E2D5
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Apr 2020 07:57:09 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 4D5705C00FF;
 Mon,  6 Apr 2020 03:57:08 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 06 Apr 2020 03:57:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=uipbJ06evO1VWcERbTQwcDSZSz6
 wiDJ3u9oVtH6H1PU=; b=mT9xqArbayew8An+Cs02objwfBKX0A3SEjcLnFiwWSx
 2Vpezay7VUkviAttp0sWMo8hsn2Fr+f5zQavI4Y182ChEp20OPUyqjAHyJCmHePo
 2PI7kfl1L+xlOonMNOV1vR362ntNzsrdFxom8NskVlnqmxIfbslg8qZ/Bgu479jf
 uHvyI9vSE/u7gxYXcRRRhk3NObUsofRUH8c4DSTon0J1t7wCI+6nlXkXqKWi4EsD
 FMKxC9+exWF6dmUWX5j7dPWZg8Ot8weHt94QX0lNVJndnmfaJTvB2ELGzS7A4Dd6
 Rz1ZmZfHX3HWkHB0fxsXQI72JSN+AM291zvpHlRWD7w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=uipbJ0
 6evO1VWcERbTQwcDSZSz6wiDJ3u9oVtH6H1PU=; b=dbgXULK36Ts/4nbbv39hh+
 Wp+zH9pBB0t9uI96NisCvIW0H5phaJNCfeMXzljhseKWfdoc3ofrRgujTfP6/U3a
 dUyX5/2IeBmxSha2/P1GW7KMJxZbNmCADt2EkktQOqzXeFhjVzmGXbt6xWgHjeeB
 Sq6QxhLKMEgPr5aP1Kj7Gk1kREGnxIfEivxyhviC+m04U7la2lkcIjI7wewlWHM/
 MLUvR0waAcf7at1uyea863H1pUXVusu/xHXnN72qK1YJX+qucXpsJeZtzNqh2NmL
 vHxCk6rDYp6rCeAo4Q8tKuE9/LBBuTCC/eqvKWn14gHxh+KUUuoK0d5XV/5dkt0w
 ==
X-ME-Sender: <xms:0-CKXqyZS1uq9tB4EIF-z6sIQF0H8Tr602hG1O9GHxtJ1Y5X3gK6OA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedruddvgdduvdekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuffhomhgrih
 hnpeguvghvihgtvghtrhgvvgdrohhrghenucfkphepledtrdekledrieekrdejieenucev
 lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvg
 estggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:0-CKXinje1_O4nld6RCD7ADbKivt2B2_s-9O-_fxEPDM0nmtFDI7Uw>
 <xmx:0-CKXvGXofwMRxqyckoVWC8_mLBKiQuOCwaW7l1OrHOPoA5x2kdayg>
 <xmx:0-CKXiXXD6gdtAJvWmDHCeWVacga9oOOOT8Yz-UqZP5XULn4lspZwQ>
 <xmx:1OCKXrKsIZxPsIBDELT6U89HaNwRp7_EYOOJDpnsmlVghpBt2sIyxA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id C7DC9328005D;
 Mon,  6 Apr 2020 03:57:06 -0400 (EDT)
Date: Mon, 6 Apr 2020 09:57:05 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH/RFC 2/6] dt-bindings: display: bridge: renesas,dw-hdmi:
 Convert binding to YAML
Message-ID: <20200406075705.a67tjx7jamdvqpl3@gilmour.lan>
References: <20200405233935.27599-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200405233935.27599-3-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
In-Reply-To: <20200405233935.27599-3-laurent.pinchart+renesas@ideasonboard.com>
X-Mailman-Approved-At: Tue, 07 Apr 2020 08:09:31 +0000
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
Cc: devicetree@vger.kernel.org, Sandy Huang <hjc@rock-chips.com>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
 Mark Yao <mark.yao@rock-chips.com>
Content-Type: multipart/mixed; boundary="===============1371709643=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1371709643==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="r46jetkjwl7c5lrh"
Content-Disposition: inline


--r46jetkjwl7c5lrh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Mon, Apr 06, 2020 at 02:39:31AM +0300, Laurent Pinchart wrote:
> diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.yaml b/Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.yaml
> new file mode 100644
> index 000000000000..9a543740c81d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.yaml
> @@ -0,0 +1,142 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/bridge/renesas,dw-hdmi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas R-Car DWC HDMI TX Encoder
> +
> +maintainers:
> +  - Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> +
> +description: |
> +  The HDMI transmitter is a Synopsys DesignWare HDMI 1.4 TX controller IP
> +  with a companion PHY IP.
> +
> +allOf:
> +  - $ref: synopsys,dw-hdmi.yaml#
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +        - renesas,r8a774a1-hdmi # for R8A774A1 (RZ/G2M) compatible HDMI TX
> +        - renesas,r8a774b1-hdmi # for R8A774B1 (RZ/G2N) compatible HDMI TX
> +        - renesas,r8a7795-hdmi # for R8A7795 (R-Car H3) compatible HDMI TX
> +        - renesas,r8a7796-hdmi # for R8A7796 (R-Car M3-W) compatible HDMI TX
> +        - renesas,r8a77965-hdmi # for R8A77965 (R-Car M3-N) compatible HDMI TX
> +      - const: renesas,rcar-gen3-hdmi
> +
> +  reg: true
> +
> +  reg-io-width:
> +    const: 1
> +
> +  clocks:
> +    minItems: 2
> +    maxItems: 2

You don't need both, if one is missing the other will be filled by the
dt-schema tools. In this particular case, I guess maxItems would make
more sense.

> +
> +  clock-names:
> +    items:
> +      - const: iahb
> +      - const: isfr
> +
> +  interrupts: true
> +
> +  ports:
> +    type: object
> +    description: |
> +      This device has three video ports. Their connections are modelled using the
> +      OF graph bindings specified in Documentation/devicetree/bindings/graph.txt.
> +      Each port shall have a single endpoint.
> +
> +    properties:
> +      '#address-cells':
> +        const: 1
> +
> +      '#size-cells':
> +        const: 0
> +
> +      port@0:
> +        type: object
> +        description: Parallel RGB input port
> +
> +      port@1:
> +        type: object
> +        description: HDMI output port
> +
> +      port@2:
> +        type: object
> +        description: Sound input port
> +
> +    required:
> +      - port@0
> +      - port@1
> +      - port@2
> +
> +    additionalProperties: false
> +
> +  power-domains:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - interrupts
> +  - ports
> +
> +additionalProperties: false

In the case where you have some kind of generic schema and then a more
specific one like you have here, unevaluatedProperties make more sense
that additionalProperties.

additionalProperties checks that there are no extra properties on the
current schema, which is a problem here since you have to duplicate
the entire list of properties found in the generic schema, while
unevaluatedProperties checks that there are no extra properties in the
entire set of all schemas that apply to this node.

This way, you can just put what is different from the generic schema,
and you don't have to keep it in sync.

It's a feature that has been added in the spec of the schemas that
went on right after the one we support in the tools, so for now the
kernel meta-schemas only allows that property to be there (just like
deprecated) but won't do anything.

This should be fixed quite soon however, the library we depend on
has started to work on that spec apparently.

Maxime

--r46jetkjwl7c5lrh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXorg0QAKCRDj7w1vZxhR
xSn9AQDZooBi+cEuzpY81Mw7K18vMAyT3l83sgKXhjGIk9xvowD7B3lpQdTGblz4
W5wB2hPhkp+cVu9VkpSFh4tpuXYvXAI=
=GFZ5
-----END PGP SIGNATURE-----

--r46jetkjwl7c5lrh--

--===============1371709643==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1371709643==--
