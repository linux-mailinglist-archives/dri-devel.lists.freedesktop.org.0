Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B077DA96594
	for <lists+dri-devel@lfdr.de>; Tue, 22 Apr 2025 12:13:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4FD410E1A3;
	Tue, 22 Apr 2025 10:13:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.b="Wiy0bsGD";
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="jh5PkcDA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 341DB10E1A3
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Apr 2025 10:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1745316799; x=1776852799;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GTgyBYM0atbB7o8tyo96ALPdwLqQ7fnnytL7AnbCemc=;
 b=Wiy0bsGDX1UeXXCNiHxIPu0/YJIqwHZnqvxpjQCwq2NRmJBcgLwumw5X
 m5uyqgDTCg0o19+15J+8/B05AFRmiqFd4RfCh6Exqw3x+kh82jhNHpMGX
 B3S/JmZn7l59YlgbC0prynh4ykcn0roG1P7OWa2T9ozV6r9u8zvXtVTiG
 aNOvO8iBrdtQsjcJ99h7ExLlRiNAs1O8mfU+fpvo9ANjKW08lC/nHPs00
 V59ICgWqCq94et4GfjoO+2XO9kgeqVMkuUZs1sMcJH9wduIM4GGaJ5Q5H
 LftLtb8R2xtxQenBilZaI8ft2An6yRt7jWizHzEESirlh0yZvQFVGixbq g==;
X-CSE-ConnectionGUID: aFnZ/5SfRwmMZma6TXZltg==
X-CSE-MsgGUID: zm9SyFfMT+ynQMFBCmSLdA==
X-IronPort-AV: E=Sophos;i="6.15,230,1739833200"; d="scan'208";a="43643392"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
 by mx1.tq-group.com with ESMTP; 22 Apr 2025 12:13:13 +0200
X-CheckPoint: {68076BB9-D-DC4DC9A0-F4F29281}
X-MAIL-CPID: E85EBD5DCC334B9006B24DBC4B5A8702_0
X-Control-Analysis: str=0001.0A006368.68076BC7.004D, ss=1, re=0.000, recu=0.000,
 reip=0.000, cl=1, cld=1, fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 4392516157F; Tue, 22 Apr 2025 12:13:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
 s=dkim; t=1745316787;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GTgyBYM0atbB7o8tyo96ALPdwLqQ7fnnytL7AnbCemc=;
 b=jh5PkcDACdr42zBpglMQlTtHe2GsSeBycBax5AeNrIxoKMDEJi7pZOJGlvzcbqZPXoEuQW
 itX8TLKWSVXdsogH8yaE3qZS5OuU1HYtmNkf2FX4wEkhC/kWqwImVYs+TJAapW5oJYdJs1
 89o/8/ZpbhEe5nLHs9mSAI6iZLeSl9p2sxmMCWrCo2sr/bfNrYq7stmyIWZwc6hcLLrj7Y
 BLaiAxio5vEP2Ka1JGJJNPal5ZJBBH8IuYQc37TxJwWtH9Hw5TKQ8ZTCblhwH2Qwq+3Zfw
 jERP+NMjT+g1hrYcyTSSkzKjWX1+FZAGQs7slMKzOq6v31gpOcqFoqlTN+LlvQ==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Stefan Agner <stefan@agner.ch>,
 Alison Wang <alison.wang@nxp.com>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Cc: imx@lists.linux.dev, Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH 1/1] dt-bindings: display: imx: convert fsl,
 dcu.txt to yaml format
