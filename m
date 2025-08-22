Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91BECB318EE
	for <lists+dri-devel@lfdr.de>; Fri, 22 Aug 2025 15:12:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E662710EB0C;
	Fri, 22 Aug 2025 13:12:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=foss.st.com header.i=@foss.st.com header.b="0Eedm75k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08C5810EB0C
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 13:12:42 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57MCcqnv031363;
 Fri, 22 Aug 2025 15:12:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 GokK0EwgMtfsSNnIpttne/zzS1Pm4lLm8u+xuFpTDOc=; b=0Eedm75kc0PDSdky
 /8jqHNndow2ZEb5RGHoy9LDDl00fo7DN6SI+sP01h0hN4/eGmIohw8BY+4hnQ7TK
 QJIMF7f/QQPTc1auYlfMmDjrNgw7pa4havE+xo6jvNi3jwYsG0ssCAr+A0clIdb2
 ih4l/a8IJcuw8mIqnVosxq2OSXKWOrRHTJE5qqMyYKzZ8LsqE+K5jWHpOxP5ePeF
 FWVyfur2bVOnOYGxfybcYo7SsAj0BCWT17YbvQdJsYhdOhEmYIM1kpi9+og2Q64M
 9Rh7ilp4ZnMMZRQMnkuDw9cTbbYvHqOBde8ooYnKiZXZDD9RBwshHnxecYV+c8V2
 9ZmL8Q==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48nd5xs993-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Aug 2025 15:12:34 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id F380D4002D;
 Fri, 22 Aug 2025 15:11:15 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 415ED7206CF;
 Fri, 22 Aug 2025 15:10:19 +0200 (CEST)
Received: from [10.48.87.178] (10.48.87.178) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 22 Aug
 2025 15:10:18 +0200
Message-ID: <d193523c-5508-4bba-971b-8c0a8b7b44de@foss.st.com>
Date: Fri, 22 Aug 2025 15:10:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 13/13] arm64: dts: st: enable display support on
 stm32mp257f-ev1 board
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, Philippe Cornu
 <philippe.cornu@foss.st.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, "Maxime
 Coquelin" <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Christophe Roullier
 <christophe.roullier@foss.st.com>
CC: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20250821-drm-misc-next-v4-0-7060500f8fd3@foss.st.com>
 <20250821-drm-misc-next-v4-13-7060500f8fd3@foss.st.com>
Content-Language: en-US
From: Yannick FERTRE <yannick.fertre@foss.st.com>
In-Reply-To: <20250821-drm-misc-next-v4-13-7060500f8fd3@foss.st.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.48.87.178]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_04,2025-08-20_03,2025-03-28_01
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

Hi Raphael,

Thanks for the patch.

Acked-by: Yannick Fertre <yannick.fertre@foss.st.com>

Le 21/08/2025 à 13:09, Raphael Gallais-Pou a écrit :
> Enable the following IPs on stm32mp257f-ev1 in order to get display:
>     * LTDC
>     * LVDS
>     * WSVGA LVDS panel (1024x600)
>     * Panel LVDS backlight as GPIO backlight
>     * ILI2511 i2c touchscreen
>
> Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
> ---
>   arch/arm64/boot/dts/st/stm32mp257f-ev1.dts | 79 ++++++++++++++++++++++++++++++
>   1 file changed, 79 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts b/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
> index 836b1958ce65fb72c99d634a92af3efaf9844d76..2958ad413b0675575d84942e193a16f80197b88e 100644
> --- a/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
> +++ b/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
> @@ -86,6 +86,43 @@ mm_ospi1: mm-ospi@60000000 {
>   			no-map;
>   		};
>   	};
> +
> +	panel_lvds: display {
> +		compatible = "edt,etml0700z9ndha", "panel-lvds";
> +		enable-gpios = <&gpiog 15 GPIO_ACTIVE_HIGH>;
> +		backlight = <&panel_lvds_backlight>;
> +		power-supply = <&scmi_v3v3>;
> +		status = "okay";
> +
> +		width-mm = <156>;
> +		height-mm = <92>;
> +		data-mapping = "vesa-24";
> +
> +		panel-timing {
> +			clock-frequency = <54000000>;
> +			hactive = <1024>;
> +			vactive = <600>;
> +			hfront-porch = <150>;
> +			hback-porch = <150>;
> +			hsync-len = <21>;
> +			vfront-porch = <24>;
> +			vback-porch = <24>;
> +			vsync-len = <21>;
> +		};
> +
> +		port {
> +			lvds_panel_in: endpoint {
> +				remote-endpoint = <&lvds_out0>;
> +			};
> +		};
> +	};
> +
> +	panel_lvds_backlight: backlight {
> +		compatible = "gpio-backlight";
> +		gpios = <&gpioi 5 GPIO_ACTIVE_HIGH>;
> +		default-on;
> +		status = "okay";
> +	};
>   };
>   
>   &arm_wdt {
> @@ -183,6 +220,15 @@ imx335_ep: endpoint {
>   			};
>   		};
>   	};
> +
> +	ili2511: ili2511@41 {
> +		compatible = "ilitek,ili251x";
> +		reg = <0x41>;
> +		interrupt-parent = <&gpioi>;
> +		interrupts = <13 IRQ_TYPE_EDGE_FALLING>;
> +		reset-gpios = <&gpiog 14 GPIO_ACTIVE_LOW>;
> +		status = "okay";
> +	};
>   };
>   
>   &i2c8 {
> @@ -230,6 +276,39 @@ timer {
>   	};
>   };
>   
> +&ltdc {
> +	status = "okay";
> +
> +	port {
> +		ltdc_ep0_out: endpoint {
> +			remote-endpoint = <&lvds_in>;
> +		};
> +	};
> +};
> +
> +&lvds {
> +	status = "okay";
> +
> +	ports {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		port@0 {
> +			reg = <0>;
> +			lvds_in: endpoint {
> +				remote-endpoint = <&ltdc_ep0_out>;
> +			};
> +		};
> +
> +		port@1 {
> +			reg = <1>;
> +			lvds_out0: endpoint {
> +				remote-endpoint = <&lvds_panel_in>;
> +			};
> +		};
> +	};
> +};
> +
>   &rtc {
>   	status = "okay";
>   };
>
