Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC8AC4B017B
	for <lists+dri-devel@lfdr.de>; Thu, 10 Feb 2022 01:10:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5F6010E31B;
	Thu, 10 Feb 2022 00:10:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89E1310E31B
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Feb 2022 00:10:36 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id m4so11366663ejb.9
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Feb 2022 16:10:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=KuWfWfuWnqE3Lf1pLThOJ9cbGV0fB5/az1fd713TDVM=;
 b=eORsgRc5opCCy82zZDyt/YscGu57swjkPfQHflgTUMgjhFWIaTU9Avbx8cRoq0Ja+0
 pPdE0URc2/SwKMYrfmpYNRCJlHk9mHA9K6htJlKYQkVrIVjWCL41AaKObtFjGuIbBb6m
 hafyl4vx9aXs9g6fxXOF8xxNLh56Nr+2udy3B6Uy8hagxNMDojP5oKiFOECZJ/S5n4l3
 3AaeEKJbs8rAmJNha6Mj8uASFVLRJNnl0Y4A8t7V4I80A9SG/2jG5uoDSwDc+ldo8UoO
 Cd+Q+oxKWOFppQQz+jeUO69JYP6ixXpx/38c+iUWuwM6JoabkalmscwpEj4hQ3LIZYuw
 DZsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=KuWfWfuWnqE3Lf1pLThOJ9cbGV0fB5/az1fd713TDVM=;
 b=DDqGiCCOSkPOzOemuoZVaRrfhIC+yg7dmt/UXttMCzjB6JwhoGBuID58PzwSDusKxm
 ByMf5odCZTrWqBMt531se0CDhjRkoKNF3QKxcvq8fCNArRGp4KEBCJ5bcsDgZpuBMthK
 2YdpQ0thuhjfQkyhLk65Qv9Cc0sDueVKPhkFolXFulhIuaKsU0axACvz9CHqltHLMFVH
 VS79kue699BZQc2jX1V9c7mE6drB+rJEwJMfGZtobREe2gRn9SYfqScnS4y6UGHi4UJX
 1PrSx4Vl83Ca+HbnvsCDP4uQ4FbtD2xxRwax07whbDHJoj26jRVoFf+f4+l5UMe548fA
 cR7A==
X-Gm-Message-State: AOAM530v87E/AKsyGjJt+fWZ43lZ7oDdesexgBE5bo4OPyOtEpKJexlq
 f/9RI0dhxE+ZSyabdcEcc7Y=
X-Google-Smtp-Source: ABdhPJz5HdwaLCZg0YGvrdms4wZCJ7d2vvjkkE7V8xjEya3YrI6hanWQq3TZeFNN4LgM/36xxIBSKQ==
X-Received: by 2002:a17:906:4781:: with SMTP id
 cw1mr4273977ejc.264.1644451833902; 
 Wed, 09 Feb 2022 16:10:33 -0800 (PST)
Received: from [192.168.2.1] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
 by smtp.gmail.com with ESMTPSA id
 i6sm8992267edf.20.2022.02.09.16.10.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Feb 2022 16:10:33 -0800 (PST)
Message-ID: <3492afbf-b9fc-d5f5-6f7a-2157442d8209@gmail.com>
Date: Thu, 10 Feb 2022 01:10:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v5 19/23] arm64: dts: rockchip: rk3568-evb: Enable VOP2
 and hdmi
Content-Language: en-US
To: Sascha Hauer <s.hauer@pengutronix.de>, dri-devel@lists.freedesktop.org
References: <20220209095350.2104049-1-s.hauer@pengutronix.de>
 <20220209095350.2104049-20-s.hauer@pengutronix.de>
From: Johan Jonker <jbx6244@gmail.com>
In-Reply-To: <20220209095350.2104049-20-s.hauer@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
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
 Peter Geis <pgwipeout@gmail.com>, Sandy Huang <hjc@rock-chips.com>,
 linux-rockchip@lists.infradead.org,
 Michael Riesch <michael.riesch@wolfvision.net>, kernel@pengutronix.de,
 Andy Yan <andy.yan@rock-chips.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sascha,

Something with port and endpoint gives notifications.
Somehow with the conversion of rockchip,dw-hdmi.txt to YAML not all SoC
options were checked/covered (see rk3328 and rk3568).

Allow multiple vop:
port or
port@0
1x vop -> endpoint

2x vop -> endpoint@0
       -> endpoint@1

Also allow for connector:
(not all existing DT have this yet)
port@1
      -> endpoint

See also at graph.yaml
===

