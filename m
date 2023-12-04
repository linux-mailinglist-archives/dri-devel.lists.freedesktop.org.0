Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E201803DAD
	for <lists+dri-devel@lfdr.de>; Mon,  4 Dec 2023 19:57:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16DE510E3C6;
	Mon,  4 Dec 2023 18:56:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDA6010E3C4
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Dec 2023 18:56:51 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a1b75f59a12so159800366b.3
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Dec 2023 10:56:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701716210; x=1702321010; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Pri3ddujsFeLv389wEODEb2MJ2HdQA1JC0+3zG94NUY=;
 b=k3Z2sNFcJBXDvWLYP3bxwOJdKFcYx5y8TB9dn9Izo5hMgR026NPSkD8UWs+46zwBeh
 +XoFpmGalh1YiJhLNSew2vRmIEgGPn7hL9KtH/s7/7WL1358qXXfFs0Iew7sYsMs3ozG
 3WA5+D18GSrk6R2lYKF6ZgBQDhWbe1G1clRcTk45PMQhjXqsFErI0GmB0VoFWCuyYEk9
 1Oe39rn+wA5JB4BjgquYjfKc0YHJQwDF1BaqxNpJ+fFatOT01UAskF+kYIZZPENjfPXw
 LBTgyFNHLDcH+CBAAFR0HeapKA/TbQ38ww8/HHBovl7DwCdMK2xM97wwx5rVlKZAZFQN
 CxAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701716210; x=1702321010;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Pri3ddujsFeLv389wEODEb2MJ2HdQA1JC0+3zG94NUY=;
 b=trdFU9k/J2scsjFIK0mZqepXprSe3osumv5ok1zbpuWbJaG+3MWNlSpYgVpyoq3JoT
 uDLKpHiQzsOaO1lRyeNmQOJIgaj6BdFQDGMeTadfu7jQUa+Xilu7lDStJoTlDOJNj38A
 rxD321euwwikDRrw/QEHmmqnGfpy4G4YYJQFGlQZE6UkFXISGBfU0/d3+GeHyM3+hczR
 99+edJcchNC5pIjZ0b8DCThf9dH8IRQ81BV6VTRAu71gIlvK7w1UH8EKfLFsldve7lTA
 TUUpp7le7qAYFbJx/P84W84+BJVN+Jv2TLbTaHhlrhoUHQvXszWGxuSUOglxlkhfEXMf
 dWtQ==
X-Gm-Message-State: AOJu0Yw2dfV+zIOTUJqZottAv0USUff06JgWIUhe6unJBNdG4iJp1FWJ
 KoIjNF88OaKjKnQV6iphhQ==
X-Google-Smtp-Source: AGHT+IGnP+vNUpVLS/Ix1nYmpgtRz3wo5KT/7n9jXzwcrtYk1AyMn8XyPfIEuOuPjnH3bC3jQwA37Q==
X-Received: by 2002:a17:906:d797:b0:a19:5e12:d570 with SMTP id
 pj23-20020a170906d79700b00a195e12d570mr1718314ejb.64.1701716210062; 
 Mon, 04 Dec 2023 10:56:50 -0800 (PST)
Received: from ?IPV6:2a02:810b:f40:4300:55ff:210b:5393:c9d7?
 ([2a02:810b:f40:4300:55ff:210b:5393:c9d7])
 by smtp.gmail.com with ESMTPSA id
 di16-20020a170906731000b00a1b6d503e7esm1847680ejc.157.2023.12.04.10.56.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Dec 2023 10:56:49 -0800 (PST)
Message-ID: <3f235189-da75-4e9d-ad68-8cbebca12f6d@gmail.com>
Date: Mon, 4 Dec 2023 19:56:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] dt-bindings: drm: rockchip: convert
 inno_hdmi-rockchip.txt to yaml
Content-Language: en-US
To: Johan Jonker <jbx6244@gmail.com>, heiko@sntech.de, hjc@rock-chips.com
References: <49c6afec-022f-02de-99a0-d409b64da198@gmail.com>
From: Alex Bee <knaerzche@gmail.com>
In-Reply-To: <49c6afec-022f-02de-99a0-d409b64da198@gmail.com>
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, tzimmermann@suse.de,
 krzysztof.kozlowski+dt@linaro.org, linux-kernel@vger.kernel.org,
 mripard@kernel.org, linux-rockchip@lists.infradead.org, robh+dt@kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Johan,
