Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E3A039C228
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jun 2021 23:16:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70FFD6F51C;
	Fri,  4 Jun 2021 21:16:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4EE96F51D
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Jun 2021 21:16:14 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1622841377; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=GNHwhdvjGh/GIZR5RCVz2SGnmm+sxRKqNvS/Jvgdklc=;
 b=dDHld/rjDkoveZr7Fa1wQJndaYIDW6AJ7kmZr3xaiQ9YXYe5B68+qJmkWeB9WZ3y/MWKhHlU
 HPn8qO8cqfCxCJ1b0BRWli5ih2a9oLQH63xtNT3KD5X8y07mK3vO6eofRWdg5Udi+bgsSN3Y
 zF4qW25k2tEdKDVijiif4PzS07o=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 60ba9806265e7370f75d4d47 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 04 Jun 2021 21:15:50
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 6C6B4C4338A; Fri,  4 Jun 2021 21:15:49 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 4A8C9C433F1;
 Fri,  4 Jun 2021 21:15:47 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Fri, 04 Jun 2021 14:15:47 -0700
From: abhinavk@codeaurora.org
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [Freedreno] [PATCH v3 4/4] drm/msm/dpu: hw_blk: make dpu_hw_blk
 empty opaque structure
In-Reply-To: <20210515190909.1809050-5-dmitry.baryshkov@linaro.org>
References: <20210515190909.1809050-1-dmitry.baryshkov@linaro.org>
 <20210515190909.1809050-5-dmitry.baryshkov@linaro.org>
Message-ID: <794981561256537e3535e6650a8137b6@codeaurora.org>
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
Cc: freedreno@lists.freedesktop.org, Jonathan Marek <jonathan@marek.ca>,
 Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 David Airlie <airlied@linux.ie>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-05-15 12:09, Dmitry Baryshkov wrote:
