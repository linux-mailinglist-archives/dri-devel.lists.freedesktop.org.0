Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 425B77289D3
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jun 2023 23:02:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3986510E614;
	Thu,  8 Jun 2023 21:02:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 255C110E614;
 Thu,  8 Jun 2023 21:02:25 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 65A3A6509E;
 Thu,  8 Jun 2023 21:02:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A661C433EF;
 Thu,  8 Jun 2023 21:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686258143;
 bh=JmJoxGn3E3w02fsl6dgeVzDy/YMBzEyUrQvBex3q3C4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FqP1o1CznrjlOLXs9PDzuDBjtR0ia97R5JsL7crndAuLGsgGs+ERLiqje85mlkrJq
 Wn2JO5jhiQhTbK3CU09mtpBEfphSQWi4mOrgS/Lt2L7u99KHwHJ6USlkfT7pHLUa3S
 mPIjzRqYsNt3LlEqp8R/WBf3H2rOTYmjRqONOVpTVvgxtsQfvus/ZoRG481MRZ6zc2
 eoGPo+AkZINzCAkkQWbaYnO8Hz9PKgQacNjYAG7aD7JsBwa3hJfAv8UyvqAQ2aQduX
 tyw2XjiHNn4ERhYO4CBPdGe+DfzaCUclX0x0jxS6/3JiVx03s7apFZXCo22zn334O4
 /kMYXmSFdzymw==
Date: Thu, 8 Jun 2023 22:02:16 +0100
From: Will Deacon <will@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [PATCH v6 10/12] iommu/arm-smmu-qcom: Sort the compatible list
 alphabetically
Message-ID: <20230608210215.GA2495@willie-the-truck>
References: <20230411-topic-straitlagoon_mdss-v6-0-dee6a882571b@linaro.org>
 <20230411-topic-straitlagoon_mdss-v6-10-dee6a882571b@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230411-topic-straitlagoon_mdss-v6-10-dee6a882571b@linaro.org>
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

On Tue, Jun 06, 2023 at 02:44:01PM +0200, Konrad Dybcio wrote:
> It got broken at some point, fix it up.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> index c71afda79d64..3800ab478216 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> @@ -251,10 +251,10 @@ static const struct of_device_id qcom_smmu_client_of_match[] __maybe_unused = {
>  	{ .compatible = "qcom,sc7280-mss-pil" },
>  	{ .compatible = "qcom,sc8180x-mdss" },
>  	{ .compatible = "qcom,sc8280xp-mdss" },
> -	{ .compatible = "qcom,sm8150-mdss" },
> -	{ .compatible = "qcom,sm8250-mdss" },
>  	{ .compatible = "qcom,sdm845-mdss" },
>  	{ .compatible = "qcom,sdm845-mss-pil" },
> +	{ .compatible = "qcom,sm8150-mdss" },
> +	{ .compatible = "qcom,sm8250-mdss" },
>  	{ }
>  };

Acked-by: Will Deacon <will@kernel.org>

Will