Am 04.12.23 um 18:39 schrieb Johan Jonker:
> Convert inno_hdmi-rockchip.txt to yaml.
Nice - I'm having something very similar on my queue :)
> 
> Signed-off-by: Johan Jonker <jbx6244@gmail.com>
> ---
> 
> Note for rob+dt:
>    Used enum to "soon" be able to add "rockchip,rk3128-inno-hdmi"
Yeah, actually I'm planning to submit it really soon (if timne allows).
> 
> Changed V1:
>    Rename file to more common layout
>    Add/fix hdmi_out port example
> ---
>   .../display/rockchip/inno_hdmi-rockchip.txt   |  49 ---------
>   .../display/rockchip/rockchip,inno-hdmi.yaml  | 103 ++++++++++++++++++
>   2 files changed, 103 insertions(+), 49 deletions(-)
>   delete mode 100644 Documentation/devicetree/bindings/display/rockchip/inno_hdmi-rockchip.txt
>   create mode 100644 Documentation/devicetree/bindings/display/rockchip/rockchip,inno-hdmi.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/rockchip/inno_hdmi-rockchip.txt b/Documentation/devicetree/bindings/display/rockchip/inno_hdmi-rockchip.txt
> deleted file mode 100644
> index cec21714f0e0..000000000000
> --- a/Documentation/devicetree/bindings/display/rockchip/inno_hdmi-rockchip.txt
> +++ /dev/null
> @@ -1,49 +0,0 @@
> -Rockchip specific extensions to the Innosilicon HDMI
> -================================
> -
> -Required properties:
> -- compatible:
> -	"rockchip,rk3036-inno-hdmi";
> -- reg:
> -	Physical base address and length of the controller's registers.
> -- clocks, clock-names:
> -	Phandle to hdmi controller clock, name should be "pclk"
> -- interrupts:
> -	HDMI interrupt number
> -- ports:
> -	Contain one port node with endpoint definitions as defined in
> -	Documentation/devicetree/bindings/graph.txt.
> -- pinctrl-0, pinctrl-name:
> -	Switch the iomux of HPD/CEC pins to HDMI function.
> -
> -Example:
> -hdmi: hdmi@20034000 {
> -	compatible = "rockchip,rk3036-inno-hdmi";
> -	reg = <0x20034000 0x4000>;
> -	interrupts = <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>;
> -	clocks = <&cru  PCLK_HDMI>;
> -	clock-names = "pclk";
> -	pinctrl-names = "default";
> -	pinctrl-0 = <&hdmi_ctl>;
> -
> -	hdmi_in: port {
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> -		hdmi_in_lcdc: endpoint@0 {
> -			reg = <0>;
> -			remote-endpoint = <&lcdc_out_hdmi>;
> -		};
> -	};
> -};
> -
> -&pinctrl {
> -	hdmi {
> -		hdmi_ctl: hdmi-ctl {
> -			rockchip,pins = <1 8  RK_FUNC_1 &pcfg_pull_none>,
> -					<1 9  RK_FUNC_1 &pcfg_pull_none>,
> -					<1 10 RK_FUNC_1 &pcfg_pull_none>,
> -					<1 11 RK_FUNC_1 &pcfg_pull_none>;
> -		};
> -	};
> -
> -};
> diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,inno-hdmi.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,inno-hdmi.yaml
> new file mode 100644
> index 000000000000..96889c86849a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,inno-hdmi.yaml
> @@ -0,0 +1,103 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/rockchip/rockchip,inno-hdmi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Rockchip Innosilicon HDMI controller
> +
> +maintainers:
> +  - Sandy Huang <hjc@rock-chips.com>
> +  - Heiko Stuebner <heiko@sntech.de>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - rockchip,rk3036-inno-hdmi
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
The interrupts/clock description exists already in the txt-bindings - so 
how about:

+    items:
+      - descrition: ....
> +
> +  clock-names:
> +    const: pclk
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description:
> +          Port node with one endpoint connected to a vop node.
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description:
> +          Port node with one endpoint connected to a hdmi-connector node.
> +
> +    required:
> +      - port@0
> +      - port@1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - pinctrl-0
> +  - pinctrl-names
> +  - ports
> +
> +additionalProperties: false
Did you check that with dtbs_check? RK3036's SoC dtsi also contains a

  rockchip,grf = <&grf>;

and I'm not seeing this removed in this series.

It would be great if that would added here to as requirement
for RK3036 too  (and updated in the example)
Even if it is beyond a pure txt to yaml conversion: RK3036 needs to set 
HDMI polarities in GRF.

Regards,
Alex
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/rk3036-cru.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/pinctrl/rockchip.h>
> +    hdmi: hdmi@20034000 {
> +      compatible = "rockchip,rk3036-inno-hdmi";
> +      reg = <0x20034000 0x4000>;
> +      interrupts = <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>;
> +      clocks = <&cru  PCLK_HDMI>;
> +      clock-names = "pclk";
> +      pinctrl-names = "default";
> +      pinctrl-0 = <&hdmi_ctl>;
> +
> +      ports {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        hdmi_in: port@0 {
> +          reg = <0>;
> +          hdmi_in_vop: endpoint {
> +            remote-endpoint = <&vop_out_hdmi>;
> +          };
> +        };
> +
> +        hdmi_out: port@1 {
> +          reg = <1>;
> +          hdmi_out_con: endpoint {
> +            remote-endpoint = <&hdmi_con_in>;
> +          };
> +        };
> +      };
> +    };
> +
> +    pinctrl {
> +      hdmi {
> +        hdmi_ctl: hdmi-ctl {
> +          rockchip,pins = <1 RK_PB0 1 &pcfg_pull_none>,
> +                          <1 RK_PB1 1 &pcfg_pull_none>,
> +                          <1 RK_PB2 1 &pcfg_pull_none>,
> +                          <1 RK_PB3 1 &pcfg_pull_none>;
> +        };
> +      };
> +    };
> --
> 2.39.2
> 
> 
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip

