Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3BA04B7B2F
	for <lists+dri-devel@lfdr.de>; Wed, 16 Feb 2022 00:27:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7CC810E573;
	Tue, 15 Feb 2022 23:27:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0004A10E2D9;
 Tue, 15 Feb 2022 23:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1644967641; x=1676503641;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=/DbwMD1GlQmklMwdkj6uakJWR/imPHhcyGhcMbTG7Cg=;
 b=SegSS5ePZSYv4XN8upltS2Wm2aucJ6AY/3Z/KQDSMnHCqF1h4JNygWHP
 Jr26SkKYlVF8jPtCy+dhcQoXxyq/HdtlmrlKKsBhlkNJfaMFGiFlBgoy9
 B+I/+Bo1uqqOM2tBBfGwtSsuRUrN1YZk/qi5EFpM7ZaC8w/2rFqb3t56g Q=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 15 Feb 2022 15:27:19 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2022 15:27:18 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Tue, 15 Feb 2022 15:27:18 -0800
Received: from [10.111.168.21] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.19; Tue, 15 Feb
 2022 15:27:16 -0800
Message-ID: <8f7ff3b9-c426-8228-8c8d-42eefba95b56@quicinc.com>
Date: Tue, 15 Feb 2022 15:27:14 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH 2/6] drm/msm/dpu: remove always-true argument of
 dpu_core_irq_read()
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Rob Clark <robdclark@gmail.com>, Sean Paul
 <sean@poorly.run>
References: <20220201151056.2480055-1-dmitry.baryshkov@linaro.org>
 <20220201151056.2480055-3-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20220201151056.2480055-3-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2/1/2022 7:10 AM, Dmitry Baryshkov wrote:
> The argument clear of the function dpu_core_irq_read() is always true.
> Remove it.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h      | 4 +---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c       | 3 +--
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 4 ++--
>   3 files changed, 4 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h
> index 7023ccb79814..6dce5d89f817 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h
> @@ -33,13 +33,11 @@ irqreturn_t dpu_core_irq(struct msm_kms *kms);
>    * dpu_core_irq_read - IRQ helper function for reading IRQ status
>    * @dpu_kms:		DPU handle
>    * @irq_idx:		irq index
> - * @clear:		True to clear the irq after read
>    * @return:		non-zero if irq detected; otherwise no irq detected
>    */
>   u32 dpu_core_irq_read(
>   		struct dpu_kms *dpu_kms,
> -		int irq_idx,
> -		bool clear);
> +		int irq_idx);
>   
>   /**
>    * dpu_core_irq_register_callback - For registering callback function on IRQ
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 1e648db439f9..5576b8a3e6ee 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -301,8 +301,7 @@ int dpu_encoder_helper_wait_for_irq(struct dpu_encoder_phys *phys_enc,
>   			wait_info);
>   
>   	if (ret <= 0) {
> -		irq_status = dpu_core_irq_read(phys_enc->dpu_kms,
> -				irq->irq_idx, true);
> +		irq_status = dpu_core_irq_read(phys_enc->dpu_kms, irq->irq_idx);
>   		if (irq_status) {
>   			unsigned long flags;
>   
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> index 71882d3fe705..85404c9ab4e1 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> @@ -357,7 +357,7 @@ static void dpu_disable_all_irqs(struct dpu_kms *dpu_kms)
>   	wmb();
>   }
>   
> -u32 dpu_core_irq_read(struct dpu_kms *dpu_kms, int irq_idx, bool clear)
> +u32 dpu_core_irq_read(struct dpu_kms *dpu_kms, int irq_idx)
>   {
>   	struct dpu_hw_intr *intr = dpu_kms->hw_intr;
>   	int reg_idx;
> @@ -384,7 +384,7 @@ u32 dpu_core_irq_read(struct dpu_kms *dpu_kms, int irq_idx, bool clear)
>   	intr_status = DPU_REG_READ(&intr->hw,
>   			dpu_intr_set[reg_idx].status_off) &
>   		DPU_IRQ_MASK(irq_idx);
> -	if (intr_status && clear)
> +	if (intr_status)
>   		DPU_REG_WRITE(&intr->hw, dpu_intr_set[reg_idx].clr_off,
>   				intr_status);
>   
