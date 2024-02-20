Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C481E85B88B
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 11:07:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65D4D10E046;
	Tue, 20 Feb 2024 10:06:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.b="G729cZAq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7882710E0D0
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Feb 2024 10:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1708423614; x=1739959614;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EzVIo/Erko3TaB1q/0Z3yVbLBXjoJVz6+76Ci1MxT2A=;
 b=G729cZAqFRD0iwstqFT1zqeX3uxO1acbI/XPnewArhHfh1lnJ9BHMoRL
 2UkqGmySJVuYIoOBuiDRq6R1HAR43+Q/TJxBjsGVhgvsZrbewM6OsFWxQ
 1duXsW5Zj3hhNtdEaF9naUWx+Fw9Cw8Bviku8CKu+mhYHZv8PXnaNwBCb
 rpXK3phE/5qibu1mKu0COHiEFirzFXK6/2E+1qeEv4prv+kJmaaXblrNn
 Ced4L0TWFQbdVFy39YpLSIfoFgtSZ+07fAKGs0MutNJs0PN3V31QThERJ
 ty3aPF7X9e1LoFAeEjXxck1guUbZ/fcWvVFHXkCc1mYqHhUrhuK1VfGr2 Q==;
X-IronPort-AV: E=Sophos;i="6.06,172,1705359600"; d="scan'208";a="35495206"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 20 Feb 2024 11:06:52 +0100
Received: from steina-w.localnet (steina-w.tq-net.de [10.123.53.25])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 458BD280075;
 Tue, 20 Feb 2024 11:06:52 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: dmitry.baryshkov@linaro.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@gmail.com, daniel@ffwll.ch,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, festevam@gmail.com, vkoul@kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, Sandor Yu <Sandor.yu@nxp.com>
Cc: kernel@pengutronix.de, linux-imx@nxp.com, Sandor.yu@nxp.com,
 oliver.brown@nxp.com, sam@ravnborg.org, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v14 5/7] dt-bindings: phy: Add Freescale iMX8MQ DP and
 HDMI PHY
Date: Tue, 20 Feb 2024 11:06:54 +0100
Message-ID: <10421561.nUPlyArG6x@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <8ddbb34b5f6bf2414bdb03f9e7cd9da70e4e7228.1708395604.git.Sandor.yu@nxp.com>
References: <cover.1708395604.git.Sandor.yu@nxp.com>
 <8ddbb34b5f6bf2414bdb03f9e7cd9da70e4e7228.1708395604.git.Sandor.yu@nxp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
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

Hi,

thanks for the update.

Am Dienstag, 20. Februar 2024, 04:23:53 CET schrieb Sandor Yu:
> Add bindings for Freescale iMX8MQ DP and HDMI PHY.
>=20
> Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
> v9->v14:
>  *No change.
>=20
>  .../bindings/phy/fsl,imx8mq-dp-hdmi-phy.yaml  | 53 +++++++++++++++++++
>  1 file changed, 53 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/fsl,imx8mq-dp-h=
dmi-phy.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/phy/fsl,imx8mq-dp-hdmi-phy=
=2Eyaml b/Documentation/devicetree/bindings/phy/fsl,imx8mq-dp-hdmi-phy.yaml
> new file mode 100644
> index 0000000000000..917f113503dca
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/fsl,imx8mq-dp-hdmi-phy.yaml
> @@ -0,0 +1,53 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/fsl,imx8mq-dp-hdmi-phy.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Cadence HDP-TX DP/HDMI PHY for Freescale i.MX8MQ SoC
> +
> +maintainers:
> +  - Sandor Yu <sandor.yu@nxp.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - fsl,imx8mq-dp-phy
> +      - fsl,imx8mq-hdmi-phy

While reading cdns-mhdp8501-core.c I'm not so sure about this. There is
only a single PHY which can be configured for either DP or HDMI.
Using separate compatibles for that somehow bugs me.
Maybe the DT maintainers can add some input if this should be single
or double compatibles.

Thanks and best regards,
Alexander

> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: PHY reference clock.
> +      - description: APB clock.
> +
> +  clock-names:
> +    items:
> +      - const: ref
> +      - const: apb
> +
> +  "#phy-cells":
> +    const: 0
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - "#phy-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/imx8mq-clock.h>
> +    #include <dt-bindings/phy/phy.h>
> +    dp_phy: phy@32c00000 {
> +        compatible =3D "fsl,imx8mq-dp-phy";
> +        reg =3D <0x32c00000 0x100000>;
> +        #phy-cells =3D <0>;
> +        clocks =3D <&hdmi_phy_27m>, <&clk IMX8MQ_CLK_DISP_APB_ROOT>;
> +        clock-names =3D "ref", "apb";
> +    };
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


