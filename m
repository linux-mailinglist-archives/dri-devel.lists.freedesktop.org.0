Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F9874E3F43
	for <lists+dri-devel@lfdr.de>; Tue, 22 Mar 2022 14:16:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E843610E5AC;
	Tue, 22 Mar 2022 13:15:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 624FF10E58F
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Mar 2022 13:15:53 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id F103D3200D30;
 Tue, 22 Mar 2022 09:05:55 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Tue, 22 Mar 2022 09:05:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 cc:cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; bh=YFGZ0UJuUFoy2R
 6hhsX/1jZvEN7I+WIffxGBRVSniZc=; b=hQ/5JLJdtnCNVSb/1H4FXnO5xcGjec
 75gOTaaI/Dn5wgvnEF9B931gR8GWvkLg2rFu0a4n086sA9ReMwZdXkPh6Ccc/Mcd
 tLfleZzlYlPBDC1UTvXhZnzADMNtIwZgWcV7OLy8EusZsRUh2D77q+1GwTyFQ0Am
 kMTeJNjp51sobmD0uz6/WxtemcJQxNFCwrZJ8yxHGwbB8qJikHBW1CPaMaOInehL
 kAAk0+90GojUVZWwtaB2vOBvA1IOE1Butt0Oc5QDyygt4juYTXlhXQ2PJMwk0lNo
 VhUGZuSKSKASk3qBSSZHCEkyyNOD4nV1dIC+jVaD/wF7MgAjbbMXbF5w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=YFGZ0UJuUFoy2R6hhsX/1jZvEN7I+WIffxGBRVSni
 Zc=; b=lKZswkSGeVQ3b82Yrj1LkL4vCSpyZ1a3QAN2ISS8QVQQV+chCiJnfLGM6
 rjCTRuaHF6QuapiQ6ncLgSiLexVsWXELGzwHJA/YfC9gVDR5JlANa5oXL/QU65Bz
 wsE7pFSDUDSr2FYNEeFb1uC5Z112eo/KqMwcWxcDA9w5Cax3nedYZYKIqF4dJVUD
 F4pJIsBZmI4/ZXYqq4tBF+5auQ5Xpl9acy6DBsztJsHQ04d1Mqwin6bYldpik6X5
 PoRA07el9EOCM9Gsod/8cnF8jfRbG4OdN353/MriiX88/bJgH/rVHra8bEuxTntH
 iKH3wehjfar3uDUQ7T+80z78uLDDw==
X-ME-Sender: <xms:nsk5YqHzAiUmOvcNm0d0fhMNiuGC8KIvwMHcyN4qpA323uF1kNQhZg>
 <xme:nsk5YrV9hucwSTsgSwFojWm34xWOUOOGp75QehCOeo-2DxTGsDBfmY80LXHdVjU50
 ejC6oqxF6fJXtOqxTI>
X-ME-Received: <xmr:nsk5YkJ8cDkKBAfWlz15qyNTmBG71BpkbysUu3OfGeNDC9Yf5Ixua4cP4_t_kXM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudeghedggeeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepkfffgggfuffvfhfhjggtgfesthekredttdefjeenucfhrhhomheplfhirgig
 uhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqeenuc
 ggtffrrghtthgvrhhnpeehieduvdevhfekjeeftddtkeeitefhudekvdeiueeulefgleei
 jeeghedvkeduleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
 hrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:n8k5YkGgQ5LF_eH87ffkxId_SEoggMs3guqiWFJZ3yGn-sX3ZASIGw>
 <xmx:n8k5YgVm9V4qSeTSdCJ7O6DRYzpi2jTLQty4Amx39IAysMKw_uWnfA>
 <xmx:n8k5YnOKp8tc_yfyR2gdvc0dstEUzr7ni526cBGfvJ8k--XVVZ8NEA>
 <xmx:s8k5YnM0MkkQlJx1Pd-zAinIsoD5s--nF5v2StY-kTxmon06t6ZWWw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 22 Mar 2022 09:05:31 -0400 (EDT)
Message-ID: <2644866a-8db2-923e-4227-2aa6d8e375fe@flygoat.com>
Date: Tue, 22 Mar 2022 13:05:29 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v11 2/7] MIPS: Loongson64: dts: introduce ls3A4000
 evaluation board
Content-Language: en-GB
To: Sui Jingfeng <15330273260@189.cn>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Roland Scheidegger <sroland@vmware.com>, Zack Rusin <zackr@vmware.com>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>,
 Sam Ravnborg <sam@ravnborg.org>, "David S . Miller" <davem@davemloft.net>,
 Lucas Stach <l.stach@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Ilia Mirkin <imirkin@alum.mit.edu>, Qing Zhang <zhangqing@loongson.cn>,
 suijingfeng <suijingfeng@loongson.cn>
References: <20220321162916.1116541-1-15330273260@189.cn>
 <20220321162916.1116541-3-15330273260@189.cn>
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
In-Reply-To: <20220321162916.1116541-3-15330273260@189.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



在 2022/3/21 16:29, Sui Jingfeng 写道:
> From: suijingfeng <suijingfeng@loongson.cn>
>
> The board name is LS3A4000_7A1000_EVB_BOARD_V1.4, it consist of 1.8Ghz
> mips64r5 4-core CPU and LS7A1000 bridge chip. It has PCIe GEN2 x8 slot,
> therefore can play with discrete graphics card.

Hi Jingfeng,

As we've discussed before if you are going to introduce new dts then you 
*MUST*
include it in makefile and wire it up in code.

A dts file doing nothing lying in the tree is just suspicious.

