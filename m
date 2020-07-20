Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B982227A68
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jul 2020 10:18:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8EC689B06;
	Tue, 21 Jul 2020 08:18:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37AA989BA5
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jul 2020 20:18:50 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id x9so9222959plr.2
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jul 2020 13:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=IYWIdH+NGn9f+uT9+p8Svev5ztA1QXiSTHkvwPECjIk=;
 b=lzTdQNSBlRpMrLjIcHSSvmo+F43QULnJblFSjXX0+ameOokbH3dbzODrESZLq/8mPW
 pZVyMqvN2PHt+yfQQKSXP86BmNAqOqG8tVFUvlcU2iXKRnc1AlBj122e60gAFWj1ZJMb
 eLBMYBDH3tBBHm01aCnoM0EqfKB+1pFfwBiig=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=IYWIdH+NGn9f+uT9+p8Svev5ztA1QXiSTHkvwPECjIk=;
 b=s5pAOJibqtsaVaerk/Ia9+qwYkGXN5MXyNrKKdII4nKq9sPeoI3POelTLz61T7+0hP
 /7jB3N2Q6QxAS4fka8zhF38uwiaCs2u6JFVAbSGkyPh3U1POpSUo0AtO/jcA6GoZbXuu
 B6MR9mA4Wg5Jn+k4oQ+m/jfXszW5W5HpSPI+ECcVuHvRqS+lXM7t803cUi//bMpy5rgD
 Gh14jCob/amwZw2n5luqRHLL64Q6JFCqSOWOrWcxRqVTEBle1YrjwYRY8DoMl6SLefvB
 u7mmpUEGyzdlb2tQ8FqKEjrTjiHkk9KUBPng2Kh/Xni2+ESmJLP49FsHtWxZneDmgcTn
 LOsA==
X-Gm-Message-State: AOAM530cjrfh56H9iSd3/YQP4nyM7EvGuPThvSiixbGF13ajOYrW2ZYL
 V8GIEPNwFQSPm04eEdwVxUIm0w==
X-Google-Smtp-Source: ABdhPJworTTfrzaRNagC5m0TTCXTLt6OYiqnjY8NCoQmRmsnhw2DgNuIH+QZUwEIAu8qd6rM/ZyZ7A==
X-Received: by 2002:a17:90b:1103:: with SMTP id
 gi3mr1007863pjb.132.1595276329602; 
 Mon, 20 Jul 2020 13:18:49 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
 by smtp.gmail.com with ESMTPSA id f207sm18251219pfa.107.2020.07.20.13.18.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2020 13:18:48 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20200707184125.15114-1-khsieh@codeaurora.org>
References: <20200707184125.15114-1-khsieh@codeaurora.org>
Subject: Re: [PATCH] drm/msm/dp: Add DP compliance tests on Snapdragon Chipsets
From: Stephen Boyd <swboyd@chromium.org>
To: Kuogee Hsieh <khsieh@codeaurora.org>, robdclark@gmail.com, sean@poorly.run
Date: Mon, 20 Jul 2020 13:18:48 -0700
Message-ID: <159527632812.1987609.6364896740387949838@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
X-Mailman-Approved-At: Tue, 21 Jul 2020 08:18:03 +0000
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
Cc: airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 abhinavk@codeaurora.org, khsieh@codeaurora.org, tanmay@codeaurora.org,
 aravindh@codeaurora.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2020-07-07 11:41:25)
> add event thread to execute events serially from event queue. Also
> timeout mode is supported  which allow an event be deferred to be
> executed at later time. Both link and phy compliant tests had been
> done successfully.
> 
> This change depends-on following series:
>         https://lore.kernel.org/dri-devel/20200630184507.15589-1-tanmay@codeaurora.org/
> 

Can this be sent along with that series? 

> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |  12 +-
>  drivers/gpu/drm/msm/dp/dp_aux.c             |   4 +
>  drivers/gpu/drm/msm/dp/dp_aux.h             |   1 +
>  drivers/gpu/drm/msm/dp/dp_catalog.c         |  78 ++-
>  drivers/gpu/drm/msm/dp/dp_ctrl.c            | 361 +++++++----
>  drivers/gpu/drm/msm/dp/dp_ctrl.h            |   3 +-
>  drivers/gpu/drm/msm/dp/dp_display.c         | 654 +++++++++++++-------
>  drivers/gpu/drm/msm/dp/dp_hpd.c             |   2 +-
>  drivers/gpu/drm/msm/dp/dp_hpd.h             |   1 +
>  drivers/gpu/drm/msm/dp/dp_link.c            |  22 +-
>  drivers/gpu/drm/msm/dp/dp_panel.c           |  56 +-
>  drivers/gpu/drm/msm/dp/dp_panel.h           |  10 +-
>  drivers/gpu/drm/msm/dp/dp_parser.c          |  45 +-
>  drivers/gpu/drm/msm/dp/dp_parser.h          |   2 +
>  drivers/gpu/drm/msm/dp/dp_power.c           |  32 +-
>  drivers/gpu/drm/msm/dp/dp_power.h           |   1 +
>  drivers/gpu/drm/msm/dp/dp_reg.h             |   1 +
>  17 files changed, 861 insertions(+), 424 deletions(-)

