Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C68736BA9B
	for <lists+dri-devel@lfdr.de>; Mon, 26 Apr 2021 22:14:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D418D6E12D;
	Mon, 26 Apr 2021 20:14:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 244FF6E12D
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Apr 2021 20:13:59 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1619468041; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=G5g2Uv7oWnTLRa9HQv9pcOTJITg5Me5toF/RwJ+mfsY=;
 b=f1Va+LhN0JIaCE1JHxYqj0x/MUHGWqnGHyVNO8eaY2IPkKIMRLgo2TljXqGZhWOlZwWSZQlg
 dV7/1sfq4eQuso/UHBeO3oe2MoKaBmnwmBeqYRr2PAVwzduPKNjladqUjfgCjGXR2Zh+dXo1
 uFSsdTbGrnfhFix1YDk4tswXe9s=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 60871efea817abd39a2fa58c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 26 Apr 2021 20:13:50
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 70E96C43217; Mon, 26 Apr 2021 20:13:49 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id E4259C433F1;
 Mon, 26 Apr 2021 20:13:47 +0000 (UTC)
MIME-Version: 1.0
Date: Mon, 26 Apr 2021 13:13:47 -0700
From: abhinavk@codeaurora.org
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH 1/2] drm/msm: pass dump state as a function argument
In-Reply-To: <20210425160800.1201337-2-dmitry.baryshkov@linaro.org>
References: <20210425160800.1201337-1-dmitry.baryshkov@linaro.org>
 <20210425160800.1201337-2-dmitry.baryshkov@linaro.org>
Message-ID: <83139fa5e5743054ffd2fd63f36336bf@codeaurora.org>
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-04-25 09:07, Dmitry Baryshkov wrote:
> Instead of always getting the disp_state from drm device, pass it as an
> argument.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

