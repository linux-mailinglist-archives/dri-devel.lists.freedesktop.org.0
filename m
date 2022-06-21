Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1218C55287A
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jun 2022 02:02:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C25DD10FF09;
	Tue, 21 Jun 2022 00:01:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0CA010FF09;
 Tue, 21 Jun 2022 00:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1655769718; x=1687305718;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=nzcniydRmy8oyrL5+vfpqMg/xcCHuRyNLYrXjczI04Q=;
 b=jZ0tijDxF8adfIULLv0s/9JbqRnAVuiCsIUDI6VQoYmyBptt6fShW6+N
 pLnitW2jkahj8cDZDZedLSGDoiTG+wG5PykdJtc9Foy+8WCsgFalAxb1U
 L53c7Sfh9izwj3TK+atRJ+vXwVZA1Gq2kggkZP8BThFtjBDyi96VMv0u1 I=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 20 Jun 2022 17:01:58 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2022 17:01:58 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 20 Jun 2022 17:01:57 -0700
Received: from [10.111.166.89] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Mon, 20 Jun
 2022 17:01:55 -0700
Message-ID: <4de7c6fb-9866-111c-9c62-fa7915935d4e@quicinc.com>
Date: Mon, 20 Jun 2022 17:01:53 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v1 2/4] drm/msm/dpu: drop length from struct
 dpu_hw_blk_reg_map
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20220601161349.1517667-1-dmitry.baryshkov@linaro.org>
 <20220601161349.1517667-3-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20220601161349.1517667-3-dmitry.baryshkov@linaro.org>
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
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 6/1/2022 9:13 AM, Dmitry Baryshkov wrote:
> We (nearly) do not use the length field from struct dpu_hw_blk_reg_map,
> so we can drop it safely.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c      | 1 -
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c      | 1 -
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c     | 1 -
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c     | 1 -
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c       | 1 -
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c  | 1 -
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c | 1 -
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c     | 1 -
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c      | 1 -
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h     | 2 --
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c     | 1 -
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c       | 1 -
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c         | 2 +-
>   13 files changed, 1 insertion(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> index 7d416bf4ae91..1120ff408dae 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> @@ -60,7 +60,6 @@ static const struct dpu_ctl_cfg *_ctl_offset(enum dpu_ctl ctl,
>   		if (ctl == m->ctl[i].id) {
>   			b->base_off = addr;
>   			b->blk_off = m->ctl[i].base;
> -			b->length = m->ctl[i].len;
>   			b->log_mask = DPU_DBG_MASK_CTL;
>   			return &m->ctl[i];
>   		}
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
> index 184a1b27b13d..dfe6e4c11917 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
> @@ -168,7 +168,6 @@ static struct dpu_dsc_cfg *_dsc_offset(enum dpu_dsc dsc,
>   		if (dsc == m->dsc[i].id) {
>   			b->base_off = addr;
>   			b->blk_off = m->dsc[i].base;
> -			b->length = m->dsc[i].len;
>   			b->log_mask = DPU_DBG_MASK_DSC;
>   			return &m->dsc[i];
>   		}
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
> index 3e63bf4fa64e..8196ae47dea8 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
> @@ -82,7 +82,6 @@ static const struct dpu_dspp_cfg *_dspp_offset(enum dpu_dspp dspp,
>   		if (dspp == m->dspp[i].id) {
>   			b->base_off = addr;
>   			b->blk_off = m->dspp[i].base;
> -			b->length = m->dspp[i].len;
>   			b->log_mask = DPU_DBG_MASK_DSPP;
>   			return &m->dspp[i];
>   		}
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> index b2ca8d19fdd7..c7eb314f1d7a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> @@ -79,7 +79,6 @@ static const struct dpu_intf_cfg *_intf_offset(enum dpu_intf intf,
>   		(m->intf[i].type != INTF_NONE)) {
>   			b->base_off = addr;
>   			b->blk_off = m->intf[i].base;
> -			b->length = m->intf[i].len;
>   			b->log_mask = DPU_DBG_MASK_INTF;
>   			return &m->intf[i];
>   		}
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
> index b41993269d09..87a4a5869b9b 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
> @@ -45,7 +45,6 @@ static const struct dpu_lm_cfg *_lm_offset(enum dpu_lm mixer,
>   		if (mixer == m->mixer[i].id) {
>   			b->base_off = addr;
>   			b->blk_off = m->mixer[i].base;
> -			b->length = m->mixer[i].len;
>   			b->log_mask = DPU_DBG_MASK_LM;
>   			return &m->mixer[i];
>   		}
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c
> index b053d68d38da..538691f7bf66 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c
> @@ -25,7 +25,6 @@ static const struct dpu_merge_3d_cfg *_merge_3d_offset(enum dpu_merge_3d idx,
>   		if (idx == m->merge_3d[i].id) {
>   			b->base_off = addr;
>   			b->blk_off = m->merge_3d[i].base;
> -			b->length = m->merge_3d[i].len;
>   			b->log_mask = DPU_DBG_MASK_PINGPONG;
>   			return &m->merge_3d[i];
>   		}
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
> index 6538e195cfe9..0aa63636bc9a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
> @@ -53,7 +53,6 @@ static const struct dpu_pingpong_cfg *_pingpong_offset(enum dpu_pingpong pp,
>   		if (pp == m->pingpong[i].id) {
>   			b->base_off = addr;
>   			b->blk_off = m->pingpong[i].base;
> -			b->length = m->pingpong[i].len;
>   			b->log_mask = DPU_DBG_MASK_PINGPONG;
>   			return &m->pingpong[i];
>   		}
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> index da4c7e4f304b..876ae8faa8e5 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> @@ -771,7 +771,6 @@ static const struct dpu_sspp_cfg *_sspp_offset(enum dpu_sspp sspp,
>   			if (sspp == catalog->sspp[i].id) {
>   				b->base_off = addr;
>   				b->blk_off = catalog->sspp[i].base;
> -				b->length = catalog->sspp[i].len;
>   				b->log_mask = DPU_DBG_MASK_SSPP;
>   				return &catalog->sspp[i];
>   			}
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
> index 12d3b0067275..843cb607d411 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
> @@ -287,7 +287,6 @@ static const struct dpu_mdp_cfg *_top_offset(enum dpu_mdp mdp,
>   		if (mdp == m->mdp[i].id) {
>   			b->base_off = addr;
>   			b->blk_off = m->mdp[i].base;
> -			b->length = m->mdp[i].len;
>   			b->log_mask = DPU_DBG_MASK_TOP;
>   			return &m->mdp[i];
>   		}
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
> index e8adb118fa85..b745ef4ac16f 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
> @@ -19,12 +19,10 @@
>    * absoulute IO address
>    * @base_off:     mdp register mapped offset
>    * @blk_off:      pipe offset relative to mdss offset
> - * @length        length of register block offset
>    */
>   struct dpu_hw_blk_reg_map {
>   	void __iomem *base_off;
>   	u32 blk_off;
> -	u32 length;
>   	u32 log_mask;
>   };
>   
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c
> index 789ecc531b43..41ca4b179f1a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c
> @@ -222,7 +222,6 @@ static const struct dpu_vbif_cfg *_top_offset(enum dpu_vbif vbif,
>   		if (vbif == m->vbif[i].id) {
>   			b->base_off = addr;
>   			b->blk_off = m->vbif[i].base;
> -			b->length = m->vbif[i].len;
>   			b->log_mask = DPU_DBG_MASK_VBIF;
>   			return &m->vbif[i];
>   		}
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
> index 084439fdd3a0..12f32cd3075e 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
> @@ -62,7 +62,6 @@ static const struct dpu_wb_cfg *_wb_offset(enum dpu_wb wb,
>   		if (wb == m->wb[i].id) {
>   			b->base_off = addr;
>   			b->blk_off = m->wb[i].base;
> -			b->length = m->wb[i].len;
>   			return &m->wb[i];
>   		}
>   	}
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index 688dc4409af6..a3bfc0fe72a8 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -950,7 +950,7 @@ static void dpu_kms_mdp_snapshot(struct msm_disp_state *disp_state, struct msm_k
>   		msm_disp_snapshot_add_block(disp_state, cat->wb[i].len,
>   				dpu_kms->mmio + cat->wb[i].base, "wb_%d", i);
>   
> -	msm_disp_snapshot_add_block(disp_state, top->hw.length,
> +	msm_disp_snapshot_add_block(disp_state, cat->mdp[0].len,
>   			dpu_kms->mmio + top->hw.blk_off, "top");
>   
>   	pm_runtime_put_sync(&dpu_kms->pdev->dev);