It seems to spread various changes throughout the DP bits and only has a
short description about what's changing. Given that the series above
isn't merged it would be better to get rid of this change and make the
changes in the patches that introduce these files.

> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index b439e482fc80..87b291b8d7b7 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -1183,13 +1183,6 @@ static void dpu_encoder_virt_disable(struct drm_encoder *drm_enc)
>         dpu_kms = to_dpu_kms(priv->kms);
>         global_state = dpu_kms_get_existing_global_state(dpu_kms);
>  
> -       if (drm_enc->encoder_type == DRM_MODE_ENCODER_TMDS && priv->dp) {
> -               if (msm_dp_display_disable(priv->dp, drm_enc)) {
> -                       DPU_ERROR_ENC(dpu_enc, "dp display disable failed\n");
> -                       return;
> -               }
> -       }
> -
>         trace_dpu_enc_disable(DRMID(drm_enc));
>  
>         /* wait for idle */
> @@ -1220,6 +1213,11 @@ static void dpu_encoder_virt_disable(struct drm_encoder *drm_enc)
>  
>         dpu_rm_release(global_state, drm_enc);
>  
> +       if (drm_enc->encoder_type == DRM_MODE_ENCODER_TMDS && priv->dp) {
> +               if (msm_dp_display_disable(priv->dp, drm_enc))
> +                       DPU_ERROR_ENC(dpu_enc, "dp display disable failed\n");
> +       }
> +
>         mutex_unlock(&dpu_enc->enc_lock);
>  }
>  
> diff --git a/drivers/gpu/drm/msm/dp/dp_aux.c b/drivers/gpu/drm/msm/dp/dp_aux.c
> index 696dc8741f1e..c0e8ad031895 100644
> --- a/drivers/gpu/drm/msm/dp/dp_aux.c
> +++ b/drivers/gpu/drm/msm/dp/dp_aux.c
> @@ -189,6 +189,8 @@ static void dp_aux_native_handler(struct dp_aux_private *aux)
>                 aux->aux_error_num = DP_AUX_ERR_TOUT;
>         if (isr & DP_INTR_NACK_DEFER)
>                 aux->aux_error_num = DP_AUX_ERR_NACK;
> +       if (isr & DP_INTR_AUX_ERROR)
> +               aux->aux_error_num = DP_AUX_ERR_DPPHY_AUX;
>  
>         complete(&aux->comp);
>  }
> @@ -359,6 +361,8 @@ static ssize_t dp_aux_transfer(struct drm_dp_aux *dp_aux,
>                                         PHY_AUX_CFG1);
>                         dp_catalog_aux_reset(aux->catalog);
>                 }
> +               if (aux->aux_error_num == DP_AUX_ERR_DPPHY_AUX)
> +                       usleep_range(400, 400); /* need 400us before next try */

Typically usleep_range() should be a range, and not the same number
for both ends of the range.

>                 goto unlock_exit;
>         }
>  
> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
> index ab69ae3e2dbd..367eb54c9a68 100644
> --- a/drivers/gpu/drm/msm/dp/dp_catalog.c
> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
> @@ -452,7 +452,6 @@ void dp_catalog_aux_setup(struct dp_catalog *dp_catalog)
>         dp_write_phy(catalog, REG_DP_PHY_PD_CTL, DP_PHY_PD_CTL_PSR_PWRDN);
>  
>         /* Make sure that hardware is done with  PSR power down */
> -       wmb();

Is that comment above now not needed?

