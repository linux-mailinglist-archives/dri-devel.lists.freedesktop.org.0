Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AF114B0177
	for <lists+dri-devel@lfdr.de>; Thu, 10 Feb 2022 01:08:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E14310E687;
	Thu, 10 Feb 2022 00:08:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B5CD10E397;
 Thu, 10 Feb 2022 00:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1644451703; x=1675987703;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Yicd7RRwODN6w/+A1+AuGrBmdvedplETzWs7cnxWy+w=;
 b=Lgv4iey+uFKt+Ll+s6pHq2Bf+jRh3kc5dmjXVqkl1MMNXZS52xgWD0cI
 IES3v6IF9VD/eBW/eOh7yiU14+OuBv3NaCMWWXEpDGIePbX8EyrUzTOHl
 V6B/acK/WESgx2SiX7aO4Pp7FlqfVkyN0g73m886UEhfUS32RyuFqHENY Q=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 09 Feb 2022 16:08:22 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg01-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2022 16:08:22 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Wed, 9 Feb 2022 16:08:21 -0800
Received: from [10.111.162.111] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.19; Wed, 9 Feb 2022
 16:08:19 -0800
Message-ID: <d7a32361-6845-c1a0-15c4-16c4fecf00ed@quicinc.com>
Date: Wed, 9 Feb 2022 16:08:17 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [Freedreno] [PATCH v5 1/6] drm/msm/dpu: drop unused lm_max_width
 from RM
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Rob Clark <robdclark@gmail.com>, Sean Paul
 <sean@poorly.run>
References: <20220121210618.3482550-1-dmitry.baryshkov@linaro.org>
 <20220121210618.3482550-2-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20220121210618.3482550-2-dmitry.baryshkov@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 1/21/2022 1:06 PM, Dmitry Baryshkov wrote:
> No code uses lm_max_width from resource manager, so drop it. Instead of
> calculating the lm_max_width, code can use max_mixer_width field from
> the hw catalog.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 12 ------------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h |  4 ----
>   2 files changed, 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> index f9c83d6e427a..b5b1ea1e4de6 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> @@ -114,18 +114,6 @@ int dpu_rm_init(struct dpu_rm *rm,
>   			goto fail;
>   		}
>   		rm->mixer_blks[lm->id - LM_0] = &hw->base;
> -
> -		if (!rm->lm_max_width) {
> -			rm->lm_max_width = lm->sblk->maxwidth;
> -		} else if (rm->lm_max_width != lm->sblk->maxwidth) {
> -			/*
> -			 * Don't expect to have hw where lm max widths differ.
> -			 * If found, take the min.
> -			 */
> -			DPU_ERROR("unsupported: lm maxwidth differs\n");
> -			if (rm->lm_max_width > lm->sblk->maxwidth)
> -				rm->lm_max_width = lm->sblk->maxwidth;
> -		}
>   	}
>   
>   	for (i = 0; i < cat->merge_3d_count; i++) {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> index 1f12c8d5b8aa..0f27759211b5 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> @@ -20,8 +20,6 @@ struct dpu_global_state;
>    * @ctl_blks: array of ctl hardware resources
>    * @intf_blks: array of intf hardware resources
>    * @dspp_blks: array of dspp hardware resources
> - * @lm_max_width: cached layer mixer maximum width
> - * @rm_lock: resource manager mutex
>    */
>   struct dpu_rm {
>   	struct dpu_hw_blk *pingpong_blks[PINGPONG_MAX - PINGPONG_0];
> @@ -30,8 +28,6 @@ struct dpu_rm {
>   	struct dpu_hw_blk *intf_blks[INTF_MAX - INTF_0];
>   	struct dpu_hw_blk *dspp_blks[DSPP_MAX - DSPP_0];
>   	struct dpu_hw_blk *merge_3d_blks[MERGE_3D_MAX - MERGE_3D_0];
> -
> -	uint32_t lm_max_width;
>   };
>   
>   /**
