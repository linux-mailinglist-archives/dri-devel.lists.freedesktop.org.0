Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2133A722BAC
	for <lists+dri-devel@lfdr.de>; Mon,  5 Jun 2023 17:43:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16EEB10E2EC;
	Mon,  5 Jun 2023 15:43:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BBF510E2EC;
 Mon,  5 Jun 2023 15:43:48 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4EEEF6279F;
 Mon,  5 Jun 2023 15:43:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0EFBC4339E;
 Mon,  5 Jun 2023 15:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1685979826;
 bh=LzpzvXyyXQzwkwbSAIUoLeJNTmxmMIl7hNCUv+YezGY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FEXeNhlnAbRnfis4uneWkVDGIAApQq24LkbdjlApCcdmF2u9UZ9gPwEtoKRSBYn3P
 W42S45nu69RxPfio4wZnLsJlnoa3RqgWdMcfywTnVQ99Khx03M1+SW58TTW+CUFod6
 9JIz23UQwgAHP/223iyqdDNwykJqS2SRu1LHhy0UnWOAxPSu4Yauw8coJq+XoJX7/Y
 Q1NJynk5OgSV+DCHUg0Kqy00N+WSOKhDtBmJnVKIz27Vua4pfPyJmCmNkjj9YJs3mo
 GQ2JJJqWCSZsHobX+7U8YxIAiROvLyS0ASnpHuBq0nq4338R27NZaAJa6L/lGcDwAw
 1si4ag9Xvy8DA==
Date: Mon, 5 Jun 2023 16:43:39 +0100
From: Will Deacon <will@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v5 00/12] SM63(50|75) DPU support
Message-ID: <20230605154338.GC21796@willie-the-truck>
References: <20230411-topic-straitlagoon_mdss-v5-0-998b4d2f7dd1@linaro.org>
 <0fbe5ddb-c3de-0724-fb69-a99e4980b26c@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0fbe5ddb-c3de-0724-fb69-a99e4980b26c@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
 Marijn Suijten <marijn.suijten@somainline.org>, Joerg Roedel <joro@8bytes.org>,
 iommu@lists.linux.dev, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
 Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 01, 2023 at 03:16:52AM +0300, Dmitry Baryshkov wrote:
> On 23/05/2023 10:46, Konrad Dybcio wrote:
> 
> [skipped the changelog]
> 
> > ---
> > Konrad Dybcio (12):
> >        dt-bindings: display/msm: dsi-controller-main: Add SM6350
> >        dt-bindings: display/msm: dsi-controller-main: Add SM6375
> >        dt-bindings: display/msm: sc7180-dpu: Describe SM6350 and SM6375
> >        dt-bindings: display/msm: Add SM6350 MDSS
> >        dt-bindings: display/msm: Add SM6375 MDSS
> >        drm/msm/dpu: Add SM6350 support
> >        drm/msm: mdss: Add SM6350 support
> >        drm/msm/dpu: Add SM6375 support
> >        drm/msm: mdss: Add SM6375 support
> >        iommu/arm-smmu-qcom: Sort the compatible list alphabetically
> >        iommu/arm-smmu-qcom: Add SM6375 DPU compatible
> >        iommu/arm-smmu-qcom: Add SM6350 DPU compatible
> 
> As we are now nearly ready to merge this series, Will, Robin, what should be
> the merge strategy for these three patches? Would you take them through the
> arm-smmu/iommu tree?

I'm happy to take the three IOMMU changes, but the bulk of this series is
replated to display and GPU so I don't think it makes sense for me to take
those.

Will
