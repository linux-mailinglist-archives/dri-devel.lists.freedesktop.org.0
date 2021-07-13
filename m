Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E6D63C7524
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jul 2021 18:43:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BF9E6E0FE;
	Tue, 13 Jul 2021 16:43:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 616FD6E0FE;
 Tue, 13 Jul 2021 16:43:29 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 o30-20020a05600c511eb029022e0571d1a0so435398wms.5; 
 Tue, 13 Jul 2021 09:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mM+jP6OQLlXesn4C9iXQXXRHsRjnBpEKRLW+loGck3w=;
 b=XZm/1Sc+BCW5aq7EPfwluDxja+dcblnOaVBWfG5yb4mnbqUhNjwSui9tk+aeZ+vgkZ
 op782tSVbdq/q6GK/0O/7VmIj4AuzaGsLWsoHPLknUBIS8nK07Sx1AP94j5ItLBJzE6C
 yhoS/Qg/HEnKif2GuQrighr129U8pm4gOnvL48aJl/HmkksA/43HUj59OWWqwrhfiUEZ
 5YfnLvqVAxjxpfQuXfA1FNxGsBh0KMjKNlDpMEiKCqhIYOD35jhKfwokC5rJLmBIlRUI
 r3fMKQPHXZQbLxm5ifT2Wmfois950NR8YRUd0q2S8H/89Up4CToE2hoTMvKa6Pramd4d
 CQEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mM+jP6OQLlXesn4C9iXQXXRHsRjnBpEKRLW+loGck3w=;
 b=IWO6HgOv+Twx4Uv/vZZfd+ivbWFUjQ4lm5Zu6NBhY7ADPLO+p7fPTUo90/oGsUqyNJ
 PntvtF+NCpR+zsdaHo6jhO2fs40z96+NQTOBIGTK57q0VH3IXaeETbJpJlxtkYY+I+dQ
 DUK/0xJSQ+eiZJBOoSL95dsFi9AatM8sZkphS0ZMiBTPo+aEcCbMBtpS/G4h7zA1A38D
 buNQ5ejDqv7FzsZ/FV6VglgyWhKPSKGaiShHPQ70kpRhfSZRwjz0ohxxT+JOQk2bU0jX
 M6i38Lng+UQ1NH/qikAqLXIWstL2GoDaswZuJ6FQIUQM/4D3wqo0Hl+jwOmyrIUYp7RJ
 yYrA==
X-Gm-Message-State: AOAM532nzN1vNgmBH7GAfP8FovELSvCY+p27Omny7OWJNCEKCluacszt
 QA5m6vqBs2c92wqXfhHyROOM1UkBTjASLGjqliw=
X-Google-Smtp-Source: ABdhPJxnipha/nrz8d8rBv1cnSwRPB1aJSb8JQjuakvDq/IMb1O31b4MPwrarp089qmHLUn/k+SljusPifOv8MAeGkw=
X-Received: by 2002:a1c:25c6:: with SMTP id l189mr295884wml.49.1626194607980; 
 Tue, 13 Jul 2021 09:43:27 -0700 (PDT)
MIME-Version: 1.0
References: <1624993464-20447-1-git-send-email-abhinavk@codeaurora.org>
In-Reply-To: <1624993464-20447-1-git-send-email-abhinavk@codeaurora.org>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 13 Jul 2021 09:47:34 -0700
Message-ID: <CAF6AEGvnWvcgnVoSYLYTougJsqy_BBH6mAkFk2wSFag+AkUCkg@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH] drm/msm/dsi: add support for dsi test pattern
 generator
To: Abhinav Kumar <abhinavk@codeaurora.org>
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
Cc: linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Kuogee Hsieh <khsieh@codeaurora.org>,
 Sean Paul <seanpaul@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, aravindh@codeaurora.org,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 29, 2021 at 12:04 PM Abhinav Kumar <abhinavk@codeaurora.org> wrote:
