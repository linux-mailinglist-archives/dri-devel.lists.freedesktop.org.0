Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WCuQLRD7kmlx0gEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 12:10:08 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 211F7142B54
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 12:10:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1469F10E29E;
	Mon, 16 Feb 2026 11:10:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="cScbLoDs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF9C310E29E
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 11:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1771240202;
 bh=IntVyqmcKxwafdHrksd0syn7OEBN/YV17IIzQF/SDJU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=cScbLoDsYQ16Gwar4SVipw6ik0PXKTC4YzaM2tjFrkkO9ugwNyYHt0Z/yNcPdyqRP
 BIc8iw3yvxQDe5be6Z1Y8ITFWYqSnPtOoxQxAE6jMtoe2VgxNbUiWObWa87ekYSTdB
 25Cd0d+q2IdQF2GcBX+et365e3PcENQUpBB0K0fhvEe4fR1DKMGr60mn/7Tp8FH1XJ
 clUUkQeEFV7yu4vd/cyD+vajyz5paKptYFc+AKbBrij1lesbMKZR2jKCCgsw+EOS29
 FoiEW+4gs/tKdNJHVI/xjO2KDNr741Q+oG6gtql5TQSjHirxU+yoYt5fnYmwBtIjmw
 oEBWT5ZKruE7Q==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id C89F017E1517;
 Mon, 16 Feb 2026 12:10:01 +0100 (CET)
Message-ID: <5718e8aa-a9a0-41d4-af15-37441909efc2@collabora.com>
Date: Mon, 16 Feb 2026 12:10:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: mediatek: mt8167: Add DRM nodes
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
 linux-mediatek@lists.infradead.org
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chunfeng Yun
 <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jitao Shi
 <jitao.shi@mediatek.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org
