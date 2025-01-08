Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2957EA0685E
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 23:34:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B485C10E440;
	Wed,  8 Jan 2025 22:33:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="X4yREZda";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B04410E43E;
 Wed,  8 Jan 2025 22:33:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 7BACAA41CDF;
 Wed,  8 Jan 2025 22:32:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BC86C4CED3;
 Wed,  8 Jan 2025 22:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736375634;
 bh=zhMeq6e9p3UZO4+kqRySehHwx4EOWlJy8VBJhzApWkg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=X4yREZda6O3jHCglBv/wiKX/kB6CRC0KtzK/2M4ULMwu/lOo0YJVDq/vH+fFMCye3
 AdN7TiJQGTq4A8qAlVmyqOE702xPRUxBvI+cfmGKAf7l0qVEEwzLOYVUGmTm/+VClY
 5JwdVurCc7ksCFIjX/TTpohVL23o2HWieNPLpkRbad/Y7MUHOqkVnuKEDP+uAFH/HD
 VzCRhdz6iGwAMbF33lyqir3erSgtdupge+46/gjSE5aM9kSDwx+bBj5sn3sZX3Kk+a
 4qqn+Bkd4xGqPR3SO+GnGxxHADROUg+aNi1+J76/Oqw+sE7XZofuC9ZdK/NnG8+yF4
 OoPDZnlvNB0Jg==
Date: Wed, 8 Jan 2025 16:33:51 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jie Zhang <quic_jiezh@quicinc.com>
Subject: Re: [PATCH RESEND v2 3/4] arm64: dts: qcom: qcs615: Add gpu and gmu
 nodes
Message-ID: <y7rf2klosrpvr5foroilgma5rwmlyq4ux5zymxd5cen7d6yu42@xig34xs6whtg>
References: <20241213-qcs615-gpu-dt-v2-0-47f3b312b178@quicinc.com>
 <20241213-qcs615-gpu-dt-v2-3-47f3b312b178@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241213-qcs615-gpu-dt-v2-3-47f3b312b178@quicinc.com>
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

On Fri, Dec 13, 2024 at 05:01:05PM +0530, Akhil P Oommen wrote:
> From: Jie Zhang <quic_jiezh@quicinc.com>
> 
> Add gpu and gmu nodes for qcs615 chipset.
> 

Please resubmit this in a series together with the gpucc patch.

Regards,
Bjorn

> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/qcs615.dtsi | 88 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 88 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
> index 8df26efde3fd6c0f85b9bcddb461fae33687dc75..dee5d3be4aa34dd64864b6fe32ad589abac99bb7 100644
> --- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
> @@ -387,6 +387,11 @@ smem_region: smem@86000000 {
>  			no-map;
>  			hwlocks = <&tcsr_mutex 3>;
>  		};
> +
> +		pil_gpu_mem: pil-gpu@97715000 {
> +			reg = <0x0 0x97715000 0x0 0x2000>;
> +			no-map;
> +		};
>  	};
>  
>  	soc: soc@0 {
> @@ -508,6 +513,89 @@ qup_uart0_rx: qup-uart0-rx-state {
>  			};
>  		};
>  
> +		gpu: gpu@5000000 {
> +			compatible = "qcom,adreno-612.0", "qcom,adreno";
> +			reg = <0x0 0x05000000 0x0 0x90000>;
> +			reg-names = "kgsl_3d0_reg_memory";
> +
> +			clocks = <&gpucc GPU_CC_GX_GFX3D_CLK>,
> +				 <&gcc GCC_DDRSS_GPU_AXI_CLK>,
> +				 <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
> +				 <&gpucc GPU_CC_CX_GMU_CLK>,
> +				 <&gpucc GPU_CC_CXO_CLK>;
> +			clock-names = "core",
> +				      "mem_iface",
> +				      "alt_mem_iface",
> +				      "gmu",
> +				      "xo";
> +
> +			interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
> +
> +			interconnects = <&gem_noc MASTER_GFX3D QCOM_ICC_TAG_ALWAYS
> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> +			interconnect-names = "gfx-mem";
> +
> +			iommus = <&adreno_smmu 0x0 0x401>;
> +			operating-points-v2 = <&gpu_opp_table>;
> +			power-domains = <&rpmhpd RPMHPD_CX>;
> +			qcom,gmu = <&rgmu>;
> +
> +			#cooling-cells = <2>;
> +
> +			status = "disabled";
> +
> +			gpu_zap_shader: zap-shader {
> +				memory-region = <&pil_gpu_mem>;
> +			};
> +
> +			gpu_opp_table: opp-table {
> +				compatible = "operating-points-v2";
> +
> +				opp-435000000 {
> +					opp-hz = /bits/ 64 <435000000>;
> +					required-opps = <&rpmhpd_opp_svs>;
> +					opp-peak-kBps = <3000000>;
> +				};
> +
> +				opp-500000000 {
> +					opp-hz = /bits/ 64 <500000000>;
> +					required-opps = <&rpmhpd_opp_svs_l1>;
> +					opp-peak-kBps = <3975000>;
> +				};
> +
> +				opp-650000000 {
> +					opp-hz = /bits/ 64 <650000000>;
> +					required-opps = <&rpmhpd_opp_nom>;
> +					opp-peak-kBps = <5287500>;
> +				};
> +
> +				opp-745000000 {
> +					opp-hz = /bits/ 64 <745000000>;
> +					required-opps = <&rpmhpd_opp_nom_l1>;
> +					opp-peak-kBps = <6075000>;
> +				};
> +
> +				opp-845000000 {
> +					opp-hz = /bits/ 64 <845000000>;
> +					required-opps = <&rpmhpd_opp_turbo>;
> +					opp-peak-kBps = <7050000>;
> +				};
> +			};
> +		};
> +
> +		rgmu: rgmu@506a000 {
> +			compatible = "qcom,adreno-rgmu";
> +			reg = <0x0 0x0506a000 0x0 0x34000>;
> +			reg-names = "gmu";
> +			power-domains = <&gpucc CX_GDSC>,
> +					<&gpucc GX_GDSC>;
> +			power-domain-names = "cx", "gx";
> +
> +			interrupts = <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "hfi", "gmu";
> +		};
> +
>  		gpucc: clock-controller@5090000 {
>  			compatible = "qcom,qcs615-gpucc";
>  			reg = <0 0x5090000 0 0x9000>;
> 
> -- 
> 2.45.2
> 
