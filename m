Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A059EAEF1
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2024 12:02:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5AE610E879;
	Tue, 10 Dec 2024 11:02:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="nZMYcnt2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6987410E873
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2024 11:02:23 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-5401c52000fso2057704e87.2
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2024 03:02:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733828541; x=1734433341; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=NLSLnG5Y+Q5zBa0vxq3CyVrMI+PkK9k80FsG1LPecs4=;
 b=nZMYcnt2H5QZG09N0WoMVpHFUbjF5gEjB+4vjSR7Q2GhaSMAWlX8zkoKF2VGV03/Y3
 57WntmtO55kqO7BXrMw89SuFzKwals6zg0k12MTmY8hxSy8ti2W087ikerQ+Wl4E4nLl
 aeTwPcmgs993D3NJkvxeUB0wqZksiWCgj5Bnn54y2aRvx2nx7bKzUIIgDFyeDhjqI4Y9
 iTRQIj5FeiqnnYsrflgsoL6yOl928FKWi9E35fE8XKAoNRUdU8eru7rFbW99DhVpfQxf
 kt7ZwB7bCcSA1FLjbGLwqulb7J1bbkeCQEh+fM7JUsRPpH+9yx0UqjIPLrQCBl1nZ5V4
 2Cbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733828541; x=1734433341;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NLSLnG5Y+Q5zBa0vxq3CyVrMI+PkK9k80FsG1LPecs4=;
 b=gppCoetH6sp4un/IOEedkRqv2uj4ST1LYJil5/gDyKjKRbxEjSGMRJy2nfFwAZT8Q3
 IvIG+HIO+jauBhzJPZOazDJf+FF42Zx4CTQ2VC7r6yzWogSeIbtcXnK9k1oUXDnQEwCA
 sDCzw2SXNnOsrnwXoNPphLizUf4QzsxyeMMoYzlgIXOR3IdW/v4hlKQRMjAx26Js05Qj
 UM41hx7dqDyBh5EYldstn5mm2mLhPXuQ2jh6JJqSrKG2gMz0IC6qkXwMYSwVipBFKLEW
 ++N6rryY7GTZelqHoOGBwUj64sllyPwMBOAEyTS0kboIDitUxLkcZ204bHDY9KoORIcU
 JQKA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVY46zqi3+UtbzihrB+W+5yBKYobB9LpFbeKxuSQo66apzpSZRrLZaqhlnlkxEInufusPy2O2U72AY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyYWTEA62LuikAjyA2eHIdfaArWeuXZwGzqJ1GbBDFKzp/xpew5
 8c3yGwmFSdpT3qqH0ZAeZ/DkYcaYr/kk9FaxiCDg8iE1w3VH1TPn0OHplB8SW7c=
X-Gm-Gg: ASbGnctRgkcIb0CBf6/QQWglFoVsn2sGkGiKqm2LJMPfWKFp4tr7FeCMe3xukT+skNC
 25V6sbnDlEVbDYPgramFau1Lk814gziL42GiY6fbt5oOM55b4JC1qn56NLhdKV9DEzQtEHHSu6c
 O/tAtHg1VSiO0nJ99jO0pDnabjBL4ONi2OeocjSAOAHtUwVmNTwYQLsa1MmuYPL1+kZHzSpeLua
 qsuyszH+wpR9oUBwWz8s0znz9PBO3gpx8KEjvak9TdrtDeHqt8i5P3R+Ir1UPh56svNN3i1ZOiL
 YGSojNVeXQ6BF+FMrKcKjNFg+/B0ql2lMg==
X-Google-Smtp-Source: AGHT+IGd9pUHyOFytE8kKcuQvQX5JanFuKXTkqWjRgdaLSxeotjVnnczl7OXF6dV39l7CqIuih4Vog==
X-Received: by 2002:a05:6512:104b:b0:53e:362e:ed6 with SMTP id
 2adb3069b0e04-5402410d24emr1565097e87.50.1733828541548; 
 Tue, 10 Dec 2024 03:02:21 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53e39ce0551sm1148049e87.29.2024.12.10.03.02.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Dec 2024 03:02:20 -0800 (PST)
