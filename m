Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4AE5395607
	for <lists+dri-devel@lfdr.de>; Mon, 31 May 2021 09:25:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98E516E874;
	Mon, 31 May 2021 07:24:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1CEF6E875
 for <dri-devel@lists.freedesktop.org>; Mon, 31 May 2021 07:24:55 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1622445897; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=haTHTuXC1HmWCxguACi3s4xN1NZ67P1q/7nkLTJKnR0=;
 b=Oj9WOuMu1Nf62/Z08kgzL6zIwPxjpIAYERaN1hJmERQXLVIV0QdKF0Or7c1A1hWrj9iFejbM
 ldKbFzYw+EDN6LXRveisN+pIko9S6B3dCbpTo8M/sg1i9lnnecvsxtzxdzUyyz33C2OSvZ6e
 zFrfSC8hGrNMA1MVHy9+cLR9li4=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 60b48f2bea2aacd729592801 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 31 May 2021 07:24:27
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id F0DDCC433D3; Mon, 31 May 2021 07:24:26 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
 version=3.4.0
Received: from [192.168.1.105] (unknown [117.210.184.158])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: akhilpo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 7541AC433F1;
 Mon, 31 May 2021 07:24:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 7541AC433F1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=akhilpo@codeaurora.org
Subject: Re: [PATCH v2 2/8] drm/msm/a6xx: use AOP-initialized PDC for a650
To: Jonathan Marek <jonathan@marek.ca>, freedreno@lists.freedesktop.org
References: <20210513171431.18632-1-jonathan@marek.ca>
 <20210513171431.18632-3-jonathan@marek.ca>
From: Akhil P Oommen <akhilpo@codeaurora.org>
Message-ID: <bd5dc0e5-2c49-31fe-a290-0d8e75b45c94@codeaurora.org>
Date: Mon, 31 May 2021 12:54:20 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210513171431.18632-3-jonathan@marek.ca>
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
Cc: David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/13/2021 10:43 PM, Jonathan Marek wrote:
> SM8250 AOP firmware already sets up PDC registers for us, and it only needs
> to be enabled. This path will be used for other newer GPUs.
> 
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>   drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 21 ++++++++++++++++-----
>   1 file changed, 16 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index 3d55e153fa9c..c1ee02d6371d 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -512,19 +512,26 @@ static void a6xx_gmu_rpmh_init(struct a6xx_gmu *gmu)
>   	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
>   	struct platform_device *pdev = to_platform_device(gmu->dev);
>   	void __iomem *pdcptr = a6xx_gmu_get_mmio(pdev, "gmu_pdc");
> -	void __iomem *seqptr = a6xx_gmu_get_mmio(pdev, "gmu_pdc_seq");
> +	void __iomem *seqptr;
>   	uint32_t pdc_address_offset;
> +	bool pdc_in_aop = false;
>   
> -	if (!pdcptr || !seqptr)
> +	if (!pdcptr)
>   		goto err;
>   
> -	if (adreno_is_a618(adreno_gpu) || adreno_is_a640(adreno_gpu))
> +	if (adreno_is_a650(adreno_gpu))
> +		pdc_in_aop = true;
> +	else if (adreno_is_a618(adreno_gpu) || adreno_is_a640(adreno_gpu))
>   		pdc_address_offset = 0x30090;
> -	else if (adreno_is_a650(adreno_gpu))
> -		pdc_address_offset = 0x300a0;
>   	else
>   		pdc_address_offset = 0x30080;
>   
> +	if (!pdc_in_aop) {
> +		seqptr = a6xx_gmu_get_mmio(pdev, "gmu_pdc_seq");
> +		if (!seqptr)
> +			goto err;
> +	}
> +
>   	/* Disable SDE clock gating */
>   	gmu_write_rscc(gmu, REG_A6XX_GPU_RSCC_RSC_STATUS0_DRV0, BIT(24));
>   
> @@ -556,6 +563,9 @@ static void a6xx_gmu_rpmh_init(struct a6xx_gmu *gmu)
>   		gmu_write_rscc(gmu, REG_A6XX_RSCC_SEQ_MEM_0_DRV0 + 4, 0x0020e8a8);
>   	}
>   
> +	if (pdc_in_aop)
> +		goto setup_pdc;
> +
>   	/* Load PDC sequencer uCode for power up and power down sequence */
>   	pdc_write(seqptr, REG_A6XX_PDC_GPU_SEQ_MEM_0, 0xfebea1e1);
>   	pdc_write(seqptr, REG_A6XX_PDC_GPU_SEQ_MEM_0 + 1, 0xa5a4a3a2);
> @@ -596,6 +606,7 @@ static void a6xx_gmu_rpmh_init(struct a6xx_gmu *gmu)
>   	pdc_write(pdcptr, REG_A6XX_PDC_GPU_TCS3_CMD0_DATA + 8, 0x3);
>   
>   	/* Setup GPU PDC */
> +setup_pdc:
>   	pdc_write(pdcptr, REG_A6XX_PDC_GPU_SEQ_START_ADDR, 0);
>   	pdc_write(pdcptr, REG_A6XX_PDC_GPU_ENABLE_PDC, 0x80000001);
>   
> 

We can simply swap the order of PDC and rsc programming here and skip 
pdc sequence to jump to the rscc programming for a650. This is the order 
followed in the downstream driver anyway.

-Akhil.
