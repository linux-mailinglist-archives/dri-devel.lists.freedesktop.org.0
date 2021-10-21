Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A1768436E38
	for <lists+dri-devel@lfdr.de>; Fri, 22 Oct 2021 01:20:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A55C26E4F1;
	Thu, 21 Oct 2021 23:19:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 672826E4F1
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Oct 2021 23:19:54 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1634858396; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=1cJtc35Y53dzqjAKco4Zu4fuOLPBg8VT+uVqh64Zx88=;
 b=eIojpTfSlc4L+OxYXIwIU4cjtdCtRbEUqRrhnK4uEkA94KUqXh87H0bHjiUxH19VS8TgaCck
 PIjpS7GdBkTgeyfrWWpAfNg1mkGTDtwZ/mjbePotrdArCwopfu1ElrX8geb55jNkvZAwx7Zt
 jaGPRQAGcXCAYuy5gKTFQqPWnHU=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 6171f58b3416c2cb7057845c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 21 Oct 2021 23:19:39
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 47B89C43619; Thu, 21 Oct 2021 23:19:38 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 105A6C4338F;
 Thu, 21 Oct 2021 23:19:36 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Thu, 21 Oct 2021 16:19:36 -0700
From: abhinavk@codeaurora.org
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Jonathan Marek
 <jonathan@marek.ca>, Stephen Boyd <sboyd@kernel.org>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Subject: Re: [Freedreno] [PATCH 08/11] drm/msm/dpu: remove dpu_hw_pipe_cdp_cfg
 from dpu_plane
In-Reply-To: <20210930140002.308628-9-dmitry.baryshkov@linaro.org>
References: <20210930140002.308628-1-dmitry.baryshkov@linaro.org>
 <20210930140002.308628-9-dmitry.baryshkov@linaro.org>
Message-ID: <760a6495fb155ddda06e888dc9559c2e@codeaurora.org>
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

On 2021-09-30 06:59, Dmitry Baryshkov wrote:
> Remove struct dpu_hw_pipe_cdp_cfg instance from dpu_plane, it is an
> interim configuration structure. Allocate it on stack instead.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 14 +++++++-------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h |  2 --
>  2 files changed, 7 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index b8836c089863..d3ae0cb2047c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -1182,20 +1182,20 @@ static void
> dpu_plane_sspp_atomic_update(struct drm_plane *plane)
>  				pstate->multirect_index);
> 
>  		if (pdpu->pipe_hw->ops.setup_cdp) {
> -			struct dpu_hw_pipe_cdp_cfg *cdp_cfg = &pstate->cdp_cfg;
> +			struct dpu_hw_pipe_cdp_cfg cdp_cfg;
> 
> -			memset(cdp_cfg, 0, sizeof(struct dpu_hw_pipe_cdp_cfg));
> +			memset(&cdp_cfg, 0, sizeof(struct dpu_hw_pipe_cdp_cfg));
> 
> -			cdp_cfg->enable = pdpu->catalog->perf.cdp_cfg
> +			cdp_cfg.enable = pdpu->catalog->perf.cdp_cfg
>  					[DPU_PERF_CDP_USAGE_RT].rd_enable;
> -			cdp_cfg->ubwc_meta_enable =
> +			cdp_cfg.ubwc_meta_enable =
>  					DPU_FORMAT_IS_UBWC(fmt);
> -			cdp_cfg->tile_amortize_enable =
> +			cdp_cfg.tile_amortize_enable =
>  					DPU_FORMAT_IS_UBWC(fmt) ||
>  					DPU_FORMAT_IS_TILE(fmt);
> -			cdp_cfg->preload_ahead = DPU_SSPP_CDP_PRELOAD_AHEAD_64;
> +			cdp_cfg.preload_ahead = DPU_SSPP_CDP_PRELOAD_AHEAD_64;
> 
> -			pdpu->pipe_hw->ops.setup_cdp(pdpu->pipe_hw, cdp_cfg);
> +			pdpu->pipe_hw->ops.setup_cdp(pdpu->pipe_hw, &cdp_cfg);
>  		}
>  	}
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
> index 087194be3c22..1ee5ca5fcdf7 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
> @@ -23,7 +23,6 @@
>   * @multirect_index: index of the rectangle of SSPP
>   * @multirect_mode: parallel or time multiplex multirect mode
>   * @pending:	whether the current update is still pending
> - * @cdp_cfg:	CDP configuration
>   * @plane_fetch_bw: calculated BW per plane
>   * @plane_clk: calculated clk per plane
>   */
> @@ -36,7 +35,6 @@ struct dpu_plane_state {
>  	uint32_t multirect_mode;
>  	bool pending;
> 
> -	struct dpu_hw_pipe_cdp_cfg cdp_cfg;
>  	u64 plane_fetch_bw;
>  	u64 plane_clk;
>  };