dtc -I dtb -O dts rk3568-evb1-v10.dtb
<stdout>: Warning (avoid_unnecessary_addr_size):
/hdmi@fe0a0000/ports/port@1: unnecessary #address-cells/#size-cells
without "ranges" or child "reg" property
<stdout>: Warning (graph_child_address): /hdmi@fe0a0000/ports/port@0:
graph node has single child node 'endpoint@0',
#address-cells/#size-cells are not necessary
<stdout>: Warning (graph_child_address): /hdmi@fe0a0000/ports/port@1:
graph node has single child node 'endpoint', #address-cells/#size-cells
are not necessary

===

ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- make dtbs_check
DT_SCHEMA_FILES=Documentation/devicetree/bindings/display/rockchip/rockchip,dw-hdmi.yaml

  DTC     arch/arm64/boot/dts/rockchip/rk3566-quartz64-a.dt.yaml
  CHECK   arch/arm64/boot/dts/rockchip/rk3566-quartz64-a.dt.yaml
/arch/arm64/boot/dts/rockchip/rk3566-quartz64-a.dt.yaml: hdmi@fe0a0000:
ports: 'port' is a required property
	From schema:
/home/user/Downloads/linux-next-20220202/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-hdmi.yaml
  DTC     arch/arm64/boot/dts/rockchip/rk3568-evb1-v10.dt.yaml
  CHECK   arch/arm64/boot/dts/rockchip/rk3568-evb1-v10.dt.yaml
/arch/arm64/boot/dts/rockchip/rk3568-evb1-v10.dt.yaml: hdmi@fe0a0000:
ports: 'port' is a required property
	From schema:
/home/user/Downloads/linux-next-20220202/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-hdmi.yaml

===

On 2/9/22 10:53, Sascha Hauer wrote:
> This enabled the VOP2 display controller along with hdmi and the
> required port routes which is enough to get a picture out of the
> hdmi port of the board.
> 
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> ---
> 
> Notes:
>     Changes since v4:
>     - Sort nodes alphabetically
>     
>     Changes since v3:
>     - Fix HDMI connector type
> 
>  .../boot/dts/rockchip/rk3568-evb1-v10.dts     | 48 +++++++++++++++++++
>  1 file changed, 48 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3568-evb1-v10.dts b/arch/arm64/boot/dts/rockchip/rk3568-evb1-v10.dts
> index 184e2aa2416a..18f0f5abddcf 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3568-evb1-v10.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3568-evb1-v10.dts
> @@ -7,6 +7,7 @@
>  /dts-v1/;
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/pinctrl/rockchip.h>
> +#include <dt-bindings/soc/rockchip,vop2.h>
>  #include "rk3568.dtsi"
>  
>  / {
> @@ -33,6 +34,17 @@ dc_12v: dc-12v {
>  		regulator-max-microvolt = <12000000>;
>  	};
>  
> +	hdmi-con {
> +		compatible = "hdmi-connector";
> +		type = "a";
> +
> +		port {
> +			hdmi_con_in: endpoint {
> +				remote-endpoint = <&hdmi_out_con>;
> +			};
> +		};
> +	};
> +
>  	vcc3v3_sys: vcc3v3-sys {
>  		compatible = "regulator-fixed";
>  		regulator-name = "vcc3v3_sys";
> @@ -106,6 +118,25 @@ &gmac1m1_rgmii_clk
>  	status = "okay";
>  };
>  
> +&hdmi {
> +	avdd-0v9-supply = <&vdda0v9_image>;
> +	avdd-1v8-supply = <&vcca1v8_image>;
> +	status = "okay";
> +};
> +
> +&hdmi_in {
> +	hdmi_in_vp0: endpoint@0 {
> +		reg = <0>;
> +		remote-endpoint = <&vp0_out_hdmi>;
> +	};
> +};
> +
> +&hdmi_out {
> +	hdmi_out_con: endpoint {
> +		remote-endpoint = <&hdmi_con_in>;
> +	};
> +};
> +
>  &i2c0 {
>  	status = "okay";
>  
> @@ -390,3 +421,20 @@ &sdmmc0 {
>  &uart2 {
>  	status = "okay";
>  };
> +
> +&vop {
> +	assigned-clocks = <&cru DCLK_VOP0>, <&cru DCLK_VOP1>;
> +	assigned-clock-parents = <&pmucru PLL_HPLL>, <&cru PLL_VPLL>;
> +	status = "okay";
> +};
> +
> +&vop_mmu {
> +	status = "okay";
> +};
> +
> +&vp0 {
> +	vp0_out_hdmi: endpoint@RK3568_VOP2_EP_HDMI {
> +		reg = <RK3568_VOP2_EP_HDMI>;
> +		remote-endpoint = <&hdmi_in_vp0>;
> +	};
> +};
