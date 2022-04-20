Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC567508163
	for <lists+dri-devel@lfdr.de>; Wed, 20 Apr 2022 08:47:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F4EE10E6C0;
	Wed, 20 Apr 2022 06:47:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55EC410F1B6
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Apr 2022 06:47:09 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id o16so785556ljp.3
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 23:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=zTHkp+X7+G7qIU9mLuKosIo8uEHBZlw7egH8WL0Wg2w=;
 b=GqtbgeAAOu7l7E+G87eU5BB3eF4WOjX8aN2ecPW4CNsf4naAq+97ahp3UD/GqmkOFY
 sNkfE1qudzuqJGzEBZhVufjX+EW8rJ2a6MTcVH4CP5/KiyB6+QzTgk9m4S7dfZqjLnLu
 A/ebOCtuGOV5x48Zwht9FitZdNLzTHqTA6SHj66KtKCigVlvd7b+KbjFWnEkRGzpKkg4
 PKYJ67LJ93SyFyDR8N7xmQEduonszuYFhbku+W2obwkkhzkrj8rvurcFNGRD770pnx4L
 YytfeB064Ev/3sI0jrqr970+VGg1WQ/jgov9UhZTnRtCyXRakKrlsDdEzQE90NeC9Xan
 xzGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=zTHkp+X7+G7qIU9mLuKosIo8uEHBZlw7egH8WL0Wg2w=;
 b=pgFaMWIciWmW8Cl0U3ZWVNgULpwZIZ7Z9nIr17Ql+IWEhsUtP+QZYqrryiR8wYEVMr
 /A3DOywoFBY4+6UGb63hL4XQ1il1b6cDb/Ng2MgOEYXpXg4RGxzhsucnoduVElCuTfas
 HOWrMHUum3gDFEc8GLh8vkHFbp8O87aVKF/G8VIGqEnDQb3ybhXezUedL5dJDRDm0dq4
 1ZO0tLavT8HSVX831zdflxKEsX3fG0Vh0X2z6wUBvFzLBbKHgtd8GJnDOIiIDRXwp8gP
 t0Fz5BbVDpTgW1sLw91Xt79041YxXR4o4Eb2qL+FtkMYQwP6yx5/lEJdzWn2M4DAgM3K
 /swg==
X-Gm-Message-State: AOAM531OyoTaJQ2ZqL1T7x8gwf45cQ/qyyK4YdFyIHdSX23jGk9E4oJ1
 yC83rlmWrWvyaWGo0P42DCZjJQ==
X-Google-Smtp-Source: ABdhPJwG6/JxZRw8LOvAcZd4opXNhkR96uAPjXMZ3FL08EMWVLy3g9VShR8D7zQ9BTwJnlqPKBIRAQ==
X-Received: by 2002:a2e:a304:0:b0:24d:d685:4d80 with SMTP id
 l4-20020a2ea304000000b0024dd6854d80mr1571604lje.179.1650437227572; 
 Tue, 19 Apr 2022 23:47:07 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 u25-20020a199219000000b0047178ad732fsm1022779lfd.242.2022.04.19.23.47.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Apr 2022 23:47:07 -0700 (PDT)
Message-ID: <f232bbb9-f716-270b-c46f-177a2ea5324c@linaro.org>
Date: Wed, 20 Apr 2022 09:47:06 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 07/17] drm/msm/dpu: add writeback blocks to DPU RM
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, freedreno@lists.freedesktop.org
References: <1650419169-13760-1-git-send-email-quic_abhinavk@quicinc.com>
 <1650419169-13760-8-git-send-email-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1650419169-13760-8-git-send-email-quic_abhinavk@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: markyacoub@chromium.org, liviu.dudau@arm.com,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, seanpaul@chromium.org,
 laurent.pinchart@ideasonboard.com, quic_jesszhan@quicinc.com,
 quic_aravindh@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 20/04/2022 04:45, Abhinav Kumar wrote:
