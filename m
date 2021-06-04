Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD51839C203
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jun 2021 23:10:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4ACE6F518;
	Fri,  4 Jun 2021 21:10:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25BFF6F518
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Jun 2021 21:10:20 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1622841022; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=M2a8aoOv3EI6mp/CgBK8zMe95aEpKXurrJwsbb/BuL0=;
 b=ZHvvotGga5z/CdQ/osgvtFm2E7V6Mi3NHK0HlhFAURFa+auLty0OSp7kKoaF5qB/43+ZkM8s
 8Y9hhnEtRTJXChqzELYJVO8fvmV0GBJlyxpc03sFg6nvjgQeW83bROPoMmxWtMbXL6a7vWVg
 RZ7fLAMlpESic6BswQFg4SGGTIA=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 60ba96a7f726fa4188b59640 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 04 Jun 2021 21:09:59
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id EEC62C43143; Fri,  4 Jun 2021 21:09:58 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 528D1C4338A;
 Fri,  4 Jun 2021 21:09:57 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Fri, 04 Jun 2021 14:09:57 -0700
From: abhinavk@codeaurora.org
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [Freedreno] [PATCH v3 3/4] drm/msm/dpu: use struct
 dpu_hw_merge_3d in dpu_hw_pingpong
In-Reply-To: <20210515190909.1809050-4-dmitry.baryshkov@linaro.org>
References: <20210515190909.1809050-1-dmitry.baryshkov@linaro.org>
 <20210515190909.1809050-4-dmitry.baryshkov@linaro.org>
Message-ID: <75924e8e083e5416c548f3206d7448e5@codeaurora.org>
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
> Use struct dpu_hw_merge_3d pointer in struct dpu_hw_pingpong rather
> than using struct dpu_hw_blk. This is the only user of dpu_hw_blk.id,
> which will be cleaned in the next patch.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 11 ++++-------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h      |  4 +++-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c               |  2 +-
>  3 files changed, 8 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> index 0e06b7e73c7a..4feec24162bc 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> @@ -284,7 +284,7 @@ static void 
> dpu_encoder_phys_vid_setup_timing_engine(
>  	intf_cfg.stream_sel = 0; /* Don't care value for video mode */
>  	intf_cfg.mode_3d = dpu_encoder_helper_get_3d_blend_mode(phys_enc);
>  	if (phys_enc->hw_pp->merge_3d)
> -		intf_cfg.merge_3d = phys_enc->hw_pp->merge_3d->id;
> +		intf_cfg.merge_3d = phys_enc->hw_pp->merge_3d->idx;
> 
>  	spin_lock_irqsave(phys_enc->enc_spinlock, lock_flags);
>  	phys_enc->hw_intf->ops.setup_timing_gen(phys_enc->hw_intf,
> @@ -298,11 +298,8 @@ static void 
> dpu_encoder_phys_vid_setup_timing_engine(
>  				true,
>  				phys_enc->hw_pp->idx);
> 
> -	if (phys_enc->hw_pp->merge_3d) {
> -		struct dpu_hw_merge_3d *merge_3d =
> to_dpu_hw_merge_3d(phys_enc->hw_pp->merge_3d);
> -
> -		merge_3d->ops.setup_3d_mode(merge_3d, intf_cfg.mode_3d);
> -	}
> +	if (phys_enc->hw_pp->merge_3d)
> +		phys_enc->hw_pp->merge_3d->ops.setup_3d_mode(phys_enc->hw_pp->merge_3d,
> intf_cfg.mode_3d);
> 
>  	spin_unlock_irqrestore(phys_enc->enc_spinlock, lock_flags);
> 
> @@ -461,7 +458,7 @@ static void dpu_encoder_phys_vid_enable(struct
> dpu_encoder_phys *phys_enc)
> 
>  	ctl->ops.update_pending_flush_intf(ctl, phys_enc->hw_intf->idx);
>  	if (ctl->ops.update_pending_flush_merge_3d && 
> phys_enc->hw_pp->merge_3d)
> -		ctl->ops.update_pending_flush_merge_3d(ctl, 
> phys_enc->hw_pp->merge_3d->id);
> +		ctl->ops.update_pending_flush_merge_3d(ctl, 
> phys_enc->hw_pp->merge_3d->idx);
> 
>  skip_flush:
>  	DPU_DEBUG_VIDENC(phys_enc,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h
> index 845b9ce80e31..89d08a715c16 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h
> @@ -126,6 +126,8 @@ struct dpu_hw_pingpong_ops {
>  			struct dpu_hw_dither_cfg *cfg);
>  };
> 
> +struct dpu_hw_merge_3d;
> +
>  struct dpu_hw_pingpong {
>  	struct dpu_hw_blk base;
>  	struct dpu_hw_blk_reg_map hw;
> @@ -133,7 +135,7 @@ struct dpu_hw_pingpong {
>  	/* pingpong */
>  	enum dpu_pingpong idx;
>  	const struct dpu_pingpong_cfg *caps;
> -	struct dpu_hw_blk *merge_3d;
> +	struct dpu_hw_merge_3d *merge_3d;
> 
>  	/* ops */
>  	struct dpu_hw_pingpong_ops ops;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> index fd2d104f0a91..c0eec12498e7 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> @@ -162,7 +162,7 @@ int dpu_rm_init(struct dpu_rm *rm,
>  			goto fail;
>  		}
>  		if (pp->merge_3d && pp->merge_3d < MERGE_3D_MAX)
> -			hw->merge_3d = rm->merge_3d_blks[pp->merge_3d - MERGE_3D_0];
> +			hw->merge_3d = to_dpu_hw_merge_3d(rm->merge_3d_blks[pp->merge_3d -
> MERGE_3D_0]);
>  		rm->pingpong_blks[pp->id - PINGPONG_0] = &hw->base;
>  	}
