Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B69543D6AEE
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 02:16:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6791F6E0A5;
	Tue, 27 Jul 2021 00:16:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D2436E0A5
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 00:16:43 +0000 (UTC)
Received: by mail-ot1-x333.google.com with SMTP id
 z6-20020a9d24860000b02904d14e47202cso11765624ota.4
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jul 2021 17:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=tscrZBQstzzRaUL+UaPR6i4OEaBy+HrQhXGyWhtHbpY=;
 b=I0bCa3Idkeu+p5K2AETrjGGnbJVU0B3Kdkogh8ZnX/Pg35bJ5u63zp1PpsZR4PUA71
 pJvXM4Jz0xpHXLWmGg5smlJmSgXTQ1IRM4qgno2YoYyOBJ3LpB2LlPz6s+v/qRrjOvKD
 hKDJtkmccFTnmNWnT0gIloYTbnGn5VN8AvSdQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=tscrZBQstzzRaUL+UaPR6i4OEaBy+HrQhXGyWhtHbpY=;
 b=YaG7ZdHKPpG+woNl17BUKt/aqFr5thULy4IGjskwZsmACs7Si6Xbcots0zHCJwAEvd
 3O1oxlpr4kF3Rlqemjm3J6tlA56UCD28G/B9lEnrW+Qxn+5LFRUfzfcPF1iA7p26PkiH
 SDIWUvyCWQkC4pAcv2UTAtUmg4Db0S/0clNDbO1rTn+YHOFFDeNEaltlUqm0lP6DWPUJ
 V7kec+uzEXB838c72tFMkbBTEbm3vMW/IhhxfbQxziN8NFIChGkFZj+5bTg3AjK+N3RQ
 l4JaZDqGL81G4Tvsgqzt82V0K4VqgZpZo4O6FaGk2EAz3GforS2VsVlhen6dUSp+esjW
 Xitg==
X-Gm-Message-State: AOAM530BnIQUXhxxnrG7SndYNEpx4Q3LGZ/nlcKIxFaXlSVQkEcN917u
 H/YJDY+E+fgmxibYzxeHn3fQ9Yeabk1iXGeFtuQ4UQ==
X-Google-Smtp-Source: ABdhPJz9DOthLfEXyaAywpN2zjLbyg7yP79QdEbJyK44iOYpg3YyBnI1HZX1Oyg1Cv6KyXuESXsA/iFNxu6OmeFGo9c=
X-Received: by 2002:a9d:650e:: with SMTP id i14mr13685660otl.233.1627345002305; 
 Mon, 26 Jul 2021 17:16:42 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 26 Jul 2021 20:16:41 -0400
MIME-Version: 1.0
In-Reply-To: <1627147740-11590-1-git-send-email-akhilpo@codeaurora.org>
References: <1627147740-11590-1-git-send-email-akhilpo@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Mon, 26 Jul 2021 20:16:41 -0400
Message-ID: <CAE-0n52mEy1GReYwcVrffT2KOy4EHMHH-RyCJ_mmxhaeXwGdYA@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: sc7280: Add gpu support
To: Akhil P Oommen <akhilpo@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS <devicetree@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, 
 dri-devel@lists.freedesktop.org, freedreno <freedreno@lists.freedesktop.org>, 
 linux-arm-msm@vger.kernel.org
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
Cc: Jonathan Marek <jonathan@marek.ca>, linux-kernel@vger.kernel.org,
 Douglas Anderson <dianders@chromium.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Andy Gross <agross@kernel.org>,
 Matthias Kaehlcke <mka@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Akhil P Oommen (2021-07-24 10:29:00)
> Add the necessary dt nodes for gpu support in sc7280.
>
> Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
> ---
> This patch has dependency on the GPUCC bindings patch here:
> https://patchwork.kernel.org/project/linux-arm-msm/patch/1619519590-3019-4-git-send-email-tdas@codeaurora.org/

To avoid the dependency the plain numbers can be used.

>
> Changes in v2:
> - formatting update and removed a duplicate header (Stephan)
>
>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 116 +++++++++++++++++++++++++++++++++++
>  1 file changed, 116 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index 029723a..524a5e0 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -585,6 +586,121 @@
>                         #clock-cells = <1>;
>                 };
>
> +               gpu@3d00000 {
> +                       compatible = "qcom,adreno-635.0", "qcom,adreno";
> +                       #stream-id-cells = <16>;
> +                       reg = <0 0x03d00000 0 0x40000>,
> +                             <0 0x03d9e000 0 0x1000>,
> +                             <0 0x03d61000 0 0x800>;
> +                       reg-names = "kgsl_3d0_reg_memory",
> +                                   "cx_mem",
> +                                   "cx_dbgc";
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
> +                       clock-names = "gmu",
> +                                     "cxo",
> +                                     "axi",
> +                                     "memnoc",
> +                                     "ahb",
> +                                     "hub",
> +                                     "smmu_vote";
> +                       power-domains = <&gpucc GPU_CC_CX_GDSC>,
> +                                       <&gpucc GPU_CC_GX_GDSC>;
> +                       power-domain-names = "cx",
> +                                            "gx";
> +                       iommus = <&adreno_smmu 5 0x400>;
> +                       operating-points-v2 = <&gmu_opp_table>;
> +
> +                       gmu_opp_table: opp-table {
> +                               compatible = "operating-points-v2";
> +
> +                               opp-200000000 {
> +                                       opp-hz = /bits/ 64 <200000000>;
> +                                       opp-level = <RPMH_REGULATOR_LEVEL_MIN_SVS>;
> +                               };
> +                       };
> +               };
> +
> +               adreno_smmu: iommu@3da0000 {
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
>                 lpass_ag_noc: interconnect@3c40000 {

This node is 3c40000 and the one above is 3da0000. 3c comes before 3d.
Please order nodes properly.

>                         reg = <0 0x03c40000 0 0xf080>;
>                         compatible = "qcom,sc7280-lpass-ag-noc";
