Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EB64A94E8D
	for <lists+dri-devel@lfdr.de>; Mon, 21 Apr 2025 11:22:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C444D10E35A;
	Mon, 21 Apr 2025 09:22:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=mainlining.org header.i=@mainlining.org header.b="QEt53vUz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F58310E359;
 Mon, 21 Apr 2025 09:22:12 +0000 (UTC)
Received: from localhost (web.docker-mailserver_default [172.18.0.2])
 by mail.mainlining.org (Postfix) with ESMTPSA id B9614BBAD2;
 Mon, 21 Apr 2025 09:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mainlining.org;
 s=psm; t=1745227325;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9TVwWh/ybLUmoattVNjgJ0THd62L8OQPjQmgm+QFudI=;
 b=QEt53vUzTY9Xsd5obVxIe7P/xmtPrT3Sl70u60F7eip1QFae7ReZEyjAV2t01yWNWTKsK/
 CE/d2fiQRjLmoIjHcGl1HbWLZM+a7IwEowf+bDxbtVIECYNo6fhP9V1pSNS/qeahf0M4Yl
 9L04/aW69s7GJw/F0LJFX255uhjlE3a92r7mEOZvX88A/r+yxcfG1+76f/OmprLJToqdvE
 yQhDqWe7ZlBeUkfU787fQawkh2x8xUkEZ+NJvw/BZiOvp7pxHDlNP/0JNMdzOWOaC57qQR
 pehYh+Lpg0icIs8+NOWHQMJsh9i+HUXE0CQDuQppS7qblZFSmrf3twwVLNzlsQ==
MIME-Version: 1.0
Date: Mon, 21 Apr 2025 11:22:05 +0200
From: barnabas.czeman@mainlining.org
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Konrad
 Dybcio <konradybcio@kernel.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, Simona
 Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] arm64: dts: qcom: msm8953: sort adreno clocks
In-Reply-To: <nxv2k2ofiao47w7gmqcgfgn57heucs6yp2og3lkzlavjarado7@p5u4663yw3oz>
References: <20250421-a5xx-schema-v1-0-7d96b889322a@mainlining.org>
 <20250421-a5xx-schema-v1-2-7d96b889322a@mainlining.org>
 <nxv2k2ofiao47w7gmqcgfgn57heucs6yp2og3lkzlavjarado7@p5u4663yw3oz>
Message-ID: <4688d4d4ecee7078e535bb940b6055b9@mainlining.org>
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

On 2025-04-21 10:16, Dmitry Baryshkov wrote:
> On Mon, Apr 21, 2025 at 05:09:22AM +0200, Barnabás Czémán wrote:
>> Sort adreno clocks in alphabetical order.
> 
> Why? The order of the clocks here matches the order in which they 
> should
> be brought up.
Simple misunderstanding from previous attempts of documenting the 
alwayson clock.
By the way i have find out a508/a509/a512 clock bring up order is 
different from downstream.
Upstream: iface, rbmmtimer, mem, mem_iface, rbcpr, core
Downstream: core, iface, rbmmtimer, mem, alt_mem_iface, rbcpr
https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blob/LA.UM.7.2.c27-07400-sdm660.0/arch/arm/boot/dts/qcom/sdm630-gpu.dtsi#L85
https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blob/LA.UM.7.2.c27-07400-sdm660.0/arch/arm/boot/dts/qcom/sdm660-gpu.dtsi#L87
Should I fix it?
> 
>> 
>> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
>> ---
>>  arch/arm64/boot/dts/qcom/msm8953.dtsi | 16 ++++++++--------
>>  1 file changed, 8 insertions(+), 8 deletions(-)
>> 
>> diff --git a/arch/arm64/boot/dts/qcom/msm8953.dtsi 
>> b/arch/arm64/boot/dts/qcom/msm8953.dtsi
>> index 
>> 4793a60fa946195d3220b6c44dec170d443f56db..8a7e80c959fad09f950fe202eba76d3aae01d1ea 
>> 100644
>> --- a/arch/arm64/boot/dts/qcom/msm8953.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/msm8953.dtsi
>> @@ -1052,18 +1052,18 @@ gpu: gpu@1c00000 {
>>  			reg-names = "kgsl_3d0_reg_memory";
>>  			interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
>> 
>> -			clocks = <&gcc GCC_OXILI_GFX3D_CLK>,
>> +			clocks = <&gcc GCC_BIMC_GPU_CLK>,
>> +				 <&gcc GCC_OXILI_AON_CLK>,
>> +				 <&gcc GCC_OXILI_GFX3D_CLK>,
>>  				 <&gcc GCC_OXILI_AHB_CLK>,
>>  				 <&gcc GCC_BIMC_GFX_CLK>,
>> -				 <&gcc GCC_BIMC_GPU_CLK>,
>> -				 <&gcc GCC_OXILI_TIMER_CLK>,
>> -				 <&gcc GCC_OXILI_AON_CLK>;
>> -			clock-names = "core",
>> +				 <&gcc GCC_OXILI_TIMER_CLK>;
>> +			clock-names = "alt_mem_iface",
>> +				      "alwayson",
>> +				      "core",
>>  				      "iface",
>>  				      "mem_iface",
>> -				      "alt_mem_iface",
>> -				      "rbbmtimer",
>> -				      "alwayson";
>> +				      "rbbmtimer";
>>  			power-domains = <&gcc OXILI_GX_GDSC>;
>> 
>>  			iommus = <&gpu_iommu 0>;
>> 
>> --
>> 2.49.0
>> 