This certainly reduces some amount of code, I am onboard with this, 
hence:

Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c         |  5 +----
>  drivers/gpu/drm/msm/disp/msm_disp_snapshot.h    |  8 --------
>  .../gpu/drm/msm/disp/msm_disp_snapshot_util.c   | 17 +++--------------
>  drivers/gpu/drm/msm/dp/dp_display.c             |  4 +---
>  drivers/gpu/drm/msm/dsi/dsi.c                   |  4 ++--
>  drivers/gpu/drm/msm/dsi/dsi.h                   |  4 ++--
>  drivers/gpu/drm/msm/dsi/dsi_host.c              |  6 +-----
>  drivers/gpu/drm/msm/msm_drv.h                   |  3 ++-
>  drivers/gpu/drm/msm/msm_kms.h                   |  2 +-
>  9 files changed, 13 insertions(+), 40 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index ead247864c1b..e500a9294528 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -799,15 +799,12 @@ static void dpu_irq_uninstall(struct msm_kms 
> *kms)
>  	dpu_core_irq_uninstall(dpu_kms);
>  }
> 
> -static void dpu_kms_mdp_snapshot(struct msm_kms *kms)
> +static void dpu_kms_mdp_snapshot(struct msm_disp_state *disp_state,
> struct msm_kms *kms)
>  {
>  	int i;
>  	struct dpu_kms *dpu_kms;
>  	struct dpu_mdss_cfg *cat;
>  	struct dpu_hw_mdp *top;
> -	struct msm_disp_state *disp_state;
> -
> -	disp_state = kms->disp_state;
> 
>  	dpu_kms = to_dpu_kms(kms);
> 
> diff --git a/drivers/gpu/drm/msm/disp/msm_disp_snapshot.h
> b/drivers/gpu/drm/msm/disp/msm_disp_snapshot.h
> index 7e075e799f0a..32f52799a1ba 100644
> --- a/drivers/gpu/drm/msm/disp/msm_disp_snapshot.h
> +++ b/drivers/gpu/drm/msm/disp/msm_disp_snapshot.h
> @@ -104,14 +104,6 @@ void msm_disp_snapshot_destroy(struct drm_device 
> *drm_dev);
>   */
>  void msm_disp_snapshot_state(struct drm_device *drm_dev);
> 
> -/**
> - * msm_disp_state_get - get the handle to msm_disp_state struct from
> the drm device
> - * @drm:	    handle to drm device
> -
> - * Returns:	handle to the msm_disp_state struct
> - */
> -struct msm_disp_state *msm_disp_state_get(struct drm_device *drm);
> -
>  /**
>   * msm_disp_state_print - print out the current dpu state
>   * @disp_state:	    handle to drm device
> diff --git a/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c
> b/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c
> index 44dc68295ddb..ca6632550337 100644
> --- a/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c
> +++ b/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c
> @@ -69,17 +69,6 @@ static void msm_disp_state_print_regs(u32 **reg,
> u32 len, void __iomem *base_add
>  	}
>  }
> 
> -struct msm_disp_state *msm_disp_state_get(struct drm_device *drm)
> -{
> -	struct msm_drm_private *priv;
> -	struct msm_kms *kms;
> -
> -	priv = drm->dev_private;
> -	kms = priv->kms;
> -
> -	return kms->disp_state;
> -}
> -
>  void msm_disp_state_print(struct msm_disp_state *state, struct 
> drm_printer *p)
>  {
>  	struct msm_disp_state_block *block, *tmp;
> @@ -138,17 +127,17 @@ void msm_disp_snapshot_capture_state(struct
> msm_disp_state *disp_state)
>  	kms = priv->kms;
> 
>  	if (priv->dp)
> -		msm_dp_snapshot(priv->dp);
> +		msm_dp_snapshot(disp_state, priv->dp);
> 
>  	for (i = 0; i < ARRAY_SIZE(priv->dsi); i++) {
>  		if (!priv->dsi[i])
>  			continue;
> 
> -		msm_dsi_snapshot(priv->dsi[i]);
> +		msm_dsi_snapshot(disp_state, priv->dsi[i]);
>  	}
> 
>  	if (kms->funcs->snapshot)
> -		kms->funcs->snapshot(kms);
> +		kms->funcs->snapshot(disp_state, kms);
> 
>  	msm_disp_capture_atomic_state(disp_state);
>  }
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c
> b/drivers/gpu/drm/msm/dp/dp_display.c
> index 66705588f751..95d0bba7e172 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -1009,15 +1009,13 @@ int dp_display_get_test_bpp(struct msm_dp *dp)
>  		dp_display->link->test_video.test_bit_depth);
>  }
> 
> -void msm_dp_snapshot(struct msm_dp *dp)
> +void msm_dp_snapshot(struct msm_disp_state *disp_state, struct msm_dp 
> *dp)
>  {
>  	struct dp_display_private *dp_display;
>  	struct drm_device *drm;
> -	struct msm_disp_state *disp_state;
> 
>  	dp_display = container_of(dp, struct dp_display_private, dp_display);
>  	drm = dp->drm_dev;
> -	disp_state = msm_disp_state_get(drm);
> 
>  	/*
>  	 * if we are reading registers we need the link clocks to be on
> diff --git a/drivers/gpu/drm/msm/dsi/dsi.c 
> b/drivers/gpu/drm/msm/dsi/dsi.c
> index bccc00603aa8..322d2e535df0 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi.c
> @@ -266,8 +266,8 @@ int msm_dsi_modeset_init(struct msm_dsi *msm_dsi,
> struct drm_device *dev,
>  	return ret;
>  }
> 
> -void msm_dsi_snapshot(struct msm_dsi *msm_dsi)
> +void msm_dsi_snapshot(struct msm_disp_state *disp_state, struct
> msm_dsi *msm_dsi)
>  {
> -	msm_dsi_host_snapshot(msm_dsi->host);
> +	msm_dsi_host_snapshot(disp_state, msm_dsi->host);
>  }
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi.h 
> b/drivers/gpu/drm/msm/dsi/dsi.h
> index e26223c3b6ec..b5679cf89413 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi.h
> +++ b/drivers/gpu/drm/msm/dsi/dsi.h
> @@ -91,7 +91,7 @@ static inline bool msm_dsi_device_connected(struct
> msm_dsi *msm_dsi)
>  	return msm_dsi->panel || msm_dsi->external_bridge;
>  }
> 
> -void msm_dsi_snapshot(struct msm_dsi *msm_dsi);
> +void msm_dsi_snapshot(struct msm_disp_state *disp_state, struct
> msm_dsi *msm_dsi);
> 
>  struct drm_encoder *msm_dsi_get_encoder(struct msm_dsi *msm_dsi);
> 
> @@ -149,7 +149,7 @@ int dsi_clk_init_v2(struct msm_dsi_host *msm_host);
>  int dsi_clk_init_6g_v2(struct msm_dsi_host *msm_host);
>  int dsi_calc_clk_rate_v2(struct msm_dsi_host *msm_host, bool 
> is_dual_dsi);
>  int dsi_calc_clk_rate_6g(struct msm_dsi_host *msm_host, bool 
> is_dual_dsi);
> -void msm_dsi_host_snapshot(struct mipi_dsi_host *host);
> +void msm_dsi_host_snapshot(struct msm_disp_state *disp_state, struct
> mipi_dsi_host *host);
>  /* dsi phy */
>  struct msm_dsi_phy;
>  struct msm_dsi_phy_shared_timings {
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c
> b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index 899b6fc2b634..1a63368c3912 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -2488,13 +2488,9 @@ struct drm_bridge
> *msm_dsi_host_get_bridge(struct mipi_dsi_host *host)
>  	return of_drm_find_bridge(msm_host->device_node);
>  }
> 
> -void msm_dsi_host_snapshot(struct mipi_dsi_host *host)
> +void msm_dsi_host_snapshot(struct msm_disp_state *disp_state, struct
> mipi_dsi_host *host)
>  {
>  	struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
> -	struct drm_device *dev = msm_host->dev;
> -	struct msm_disp_state *disp_state;
> -
> -	disp_state = msm_disp_state_get(dev);
> 
>  	pm_runtime_get_sync(&msm_host->pdev->dev);
> 
> diff --git a/drivers/gpu/drm/msm/msm_drv.h 
> b/drivers/gpu/drm/msm/msm_drv.h
> index 9c40bac8a050..15cb34451ded 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -367,7 +367,8 @@ void msm_dp_display_mode_set(struct msm_dp *dp,
> struct drm_encoder *encoder,
>  				struct drm_display_mode *mode,
>  				struct drm_display_mode *adjusted_mode);
>  void msm_dp_irq_postinstall(struct msm_dp *dp_display);
> -void msm_dp_snapshot(struct msm_dp *dp_display);
> +struct msm_disp_state;
> +void msm_dp_snapshot(struct msm_disp_state *disp_state, struct msm_dp
> *dp_display);
> 
>  void msm_dp_debugfs_init(struct msm_dp *dp_display, struct drm_minor 
> *minor);
> 
> diff --git a/drivers/gpu/drm/msm/msm_kms.h 
> b/drivers/gpu/drm/msm/msm_kms.h
> index b31fdad3f055..146dcab123f4 100644
> --- a/drivers/gpu/drm/msm/msm_kms.h
> +++ b/drivers/gpu/drm/msm/msm_kms.h
> @@ -124,7 +124,7 @@ struct msm_kms_funcs {
>  	void (*destroy)(struct msm_kms *kms);
> 
>  	/* snapshot: */
> -	void (*snapshot)(struct msm_kms *kms);
> +	void (*snapshot)(struct msm_disp_state *disp_state, struct msm_kms 
> *kms);
> 
>  #ifdef CONFIG_DEBUG_FS
>  	/* debugfs: */
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
