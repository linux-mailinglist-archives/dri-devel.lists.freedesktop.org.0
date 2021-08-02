Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8E8E3DE303
	for <lists+dri-devel@lfdr.de>; Tue,  3 Aug 2021 01:24:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29B5E6E160;
	Mon,  2 Aug 2021 23:24:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FBB76E17E
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Aug 2021 23:24:37 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1627946680; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=hFy9UGV4bwGkQ7pQHCAXe5mbwQW2kPvxAkdDKqiLWdc=;
 b=mdGNdqZfQKWmo6YFG3eddShpf09oYU7TdFIEVxWI8ocXqI14d08PLQvoSYBsdo62jEADQoQj
 TAqbnhPJx3Yy3mZ8F49ZMdaHRlHNYaZiTuMrmOhRtMjXW/RAPZlwKVPyfux7qPe0+crCBpAc
 5/gqHKIaFooMnhi1WMNbzmAbNTw=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 61087eaa96a66e66b2432dd5 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 02 Aug 2021 23:24:26
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 7D1AEC433D3; Mon,  2 Aug 2021 23:24:26 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 6DB70C433F1;
 Mon,  2 Aug 2021 23:24:25 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Mon, 02 Aug 2021 16:24:25 -0700
From: abhinavk@codeaurora.org
To: Vinod Koul <vkoul@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>, Jonathan Marek <jonathan@marek.ca>,
 Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Bjorn Andersson
 <bjorn.andersson@linaro.org>, dri-devel@lists.freedesktop.org, Daniel Vetter
 <daniel@ffwll.ch>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>
Subject: Re: [Freedreno] [PATCH 04/11] drm/msm/disp/dpu1: Add DSC support in RM
In-Reply-To: <20210715065203.709914-5-vkoul@kernel.org>
References: <20210715065203.709914-1-vkoul@kernel.org>
 <20210715065203.709914-5-vkoul@kernel.org>
Message-ID: <7d656b2265ade461cae993c691d31ab8@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-07-14 23:51, Vinod Koul wrote:
> This add the bits in RM to enable the DSC blocks
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h |  1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c  | 32 +++++++++++++++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h  |  1 +
>  3 files changed, 34 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> index d6717d6672f7..d56c05146dfe 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> @@ -165,6 +165,7 @@ struct dpu_global_state {
>  	uint32_t ctl_to_enc_id[CTL_MAX - CTL_0];
>  	uint32_t intf_to_enc_id[INTF_MAX - INTF_0];
>  	uint32_t dspp_to_enc_id[DSPP_MAX - DSPP_0];
> +	uint32_t dsc_to_enc_id[DSC_MAX - DSC_0];
>  };
> 
>  struct dpu_global_state
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> index fd2d104f0a91..4da6d72b7996 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> @@ -11,6 +11,7 @@
>  #include "dpu_hw_intf.h"
>  #include "dpu_hw_dspp.h"
>  #include "dpu_hw_merge3d.h"
> +#include "dpu_hw_dsc.h"
>  #include "dpu_encoder.h"
>  #include "dpu_trace.h"
> 
> @@ -75,6 +76,14 @@ int dpu_rm_destroy(struct dpu_rm *rm)
>  			dpu_hw_intf_destroy(hw);
>  		}
>  	}
> +	for (i = 0; i < ARRAY_SIZE(rm->dsc_blks); i++) {
> +		struct dpu_hw_dsc *hw;
> +
> +		if (rm->intf_blks[i]) {
same comment as dmitry on this 
https://patchwork.freedesktop.org/patch/444070/?series=90413&rev=2
> +			hw = to_dpu_hw_dsc(rm->dsc_blks[i]);
> +			dpu_hw_dsc_destroy(hw);
> +		}
> +	}
> 
>  	return 0;
>  }
> @@ -221,6 +230,19 @@ int dpu_rm_init(struct dpu_rm *rm,
>  		rm->dspp_blks[dspp->id - DSPP_0] = &hw->base;
>  	}
> 
> +	for (i = 0; i < cat->dsc_count; i++) {
> +		struct dpu_hw_dsc *hw;
> +		const struct dpu_dsc_cfg *dsc = &cat->dsc[i];
> +
> +		hw = dpu_hw_dsc_init(dsc->id, mmio, cat);
> +		if (IS_ERR_OR_NULL(hw)) {
> +			rc = PTR_ERR(hw);
> +			DPU_ERROR("failed dsc object creation: err %d\n", rc);
> +			goto fail;
> +		}
> +		rm->dsc_blks[dsc->id - DSC_0] = &hw->base;
> +	}
> +
>  	return 0;
> 
>  fail:
> @@ -476,6 +498,9 @@ static int _dpu_rm_reserve_intf(
>  	}
> 
>  	global_state->intf_to_enc_id[idx] = enc_id;
> +
> +	global_state->dsc_to_enc_id[0] = enc_id;
> +	global_state->dsc_to_enc_id[1] = enc_id;
>  	return 0;
>  }
agree with dmitry again here, why are DSCs being reserved in the 
_dpu_rm_reserve_intf function?
First, for clarity, they should be in a function of their own.
Allocating the DSCs has to also account for the PP availability of that 
DSC and other factors need to
be considered as well.
I suggest checking _sde_rm_reserve_dsc() from downstream to improve the 
DSC reservation logic.
> 
> @@ -567,6 +592,8 @@ void dpu_rm_release(struct dpu_global_state 
> *global_state,
>  		ARRAY_SIZE(global_state->ctl_to_enc_id), enc->base.id);
>  	_dpu_rm_clear_mapping(global_state->intf_to_enc_id,
>  		ARRAY_SIZE(global_state->intf_to_enc_id), enc->base.id);
> +	_dpu_rm_clear_mapping(global_state->dsc_to_enc_id,
> +		ARRAY_SIZE(global_state->dsc_to_enc_id), enc->base.id);
>  }
> 
>  int dpu_rm_reserve(
> @@ -640,6 +667,11 @@ int dpu_rm_get_assigned_resources(struct dpu_rm 
> *rm,
>  		hw_to_enc_id = global_state->dspp_to_enc_id;
>  		max_blks = ARRAY_SIZE(rm->dspp_blks);
>  		break;
> +	case DPU_HW_BLK_DSC:
> +		hw_blks = rm->dsc_blks;
> +		hw_to_enc_id = global_state->dsc_to_enc_id;
> +		max_blks = ARRAY_SIZE(rm->dsc_blks);
> +		break;
>  	default:
>  		DPU_ERROR("blk type %d not managed by rm\n", type);
>  		return 0;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> index 1f12c8d5b8aa..278d2a510b80 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> @@ -30,6 +30,7 @@ struct dpu_rm {
>  	struct dpu_hw_blk *intf_blks[INTF_MAX - INTF_0];
>  	struct dpu_hw_blk *dspp_blks[DSPP_MAX - DSPP_0];
>  	struct dpu_hw_blk *merge_3d_blks[MERGE_3D_MAX - MERGE_3D_0];
> +	struct dpu_hw_blk *dsc_blks[DSC_MAX - DSC_0];
> 
>  	uint32_t lm_max_width;
>  };
