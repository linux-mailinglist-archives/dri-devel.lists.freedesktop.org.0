Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C7F59DB88D
	for <lists+dri-devel@lfdr.de>; Thu, 28 Nov 2024 14:26:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B94810E070;
	Thu, 28 Nov 2024 13:26:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="vdC2WHOu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4A5F10E0BD
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Nov 2024 13:26:27 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-2f75c56f16aso8911811fa.0
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Nov 2024 05:26:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732800386; x=1733405186; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=hptatYvEA8Enrguk8oP5vLAEt4VLsfMiRBE5rNfad/M=;
 b=vdC2WHOuFafmSh4kbsBcZsbw6X/WPDmGD/KCPi6q8CXjYkAdLY6/p4LplPYIYxROe4
 RBSRvjyGuI9ABYYMy1G+5/bmJr3Edeh/GGVxb9KYhVtD6y7WjMI5elpVvDq4OrR3JNYM
 0cHb+1/G9iXw6NsMneZOQAgPxgiSMRX0fKFvWU8JvGTmHelyuizWZsiKB5ezl9Iejsbb
 VgStych8u3olZJVVAePiLSxu6O4WwY3sACipzNEiS2Kh0Vea26/aHg1nX2XJ4wh61O3A
 793r/LQa5UNOLzyWhHIuUB07N1B8k6OA73iURJtUHmUWIhWb2tmvCqRsc3B0WcrRWXUK
 PoiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732800386; x=1733405186;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hptatYvEA8Enrguk8oP5vLAEt4VLsfMiRBE5rNfad/M=;
 b=UBlRmgztQErKTiCSoPoYGL6QkP6Lr7+fQI4dUCCcNsosuoYTZqEDEzJzkjew2iacfq
 UnPQTKvK5qAsIsuUSCISZWz8Qbs+TNz+2x9ikx+vCwFc5Tm90J6Tsf+EKsNf04reFzag
 nBLTZJZ5lfrq6sFFcakj3Wkvfx0QJzsxProd/FHWamitn9dRJ4uAudv1FNWwKH2ayljn
 9nXLeoe6sXBEnkfvSSqoY4jJl4ATZAJY2IAC43n9UC8DgNcsAhlHwL61o0XbuVZWYTKC
 J7FzQ5ZuzatWrp/kVsQM8OJ1SRNjF2mN9m1MvC7TONi0uSR7Z6jqM2oHD4ivIzMh3SL9
 otnQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCURDV4DajaPNwq/NoKr7n0O+L+xKoOWuO6/53VhqlwhsLhA9Go4BfG01yqmBYImB1+KcDGf64rN4kQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxeYmxPbn+0vura9JSfMDzRHpTNJZ2WjCK6R9oAzA5Nm4YgNb6R
 wA+ZKhVYMRipMjbreMZQ4kY/IdUi9U+w3yIJuAwy00fKBbwLZuoxDaolEZSl4gQ=
X-Gm-Gg: ASbGnctNfA6vLqNW1lzzURAC9XCksmMHN0o2/EwVj9C4H81nr00w/Ib/+19dxJE26rO
 Fr3gNiJr5RVlXv4Rec0b9owETrzAB4Y14DKjNSG3Ua48ySOQTDEFeVLjANzMWBPvNVNYeBRoMMU
 1SMTXw0fgI5Ow/JMhJDjBthIJXpD27xnHhCOZGBUPKdG71P+/NSSsM2S6jRI0YVE7APfTNoM47t
 xzaP/piulwOJkFCBGyNLDnLJfzrBcMt6XprEESCikor1Uod/pgD1PS+tYrjZDfbBihCtbZhiA5r
 nlK6ibFcKtowfxf51B8iiaLIgQGgnA==
X-Google-Smtp-Source: AGHT+IGC3gaQ62hMn2mc57Lh3Z4Pgu5XWI0vf5vOjcb88KgIQmcjU1q/2zOc0M3t3qprl3ZV7jTR3g==
X-Received: by 2002:a05:6512:b1c:b0:53d:d19f:1c7e with SMTP id
 2adb3069b0e04-53df010ea53mr4138862e87.51.1732800385828; 
 Thu, 28 Nov 2024 05:26:25 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53df6443257sm178638e87.70.2024.11.28.05.26.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Nov 2024 05:26:24 -0800 (PST)
