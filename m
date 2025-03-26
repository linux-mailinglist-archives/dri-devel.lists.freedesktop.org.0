Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AC02A726F7
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 00:20:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F69110E071;
	Wed, 26 Mar 2025 23:20:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="CfNM/1G8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B43310E071
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Mar 2025 23:20:43 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-43cf3192f3bso3823285e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Mar 2025 16:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1743031241; x=1743636041; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XuFo84pE+zU/a5xWpeUooNoDSLrcVG0XywvPlUvoobY=;
 b=CfNM/1G8VlOLaCNlYHKvC6ZIg/ZTj7zVj9Ttx6Afo9/7Lr92bUSahzwnzD31J5sCCY
 6RoLwEX8cL+mz2EfHmiSiiZv5mED6jWLn/n08OJYd1QLDRxAgez+r6JVbXeSOKa7BnEb
 fqP2g18em8VMY0US5PEq96EhciQBxlcoSXXOqxv3cQUpnW25cn0hBwQJwCenN0hEw5Ub
 +A8V7uMkeGluFQowuHRZ/SHX/A4s6VBkWKN8GgyRvs20wBLHCjGOQBL6FLGJ3k3SOpiA
 IIWuXNaTYU1286tIKSvP877CY4MQKCNPQaQKapjmDyz2PIWFL2g0nimIgJoZhWRf3BkG
 JaeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743031241; x=1743636041;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XuFo84pE+zU/a5xWpeUooNoDSLrcVG0XywvPlUvoobY=;
 b=a/QAllw1nygdrb/0wEJ9pmZQKahs5rnW7YpTiFMlKeNbfnIjAgL1QCl5QSHB6Bg3OA
 F7jjJKTiYKab1VhC5JQ89mcaJ+ltmet8vYQWEZANjAVDtUqdra/HTr6PGwGaUkSwwaN/
 ryKFILP/lNotuydk6MGOwjPVx0t0E0MhmIuzTOhT2qIbfREAt9D8c557dudZRa7IhOMO
 GN/70HkTt9LS+jIGkv3QffehjYJULROMo88DJtwxjUvvGWbr6lj/aeDR2sOhGffHMXq8
 btfWpDsc9QbQEcRNn7qgWCbInGMP2P3Q6L9QE4beCoECf8x+fn4hogxxsxLGcJU81GrA
 vMcw==
X-Gm-Message-State: AOJu0Yxh5cnFS/O14OADNRItU/eE1aiL7LH18spiF6lfb+7bLbwAJqup
 3FXI0Q3B2j85lG6PnPph+oLrVWSFSWGnB19qbZkQE0v+1wpZFzbe+vRoOc0iskE=
X-Gm-Gg: ASbGncvONlsgm/I1e6Fq9E6oWEdEa08+7KKpx9r6BuOQSRIfqKNsnQYhVgMLVnVSGRp
 4+VysxdC1iuFepPKLvAgR8yhpcUfC3N76vOiugZaC756bzldd4iAsnimYs/UPZCBNWdud71DvdG
 rsOdTBZLKZl6UCpIOX655t4Hjx2xixPmo22JGAcud38jqc4bdF7RVg6S/kMtM1TGr44MwVUVRfm
 JBZiBEgl5NNOIuwUWxcgcofIwGH3u+fiuXEz0N1HFPBm82uB0ut5i+1JeKzABoMNLvz7Mj1ZHjJ
 c3qT1Kt8Go8GUAJsNu2fe/qB9+MFteO9iMKmI7yohIqpctiuwGsoFsVz4VcAZMF2CUdb7onPjto
 ro0XekI91kA==
X-Google-Smtp-Source: AGHT+IFFqiheC5thw/TIFb+2LZxLiMGm8Pw7LKkpF7QCjDZPBPf2FRSdFD6V9DQI8xaqabcvnC/8/w==
X-Received: by 2002:a05:600c:3d97:b0:43a:b0ac:b10c with SMTP id
 5b1f17b1804b1-43d8509745dmr9396235e9.26.1743031241531; 
 Wed, 26 Mar 2025 16:20:41 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d82f1bb75sm18551995e9.25.2025.03.26.16.20.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Mar 2025 16:20:41 -0700 (PDT)
Message-ID: <316c55f5-189c-40f6-95e3-c7c0d858a6e8@linaro.org>
Date: Wed, 26 Mar 2025 23:20:39 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] arm64: dts: qcom: x1e78100-t14s: add hpd gpio to
 LCD panel
To: Christopher Obbard <christopher.obbard@linaro.org>,
 Douglas Anderson <dianders@chromium.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Johan Hovold <johan@kernel.org>,
 Rui Miguel Silva <rui.silva@linaro.org>, Abel Vesa <abel.vesa@linaro.org>,
 devicetree@vger.kernel.org
References: <20250325-wip-obbardc-qcom-t14s-oled-panel-v2-0-e9bc7c9d30cc@linaro.org>
 <OO_0LvWJ_pUpza-tYPX0qCtcJ0_aZFbYrE81PaiSXqt7-R2mUWB8XyJLww_1t9mMLrI92GH3PconB8FDnbq_NA==@protonmail.internalid>
 <20250325-wip-obbardc-qcom-t14s-oled-panel-v2-2-e9bc7c9d30cc@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250325-wip-obbardc-qcom-t14s-oled-panel-v2-2-e9bc7c9d30cc@linaro.org>
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

On 25/03/2025 19:21, Christopher Obbard wrote:
> The eDP panel has an HPD GPIO. Describe it in the devicetree.
> 
> Unfortunately I cannot test this on the non-OLED model since I
> only have access to the model with OLED (which also uses the
> HPD GPIO).
> 
> I believe this could be split into two patches; one adding the
> pinctrl node and one adding the hpd gpio to the T14s devicetree.
> But I will wait for your comments on this ;-).

There's nothing wrong with defining a pin when you also use it but 
emoji's in a commit log are surely verboten !

> 
> Signed-off-by: Christopher Obbard <christopher.obbard@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi | 11 +++++++++++
>   1 file changed, 11 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
> index 962fb050c55c4fd33f480a21a8c47a484d0c82b8..46c73f5c039ed982b553636cf8c4237a20ba7687 100644
> --- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
> @@ -980,8 +980,12 @@ &mdss_dp3 {
>   	aux-bus {
>   		panel: panel {
>   			compatible = "edp-panel";
> +			hpd-gpios = <&tlmm 119 GPIO_ACTIVE_HIGH>;
>   			power-supply = <&vreg_edp_3p3>;
> 
> +			pinctrl-0 = <&edp_hpd_n_default>;
> +			pinctrl-names = "default";
> +
>   			port {
>   				edp_panel_in: endpoint {
>   					remote-endpoint = <&mdss_dp3_out>;
> @@ -1286,6 +1290,13 @@ hall_int_n_default: hall-int-n-state {
>   		bias-disable;
>   	};
> 
> +	edp_hpd_n_default: edp-hpd-n-state {
> +		pins = "gpio119";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-pull-up;
> +	};
> +
>   	pcie4_default: pcie4-default-state {
>   		clkreq-n-pins {
>   			pins = "gpio147";
> 
> --
> 2.49.0
> 
> 
This definition looks consistent with the schematic to me.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