Date: Tue, 10 Dec 2024 13:02:17 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Fange Zhang <quic_fangez@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Liu Li <quic_lliu6@quicinc.com>, 
 Xiangxu Yin <quic_xiangxuy@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 9/9] arm64: dts: qcom: Add display support for QCS615
 RIDE board
Message-ID: <cfdyvcxdkmf4sv5f75koflayyx74wd3tuscdl7byp5peaag5ty@yhr3275jhftn>
References: <20241210-add-display-support-for-qcs615-platform-v4-0-2d875a67602d@quicinc.com>
 <20241210-add-display-support-for-qcs615-platform-v4-9-2d875a67602d@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241210-add-display-support-for-qcs615-platform-v4-9-2d875a67602d@quicinc.com>
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

On Tue, Dec 10, 2024 at 02:54:00PM +0800, Fange Zhang wrote:
> From: Li Liu <quic_lliu6@quicinc.com>
> 
> Add display MDSS and DSI configuration for QCS615 RIDE board.
> QCS615 has a DP port, and DP support will be added in a later patch.
> 
> Signed-off-by: Li Liu <quic_lliu6@quicinc.com>
> Signed-off-by: Fange Zhang <quic_fangez@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs615-ride.dts | 89 ++++++++++++++++++++++++++++++++
>  1 file changed, 89 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> index a25928933e2b66241258e418c6e5bc36c306101e..694719a09ac46bfa2fe34f1883c0970b9d0902be 100644
> --- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> @@ -32,6 +32,18 @@ xo_board_clk: xo-board-clk {
>  			#clock-cells = <0>;
>  		};
>  	};
> +
> +	dp-connector {
> +		compatible = "dp-connector";
> +		label = "DP";
> +		type = "mini";
> +
> +		port {
> +			dp_connector_out: endpoint {
> +				remote-endpoint = <&anx_7625_out>;
> +			};
> +		};
> +	};
>  };
>  
>  &apps_rsc {
> @@ -202,6 +214,83 @@ &gcc {
>  		 <&sleep_clk>;
>  };
>  
> +&i2c2 {
> +	clock-frequency = <400000>;
> +	status = "okay";
> +
> +	ioexp: gpio@3e {
> +		compatible = "semtech,sx1509q";
> +		reg = <0x3e>;
> +		interrupt-parent = <&tlmm>;
> +		interrupts = <58 0>;

Use IRQ flags instead of just 0 (here and further on). Also it might be
better to use interrupts-extended instead.

> +		gpio-controller;
> +		#gpio-cells = <2>;
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +		semtech,probe-reset;
> +	};
> +
> +	i2c-mux@77 {
> +		compatible = "nxp,pca9542";
> +		reg = <0x77>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;

Add empty line before device nodes (here and furher on).

> +		i2c@0 {
> +			reg = <0>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			anx7625@58 {
> +				compatible = "analogix,anx7625";
> +				reg = <0x58>;
> +				interrupt-parent = <&ioexp>;
> +				interrupts = <0 0>;
> +				enable-gpios = <&tlmm 4 GPIO_ACTIVE_HIGH>;
> +				reset-gpios = <&tlmm 5 GPIO_ACTIVE_HIGH>;
> +				wakeup-source;
> +
> +				ports {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					port@0 {
> +						reg = <0>;
> +						anx_7625_in: endpoint {
> +							remote-endpoint = <&mdss_dsi0_out>;
> +						};
> +					};
> +
> +					port@1 {
> +						reg = <1>;
> +						anx_7625_out: endpoint {
> +							remote-endpoint = <&dp_connector_out>;
> +						};
> +					};
> +				};
> +			};
> +		};
> +	};
> +};
> +
> +&mdss {
> +	status = "okay";
> +};
> +
> +&mdss_dsi0 {
> +	vdda-supply = <&vreg_l11a>;
> +	status = "okay";
> +};
> +
> +&mdss_dsi0_out {
> +	remote-endpoint = <&anx_7625_in>;
> +	data-lanes = <0 1 2 3>;
> +};
> +
> +&mdss_dsi0_phy {
> +	vdds-supply = <&vreg_l5a>;
> +	status = "okay";
> +};
> +
>  &qupv3_id_0 {
>  	status = "okay";
>  };
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