> Add writeback blocks to DPU resource manager so that
> the encoders can directly request them through RM.
> 
> changes in v2:
> 	- stop global tracking of WB blocks similar to INTF
> 	- align usage of hw_wb to be similar to that of hw_intf
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 22 ++++++++++++++++++++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h | 12 ++++++++++++
>   2 files changed, 34 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> index 0e6634b..bb01d31 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> @@ -9,6 +9,7 @@
>   #include "dpu_hw_ctl.h"
>   #include "dpu_hw_pingpong.h"
>   #include "dpu_hw_intf.h"
> +#include "dpu_hw_wb.h"
>   #include "dpu_hw_dspp.h"
>   #include "dpu_hw_merge3d.h"
>   #include "dpu_hw_dsc.h"
> @@ -87,6 +88,9 @@ int dpu_rm_destroy(struct dpu_rm *rm)
>   		}
>   	}
>   
> +	for (i = 0; i < ARRAY_SIZE(rm->hw_wb); i++)
> +		dpu_hw_wb_destroy(rm->hw_wb[i]);
> +
>   	return 0;
>   }
>   
> @@ -186,6 +190,24 @@ int dpu_rm_init(struct dpu_rm *rm,
>   		rm->hw_intf[intf->id - INTF_0] = hw;
>   	}
>   
> +	for (i = 0; i < cat->wb_count; i++) {
> +		struct dpu_hw_wb *hw;
> +		const struct dpu_wb_cfg *wb = &cat->wb[i];
> +
> +		if (wb->id < WB_0 || wb->id >= WB_MAX) {
> +			DPU_ERROR("skip intf %d with invalid id\n", wb->id);
> +			continue;
> +		}
> +
> +		hw = dpu_hw_wb_init(wb->id, mmio, cat);
> +		if (IS_ERR_OR_NULL(hw)) {

Just IS_ERR() please.

> +			rc = PTR_ERR(hw);
> +			DPU_ERROR("failed wb object creation: err %d\n", rc);
> +			goto fail;
> +		}
> +		rm->hw_wb[wb->id - WB_0] = hw;
> +	}
> +
>   	for (i = 0; i < cat->ctl_count; i++) {
>   		struct dpu_hw_ctl *hw;
>   		const struct dpu_ctl_cfg *ctl = &cat->ctl[i];
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> index 32e0d8a..ba82e54 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> @@ -19,6 +19,7 @@ struct dpu_global_state;
>    * @mixer_blks: array of layer mixer hardware resources
>    * @ctl_blks: array of ctl hardware resources
>    * @hw_intf: array of intf hardware resources
> + * @hw_wb: array of wb hardware resources
>    * @dspp_blks: array of dspp hardware resources
>    */
>   struct dpu_rm {
> @@ -26,6 +27,7 @@ struct dpu_rm {
>   	struct dpu_hw_blk *mixer_blks[LM_MAX - LM_0];
>   	struct dpu_hw_blk *ctl_blks[CTL_MAX - CTL_0];
>   	struct dpu_hw_intf *hw_intf[INTF_MAX - INTF_0];
> +	struct dpu_hw_wb *hw_wb[WB_MAX - WB_0];
>   	struct dpu_hw_blk *dspp_blks[DSPP_MAX - DSPP_0];
>   	struct dpu_hw_blk *merge_3d_blks[MERGE_3D_MAX - MERGE_3D_0];
>   	struct dpu_hw_blk *dsc_blks[DSC_MAX - DSC_0];
> @@ -96,5 +98,15 @@ static inline struct dpu_hw_intf *dpu_rm_get_intf(struct dpu_rm *rm, enum dpu_in
>   	return rm->hw_intf[intf_idx - INTF_0];
>   }
>   
> +/**
> + * dpu_rm_get_wb - Return a struct dpu_hw_wb instance given it's index.
> + * @rm: DPU Resource Manager handle
> + * @wb_idx: WB index
> + */
> +static inline struct dpu_hw_wb *dpu_rm_get_wb(struct dpu_rm *rm, enum dpu_intf wb_idx)
> +{
> +	return rm->hw_wb[wb_idx - WB_0];
> +}
> +
>   #endif /* __DPU_RM_H__ */
>   


-- 
With best wishes
Dmitry
