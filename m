Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADED19DB888
	for <lists+dri-devel@lfdr.de>; Thu, 28 Nov 2024 14:26:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3368710E21C;
	Thu, 28 Nov 2024 13:26:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="zSOlTNDa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F42110E0BD
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Nov 2024 13:26:12 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-53df63230d0so802949e87.3
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Nov 2024 05:26:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732800370; x=1733405170; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=3jPSeZs2I9m/vryfi0ZM9iDP+RKgceUThW/Per9F688=;
 b=zSOlTNDakeuLnsaLxBYLFJmASxKRYHe31TUM8EGRvuJQFyVU0EpJ/JF7UaVY31i+FI
 myh1OB57HXZ9CL1fkUIXcz4Z2IXFKJ/MHRzmiRUSbbzLaVKVUtNdy/a/Ov1G2ys4Xcyl
 8YQqdYKI/0PPf7NKfgv9aPUaJg+146D3j5ghTzKZP8Y5625yOShLMqXVNaudRaUn352n
 WFi5CYbCLbs4yX4biJ5LtGCVSyPcU5ph5FalCptqN2uZ0wM1IIG3cPhR+6SFn/o2tgn8
 qdpL91MFvLVZ7Pfb9qggBSYIsiu4rbO3eOrwZbLsV6OomixcC1ykmMj5F1REvSNCcFts
 VG/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732800370; x=1733405170;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3jPSeZs2I9m/vryfi0ZM9iDP+RKgceUThW/Per9F688=;
 b=mAGI56XUPVA6iFNEUZLgB55tGOzz4VH8KXkfh5HTkvg8vxKulVILIcc6iM4r5jjL3i
 7imI4P/Ty+pByTwsKZF7S+amnacYM8EVcEYmaDqIYQeYShQDYHXTMRfcu9Ou0ChNhA0/
 hmhusASTZC4IEDG6WKfv0CekY1dX2JdnWoQa0OJGzjDCPUhpgnQrIUBiGcc0U2Qgi7QC
 NYclJ8ZbYgHX9KMcClD2vJp1O7PmZECyRxDcujaYMZSfA5Y81jKjqrGrCMtuJ74WDsv3
 er4q7aAjmTWvC/GvOORt0EsdrHfWXGWcZb3gTijk3JMEYfcCy93PC+4z+lZZCr+ZvHDm
 sNTQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCViEnEog6+Q3I8H452bS5ynZNNUZaKqSFISsIWaI0CJs2n9SZKT4+cLu9UMBsOx4XCuMCW4jZcLY/E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YypbXdcazEHk4kL7cfj90o0x2WsIix/3KZyDDTIQAwHj+ifelfR
 OvSqCnAkp6stOEQz85kR+b4vupFlm7EtjVba5QGkW1oFeKsZVcoEG7QcQlCHz24=
X-Gm-Gg: ASbGncs0l07GJ/FTJta98Yj8f3n6T6xlIo/7zjIEPpeA8u7B9QYaY3bjf9BEi/NwC+D
 xluiYC+QmvPFZgMs6XpvWSDIkfcX3EGjP/o0X9lX9YFvsHtquM9FNOeJDEsapyx3Bhat6N0Icms
 ZTVgSXoiwv/vg7uivkZ5ZNPcmmjojPNTatSl9/VWSQGX7mAZrprbUUsTf5axNtCwaMRX2T0LahS
 tqI1cC1Nf5lUxUK4ncbUu42iQaX+9bzT5cf6o0eNomnX9Yf6VJo0iobRmthKWTc+zT3eAh9Dv8P
 i8JUCoDqn4elJG2g22LYiecxg37V2A==
X-Google-Smtp-Source: AGHT+IF/6PgZ+LtPfmfUOVevzirM+qCJqHyVs/NHs1RDx6TmQskfyIC9ph9W+JY2vHF9iu8Qa8S+1w==
X-Received: by 2002:a05:6512:3d88:b0:53d:d3cb:dee9 with SMTP id
 2adb3069b0e04-53df00c604amr4180999e87.10.1732800370439; 
 Thu, 28 Nov 2024 05:26:10 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53df6443199sm177806e87.98.2024.11.28.05.26.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Nov 2024 05:26:09 -0800 (PST)
Date: Thu, 28 Nov 2024 15:26:06 +0200
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
Subject: Re: [PATCH v3 6/7] arm64: qcom: dts: sm8550: add interconnect and
 opp-peak-kBps for GPU
Message-ID: <7ylrgy44dlitavefgwaobve7runpy6eqyhufmtkxmwnqkj2g25@pfdjlf5aj4j6>
References: <20241128-topic-sm8x50-gpu-bw-vote-v3-0-81d60c10fb73@linaro.org>
 <20241128-topic-sm8x50-gpu-bw-vote-v3-6-81d60c10fb73@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241128-topic-sm8x50-gpu-bw-vote-v3-6-81d60c10fb73@linaro.org>
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

On Thu, Nov 28, 2024 at 11:25:46AM +0100, Neil Armstrong wrote:
> Each GPU OPP requires a specific peak DDR bandwidth, let's add
> those to each OPP and also the related interconnect path.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8550.dtsi | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> index e7774d32fb6d2288748ecec00bf525b2b3c40fbb..545eb52174c704bbefa69189fad9fbff053d8569 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> @@ -2114,6 +2114,9 @@ gpu: gpu@3d00000 {
>  			qcom,gmu = <&gmu>;
>  			#cooling-cells = <2>;
>  
> +			interconnects = <&gem_noc MASTER_GFX3D 0 &mc_virt SLAVE_EBI1 0>;

QCOM_ICC_TAG_ALWAYS

LGTM otherwise.

> +			interconnect-names = "gfx-mem";
> +
>  			status = "disabled";
>  
>  			zap-shader {
> @@ -2127,41 +2130,49 @@ gpu_opp_table: opp-table {
>  				opp-680000000 {
>  					opp-hz = /bits/ 64 <680000000>;
>  					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
> +					opp-peak-kBps = <16500000>;
>  				};
>  
>  				opp-615000000 {
>  					opp-hz = /bits/ 64 <615000000>;
>  					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L0>;
> +					opp-peak-kBps = <16500000>;
>  				};
>  
>  				opp-550000000 {
>  					opp-hz = /bits/ 64 <550000000>;
>  					opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
> +					opp-peak-kBps = <12449218>;
>  				};
>  
>  				opp-475000000 {
>  					opp-hz = /bits/ 64 <475000000>;
>  					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_L1>;
> +					opp-peak-kBps = <8171875>;
>  				};
>  
>  				opp-401000000 {
>  					opp-hz = /bits/ 64 <401000000>;
>  					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
> +					opp-peak-kBps = <6671875>;
>  				};
>  
>  				opp-348000000 {
>  					opp-hz = /bits/ 64 <348000000>;
>  					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D0>;
> +					opp-peak-kBps = <6074218>;
>  				};
>  
>  				opp-295000000 {
>  					opp-hz = /bits/ 64 <295000000>;
>  					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D1>;
> +					opp-peak-kBps = <6074218>;
>  				};
>  
>  				opp-220000000 {
>  					opp-hz = /bits/ 64 <220000000>;
>  					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D2>;
> +					opp-peak-kBps = <6074218>;
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
