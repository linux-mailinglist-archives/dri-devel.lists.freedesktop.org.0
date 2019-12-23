Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BCE1412A233
	for <lists+dri-devel@lfdr.de>; Tue, 24 Dec 2019 15:30:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B523A6E5D3;
	Tue, 24 Dec 2019 14:30:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 292296E30C
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Dec 2019 17:20:52 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id D264366B0;
 Mon, 23 Dec 2019 12:20:50 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Mon, 23 Dec 2019 12:20:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=3uY4HFDkgTih8k9wjqYyEaZq6ao
 EBWq7EA6Fi+wvbDE=; b=MiE4tafpYSn8TrvHNqOO0UYGazX/xNFKAEQtP4Jqhu6
 2JP7nC+l4y5UJOzOTRgdCs//Ae3JcEnSTipDP8L1NyUyB1Vz2Gf5KNfxtY8W/PpT
 7kWmMRSN9DxtPIzwKg9ghAl2JZE0DaSfP6lVQNjlZH3QbDCe6M+EoWBTo4hWCZAC
 WL6Bgcdpi6fpj9PVckrx3TDyIjv9kBLJwUIV3O5TECIQmhm8QXbiPaOTsXkK/gXE
 6opLg2RT8VHV8xFw2F0YuCDsgPvY9YZ9Fg9hWEFshqxSTW4i4KTsnr4DSVdSoq7U
 QJt57qTD6ajPcehtzgeCh0dDrJbxMeZQyMp5K7rd/6g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=3uY4HF
 DkgTih8k9wjqYyEaZq6aoEBWq7EA6Fi+wvbDE=; b=ZMG9kPX/G5Vi/XyYblME8o
 xVcBEvBTqsGF+R6OX5xvdNAzRsqS7tlw0QEb+xtauxUoPgUosMH5G4PvmAr8kS9S
 W+iECVrttSrSWiSY59t1Pb7E5hz4MjbdVopz1DOaBfSuWR2uYtxq0A42/mIS3crZ
 4z7/NrCOtsqtXNq5zFDvGtqCSBy9xm0GRPCRwEVL4RC1PMYew7hgJgXsnMQMRWgd
 GNrtj7PJ3FTrKklMurlAbwOPbMkwifnsx31biZFBw8TahJ8Gj/X35GAcFtnUAZpZ
 ecUzZEcOCOoPrMl2qAaIFKpzQ82xVtXWmwkz1tAgdMyO+Dn8+fSysk9yAhZh3oSw
 ==
X-ME-Sender: <xms:cPcAXi7TaXAKw_ipbQdcKqRzGBamyoYrmDDHN9VOtvBiiB9RjnL7XA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvddvtddgleekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuffhomhgrih
 hnpeguvghvihgtvghtrhgvvgdrohhrghenucfkphepledtrdduudelrddvtdeirddvtdeg
 necurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghhne
 cuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:cPcAXry9FKRbXT7tTej4r1oyo-TsQ8E7fM1p0cjjltWwOrVCd8PWHQ>
 <xmx:cPcAXuy3c8eTxCKOFG_Hka-RvW_Ki4iGfNHYdr8DAumyKi9YfZOW9w>
 <xmx:cPcAXrUOxADV--HhJoTBcCN0kP_bz3fEpwdoLimZHUHYAk1SK_c9wA>
 <xmx:cvcAXkkLgfxOWLJM5sXM42Va5gjJjTAxthvV2LMiweM5NLwaIpnXPw>
Received: from localhost (lfbn-lyo-1-633-204.w90-119.abo.wanadoo.fr
 [90.119.206.204])
 by mail.messagingengine.com (Postfix) with ESMTPA id A453B3060845;
 Mon, 23 Dec 2019 12:20:48 -0500 (EST)
Date: Mon, 23 Dec 2019 18:22:06 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Yuti Amonkar <yamonkar@cadence.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: drm/bridge: Document Cadence MHDP
 bridge bindings in yaml format
Message-ID: <20191223172206.ojnka2exmcld4nrl@hendrix.home>
References: <1577114202-15970-1-git-send-email-yamonkar@cadence.com>
 <1577114202-15970-2-git-send-email-yamonkar@cadence.com>
