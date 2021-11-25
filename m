Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A6FC45E186
	for <lists+dri-devel@lfdr.de>; Thu, 25 Nov 2021 21:25:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66CFC6E0D8;
	Thu, 25 Nov 2021 20:25:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39E876E0D8
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Nov 2021 20:25:31 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id r11so30029806edd.9
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Nov 2021 12:25:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ZSnik8NcU0u5qOzWlj5b8WbdugM5rGFbMq5L1b0uNC8=;
 b=AOn0VOfhkTxdu+vzMP5xsC8cO5h0gfpvRTrqsMfXL07wWDZqUSCLO+dUyYP3Qf5c98
 c7tmPwtcURNxUIr/jViDUM2yFg+qOm1wL0C3T9BXZb9HHF0ohFDt3fB/p94Rr6I2bSrZ
 /ksDXErtHUDnGbjkRxAM2URy/grJx8SFW2aBwPhlCd3B28gvfRrjUUtbayo/h8ZShnfc
 BG89tneo1zJ8DXo6D5uZwRtI1CUT+iQsAInYEDa6DaLyHKC+jBYTe6FiawZLCegxxJM2
 cGRsjzH4qGvOsDBjeuAfUDtRAd4mRyqNq64dq1aESH+W3gcsSP6+p1JxjeRST5P++kJU
 8pDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZSnik8NcU0u5qOzWlj5b8WbdugM5rGFbMq5L1b0uNC8=;
 b=6cE3whgTUxAEQG9NieIxrrI7Z4cJr7cNzOpH1x799tAzygBkGj/AdMms5/YOVR1hBi
 MxGv0tZuC+7bJffOLMqp6MiD+P1q7rBaZis43idjqE+im/1039P7bKNElwQi97Nhous1
 rjTNhm98FqSscRQ6E+K47kg9YLRD3lHeTjPP5lrSKyAo2ZHo4+zleVMyY9Z2RZtEHcYc
 a+2bOs2GUZBdADhWDH/ziZpideTBw+to0UKzMom61IWH9EESas4R3rk5XKU+Q3BUxfqt
 xeYgqE5hnln4tuJh196bIy+L+eF+HJvRfsEtMHZpJcsbIU56RBCVH2nI8yJQtc3Jqoi8
 SpMQ==
X-Gm-Message-State: AOAM53395hEUPVuZMFuvKtNIekC0Vqc1pWsp9783LgHMTiyhj052zwuA
 Ml6EIIBkNtfB+fMh7RvFgYsw8HEqUkY=
X-Google-Smtp-Source: ABdhPJxMdvb+TwhoTKjll0Yi5zz8ljEg/JvVYM+96BP+jCG/SovZT9Nc6qI3x3jwhb8IeMfmO3pRuQ==
X-Received: by 2002:a17:906:fb17:: with SMTP id
 lz23mr34142477ejb.149.1637871929572; 
 Thu, 25 Nov 2021 12:25:29 -0800 (PST)
Received: from [192.168.2.1] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
 by smtp.gmail.com with ESMTPSA id
 y22sm2678678edi.8.2021.11.25.12.25.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Nov 2021 12:25:29 -0800 (PST)
Subject: Re: [PATCH 08/12] arm64: dts: rockchip: rk356x: Add VOP2 nodes
To: Sascha Hauer <s.hauer@pengutronix.de>, dri-devel@lists.freedesktop.org
References: <20211117143347.314294-1-s.hauer@pengutronix.de>
 <20211117143347.314294-9-s.hauer@pengutronix.de>
From: Johan Jonker <jbx6244@gmail.com>
Message-ID: <8451aeb1-03c9-6c90-c95e-c4a76e2159b8@gmail.com>
Date: Thu, 25 Nov 2021 21:25:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211117143347.314294-9-s.hauer@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: devicetree@vger.kernel.org,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Sandy Huang <hjc@rock-chips.com>, linux-rockchip@lists.infradead.org,
 Michael Riesch <michael.riesch@wolfvision.net>, kernel@pengutronix.de,
 Peter Geis <pgwipeout@gmail.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sascha,


