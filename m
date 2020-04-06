Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC63A1A0901
	for <lists+dri-devel@lfdr.de>; Tue,  7 Apr 2020 10:10:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6A726E5C1;
	Tue,  7 Apr 2020 08:09:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 892636E2D1
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Apr 2020 07:50:45 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id D212F5C01A7;
 Mon,  6 Apr 2020 03:50:44 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 06 Apr 2020 03:50:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=9f+SgQTK7pvrLgqImLxPflMuSlx
 aMRhfDYmwZBCbtvw=; b=yz5/cYiWVDnRGgVfVL4hKF4BRFUpdVym6HQ8zrSYjDo
 KeV9qZ0TOUJ3n8/2Z01MjNNDhF+p6rGpfrpSL1XNnq4T10cU58no9wPAlPB2d5vv
 u6s1pMrv0i6qzVe3uLeOB+B7ScOLq2NCGvsHgEK/JA9tOiEuLS6W+9yUY1DHTM1s
 vnXp2j0RGshgVrrUKQ+gU105vdbIlS6Nfr6ijEtWhEnMMNiXNyN2mZDr9Xry6eSo
 hr1y17x1tVrdAKNg9b2nhJl8YW076p9sZcovsmHuB5ciQc+1B4wi2QYSzcUF/Fum
 ITz6bDqjHw8oeJAazUOH8xWzTBRGb7rjfXdkAZ8rU6w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=9f+SgQ
 TK7pvrLgqImLxPflMuSlxaMRhfDYmwZBCbtvw=; b=awOupr3w9VQJxVO33kR7oP
 HhYQpx3pAhru3QumoEU3mxVcnYBtjxrur9mL5eta9TuylfYZfTlDXUo3L1Jx32c3
 u1XMhnoV0BvgIuWoYvdG3qB7M66Vwd4FBZ1WcpMdaK0jfPJ7H4dgtOPdTwghJRfR
 Y9525+Lga6mvPkGkUiDWFdiK/4Ye6OKCzw9UXyaEQ3jTEE0PnR1nixfxFsDgOVaz
 X4PppFoh99PyPpJQgOivKD2B1oaIzTuXz2A9iS2zfkMJwd2e44al4kkagp6kI3kz
 bnurZIYeDn45ry8YJVsiKpYgx3wmYxe18n7OVWRfvoZQ3fo4V8sHtzbiq64w4VEg
 ==
X-ME-Sender: <xms:U9-KXgkrUu4wCD08Sdr4w5LXKbMo7O8Jeeuweiv9YI6IViWvdSSsJQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedruddvgdduvdejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuffhomhgrih
 hnpeguvghvihgtvghtrhgvvgdrohhrghenucfkphepledtrdekledrieekrdejieenucev
 lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvg
 estggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:U9-KXhXSww_U9foq0AXLHNDM779H5tefaz6GJAJaXW9nhX1b2vzzlw>
 <xmx:U9-KXjOwisq3yrmtm2fhSA4_yQu7qOpi2JTmwD3tve0ha2seMh7ngg>
 <xmx:U9-KXsGBUCT1VaI0E2LoSJMLRu9LY0fhrKHChz8QGKQdl0uqvwjAuA>
 <xmx:VN-KXn2JLhAFhOSVj3S1NTFQCl_xaJKqLBcSkLU6E12tjb1YaqbxRQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 725233280066;
 Mon,  6 Apr 2020 03:50:43 -0400 (EDT)
Date: Mon, 6 Apr 2020 09:50:42 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH/RFC 1/6] dt-bindings: display: bridge: Add YAML schema
 for Synopsys DW-HDMI
Message-ID: <20200406075042.ziobijknkhdaalgq@gilmour.lan>
References: <20200405233935.27599-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200405233935.27599-2-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
In-Reply-To: <20200405233935.27599-2-laurent.pinchart+renesas@ideasonboard.com>
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
Content-Type: multipart/mixed; boundary="===============1847342581=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1847342581==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7pdridwch6me7tyh"
Content-Disposition: inline


--7pdridwch6me7tyh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Mon, Apr 06, 2020 at 02:39:30AM +0300, Laurent Pinchart wrote:
> Add a .yaml schema containing the common properties for the Synopsys
> DesignWare HDMI TX controller. This isn't a full device tree binding
> specification, but is meant to be referenced by platform-specific
> bindings for the IP core.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  .../display/bridge/synopsys,dw-hdmi.yaml      | 68 +++++++++++++++++++
>  1 file changed, 68 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/synopsys,dw-hdmi.yaml
>
> diff --git a/Documentation/devicetree/bindings/display/bridge/synopsys,dw-hdmi.yaml b/Documentation/devicetree/bindings/display/bridge/synopsys,dw-hdmi.yaml
> new file mode 100644
> index 000000000000..6ebb8f7d2ba8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/synopsys,dw-hdmi.yaml
> @@ -0,0 +1,68 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/bridge/synopsys,dw-hdmi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Common Properties for Synopsys DesignWare HDMI TX Controller
> +
> +maintainers:
> +  - Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> +
> +description: |
> +  This document defines device tree properties for the Synopsys DesignWare HDMI
> +  TX controller (DWC HDMI TX) IP core. It doesn't constitute a full device tree
> +  binding specification by itself but is meant to be referenced by device tree
> +  bindings for the platform-specific integrations of the DWC HDMI TX.
> +
> +  When referenced from platform device tree bindings the properties defined in
> +  this document are defined as follows. The platform device tree bindings are
> +  responsible for defining whether each property is required or optional.
> +
> +properties:
> +  reg:
> +    maxItems: 1
> +
> +  reg-io-width:
> +    description:
> +      Width (in bytes) of the registers specified by the reg property. The
> +      register width defaults to 1 if the property is not present.

This is what default is here for ;)

Looks good otherwise.

Maxime

--7pdridwch6me7tyh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXorfUgAKCRDj7w1vZxhR
xc2+AP9HRPwXKabq90nSXD0dqPkI655fpZHYb92tB2E63fSW5gD/Uw6U4qpocbk1
35HR4bDMeS/HI/u5JF0GZS24ovDSggY=
=QR3f
-----END PGP SIGNATURE-----

--7pdridwch6me7tyh--

--===============1847342581==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1847342581==--
