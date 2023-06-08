Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 37B587289DA
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jun 2023 23:03:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 572F110E61B;
	Thu,  8 Jun 2023 21:03:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43EEB10E61A;
 Thu,  8 Jun 2023 21:03:14 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 98251650B6;
 Thu,  8 Jun 2023 21:03:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A092C433EF;
 Thu,  8 Jun 2023 21:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686258193;
 bh=5Rqs+TI7+U0eTYgJLifNYXyYtZalpZhl4Y2ONh4Xl2Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hogd7k5+0BE0wjtaKU01zNYc29U/k3Goxl5anOqgH2sxWYb36LRyzdhofvkKfKPTk
 EvEKecJMezYocqqYuYnqKj5n8pN/YlWVfHntaMcUg4Kl0yl7Yc9jkwaq1sHF1ZsT3a
 I81NXvP99k/zb55mtp1Tll6GwLHa4ifIFKeolUipmNyltca25i/J+4VKmiuB9D0jF3
 FbtWAwx05Rw74Mk6Wns7azZ8s22ggK35SG3WRJPWI2wg2O7nWuAU4w8fbaVwQkRdRB
 55850+WI+9zxjkHPkObSO8BqWWzcfBVEywLJiFZr6m746r7M/M7CQWnRptssSGfUWL
 /yqV3xTyWOdmg==
Date: Thu, 8 Jun 2023 22:03:05 +0100
From: Will Deacon <will@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [PATCH v6 12/12] iommu/arm-smmu-qcom: Add SM6350 DPU compatible
Message-ID: <20230608210304.GC2495@willie-the-truck>
References: <20230411-topic-straitlagoon_mdss-v6-0-dee6a882571b@linaro.org>
 <20230411-topic-straitlagoon_mdss-v6-12-dee6a882571b@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230411-topic-straitlagoon_mdss-v6-12-dee6a882571b@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, Conor Dooley <conor+dt@kernel.org>,
 iommu@lists.linux.dev, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Sean Paul <sean@poorly.run>,
 Joerg Roedel <joro@8bytes.org>, Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-kernel@lists.infradead.org, Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 06, 2023 at 02:44:03PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@somainline.org>
> 
> Add the SM6350 DPU compatible to clients compatible list, as it also
> needs the workarounds.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> index cc574928c707..bdeb587552c0 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> @@ -253,6 +253,7 @@ static const struct of_device_id qcom_smmu_client_of_match[] __maybe_unused = {
>  	{ .compatible = "qcom,sc8280xp-mdss" },
>  	{ .compatible = "qcom,sdm845-mdss" },
>  	{ .compatible = "qcom,sdm845-mss-pil" },
> +	{ .compatible = "qcom,sm6350-mdss" },
>  	{ .compatible = "qcom,sm6375-mdss" },
>  	{ .compatible = "qcom,sm8150-mdss" },
>  	{ .compatible = "qcom,sm8250-mdss" },

Acked-by: Will Deacon <will@kernel.org>

Will
