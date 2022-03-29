Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E6EA4EB577
	for <lists+dri-devel@lfdr.de>; Tue, 29 Mar 2022 23:52:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0552E10EF26;
	Tue, 29 Mar 2022 21:52:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F20310EF26;
 Tue, 29 Mar 2022 21:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1648590739; x=1680126739;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=El0MMeQTJ3DJE1s43/QriaOmcFIxh1mXiWAdapyszPg=;
 b=eOeS6UALISAyd7KlPdCFBvANcDp913614r8Pn+pOPOY45vT5bOvFq0nC
 6zcLO4Kvb3mH7CEk1JnhDY8BbzGlX4ARijGeeGIFLzf1iO00MJOjJDXng
 lofdRJjDDWDHVFwxkKdjbYHoA5wyv/QSXRS2SmoIF8C7Z0uZ4TBEHLQju A=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 29 Mar 2022 14:52:19 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg01-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2022 14:52:17 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 29 Mar 2022 14:52:17 -0700
Received: from [10.110.122.15] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Tue, 29 Mar
 2022 14:52:16 -0700
Message-ID: <4d39e113-37ec-3889-1726-25e9d26bdbd7@quicinc.com>
Date: Tue, 29 Mar 2022 14:52:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH 3/3] drm/msm/dpu: drop VBIF indices
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Rob Clark <robdclark@gmail.com>, Sean Paul
 <sean@poorly.run>
References: <20220217034502.464312-1-dmitry.baryshkov@linaro.org>
 <20220217034502.464312-3-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20220217034502.464312-3-dmitry.baryshkov@linaro.org>
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



