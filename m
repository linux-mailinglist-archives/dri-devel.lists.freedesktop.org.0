Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 087DE9D933E
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2024 09:26:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53FFE10E7D5;
	Tue, 26 Nov 2024 08:26:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="EmlXC/KM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1FEC10E12A
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2024 08:39:46 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id
 d2e1a72fcca58-724f81cc659so1072682b3a.2
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2024 00:39:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1732523986; x=1733128786; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0KGuZp0wmnF7hzmfITp90xIKhOfwwLfqha6id3DNJEw=;
 b=EmlXC/KMI1l/oWyqfg8/4u7CwRrG+AJq0h+ooNhJT905bBr3s79naNzJYlDjYiTouu
 pp/sIPc2L4FcS9d8hIIKZ7pLzvGADAqgKx88CBY7dvuwg+e+D91KHREYdSko0LDZ3Gc/
 Igk+OmGJkSH2+oWUSUO/21eY9u6iDz5o/H8iusc5hpaD1y9CtO4tZEnwNjAMgfAMmRKR
 7HqlGSUJczA68wG91R8YYP9MHfpD9/GRcb7rAAfoDG0kVi2Fivl0snznHN9ZuAOK4XPB
 YqkK81UtHHtKing5rC2mlYNI0Qpx8G0zISiZJ4OTKviBoLuaMKmiG+Tbh18ZpdTLog1+
 ERIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732523986; x=1733128786;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0KGuZp0wmnF7hzmfITp90xIKhOfwwLfqha6id3DNJEw=;
 b=fRP7S8yqda0jvHh60pswQht++W4S6WESrzgJ+f86os0EKRkoVabavs8hfJEztNFltR
 Z2k6kI+LdltpEYcXtIGHfSMOhmSIat8K/HD0wg7ESCJ4TI8b8Z22cesl87tncnmayWwg
 W5BSTNOXNLSqE/TZweK6UeJdMxRYmOpLVtF624arGnMUlrXfoAKfaOZGJBxZ87/ih01l
 k1d1UPkJAVuCPpitTK5psdoIEwrv3OIyixp7KyNLiW91cDI5n2aGxC/nHzdoS3VfDEbv
 FZAq+iqOBTGY+PXcTZ7Ux2RgJjuuq6RXGCvYhgY3d3qrBj8VQl9s0Jpknn7ZoJUx7hx1
 IC8A==
X-Forwarded-Encrypted: i=1;
 AJvYcCV23VUHSy/cWcJECc7GJQKNN+gUFN0+k9BRXhagUn7qVpYCA+GUHf66l0Bc0/Sd8SN05K8QyFLLEZs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy2uVsKj67+j81cynwGFhcpVI6lYrpPoiimMU5xgTnsa8Dk+4DZ
 4MIaqofuI+QObzIpvm8xKzH3pgRkGhglxRfxV3E2oXTHg7D9UxQG
X-Gm-Gg: ASbGncuHD/iIBOyDihHNLmE/5bqHI5MoeFZen/87GFC7PVOkMpVlV+twSxwhDxBPgPT
 GeqbAs4BXodTOYog0wwV3ugsCXEOi8VCn/NnBAG8yqifr5HTAEiHm5g0s8JgAY/aOWhVZTeaLhz
 ahM8CIc6YnIcbiFM70AM1OpFve7wPWxmrgqjCt9z3M3D7qnwcBomsQte3C9xZd/IaBjtrh0XDLn
 tSmkmqNXsrhTAIabek2w45Zg+N7S9NnMWtUiWiTVRwTJBVKbV0UPeALkpzPVlGpwlGn
X-Google-Smtp-Source: AGHT+IHU1nyBULHIR2177tUcXa0ze8GqotcNDT6gsNhsvTrJblPUvYHMUa+RMDMyUkRWs6wbq9n4YA==
X-Received: by 2002:a05:6a00:1251:b0:71e:cb:e7bf with SMTP id
 d2e1a72fcca58-724df66a8abmr14741216b3a.18.1732523985898; 
 Mon, 25 Nov 2024 00:39:45 -0800 (PST)
