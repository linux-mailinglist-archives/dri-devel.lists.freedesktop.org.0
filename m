Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D476A34AF5
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 17:56:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A31D810EB45;
	Thu, 13 Feb 2025 16:56:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Wpp54qjC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F16D10EB41
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 16:56:51 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-5450475df18so1169624e87.2
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 08:56:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739465810; x=1740070610; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=YyQ7iBPn2LLvOrCnmEhJGLbqAv4rLkRdUEyL8CZvRP4=;
 b=Wpp54qjC2WHFyegnqVkaE4vRlmeTdKgKJk0A3C/qfOwPR64ir51vpInQBKYZXvrHbk
 1eV2MSphLy1F1DOgTckPooH3zezSincYHfKFZNKA2Rg2oObkb4EwJTzTUbVu1gfg0B+v
 PfQ8/2bOewGOwMh4KVo1aY0T5TYTcUdTyu0Y/PS3dpn8L+OQefGGuXNMXjIwTk3lwNmH
 IjgNduV661H8hA6SJ5GDM9vOzuLur6Mr77v5u/C8Tb04jlbZN4opmxo7IjBNqrdO24Rc
 2WrLCYCJ5rY7jBX4MnLJYWGriLRnsOnitLBv5PXcCXTLij4Hycyk5UWUsSZamaGVorbb
 BK1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739465810; x=1740070610;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YyQ7iBPn2LLvOrCnmEhJGLbqAv4rLkRdUEyL8CZvRP4=;
 b=jxBvK6FCt3117Wv0mUCFgcs2ZyTVQQLHmE+X3Q0xTGA+nok6uAN10ZpApFP6EkJQaC
 di0BVVkKxKHWSP9RHoYnd1IDdxj7MRSU3WQjQvnMYsL7aOXpFrSIcco2gKo3gYAq2auO
 9XwREwr00iE4lXCwIqHJLxUVe85fswbTmeOyIhO8tsZW+btSyQZRnn6+SFCB6HI6VfIJ
 F2LaimYK2nwM26Zi2omRB0dCjWlEvVgTu4fkzQSGf4ACNHd9ghEqyuARMeB4eNpRwEfO
 hvVEdeWiH+1azH6rFifxXjKhhBueeBk8c77QL9B7Cr7U9UrEnM03NLD0iE85HKtXdohI
 dZZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUhMD4EZ+RatYpv7NOqtp1aTzurtpv7sICmjOcQZMqfMeAQJjPuGAkvFkrQFE6X51cxoMX+Sm6F/jE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxLzDmfX0j5G7kuxnxuvWdptsx/7hu5Y8yqgWBVt3s/xQFSM9AM
 Sg+r2mkvqrUOMRaQnkMxlE7JRgh+1rysp7+JuzagzkPnQq16Htyo7XEa6uz35BA=
X-Gm-Gg: ASbGnctQwuy4o0P5/aASnaVrTf0FJX5jR4ctLpQXEh7Bi3FRwWthok1oIkwlWYPk/w8
 5Yp2BIXH+9MnES0zPJy/cc5lu9AdfoFRYbT3Tmq5WIVTPWGx3udq9yPqcrCTDu1vxX+XdlsAPCW
 62FvjmenOXSCjOIlZazkImS0R4NDf5JKswPPKMyuc005Smrpm4zfyPNo0j66l3llznM3Iza0Omm
 iCAl3V7+JJpBT17ym4MFS+WAIDpcSZNclU06iobSWDcB0tuONi9OeLV6RONJH5zCJPTpFpQIhNE
 HdEW//gbY5JpDC6IAi52+QZ1ib0bpfAnYzWeBh0FtD/giQcHbeit3kh4TL/CKA4Srt/BbkU=
X-Google-Smtp-Source: AGHT+IHPp7z9mHrglxs4Ys3IyXNLHHY1OQEK7JqWZvEuKQ6rWpt9p/SBEJZ/ltRNQXoWyTRbRwY6vQ==
X-Received: by 2002:a05:6512:128a:b0:53e:3a7c:c0b5 with SMTP id
 2adb3069b0e04-545180e5df1mr2549482e87.10.1739465809683; 
 Thu, 13 Feb 2025 08:56:49 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5451f10cc28sm221256e87.201.2025.02.13.08.56.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2025 08:56:48 -0800 (PST)
Date: Thu, 13 Feb 2025 18:56:46 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Jie Zhang <quic_jiezh@quicinc.com>
Subject: Re: [PATCH 4/5] arm64: dts: qcom: qcs8300: Add gpu and gmu nodes
Message-ID: <p36nz6p6bbzur7uoitbzc63hv4qf7hhsix3mqa36igarasj67b@evcdfpeybgsh>
References: <20250213-a623-gpu-support-v1-0-993c65c39fd2@quicinc.com>
 <20250213-a623-gpu-support-v1-4-993c65c39fd2@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250213-a623-gpu-support-v1-4-993c65c39fd2@quicinc.com>
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

On Thu, Feb 13, 2025 at 09:40:09PM +0530, Akhil P Oommen wrote:
> From: Jie Zhang <quic_jiezh@quicinc.com>
> 
> Add gpu and gmu nodes for qcs8300 chipset.
> 
> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs8300.dtsi | 93 +++++++++++++++++++++++++++++++++++
>  1 file changed, 93 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs8300.dtsi b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
> index f1c90db7b0e6..2dc487dcc584 100644
> --- a/arch/arm64/boot/dts/qcom/qcs8300.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
> @@ -2660,6 +2660,99 @@ serdes0: phy@8909000 {
>  			status = "disabled";
>  		};
>  
> +		gpu: gpu@3d00000 {
> +			compatible = "qcom,adreno-623.0", "qcom,adreno";
> +			reg = <0x0 0x03d00000 0x0 0x40000>,
> +			      <0x0 0x03d9e000 0x0 0x1000>,
> +			      <0x0 0x03d61000 0x0 0x800>;
> +			reg-names = "kgsl_3d0_reg_memory",
> +				    "cx_mem",
> +				    "cx_dbgc";
> +			interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
> +			iommus = <&adreno_smmu 0 0xc00>,
> +				 <&adreno_smmu 1 0xc00>;
> +			operating-points-v2 = <&gpu_opp_table>;
> +			qcom,gmu = <&gmu>;
> +			interconnects = <&gem_noc MASTER_GFX3D QCOM_ICC_TAG_ALWAYS
> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> +			interconnect-names = "gfx-mem";
> +			#cooling-cells = <2>;
> +
> +			status = "disabled";
> +
> +			gpu_zap_shader: zap-shader {
> +				memory-region = <&gpu_microcode_mem>;
> +			};
> +
> +			gpu_opp_table: opp-table {
> +				compatible = "operating-points-v2";
> +
> +				opp-877000000 {
> +					opp-hz = /bits/ 64 <877000000>;
> +					opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L1>;
> +					opp-peak-kBps = <12484375>;
> +				};
> +
> +				opp-780000000 {
> +					opp-hz = /bits/ 64 <780000000>;
> +					opp-level = <RPMH_REGULATOR_LEVEL_TURBO>;
> +					opp-peak-kBps = <10687500>;
> +				};
> +
> +				opp-599000000 {
> +					opp-hz = /bits/ 64 <599000000>;
> +					opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
> +					opp-peak-kBps = <8171875>;
> +				};
> +
> +				opp-479000000 {
> +					opp-hz = /bits/ 64 <479000000>;
> +					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
> +					opp-peak-kBps = <5285156>;
> +				};

Does it have no speed bins or are they pending on the nvmem patchset?

> +			};
> +		};
> +

-- 
With best wishes
Dmitry