On 2/16/2022 7:45 PM, Dmitry Baryshkov wrote:
> We do not expect to have other VBIFs. Drop VBIF_n indices and always use
> VBIF_RT and VBIF_NRT.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |  4 +--
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h   |  6 ++--
>   drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c      | 36 ++++++++++++-------
>   3 files changed, 28 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index aa4d20762ccb..dbb853042aa0 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -1115,7 +1115,7 @@ static const struct dpu_vbif_dynamic_ot_cfg msm8998_ot_rdwr_cfg[] = {
>   
>   static const struct dpu_vbif_cfg msm8998_vbif[] = {
>   	{
> -	.name = "vbif_0", .id = VBIF_0,
> +	.name = "vbif_rt", .id = VBIF_RT,
>   	.base = 0, .len = 0x1040,
>   	.default_ot_rd_limit = 32,
>   	.default_ot_wr_limit = 32,
> @@ -1144,7 +1144,7 @@ static const struct dpu_vbif_cfg msm8998_vbif[] = {
>   
>   static const struct dpu_vbif_cfg sdm845_vbif[] = {
>   	{
> -	.name = "vbif_0", .id = VBIF_0,
> +	.name = "vbif_rt", .id = VBIF_RT,
>   	.base = 0, .len = 0x1040,
>   	.features = BIT(DPU_VBIF_QOS_REMAP),
>   	.xin_halt_timeout = 0x4000,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> index bb9ceadeb0bb..598c201ae50d 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> @@ -254,11 +254,9 @@ enum dpu_wd_timer {
>   };
>   
>   enum dpu_vbif {
> -	VBIF_0,
> -	VBIF_1,
> +	VBIF_RT,
> +	VBIF_NRT,
>   	VBIF_MAX,
> -	VBIF_RT = VBIF_0,
> -	VBIF_NRT = VBIF_1
>   };
>   
>   /**
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
> index cbbf77b17fc3..c011d4ab6acc 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
> @@ -19,6 +19,18 @@ static struct dpu_hw_vbif *dpu_get_vbif(struct dpu_kms *dpu_kms, enum dpu_vbif v
>   	return NULL;
>   }
>   
> +static const char *dpu_vbif_name(enum dpu_vbif idx)
> +{
> +	switch (idx) {
> +	case VBIF_RT:
> +		return "VBIF_RT";
> +	case VBIF_NRT:
> +		return "VBIF_NRT";
> +	default:
> +		return "??";
> +	}
> +}
> +
>   /**
>    * _dpu_vbif_wait_for_xin_halt - wait for the xin to halt
>    * @vbif:	Pointer to hardware vbif driver
> @@ -50,12 +62,12 @@ static int _dpu_vbif_wait_for_xin_halt(struct dpu_hw_vbif *vbif, u32 xin_id)
>   
>   	if (!status) {
>   		rc = -ETIMEDOUT;
> -		DPU_ERROR("VBIF %d client %d not halting. TIMEDOUT.\n",
> -				vbif->idx - VBIF_0, xin_id);
> +		DPU_ERROR("%s client %d not halting. TIMEDOUT.\n",
> +				dpu_vbif_name(vbif->idx), xin_id);
>   	} else {
>   		rc = 0;
> -		DRM_DEBUG_ATOMIC("VBIF %d client %d is halted\n",
> -				vbif->idx - VBIF_0, xin_id);
> +		DRM_DEBUG_ATOMIC("%s client %d is halted\n",
> +				dpu_vbif_name(vbif->idx), xin_id);
>   	}
>   
>   	return rc;
> @@ -95,8 +107,8 @@ static void _dpu_vbif_apply_dynamic_ot_limit(struct dpu_hw_vbif *vbif,
>   		}
>   	}
>   
> -	DRM_DEBUG_ATOMIC("vbif:%d xin:%d w:%d h:%d fps:%d pps:%llu ot:%u\n",
> -			vbif->idx - VBIF_0, params->xin_id,
> +	DRM_DEBUG_ATOMIC("%s xin:%d w:%d h:%d fps:%d pps:%llu ot:%u\n",
> +			dpu_vbif_name(vbif->idx), params->xin_id,
>   			params->width, params->height, params->frame_rate,
>   			pps, *ot_lim);
>   }
> @@ -141,8 +153,8 @@ static u32 _dpu_vbif_get_ot_limit(struct dpu_hw_vbif *vbif,
>   	}
>   
>   exit:
> -	DRM_DEBUG_ATOMIC("vbif:%d xin:%d ot_lim:%d\n",
> -			vbif->idx - VBIF_0, params->xin_id, ot_lim);
> +	DRM_DEBUG_ATOMIC("%s xin:%d ot_lim:%d\n",
> +			dpu_vbif_name(vbif->idx), params->xin_id, ot_lim);
>   	return ot_lim;
>   }
>   
> @@ -242,8 +254,8 @@ void dpu_vbif_set_qos_remap(struct dpu_kms *dpu_kms,
>   	forced_on = mdp->ops.setup_clk_force_ctrl(mdp, params->clk_ctrl, true);
>   
>   	for (i = 0; i < qos_tbl->npriority_lvl; i++) {
> -		DRM_DEBUG_ATOMIC("vbif:%d xin:%d lvl:%d/%d\n",
> -				params->vbif_idx, params->xin_id, i,
> +		DRM_DEBUG_ATOMIC("%s xin:%d lvl:%d/%d\n",
> +				dpu_vbif_name(params->vbif_idx), params->xin_id, i,
>   				qos_tbl->priority_lvl[i]);
>   		vbif->ops.set_qos_remap(vbif, params->xin_id, i,
>   				qos_tbl->priority_lvl[i]);
> @@ -263,8 +275,8 @@ void dpu_vbif_clear_errors(struct dpu_kms *dpu_kms)
>   		if (vbif && vbif->ops.clear_errors) {
>   			vbif->ops.clear_errors(vbif, &pnd, &src);
>   			if (pnd || src) {
> -				DRM_DEBUG_KMS("VBIF %d: pnd 0x%X, src 0x%X\n",
> -					      vbif->idx - VBIF_0, pnd, src);
> +				DRM_DEBUG_KMS("%s: pnd 0x%X, src 0x%X\n",
> +					      dpu_vbif_name(vbif->idx), pnd, src);
>   			}
>   		}
>   	}
