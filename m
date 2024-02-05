Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7131D849480
	for <lists+dri-devel@lfdr.de>; Mon,  5 Feb 2024 08:27:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CAEA10E08F;
	Mon,  5 Feb 2024 07:26:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.b="Klhhesn8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3E1910E675
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Feb 2024 07:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1707118015; x=1738654015;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HoFc6DCxoaUD+73aoVDy20A8vyUJTHyM4bWOxf2XCbc=;
 b=Klhhesn88C7R+gsA0u1GP7v8pMC/WB/1FN9W8glEIRztYM2RPlXoiBv0
 I6CQMxGLZ/xdPBIGoJX1hJXoCWkF5/Kd2Pe5HCKgfrXJ0LMCnEsqN+9+y
 va9Ix4UwcXlnzDzco6S/aj7wKONkhDfwgzbUtyWxcXeGoTgQr8dfOooCw
 m2bHU1/4qV6jDBGdhC5+NIggBGdRLFY9+7N8wpdlBtX4r/AGm5zFNgYCn
 VrWBd4wuI2ycn3p4ww+WCkSxEf8IHVxMTaXkpQfT9SfCAsHrfUNNeey1X
 E3xWiywo5/cwbLSdQ8TgHm/LAQlS+pfhIwRuI0b3kDLVymE4k2QlvvJ/r Q==;
X-IronPort-AV: E=Sophos;i="6.05,242,1701126000"; d="scan'208";a="35238230"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 05 Feb 2024 08:26:53 +0100
Received: from steina-w.localnet (steina-w.tq-net.de [10.123.53.25])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 4B324280075;
 Mon,  5 Feb 2024 08:26:52 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: linux-arm-kernel@lists.infradead.org, Adam Ford <aford173@gmail.com>
Cc: marex@denx.de, frieder.schrempf@kontron.de,
 Lucas Stach <l.stach@pengutronix.de>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Catalin Marinas <catalin.marina
 s@arm.com>, Will Deacon <will@kernel.org>, Liu Ying <victor.liu@nxp.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH V8 06/12] arm64: dts: imx8mp: add HDMI irqsteer
Date: Mon, 05 Feb 2024 08:26:53 +0100
Message-ID: <2175280.irdbgypaU6@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20240203165307.7806-7-aford173@gmail.com>
References: <20240203165307.7806-1-aford173@gmail.com>
 <20240203165307.7806-7-aford173@gmail.com>
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

Hi Adam,

thanks for working on this.

Am Samstag, 3. Februar 2024, 17:52:46 CET schrieb Adam Ford:
> From: Lucas Stach <l.stach@pengutronix.de>
>=20
> The HDMI irqsteer is a secondary interrupt controller within the HDMI
> subsystem that maps all HDMI peripheral IRQs into a single upstream
> IRQ line.
>=20
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> ---
>  arch/arm64/boot/dts/freescale/imx8mp.dtsi | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> b/arch/arm64/boot/dts/freescale/imx8mp.dtsi index
> 5c54073de615..5e51a766f3d9 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> @@ -1399,6 +1399,19 @@ hdmi_blk_ctrl: blk-ctrl@32fc0000 {
>  						     "hdcp",=20
"hrv";
>  				#power-domain-cells =3D <1>;
>  			};
> +
> +			irqsteer_hdmi: interrupt-controller@32fc2000 {
> +				compatible =3D "fsl,imx-irqsteer";
> +				reg =3D <0x32fc2000 0x44>;
> +				interrupts =3D <GIC_SPI 43=20
IRQ_TYPE_LEVEL_HIGH>;
> +				interrupt-controller;
> +				#interrupt-cells =3D <1>;
> +				fsl,channel =3D <1>;
> +				fsl,num-irqs =3D <64>;
> +				clocks =3D <&clk IMX8MP_CLK_HDMI_APB>;
> +				clock-names =3D "ipg";
> +				power-domains =3D <&hdmi_blk_ctrl=20
IMX8MP_HDMIBLK_PD_IRQSTEER>;
> +			};

According to RM this block is part of HDMI_TX which is part of AIPS4, so it=
=20
should be below hsio_blk_ctrl.

Best regards,
Alexander

>  		};
>=20
>  		aips5: bus@30c00000 {


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


