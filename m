Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C534387B2C
	for <lists+dri-devel@lfdr.de>; Tue, 18 May 2021 16:33:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 251796E892;
	Tue, 18 May 2021 14:33:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51CA46EB93
 for <dri-devel@lists.freedesktop.org>; Tue, 18 May 2021 14:33:21 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 3F3595C010D;
 Tue, 18 May 2021 10:33:20 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Tue, 18 May 2021 10:33:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=FrUlgAZl7XLF/3clrgjCszNAYAE
 2HNQnZkoVBplSGys=; b=RkFFFVyfCIPjwlkOtCpqAs51p6nq80tP17M0UeQUFwB
 grcoeKLK4Vwj+CaKRnFeizXv0cRdkb16lcu9405CJQgV7d70irbMBOJIwsFK+8Sh
 St5XhdSQSQpPtsxTS3jmrkyJk6WLx6KpkFEcWr8ZpLjZwqjARtaL8DqSBqJI8eVg
 ctsB2pzJZ8pjGW8mVwAzGihab7WKYPj3S6wfKt0rZaC0sAuuyzXOefx69NGSj62/
 wxVq4sTU5jE3buERtY9klKVeHfaSUznL0t0OJSYv9WG4J1taF8EhB0jVCpebMEZK
 WdPcdwIfkA/X7VqTGxrJzA5xrJHuT4/hqA2bn7QULDg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=FrUlgA
 Zl7XLF/3clrgjCszNAYAE2HNQnZkoVBplSGys=; b=vjx/fru3+ejYVBBLlS5Ict
 M5bjK1Vnr1peBf+W13+s/dloQABSZ5i2l13qY5Fcei4eJc+DBsDjZ+kdJhRqZEA0
 huR6avdIJjWcBWNUXv47nzh3MmTcjIFt9N2EbHQ1nl0HBCFa+EJHwOermOMkBYZL
 mN1q5TLmnuQFtqP/4kQj/cGU3n9xa6YY0XIkUNpdEWqGLEyevfepFBgyaW/m2kBQ
 kwopJPh1Qd24RWLvccmSkL25azpfuBOft/XgSI5azFW3i7V5vo5ktA86qZ0PSZqF
 U9CbNHQddwseO+RjsDPdSMBgaCbWmWbt5aL9gFxeSToojEDEVu9VpCbgq+EmPhZA
 ==
X-ME-Sender: <xms:L9CjYATTInJz7SQIWSj7qKp1VibfS-rZFU4hiQO3MxlpiUdbgtXBxw>
 <xme:L9CjYNyMDyqK7padAbYdtmLZBLscFULQx_9IhaoA89Psg9gOFOO6ilBxA6FErO3cu
 WqLKJ_gspCTViVLKzQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdeijedgjeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepffetteevieejteeuhfffgeektefghfeileehhedtuddutefhhfejtddvtddu
 ledvnecuffhomhgrihhnpeguvghvihgtvghtrhgvvgdrohhrghenucfkphepledtrdekle
 drieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhr
 ohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:L9CjYN35XHtoasd8zhtD8d26Qy61Moq1RYn4LMma7wnSrTnuOmkipQ>
 <xmx:L9CjYEBdslF4wPP7R6KVaxzdtcUITD5sYrkcI85K8zvWAHxr9AeKhQ>
 <xmx:L9CjYJj4_LuMW593oa1lPb1FyVHJkmSDsTsgubAzPlc-2LK5azsSfg>
 <xmx:MNCjYJfSKQDIdTXfmnonDZdmFCKx2g4JZBk7Ju9q64shVIMWe535DA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Tue, 18 May 2021 10:33:18 -0400 (EDT)
Date: Tue, 18 May 2021 16:33:17 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] dt-bindings: display: ssd1307fb: Convert to json-schema
Message-ID: <20210518143317.yy2sxxnd7yt6cyrx@gilmour>
References: <20210518075131.1463091-1-geert@linux-m68k.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="p7d7m3hcldjdfnrs"
Content-Disposition: inline
In-Reply-To: <20210518075131.1463091-1-geert@linux-m68k.org>
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--p7d7m3hcldjdfnrs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi

