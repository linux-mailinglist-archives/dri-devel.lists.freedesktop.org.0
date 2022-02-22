Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F994BEFC9
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 04:12:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17CDA10E5CD;
	Tue, 22 Feb 2022 03:12:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com
 [IPv6:2607:f8b0:4864:20::f2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 903E910E5CC
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Feb 2022 03:12:08 +0000 (UTC)
Received: by mail-qv1-xf2f.google.com with SMTP id a19so37624984qvm.4
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Feb 2022 19:12:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=m/6B+B7UG5l7grcPXjmFZNs3VMtSETSyJ5RAJWznySo=;
 b=ncqywT8vv8Cs6h4y38Tl4uwG0ONGqRYu9+XrJtI3HnsznPfueLJbDSHmN2nY5BPYgU
 O7H/OnqLJDC2GPN8OdebQelULG+gRknnMYmRfS7karkPy12mGSDuUQVR5j4snSq4/aiK
 R9QcTP4cdKhB7zVbyoM5djZA4ELariYuoSWQTNwOLbQXNt9YXlHKny0VfB+0+umT8TmD
 sOK5znhDo00zr3C59HU9qqoZZhB9okpgJ3thgyVc1TErzeTzx3v7qUJks9Swl3LATMD2
 o025axVK5BmKThGSlc6Iw1P3I4U8OuJY/jb+jHRYYoA3LAV0Fa6ORM15qei5uBVrq2Dt
 HZvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=m/6B+B7UG5l7grcPXjmFZNs3VMtSETSyJ5RAJWznySo=;
 b=NWfU2FKjqTnOcUzyXRGuU2NsMI11hT6qWpos5RpOp3tKthC/Fgak4L4/Fi4X8f4eDJ
 1/fL04qYkfv+BxPceCL2J8esFvgPMdtqVPoPZfUvs0W3xLTs1Lv4slOp5Ec0HN1QUpL5
 tVH/aK7LGWvznJbOdHaeNct/qm7+Y7WbyHyGGyqcQaKg3xdRHVduyBEqQW686pOiOBZ5
 E1XIqDhrZ4ndF5d/r5gRpqsrkaWIzknTVWqTHikpDryCgjdRiti/BojUTfgX9vyCbJix
 tDAuRCkxu5zJQHxvi5uoaMe6wR1/riK3+gfOY13T8JMxRTwX5i1HzkOzzt0ohm65OYFh
 +uwA==
X-Gm-Message-State: AOAM533ia+tdRHItbZtP2Mf8GljjjvqW/jnTsxBskj3sY2BHFWBEzog9
 VFQJ25o/uc4DYgMX5bodRlquBVPwoM+UHMRuGcFcQQ==
X-Google-Smtp-Source: ABdhPJyaVsEx82L/RPFAd5GysvoEeIprc6pwRwZixMUlGzOCblGkmETrVLiA2ga/7fU/R2DzLya05Bld+Z23M+nEIQw=
X-Received: by 2002:ac8:5713:0:b0:2de:4e16:5b25 with SMTP id
 19-20020ac85713000000b002de4e165b25mr702740qtw.682.1645499527486; Mon, 21 Feb
 2022 19:12:07 -0800 (PST)
MIME-Version: 1.0
References: <1645455086-9359-1-git-send-email-quic_vpolimer@quicinc.com>
 <1645455086-9359-2-git-send-email-quic_vpolimer@quicinc.com>
In-Reply-To: <1645455086-9359-2-git-send-email-quic_vpolimer@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 22 Feb 2022 05:51:02 +0300
Message-ID: <CAA8EJppRUZ5OHSMS1NdFXDDvRXJFNsdoJDWgU7ZPUoAW9OD+eQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] drm/msm/dp: Add basic PSR support for eDP
To: Vinod Polimera <quic_vpolimer@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: quic_kalyant@quicinc.com, devicetree@vger.kernel.org,
 quic_sbillaka@quicinc.com, dianders@chromium.org, sam@ravnborg.org,
 krzysztof.kozlowski@canonical.com, airlied@linux.ie,
 linux-arm-msm@vger.kernel.org, quic_vproddut@quicinc.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org, robh+dt@kernel.org, agross@kernel.org,
 seanpaul@chromium.org, thierry.reding@gmail.com, swboyd@chromium.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 21 Feb 2022 at 17:52, Vinod Polimera <quic_vpolimer@quicinc.com> wrote:
