Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEA1E7289D4
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jun 2023 23:02:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A73BB10E616;
	Thu,  8 Jun 2023 21:02:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10CD010E616;
 Thu,  8 Jun 2023 21:02:49 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4020C650B7;
 Thu,  8 Jun 2023 21:02:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19047C433D2;
 Thu,  8 Jun 2023 21:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686258168;
 bh=BXCYc0LX+cWXyo3YnVYrHoy26ym6pRqn7Ay5/hOAeY8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XgkbRpwpmwndNWkxQ6Vsj+abzRMoJLGC0rQeAyw4frHOgpdjQEcV8WW0f0SZIvtsr
 SinNKEwADMHYCALWpLa08pQMbgm0NQuPQ2qJsj8zZGAqvn3F2Og4F5yxR+Si+8J9Qw
 pQ+bnXP4SFWmtcSrNz8FGC7LHWMclVrmcvj1d8XG8Tl2Zd+koEGSSKWtc2EiqO2AAV
 REpY6V85bVLMcf2+tEmfdJzT5GP2Mmi8aeL81oXGL9zHYOtWyU8Qd0Vj3gpFP5VOtC
 JlvMDV73WFpbRmq37qvN/+Iaxv6TNT8WNvoDP7o4fwIqpTSqOaL83NadzogX8YUhsm
 zVLqOexqR6hYg==
Date: Thu, 8 Jun 2023 22:02:41 +0100
From: Will Deacon <will@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [PATCH v6 11/12] iommu/arm-smmu-qcom: Add SM6375 DPU compatible
Message-ID: <20230608210241.GB2495@willie-the-truck>
References: <20230411-topic-straitlagoon_mdss-v6-0-dee6a882571b@linaro.org>
 <20230411-topic-straitlagoon_mdss-v6-11-dee6a882571b@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230411-topic-straitlagoon_mdss-v6-11-dee6a882571b@linaro.org>
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
 Joerg Roedel <joro@8bytes.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-kernel@lists.infradead.org, Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 06, 2023 at 02:44:02PM +0200, Konrad Dybcio wrote:
> Add the SM6375 DPU compatible to clients compatible list, as it also
> needs the workarounds.
> 
> Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> index 3800ab478216..cc574928c707 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> @@ -253,6 +253,7 @@ static const struct of_device_id qcom_smmu_client_of_match[] __maybe_unused = {
>  	{ .compatible = "qcom,sc8280xp-mdss" },
>  	{ .compatible = "qcom,sdm845-mdss" },
>  	{ .compatible = "qcom,sdm845-mss-pil" },
> +	{ .compatible = "qcom,sm6375-mdss" },
>  	{ .compatible = "qcom,sm8150-mdss" },
>  	{ .compatible = "qcom,sm8250-mdss" },
>  	{ }

Acked-by: Will Deacon <will@kernel.org>

Will
