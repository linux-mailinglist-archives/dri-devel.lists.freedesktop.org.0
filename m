Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B34D1538CE8
	for <lists+dri-devel@lfdr.de>; Tue, 31 May 2022 10:31:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47F2E10F906;
	Tue, 31 May 2022 08:31:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB3A910F90A
 for <dri-devel@lists.freedesktop.org>; Tue, 31 May 2022 08:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1653985916; x=1685521916;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=n0MlSyv4m4NqUi7kCGI4FwLhvb140adLuDksFUetojk=;
 b=X3jl9UeEC4wqWxlkU7LccsvJYebhFvcHHsRgj+QGFN7tIUKXOslu5V0p
 lXjeJ7cQhOhaL4H5LMft0tzmjT0vjD35lE/Z9g3e/svP52kgVnhqv7Dle
 X05nayHjrl7RyCfoUNI3fmdU7vHZOwWefxab27I8SnVVgjTV26MCcR9vD
 DIdaDv0ZxuV708S+ydXNkgPir/Oup4JCUmrel6Cab8EN7RlUu1vPMFEGi
 9Vgbvhj2aH5k12TEGncf+5lrdAR2SkFv3XhJUJtuMbHZqwfMWQChzdlzp
 DmAlaU62ZjvNoCA5SnMqhkHBlkKqhzh+9O+TxYUHQMTFop3FWbD9mIq1e Q==;
X-IronPort-AV: E=Sophos;i="5.91,264,1647298800"; d="scan'208";a="24167931"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 31 May 2022 10:31:52 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Tue, 31 May 2022 10:31:54 +0200
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Tue, 31 May 2022 10:31:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1653985914; x=1685521914;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=n0MlSyv4m4NqUi7kCGI4FwLhvb140adLuDksFUetojk=;
 b=RNT8yAIgsGLbU6F6nUKqGTon7paoihwhkYZhEmbkIO/+YmPDguraMzzs
 klHluJLGnLPoiE+2Lp9eECxfCxgQ59kwhbRj5qrKG8Ig3E5TEwo0Oj8Pz
 b0VbT+sN3kiUNV+kl0RZ53DeN1OTqqxKCMdaHbu107FDUfeBLIUcr8ToJ
 YaSwhIf0To2yQXMGN0zAxAEeFkie4OzRYFu2hMVr7PlfE4hR9E1Mj6cFU
 pPsHSuPXxpQIODM3N5c3Uc6gmxXChLNAlASEX69cnyeoboNnOblH82Q9s
 mvKn7rN4CpbMfZGf5uxy6xDaT+8S802LsbNM3OU7FRV/kTpmKVzL6FJgi A==;
