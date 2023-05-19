Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD043709EF9
	for <lists+dri-devel@lfdr.de>; Fri, 19 May 2023 20:18:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B59EF10E5E4;
	Fri, 19 May 2023 18:18:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay04.th.seeweb.it (relay04.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::165])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8261E10E095
 for <dri-devel@lists.freedesktop.org>; Fri, 19 May 2023 18:18:08 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 6F87D1F58D;
 Fri, 19 May 2023 20:18:03 +0200 (CEST)
Date: Fri, 19 May 2023 20:18:01 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [PATCH v4 00/12] SM63(50|75) DPU support
Message-ID: <dktpk4msw3v7y4tgyovcqels34urqzm3fcocygn6ocufws3kev@bd5zcy572cle>
References: <20230411-topic-straitlagoon_mdss-v4-0-68e7e25d70e1@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230411-topic-straitlagoon_mdss-v4-0-68e7e25d70e1@linaro.org>
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
Cc: Konrad Dybcio <konrad.dybcio@somainline.org>,
 dri-devel@lists.freedesktop.org, Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
 iommu@lists.linux.dev, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
 Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-05-19 19:04:21, Konrad Dybcio wrote:
> v3 -> v4:
> - Drop adding new QoS LUT entries
> - Add safe_lut_tbl for both SoCs

I may not have pinged you correctly with this message [1], but can you
add the DSC configuration for both SoCs?

[1]: https://lore.kernel.org/linux-arm-msm/u47xthqfjxpbbzjbvnrz4qa2f2m3aip4iose7cwuhzg4raf7db@qxbos7u55wko/

- Marijn

> 
> Depends on:
> - https://lore.kernel.org/linux-arm-msm/20230411-dpu-intf-te-v4-0-27ce1a5ab5c6@somainline.org/
> 
> v3: https://lore.kernel.org/r/20230411-topic-straitlagoon_mdss-v3-0-9837d6b3516d@linaro.org
> 
> v2 -> v3:
> - Don't duplicate qcm2290_lm_sblk
> - Use DEFAULT_DPU_LINE_WIDTH defines
> - Fix up sspp clk assignments for sm6350
> - Add 6350-6375-common QoS data straight to the common file
>   instead of moving it around after adding it
> - Fix up iommu compatible order before adding new entries
> - Reuse sm6350 msm_mdss_data for sm6375
> - INTF_SC7180_MASK -> INTF_SC7280_MASK (enable HCTL) on 6375
> - use double tabs in catalog headers
> - remove one unused entry in 6350 dpu_qos_lut_entry
> - add missing tear IRQs, drop INTF0 irq on 6375
> - don't overduplicate DPU bindings, reuse 7180
> - Pick up tags
> - Rebase on INTF_TE v4 and next-20230504
> 
> Depends on:
> - https://lore.kernel.org/linux-arm-msm/20230411-dpu-intf-te-v4-0-27ce1a5ab5c6@somainline.org/
> 
> v2: https://lore.kernel.org/r/20230411-topic-straitlagoon_mdss-v2-0-5def73f50980@linaro.org
> 
> v1 -> v2:
> - Rebase on the DPU catalog rework and INTF_TE
> - Fix QSEED(3L/4) discrepancies
> - Fixed DMA/cursor discrepancies for 6350
> - No deduplication, that's gonna be handled in catalogrework 2:
>   "the return of the catalogrework"
> - Split MDSS & DPU binding additions
> - Drop "Allow variable SSPP/INTF_BLK size", that got in w/ the rework
> - Split MDSS and DPU additions
> - Pick up Rob's acks
> 
> Depends on (and based on): https://lore.kernel.org/linux-arm-msm/20230411-dpu-intf-te-v2-0-ef76c877eb97@somainline.org/T/#t
> 
> v1: https://lore.kernel.org/linux-arm-msm/20230211122656.1479141-1-konrad.dybcio@linaro.org/
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
> Konrad Dybcio (12):
>       dt-bindings: display/msm: dsi-controller-main: Add SM6350
>       dt-bindings: display/msm: dsi-controller-main: Add SM6375
>       dt-bindings: display/msm: sc7180-dpu: Describe SM6350 and SM6375
>       dt-bindings: display/msm: Add SM6350 MDSS
>       dt-bindings: display/msm: Add SM6375 MDSS
>       drm/msm/dpu: Add SM6350 support
>       drm/msm: mdss: Add SM6350 support
>       drm/msm/dpu: Add SM6375 support
>       drm/msm: mdss: Add SM6375 support
>       iommu/arm-smmu-qcom: Sort the compatible list alphabetically
>       iommu/arm-smmu-qcom: Add SM6375 DPU compatible
>       iommu/arm-smmu-qcom: Add SM6350 DPU compatible
> 
>  .../bindings/display/msm/dsi-controller-main.yaml  |   4 +
>  .../bindings/display/msm/qcom,sc7180-dpu.yaml      |  23 ++-
>  .../bindings/display/msm/qcom,sm6350-mdss.yaml     | 214 ++++++++++++++++++++
>  .../bindings/display/msm/qcom,sm6375-mdss.yaml     | 216 +++++++++++++++++++++
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h | 188 ++++++++++++++++++
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h | 153 +++++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   6 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   2 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   2 +
>  drivers/gpu/drm/msm/msm_mdss.c                     |  10 +
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c         |   6 +-
>  11 files changed, 821 insertions(+), 3 deletions(-)
> ---
> base-commit: c437aff71b13c5ca77821ec1bab98ca7e18716d0
> change-id: 20230411-topic-straitlagoon_mdss-8f34cacd5e26
> 
> Best regards,
> -- 
> Konrad Dybcio <konrad.dybcio@linaro.org>
> 
