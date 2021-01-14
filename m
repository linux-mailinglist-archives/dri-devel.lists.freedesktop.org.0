Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 943202F6E1E
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jan 2021 23:24:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1A8689BA9;
	Thu, 14 Jan 2021 22:24:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-15.mailgun.net (m43-15.mailgun.net [69.72.43.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDDAD89BA9
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jan 2021 22:24:02 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1610663047; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=FZgFCzgmq7rdQxKcmeYNYnl48o3AMxZVO3hSa/M7cEw=;
 b=C8ygz0bjcSzEITnYAMWRlm1qKR32ieSay49fvPSTfQrjbBzuzOEmLJ0BfF3CQlphDaDnaq7I
 LSaO/Hv2YLZE4ZWPZ66rskIcQdioywqorV79eoKRTcytzPeW44hlGvX+qmzA4XOGk3WHyEoY
 b61BuNnz4Ww3csgp7poxNKRtF1o=
X-Mailgun-Sending-Ip: 69.72.43.15
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 6000c47570c16b759f689fbe (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 14 Jan 2021 22:23:49
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 08E6EC43462; Thu, 14 Jan 2021 22:23:48 +0000 (UTC)
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
 by smtp.codeaurora.org (Postfix) with ESMTPSA id F2864C433C6;
 Thu, 14 Jan 2021 22:23:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org F2864C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=jcrouse@codeaurora.org
Date: Thu, 14 Jan 2021 15:23:43 -0700
From: Jordan Crouse <jcrouse@codeaurora.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
Subject: Re: [PATCH v3 5/7] drm/msm/a5xx: Fix VPC protect value in gpu_write()
Message-ID: <20210114222343.GD29638@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: AngeloGioacchino Del Regno
 <angelogioacchino.delregno@somainline.org>, 
 robdclark@gmail.com, sean@poorly.run, airlied@linux.ie,
 daniel@ffwll.ch, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
 konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
 martin.botka@somainline.org
References: <20210113183339.446239-1-angelogioacchino.delregno@somainline.org>
 <20210113183339.446239-6-angelogioacchino.delregno@somainline.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210113183339.446239-6-angelogioacchino.delregno@somainline.org>
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

On Wed, Jan 13, 2021 at 07:33:37PM +0100, AngeloGioacchino Del Regno wrote:
> From: Konrad Dybcio <konrad.dybcio@somainline.org>
> 
> The upstream API for some reason uses logbase2 instead of
> just passing the argument as-is, whereas downstream CAF
> kernel does the latter.
> 
> Hence, a mistake has been made when porting:
> 4 is the value that's supposed to be passed, but
> log2(4) = 2. Changing the value to 16 (= 2^4) fixes
> the issue.

I like keeping it in human readable values because its easier to visually
identify how many registers are saved without doing math.

Reviewed-by: Jordan Crouse <jcrouse@codeaurora.org>

> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> ---
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> index 66980f4cd93e..24ab51bb5a01 100644
> --- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> @@ -821,7 +821,7 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
>  
>  	/* VPC */
>  	gpu_write(gpu, REG_A5XX_CP_PROTECT(14), ADRENO_PROTECT_RW(0xE68, 8));
> -	gpu_write(gpu, REG_A5XX_CP_PROTECT(15), ADRENO_PROTECT_RW(0xE70, 4));
> +	gpu_write(gpu, REG_A5XX_CP_PROTECT(15), ADRENO_PROTECT_RW(0xE70, 16));
>  
>  	/* UCHE */
>  	gpu_write(gpu, REG_A5XX_CP_PROTECT(16), ADRENO_PROTECT_RW(0xE80, 16));
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