Date: Tue, 22 Apr 2025 12:13:04 +0200
Message-ID: <2782645.mvXUDI8C0e@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20250417151934.3570681-1-Frank.Li@nxp.com>
References: <20250417151934.3570681-1-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Donnerstag, 17. April 2025, 17:19:33 CEST schrieb Frank Li:
> Convert fsl,dcu.txt to yaml format.
>=20
> Additional changes:
> - remove label in example.
> - change node to display-controller in example.
> - use 32bit address in example.
>=20
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../devicetree/bindings/display/fsl,dcu.txt   | 34 ----------
>  .../bindings/display/fsl,ls1021a-dcu.yaml     | 68 +++++++++++++++++++
>  MAINTAINERS                                   |  2 +-
>  3 files changed, 69 insertions(+), 35 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/fsl,dcu.txt
>  create mode 100644 Documentation/devicetree/bindings/display/fsl,ls1021a=
=2Ddcu.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/display/fsl,dcu.txt b/Docu=
mentation/devicetree/bindings/display/fsl,dcu.txt
> deleted file mode 100644
> index 63ec2a624aa94..0000000000000
> --- a/Documentation/devicetree/bindings/display/fsl,dcu.txt
> +++ /dev/null
> @@ -1,34 +0,0 @@
> -Device Tree bindings for Freescale DCU DRM Driver
> -
> -Required properties:
> -- compatible:		Should be one of
> -	* "fsl,ls1021a-dcu".
> -	* "fsl,vf610-dcu".
> -
> -- reg:			Address and length of the register set for dcu.
> -- clocks:		Handle to "dcu" and "pix" clock (in the order below)
> -			This can be the same clock (e.g. LS1021a)
> -			See ../clocks/clock-bindings.txt for details.
> -- clock-names:		Should be "dcu" and "pix"
> -			See ../clocks/clock-bindings.txt for details.
> -- big-endian		Boolean property, LS1021A DCU registers are big-endian.
> -- port			Video port for the panel output
> -
> -Optional properties:
> -- fsl,tcon:		The phandle to the timing controller node.
> -
> -Examples:
> -dcu: dcu@2ce0000 {
> -	compatible =3D "fsl,ls1021a-dcu";
> -	reg =3D <0x0 0x2ce0000 0x0 0x10000>;
> -	clocks =3D <&platform_clk 0>, <&platform_clk 0>;
> -	clock-names =3D "dcu", "pix";
> -	big-endian;
> -	fsl,tcon =3D <&tcon>;
> -
> -	port {
> -		dcu_out: endpoint {
> -			remote-endpoint =3D <&panel_out>;
> -	     };
> -	};
> -};
> diff --git a/Documentation/devicetree/bindings/display/fsl,ls1021a-dcu.ya=
ml b/Documentation/devicetree/bindings/display/fsl,ls1021a-dcu.yaml
> new file mode 100644
> index 0000000000000..7246c89271a8d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/fsl,ls1021a-dcu.yaml
> @@ -0,0 +1,68 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/fsl,ls1021a-dcu.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale DCU DRM Driver
> +
> +maintainers:
> +  - Frank Li <Frank.Li@nxp.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - fsl,ls1021a-dcu
> +      - fsl,vf610-dcu
> +
> +  reg:
> +    maxItems: 1

interrupts:
  maxItems: 1

2D-ACE (DCU) has a single interrupt (204 in RM)

Best regards,
Alexander

> +
> +  clocks:
> +    maxItems: 2
> +
> +  clock-names:
> +    items:
> +      - const: dcu
> +      - const: pix
> +
> +  big-endian: true
> +
> +  port:
> +    $ref: /schemas/graph.yaml#/$defs/port-base
> +    unevaluatedProperties: false
> +    description: Video port for the panel output
> +
> +    properties:
> +      endpoint:
> +        $ref: /schemas/media/video-interfaces.yaml#
> +        unevaluatedProperties: false
> +
> +  fsl,tcon:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: The phandle to the timing controller node.
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    display-controller@2ce0000 {
> +        compatible =3D "fsl,ls1021a-dcu";
> +        reg =3D <0x2ce0000 0x10000>;
> +        clocks =3D <&platform_clk 0>, <&platform_clk 0>;
> +        clock-names =3D "dcu", "pix";
> +        big-endian;
> +        fsl,tcon =3D <&tcon>;
> +
> +        port {
> +            endpoint {
> +                remote-endpoint =3D <&panel_out>;
> +            };
> +        };
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 65e0716554203..02504134e1f5d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7894,7 +7894,7 @@ M:	Alison Wang <alison.wang@nxp.com>
>  L:	dri-devel@lists.freedesktop.org
>  S:	Supported
>  T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
> -F:	Documentation/devicetree/bindings/display/fsl,dcu.txt
> +F:	Documentation/devicetree/bindings/display/fsl,ls1021a-dcu.yaml
>  F:	Documentation/devicetree/bindings/display/fsl,tcon.txt
>  F:	drivers/gpu/drm/fsl-dcu/
> =20
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


