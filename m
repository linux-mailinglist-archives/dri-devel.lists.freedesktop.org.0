Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C31E2ECBF7
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jan 2021 09:53:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C265A6E425;
	Thu,  7 Jan 2021 08:53:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from so254-31.mailgun.net (so254-31.mailgun.net [198.61.254.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A37289A0F
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Jan 2021 04:50:19 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1609995019; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=/idK/qn/qYwK24YxIeFblcenK6sv0rtJO1umkF2y1L0=;
 b=pOuAcim1hk0gzHGZgcJQx4hwm8u2QgXA5EnsMVruMYsAuQrBwmZ0iQnNyRNc+SA3+daUqEF6
 //KvHWI1JTEOimumw0POJi0auj4F4mrJ/oKgXubSEB8IUAq34Y5tE7Qn0Ezez0IynPuE2tLm
 RKGNSw2nnr2ZtHM+3X47s+SnTDc=
X-Mailgun-Sending-Ip: 198.61.254.31
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 5ff69309570e7133a2ff9de0 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 07 Jan 2021 04:50:17
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 6DCBCC43465; Thu,  7 Jan 2021 04:50:16 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: saiprakash.ranjan)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 12866C433CA;
 Thu,  7 Jan 2021 04:50:14 +0000 (UTC)
MIME-Version: 1.0
Date: Thu, 07 Jan 2021 10:20:14 +0530
From: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To: Konrad Dybcio <konrad.dybcio@somainline.org>
Subject: Re: [PATCH] drm/msm: Only enable A6xx LLCC code on A6xx
In-Reply-To: <20210104193044.80591-1-konrad.dybcio@somainline.org>
References: <20210104193044.80591-1-konrad.dybcio@somainline.org>
Message-ID: <8847b190c9d03afd731881689d9b28d3@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-Mailman-Approved-At: Thu, 07 Jan 2021 08:53:13 +0000
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
Cc: freedreno@lists.freedesktop.org, Akhil P Oommen <akhilpo@codeaurora.org>,
 Dave Airlie <airlied@redhat.com>, Jonathan Marek <jonathan@marek.ca>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Sharat Masetty <smasetty@codeaurora.org>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, martin.botka@somainline.org,
 ~postmarketos/upstreaming@lists.sr.ht,
 angelogioacchino.delregno@somainline.org, marijn.suijten@somainline.org,
 phone-devel@vger.kernel.org, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-01-05 01:00, Konrad Dybcio wrote:
> Using this code on A5xx (and probably older too) causes a
> smmu bug.
> 
> Fixes: 474dadb8b0d5 ("drm/msm/a6xx: Add support for using system 
> cache(LLC)")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> Tested-by: AngeloGioacchino Del Regno 
> <angelogioacchino.delregno@somainline.org>
> ---

Reviewed-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>

>  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 21 ++++++++++++---------
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h |  5 +++++
>  2 files changed, 17 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> index 6cf9975e951e..f09175698827 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> @@ -191,8 +191,6 @@ adreno_iommu_create_address_space(struct msm_gpu 
> *gpu,
>  		struct platform_device *pdev)
>  {
>  	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> -	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
> -	struct io_pgtable_domain_attr pgtbl_cfg;
>  	struct iommu_domain *iommu;
>  	struct msm_mmu *mmu;
>  	struct msm_gem_address_space *aspace;
> @@ -202,13 +200,18 @@ adreno_iommu_create_address_space(struct msm_gpu 
> *gpu,
>  	if (!iommu)
>  		return NULL;
> 
> -	/*
> -	 * This allows GPU to set the bus attributes required to use system
> -	 * cache on behalf of the iommu page table walker.
> -	 */
> -	if (!IS_ERR(a6xx_gpu->htw_llc_slice)) {
> -		pgtbl_cfg.quirks = IO_PGTABLE_QUIRK_ARM_OUTER_WBWA;
> -		iommu_domain_set_attr(iommu, DOMAIN_ATTR_IO_PGTABLE_CFG, 
> &pgtbl_cfg);
> +
> +	if (adreno_is_a6xx(adreno_gpu)) {
> +		struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
> +		struct io_pgtable_domain_attr pgtbl_cfg;
> +		/*
> +		* This allows GPU to set the bus attributes required to use system
> +		* cache on behalf of the iommu page table walker.
> +		*/
> +		if (!IS_ERR(a6xx_gpu->htw_llc_slice)) {
> +			pgtbl_cfg.quirks = IO_PGTABLE_QUIRK_ARM_OUTER_WBWA;
> +			iommu_domain_set_attr(iommu, DOMAIN_ATTR_IO_PGTABLE_CFG, 
> &pgtbl_cfg);
> +		}
>  	}
> 
>  	mmu = msm_iommu_new(&pdev->dev, iommu);
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> index 4574d85c5680..08421fa54a50 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> @@ -226,6 +226,11 @@ static inline int adreno_is_a540(struct adreno_gpu 
> *gpu)
>  	return gpu->revn == 540;
>  }
> 
> +static inline bool adreno_is_a6xx(struct adreno_gpu *gpu)
> +{
> +	return ((gpu->revn < 700 && gpu->revn > 599));
> +}
> +
>  static inline int adreno_is_a618(struct adreno_gpu *gpu)
>  {
>         return gpu->revn == 618;

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
