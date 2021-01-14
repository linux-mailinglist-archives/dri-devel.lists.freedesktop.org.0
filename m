Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 239022F6E22
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jan 2021 23:25:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A7CF89B99;
	Thu, 14 Jan 2021 22:25:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from so254-31.mailgun.net (so254-31.mailgun.net [198.61.254.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65FCD89B7B
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jan 2021 22:24:59 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1610663099; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=WAPn2S7lwyyKdDbqBsaQKLrf+AH0DF+Qb5HT251B5/I=;
 b=CLnbeH5NdbFNLZNLyrfHaj0naB/XAnFgN8iV8+g6TYZsBAl4CFxAI8euB2UC64a9giY0mW+A
 RpIF3tO40ywHArZx0A22KyrT4DSu5glvsQV36yv2xnX1Qep004pacNJExT8fKDkklamR+Gqt
 Dnxw8YGy2cl9F01ocVxtoH1Y+kc=
X-Mailgun-Sending-Ip: 198.61.254.31
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 6000c4ba859d74370d2c9786 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 14 Jan 2021 22:24:58
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 682E6C43468; Thu, 14 Jan 2021 22:24:58 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED, BAYES_00,
 SPF_FAIL, 
 URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jcrouse)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 9D017C43461;
 Thu, 14 Jan 2021 22:24:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 9D017C43461
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=jcrouse@codeaurora.org
Date: Thu, 14 Jan 2021 15:24:52 -0700
From: Jordan Crouse <jcrouse@codeaurora.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
Subject: Re: [PATCH v3 7/7] drm/msm/a5xx: Disable UCHE global filter
Message-ID: <20210114222452.GF29638@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: AngeloGioacchino Del Regno
 <angelogioacchino.delregno@somainline.org>, 
 robdclark@gmail.com, sean@poorly.run, airlied@linux.ie,
 daniel@ffwll.ch, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
 konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
 martin.botka@somainline.org
References: <20210113183339.446239-1-angelogioacchino.delregno@somainline.org>
 <20210113183339.446239-8-angelogioacchino.delregno@somainline.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210113183339.446239-8-angelogioacchino.delregno@somainline.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
Cc: freedreno@lists.freedesktop.org, airlied@linux.ie,
 linux-arm-msm@vger.kernel.org, konrad.dybcio@somainline.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 martin.botka@somainline.org, marijn.suijten@somainline.org,
 phone-devel@vger.kernel.org, sean@poorly.run
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 13, 2021 at 07:33:39PM +0100, AngeloGioacchino Del Regno wrote:
> From: Konrad Dybcio <konrad.dybcio@somainline.org>
> 
> Port over the command from downstream to prevent undefined
> behaviour.

Reviewed-by: Jordan Crouse <jcrouse@codeaurora.org>

> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> ---
>  drivers/gpu/drm/msm/adreno/a5xx.xml.h | 2 ++
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c | 3 +++
>  2 files changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a5xx.xml.h b/drivers/gpu/drm/msm/adreno/a5xx.xml.h
> index 346cc6ff3a36..7b9fcfe95c04 100644
> --- a/drivers/gpu/drm/msm/adreno/a5xx.xml.h
> +++ b/drivers/gpu/drm/msm/adreno/a5xx.xml.h
> @@ -2367,6 +2367,8 @@ static inline uint32_t A5XX_VSC_RESOLVE_CNTL_Y(uint32_t val)
>  
>  #define REG_A5XX_UCHE_ADDR_MODE_CNTL				0x00000e80
>  
> +#define REG_A5XX_UCHE_MODE_CNTL					0x00000e81
> +
>  #define REG_A5XX_UCHE_SVM_CNTL					0x00000e82
>  
>  #define REG_A5XX_UCHE_WRITE_THRU_BASE_LO			0x00000e87
> diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> index 23fc851756de..7e553d3efeb2 100644
> --- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> @@ -754,6 +754,9 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
>  	    adreno_is_a512(adreno_gpu))
>  		gpu_rmw(gpu, REG_A5XX_RB_DBG_ECO_CNTL, 0, (1 << 9));
>  
> +	/* Disable UCHE global filter as SP can invalidate/flush independently */
> +	gpu_write(gpu, REG_A5XX_UCHE_MODE_CNTL, BIT(29));
> +
>  	/* Enable USE_RETENTION_FLOPS */
>  	gpu_write(gpu, REG_A5XX_CP_CHICKEN_DBG, 0x02000000);
>  
> -- 
> 2.29.2
> 

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
