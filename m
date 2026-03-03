Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CKlrCyC7pmk7TAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 11:42:40 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E9D81ECDCF
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 11:42:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EE9810E774;
	Tue,  3 Mar 2026 10:42:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F11CD10E774
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2026 10:42:36 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mfe@pengutronix.de>)
 id 1vxNCc-0005f6-7X; Tue, 03 Mar 2026 11:42:10 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <mfe@pengutronix.de>) id 1vxNCZ-003X1T-2V;
 Tue, 03 Mar 2026 11:42:09 +0100
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.98.2)
 (envelope-from <mfe@pengutronix.de>) id 1vxNCa-0000000G2ij-47dc;
 Tue, 03 Mar 2026 11:42:08 +0100
Date: Tue, 3 Mar 2026 11:42:08 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, 
 Liu Ying <victor.liu@nxp.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 luca.ceresoli@bootlin.com, Frank Li <Frank.Li@nxp.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v11 3/3] arm64: dts: imx93: Add parallel display output
 nodes
Message-ID: <tyqgkbmkmenkdqdptb3baeizmvsdoyfjnaudlpb4jnz4py7cpb@oy64pijka2yz>
References: <20260303-v6-18-topic-imx93-parallel-display-v11-0-1b03733c8461@pengutronix.de>
 <20260303-v6-18-topic-imx93-parallel-display-v11-3-1b03733c8461@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260303-v6-18-topic-imx93-parallel-display-v11-3-1b03733c8461@pengutronix.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
X-Rspamd-Queue-Id: 8E9D81ECDCF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	DMARC_NA(0.00)[pengutronix.de];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:peng.fan@nxp.com,m:victor.liu@nxp.com,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:luca.ceresoli@bootlin.com,m:Frank.Li@nxp.com,m:devicetree@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,pengutronix.de,gmail.com,nxp.com,intel.com,linaro.org,ideasonboard.com,kwiboo.se,linux.intel.com,suse.de,ffwll.ch,bootlin.com];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[m.felsch@pengutronix.de,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[m.felsch@pengutronix.de,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-0.671];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,pengutronix.de:url,pengutronix.de:email,0.0.0.2:email,2.166.110.232:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,4c100000:email]
X-Rspamd-Action: no action

Hi Frank,

On 26-03-03, Marco Felsch wrote:
> Add required OF nodes to support the i.MX93 parallel output (DPI) path.
> 
> On the i.MX93 a single LCDIF is connected to three bridges: DPI, LVDS
> LDB and the MIPI-DSI whereas the i.MX91 support only the DPI bridge.
> 
> Map endpoint@0 as DPI bridge output since the i.MX93 TRM (Figure 485.
> MEDIAMIX block diagram) doesn't mention any port-number <-> bridge
> combination.
> 
> Set the MEDIA-AXI and MEDIA-APB clocks to the overdrive (OD) values
> since the i.MX93 and i.MX91 use the overdrive (OD) clk settings per
> default.
> 
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>

Please ignore this particular patch since you already applied this one.

Next time we should align the apply with the rest of the patch series if
dt-bindings and driver behaviors are involved. In such case the final
integration patch should be merged at the end and not at the beginning
:)

Thanks,
  Marco

> ---
>  arch/arm64/boot/dts/freescale/imx91_93_common.dtsi | 54 ++++++++++++++++++++++
>  arch/arm64/boot/dts/freescale/imx93.dtsi           | 12 +++++
>  2 files changed, 66 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx91_93_common.dtsi b/arch/arm64/boot/dts/freescale/imx91_93_common.dtsi
> index 7958cef353766a430df5e626ff2403dc05a974b1..5a8813df6bc993d559fb0b20fc742a106bfe6315 100644
> --- a/arch/arm64/boot/dts/freescale/imx91_93_common.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx91_93_common.dtsi
> @@ -1122,8 +1122,62 @@ media_blk_ctrl: system-controller@4ac10000 {
>  				 <&clk IMX93_CLK_MIPI_DSI_GATE>;
>  			clock-names = "apb", "axi", "nic", "disp", "cam",
>  				      "pxp", "lcdif", "isi", "csi", "dsi";
> +			assigned-clocks = <&clk IMX93_CLK_MEDIA_AXI>,
> +					  <&clk IMX93_CLK_MEDIA_APB>,
> +					  <&clk IMX93_CLK_MEDIA_DISP_PIX>;
> +			assigned-clock-parents = <&clk IMX93_CLK_SYS_PLL_PFD1>,
> +						 <&clk IMX93_CLK_SYS_PLL_PFD1_DIV2>,
> +						 <&clk IMX93_CLK_VIDEO_PLL>;
> +			assigned-clock-rates = <400000000>, <133333333>;
>  			#power-domain-cells = <1>;
>  			status = "disabled";
> +
> +			dpi_bridge: dpi-bridge {
> +				compatible = "nxp,imx93-pdfc";
> +				status = "disabled";
> +
> +				ports {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					port@0 {
> +						reg = <0>;
> +
> +						dpi_from_lcdif: endpoint {
> +							remote-endpoint = <&lcdif_to_dpi>;
> +						};
> +					};
> +
> +					port@1 {
> +						reg = <1>;
> +
> +						dpi_to_panel: endpoint {
> +						};
> +					};
> +				};
> +			};
> +		};
> +
> +		lcdif: display-controller@4ae30000 {
> +			compatible = "fsl,imx93-lcdif";
> +			reg = <0x4ae30000 0x23c>;
> +			interrupts = <GIC_SPI 176 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&clk IMX93_CLK_MEDIA_DISP_PIX>,
> +				 <&clk IMX93_CLK_LCDIF_GATE>,
> +				 <&clk IMX93_CLK_MEDIA_AXI>;
> +			clock-names = "pix", "axi", "disp_axi";
> +			power-domains = <&media_blk_ctrl IMX93_MEDIABLK_PD_LCDIF>;
> +			status = "disabled";
> +
> +			port {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				lcdif_to_dpi: endpoint@0 {
> +					reg = <0>;
> +					remote-endpoint = <&dpi_from_lcdif>;
> +				};
> +			};
>  		};
>  
>  		usbotg1: usb@4c100000 {
> diff --git a/arch/arm64/boot/dts/freescale/imx93.dtsi b/arch/arm64/boot/dts/freescale/imx93.dtsi
> index 7b27012dfcb564650882dc8c40e836e797b2fda1..5436b48b30e89eb1f939b398ce1bf105abe7e34b 100644
> --- a/arch/arm64/boot/dts/freescale/imx93.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx93.dtsi
> @@ -150,6 +150,18 @@ l3_cache: l3-cache {
>  	};
>  };
>  
> +&lcdif {
> +	port {
> +		lcdif_to_ldb: endpoint@1 {
> +			reg = <1>;
> +		};
> +
> +		lcdif_to_dsi: endpoint@2 {
> +			reg = <2>;
> +		};
> +	};
> +};
> +
>  &src {
>  	mlmix: power-domain@44461800 {
>  		compatible = "fsl,imx93-src-slice";
> 
> -- 
> 2.47.3
> 

-- 
#gernperDu 
#CallMeByMyFirstName

Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | https://www.pengutronix.de/ |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-9    |