On 11/17/21 3:33 PM, Sascha Hauer wrote:
> The VOP2 is the display output controller on the RK3568. Add the node
> for it to the dtsi file along with the required display-subsystem node
> and the iommu node.
> 
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> ---
>  arch/arm64/boot/dts/rockchip/rk356x.dtsi | 52 ++++++++++++++++++++++++
>  1 file changed, 52 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk356x.dtsi b/arch/arm64/boot/dts/rockchip/rk356x.dtsi
> index 46d9552f60284..6ebf7c14e096a 100644
> --- a/arch/arm64/boot/dts/rockchip/rk356x.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk356x.dtsi
> @@ -447,6 +447,58 @@ gmac1_mtl_tx_setup: tx-queues-config {
>  		};
>  	};
>  

> +	display_subsystem: display-subsystem {
> +		compatible = "rockchip,display-subsystem";
> +		ports = <&vop_out>;
> +	};

Some DT sort rules:

For nodes:
Sort things without reg alphabetical first,
then sort the rest by reg address.

> +
> +	vop: vop@fe040000 {

> +		compatible = "rockchip,rk3568-vop";

From rockchip-vop2.yaml:
+properties:
+  compatible:
+    enum:

+      - rockchip,rk3568-vop
+      - rockchip,rk3566-vop

Maybe sort yaml compatibles in alphabetical order.

rockchip,rk3566-vop is not used in the dtsi I think.

Comment by Andy Yan:
> 
> But take care that the vop on rk3566 has a special limitation: there are 
> three
> 
> windows(Cluster1/Esmart1/Smart1) that have a mirror lock, that means they
> 
> can't be programed framebuffer address independently , they can only
> 
> share framebuffer address with Cluster0/Esmart0/Smart0.

Question:
Given Andy's comment could someone explain weather the vop and hdmi
nodes should be in rk3566.dtsi and rk3568.dtsi with an extra
rockchip,rk3566-dw-hdmi compatible?

> +		reg = <0x0 0xfe040000 0x0 0x3000>, <0x0 0xfe044000 0x0 0x1000>;
> +		reg-names = "regs", "gamma_lut";

> +		rockchip,grf = <&grf>;
Heiko's sort rules:

compatible
reg
interrupts
[alphabetical]
status [if needed]

> +		interrupts = <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>;
> +		clocks = <&cru ACLK_VOP>, <&cru HCLK_VOP>, <&cru DCLK_VOP0>, <&cru DCLK_VOP1>, <&cru DCLK_VOP2>;
> +		clock-names = "aclk_vop", "hclk_vop", "dclk_vp0", "dclk_vp1", "dclk_vp2";
> +		iommus = <&vop_mmu>;
> +		power-domains = <&power RK3568_PD_VO>;
> +		status = "disabled";
> +
> +		vop_out: ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			vp0: port@0 {

> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				reg = <0>;

My incomplete list:

Inside nodes:
If exists on top: compatible, reg and interrupts.
In alphabetical order the required properties.
Then in alphabetical order the other properties.
And as last things that start with '#' in alphabetical order.
Add status below all other properties for soc internal components with
any board-specifics.

> +			};
> +
> +			vp1: port@1 {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				reg = <1>;
> +			};
> +
> +			vp2: port@2 {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				reg = <2>;
> +			};
> +		};
> +	};
> +
> +	vop_mmu: iommu@fe043e00 {
> +		compatible = "rockchip,rk3568-iommu";
> +		reg = <0x0 0xfe043e00 0x0 0x100>, <0x0 0xfe043f00 0x0 0x100>;
> +		interrupts = <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>;

> +		interrupt-names = "vop_mmu";

ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- make dtbs_check
DT_SCHEMA_FILES=Documentation/devicetree/bindings/iommu/rockchip,iommu.yaml

arch/arm64/boot/dts/rockchip/rk3566-quartz64-a.dt.yaml: iommu@fe043e00:
'interrupt-names' does not match any of the regexes: 'pinctrl-[0-9]+'
	From schema: /Documentation/devicetree/bindings/iommu/rockchip,iommu.yaml

> +		clocks = <&cru ACLK_VOP>, <&cru HCLK_VOP>;
> +		clock-names = "aclk", "iface";
> +		#iommu-cells = <0>;
> +		status = "disabled";
> +	};
> +
>  	qos_gpu: qos@fe128000 {
>  		compatible = "rockchip,rk3568-qos", "syscon";
>  		reg = <0x0 0xfe128000 0x0 0x20>;
> 