>
> During board bringups its useful to have a DSI test pattern
> generator to isolate a DPU vs a DSI issue and focus on the relevant
> hardware block.
>
> To facilitate this, add an API which triggers the DSI controller
> test pattern. The expected output is a rectangular checkered pattern.
>
> This has been validated on a single DSI video mode panel by calling it
> right after drm_panel_enable() which is also the ideal location to use
> this as the DSI host and the panel have been initialized by then.
>
> Further validation on dual DSI and command mode panel is pending.
> If there are any fix ups needed for those, it shall be applied on top
> of this change.
>
> Signed-off-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/dsi/dsi.h         |  3 ++
>  drivers/gpu/drm/msm/dsi/dsi.xml.h     |  9 ++++++
>  drivers/gpu/drm/msm/dsi/dsi_host.c    | 53 +++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/dsi/dsi_manager.c | 13 +++++++++
>  4 files changed, 78 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/dsi/dsi.h b/drivers/gpu/drm/msm/dsi/dsi.h
> index 9b8e9b0..663ccbd 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi.h
> +++ b/drivers/gpu/drm/msm/dsi/dsi.h
> @@ -84,6 +84,7 @@ void msm_dsi_manager_setup_encoder(int id);
>  int msm_dsi_manager_register(struct msm_dsi *msm_dsi);
>  void msm_dsi_manager_unregister(struct msm_dsi *msm_dsi);
>  bool msm_dsi_manager_validate_current_config(u8 id);
> +void msm_dsi_manager_tpg_enable(void);
>
>  /* msm dsi */
>  static inline bool msm_dsi_device_connected(struct msm_dsi *msm_dsi)
> @@ -148,6 +149,8 @@ int dsi_clk_init_6g_v2(struct msm_dsi_host *msm_host);
>  int dsi_calc_clk_rate_v2(struct msm_dsi_host *msm_host, bool is_dual_dsi);
>  int dsi_calc_clk_rate_6g(struct msm_dsi_host *msm_host, bool is_dual_dsi);
>  void msm_dsi_host_snapshot(struct msm_disp_state *disp_state, struct mipi_dsi_host *host);
> +void msm_dsi_host_test_pattern_en(struct mipi_dsi_host *host);
> +
>  /* dsi phy */
>  struct msm_dsi_phy;
>  struct msm_dsi_phy_shared_timings {
> diff --git a/drivers/gpu/drm/msm/dsi/dsi.xml.h b/drivers/gpu/drm/msm/dsi/dsi.xml.h
> index eadbcc7..f7dcf49 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi.xml.h
> +++ b/drivers/gpu/drm/msm/dsi/dsi.xml.h
> @@ -624,6 +624,15 @@ static inline uint32_t DSI_RDBK_DATA_CTRL_COUNT(uint32_t val)
>  #define REG_DSI_VERSION                                                0x000001f0
>  #define DSI_VERSION_MAJOR__MASK                                        0xff000000
>  #define DSI_VERSION_MAJOR__SHIFT                               24
> +
> +#define REG_DSI_TEST_PATTERN_GEN_VIDEO_INIT_VAL 0x00000160
> +#define REG_DSI_TPG_MAIN_CONTROL                               0x00000198
> +#define REG_DSI_TPG_VIDEO_CONFIG                               0x000001a0
> +#define REG_DSI_TEST_PATTERN_GEN_CTRL                  0x00000158
> +#define REG_DSI_TEST_PATTERN_GEN_CMD_MDP_INIT_VAL0     0x00000168
> +#define REG_DSI_TEST_PATTERN_GEN_CMD_STREAM0_TRIGGER   0x00000180
> +#define REG_DSI_TPG_MAIN_CONTROL2                              0x0000019c

We should add these in dsi.xml (either in
mesa.git/src/freedreno/registers/dsi/dsi.xml or in
envytools.git/registers/dsi/dsi.xml) and regenerate dsi.xml.h

And if possible, it would be nice to define the bitfields instead of
just open-coding the register values

BR,
-R

> +
>  static inline uint32_t DSI_VERSION_MAJOR(uint32_t val)
>  {
>         return ((val) << DSI_VERSION_MAJOR__SHIFT) & DSI_VERSION_MAJOR__MASK;
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index ed504fe..24d44b0 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -2495,3 +2495,56 @@ void msm_dsi_host_snapshot(struct msm_disp_state *disp_state, struct mipi_dsi_ho
>
>         pm_runtime_put_sync(&msm_host->pdev->dev);
>  }
> +
> +static void msm_dsi_host_video_test_pattern_setup(struct msm_dsi_host *msm_host)
> +{
> +       u32 reg;
> +
> +       reg = dsi_read(msm_host, REG_DSI_TEST_PATTERN_GEN_CTRL);
> +
> +       dsi_write(msm_host, REG_DSI_TEST_PATTERN_GEN_VIDEO_INIT_VAL, 0xff);
> +       /* draw checkered rectangle pattern */
> +       dsi_write(msm_host, REG_DSI_TPG_MAIN_CONTROL, 0x100);
> +       /* use 24-bit RGB test pttern */
> +       dsi_write(msm_host, REG_DSI_TPG_VIDEO_CONFIG, 0x5);
> +
> +       reg |= (0x3 << 4);
> +       dsi_write(msm_host, REG_DSI_TEST_PATTERN_GEN_CTRL, reg);
> +
> +       DBG("Video test pattern setup done\n");
> +}
> +
> +static void msm_dsi_host_cmd_test_pattern_setup(struct msm_dsi_host *msm_host)
> +{
> +       u32 reg;
> +
> +       reg = dsi_read(msm_host, REG_DSI_TEST_PATTERN_GEN_CTRL);
> +
> +       dsi_write(msm_host, REG_DSI_TEST_PATTERN_GEN_CMD_MDP_INIT_VAL0, 0xff);
> +
> +       reg |= (0x3 << 0x8);
> +       dsi_write(msm_host, REG_DSI_TEST_PATTERN_GEN_CTRL, reg);
> +       /* draw checkered rectangle pattern */
> +       dsi_write(msm_host, REG_DSI_TPG_MAIN_CONTROL2, (0x1 << 0x7));
> +       DBG("Cmd test pattern setup done\n");
> +}
> +
> +void msm_dsi_host_test_pattern_en(struct mipi_dsi_host *host)
> +{
> +       struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
> +       bool is_video_mode = !!(msm_host->mode_flags & MIPI_DSI_MODE_VIDEO);
> +       u32 reg;
> +
> +       if (is_video_mode)
> +               msm_dsi_host_video_test_pattern_setup(msm_host);
> +       else
> +               msm_dsi_host_cmd_test_pattern_setup(msm_host);
> +
> +       reg = dsi_read(msm_host, REG_DSI_TEST_PATTERN_GEN_CTRL);
> +       /* enable the test pattern generator */
> +       dsi_write(msm_host, REG_DSI_TEST_PATTERN_GEN_CTRL, (reg | BIT(0)));
> +
> +       /* for command mode need to trigger one frame from tpg */
> +       if (!is_video_mode)
> +               dsi_write(msm_host, REG_DSI_TEST_PATTERN_GEN_CMD_STREAM0_TRIGGER, 0x1);
> +}
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> index 4ebfedc..db80de6 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> @@ -441,6 +441,19 @@ static void dsi_mgr_bridge_pre_enable(struct drm_bridge *bridge)
>         return;
>  }
>
> +void msm_dsi_manager_tpg_enable(void)
> +{
> +       struct msm_dsi *m_dsi = dsi_mgr_get_dsi(DSI_0);
> +       struct msm_dsi *s_dsi = dsi_mgr_get_dsi(DSI_1);
> +
> +       /* if dual dsi, trigger tpg on master first then slave */
> +       if (m_dsi) {
> +               msm_dsi_host_test_pattern_en(m_dsi->host);
> +               if (IS_DUAL_DSI() && s_dsi)
> +                       msm_dsi_host_test_pattern_en(s_dsi->host);
> +       }
> +}
> +
>  static void dsi_mgr_bridge_enable(struct drm_bridge *bridge)
>  {
>         int id = dsi_mgr_bridge_get_id(bridge);
> --
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
>
> _______________________________________________
> Freedreno mailing list
> Freedreno@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/freedreno