Received: from [192.168.0.115] ([59.188.211.160])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-724de454c55sm5838914b3a.35.2024.11.25.00.39.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Nov 2024 00:39:45 -0800 (PST)
Message-ID: <4381e1ef-6113-4fe5-a48a-ea4c163dd103@gmail.com>
Date: Mon, 25 Nov 2024 16:39:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] arm64: dts: apple: Add touchbar screen nodes
To: fnkl.kernel@gmail.com, Hector Martin <marcan@marcan.st>,
 Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, asahi@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Janne Grunau <j@jannau.net>
References: <20241124-adpdrm-v1-0-3191d8e6e49a@gmail.com>
 <20241124-adpdrm-v1-4-3191d8e6e49a@gmail.com>
Content-Language: en-US
From: Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <20241124-adpdrm-v1-4-3191d8e6e49a@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 26 Nov 2024 08:26:46 +0000
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



Sasha Finkelstein via B4 Relay 於 2024/11/25 早上6:29 寫道:
> From: Sasha Finkelstein <fnkl.kernel@gmail.com>
> 
> Adds device tree entries for the touchbar screen
> 
> Co-developed-by: Janne Grunau <j@jannau.net>
> Signed-off-by: Janne Grunau <j@jannau.net>
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> ---
>  arch/arm64/boot/dts/apple/t8103-j293.dts |  8 ++++++++
>  arch/arm64/boot/dts/apple/t8103.dtsi     | 26 ++++++++++++++++++++++++++
>  arch/arm64/boot/dts/apple/t8112-j493.dts | 15 +++++++++++++++
>  arch/arm64/boot/dts/apple/t8112.dtsi     | 25 +++++++++++++++++++++++++
>  4 files changed, 74 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/apple/t8103-j293.dts b/arch/arm64/boot/dts/apple/t8103-j293.dts
> index 56b0c67bfcda321b60c621de092643017693ff91..349a8fce6b0b8ccf3305f940ba7242e2c1a67754 100644
> --- a/arch/arm64/boot/dts/apple/t8103-j293.dts
> +++ b/arch/arm64/boot/dts/apple/t8103-j293.dts
> @@ -49,3 +49,11 @@ &i2c4 {
>  &fpwm1 {
>  	status = "okay";
>  };
> +
> +&display_dfr {

Inconsistent placement of #address-cells and #size-cells.
> +	status = "okay";

There should be a blank line here.
> +	dfr_panel: panel@0 {
> +		compatible = "apple,summit";
> +		reg = <0>;
> +	};
> +};
> diff --git a/arch/arm64/boot/dts/apple/t8103.dtsi b/arch/arm64/boot/dts/apple/t8103.dtsi
> index 9b0dad6b618444ac6b1c9735c50cccfc3965f947..b377c92c5db3cb4fea53ae2c5dd85acf038429a3 100644
> --- a/arch/arm64/boot/dts/apple/t8103.dtsi
> +++ b/arch/arm64/boot/dts/apple/t8103.dtsi
> @@ -356,6 +356,32 @@ cpufreq_p: performance-controller@211e20000 {
>  			#performance-domain-cells = <0>;
>  		};
>  
> +		display_dfr: display-pipe@228200000 {
> +			compatible = "apple,t8103-display-pipe", "apple,h7-display-pipe";
> +			reg-names = "be", "fe", "mipi";
> +			reg = <0x2 0x28200000 0x0 0xc000>,
> +				<0x2 0x28400000 0x0 0x4000>,
> +				<0x2 0x28600000 0x0 0x100000>;
> +			power-domains = <&ps_dispdfr_fe>, <&ps_dispdfr_be>, <&ps_mipi_dsi>;
> +			interrupt-parent = <&aic>;
> +			interrupts = <AIC_IRQ 502 IRQ_TYPE_LEVEL_HIGH>,
> +				<AIC_IRQ 506 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "be", "fe";
> +			status = "disabled";
> +			iommus = <&displaydfr_dart 0>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;

Inconsistent placement of #address-cells and #size-cells.
> +		};
> +
> +		displaydfr_dart: iommu@228304000 {
> +			compatible = "apple,t8103-dart";
> +			reg = <0x2 0x28304000 0x0 0x4000>;
> +			interrupt-parent = <&aic>;
> +			interrupts = <AIC_IRQ 504 IRQ_TYPE_LEVEL_HIGH>;
> +			#iommu-cells = <1>;
> +			power-domains = <&ps_dispdfr_fe>;
Not every M1 (T8103) device has a touch bar. Disable it here and
then enable it in t8103-j293.dts.

> +		};
> +
>  		sio_dart: iommu@235004000 {
>  			compatible = "apple,t8103-dart";
>  			reg = <0x2 0x35004000 0x0 0x4000>;
> diff --git a/arch/arm64/boot/dts/apple/t8112-j493.dts b/arch/arm64/boot/dts/apple/t8112-j493.dts
> index 0ad908349f55406783942735a2e9dad54cda00ec..80e371495f3e097f91e94549c7ac2949609f566f 100644
> --- a/arch/arm64/boot/dts/apple/t8112-j493.dts
> +++ b/arch/arm64/boot/dts/apple/t8112-j493.dts
> @@ -35,6 +35,21 @@ led-0 {
>  	};
>  };
>  
> +&display_dfr {
> +	status = "okay";
status should be after other properties, before child nodes.

> +	#address-cells = <1>;
> +	#size-cells = <0>;

Inconsistent placement of #address-cells and #size-cells. I would place
them in
t8112.dtsi.
> +
> +	dfr_panel: panel@0 {
> +		compatible = "apple,summit";
> +		reg = <0>;
> +	};
> +};
> +
> +&displaydfr_dart {
> +	status = "okay";
> +};
> +
>  /*
>   * Force the bus number assignments so that we can declare some of the
>   * on-board devices and properties that are populated by the bootloader
> diff --git a/arch/arm64/boot/dts/apple/t8112.dtsi b/arch/arm64/boot/dts/apple/t8112.dtsi
> index 1666e6ab250bc0be9b8318e3c8fc903ccd3f3760..726b11376692580abb129b9be35107bee1550a93 100644
> --- a/arch/arm64/boot/dts/apple/t8112.dtsi
> +++ b/arch/arm64/boot/dts/apple/t8112.dtsi
> @@ -379,6 +379,31 @@ cpufreq_p: cpufreq@211e20000 {
>  			#performance-domain-cells = <0>;
>  		};
>  
> +		display_dfr: display-pipe@228200000 {
> +			compatible = "apple,t8112-display-pipe", "apple,h7-display-pipe";
> +			reg-names = "be", "fe", "mipi";
> +			reg = <0x2 0x28200000 0x0 0xc000>,
> +				<0x2 0x28400000 0x0 0x4000>,
> +				<0x2 0x28600000 0x0 0x100000>;
> +			power-domains = <&ps_dispdfr_fe>, <&ps_dispdfr_be>, <&ps_mipi_dsi>;
> +			interrupt-parent = <&aic>;
> +			interrupts = <AIC_IRQ 614 IRQ_TYPE_LEVEL_HIGH>,
> +				<AIC_IRQ 618 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "be", "fe";
> +			status = "disabled";
> +			iommus = <&displaydfr_dart 0>;
> +		};
> +
> +		displaydfr_dart: iommu@228304000 {
> +			compatible = "apple,t8110-dart";
> +			reg = <0x2 0x28304000 0x0 0x4000>;
> +			interrupt-parent = <&aic>;
> +			interrupts = <AIC_IRQ 616 IRQ_TYPE_LEVEL_HIGH>;
> +			#iommu-cells = <1>;
> +			power-domains = <&ps_dispdfr_fe>;
> +			status = "disabled";
> +		};
> +
>  		sio_dart: iommu@235004000 {
>  			compatible = "apple,t8110-dart";
>  			reg = <0x2 0x35004000 0x0 0x4000>;
> 

Nick Chan
