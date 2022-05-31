Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77E65538947
	for <lists+dri-devel@lfdr.de>; Tue, 31 May 2022 02:37:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DB9910F4EB;
	Tue, 31 May 2022 00:37:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2661F10F4E2;
 Tue, 31 May 2022 00:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1653957418; x=1685493418;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=6upXiLhngd2diRhq3wzsffUdKH9r4qgqjL/Ge5fuhHI=;
 b=hyQhii5o4HLBCIpviOOYu+iH0l55QuoTlPuhrbh16CCVzLUe08l6negw
 5WXXXdCklLQyTt31a6QjrKKhJqFNWVyPGkbsyQra1rbpRhKO8q07KGDkm
 6SUW0/BTSvgcHkX9RCsoyPJGzaqdSfQ0K+zgRaqU7KRYtE6GMtff22Ix1 4=;
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
 by alexa-out.qualcomm.com with ESMTP; 30 May 2022 17:36:57 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg08-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2022 17:36:57 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 30 May 2022 17:36:56 -0700
Received: from [10.38.244.253] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Mon, 30 May
 2022 17:36:54 -0700
Message-ID: <68443e94-32fc-a35e-3383-0dcd8ca967c0@quicinc.com>
Date: Mon, 30 May 2022 17:36:51 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH] drm/msm/dpu: Fix pointer dereferenced before checking
Content-Language: en-US
To: Haowen Bai <baihaowen@meizu.com>, Rob Clark <robdclark@gmail.com>, "Dmitry
 Baryshkov" <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 "David Airlie" <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
References: <1653896005-25168-1-git-send-email-baihaowen@meizu.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <1653896005-25168-1-git-send-email-baihaowen@meizu.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 5/30/2022 12:33 AM, Haowen Bai wrote:
> The ctx->hw is dereferencing before null checking, so move
> it after checking.
> 
> Signed-off-by: Haowen Bai <baihaowen@meizu.com>

Agree with Dmitry's comment. Adjust the patch subject to a different one 
otherwise PW thinks they are same patches.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
> index bcccce292937..e59680cdd0ce 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
> @@ -155,11 +155,13 @@ static void dpu_hw_wb_roi(struct dpu_hw_wb *ctx, struct dpu_hw_wb_cfg *wb)
>   static void dpu_hw_wb_setup_qos_lut(struct dpu_hw_wb *ctx,
>   		struct dpu_hw_wb_qos_cfg *cfg)
>   {
> -	struct dpu_hw_blk_reg_map *c = &ctx->hw;
> +	struct dpu_hw_blk_reg_map *c;
>   	u32 qos_ctrl = 0;
>   
>   	if (!ctx || !cfg)
>   		return;
> +	
> +	c = &ctx->hw;
>   
>   	DPU_REG_WRITE(c, WB_DANGER_LUT, cfg->danger_lut);
>   	DPU_REG_WRITE(c, WB_SAFE_LUT, cfg->safe_lut);