References: <cover.1771144723.git.l.scorcia@gmail.com>
 <efed7184f27f7f85e9b811070a072b81e134e57e.1771144723.git.l.scorcia@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <efed7184f27f7f85e9b811070a072b81e134e57e.1771144723.git.l.scorcia@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:l.scorcia@gmail.com,m:linux-mediatek@lists.infradead.org,m:chunkuang.hu@kernel.org,m:p.zabel@pengutronix.de,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:chunfeng.yun@mediatek.com,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:matthias.bgg@gmail.com,m:jitao.shi@mediatek.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-phy@lists.infradead.org,m:lscorcia@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[angelogioacchino.delregno@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FREEMAIL_TO(0.00)[gmail.com,lists.infradead.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[angelogioacchino.delregno@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,pengutronix.de,linux.intel.com,suse.de,gmail.com,ffwll.ch,mediatek.com,linaro.org,lists.freedesktop.org,vger.kernel.org,lists.infradead.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 211F7142B54
X-Rspamd-Action: no action

Il 15/02/26 09:53, Luca Leonardo Scorcia ha scritto:
> Add all the DRM nodes required to get DSI to work on MT8167 SoC.
> 
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
> ---
>   arch/arm64/boot/dts/mediatek/mt8167.dtsi | 386 +++++++++++++++++++++++
>   1 file changed, 386 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8167.dtsi b/arch/arm64/boot/dts/mediatek/mt8167.dtsi
> index 27cf32d7ae35..c6306234e592 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8167.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8167.dtsi
> @@ -16,6 +16,20 @@
>   / {
>   	compatible = "mediatek,mt8167";
>   
> +	aliases {
> +		aal0 = &aal;
> +		ccorr0 = &ccorr;
> +		color0 = &color;
> +		dither0 = &dither;
> +		dsi0 = &dsi;
> +		gamma0 = &gamma;
> +		ovl0 = &ovl0;
> +		pwm0 = &disp_pwm;
> +		rdma0 = &rdma0;
> +		rdma1 = &rdma1;
> +		wdma0 = &wdma;
> +	};
> +
>   	soc {
>   		topckgen: topckgen@10000000 {
>   			compatible = "mediatek,mt8167-topckgen", "syscon";
> @@ -120,10 +134,371 @@ iommu: m4u@10203000 {
>   			#iommu-cells = <1>;
>   		};
>   
> +		disp_pwm: pwm@1100f000 {
> +			compatible = "mediatek,mt8167-disp-pwm",
> +				     "mediatek,mt8173-disp-pwm";

The compatible strings fit in a single line. Up to 100 columns it's fine: for every
node additions that you're doing, please use a single line wherever you can.

> +			reg = <0 0x1100f000 0 0x1000>;
> +			clocks = <&mmsys CLK_MM_DISP_PWM_26M>,
> +				 <&mmsys CLK_MM_DISP_PWM_MM>;
> +			clock-names = "main",
> +				      "mm";

That also includes clock-names and, where possible, also clocks and anything
else really.

> +			power-domains = <&spm MT8167_POWER_DOMAIN_MM>;
> +			#pwm-cells = <2>;
> +			status = "disabled";
> +		};
> +
>   		mmsys: syscon@14000000 {
>   			compatible = "mediatek,mt8167-mmsys", "syscon";
>   			reg = <0 0x14000000 0 0x1000>;
> +			power-domains = <&spm MT8167_POWER_DOMAIN_MM>;
>   			#clock-cells = <1>;
> +
> +			port {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				mmsys_main: endpoint@0 {
> +					reg = <0>;
> +					remote-endpoint = <&ovl0_in>;
> +				};
> +
> +				mmsys_ext: endpoint@1 {
> +					reg = <1>;
> +					remote-endpoint = <&rdma1_in>;
> +				};

Nice! Thanks for expressing those connections with an OF Graph. That makes things
simpler for other devices based on the same SoC.

> +			};
> +		};
> +
> +		ovl0: ovl0@14007000 {
> +			compatible = "mediatek,mt8167-disp-ovl";
> +			reg = <0 0x14007000 0 0x1000>;
> +			clocks = <&mmsys CLK_MM_DISP_OVL0>;
> +			interrupts = <GIC_SPI 160 IRQ_TYPE_LEVEL_LOW>;
> +			iommus = <&iommu M4U_PORT_DISP_OVL0>;
> +			power-domains = <&spm MT8167_POWER_DOMAIN_MM>;
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +					reg = <0>;

For OVL, RDMA, COLOR, CCORR, and others, you have only one endpoint.

Since there is only one, you can compress the nodes and avoid the text bloat
(and please do), by declaring the nodes like:

			ports {
				#address-cells = <1>;
				#size-cells = <0>;

				port@0 {
					reg = <0>;
					ovl0_in: endpoint {
						remote-endpoint = <&mmsys_main>;
					};
				};

				port@1 {
					reg = <1>;
					ovl0_out: endpoint {
						remote-endpoint = <&color_in>;
					};
				};
			};

Please do this for all nodes where you have only a single endpoint (so, for
everything but mmsys).


> +					ovl0_in: endpoint@0 {
> +						reg = <0>;
> +						remote-endpoint = <&mmsys_main>;
> +					};
> +				};
> +
> +				port@1 {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +					reg = <1>;
> +					ovl0_out: endpoint@0 {
> +						reg = <0>;
> +						remote-endpoint = <&color_in>;
> +					};
> +				};
> +			};
> +		};

...snip...

> +
> +		dsi: dsi@14012000 {
> +			compatible = "mediatek,mt8167-dsi",
> +				     "mediatek,mt2701-dsi";
> +			reg = <0 0x14012000 0 0x1000>;
> +			clocks = <&mmsys CLK_MM_DSI_ENGINE>,
> +				 <&mmsys CLK_MM_DSI_DIGITAL>,
> +				 <&mipi_tx>;
> +			clock-names = "engine", "digital", "hs";
> +			interrupts = <GIC_SPI 171 IRQ_TYPE_LEVEL_LOW>;
> +			phys = <&mipi_tx>;
> +			phy-names = "dphy";
> +			power-domains = <&spm MT8167_POWER_DOMAIN_MM>;
> +			status = "disabled";
> +
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;

..snip..

> +
> +				port@1 {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +					reg = <1>;
> +					dsi_out: endpoint@0 {
> +						reg = <0>;
> +					};
> +				};

That's shorter, and simpler:
				port@1 {
					reg = <1>;
					dsi_out: endpoint { };
				};

> +			};
> +		};
> +
> +		mutex: mutex@14015000 {
> +			compatible = "mediatek,mt8167-disp-mutex";
> +			reg = <0 0x14015000 0 0x1000>;
> +			interrupts = <GIC_SPI 153 IRQ_TYPE_LEVEL_LOW>;
> +			power-domains = <&spm MT8167_POWER_DOMAIN_MM>;
>   		};
>   
>   		larb0: larb@14016000 {
> @@ -145,6 +520,17 @@ smi_common: smi@14017000 {
>   			power-domains = <&spm MT8167_POWER_DOMAIN_MM>;
>   		};
>   
> +		mipi_tx: dsi-phy@14018000 {
> +			compatible = "mediatek,mt8167-mipi-tx",
> +				     "mediatek,mt2701-mipi-tx";

Fits in a single line :-)

> +			reg = <0 0x14018000 0 0x90>;
> +			clocks = <&topckgen CLK_TOP_MIPI_26M_DBG>;
> +			clock-output-names = "mipi_tx0_pll";
> +			#clock-cells = <0>;
> +			#phy-cells = <0>;
> +			status = "disabled";
> +		};
> +
>   		imgsys: syscon@15000000 {
>   			compatible = "mediatek,mt8167-imgsys", "syscon";
>   			reg = <0 0x15000000 0 0x1000>;
Nice job, btw.

Cheers,
Angelo

