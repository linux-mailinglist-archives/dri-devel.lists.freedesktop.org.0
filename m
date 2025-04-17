Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2714A913EF
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 08:20:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3B4110E0E7;
	Thu, 17 Apr 2025 06:20:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=mainlining.org header.i=@mainlining.org header.b="kKGEobHR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1093C10E0E7;
 Thu, 17 Apr 2025 06:20:43 +0000 (UTC)
Received: from localhost (web.docker-mailserver_default [172.18.0.2])
 by mail.mainlining.org (Postfix) with ESMTPSA id 6B705BBAD2;
 Thu, 17 Apr 2025 06:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mainlining.org;
 s=psm; t=1744870836;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vINGxXd1a/HvJqBAZg5qAK4jrccoMyLLJvCH80uIjEo=;
 b=kKGEobHRSReKJ1RvO2JA11xM/eViImkOIcHP3mrAOubxN+UtDvrII4KRy90i6k5bPBDIxT
 szymDQiM9mbUgeEAd+KC8kJj4nNTqMOtsXfegsmboLsNM9nF0NaFXgRLtF8reYVZ+X4j70
 eWpZCm1qaIh+JSMAaxId0BwWa/iiFqEdOiJfPZY9M7Q7DTHYq8khJz7+GBYZmI/KXdUHej
 GWRv94Oq5IAOHG+4U3UoYBhps/O6touiPhMBHdgavS8A24LcSel9RT68m+cRBoGYoD2Ojw
 vqEltuN9kIh+Qe0hYbnsP36WWfGc0tbAdntaxQ7ro6DSZmtgp2I3ulVQygqZmQ==
MIME-Version: 1.0
Date: Thu, 17 Apr 2025 08:20:36 +0200
From: barnabas.czeman@mainlining.org
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Stephan Gerhold <stephan@gerhold.net>,
 =?UTF-8?Q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>, Linus Walleij
 <linus.walleij@linaro.org>, Lee Jones <lee@kernel.org>, Srinivas Kandagatla
 <srinivas.kandagatla@linaro.org>, Joerg Roedel <joro@8bytes.org>, Will
 Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Konrad Dybcio
 <konradybcio@kernel.org>, Rob Clark <robdclark@gmail.com>, Sean Paul
 <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, Simona
 Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Dmitry Baryshkov
 <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 iommu@lists.linux.dev, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, phone-devel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht, linux@mainlining.org, Dang Huynh
 <danct12@riseup.net>
Subject: Re: [PATCH v4 4/6] arm64: dts: qcom: Add initial support for MSM8937
In-Reply-To: <f85195a1-f55e-41ea-967d-b758014cba06@oss.qualcomm.com>
References: <20250315-msm8937-v4-0-1f132e870a49@mainlining.org>
 <20250315-msm8937-v4-4-1f132e870a49@mainlining.org>
 <f85195a1-f55e-41ea-967d-b758014cba06@oss.qualcomm.com>