On Tue, May 18, 2021 at 09:51:31AM +0200, Geert Uytterhoeven wrote:
> Convert the Solomon SSD1307 Framebuffer Device Tree binding
> documentation to json-schema.
>=20
> Fix the spelling of the "pwms" property.
> Document default values.
> Make properties with default values not required.
>=20
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
> I have listed Maxime as the maintainer, as he wrote the original driver
> and bindings.  Maxime: Please scream if this is inappropriate ;-)

Fine by me :)

> ---
>  .../bindings/display/solomon,ssd1307fb.yaml   | 166 ++++++++++++++++++
>  .../devicetree/bindings/display/ssd1307fb.txt |  60 -------
>  2 files changed, 166 insertions(+), 60 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/solomon,ssd=
1307fb.yaml
>  delete mode 100644 Documentation/devicetree/bindings/display/ssd1307fb.t=
xt
>=20
> diff --git a/Documentation/devicetree/bindings/display/solomon,ssd1307fb.=
yaml b/Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml
> new file mode 100644
> index 0000000000000000..bd632d86a4f814a0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml
> @@ -0,0 +1,166 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/solomon,ssd1307fb.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Solomon SSD1307 OLED Controller Framebuffer
> +
> +maintainers:
> +  - Maxime Ripard <mripard@kernel.org>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - solomon,ssd1305fb-i2c
> +      - solomon,ssd1306fb-i2c
> +      - solomon,ssd1307fb-i2c
> +      - solomon,ssd1309fb-i2c
> +
> +  reg:
> +    maxItems: 1
> +
> +  pwms:
> +    maxItems: 1
> +
> +  reset-gpios:
> +    maxItems: 1
> +
> +  vbat-supply:
> +    description: The supply for VBAT
> +
> +  solomon,height:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    default: 16
> +    description:
> +      Height in pixel of the screen driven by the controller
> +
> +  solomon,width:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    default: 96
> +    description:
> +      Width in pixel of the screen driven by the controller
> +
> +  solomon,page-offset:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    default: 1
> +    description:
> +      Offset of pages (band of 8 pixels) that the screen is mapped to
> +
> +  solomon,segment-no-remap:
> +    type: boolean
> +    description:
> +      Display needs normal (non-inverted) data column to segment mapping
> +
> +  solomon,col-offset:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    default: 0
> +    description:
> +      Offset of columns (COL/SEG) that the screen is mapped to
> +
> +  solomon,com-seq:
> +    type: boolean
> +    description:
> +      Display uses sequential COM pin configuration
> +
> +  solomon,com-lrremap:
> +    type: boolean
> +    description:
> +      Display uses left-right COM pin remap
> +
> +  solomon,com-invdir:
> +    type: boolean
> +    description:
> +      Display uses inverted COM pin scan direction
> +
> +  solomon,com-offset:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    default: 0
> +    description:
> +      Number of the COM pin wired to the first display line
> +
> +  solomon,prechargep1:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    default: 2
> +    description:
> +      Length of deselect period (phase 1) in clock cycles
> +
> +  solomon,prechargep2:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    default: 2
> +    description:
> +      Length of precharge period (phase 2) in clock cycles.  This needs =
to be
> +      the higher, the higher the capacitance of the OLED's pixels is.
> +
> +  solomon,dclk-div:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 1
> +    maximum: 16
> +    description:
> +      Clock divisor. The default value is controller-dependent.

I guess we could document the default using an if / else statement?
Looks good otherwise :)

Maxime

--p7d7m3hcldjdfnrs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYKPQLAAKCRDj7w1vZxhR
xeKaAQDmjvKNJwaVYfTQjl3b/T04NM9NVNFImz1x2uj7ftswHQD8DfD+L8sbH09v
yeZEUShSYKCHK9VStSHw0JPqy0oSeQ8=
=jitB
-----END PGP SIGNATURE-----

--p7d7m3hcldjdfnrs--
