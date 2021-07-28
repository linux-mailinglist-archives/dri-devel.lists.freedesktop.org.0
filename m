Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AEA493D88B9
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jul 2021 09:18:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 553686E1B7;
	Wed, 28 Jul 2021 07:18:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 011BD6E1B7
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jul 2021 07:18:06 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1627456688; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=uTWyTqMs+PRR6Vr7fo7QE9aqKJhA7o/4CIJbMLl7ewQ=;
 b=d773LqMttmyxLzz8eF9XubBokyvkK81dzu/kLZwdU4QcsfB7W0QD2r6RqS5NZ3bb8V30lkm5
 fIHSTDjzrgsz0sPYanIei4CoDWF8CirMJLtxR/Y1F/MSyHF1XgDz9xLnPlYF40A04RKLH3W+
 5XgIhPgP/zsLd+CHKl3gDDjWK3k=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 610104a117c2b4047d48f1c5 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 28 Jul 2021 07:17:53
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 14A36C4338A; Wed, 28 Jul 2021 07:17:53 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.2 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
 version=3.4.0
Received: from [192.168.1.105] (unknown [59.89.229.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: akhilpo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id F0052C433D3;
 Wed, 28 Jul 2021 07:17:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org F0052C433D3
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=akhilpo@codeaurora.org
Subject: Re: [PATCH v2] arm64: dts: qcom: sc7280: Add gpu support
To: Stephen Boyd <swboyd@chromium.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS
 <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 dri-devel@lists.freedesktop.org, freedreno
 <freedreno@lists.freedesktop.org>, linux-arm-msm@vger.kernel.org
References: <1627147740-11590-1-git-send-email-akhilpo@codeaurora.org>
 <CAE-0n52mEy1GReYwcVrffT2KOy4EHMHH-RyCJ_mmxhaeXwGdYA@mail.gmail.com>
From: Akhil P Oommen <akhilpo@codeaurora.org>
Message-ID: <e1a28bed-a2a9-2bf2-d0f0-3f608a538f69@codeaurora.org>
Date: Wed, 28 Jul 2021 12:47:45 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAE-0n52mEy1GReYwcVrffT2KOy4EHMHH-RyCJ_mmxhaeXwGdYA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: Douglas Anderson <dianders@chromium.org>,
 Jonathan Marek <jonathan@marek.ca>, linux-kernel@vger.kernel.org,
 Andy Gross <agross@kernel.org>, Jordan Crouse <jordan@cosmicpenguin.net>,
 Matthias Kaehlcke <mka@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/27/2021 5:46 AM, Stephen Boyd wrote:
> Quoting Akhil P Oommen (2021-07-24 10:29:00)
>> Add the necessary dt nodes for gpu support in sc7280.
>>
>> Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
>> ---
>> This patch has dependency on the GPUCC bindings patch here:
>> https://patchwork.kernel.org/project/linux-arm-msm/patch/1619519590-3019-4-git-send-email-tdas@codeaurora.org/
> 
> To avoid the dependency the plain numbers can be used.

But, won't that reduce readability and make things prone to error? If 
the other patch doesn't get picked up soon, we should try this option. 
We like to get this patch merged in v5.15.

> 
>>
>> Changes in v2:
>> - formatting update and removed a duplicate header (Stephan)
>>
>>   arch/arm64/boot/dts/qcom/sc7280.dtsi | 116 +++++++++++++++++++++++++++++++++++
>>   1 file changed, 116 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> index 029723a..524a5e0 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> @@ -585,6 +586,121 @@
>>                          #clock-cells = <1>;
>>                  };
>>
>> +               gpu@3d00000 {
>> +                       compatible = "qcom,adreno-635.0", "qcom,adreno";
>> +                       #stream-id-cells = <16>;
>> +                       reg = <0 0x03d00000 0 0x40000>,
>> +                             <0 0x03d9e000 0 0x1000>,
>> +                             <0 0x03d61000 0 0x800>;
>> +                       reg-names = "kgsl_3d0_reg_memory",
>> +                                   "cx_mem",
>> +                                   "cx_dbgc";
>> +                       interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
>> +                       iommus = <&adreno_smmu 0 0x401>;
>> +                       operating-points-v2 = <&gpu_opp_table>;
>> +                       qcom,gmu = <&gmu>;
>> +                       interconnects = <&gem_noc MASTER_GFX3D 0 &mc_virt SLAVE_EBI1 0>;
>> +                       interconnect-names = "gfx-mem";
>> +
>> +                       gpu_opp_table: opp-table {
>> +                               compatible = "operating-points-v2";
>> +
>> +                               opp-550000000 {
>> +                                       opp-hz = /bits/ 64 <550000000>;
>> +                                       opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
>> +                                       opp-peak-kBps = <6832000>;
>> +                               };
>> +
>> +                               opp-450000000 {
>> +                                       opp-hz = /bits/ 64 <450000000>;
>> +                                       opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
>> +                                       opp-peak-kBps = <4068000>;
>> +                               };
>> +
>> +                               opp-315000000 {
>> +                                       opp-hz = /bits/ 64 <315000000>;
>> +                                       opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
>> +                                       opp-peak-kBps = <1804000>;
>> +                               };
>> +                       };
>> +               };
>> +
>> +               gmu: gmu@3d69000 {
>> +                       compatible="qcom,adreno-gmu-635.0", "qcom,adreno-gmu";
>> +                       reg = <0 0x03d6a000 0 0x34000>,
>> +                               <0 0x3de0000 0 0x10000>,
>> +                               <0 0x0b290000 0 0x10000>;
>> +                       reg-names = "gmu", "rscc", "gmu_pdc";
>> +                       interrupts = <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
>> +                                       <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>;
>> +                       interrupt-names = "hfi", "gmu";
>> +                       clocks = <&gpucc GPU_CC_CX_GMU_CLK>,
>> +                                       <&gpucc GPU_CC_CXO_CLK>,
>> +                                       <&gcc GCC_DDRSS_GPU_AXI_CLK>,
>> +                                       <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
>> +                                       <&gpucc GPU_CC_AHB_CLK>,
>> +                                       <&gpucc GPU_CC_HUB_CX_INT_CLK>,
>> +                                       <&gpucc GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK>;
>> +                       clock-names = "gmu",
>> +                                     "cxo",
>> +                                     "axi",
>> +                                     "memnoc",
>> +                                     "ahb",
>> +                                     "hub",
>> +                                     "smmu_vote";
>> +                       power-domains = <&gpucc GPU_CC_CX_GDSC>,
>> +                                       <&gpucc GPU_CC_GX_GDSC>;
>> +                       power-domain-names = "cx",
>> +                                            "gx";
>> +                       iommus = <&adreno_smmu 5 0x400>;
>> +                       operating-points-v2 = <&gmu_opp_table>;
>> +
>> +                       gmu_opp_table: opp-table {
>> +                               compatible = "operating-points-v2";
>> +
>> +                               opp-200000000 {
>> +                                       opp-hz = /bits/ 64 <200000000>;
>> +                                       opp-level = <RPMH_REGULATOR_LEVEL_MIN_SVS>;
>> +                               };
>> +                       };
>> +               };
>> +
>> +               adreno_smmu: iommu@3da0000 {
>> +                       compatible = "qcom,sc7280-smmu-500", "qcom,adreno-smmu", "arm,mmu-500";
>> +                       reg = <0 0x03da0000 0 0x20000>;
>> +                       #iommu-cells = <2>;
>> +                       #global-interrupts = <2>;
>> +                       interrupts = <GIC_SPI 673 IRQ_TYPE_LEVEL_HIGH>,
>> +                                       <GIC_SPI 675 IRQ_TYPE_LEVEL_HIGH>,
>> +                                       <GIC_SPI 678 IRQ_TYPE_LEVEL_HIGH>,
>> +                                       <GIC_SPI 679 IRQ_TYPE_LEVEL_HIGH>,
>> +                                       <GIC_SPI 680 IRQ_TYPE_LEVEL_HIGH>,
>> +                                       <GIC_SPI 681 IRQ_TYPE_LEVEL_HIGH>,
>> +                                       <GIC_SPI 682 IRQ_TYPE_LEVEL_HIGH>,
>> +                                       <GIC_SPI 683 IRQ_TYPE_LEVEL_HIGH>,
>> +                                       <GIC_SPI 684 IRQ_TYPE_LEVEL_HIGH>,
>> +                                       <GIC_SPI 685 IRQ_TYPE_LEVEL_HIGH>,
>> +                                       <GIC_SPI 686 IRQ_TYPE_LEVEL_HIGH>,
>> +                                       <GIC_SPI 687 IRQ_TYPE_LEVEL_HIGH>;
>> +
>> +                       clocks = <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
>> +                                       <&gcc GCC_GPU_SNOC_DVM_GFX_CLK>,
>> +                                       <&gpucc GPU_CC_AHB_CLK>,
>> +                                       <&gpucc GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK>,
>> +                                       <&gpucc GPU_CC_CX_GMU_CLK>,
>> +                                       <&gpucc GPU_CC_HUB_CX_INT_CLK>,
>> +                                       <&gpucc GPU_CC_HUB_AON_CLK>;
>> +                       clock-names = "gcc_gpu_memnoc_gfx_clk",
>> +                                       "gcc_gpu_snoc_dvm_gfx_clk",
>> +                                       "gpu_cc_ahb_clk",
>> +                                       "gpu_cc_hlos1_vote_gpu_smmu_clk",
>> +                                       "gpu_cc_cx_gmu_clk",
>> +                                       "gpu_cc_hub_cx_int_clk",
>> +                                       "gpu_cc_hub_aon_clk";
>> +
>> +                       power-domains = <&gpucc GPU_CC_CX_GDSC>;
>> +               };
>> +
>>                  lpass_ag_noc: interconnect@3c40000 {
> 
> This node is 3c40000 and the one above is 3da0000. 3c comes before 3d.
> Please order nodes properly.

Yeah, I messed up the order at a couple of places. Will fix.

-Akhil.
> 
>>                          reg = <0 0x03c40000 0 0xf080>;
>>                          compatible = "qcom,sc7280-lpass-ag-noc";

