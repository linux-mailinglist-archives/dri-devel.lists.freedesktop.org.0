Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C91F33D4436
	for <lists+dri-devel@lfdr.de>; Sat, 24 Jul 2021 03:30:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCF2D6FD4E;
	Sat, 24 Jul 2021 01:30:46 +0000 (UTC)
X-Original-To: dri-devel@freedesktop.org
Delivered-To: dri-devel@freedesktop.org
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [IPv6:2607:f8b0:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0D216FC89
 for <dri-devel@freedesktop.org>; Sat, 24 Jul 2021 01:30:45 +0000 (UTC)
Received: by mail-ot1-x332.google.com with SMTP id
 61-20020a9d0d430000b02903eabfc221a9so3933844oti.0
 for <dri-devel@freedesktop.org>; Fri, 23 Jul 2021 18:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=tjbmf6QXY2W+Nbmim38kusmymcjWfC+qA2fJ0iXz/KI=;
 b=TvMAXp3spDk29OHAgsCRBMxgaNUv7OxrmCsvfJ+ETQoSwRwlR2ZUtSUKDs8vKW9/a5
 eyNIiNN3DmeHQ4jAREQS5+IneCe1j9UcoRkzyJMkkH8llJVXTW25v4Gr7WcNIMEVPua5
 CuUBpI0pgpUfrptIpyJFOpaTyh+mPcY7LqAXw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=tjbmf6QXY2W+Nbmim38kusmymcjWfC+qA2fJ0iXz/KI=;
 b=QUpZ3XSvy31omvuXhNDncVlEAw5ZFPWpA19LQFSLoXjc81j0lakSunNHqOgoh1fyMp
 fCJ76wqCSBTYCKlEaHwhTmr8XElzqfpwt2ety5Hu3BPhyZNxLscVbG7iANMvMRzvhxHu
 3gG8U53Dc+QEr/Dk4Wukp2bPtUDfdon1YaDwmVKB8N9rg8jBfBM2BpBXTcGF4zWMIh55
 5zg/0VyA2VmZu/2aOEoiqrxeOxEey6TyTWvaruqUxyB0FysgEW0vfnwqr/t2lLqzALAJ
 eROrwcSPPBHOPB9s9KCwexNQHH5w+UFF7Ykv0A1qY1Gji8Erl1uNHwVsGN4JoWroCEc0
 dB5g==
X-Gm-Message-State: AOAM530kWh76q14BwXFMXs6dwan0qQlY7SEz4Z7W1vZh0noQw2GOcUOe
 JOe2WPsSwVUFD8MtxxYnRESPJJ1YlhUoDDzzTNlxLQ==
X-Google-Smtp-Source: ABdhPJyMMeaqCnCa3wyaRvlhO9ED0pMArlJie8NNlQ/fzjJggDf1wrB8rH/daTcBCqUMYrRcXJU5OfMQ5B84Q+o0PeM=
X-Received: by 2002:a9d:8c7:: with SMTP id 65mr4898349otf.25.1627090244863;
 Fri, 23 Jul 2021 18:30:44 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 23 Jul 2021 18:30:44 -0700
MIME-Version: 1.0
In-Reply-To: <1627039254-13083-1-git-send-email-akhilpo@codeaurora.org>
References: <1627039254-13083-1-git-send-email-akhilpo@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Fri, 23 Jul 2021 18:30:44 -0700
Message-ID: <CAE-0n51+165pgZ5tgxmw_+7i2uYLXxAazYYkCKce0UuhfSHxbQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sc7280: Add gpu support
To: Akhil P Oommen <akhilpo@codeaurora.org>, bjorn.andersson@linaro.org, 
 freedreno@lists.freedesktop.org, georgi.djakov@linaro.org, robh+dt@kernel.org, 
 robh@kernel.org
Content-Type: text/plain; charset="UTF-8"
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
Cc: dianders@chromium.org, jonathan@marek.ca, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, jordan@cosmicpenguin.net, mka@chromium.org,
 dri-devel@freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Akhil P Oommen (2021-07-23 04:20:54)
> Add the necessary dt nodes for gpu support in sc7280.
>
> Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
> ---
> This patch has dependency on the GPUCC bindings patch here:
> https://patchwork.kernel.org/project/linux-arm-msm/patch/1619519590-3019-4-git-send-email-tdas@codeaurora.org/
>
>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 107 +++++++++++++++++++++++++++++++++++
>  1 file changed, 107 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index 029723a..beb313c 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -16,6 +16,8 @@
>  #include <dt-bindings/reset/qcom,sdm845-pdc.h>
>  #include <dt-bindings/soc/qcom,rpmh-rsc.h>
>  #include <dt-bindings/thermal/thermal.h>
> +#include <dt-bindings/interconnect/qcom,sc7280.h>
> +#include <dt-bindings/clock/qcom,gpucc-sc7280.h>

Please sort this alphabetically.

>
>  / {
>         interrupt-parent = <&intc>;
> @@ -592,6 +594,111 @@
>                         qcom,bcm-voters = <&apps_bcm_voter>;
>                 };
>
> +               gpu: gpu@3d00000 {

Will this label be used? If not, please don't add it.

> +                       compatible = "qcom,adreno-635.0", "qcom,adreno";
> +                       #stream-id-cells = <16>;
> +                       reg = <0 0x03d00000 0 0x40000>, <0 0x03d9e000 0 0x1000>,
> +                               <0 0x03d61000 0 0x800>;
> +                       reg-names = "kgsl_3d0_reg_memory", "cx_mem", "cx_dbgc";

I'd prefer to see one reg and reg-names per line if the list is longer
than one line.

		reg = < >,
		      < >,
		      < >;
		reg-names = " ",
		            " ",
			    " ";

It makes is much easier to figure out which property lines up with which
name.

> +                       interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
> +                       iommus = <&adreno_smmu 0 0x401>;
> +                       operating-points-v2 = <&gpu_opp_table>;
> +                       qcom,gmu = <&gmu>;
> +                       interconnects = <&gem_noc MASTER_GFX3D 0 &mc_virt SLAVE_EBI1 0>;
> +                       interconnect-names = "gfx-mem";
> +
> +                       gpu_opp_table: opp-table {
> +                               compatible = "operating-points-v2";
> +
> +                               opp-550000000 {
> +                                       opp-hz = /bits/ 64 <550000000>;
> +                                       opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
> +                                       opp-peak-kBps = <6832000>;
> +                               };
> +
> +                               opp-450000000 {
> +                                       opp-hz = /bits/ 64 <450000000>;
> +                                       opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
> +                                       opp-peak-kBps = <4068000>;
> +                               };
> +
> +                               opp-315000000 {
> +                                       opp-hz = /bits/ 64 <315000000>;
> +                                       opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
> +                                       opp-peak-kBps = <1804000>;
> +                               };
> +                       };
> +               };
> +
> +               adreno_smmu: iommu@3da0000 {

3da0000 comes after 3d69000, please sort this by unit address.

> +                       compatible = "qcom,sc7280-smmu-500", "qcom,adreno-smmu", "arm,mmu-500";
> +                       reg = <0 0x03da0000 0 0x20000>;
> +                       #iommu-cells = <2>;
> +                       #global-interrupts = <2>;
> +                       interrupts = <GIC_SPI 673 IRQ_TYPE_LEVEL_HIGH>,
> +                                       <GIC_SPI 675 IRQ_TYPE_LEVEL_HIGH>,
> +                                       <GIC_SPI 678 IRQ_TYPE_LEVEL_HIGH>,
> +                                       <GIC_SPI 679 IRQ_TYPE_LEVEL_HIGH>,
> +                                       <GIC_SPI 680 IRQ_TYPE_LEVEL_HIGH>,
> +                                       <GIC_SPI 681 IRQ_TYPE_LEVEL_HIGH>,
> +                                       <GIC_SPI 682 IRQ_TYPE_LEVEL_HIGH>,
> +                                       <GIC_SPI 683 IRQ_TYPE_LEVEL_HIGH>,
> +                                       <GIC_SPI 684 IRQ_TYPE_LEVEL_HIGH>,
> +                                       <GIC_SPI 685 IRQ_TYPE_LEVEL_HIGH>,
> +                                       <GIC_SPI 686 IRQ_TYPE_LEVEL_HIGH>,
> +                                       <GIC_SPI 687 IRQ_TYPE_LEVEL_HIGH>;
> +
> +                       clocks = <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
> +                                       <&gcc GCC_GPU_SNOC_DVM_GFX_CLK>,
> +                                       <&gpucc GPU_CC_AHB_CLK>,
> +                                       <&gpucc GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK>,
> +                                       <&gpucc GPU_CC_CX_GMU_CLK>,
> +                                       <&gpucc GPU_CC_HUB_CX_INT_CLK>,
> +                                       <&gpucc GPU_CC_HUB_AON_CLK>;
> +                       clock-names = "gcc_gpu_memnoc_gfx_clk",
> +                                       "gcc_gpu_snoc_dvm_gfx_clk",
> +                                       "gpu_cc_ahb_clk",
> +                                       "gpu_cc_hlos1_vote_gpu_smmu_clk",
> +                                       "gpu_cc_cx_gmu_clk",
> +                                       "gpu_cc_hub_cx_int_clk",
> +                                       "gpu_cc_hub_aon_clk";
> +
> +                       power-domains = <&gpucc GPU_CC_CX_GDSC>;
> +               };
> +
> +               gmu: gmu@3d69000 {
> +                       compatible="qcom,adreno-gmu-635.0", "qcom,adreno-gmu";
> +                       reg = <0 0x03d6a000 0 0x34000>,
> +                               <0 0x3de0000 0 0x10000>,
> +                               <0 0x0b290000 0 0x10000>;
> +                       reg-names = "gmu", "rscc", "gmu_pdc";
> +                       interrupts = <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
> +                                       <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>;
> +                       interrupt-names = "hfi", "gmu";
> +                       clocks = <&gpucc GPU_CC_CX_GMU_CLK>,
> +                                       <&gpucc GPU_CC_CXO_CLK>,
> +                                       <&gcc GCC_DDRSS_GPU_AXI_CLK>,
> +                                       <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
> +                                       <&gpucc GPU_CC_AHB_CLK>,
> +                                       <&gpucc GPU_CC_HUB_CX_INT_CLK>,
> +                                       <&gpucc GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK>;
> +                       clock-names = "gmu", "cxo", "axi", "memnoc", "ahb",
> +                                       "hub", "smmu_vote";

Same comment about one line per clock for clock-names so we can easily
match them up.

> +                       power-domains = <&gpucc GPU_CC_CX_GDSC>, <&gpucc GPU_CC_GX_GDSC>;
> +                       power-domain-names = "cx", "gx";
> +                       iommus = <&adreno_smmu 5 0x400>;
> +                       operating-points-v2 = <&gmu_opp_table>;
> +