> The code does not really use dpu_hw_blk fields, so drop them, making
> dpu_hw_blk empty structure.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/Makefile                  |  1 -
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_blk.c    | 24 -------------------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_blk.h    |  4 +---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c    |  2 --
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c   |  2 --
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c   |  2 --
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c     |  2 --
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c    |  2 --
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c   |  2 --
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c   |  2 --
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c    |  2 --
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c        |  2 +-
>  12 files changed, 2 insertions(+), 45 deletions(-)
>  delete mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_blk.c
> 
> diff --git a/drivers/gpu/drm/msm/Makefile 
> b/drivers/gpu/drm/msm/Makefile
> index 610d630326bb..55dbde30c2a2 100644
> --- a/drivers/gpu/drm/msm/Makefile
> +++ b/drivers/gpu/drm/msm/Makefile
> @@ -58,7 +58,6 @@ msm-y := \
>  	disp/dpu1/dpu_encoder_phys_cmd.o \
>  	disp/dpu1/dpu_encoder_phys_vid.o \
>  	disp/dpu1/dpu_formats.o \
> -	disp/dpu1/dpu_hw_blk.o \
>  	disp/dpu1/dpu_hw_catalog.o \
>  	disp/dpu1/dpu_hw_ctl.o \
>  	disp/dpu1/dpu_hw_interrupts.o \
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_blk.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_blk.c
> deleted file mode 100644
> index 1f2b74b9eb65..000000000000
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_blk.c
> +++ /dev/null
> @@ -1,24 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0-only
> -/* Copyright (c) 2017-2018, The Linux Foundation. All rights reserved.
> - */
> -
> -#define pr_fmt(fmt)	"[drm:%s:%d] " fmt, __func__, __LINE__
> -
> -#include <linux/mutex.h>
> -#include <linux/errno.h>
> -#include <linux/slab.h>
> -
> -#include "dpu_hw_mdss.h"
> -#include "dpu_hw_blk.h"
> -
> -/**
> - * dpu_hw_blk_init - initialize hw block object
> - * @hw_blk: pointer to hw block object
> - * @type: hw block type - enum dpu_hw_blk_type
> - * @id: instance id of the hw block
> - */
> -void dpu_hw_blk_init(struct dpu_hw_blk *hw_blk, u32 type, int id)
> -{
> -	hw_blk->type = type;
> -	hw_blk->id = id;
> -}
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_blk.h
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_blk.h
> index 7768694b558a..52e92f37eda4 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_blk.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_blk.h
> @@ -19,9 +19,7 @@ struct dpu_hw_blk;
>   * @refcount: reference/usage count
>   */
>  struct dpu_hw_blk {
> -	u32 type;
> -	int id;
> +	/* opaque */
>  };
> 
> -void dpu_hw_blk_init(struct dpu_hw_blk *hw_blk, u32 type, int id);
>  #endif /*_DPU_HW_BLK_H */
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> index 441f66a4fb37..f8a74f6cdc4c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> @@ -613,8 +613,6 @@ struct dpu_hw_ctl *dpu_hw_ctl_init(enum dpu_ctl 
> idx,
>  	c->mixer_count = m->mixer_count;
>  	c->mixer_hw_caps = m->mixer;
> 
> -	dpu_hw_blk_init(&c->base, DPU_HW_BLK_CTL, idx);
> -
>  	return c;
>  }
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
> index 977b25968f34..a98e964c3b6f 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
> @@ -110,8 +110,6 @@ struct dpu_hw_dspp *dpu_hw_dspp_init(enum dpu_dspp 
> idx,
>  	c->cap = cfg;
>  	_setup_dspp_ops(c, c->cap->features);
> 
> -	dpu_hw_blk_init(&c->base, DPU_HW_BLK_DSPP, idx);
> -
>  	return c;
>  }
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> index 17224556d5a8..116e2b5b1a90 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> @@ -325,8 +325,6 @@ struct dpu_hw_intf *dpu_hw_intf_init(enum dpu_intf 
> idx,
>  	c->mdss = m;
>  	_setup_intf_ops(&c->ops, c->cap->features);
> 
> -	dpu_hw_blk_init(&c->base, DPU_HW_BLK_INTF, idx);
> -
>  	return c;
>  }
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
> index 76f8b8f75b82..cb6bb7a22c15 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
> @@ -182,8 +182,6 @@ struct dpu_hw_mixer *dpu_hw_lm_init(enum dpu_lm 
> idx,
>  	c->cap = cfg;
>  	_setup_mixer_ops(m, &c->ops, c->cap->features);
> 
> -	dpu_hw_blk_init(&c->base, DPU_HW_BLK_LM, idx);
> -
>  	return c;
>  }
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c
> index 406ba950a066..c06d595d5df0 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c
> @@ -79,8 +79,6 @@ struct dpu_hw_merge_3d *dpu_hw_merge_3d_init(enum
> dpu_merge_3d idx,
>  	c->caps = cfg;
>  	_setup_merge_3d_ops(c, c->caps->features);
> 
> -	dpu_hw_blk_init(&c->base, DPU_HW_BLK_MERGE_3D, idx);
> -
>  	return c;
>  }
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
> index 92cd724263ce..55766c97c4c8 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
> @@ -282,8 +282,6 @@ struct dpu_hw_pingpong *dpu_hw_pingpong_init(enum
> dpu_pingpong idx,
>  	c->caps = cfg;
>  	_setup_pingpong_ops(c, c->caps->features);
> 
> -	dpu_hw_blk_init(&c->base, DPU_HW_BLK_PINGPONG, idx);
> -
>  	return c;
>  }
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> index 8734a47040aa..69eed7932486 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> @@ -733,8 +733,6 @@ struct dpu_hw_pipe *dpu_hw_sspp_init(enum dpu_sspp 
> idx,
>  	hw_pipe->cap = cfg;
>  	_setup_layer_ops(hw_pipe, hw_pipe->cap->features);
> 
> -	dpu_hw_blk_init(&hw_pipe->base, DPU_HW_BLK_SSPP, idx);
> -
>  	return hw_pipe;
>  }
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
> index dae77d9c2c74..282e3c6c6d48 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
> @@ -322,8 +322,6 @@ struct dpu_hw_mdp *dpu_hw_mdptop_init(enum dpu_mdp 
> idx,
>  	mdp->caps = cfg;
>  	_setup_mdp_ops(&mdp->ops, mdp->caps->features);
> 
> -	dpu_hw_blk_init(&mdp->base, DPU_HW_BLK_TOP, idx);
> -
>  	return mdp;
>  }
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> index c0eec12498e7..f9c83d6e427a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> @@ -428,7 +428,7 @@ static int _dpu_rm_reserve_ctls(
>  		features = ctl->caps->features;
>  		has_split_display = BIT(DPU_CTL_SPLIT_DISPLAY) & features;
> 
> -		DPU_DEBUG("ctl %d caps 0x%lX\n", rm->ctl_blks[j]->id, features);
> +		DPU_DEBUG("ctl %d caps 0x%lX\n", j + CTL_0, features);
> 
>  		if (needs_split_display != has_split_display)
>  			continue;