>
> Add support for basic panel self refresh (PSR) feature for eDP.
> Add a new interface to set PSR state in the sink from DPU.
> Program the eDP controller to issue PSR enter and exit SDP to
> the sink.
>
> Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
>
> Changes in v2:
>   - Use dp bridge to set psr entry/exit instead of dpu_enocder
>   - Don't modify whitespaces
>   - set self refresh aware from atomic_check
>   - set self refresh aware only if psr is supported
>   - provide a stub for msm_dp_display_set_psr
> ---
>  drivers/gpu/drm/msm/dp/dp_catalog.c |  81 +++++++++++++++++
>  drivers/gpu/drm/msm/dp/dp_catalog.h |   4 +
>  drivers/gpu/drm/msm/dp/dp_ctrl.c    |  63 +++++++++++++
>  drivers/gpu/drm/msm/dp/dp_ctrl.h    |   3 +
>  drivers/gpu/drm/msm/dp/dp_display.c |  14 +++
>  drivers/gpu/drm/msm/dp/dp_display.h |   1 +
>  drivers/gpu/drm/msm/dp/dp_drm.c     | 177 ++++++++++++++++++++++++++++++++++--
>  drivers/gpu/drm/msm/dp/dp_link.c    |  22 +++++
>  drivers/gpu/drm/msm/dp/dp_panel.c   |  21 +++++
>  drivers/gpu/drm/msm/dp/dp_panel.h   |   6 ++
>  drivers/gpu/drm/msm/dp/dp_reg.h     |  19 ++++
>  drivers/gpu/drm/msm/msm_drv.h       |   6 ++
>  12 files changed, 411 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
> index 8a6d3ea..3cd223d 100644
> --- a/drivers/gpu/drm/msm/dp/dp_catalog.c
> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
> @@ -45,6 +45,14 @@
>  #define DP_INTERRUPT_STATUS2_MASK \
>         (DP_INTERRUPT_STATUS2 << DP_INTERRUPT_STATUS_MASK_SHIFT)
>
> +#define DP_INTERRUPT_STATUS4 \
> +       (PSR_UPDATE_INT | PSR_CAPTURE_INT | PSR_EXIT_INT | \
> +       PSR_UPDATE_ERROR_INT | PSR_WAKE_ERROR_INT)
> +
> +#define DP_INTERRUPT_MASK4 \
> +       (PSR_UPDATE_MASK | PSR_CAPTURE_MASK | PSR_EXIT_MASK | \
> +       PSR_UPDATE_ERROR_MASK | PSR_WAKE_ERROR_MASK)
> +
>  struct dp_catalog_private {
>         struct device *dev;
>         struct dp_io *io;
> @@ -343,6 +351,20 @@ void dp_catalog_ctrl_lane_mapping(struct dp_catalog *dp_catalog)
>                         ln_mapping);
>  }
>
> +void dp_catalog_ctrl_psr_mainlink_enable(struct dp_catalog *dp_catalog,
> +                                               bool enable)
> +{
> +       u32 mainlink_ctrl;
> +       struct dp_catalog_private *catalog = container_of(dp_catalog,
> +                               struct dp_catalog_private, dp_catalog);
> +
> +       mainlink_ctrl = dp_read_link(catalog, REG_DP_MAINLINK_CTRL);
> +       mainlink_ctrl &= ~DP_MAINLINK_CTRL_ENABLE;
> +       mainlink_ctrl |= (enable & DP_MAINLINK_CTRL_ENABLE);
> +
> +       dp_write_link(catalog, REG_DP_MAINLINK_CTRL, mainlink_ctrl);
> +}
> +
>  void dp_catalog_ctrl_mainlink_ctrl(struct dp_catalog *dp_catalog,
>                                                 bool enable)
>  {
> @@ -581,6 +603,51 @@ void dp_catalog_ctrl_hpd_config(struct dp_catalog *dp_catalog)
>         dp_write_aux(catalog, REG_DP_DP_HPD_CTRL, DP_DP_HPD_CTRL_HPD_EN);
>  }
>
> +static void dp_catalog_enable_sdp(struct dp_catalog_private *catalog)
> +{
> +       /* trigger sdp */
> +       dp_write_link(catalog, MMSS_DP_SDP_CFG3, 0x1);
> +       dp_write_link(catalog, MMSS_DP_SDP_CFG3, 0x0);
> +}
> +
> +void dp_catalog_ctrl_config_psr(struct dp_catalog *dp_catalog)
> +{
> +       struct dp_catalog_private *catalog = container_of(dp_catalog,
> +                               struct dp_catalog_private, dp_catalog);
> +       u32 psr_config;
> +
> +       /* enable PSR1 function */
> +       psr_config = dp_read_link(catalog, REG_PSR_CONFIG);
> +       psr_config |= BIT(0);
> +       dp_write_link(catalog, REG_PSR_CONFIG, psr_config);
> +
> +       dp_write_ahb(catalog, REG_DP_INTR_MASK4, DP_INTERRUPT_MASK4);
> +       dp_catalog_enable_sdp(catalog);
> +}
> +
> +void dp_catalog_ctrl_set_psr(struct dp_catalog *dp_catalog, bool enter)
> +{
> +       struct dp_catalog_private *catalog = container_of(dp_catalog,
> +                       struct dp_catalog_private, dp_catalog);
> +       u32 psr_cmd;
> +
> +       psr_cmd = dp_read_link(catalog, REG_PSR_CMD);
> +
> +       /*
> +        * BIT(0) - send psr entry SDP
> +        * BIT(1) - sned psr exit SDP
> +        */
> +       psr_cmd &= ~(BIT(0) | BIT(1));
> +
> +       if (enter)
> +               psr_cmd |= BIT(0);
> +       else
> +               psr_cmd |= BIT(1);
> +
> +       dp_catalog_enable_sdp(catalog);
> +       dp_write_link(catalog, REG_PSR_CMD, psr_cmd);
> +}
> +
>  u32 dp_catalog_link_is_connected(struct dp_catalog *dp_catalog)
>  {
>         struct dp_catalog_private *catalog = container_of(dp_catalog,
> @@ -608,6 +675,20 @@ u32 dp_catalog_hpd_get_intr_status(struct dp_catalog *dp_catalog)
>         return isr;
>  }
>
> +int dp_catalog_ctrl_get_psr_interrupt(struct dp_catalog *dp_catalog)
> +{
> +       struct dp_catalog_private *catalog = container_of(dp_catalog,
> +                               struct dp_catalog_private, dp_catalog);
> +       u32 intr, intr_ack;
> +
> +       intr = dp_read_ahb(catalog, REG_DP_INTR_STATUS4);
> +       intr_ack = (intr & DP_INTERRUPT_STATUS4)
> +                       << DP_INTERRUPT_STATUS_ACK_SHIFT;
> +       dp_write_ahb(catalog, REG_DP_INTR_STATUS4, intr_ack);
> +
> +       return intr;
> +}
> +
>  int dp_catalog_ctrl_get_interrupt(struct dp_catalog *dp_catalog)
>  {
>         struct dp_catalog_private *catalog = container_of(dp_catalog,
> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
> index 6965afa..9b1b199 100644
> --- a/drivers/gpu/drm/msm/dp/dp_catalog.h
> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
> @@ -91,6 +91,7 @@ void dp_catalog_ctrl_state_ctrl(struct dp_catalog *dp_catalog, u32 state);
>  void dp_catalog_ctrl_config_ctrl(struct dp_catalog *dp_catalog, u32 config);
>  void dp_catalog_ctrl_lane_mapping(struct dp_catalog *dp_catalog);
>  void dp_catalog_ctrl_mainlink_ctrl(struct dp_catalog *dp_catalog, bool enable);
> +void dp_catalog_ctrl_psr_mainlink_enable(struct dp_catalog *dp_catalog, bool enable);
>  void dp_catalog_ctrl_config_misc(struct dp_catalog *dp_catalog, u32 cc, u32 tb);
>  void dp_catalog_ctrl_config_msa(struct dp_catalog *dp_catalog, u32 rate,
>                                 u32 stream_rate_khz, bool fixed_nvid);
> @@ -101,12 +102,15 @@ void dp_catalog_ctrl_enable_irq(struct dp_catalog *dp_catalog, bool enable);
>  void dp_catalog_hpd_config_intr(struct dp_catalog *dp_catalog,
>                         u32 intr_mask, bool en);
>  void dp_catalog_ctrl_hpd_config(struct dp_catalog *dp_catalog);
> +void dp_catalog_ctrl_config_psr(struct dp_catalog *dp_catalog);
> +void dp_catalog_ctrl_set_psr(struct dp_catalog *dp_catalog, bool enter);
>  u32 dp_catalog_link_is_connected(struct dp_catalog *dp_catalog);
>  u32 dp_catalog_hpd_get_intr_status(struct dp_catalog *dp_catalog);
>  void dp_catalog_ctrl_phy_reset(struct dp_catalog *dp_catalog);
>  int dp_catalog_ctrl_update_vx_px(struct dp_catalog *dp_catalog, u8 v_level,
>                                 u8 p_level);
>  int dp_catalog_ctrl_get_interrupt(struct dp_catalog *dp_catalog);
> +int dp_catalog_ctrl_get_psr_interrupt(struct dp_catalog *dp_catalog);
>  void dp_catalog_ctrl_update_transfer_unit(struct dp_catalog *dp_catalog,
>                                 u32 dp_tu, u32 valid_boundary,
>                                 u32 valid_boundary2);
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index 88ca6c3..ba828ea 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -21,6 +21,7 @@
>
>  #define DP_KHZ_TO_HZ 1000
>  #define IDLE_PATTERN_COMPLETION_TIMEOUT_JIFFIES        (30 * HZ / 1000) /* 30 ms */
> +#define PSR_OPERATION_COMPLETION_TIMEOUT_JIFFIES       (300 * HZ / 1000) /* 300 ms */
>  #define WAIT_FOR_VIDEO_READY_TIMEOUT_JIFFIES (HZ / 2)
>
>  #define DP_CTRL_INTR_READY_FOR_VIDEO     BIT(0)
> @@ -78,6 +79,7 @@ struct dp_ctrl_private {
>         struct dp_catalog *catalog;
>
>         struct completion idle_comp;
> +       struct completion psr_op_comp;
>         struct completion video_comp;
>  };
>
> @@ -151,6 +153,9 @@ static void dp_ctrl_config_ctrl(struct dp_ctrl_private *ctrl)
>         config |= DP_CONFIGURATION_CTRL_STATIC_DYNAMIC_CN;
>         config |= DP_CONFIGURATION_CTRL_SYNC_ASYNC_CLK;
>
> +       if (ctrl->panel->psr_cap.version)
> +               config |= DP_CONFIGURATION_CTRL_SEND_VSC;
> +
>         dp_catalog_ctrl_config_ctrl(ctrl->catalog, config);
>  }
>
> @@ -1365,6 +1370,52 @@ static int dp_ctrl_enable_stream_clocks(struct dp_ctrl_private *ctrl)
>         return ret;
>  }
>
> +void dp_ctrl_config_psr(struct dp_ctrl *dp_ctrl)
> +{
> +       struct dp_ctrl_private *ctrl;
> +       u8 psr_config;
> +
> +       ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
> +
> +       if (!ctrl->panel->psr_cap.version)
> +               return;
> +
> +       dp_catalog_ctrl_config_psr(ctrl->catalog);
> +
> +       psr_config = DP_PSR_ENABLE;
> +       drm_dp_dpcd_write(ctrl->aux, DP_PSR_EN_CFG, &psr_config, 1);
> +}
> +
> +void dp_ctrl_set_psr(struct dp_ctrl *dp_ctrl, bool enter)
> +{
> +       struct dp_ctrl_private *ctrl;
> +
> +       ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
> +
> +       if (!ctrl->panel->psr_cap.version)
> +               return;
> +
> +       if (enter) {
> +               reinit_completion(&ctrl->psr_op_comp);
> +               dp_catalog_ctrl_set_psr(ctrl->catalog, true);
> +
> +               if (!wait_for_completion_timeout(&ctrl->psr_op_comp,
> +                       PSR_OPERATION_COMPLETION_TIMEOUT_JIFFIES)) {
> +                       DRM_ERROR("PSR_ENTRY timedout\n");
> +                       dp_catalog_ctrl_set_psr(ctrl->catalog, false);
> +                       return;
> +               }
> +
> +               dp_catalog_ctrl_state_ctrl(ctrl->catalog, 0);
> +
> +               dp_catalog_ctrl_psr_mainlink_enable(ctrl->catalog, false);
> +       } else {
> +               dp_catalog_ctrl_psr_mainlink_enable(ctrl->catalog, true);
> +
> +               dp_catalog_ctrl_set_psr(ctrl->catalog, false);
> +       }
> +}
> +
>  int dp_ctrl_host_init(struct dp_ctrl *dp_ctrl, bool flip, bool reset)
>  {
>         struct dp_ctrl_private *ctrl;
> @@ -1964,6 +2015,17 @@ void dp_ctrl_isr(struct dp_ctrl *dp_ctrl)
>
>         ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
>
> +       if (ctrl->panel->psr_cap.version) {
> +               isr = dp_catalog_ctrl_get_psr_interrupt(ctrl->catalog);
> +
> +               if (isr == 0x1)
> +                       DRM_DEBUG_DP("PSR frame update done\n");
> +               else if (isr == 0x10)
> +                       DRM_DEBUG_DP("PSR exit done\n");
> +
> +               complete(&ctrl->psr_op_comp);
> +       }
> +
>         isr = dp_catalog_ctrl_get_interrupt(ctrl->catalog);
>
>         if (isr & DP_CTRL_INTR_READY_FOR_VIDEO) {
> @@ -2010,6 +2072,7 @@ struct dp_ctrl *dp_ctrl_get(struct device *dev, struct dp_link *link,
>                 dev_err(dev, "failed to add DP OPP table\n");
>
>         init_completion(&ctrl->idle_comp);
> +       init_completion(&ctrl->psr_op_comp);
>         init_completion(&ctrl->video_comp);
>
>         /* in parameters */
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
> index 2363a2d..f623035 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
> @@ -34,4 +34,7 @@ struct dp_ctrl *dp_ctrl_get(struct device *dev, struct dp_link *link,
>                         struct dp_power *power, struct dp_catalog *catalog,
>                         struct dp_parser *parser);
>
> +void dp_ctrl_set_psr(struct dp_ctrl *dp_ctrl, bool enable);
> +void dp_ctrl_config_psr(struct dp_ctrl *dp_ctrl);
> +
>  #endif /* _DP_CTRL_H_ */
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 5d314e6..c8d02fb 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -347,6 +347,8 @@ static int dp_display_process_hpd_high(struct dp_display_private *dp)
>
>         edid = dp->panel->edid;
>
> +       dp->dp_display.psr_supported = !!dp->panel->psr_cap.version;
> +
>         dp->audio_supported = drm_detect_monitor_audio(edid);
>         dp_panel_handle_sink_request(dp->panel);
>
> @@ -871,6 +873,10 @@ static int dp_display_post_enable(struct msm_dp *dp_display)
>
>         /* signal the connect event late to synchronize video and display */
>         dp_display_handle_plugged_change(dp_display, true);
> +
> +       if (dp_display->psr_supported)
> +               dp_ctrl_config_psr(dp->ctrl);
> +
>         return 0;
>  }
>
> @@ -1037,6 +1043,14 @@ static void dp_display_config_hpd(struct dp_display_private *dp)
>         enable_irq(dp->irq);
>  }
>
> +void msm_dp_display_set_psr(struct msm_dp *dp_display, bool enter)

If this function is used only by the dp code, there is no need to
pollute the msm_dp_* namespace.
Please rename to dp_display_set_psr() and remove declaration from msm_drv.h.

> +{
> +       struct dp_display_private *dp;
> +
> +       dp = container_of(dp_display, struct dp_display_private, dp_display);
> +       dp_ctrl_set_psr(dp->ctrl, enter);
> +}
> +
>  static int hpd_event_thread(void *data)
>  {
>         struct dp_display_private *dp_priv;
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
> index e3adcd5..6f512f3 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.h
> +++ b/drivers/gpu/drm/msm/dp/dp_display.h
> @@ -28,6 +28,7 @@ struct msm_dp {
>
>         u32 max_dp_lanes;
>         struct dp_audio *dp_audio;
> +       bool psr_supported;
>  };
>
>  int dp_display_set_plugged_cb(struct msm_dp *dp_display,
> diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
> index 2436329..d26ca6a 100644
> --- a/drivers/gpu/drm/msm/dp/dp_drm.c
> +++ b/drivers/gpu/drm/msm/dp/dp_drm.c
> @@ -142,6 +142,35 @@ static enum drm_mode_status edp_connector_mode_valid(
>         return MODE_OK;
>  }
>
> +
> +

Extra empty lines.

> +static int edp_connector_atomic_check(struct drm_connector *connector,
> +                                   struct drm_atomic_state *state)
> +{
> +       struct msm_dp *dp;
> +       struct drm_connector_state *conn_state;
> +       struct drm_crtc_state *crtc_state;
> +
> +       dp = to_dp_connector(connector)->dp_display;
> +       conn_state = drm_atomic_get_new_connector_state(state, connector);
> +       if (WARN_ON(!conn_state))
> +               return -ENODEV;
> +
> +       conn_state->self_refresh_aware = true;

I see that analogix bridge does the same. However I think it would be
better to set self_refresh_aware to true only if the actual attached
panel supports PSR.

> +
> +       if (!conn_state->crtc)
> +               return 0;
> +
> +       crtc_state = drm_atomic_get_new_crtc_state(state, conn_state->crtc);
> +       if (!crtc_state)
> +               return 0;
> +
> +       if (crtc_state->self_refresh_active && !dp->psr_supported)
> +               return -EINVAL;
> +
> +       return 0;
> +}
> +
>  static const struct drm_connector_funcs dp_connector_funcs = {
>         .detect = dp_connector_detect,
>         .fill_modes = drm_helper_probe_single_connector_modes,
> @@ -151,6 +180,11 @@ static const struct drm_connector_funcs dp_connector_funcs = {
>         .atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
>  };
>
> +static const struct drm_connector_helper_funcs dp_connector_helper_funcs = {
> +       .get_modes = dp_connector_get_modes,
> +       .mode_valid = dp_connector_mode_valid,
> +};
> +

Unnecessary movement.

>  static const struct drm_connector_funcs edp_connector_funcs = {
>         .fill_modes = drm_helper_probe_single_connector_modes,
>         .destroy = drm_connector_cleanup,
> @@ -159,12 +193,8 @@ static const struct drm_connector_funcs edp_connector_funcs = {
>         .atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
>  };
>
> -static const struct drm_connector_helper_funcs dp_connector_helper_funcs = {
> -       .get_modes = dp_connector_get_modes,
> -       .mode_valid = dp_connector_mode_valid,
> -};
> -
>  static const struct drm_connector_helper_funcs edp_connector_helper_funcs = {
> +       .atomic_check = edp_connector_atomic_check,
>         .get_modes = edp_connector_get_modes,
>         .mode_valid = edp_connector_mode_valid,
>  };
> @@ -258,6 +288,130 @@ static void dp_bridge_post_disable(struct drm_bridge *drm_bridge)
>         msm_dp_display_disable(dp_display, drm_bridge->encoder);
>  }
>
> +static struct drm_crtc *dp_bridge_get_old_connector_crtc(struct msm_dp *dp,
> +                                         struct drm_atomic_state *state)
> +{
> +       struct drm_encoder *encoder = dp->encoder;
> +       struct drm_connector *connector;
> +       struct drm_connector_state *conn_state;
> +
> +       connector = drm_atomic_get_old_connector_for_encoder(state, encoder);
> +       if (!connector)
> +               return NULL;
> +
> +       conn_state = drm_atomic_get_old_connector_state(state, connector);
> +       if (!conn_state)
> +               return NULL;
> +
> +       return conn_state->crtc;
> +}
> +
> +static struct drm_crtc *dp_bridge_get_new_connector_crtc(struct msm_dp *dp,
> +                                         struct drm_atomic_state *state)
> +{
> +       struct drm_encoder *encoder = dp->encoder;
> +       struct drm_connector *connector;
> +       struct drm_connector_state *conn_state;
> +
> +       connector = drm_atomic_get_new_connector_for_encoder(state, encoder);
> +       if (!connector)
> +               return NULL;
> +
> +       conn_state = drm_atomic_get_new_connector_state(state, connector);
> +       if (!conn_state)
> +               return NULL;
> +
> +       return conn_state->crtc;
> +}

This code being repeated over and over again deserves to become a new
atomic helper.
Please move it to drm_atomic.c or .h

> +
> +static void edp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
> +                               struct drm_bridge_state *old_bridge_state)
> +{
> +       struct drm_atomic_state *old_state = old_bridge_state->base.state;
> +       struct drm_crtc *crtc;
> +       struct drm_crtc_state *old_crtc_state;
> +       struct msm_dp_bridge *dp_bridge = to_dp_display(drm_bridge);
> +       struct msm_dp *dp_display = dp_bridge->dp_display;
> +
> +       crtc = dp_bridge_get_new_connector_crtc(dp_display, old_state);
> +       if (!crtc)
> +               return;
> +
> +       old_crtc_state = drm_atomic_get_old_crtc_state(old_state, crtc);

Generic remark to this and the following functions. I don't quite like
the idea of the bridge drivers poking into the crtc state. This looks
like a breach of layering.
The code looks similar to analogix'es one. Maybe we should consider
moving it into common helpers? This would require adding
enable/disable_srr as drm_bridge ops.
Or to introduce drm_bridge_helper_funcs.

> +
> +       /* Exit from self refresh mode */
> +       if (old_crtc_state && old_crtc_state->self_refresh_active) {
> +               msm_dp_display_set_psr(dp_display, false);
> +               return;
> +       }
> +
> +       msm_dp_display_enable(dp_display, drm_bridge->encoder);
> +}
> +
> +static void edp_bridge_atomic_disable(struct drm_bridge *drm_bridge,
> +                               struct drm_bridge_state *old_bridge_state)
> +{
> +       struct drm_atomic_state *old_state = old_bridge_state->base.state;
> +       struct drm_crtc *crtc;
> +       struct drm_crtc_state *new_crtc_state = NULL, *old_crtc_state = NULL;
> +       struct msm_dp_bridge *dp_bridge = to_dp_display(drm_bridge);
> +       struct msm_dp *dp_display = dp_bridge->dp_display;
> +
> +       crtc = dp_bridge_get_old_connector_crtc(dp_display, old_state);
> +       if (!crtc)
> +               goto out;
> +
> +       new_crtc_state = drm_atomic_get_new_crtc_state(old_state, crtc);
> +       if (!new_crtc_state)
> +               goto out;
> +
> +       old_crtc_state = drm_atomic_get_old_crtc_state(old_state, crtc);
> +       if (!old_crtc_state)
> +               goto out;
> +
> +       /*
> +        * Set self refresh mode if current crtc state is active.
> +        * If old crtc state is active, exit psr before disabling
> +        * the controller. Observed sink stuck in self refresh
> +        * if psr exit is skipped when screen off occurs with
> +        * sink in psr mode.
> +        */
> +       if (new_crtc_state->self_refresh_active) {
> +               msm_dp_display_set_psr(dp_display, true);
> +               return;
> +       } else if (old_crtc_state->self_refresh_active) {
> +               msm_dp_display_set_psr(dp_display, false);
> +               return;

I think the return here is wrong. Where do we support the case when
the old state was the PSR, but the new states tells us to disable the
crtc? If I understand the drm code correctly, it's a legit case.

> +       }
> +
> +out:
> +       msm_dp_display_pre_disable(dp_display, drm_bridge->encoder);
> +}
> +
> +static void edp_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
> +                               struct drm_bridge_state *old_bridge_state)
> +{
> +       struct drm_atomic_state *old_state = old_bridge_state->base.state;
> +       struct drm_crtc *crtc;
> +       struct drm_crtc_state *new_crtc_state = NULL;
> +       struct msm_dp_bridge *dp_bridge = to_dp_display(drm_bridge);
> +       struct msm_dp *dp_display = dp_bridge->dp_display;
> +
> +       crtc = dp_bridge_get_old_connector_crtc(dp_display, old_state);
> +       if (!crtc)
> +               return;
> +
> +       new_crtc_state = drm_atomic_get_new_crtc_state(old_state, crtc);
> +       if (!new_crtc_state)
> +               return;
> +
> +       /* Self refresh mode is set in dp_bridge_disable. Skip disable */

edp_bridge_atomic_disable?

> +       if (new_crtc_state->self_refresh_active)
> +               return;
> +
> +       msm_dp_display_disable(dp_display, drm_bridge->encoder);
> +}
> +
>  static const struct drm_bridge_funcs dp_bridge_ops = {
>         .enable       = dp_bridge_enable,
>         .disable      = dp_bridge_disable,
> @@ -265,6 +419,16 @@ static const struct drm_bridge_funcs dp_bridge_ops = {
>         .mode_set     = dp_bridge_mode_set,
>  };
>
> +static const struct drm_bridge_funcs edp_bridge_ops = {
> +       .atomic_enable       = edp_bridge_atomic_enable,
> +       .atomic_disable      = edp_bridge_atomic_disable,
> +       .atomic_post_disable = edp_bridge_atomic_post_disable,
> +       .mode_set     = dp_bridge_mode_set,
> +       .atomic_reset = drm_atomic_helper_bridge_reset,
> +       .atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
> +       .atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
> +};
> +
>  struct drm_bridge *msm_dp_bridge_init(struct msm_dp *dp_display, struct drm_device *dev,
>                         struct drm_encoder *encoder)
>  {
> @@ -279,7 +443,8 @@ struct drm_bridge *msm_dp_bridge_init(struct msm_dp *dp_display, struct drm_devi
>         dp_bridge->dp_display = dp_display;
>
>         bridge = &dp_bridge->bridge;
> -       bridge->funcs = &dp_bridge_ops;
> +       bridge->funcs = (dp_display->connector_type == DRM_MODE_CONNECTOR_eDP) ?
> +                               &edp_bridge_ops : &dp_bridge_ops;
>         bridge->encoder = encoder;
>
>         rc = drm_bridge_attach(encoder, bridge, NULL, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
> diff --git a/drivers/gpu/drm/msm/dp/dp_link.c b/drivers/gpu/drm/msm/dp/dp_link.c
> index d4d31e5..5503c29 100644
> --- a/drivers/gpu/drm/msm/dp/dp_link.c
> +++ b/drivers/gpu/drm/msm/dp/dp_link.c
> @@ -924,6 +924,26 @@ static int dp_link_process_phy_test_pattern_request(
>         return 0;
>  }
>
> +static int dp_link_psr_status(struct dp_link_private *link)
> +{
> +       u8 status[2];
> +
> +       drm_dp_dpcd_read(link->aux, DP_PSR_ERROR_STATUS, status, 2);
> +
> +       if (status[0] & DP_PSR_LINK_CRC_ERROR)
> +               DRM_ERROR("PSR LINK CRC ERROR\n");
> +       else if (status[0] & DP_PSR_RFB_STORAGE_ERROR)
> +               DRM_ERROR("PSR RFB STORAGE ERROR\n");
> +       else if (status[0] & DP_PSR_VSC_SDP_UNCORRECTABLE_ERROR)
> +               DRM_ERROR("PSR VSC SDP UNCORRECTABLE ERROR\n");
> +       else if (status[1] & DP_PSR_CAPS_CHANGE)
> +               DRM_INFO("PSR Capability Change\n");

DRM_DEBUG_DP

> +       else
> +               return 0;
> +
> +       return 1;
> +}
> +
>  static u8 get_link_status(const u8 link_status[DP_LINK_STATUS_SIZE], int r)
>  {
>         return link_status[r - DP_LANE0_1_STATUS];
> @@ -1042,6 +1062,8 @@ int dp_link_process_request(struct dp_link *dp_link)
>                 dp_link->sink_request |= DP_TEST_LINK_TRAINING;
>         } else if (!dp_link_process_phy_test_pattern_request(link)) {
>                 dp_link->sink_request |= DP_TEST_LINK_PHY_TEST_PATTERN;
> +       } else if (dp_link_psr_status(link)) {
> +               DRM_INFO("PSR IRQ_HPD received\n");

DRM_DEBUG_DP

>         } else {
>                 ret = dp_link_process_link_status_update(link);
>                 if (!ret) {
> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
> index 71db10c..e128d73 100644
> --- a/drivers/gpu/drm/msm/dp/dp_panel.c
> +++ b/drivers/gpu/drm/msm/dp/dp_panel.c
> @@ -19,6 +19,26 @@ struct dp_panel_private {
>         bool aux_cfg_update_done;
>  };
>
> +static void dp_panel_read_psr_cap(struct dp_panel_private *panel)
> +{
> +       ssize_t rlen;
> +       struct dp_panel *dp_panel;
> +
> +       dp_panel = &panel->dp_panel;
> +
> +       /* edp sink */
> +       if (dp_panel->dpcd[DP_EDP_CONFIGURATION_CAP]) {
> +               rlen = drm_dp_dpcd_read(panel->aux, DP_PSR_SUPPORT,
> +                               &dp_panel->psr_cap, 2);
> +               if (rlen == 2) {
> +                       DRM_DEBUG_DP("psr version: 0x%x, psr_cap: 0x%x\n",
> +                               dp_panel->psr_cap.version,
> +                               dp_panel->psr_cap.capabilities);
> +               } else
> +                       DRM_ERROR("failed to read psr info, rlen=%zd\n", rlen);
> +       }
> +}
> +
>  static int dp_panel_read_dpcd(struct dp_panel *dp_panel)
>  {
>         int rc = 0;
> @@ -104,6 +124,7 @@ static int dp_panel_read_dpcd(struct dp_panel *dp_panel)
>                 }
>         }
>
> +       dp_panel_read_psr_cap(panel);
>  end:
>         return rc;
>  }
> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h b/drivers/gpu/drm/msm/dp/dp_panel.h
> index 9023e5b..631657a 100644
> --- a/drivers/gpu/drm/msm/dp/dp_panel.h
> +++ b/drivers/gpu/drm/msm/dp/dp_panel.h
> @@ -34,6 +34,11 @@ struct dp_panel_in {
>         struct dp_catalog *catalog;
>  };
>
> +struct dp_panel_psr {
> +       u8 version;
> +       u8 capabilities;
> +};
> +
>  struct dp_panel {
>         /* dpcd raw data */
>         u8 dpcd[DP_RECEIVER_CAP_SIZE + 1];
> @@ -46,6 +51,7 @@ struct dp_panel {
>         struct edid *edid;
>         struct drm_connector *connector;
>         struct dp_display_mode dp_mode;
> +       struct dp_panel_psr psr_cap;
>         bool video_test;
>
>         u32 vic;
> diff --git a/drivers/gpu/drm/msm/dp/dp_reg.h b/drivers/gpu/drm/msm/dp/dp_reg.h
> index 2686028..7a0b052 100644
> --- a/drivers/gpu/drm/msm/dp/dp_reg.h
> +++ b/drivers/gpu/drm/msm/dp/dp_reg.h
> @@ -22,6 +22,20 @@
>  #define REG_DP_INTR_STATUS2                    (0x00000024)
>  #define REG_DP_INTR_STATUS3                    (0x00000028)
>
> +#define REG_DP_INTR_STATUS4                    (0x0000002C)
> +#define PSR_UPDATE_INT                         (0x00000001)
> +#define PSR_CAPTURE_INT                                (0x00000004)
> +#define PSR_EXIT_INT                           (0x00000010)
> +#define PSR_UPDATE_ERROR_INT                   (0x00000040)
> +#define PSR_WAKE_ERROR_INT                     (0x00000100)
> +
> +#define REG_DP_INTR_MASK4                      (0x00000030)
> +#define PSR_UPDATE_MASK                                (0x00000001)
> +#define PSR_CAPTURE_MASK                       (0x00000002)
> +#define PSR_EXIT_MASK                          (0x00000004)
> +#define PSR_UPDATE_ERROR_MASK                  (0x00000008)
> +#define PSR_WAKE_ERROR_MASK                    (0x00000010)
> +
>  #define REG_DP_DP_HPD_CTRL                     (0x00000000)
>  #define DP_DP_HPD_CTRL_HPD_EN                  (0x00000001)
>
> @@ -164,6 +178,9 @@
>  #define MMSS_DP_AUDIO_TIMING_RBR_48            (0x00000094)
>  #define MMSS_DP_AUDIO_TIMING_HBR_48            (0x00000098)
>
> +#define REG_PSR_CONFIG                         (0x00000100)
> +#define REG_PSR_CMD                            (0x00000110)
> +
>  #define MMSS_DP_PSR_CRC_RG                     (0x00000154)
>  #define MMSS_DP_PSR_CRC_B                      (0x00000158)
>
> @@ -184,6 +201,8 @@
>  #define MMSS_DP_AUDIO_STREAM_0                 (0x00000240)
>  #define MMSS_DP_AUDIO_STREAM_1                 (0x00000244)
>
> +#define MMSS_DP_SDP_CFG3                       (0x0000024c)
> +
>  #define MMSS_DP_EXTENSION_0                    (0x00000250)
>  #define MMSS_DP_EXTENSION_1                    (0x00000254)
>  #define MMSS_DP_EXTENSION_2                    (0x00000258)
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> index ae52412..254fd07 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -400,6 +400,8 @@ void msm_dp_snapshot(struct msm_disp_state *disp_state, struct msm_dp *dp_displa
>
>  void msm_dp_debugfs_init(struct msm_dp *dp_display, struct drm_minor *minor);
>
> +void msm_dp_display_set_psr(struct msm_dp *dp, bool enter);
> +
>  #else
>  static inline int __init msm_dp_register(void)
>  {
> @@ -449,6 +451,10 @@ static inline void msm_dp_debugfs_init(struct msm_dp *dp_display,
>  {
>  }
>
> +static inline void msm_dp_display_set_psr(struct msm_dp *dp, bool enter)
> +{
> +}
> +
>  #endif
>
>  void __init msm_mdp_register(void);
> --
> 2.7.4
>


-- 
With best wishes
Dmitry