MIME-Version: 1.0
In-Reply-To: <1577114202-15970-2-git-send-email-yamonkar@cadence.com>
X-Mailman-Approved-At: Tue, 24 Dec 2019 14:29:55 +0000
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, jernej.skrabec@siol.net,
 praneeth@ti.com, narmstrong@baylibre.com, airlied@linux.ie,
 tomi.valkeinen@ti.com, jonas@kwiboo.se, jsarha@ti.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, Laurent.pinchart@ideasonboard.com, sjakhade@cadence.com,
 mparab@cadence.com
Content-Type: multipart/mixed; boundary="===============0111065219=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0111065219==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="krgpiy72sujxxp5c"
Content-Disposition: inline


--krgpiy72sujxxp5c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Dec 23, 2019 at 04:16:40PM +0100, Yuti Amonkar wrote:
> Document the bindings used for the Cadence MHDP DPI/DP bridge in
> yaml format.
>
> Signed-off-by: Yuti Amonkar <yamonkar@cadence.com>
> ---
>  .../bindings/display/bridge/cdns,mhdp.yaml         | 109 +++++++++++++++++++++
>  1 file changed, 109 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/cdns,mhdp.yaml
>
> diff --git a/Documentation/devicetree/bindings/display/bridge/cdns,mhdp.yaml b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp.yaml
> new file mode 100644
> index 0000000..aed6224
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp.yaml
> @@ -0,0 +1,109 @@
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/display/bridge/cdns,mhdp.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Cadence MHDP bridge
> +
> +maintainers:
> +  - Swapnil Jakhade <sjakhade@cadence.com>
> +  - Yuti Amonkar <yamonkar@cadence.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - cdns,mhdp8546
> +      - ti,j721e-mhdp8546
> +
> +  clocks:
> +    maxItems: 1
> +    description:
> +      DP bridge clock, it's used by the IP to know how to translate a number of
> +      clock cycles into a time (which is used to comply with DP standard timings
> +      and delays).
> +
> +  reg:
> +    minItems: 1
> +    maxItems: 2
> +    items:
> +      - description:
> +          Register block of mhdptx apb registers upto PHY mapped area(AUX_CONFIG_P).
> +          The AUX and PMA registers are mapped to associated phy driver.
> +      - description:
> +          Register block for DSS_EDP0_INTG_CFG_VP registers in case of TI J7 SoCs.
> +
> +  reg-names:
> +    minItems: 1
> +    maxItems: 2
> +    items:
> +      - const: mhdptx
> +      - const: j721e-intg

You should have an if / then clause to validate that the length is the
proper one based on the value of the compatible.

> +  phys:
> +    description: see the Documentation/devicetree/bindings/phy/phy-cadence-torrent.yaml

phys is a generic property, so we shouldn't tie it to one particular
phy. Especially since there's nothing in it that really explain what
this property is supposed to be.

> +  phy-names:
> +    const: dpphy
> +
> +  ports:
> +    type: object
> +    description:
> +      Ports as described in Documentation/devicetree/bindings/graph.txt
> +    properties:
> +       '#address-cells':
> +         const: 1
> +       '#size-cells':
> +         const: 0
> +       port@0:
> +         description:
> +           input port representing the DP bridge input
> +
> +       port@1:
> +         description:
> +           output port representing the DP bridge output
> +    required:
> +      - port@0
> +      - port@1
> +      - '#address-cells'
> +      - '#size-cells'
> +
> +required:
> +  - compatible
> +  - clocks
> +  - reg
> +  - phys
> +  - phy-names
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    mhdp: dp-bridge@f0fb000000 {
> +        compatible = "cdns,mhdp8546";
> +        reg = <0xf0 0xfb000000 0x0 0x1000000>,
> +              <0xf0 0xfc000000 0x0 0x2000000>;

There's two items here, yet you're not using the TI compatible?

Maxime

--krgpiy72sujxxp5c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXgD3vgAKCRDj7w1vZxhR
xUA3AQC/pwICe4jhx/goC8w+guLB6HWSeSv/mRuIIFbcIefZzQD8D32DLBlk6UIv
LES2rZiDFShdS1q7KraOF8zI89VOlwc=
=y/zJ
-----END PGP SIGNATURE-----

--krgpiy72sujxxp5c--

--===============0111065219==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0111065219==--