Thanks.
- Jiaxun

>
> While the integrated display copntroller is equipped with a VGA output
> and a DVI output, the VGA is connect to the DVO0 output port of the
> display controller, the DVI is connected to DVO1 output port of the
> display controller.
>
>      +------+            +-----------------------------------+
>      | DDR4 |            |  +-------------------+            |
>      +------+            |  | PCIe Root complex |   LS7A1000 |
>         || MC0           |  +--++---------++----+            |
>    +----------+  HT 3.0  |     ||         ||                 |
>    | LS3A4000 |<-------->| +---++---+  +--++--+    +---------+   +------+
>    |   CPU    |<-------->| | GC1000 |  | LSDC |<-->| DDR3 MC |<->| VRAM |
>    +----------+          | +--------+  +-+--+-+    +---------+   +------+
>         || MC1           +---------------|--|----------------+
>      +------+                            |  |
>      | DDR4 |          +-------+   DVO0  |  |  DVO1   +------+
>      +------+   VGA <--|ADV7125|<--------+  +-------->|TFP410|--> DVI/HDMI
>                        +-------+                      +------+
>
> Signed-off-by: suijingfeng <suijingfeng@loongson.cn>
> Signed-off-by: Sui Jingfeng <15330273260@189.cn>
> ---
>   .../boot/dts/loongson/ls3a4000_7a1000_evb.dts | 136 ++++++++++++++++++
>   1 file changed, 136 insertions(+)
>   create mode 100644 arch/mips/boot/dts/loongson/ls3a4000_7a1000_evb.dts
>
> diff --git a/arch/mips/boot/dts/loongson/ls3a4000_7a1000_evb.dts b/arch/mips/boot/dts/loongson/ls3a4000_7a1000_evb.dts
> new file mode 100644
> index 000000000000..f467eddccdac
> --- /dev/null
> +++ b/arch/mips/boot/dts/loongson/ls3a4000_7a1000_evb.dts
> @@ -0,0 +1,136 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +/dts-v1/;
> +
> +#include "loongson64g-package.dtsi"
> +#include "ls7a-pch.dtsi"
> +
> +/ {
> +	compatible = "loongson,loongson64g-4core-ls7a";
> +	model = "LS3A4000_7A1000_EVB_BOARD_V1.4";
> +
> +	vga-encoder {
> +		compatible = "adi,adv7123", "dumb-vga-dac";
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +				adv7123_in: endpoint {
> +					remote-endpoint = <&dc_out_rgb0>;
> +				};
> +			};
> +
> +			port@1 {
> +				reg = <1>;
> +				adv7123_out: endpoint {
> +					remote-endpoint = <&vga_connector_in>;
> +				};
> +			};
> +		};
> +	};
> +
> +	vga-connector {
> +		compatible = "vga-connector";
> +		label = "vga";
> +
> +		ddc-i2c-bus = <&i2c6>;
> +
> +		port {
> +			vga_connector_in: endpoint {
> +				remote-endpoint = <&adv7123_out>;
> +			};
> +		};
> +	};
> +
> +	tfp410: dvi-encoder {
> +		compatible = "ti,tfp410";
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +				tfp410_in: endpoint {
> +					pclk-sample = <1>;
> +					bus-width = <24>;
> +					remote-endpoint = <&dc_out_rgb1>;
> +				};
> +			};
> +
> +			port@1 {
> +				reg = <1>;
> +				tfp410_out: endpoint {
> +					remote-endpoint = <&dvi_connector_in>;
> +				};
> +			};
> +		};
> +	};
> +
> +	dvi-connector {
> +		compatible = "dvi-connector";
> +		label = "dvi";
> +		digital;
> +
> +		ddc-i2c-bus = <&i2c7>;
> +
> +		port {
> +			dvi_connector_in: endpoint {
> +				remote-endpoint = <&tfp410_out>;
> +			};
> +		};
> +	};
> +};
> +
> +&package0 {
> +	htvec: interrupt-controller@efdfb000080 {
> +		compatible = "loongson,htvec-1.0";
> +		reg = <0xefd 0xfb000080 0x40>;
> +		interrupt-controller;
> +		#interrupt-cells = <1>;
> +
> +		interrupt-parent = <&liointc>;
> +		interrupts = <24 IRQ_TYPE_LEVEL_HIGH>,
> +			     <25 IRQ_TYPE_LEVEL_HIGH>,
> +			     <26 IRQ_TYPE_LEVEL_HIGH>,
> +			     <27 IRQ_TYPE_LEVEL_HIGH>,
> +			     <28 IRQ_TYPE_LEVEL_HIGH>,
> +			     <29 IRQ_TYPE_LEVEL_HIGH>,
> +			     <30 IRQ_TYPE_LEVEL_HIGH>,
> +			     <31 IRQ_TYPE_LEVEL_HIGH>;
> +	};
> +};
> +
> +&pch {
> +	msi: msi-controller@2ff00000 {
> +		compatible = "loongson,pch-msi-1.0";
> +		reg = <0 0x2ff00000 0 0x8>;
> +		interrupt-controller;
> +		msi-controller;
> +		loongson,msi-base-vec = <64>;
> +		loongson,msi-num-vecs = <192>;
> +		interrupt-parent = <&htvec>;
> +	};
> +};
> +
> +&lsdc {
> +	ports {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		port@0 {
> +			endpoint {
> +				remote-endpoint = <&adv7123_in>;
> +			};
> +		};
> +
> +		port@1 {
> +			endpoint {
> +				remote-endpoint = <&tfp410_in>;
> +			};
> +		};
> +	};
> +};