Date: Thu, 28 Nov 2024 15:26:23 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Bjorn Andersson <andersson@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Akhil P Oommen <quic_akhilpo@quicinc.com>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 7/7] arm64: qcom: dts: sm8650: add interconnect and
 opp-peak-kBps for GPU
Message-ID: <2lelgxo32rx6r2ivg2ni53re7c3kwvhyhtg6puwvvet7v5wpah@ysdqjscrgw7t>
References: <20241128-topic-sm8x50-gpu-bw-vote-v3-0-81d60c10fb73@linaro.org>
 <20241128-topic-sm8x50-gpu-bw-vote-v3-7-81d60c10fb73@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241128-topic-sm8x50-gpu-bw-vote-v3-7-81d60c10fb73@linaro.org>
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

On Thu, Nov 28, 2024 at 11:25:47AM +0100, Neil Armstrong wrote:
> Each GPU OPP requires a specific peak DDR bandwidth, let's add
> those to each OPP and also the related interconnect path.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8650.dtsi | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> index 25e47505adcb790d09f1d2726386438487255824..dc85ba8fe1d8f20981b6d7e9672fd7137b915b98 100644
> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> @@ -2636,6 +2636,9 @@ gpu: gpu@3d00000 {
>  			qcom,gmu = <&gmu>;
>  			#cooling-cells = <2>;
>  
> +			interconnects = <&gem_noc MASTER_GFX3D 0 &mc_virt SLAVE_EBI1 0>;

QCOM_ICC_TAG_ALWAYS, LGTM otherwise

> +			interconnect-names = "gfx-mem";
> +
>  			status = "disabled";
>  
>  			zap-shader {
> @@ -2649,56 +2652,67 @@ gpu_opp_table: opp-table {
>  				opp-231000000 {
>  					opp-hz = /bits/ 64 <231000000>;
>  					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D2>;
> +					opp-peak-kBps = <2136718>;
>  				};
>  
>  				opp-310000000 {
>  					opp-hz = /bits/ 64 <310000000>;
>  					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D1>;
> +					opp-peak-kBps = <6074218>;
>  				};
>  
>  				opp-366000000 {
>  					opp-hz = /bits/ 64 <366000000>;
>  					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D0>;
> +					opp-peak-kBps = <6074218>;
>  				};
>  
>  				opp-422000000 {
>  					opp-hz = /bits/ 64 <422000000>;
>  					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
> +					opp-peak-kBps = <8171875>;
>  				};
>  
>  				opp-500000000 {
>  					opp-hz = /bits/ 64 <500000000>;
>  					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_L1>;
> +					opp-peak-kBps = <8171875>;
>  				};
>  
>  				opp-578000000 {
>  					opp-hz = /bits/ 64 <578000000>;
>  					opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
> +					opp-peak-kBps = <12449218>;
>  				};
>  
>  				opp-629000000 {
>  					opp-hz = /bits/ 64 <629000000>;
>  					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L0>;
> +					opp-peak-kBps = <12449218>;
>  				};
>  
>  				opp-680000000 {
>  					opp-hz = /bits/ 64 <680000000>;
>  					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
> +					opp-peak-kBps = <16500000>;
>  				};
>  
>  				opp-720000000 {
>  					opp-hz = /bits/ 64 <720000000>;
>  					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L2>;
> +					opp-peak-kBps = <16500000>;
>  				};
>  
>  				opp-770000000 {
>  					opp-hz = /bits/ 64 <770000000>;
>  					opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
> +					opp-peak-kBps = <16500000>;
>  				};
>  
>  				opp-834000000 {
>  					opp-hz = /bits/ 64 <834000000>;
>  					opp-level = <RPMH_REGULATOR_LEVEL_NOM_L1>;
> +					opp-peak-kBps = <16500000>;
>  				};
>  			};
>  		};
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