>         dp_write_phy(catalog, REG_DP_PHY_PD_CTL, DP_PHY_PD_CTL_PWRDN |
>                 DP_PHY_PD_CTL_AUX_PWRDN | DP_PHY_PD_CTL_LANE_0_1_PWRDN
>                 | DP_PHY_PD_CTL_LANE_2_3_PWRDN | DP_PHY_PD_CTL_PLL_PWRDN
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index 98654f39806c..100ab84375f7 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -26,6 +26,13 @@
>  #define MR_LINK_SYMBOL_ERM 0x80
>  #define MR_LINK_PRBS7 0x100
>  #define MR_LINK_CUSTOM80 0x200
> +#define MR_LINK_TRAINING4  0x40
> +
> +enum {
> +       DP_TRAINING_NONE,
> +       DP_TRAINING_1,
> +       DP_TRAINING_2,
> +};
>  
>  struct dp_tu_calc_input {
>         u64 lclk;        /* 162, 270, 540 and 810 */
> @@ -58,7 +65,6 @@ struct dp_vc_tu_mapping_table {
>  
>  struct dp_ctrl_private {
>         struct dp_ctrl dp_ctrl;
> -
>         struct device *dev;
>         struct drm_dp_aux *aux;
>         struct dp_panel *panel;
> @@ -68,10 +74,16 @@ struct dp_ctrl_private {
>         struct dp_catalog *catalog;
>  
>         struct completion idle_comp;
> -       struct mutex push_idle_mutex;
>         struct completion video_comp;
>  };
>  
> +struct dp_cr_status {
> +       u8 lane_0_1;
> +       u8 lane_2_3;
> +};
> +
> +#define DP_LANE0_1_CR_DONE     0x11
> +
>  static int dp_aux_link_configure(struct drm_dp_aux *aux,
>                                         struct dp_link_info *link)
>  {
> @@ -97,8 +109,6 @@ void dp_ctrl_push_idle(struct dp_ctrl *dp_ctrl)
>  
>         ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
>  
> -       mutex_lock(&ctrl->push_idle_mutex);
> -
>         reinit_completion(&ctrl->idle_comp);
>         dp_catalog_ctrl_state_ctrl(ctrl->catalog, DP_STATE_CTRL_PUSH_IDLE);
>  
> @@ -106,7 +116,6 @@ void dp_ctrl_push_idle(struct dp_ctrl *dp_ctrl)
>                         IDLE_PATTERN_COMPLETION_TIMEOUT_JIFFIES))
>                 pr_warn("PUSH_IDLE pattern timedout\n");
>  
> -       mutex_unlock(&ctrl->push_idle_mutex);
>         pr_debug("mainlink off done\n");
>  }
>  
> @@ -985,7 +994,7 @@ static int dp_ctrl_wait4video_ready(struct dp_ctrl_private *ctrl)
>  
>         if (!wait_for_completion_timeout(&ctrl->video_comp,
>                                 WAIT_FOR_VIDEO_READY_TIMEOUT_JIFFIES)) {
> -               DRM_ERROR("Link Train timedout\n");
> +               DRM_ERROR("wait4video timedout\n");
>                 ret = -ETIMEDOUT;
>         }
>         return ret;
> @@ -1006,13 +1015,13 @@ static int dp_ctrl_update_vx_px(struct dp_ctrl_private *ctrl)
>         if (ret)
>                 return ret;
>  
> -       if (voltage_swing_level > DP_TRAIN_VOLTAGE_SWING_MAX) {
> +       if (voltage_swing_level >= DP_TRAIN_VOLTAGE_SWING_MAX) {
>                 DRM_DEBUG_DP("max. voltage swing level reached %d\n",
>                                 voltage_swing_level);
>                 max_level_reached |= DP_TRAIN_MAX_SWING_REACHED;
>         }
>  
> -       if (pre_emphasis_level == DP_TRAIN_PRE_EMPHASIS_MAX) {
> +       if (pre_emphasis_level >= DP_TRAIN_PRE_EMPHASIS_MAX) {
>                 DRM_DEBUG_DP("max. pre-emphasis level reached %d\n",
>                                 pre_emphasis_level);
>                 max_level_reached  |= DP_TRAIN_MAX_PRE_EMPHASIS_REACHED;
> @@ -1044,8 +1053,11 @@ static bool dp_ctrl_train_pattern_set(struct dp_ctrl_private *ctrl,
>         DRM_DEBUG_DP("sink: pattern=%x\n", pattern);
>  
>         buf = pattern;
> -       ret = drm_dp_dpcd_writeb(ctrl->aux,
> -                                       DP_TRAINING_PATTERN_SET, buf);
> +
> +       if (pattern && pattern != DP_TRAINING_PATTERN_4)
> +               buf |= DP_LINK_SCRAMBLING_DISABLE;
> +
> +       ret = drm_dp_dpcd_writeb(ctrl->aux, DP_TRAINING_PATTERN_SET, buf);
>         return ret == 1;
>  }
>  
> @@ -1071,19 +1083,23 @@ static int dp_ctrl_read_link_status(struct dp_ctrl_private *ctrl,
>         return -ETIMEDOUT;
>  }
>  
> -static int dp_ctrl_link_train_1(struct dp_ctrl_private *ctrl)
> +static int dp_ctrl_link_train_1(struct dp_ctrl_private *ctrl,
> +               struct dp_cr_status *cr, int *training_step)
>  {
>         int tries, old_v_level, ret = 0;
>         u8 link_status[DP_LINK_STATUS_SIZE];
> -       int const maximum_retries = 5;
> +       int const maximum_retries = 4;
>  
>         dp_catalog_ctrl_state_ctrl(ctrl->catalog, 0);
>  
> +       *training_step = DP_TRAINING_1;
> +
>         ret = dp_catalog_ctrl_set_pattern(ctrl->catalog, DP_TRAINING_PATTERN_1);
>         if (ret)
>                 return ret;
>         dp_ctrl_train_pattern_set(ctrl, DP_TRAINING_PATTERN_1 |
>                 DP_LINK_SCRAMBLING_DISABLE);
> +
>         ret = dp_ctrl_update_vx_px(ctrl);
>         if (ret)
>                 return ret;
> @@ -1097,12 +1113,15 @@ static int dp_ctrl_link_train_1(struct dp_ctrl_private *ctrl)
>                 if (ret)
>                         return ret;
>  
> +               cr->lane_0_1 = link_status[0];
> +               cr->lane_2_3 = link_status[1];
> +
>                 if (drm_dp_clock_recovery_ok(link_status,
>                         ctrl->link->link_params.num_lanes)) {
> -                       return ret;
> +                       return 0;
>                 }
>  
> -               if (ctrl->link->phy_params.v_level >
> +               if (ctrl->link->phy_params.v_level >=
>                         DP_TRAIN_VOLTAGE_SWING_MAX) {
>                         DRM_ERROR_RATELIMITED("max v_level reached\n");
>                         return -EAGAIN;
> @@ -1125,8 +1144,10 @@ static int dp_ctrl_link_train_1(struct dp_ctrl_private *ctrl)
>         return -ETIMEDOUT;
>  }
>  
> -static void dp_ctrl_link_rate_down_shift(struct dp_ctrl_private *ctrl)
> +static int dp_ctrl_link_rate_down_shift(struct dp_ctrl_private *ctrl)
>  {
> +       int ret = 0;
> +
>         switch (ctrl->link->link_params.rate) {
>         case 810000:
>                 ctrl->link->link_params.rate = 540000;
> @@ -1135,13 +1156,32 @@ static void dp_ctrl_link_rate_down_shift(struct dp_ctrl_private *ctrl)
>                 ctrl->link->link_params.rate = 270000;
>                 break;
>         case 270000:
> +               ctrl->link->link_params.rate = 162000;
> +               break;
>         case 162000:
>         default:
> -               ctrl->link->link_params.rate = 162000;
> +               ret = -1;

Use a real error code instead of -1?

>                 break;
>         };
>  
>         DRM_DEBUG_DP("new rate=0x%x\n", ctrl->link->link_params.rate);

Maybe this should be under a condition like if (!ret)?

> +
> +       return ret;
> +}
> +
>  static void dp_ctrl_clear_training_pattern(struct dp_ctrl_private *ctrl)
> @@ -1214,18 +1260,20 @@ static int dp_ctrl_link_train(struct dp_ctrl_private *ctrl)
>         drm_dp_dpcd_write(ctrl->aux, DP_MAIN_LINK_CHANNEL_CODING_SET,
>                                 &encoding, 1);
>  
> -       ret = dp_ctrl_link_train_1(ctrl);
> +       ret = dp_ctrl_link_train_1(ctrl, cr, training_step);
>         if (ret) {
>                 DRM_ERROR("link training #1 failed. ret=%d\n", ret);
> +               ret = -EAGAIN;
>                 goto end;
>         }
>  
>         /* print success info as this is a result of user initiated action */
>         DRM_DEBUG_DP("link training #1 successful\n");
>  
> -       ret = dp_ctrl_link_training_2(ctrl);
> +       ret = dp_ctrl_link_train_2(ctrl, cr, training_step);
>         if (ret) {
>                 DRM_ERROR("link training #2 failed. ret=%d\n", ret);
> +               ret = -EAGAIN;

Why override ret?

>                 goto end;
>         }
>  
> @@ -1235,58 +1283,36 @@ static int dp_ctrl_link_train(struct dp_ctrl_private *ctrl)
> -static int dp_ctrl_setup_main_link(struct dp_ctrl_private *ctrl, bool train)
> +static int dp_ctrl_setup_main_link(struct dp_ctrl_private *ctrl,
> +               struct dp_cr_status *cr, int *training_step)
>  {
> -       bool mainlink_ready = false;
>         int ret = 0;
>  
>         dp_catalog_ctrl_mainlink_ctrl(ctrl->catalog, true);
>  
> -       ret = dp_link_psm_config(ctrl->link, &ctrl->panel->link_info, false);
> -       if (ret)
> -               return ret;
> -
>         if (ctrl->link->sink_request & DP_TEST_LINK_PHY_TEST_PATTERN)
>                 return ret;
>  
> -       if (train) {
> -               /*
> -                * As part of previous calls, DP controller state might have
> -                * transitioned to PUSH_IDLE. In order to start transmitting
> -                * a link training pattern, we have to first do soft reset.
> -                */
> -               dp_catalog_ctrl_reset(ctrl->catalog);
> -
> -               ret = dp_ctrl_link_train(ctrl);
> -               if (ret)
> -                       return ret;
> -       }
> -
>         /*
> -        * Set up transfer unit values and set controller state to send
> -        * video.
> +        * As part of previous calls, DP controller state might have
> +        * transitioned to PUSH_IDLE. In order to start transmitting
> +        * a link training pattern, we have to first do soft reset.
>          */
> -       dp_ctrl_setup_tr_unit(ctrl);
> -       dp_catalog_ctrl_state_ctrl(ctrl->catalog, DP_STATE_CTRL_SEND_VIDEO);
> +       dp_catalog_ctrl_reset(ctrl->catalog);
>  
> -       ret = dp_ctrl_wait4video_ready(ctrl);
> -       if (ret)
> -               return ret;
> +       ret = dp_ctrl_link_train(ctrl, cr, training_step);
>  
> -       mainlink_ready = dp_catalog_ctrl_mainlink_ready(ctrl->catalog);
> -       DRM_DEBUG_DP("mainlink %s\n", mainlink_ready ? "READY" : "NOT READY");
>         return ret;
>  }
>  
>  static void dp_ctrl_set_clock_rate(struct dp_ctrl_private *ctrl,
> -                                  char *name, u32 rate)
> +                       enum dp_pm_type module, char *name, u32 rate)
>  {
> -       u32 num = ctrl->parser->mp[DP_CTRL_PM].num_clk;
> -       struct dss_clk *cfg = ctrl->parser->mp[DP_CTRL_PM].clk_config;
> +       u32 num = ctrl->parser->mp[module].num_clk;
> +       struct dss_clk *cfg = ctrl->parser->mp[module].clk_config;
>  
>         while (num && strcmp(cfg->clk_name, name)) {
>                 num--;
> @@ -1308,16 +1334,33 @@ static int dp_ctrl_enable_mainlink_clocks(struct dp_ctrl_private *ctrl)
>  
>         dp_power_set_link_clk_parent(ctrl->power);
>  
> -       dp_ctrl_set_clock_rate(ctrl, "ctrl_link",
> +       dp_ctrl_set_clock_rate(ctrl, DP_CTRL_PM, "ctrl_link",
>                                         ctrl->link->link_params.rate);
>  
> -       dp_ctrl_set_clock_rate(ctrl, "stream_pixel",
> -                                       ctrl->dp_ctrl.pixel_rate);
> -
>         ret = dp_power_clk_enable(ctrl->power, DP_CTRL_PM, true);
>         if (ret)
>                 DRM_ERROR("Unable to start link clocks. ret=%d\n", ret);
>  
> +       DRM_DEBUG_DP("link rate=%d pixel_clk=%d\n",
> +               ctrl->link->link_params.rate, ctrl->dp_ctrl.pixel_rate);
> +
> +       return ret;
> +}
> +
> +static int dp_ctrl_enable_stream_clocks(struct dp_ctrl_private *ctrl)
> +{
> +       int ret = 0;
> +
> +       dp_ctrl_set_clock_rate(ctrl, DP_STREAM_PM, "stream_pixel",
> +                                       ctrl->dp_ctrl.pixel_rate);
> +
> +       ret = dp_power_clk_enable(ctrl->power, DP_STREAM_PM, true);
> +       if (ret)
> +               DRM_ERROR("Unabled to start pixel clocks. ret=%d\n", ret);
> +
> +       DRM_DEBUG_DP("link rate=%d pixel_clk=%d\n",
> +                       ctrl->link->link_params.rate, ctrl->dp_ctrl.pixel_rate);
> +
>         return ret;
>  }
>  
> @@ -1407,37 +1450,30 @@ static int dp_ctrl_reinitialize_mainlink(struct dp_ctrl_private *ctrl)
>                 return ret;
>         }
>  
> -       dp_ctrl_configure_source_params(ctrl);
> -       dp_catalog_ctrl_config_msa(ctrl->catalog,
> -               ctrl->link->link_params.rate,
> -               ctrl->dp_ctrl.pixel_rate, dp_ctrl_use_fixed_nvid(ctrl));
> -       reinit_completion(&ctrl->idle_comp);
> -
>         return ret;
>  }
>  
>  static int dp_ctrl_link_maintenance(struct dp_ctrl_private *ctrl)
>  {
>         int ret = 0;
> -       int tries;
> +       struct dp_cr_status cr;
> +       int training_step = DP_TRAINING_NONE;
>  
>         dp_ctrl_push_idle(&ctrl->dp_ctrl);
>         dp_catalog_ctrl_reset(ctrl->catalog);
>  
>         ctrl->dp_ctrl.pixel_rate = ctrl->panel->dp_mode.drm_mode.clock;
>  
> -       for (tries = 0; tries < 10; tries++) {
> -               ret = dp_ctrl_reinitialize_mainlink(ctrl);
> -               if (ret) {
> -                       DRM_ERROR("Failed to reinitialize mainlink. ret=%d\n",
> -                                       ret);
> -                       break;
> -               }
> +       ret = dp_ctrl_setup_main_link(ctrl, &cr, &training_step);
> +       if (ret)
> +               goto end;
>  
> -               ret = dp_ctrl_setup_main_link(ctrl, true);
> -               if (ret == -EAGAIN) /* try with lower link rate */
> -                       dp_ctrl_link_rate_down_shift(ctrl);
> -       }
> +       dp_ctrl_clear_training_pattern(ctrl);
> +
> +       dp_catalog_ctrl_state_ctrl(ctrl->catalog, DP_STATE_CTRL_SEND_VIDEO);
> +
> +       ret = dp_ctrl_wait4video_ready(ctrl);
> +end:
>         return ret;
>  }
>  
> @@ -1450,22 +1486,22 @@ static int dp_ctrl_process_phy_test_request(struct dp_ctrl_private *ctrl)
>                 return ret;
>         }
>  
> -       dp_ctrl_push_idle(&ctrl->dp_ctrl);
>         /*
>          * The global reset will need DP link related clocks to be
>          * running. Add the global reset just before disabling the
>          * link clocks and core clocks.
>          */
> -       dp_catalog_ctrl_reset(ctrl->catalog);
>         ret = dp_ctrl_off(&ctrl->dp_ctrl);
>         if (ret) {
>                 DRM_ERROR("failed to disable DP controller\n");
>                 return ret;
>         }
>  
> -       ret = dp_ctrl_on(&ctrl->dp_ctrl);
> -       if (ret)
> -               DRM_ERROR("failed to enable DP controller\n");
> +       ret = dp_ctrl_on_link(&ctrl->dp_ctrl);
> +       if (!ret)
> +               ret = dp_ctrl_on_stream(&ctrl->dp_ctrl);
> +       else
> +               DRM_ERROR("failed to enable DP link controller\n");
>  
>         return ret;
>  }
> @@ -1485,27 +1521,33 @@ static bool dp_ctrl_send_phy_test_pattern(struct dp_ctrl_private *ctrl)
>                 return false;
>         }
>         dp_catalog_ctrl_send_phy_pattern(ctrl->catalog, pattern_requested);
> +       dp_ctrl_update_vx_px(ctrl);
>         dp_link_send_test_response(ctrl->link);
>  
>         pattern_sent = dp_catalog_ctrl_read_phy_pattern(ctrl->catalog);
>  
>         switch (pattern_sent) {
>         case MR_LINK_TRAINING1:
> -               success = pattern_requested ==
> -                               DP_LINK_QUAL_PATTERN_D10_2;
> +               success = (pattern_requested ==
> +                               DP_PHY_TEST_PATTERN_D10_2);
>                 break;
>         case MR_LINK_SYMBOL_ERM:
> -               success = (pattern_requested ==
> -                               DP_LINK_QUAL_PATTERN_ERROR_RATE)
> -                       || (pattern_requested ==
> -                               DP_LINK_QUAL_PATTERN_HBR2_EYE);
> +               success = ((pattern_requested ==
> +                               DP_PHY_TEST_PATTERN_ERROR_COUNT) ||
> +                               (pattern_requested ==
> +                               DP_PHY_TEST_PATTERN_CP2520));
>                 break;
>         case MR_LINK_PRBS7:
> -               success = pattern_requested == DP_LINK_QUAL_PATTERN_PRBS7;
> +               success = (pattern_requested ==
> +                               DP_PHY_TEST_PATTERN_PRBS7);
>                 break;
>         case MR_LINK_CUSTOM80:
> -               success = pattern_requested ==
> -                               DP_LINK_QUAL_PATTERN_80BIT_CUSTOM;
> +               success = (pattern_requested ==
> +                               DP_PHY_TEST_PATTERN_80BIT_CUSTOM);
> +               break;
> +       case MR_LINK_TRAINING4:
> +               success = (pattern_requested ==
> +                               DP_PHY_TEST_PATTERN_SEL_MASK);
>                 break;
>         default:
>                 success = false;
> @@ -1537,12 +1579,12 @@ void dp_ctrl_handle_sink_request(struct dp_ctrl *dp_ctrl)
>                 }
>         }
>  
> -       if (sink_request & DP_LINK_STATUS_UPDATED)
> +       if (sink_request & DP_LINK_STATUS_UPDATED) {
>                 if (dp_ctrl_link_maintenance(ctrl)) {
> -                       DRM_ERROR("LM failed: STATUS_UPDATED\n");
> +                       DRM_ERROR("LM failed: TEST_LINK_TRAINING\n");
>                         return;
>                 }
> -
> +       }
>  
>         if (sink_request & DP_TEST_LINK_TRAINING) {
>                 dp_link_send_test_response(ctrl->link);
> @@ -1553,13 +1595,15 @@ void dp_ctrl_handle_sink_request(struct dp_ctrl *dp_ctrl)
>         }
>  }
>  
> -int dp_ctrl_on(struct dp_ctrl *dp_ctrl)
> +int dp_ctrl_on_link(struct dp_ctrl *dp_ctrl)
>  {
>         int rc = 0;
>         struct dp_ctrl_private *ctrl;
>         u32 rate = 0;
> -       u32 link_train_max_retries = 10;
> +       u32 link_train_max_retries = 5;

Any reason these variables are u32 instead of unsigned int? Does the
size of the variable matter if we're counting things?

>         u32 const phy_cts_pixel_clk_khz = 148500;
> +       struct dp_cr_status cr;
> +       int training_step;

Any reason to be int vs unsigned int?

>  
>         if (!dp_ctrl)
>                 return -EINVAL;
> @@ -1601,16 +1648,115 @@ int dp_ctrl_on(struct dp_ctrl *dp_ctrl)
>                                         rc);
>                         break;
>                 }
> -               rc = dp_ctrl_setup_main_link(ctrl, true);
> -               if (!rc)
> +
> +               training_step = DP_TRAINING_NONE;
> +               rc = dp_ctrl_setup_main_link(ctrl, &cr, &training_step);
> +               if (rc == 0) {
> +                       /* training completed successfully */
>                         break;
> -               /* try with lower link rate */
> -               dp_ctrl_link_rate_down_shift(ctrl);
> +               } else if (training_step == DP_TRAINING_1) {
> +                       /* link train_1 failed */
> +                       rc = dp_ctrl_link_rate_down_shift(ctrl);
> +                       if (rc < 0) { /* alread in RBR = 1.6G */

already?

> +                               if (cr.lane_0_1 & DP_LANE0_1_CR_DONE) {
> +                                       /*
> +                                        * some lanes are ready,
> +                                        * reduce lane number
> +                                        */
> +                                       rc = dp_ctrl_link_lane_down_shift(ctrl);
> +                                       if (rc < 0) { /* lane == 1 already */
> +                                               /* end with failure */
> +                                               break;
[..]
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 36b6ee4131bb..23ff23a5259f 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -783,6 +807,182 @@ int dp_display_get_test_bpp(struct msm_dp *dp)
>                 dp_display->link->test_video.test_bit_depth);
>  }
>  
> +static void dp_display_config_hpd(struct dp_display_private *dp)
> +{
> +
> +       dp_display_host_init(dp);
> +       dp_catalog_ctrl_hpd_config(dp->catalog);
> +
> +       /* Enable interrupt first time
> +        * we are leaving dp clocks on during disconnect
> +        * and never disable interrupt
> +        */
> +       enable_irq(dp->irq);
> +}
> +
> +static int hpd_event_thread(void *data)
> +{
> +       struct dp_display_private *dp_priv;
> +       unsigned long flag;
> +       struct dp_event *todo;
> +       int timeout_mode = 0;
> +       int ret;
> +
> +       dp_priv = (struct dp_display_private *)data;
> +
> +       while (1) {
> +               if (timeout_mode) {
> +                       ret = wait_event_timeout(dp_priv->event_q,
> +                               (dp_priv->event_pndx == dp_priv->event_gndx),
> +                                               EVENT_TIMEOUT);
> +               } else {
> +                       ret = wait_event_timeout(dp_priv->event_q,
> +                               (dp_priv->event_pndx != dp_priv->event_gndx),
> +                                               EVENT_TIMEOUT);
> +               }
> +               spin_lock_irqsave(&dp_priv->event_lock, flag);
> +               todo = &dp_priv->event_list[dp_priv->event_gndx];
> +               if (todo->delay) {
> +                       struct dp_event *todo_next;
> +
> +                       dp_priv->event_gndx++;
> +                       dp_priv->event_gndx %= DP_EVENT_Q_MAX;
> +
> +                       /* re enter delay event into q */
> +                       todo_next = &dp_priv->event_list[dp_priv->event_pndx++];
> +                       dp_priv->event_pndx %= DP_EVENT_Q_MAX;
> +                       todo_next->event_id = todo->event_id;
> +                       todo_next->data = todo->data;
> +                       todo_next->delay = todo->delay - 1;
> +
> +                       /* clean up older event */
> +                       todo->event_id = EV_NO_EVENT;
> +                       todo->delay = 0;
> +
> +                       /* switch to timeout mode */
> +                       timeout_mode = 1;
> +                       spin_unlock_irqrestore(&dp_priv->event_lock, flag);
> +                       continue;
> +               }
> +
> +               /* timeout with no events in q */
> +               if (dp_priv->event_pndx == dp_priv->event_gndx) {
> +                       spin_unlock_irqrestore(&dp_priv->event_lock, flag);
> +                       continue;
> +               }
> +
> +               dp_priv->event_gndx++;
> +               dp_priv->event_gndx %= DP_EVENT_Q_MAX;
> +               timeout_mode = 0;
> +               spin_unlock_irqrestore(&dp_priv->event_lock, flag);
> +
> +               switch (todo->event_id) {
> +               case EV_HPD_INIT_SETUP:
> +                       dp_display_config_hpd(dp_priv);
> +                       break;
> +               case EV_HPD_PLUG_INT:
> +                       dp_hpd_plug_handle(dp_priv, todo->data);
> +                       break;
> +               case EV_HPD_UNPLUG_INT:
> +                       dp_hpd_unplug_handle(dp_priv, todo->data);
> +                       break;
> +               case EV_IRQ_HPD_INT:
> +                       dp_irq_hpd_handle(dp_priv, todo->data);
> +                       break;
> +               case EV_HPD_REPLUG_INT:
> +                       /* do nothing */
> +                       break;
> +               case EV_USER_NOTIFICATION:
> +                       dp_display_send_hpd_notification(dp_priv,
> +                                               todo->data);
> +                       break;
> +               default:
> +                       break;
> +               }
> +       }
> +
> +       return 0;
> +}
> +
> +static void dp_hpd_event_setup(struct dp_display_private *dp_priv)
> +{
> +       init_waitqueue_head(&dp_priv->event_q);
> +       spin_lock_init(&dp_priv->event_lock);
> +
> +       kthread_run(hpd_event_thread, (void *)dp_priv, "dp_hpd_handler");

Is the cast necessary?

> +}
> +
> @@ -890,8 +1069,13 @@ void msm_dp_irq_postinstall(struct msm_dp *dp_display)
>  
>         dp = container_of(dp_display, struct dp_display_private, dp_display);
>  
> -       INIT_DELAYED_WORK(&dp->config_hpd_work, dp_display_config_hpd_work);
> -       queue_delayed_work(system_wq, &dp->config_hpd_work, HZ * 10);
> +       dp_hpd_event_setup(dp);
> +
> +       /* This hack Delays HPD configuration by 10 sec
> +        * ToDo(User): Implement correct boot sequence of

Typically todo is written "TODO(email@domain)" instead of User.

> +        * HPD configuration and remove this hack
> +        */
> +       dp_add_event(dp, EV_HPD_INIT_SETUP, 0, 100);
>  }
>  
>  int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
> @@ -938,37 +1122,47 @@ int msm_dp_display_enable(struct msm_dp *dp, struct drm_encoder *encoder)
>                 return -EINVAL;
>         }
>  
> +       mutex_lock(&dp_display->event_mutex);
> +
>         rc = dp_display_set_mode(dp, &dp_display->dp_mode);
>         if (rc) {
>                 DRM_ERROR("Failed to perform a mode set, rc=%d\n", rc);
> +               mutex_unlock(&dp_display->event_mutex);
>                 return rc;
>         }
>  
>         rc = dp_display_prepare(dp);
>         if (rc) {
>                 DRM_ERROR("DP display prepare failed, rc=%d\n", rc);
> +               mutex_unlock(&dp_display->event_mutex);
>                 return rc;
>         }
>  
> -       rc = dp_display_enable(dp);
> -       if (rc) {
> -               DRM_ERROR("DP display enable failed, rc=%d\n", rc);
> -               dp_display_unprepare(dp);
> -               return rc;
> -       }
> +       dp_display_enable(dp_display, 0);
>  
>         rc = dp_display_post_enable(dp);
>         if (rc) {
>                 DRM_ERROR("DP display post enable failed, rc=%d\n", rc);
> -               dp_display_disable(dp);
> +               dp_display_disable(dp_display, 0);
>                 dp_display_unprepare(dp);
>         }
> +
> +       /* completed connection */
> +       atomic_set(&dp_display->hpd_state, ST_CONNECTED);
> +
> +       mutex_unlock(&dp_display->event_mutex);
> +
>         return rc;
>  }
>  
>  int msm_dp_display_disable(struct msm_dp *dp, struct drm_encoder *encoder)
>  {
>         int rc = 0;
> +       struct dp_display_private *dp_display;
> +
> +       dp_display = container_of(dp, struct dp_display_private, dp_display);
> +
> +       mutex_lock(&dp_display->event_mutex);
>  
>         rc = dp_display_pre_disable(dp);
>         if (rc) {
> @@ -976,16 +1170,16 @@ int msm_dp_display_disable(struct msm_dp *dp, struct drm_encoder *encoder)
>                 return rc;
>         }
>  
> -       rc = dp_display_disable(dp);
> -       if (rc) {
> -               DRM_ERROR("DP display disable failed, rc=%d\n", rc);
> -               return rc;
> -       }
> +       dp_display_disable(dp_display, 0);
>  
>         rc = dp_display_unprepare(dp);
>         if (rc)
>                 DRM_ERROR("DP display unprepare failed, rc=%d\n", rc);
>  
> +       /* completed disconnection */
> +       atomic_set(&dp_display->hpd_state, ST_DISCONNECTED);
> +
> +       mutex_unlock(&dp_display->event_mutex);
>         return rc;
>  }
>  
> diff --git a/drivers/gpu/drm/msm/dp/dp_hpd.c b/drivers/gpu/drm/msm/dp/dp_hpd.c
> index 5b08ce580702..5b8fe32022b5 100644
> --- a/drivers/gpu/drm/msm/dp/dp_hpd.c
> +++ b/drivers/gpu/drm/msm/dp/dp_hpd.c
> @@ -24,7 +24,7 @@ struct dp_hpd_private {
>         struct dp_usbpd dp_usbpd;
>  };
>  
> -static int dp_hpd_connect(struct dp_usbpd *dp_usbpd, bool hpd)
> +int dp_hpd_connect(struct dp_usbpd *dp_usbpd, bool hpd)
>  {
>         int rc = 0;
>         struct dp_hpd_private *hpd_priv;
> diff --git a/drivers/gpu/drm/msm/dp/dp_hpd.h b/drivers/gpu/drm/msm/dp/dp_hpd.h
> index c0178524bec7..5bc5bb64680f 100644
> --- a/drivers/gpu/drm/msm/dp/dp_hpd.h
> +++ b/drivers/gpu/drm/msm/dp/dp_hpd.h
> @@ -75,5 +75,6 @@ struct dp_usbpd *dp_hpd_get(struct device *dev, struct dp_usbpd_cb *cb);
>  
>  int dp_hpd_register(struct dp_usbpd *dp_usbpd);
>  void dp_hpd_unregister(struct dp_usbpd *dp_usbpd);
> +int dp_hpd_connect(struct dp_usbpd *dp_usbpd, bool hpd);
>  
>  #endif /* _DP_HPD_H_ */
> diff --git a/drivers/gpu/drm/msm/dp/dp_link.c b/drivers/gpu/drm/msm/dp/dp_link.c
> index 9c75a4d327bb..f5e51c7988cb 100644
> --- a/drivers/gpu/drm/msm/dp/dp_link.c
> +++ b/drivers/gpu/drm/msm/dp/dp_link.c
> @@ -661,7 +661,6 @@ static int dp_link_parse_request(struct dp_link_private *link)
>  
>         DRM_DEBUG_DP("Test:(0x%x) requested\n", data);
>         link->request.test_requested = data;
> -
>         if (link->request.test_requested == DP_TEST_LINK_PHY_TEST_PATTERN) {
>                 ret = dp_link_parse_phy_test_params(link);
>                 if (ret)

Drop this hunk?
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
