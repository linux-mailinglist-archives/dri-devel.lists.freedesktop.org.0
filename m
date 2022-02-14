Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C6244B5A6C
	for <lists+dri-devel@lfdr.de>; Mon, 14 Feb 2022 20:08:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34D2B10E2A5;
	Mon, 14 Feb 2022 19:08:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BEC110E2A5;
 Mon, 14 Feb 2022 19:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1644865703; x=1676401703;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=o399d9ecTHK4e95M+tUkgumsvYPEBP7LORzPvfD9GG0=;
 b=GVxMqNAtjDwc2eLJ7QAn9iWGZT5IV3IHG7JYK12269gg5979zzgQrDR6
 8uJLdU0QhUR8lTEEv0Mq2FJFkeNwDslJeOck4wLMcZYmLqeK5wZzQRfPD
 mBWaWvYEfDRGXOn4MZqrN8JCEQhp1Rw6thq8BSegk/VrSvBw/ARUwcDRE U=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
 by alexa-out.qualcomm.com with ESMTP; 14 Feb 2022 11:08:23 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2022 11:08:22 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Mon, 14 Feb 2022 11:08:21 -0800
Received: from [10.111.168.21] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.19; Mon, 14 Feb
 2022 11:08:19 -0800
Message-ID: <fe8841b6-1dc5-3126-3bf8-258b61d5ee7e@quicinc.com>
Date: Mon, 14 Feb 2022 11:08:17 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v5 4/6] drm/msm/dpu: stop embedding dpu_hw_blk into
 dpu_hw_intf
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Rob Clark <robdclark@gmail.com>, Sean Paul
 <sean@poorly.run>
References: <20220121210618.3482550-1-dmitry.baryshkov@linaro.org>
 <20220121210618.3482550-5-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20220121210618.3482550-5-dmitry.baryshkov@linaro.org>
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
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 1/21/2022 1:06 PM, Dmitry Baryshkov wrote:
> Now as dpu_hw_intf is not hanled by dpu_rm_get_assigned_resources, there
> is no point in embedding the (empty) struct dpu_hw_blk into dpu_hw_intf
> (and using typecasts between dpu_hw_blk and dpu_hw_intf). Drop it and
> use dpu_hw_intf directly.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h | 11 -----------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c      | 17 +++--------------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h      |  9 ++++++---
>   3 files changed, 9 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
> index 3568be80dab5..230d122fa43b 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
> @@ -78,7 +78,6 @@ struct dpu_hw_intf_ops {
>   };
>   
>   struct dpu_hw_intf {
> -	struct dpu_hw_blk base;
>   	struct dpu_hw_blk_reg_map hw;
>   
>   	/* intf */
> @@ -90,16 +89,6 @@ struct dpu_hw_intf {
>   	struct dpu_hw_intf_ops ops;
>   };
>   
> -/**
> - * to_dpu_hw_intf - convert base object dpu_hw_base to container
> - * @hw: Pointer to base hardware block
> - * return: Pointer to hardware block container
> - */
> -static inline struct dpu_hw_intf *to_dpu_hw_intf(struct dpu_hw_blk *hw)
> -{
> -	return container_of(hw, struct dpu_hw_intf, base);
> -}
> -
>   /**
>    * dpu_hw_intf_init(): Initializes the intf driver for the passed
>    * interface idx.
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> index 8df21a46308e..96554e962e38 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> @@ -74,14 +74,8 @@ int dpu_rm_destroy(struct dpu_rm *rm)
>   			dpu_hw_ctl_destroy(hw);
>   		}
>   	}
> -	for (i = 0; i < ARRAY_SIZE(rm->intf_blks); i++) {
> -		struct dpu_hw_intf *hw;
> -
> -		if (rm->intf_blks[i]) {
> -			hw = to_dpu_hw_intf(rm->intf_blks[i]);
> -			dpu_hw_intf_destroy(hw);
> -		}
> -	}
> +	for (i = 0; i < ARRAY_SIZE(rm->hw_intf); i++)
> +		dpu_hw_intf_destroy(rm->hw_intf[i]);
>   
>   	return 0;
>   }
> @@ -179,7 +173,7 @@ int dpu_rm_init(struct dpu_rm *rm,
>   			DPU_ERROR("failed intf object creation: err %d\n", rc);
>   			goto fail;
>   		}
> -		rm->intf_blks[intf->id - INTF_0] = &hw->base;
> +		rm->hw_intf[intf->id - INTF_0] = hw;
>   	}
>   
>   	for (i = 0; i < cat->ctl_count; i++) {
> @@ -593,8 +587,3 @@ int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
>   
>   	return num_blks;
>   }
> -
> -struct dpu_hw_intf *dpu_rm_get_intf(struct dpu_rm *rm, enum dpu_intf intf_idx)
> -{
> -	return to_dpu_hw_intf(rm->intf_blks[intf_idx - INTF_0]);
> -}
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> index ee50f6651b6e..9b13200a050a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> @@ -18,14 +18,14 @@ struct dpu_global_state;
>    * @pingpong_blks: array of pingpong hardware resources
>    * @mixer_blks: array of layer mixer hardware resources
>    * @ctl_blks: array of ctl hardware resources
> - * @intf_blks: array of intf hardware resources
> + * @hw_intf: array of intf hardware resources
>    * @dspp_blks: array of dspp hardware resources
>    */
>   struct dpu_rm {
>   	struct dpu_hw_blk *pingpong_blks[PINGPONG_MAX - PINGPONG_0];
>   	struct dpu_hw_blk *mixer_blks[LM_MAX - LM_0];
>   	struct dpu_hw_blk *ctl_blks[CTL_MAX - CTL_0];
> -	struct dpu_hw_blk *intf_blks[INTF_MAX - INTF_0];
> +	struct dpu_hw_intf *hw_intf[INTF_MAX - INTF_0];
>   	struct dpu_hw_blk *dspp_blks[DSPP_MAX - DSPP_0];
>   	struct dpu_hw_blk *merge_3d_blks[MERGE_3D_MAX - MERGE_3D_0];
>   };
> @@ -90,7 +90,10 @@ int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
>    * @rm: DPU Resource Manager handle
>    * @intf_idx: INTF's index
>    */
> -struct dpu_hw_intf *dpu_rm_get_intf(struct dpu_rm *rm, enum dpu_intf intf_idx);
> +static inline struct dpu_hw_intf *dpu_rm_get_intf(struct dpu_rm *rm, enum dpu_intf intf_idx)
> +{
> +	return rm->hw_intf[intf_idx - INTF_0];
> +}
>   
>   #endif /* __DPU_RM_H__ */
>   
