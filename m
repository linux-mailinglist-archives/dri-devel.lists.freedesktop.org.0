Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF3E70CCA1
	for <lists+dri-devel@lfdr.de>; Mon, 22 May 2023 23:39:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 878EE10E156;
	Mon, 22 May 2023 21:39:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com
 [IPv6:2607:f8b0:4864:20::1134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95D3A10E156
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 21:39:45 +0000 (UTC)
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-561bd0d31c1so57925727b3.0
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 14:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684791583; x=1687383583;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=yD4zfUk9vpnEy1wIqYzjUGIqvKrzAnasqXbBWIwAtbE=;
 b=NBNfOFLXx7VH0QBdHxgcutL+Urmh+l+H3lZcHGWDXD/w7zuAmucZuSEoG5jTTDsblo
 DnOUZtbkc4StbDmPQZ8b9rp2X27dp35Jl06ObKvsbpRrgRSk6gT+oklQSkwo/DFtEhwR
 hdzgaZaRrSKPkPUnExacwxbEUiqait3+O/MMjlyfa3ajeIiiBTslkBU971sBqrfXjKs5
 mFJBaEKK28fFBZOsMoz6zFx7iDKTcUjQvUwwU+Oc6Cfr776nShMc3UdIhqxiMgh8JKRz
 p8EhQDnCLJKT+pWkuumDFU0CtuSSVJ5b91vSBqrN1TQIPDm/3jBmrYsxzQ2AdPIyAtDd
 jCKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684791583; x=1687383583;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yD4zfUk9vpnEy1wIqYzjUGIqvKrzAnasqXbBWIwAtbE=;
 b=WsBfwmnQ897GDo669uo8hLmRNNs1Tu5S6vqfd4B6aggptv8y93x6iKYWQ16Jk+3mf6
 0aS2nQEdtvsLe5osE1YZpQPAqgULfE9IcAfsdO+jOAiDFecn6bvfubvgT5SyFCGEtqnP
 9oH5XXgzy8tSKcHggNu/Q15Ce+NDGbCwRIqcBdrXBRPnuCN6slr6g6Iz47RNSuFFc7a+
 BQyIlhW+yPqb4a7FBXaYhhPp9AHS4FqLI03oCeTdlHUUv3UkDQhJng+E0bCli1oZ9s5c
 vIQwz7sSSByN+2Z5zMXiqUe3BSF5+HDD5xsMuhSXyZ/K+2MTz9T9cb0npYRS8gp1X81l
 +snQ==
X-Gm-Message-State: AC+VfDxynaLmDVhNvLbLfGq0IYBcl4AvXPP9ZMj9Mi07aekWmmNa5shH
 Mo9+nkvOq4mvjMu/10NQouHum1XeJoBxaDJ9KXy4cg==
X-Google-Smtp-Source: ACHHUZ6Vrsb3R3bh+4v8zZ9fkn4gN1vr6nJGKUpWXzmVEgP7NDoynj6j6syAX/Mutv+PD9SYk7Jpao+7EUzi5fGCftY=
X-Received: by 2002:a0d:dd01:0:b0:561:9051:d2d3 with SMTP id
 g1-20020a0ddd01000000b005619051d2d3mr13622724ywe.11.1684791583389; Mon, 22
 May 2023 14:39:43 -0700 (PDT)
MIME-Version: 1.0
References: <1684791092-1822-1-git-send-email-quic_khsieh@quicinc.com>
In-Reply-To: <1684791092-1822-1-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 23 May 2023 00:39:32 +0300
Message-ID: <CAA8EJpq9a71UN9p3DgdxudHtRR1sCSQdFmX=FAXgCLkPVw3oNQ@mail.gmail.com>
Subject: Re: [PATCH v3] drm/msm/dp: enable HDP plugin/unplugged interrupts at
 hpd_enable/disable
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
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
Cc: freedreno@lists.freedesktop.org, quic_sbillaka@quicinc.com,
 linux-kernel@vger.kernel.org, quic_abhinavk@quicinc.com, andersson@kernel.org,
 dri-devel@lists.freedesktop.org, dianders@chromium.org, vkoul@kernel.org,
 agross@kernel.org, quic_jesszhan@quicinc.com, marijn.suijten@somainline.org,
 swboyd@chromium.org, sean@poorly.run, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 23 May 2023 at 00:31, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
> The internal_hpd flag is set to true by dp_bridge_hpd_enable() and set to
> false by dp_bridge_hpd_disable() to handle GPIO pinmuxed into DP controller
> case. HDP related interrupts can not be enabled until internal_hpd is set
> to true. At current implementation dp_display_config_hpd() will initialize
> DP host controller first followed by enabling HDP related interrupts if
> internal_hpd was true at that time. Enable HDP related interrupts depends on
> internal_hpd status may leave system with DP driver host is in running state
> but without HDP related interrupts being enabled. This will prevent external
> display from being detected. Eliminated this dependency by moving HDP related
> interrupts enable/disable be done at dp_bridge_hpd_enable/disable() directly
> regardless of internal_hpd status.
>
> Changes in V3:
> -- dp_catalog_ctrl_hpd_enable() and dp_catalog_ctrl_hpd_disable()
> -- rewording ocmmit text
>
> Fixes: cd198caddea7 ("drm/msm/dp: Rely on hpd_enable/disable callbacks")
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_catalog.c | 15 +++++++-
>  drivers/gpu/drm/msm/dp/dp_catalog.h |  3 +-
>  drivers/gpu/drm/msm/dp/dp_display.c | 70 +++++++++++--------------------------
>  3 files changed, 37 insertions(+), 51 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
> index 7a8cf1c..5142aeb 100644
> --- a/drivers/gpu/drm/msm/dp/dp_catalog.c
> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
> @@ -620,7 +620,7 @@ void dp_catalog_hpd_config_intr(struct dp_catalog *dp_catalog,
>                                 config & DP_DP_HPD_INT_MASK);
>  }
>
> -void dp_catalog_ctrl_hpd_config(struct dp_catalog *dp_catalog)
> +void dp_catalog_ctrl_hpd_enable(struct dp_catalog *dp_catalog)
>  {
>         struct dp_catalog_private *catalog = container_of(dp_catalog,
>                                 struct dp_catalog_private, dp_catalog);
> @@ -635,6 +635,19 @@ void dp_catalog_ctrl_hpd_config(struct dp_catalog *dp_catalog)
>         dp_write_aux(catalog, REG_DP_DP_HPD_CTRL, DP_DP_HPD_CTRL_HPD_EN);
>  }
>
> +void dp_catalog_ctrl_hpd_disable(struct dp_catalog *dp_catalog)
> +{
> +       struct dp_catalog_private *catalog = container_of(dp_catalog,
> +                               struct dp_catalog_private, dp_catalog);
> +
> +       u32 reftimer = dp_read_aux(catalog, REG_DP_DP_HPD_REFTIMER);
> +
> +       reftimer &= ~DP_DP_HPD_REFTIMER_ENABLE;
> +       dp_write_aux(catalog, REG_DP_DP_HPD_REFTIMER, reftimer);
> +
> +       dp_write_aux(catalog, REG_DP_DP_HPD_CTRL, 0);
> +}
> +
>  static void dp_catalog_enable_sdp(struct dp_catalog_private *catalog)
>  {
>         /* trigger sdp */
> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
> index 82376a2..38786e8 100644
> --- a/drivers/gpu/drm/msm/dp/dp_catalog.h
> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
> @@ -104,7 +104,8 @@ bool dp_catalog_ctrl_mainlink_ready(struct dp_catalog *dp_catalog);
>  void dp_catalog_ctrl_enable_irq(struct dp_catalog *dp_catalog, bool enable);
>  void dp_catalog_hpd_config_intr(struct dp_catalog *dp_catalog,
>                         u32 intr_mask, bool en);
> -void dp_catalog_ctrl_hpd_config(struct dp_catalog *dp_catalog);
> +void dp_catalog_ctrl_hpd_enable(struct dp_catalog *dp_catalog);
> +void dp_catalog_ctrl_hpd_disable(struct dp_catalog *dp_catalog);
>  void dp_catalog_ctrl_config_psr(struct dp_catalog *dp_catalog);
>  void dp_catalog_ctrl_set_psr(struct dp_catalog *dp_catalog, bool enter);
>  u32 dp_catalog_link_is_connected(struct dp_catalog *dp_catalog);
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 3e13acdf..69bbc5f 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -615,12 +615,6 @@ static int dp_hpd_plug_handle(struct dp_display_private *dp, u32 data)
>                 dp->hpd_state = ST_MAINLINK_READY;
>         }
>
> -       /* enable HDP irq_hpd/replug interrupt */
> -       if (dp->dp_display.internal_hpd)
> -               dp_catalog_hpd_config_intr(dp->catalog,
> -                                          DP_DP_IRQ_HPD_INT_MASK | DP_DP_HPD_REPLUG_INT_MASK,
> -                                          true);
> -
>         drm_dbg_dp(dp->drm_dev, "After, type=%d hpd_state=%d\n",
>                         dp->dp_display.connector_type, state);
>         mutex_unlock(&dp->event_mutex);
> @@ -658,12 +652,6 @@ static int dp_hpd_unplug_handle(struct dp_display_private *dp, u32 data)
>         drm_dbg_dp(dp->drm_dev, "Before, type=%d hpd_state=%d\n",
>                         dp->dp_display.connector_type, state);
>
> -       /* disable irq_hpd/replug interrupts */
> -       if (dp->dp_display.internal_hpd)
> -               dp_catalog_hpd_config_intr(dp->catalog,
> -                                          DP_DP_IRQ_HPD_INT_MASK | DP_DP_HPD_REPLUG_INT_MASK,
> -                                          false);
> -
>         /* unplugged, no more irq_hpd handle */
>         dp_del_event(dp, EV_IRQ_HPD_INT);
>
> @@ -687,10 +675,6 @@ static int dp_hpd_unplug_handle(struct dp_display_private *dp, u32 data)
>                 return 0;
>         }
>
> -       /* disable HPD plug interrupts */
> -       if (dp->dp_display.internal_hpd)
> -               dp_catalog_hpd_config_intr(dp->catalog, DP_DP_HPD_PLUG_INT_MASK, false);
> -
>         /*
>          * We don't need separate work for disconnect as
>          * connect/attention interrupts are disabled
> @@ -706,10 +690,6 @@ static int dp_hpd_unplug_handle(struct dp_display_private *dp, u32 data)
>         /* signal the disconnect event early to ensure proper teardown */
>         dp_display_handle_plugged_change(&dp->dp_display, false);
>
> -       /* enable HDP plug interrupt to prepare for next plugin */
> -       if (dp->dp_display.internal_hpd)
> -               dp_catalog_hpd_config_intr(dp->catalog, DP_DP_HPD_PLUG_INT_MASK, true);
> -
>         drm_dbg_dp(dp->drm_dev, "After, type=%d hpd_state=%d\n",
>                         dp->dp_display.connector_type, state);
>
> @@ -1082,26 +1062,6 @@ void msm_dp_snapshot(struct msm_disp_state *disp_state, struct msm_dp *dp)
>         mutex_unlock(&dp_display->event_mutex);
>  }
>
> -static void dp_display_config_hpd(struct dp_display_private *dp)
> -{
> -
> -       dp_display_host_init(dp);
> -       dp_catalog_ctrl_hpd_config(dp->catalog);
> -
> -       /* Enable plug and unplug interrupts only if requested */
> -       if (dp->dp_display.internal_hpd)
> -               dp_catalog_hpd_config_intr(dp->catalog,
> -                               DP_DP_HPD_PLUG_INT_MASK |
> -                               DP_DP_HPD_UNPLUG_INT_MASK,
> -                               true);
> -
> -       /* Enable interrupt first time
> -        * we are leaving dp clocks on during disconnect
> -        * and never disable interrupt
> -        */
> -       enable_irq(dp->irq);
> -}
> -
>  void dp_display_set_psr(struct msm_dp *dp_display, bool enter)
>  {
>         struct dp_display_private *dp;
> @@ -1176,7 +1136,7 @@ static int hpd_event_thread(void *data)
>
>                 switch (todo->event_id) {
>                 case EV_HPD_INIT_SETUP:
> -                       dp_display_config_hpd(dp_priv);
> +                       dp_display_host_init(dp_priv);
>                         break;
>                 case EV_HPD_PLUG_INT:
>                         dp_hpd_plug_handle(dp_priv, todo->data);
> @@ -1394,13 +1354,8 @@ static int dp_pm_resume(struct device *dev)
>         /* turn on dp ctrl/phy */
>         dp_display_host_init(dp);
>
> -       dp_catalog_ctrl_hpd_config(dp->catalog);
> -
> -       if (dp->dp_display.internal_hpd)
> -               dp_catalog_hpd_config_intr(dp->catalog,
> -                               DP_DP_HPD_PLUG_INT_MASK |
> -                               DP_DP_HPD_UNPLUG_INT_MASK,
> -                               true);
> +       if (dp_display->is_edp)
> +               dp_catalog_ctrl_hpd_enable(dp->catalog);
>
>         if (dp_catalog_link_is_connected(dp->catalog)) {
>                 /*
> @@ -1568,7 +1523,7 @@ static int dp_display_get_next_bridge(struct msm_dp *dp)
>
>         if (aux_bus && dp->is_edp) {
>                 dp_display_host_init(dp_priv);
> -               dp_catalog_ctrl_hpd_config(dp_priv->catalog);
> +               dp_catalog_ctrl_hpd_enable(dp_priv->catalog);
>                 dp_display_host_phy_init(dp_priv);
>                 enable_irq(dp_priv->irq);
>
> @@ -1801,16 +1756,33 @@ void dp_bridge_hpd_enable(struct drm_bridge *bridge)
>  {
>         struct msm_dp_bridge *dp_bridge = to_dp_bridge(bridge);
>         struct msm_dp *dp_display = dp_bridge->dp_display;
> +       struct dp_display_private *dp = container_of(dp_display, struct dp_display_private, dp_display);
> +
> +       mutex_lock(&dp->event_mutex);
> +       dp_catalog_ctrl_hpd_enable(dp->catalog);
> +
> +       /* enable HDP interrupts */
> +       dp_catalog_hpd_config_intr(dp->catalog, DP_DP_HPD_INT_MASK, true);
> +
> +       enable_irq(dp->irq);
>
>         dp_display->internal_hpd = true;
> +       mutex_unlock(&dp->event_mutex);
>  }
>
>  void dp_bridge_hpd_disable(struct drm_bridge *bridge)
>  {
>         struct msm_dp_bridge *dp_bridge = to_dp_bridge(bridge);
>         struct msm_dp *dp_display = dp_bridge->dp_display;
> +       struct dp_display_private *dp = container_of(dp_display, struct dp_display_private, dp_display);
> +
> +       mutex_lock(&dp->event_mutex);
> +       /* disable HDP interrupts */

Should there be a disable_irq? Or maybe it would  be simpler to keep
IRQ always enabled from the time of request_irq. There is a window
when the IRQ is enabled between request_irq and disable_irq.

> +       dp_catalog_hpd_config_intr(dp->catalog, DP_DP_HPD_INT_MASK, false);
> +       dp_catalog_ctrl_hpd_disable(dp->catalog);
>
>         dp_display->internal_hpd = false;
> +       mutex_unlock(&dp->event_mutex);
>  }
>
>  void dp_bridge_hpd_notify(struct drm_bridge *bridge,
> --
> 2.7.4
>


-- 
With best wishes
Dmitry