X-IronPort-AV: E=Sophos;i="5.91,264,1647298800"; d="scan'208";a="24167929"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 31 May 2022 10:31:51 +0200
Received: from steina-w.localnet (unknown [10.123.49.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 7AD06280004;
 Tue, 31 May 2022 10:31:51 +0200 (CEST)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>, linux-arm-kernel@lists.infradead.org
Subject: Re: (EXT) [PATCH v0 09/10] arm64: dts: imx8mp: add HDMI display
 pipeline
Date: Tue, 31 May 2022 10:31:49 +0200
Message-ID: <8174014.NyiUUSuA9g@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20220406160123.1272911-10-l.stach@pengutronix.de>
References: <20220406160123.1272911-1-l.stach@pengutronix.de>
 <20220406160123.1272911-10-l.stach@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
Cc: devicetree@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Neil Armstrong <narmstrong@baylibre.com>, Robert Foss <robert.foss@linaro.org>,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 linux-phy@lists.infradead.org, patchwork-lst@pengutronix.de,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Lucas,

Am Mittwoch, 6. April 2022, 18:01:22 CEST schrieb Lucas Stach:
> This adds the DT nodes for all the peripherals that make up the
> HDMI display pipeline.
> 
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> ---
>  arch/arm64/boot/dts/freescale/imx8mp.dtsi | 80 +++++++++++++++++++++++
>  1 file changed, 80 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> b/arch/arm64/boot/dts/freescale/imx8mp.dtsi index
> 6b7b5ba32b48..a41da99e9537 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> @@ -1087,6 +1087,86 @@ irqsteer_hdmi: interrupt-controller@32fc2000 {
>  				clock-names = "ipg";
>  				power-domains = <&hdmi_blk_ctrl 
IMX8MP_HDMIBLK_PD_IRQSTEER>;
>  			};
> +
> +			hdmi_pvi: display-bridge@32fc4000 {
> +				compatible = "fsl,imx8mp-hdmi-
pvi";
> +				reg = <0x32fc4000 0x40>;
> +				power-domains = <&hdmi_blk_ctrl 
IMX8MP_HDMIBLK_PD_PVI>;

This should be disabled by default as well. Unless 'hdmi_tx: hdmi@32fd8000' is 
enabled, this results in the warning:
imx-hdmi-pvi: probe of 32fc4000.display-bridge failed with error -22

Best regards
Alexander

> +
> +				ports {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					port@0 {
> +						reg = <0>;
> +						
pvi_from_lcdif3: endpoint {
> +							
remote-endpoint = <&lcdif3_to_pvi>;
> +						};
> +					};
> +
> +					port@1 {
> +						reg = <1>;
> +						
pvi_to_hdmi_tx: endpoint {
> +							
remote-endpoint = <&hdmi_tx_from_pvi>;
> +						};
> +					};
> +				};
> +			};
> +
> +			lcdif3: display-controller@32fc6000 {
> +				compatible = "fsl,imx8mp-lcdif";
> +				reg = <0x32fc6000 0x238>;
> +				interrupts = <8 
IRQ_TYPE_LEVEL_HIGH>;
> +				interrupt-parent = 
<&irqsteer_hdmi>;
> +				clocks = <&hdmi_tx_phy>,
> +					 <&clk 
IMX8MP_CLK_HDMI_APB>,
> +					 <&clk 
IMX8MP_CLK_HDMI_ROOT>;
> +				clock-names = "pix", "axi", 
"disp_axi";
> +				power-domains = <&hdmi_blk_ctrl 
IMX8MP_HDMIBLK_PD_LCDIF>;
> +
> +				port {
> +					lcdif3_to_pvi: endpoint 
{
> +						remote-
endpoint = <&pvi_from_lcdif3>;
> +					};
> +				};
> +			};
> +
> +			hdmi_tx: hdmi@32fd8000 {
> +				compatible = "fsl,imx8mp-hdmi";
> +				reg = <0x32fd8000 0x7eff>;
> +				interrupts = <0 
IRQ_TYPE_LEVEL_HIGH>;
> +				interrupt-parent = 
<&irqsteer_hdmi>;
> +				clocks = <&clk 
IMX8MP_CLK_HDMI_APB>,
> +					 <&clk 
IMX8MP_CLK_HDMI_REF_266M>,
> +					 <&clk IMX8MP_CLK_32K>,
> +					 <&hdmi_tx_phy>;
> +				clock-names = "iahb", "isfr", 
"cec", "pix";
> +				assigned-clocks = <&clk 
IMX8MP_CLK_HDMI_REF_266M>;
> +				assigned-clock-parents = <&clk 
IMX8MP_SYS_PLL1_266M>;
> +				power-domains = <&hdmi_blk_ctrl 
IMX8MP_HDMIBLK_PD_HDMI_TX>;
> +				reg-io-width = <1>;
> +				status = "disabled";
> +
> +				port {
> +					hdmi_tx_from_pvi: 
endpoint {
> +						remote-
endpoint = <&pvi_to_hdmi_tx>;
> +					};
> +				};
> +			};
> +
> +			hdmi_tx_phy: phy@32fdff00 {
> +				compatible = "fsl,imx8mp-hdmi-
phy";
> +				reg = <0x32fdff00 0x100>;
> +				clocks = <&clk 
IMX8MP_CLK_HDMI_APB>,
> +					 <&clk 
IMX8MP_CLK_HDMI_24M>;
> +				clock-names = "apb", "ref";
> +				assigned-clocks = <&clk 
IMX8MP_CLK_HDMI_24M>;
> +				assigned-clock-parents = <&clk 
IMX8MP_CLK_24M>;
> +				power-domains = <&hdmi_blk_ctrl 
IMX8MP_HDMIBLK_PD_HDMI_TX_PHY>;
> +				#clock-cells = <0>;
> +				#phy-cells = <0>;
> +				status = "disabled";
> +			};
>  		};
> 
>  		gpu3d: gpu@38000000 {