Message-ID: <93ea35691deaa1ff38d229225e26cf41@mainlining.org>
X-Sender: barnabas.czeman@mainlining.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2025-04-14 22:55, Konrad Dybcio wrote:
> On 3/15/25 3:57 PM, Barnabás Czémán wrote:
>> From: Dang Huynh <danct12@riseup.net>
>> 
>> Add initial support for MSM8937 SoC.
>> 
>> Signed-off-by: Dang Huynh <danct12@riseup.net>
>> Co-developed-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
>> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
>> ---
> 
> [...]
> 
>> +			power-domains = <&cpu_pd0>;
>> +			power-domain-names = "psci";
> 
> So CPU4-7 get "nicer" idle, but 0-3 don't?
> 
> [...]
> 
>> +		cpu-map {
>> +			/* The MSM8937 has 2 cluster A53 setup. */
> 
> This comment seems superfluous
> 
> [...]
> 
>> +	timer {
> 
> 'p' < 't', please sort top-level nodes alphabetically
> 
> [...]
> 
>> +				wcss-wlan2-pins {
>> +					pins = "gpio76";
>> +					function = "wcss_wlan2";
>> +					drive-strength = <6>;
> 
> please unify this order (drive-strength before bias)
> 
>> +					bias-pull-up;
>> +
>> +				};
> 
> Extra newline
> 
> [...]
> 
>> +		gpu: gpu@1c00000 {
>> +			compatible = "qcom,adreno-505.0", "qcom,adreno";
>> +			reg = <0x1c00000 0x40000>;
>> +			reg-names = "kgsl_3d0_reg_memory";
>> +			interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
>> +			interrupt-names = "kgsl_3d0_irq";
>> +			#cooling-cells = <2>;
>> +			clocks = <&gcc GCC_OXILI_GFX3D_CLK>,
>> +				<&gcc GCC_OXILI_AHB_CLK>,
>> +				<&gcc GCC_BIMC_GFX_CLK>,
>> +				<&gcc GCC_BIMC_GPU_CLK>,
>> +				<&gcc GCC_OXILI_TIMER_CLK>,
>> +				<&gcc GCC_OXILI_AON_CLK>;
> 
> Please align the <s
> 
>> +			clock-names = "core",
>> +				      "iface",
>> +				      "mem_iface",
>> +				      "alt_mem_iface",
>> +				      "rbbmtimer",
>> +				      "alwayson";
>> +			operating-points-v2 = <&gpu_opp_table>;
>> +			power-domains = <&gcc OXILI_GX_GDSC>;
>> +
>> +			iommus = <&adreno_smmu 0>;
>> +
>> +			status = "disabled";
>> +
>> +			gpu_opp_table: opp-table {
>> +				compatible = "operating-points-v2";
>> +
>> +				opp-19200000 {
>> +					opp-hz = /bits/ 64 <19200000>;
>> +					opp-supported-hw = <0xFF>;
> 
> 0xff is overly broad, please document the existing known speed bins
There are no speedbins for 8937 gpu. 8940 have but 8940 is not scope of 
this series.
> 
> [...]
> 
>> +		adreno_smmu: iommu@1c40000 {
>> +			compatible = "qcom,msm8996-smmu-v2",
>> +				     "qcom,adreno-smmu",
>> +				     "qcom,smmu-v2";
>> +			reg = <0x1c40000 0x10000>;
> 
> Does it work as-is, without iommu changes?
> 
> [...]
> 
>> +	thermal_zones: thermal-zones {
>> +		aoss-thermal {
>> +			polling-delay-passive = <250>;
> 
> There are no passive trip points> +
>> +			thermal-sensors = <&tsens 0>;
>> +
>> +			trips {
>> +				aoss_alert0: trip-point0 {
>> +					temperature = <85000>;
>> +					hysteresis = <2000>;
>> +					type = "hot";
>> +				};
> 
> Please convert these to 'critical' instead
> 
> [...]
> 
>> +		cpuss1-thermal {
>> +			polling-delay-passive = <250>;
> 
> You can drop polling-delay-passive under CPU tzones, as threshold
> crossing is interrupt-driven
> 
>> +
>> +			thermal-sensors = <&tsens 4>;
>> +
>> +			cooling-maps {
>> +				map0 {
>> +					trip = <&cpuss1_alert0>;
>> +					cooling-device = <&cpu4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>> +							 <&cpu5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>> +							 <&cpu6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>> +							 <&cpu7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
>> +				};
>> +			};
>> +
>> +			trips {
>> +				cpuss1_alert0: trip-point0 {
>> +					temperature = <75000>;
>> +					hysteresis = <2000>;
>> +					type = "passive";
>> +				};
>> +
>> +				cpuss1_alert1: trip-point1 {
>> +					temperature = <85000>;
>> +					hysteresis = <2000>;
>> +					type = "hot";
>> +				};
> 
> On newer platforms we rely on LMH to shut down the device if it
> were to reach the junction temperature, but let's leave them here
> as probably no one remembers for sure how reliable that is on these
> older platforms and you're most likely not willing to test that
> 
> Konrad
