Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 00CCB4369F0
	for <lists+dri-devel@lfdr.de>; Thu, 21 Oct 2021 20:02:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D6026ECEB;
	Thu, 21 Oct 2021 18:02:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61DC86ECEB
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Oct 2021 18:02:24 +0000 (UTC)
Received: by mail-ot1-x335.google.com with SMTP id
 s18-20020a0568301e1200b0054e77a16651so1404560otr.7
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Oct 2021 11:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=Cm50m8z6CYr/VmhG+kR+5QTJjWplQ0LeVI88QEFCusg=;
 b=AfuWmWwlkUxxnOEKSe2pZzBy5ZZbbog8kjdNi9w5d6DaWe+ypYjt98ogWhrSy6mnfp
 kX7rZbz9IVN6K48919K9o8AYVXxYQGAkMFa5yGoOQODxTTMwNHyjCB6FzSibmICjvZT7
 yykJrRahtY2H0/2WkssEyN36p9xUf1aKHtvgw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=Cm50m8z6CYr/VmhG+kR+5QTJjWplQ0LeVI88QEFCusg=;
 b=Cw5ujzFJRSSJ4m8N4KbEUlx4OdzAz/uZNmQZ5BfaghpzuHb+l24zy8tKtO9MaILW6v
 045COuThccuKFf9HsYOVByqgy+aq9SGUIoI9xuTx/H/PQlS/QZJG4Q7O0GHHLduP3A5w
 R5j1r9gJEcyMcbIVthjW4CTeEcYoq4XDiGFPwvlXqLvcdXie5lzivu+m4IR30rPkhSOe
 0h9m6L0u2n9KXs8OHQiniKIv8U3kAmf9AbHovVosu8xCFPx9pG2IpZAmhdjK6hYwzMOs
 sYAx1M7lGYvWVeNhi8m4hg2h38ANT/XG+u4JmmoBPaLNRhsF+J68Q0nSMyjwI4zm+FKL
 TMgw==
X-Gm-Message-State: AOAM530n2JfC6BWDts9jrhFobRVYgPCVgFSX9aLVNckHX0TI0YuWClYR
 LVWnAaWoCszzYS+rmRVggN5hvKUwUa5dkDnT1BKlcQ==
X-Google-Smtp-Source: ABdhPJwGyQyLIYs5glLFBTJb4OJFUrX7EFm+vIUK4XYkbEDs20exbNwLWLTPgYr1QE+O4bxcm6HbdfD+S9dmGr6vVlY=
X-Received: by 2002:a05:6830:4187:: with SMTP id
 r7mr6060720otu.126.1634839343553; 
 Thu, 21 Oct 2021 11:02:23 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 21 Oct 2021 11:02:22 -0700
MIME-Version: 1.0
In-Reply-To: <1634732051-31282-2-git-send-email-quic_sbillaka@quicinc.com>
References: <1634732051-31282-1-git-send-email-quic_sbillaka@quicinc.com>
 <1634732051-31282-2-git-send-email-quic_sbillaka@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Thu, 21 Oct 2021 11:02:22 -0700
Message-ID: <CAE-0n52SjFOWNNFAciOOpKRSnPLqq3zs+qib9jukPkxf0frQTQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drm/msm/dp: Add support for SC7280 eDP
To: Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org
Cc: Sankeerth Billakanti <sbillaka@codeaurora.org>, robdclark@gmail.com,
 seanpaul@chromium.org, 
 kalyan_t@codeaurora.org, abhinavk@codeaurora.org, dianders@chromium.org, 
 khsieh@codeaurora.org, mkrishn@codeaurora.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Sankeerth Billakanti (2021-10-20 05:14:10)
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index 62e75dc..9fea49c 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -1238,9 +1240,21 @@ static int dp_ctrl_link_train(struct dp_ctrl_private *ctrl,
>         link_info.capabilities = DP_LINK_CAP_ENHANCED_FRAMING;
>
>         dp_aux_link_configure(ctrl->aux, &link_info);
> +
> +       if (dpcd[DP_MAX_DOWNSPREAD] & DP_MAX_DOWNSPREAD_0_5) {

Please add a static inline macro in include/drm/drm_dp_helper.h that
makes this more readable. Something similar to drm_dp_is_branch() but
with a human readable replacement for "is_branch". Maybe drm_dp_ssc()?

> +               ssc = DP_SPREAD_AMP_0_5;
> +               drm_dp_dpcd_write(ctrl->aux, DP_DOWNSPREAD_CTRL, &ssc, 1);
> +       }
> +
>         drm_dp_dpcd_write(ctrl->aux, DP_MAIN_LINK_CHANNEL_CODING_SET,
>                                 &encoding, 1);
>
> +       if (dpcd[DP_EDP_CONFIGURATION_CAP] & DP_ALTERNATE_SCRAMBLER_RESET_CAP) {

And this one already has a helper,
drm_dp_alternate_scrambler_reset_cap().

> +               assr = DP_ALTERNATE_SCRAMBLER_RESET_ENABLE;
> +               drm_dp_dpcd_write(ctrl->aux, DP_EDP_CONFIGURATION_SET,
> +                               &assr, 1);
> +       }
> +
>         ret = dp_ctrl_link_train_1(ctrl, training_step);
>         if (ret) {
>                 DRM_ERROR("link training #1 failed. ret=%d\n", ret);
> @@ -1312,9 +1326,11 @@ static int dp_ctrl_enable_mainlink_clocks(struct dp_ctrl_private *ctrl)
>         struct dp_io *dp_io = &ctrl->parser->io;
>         struct phy *phy = dp_io->phy;
>         struct phy_configure_opts_dp *opts_dp = &dp_io->phy_opts.dp;
> +       const u8 *dpcd = ctrl->panel->dpcd;
>
>         opts_dp->lanes = ctrl->link->link_params.num_lanes;
>         opts_dp->link_rate = ctrl->link->link_params.rate / 100;
> +       opts_dp->ssc = dpcd[DP_MAX_DOWNSPREAD] & DP_MAX_DOWNSPREAD_0_5;
>         dp_ctrl_set_clock_rate(ctrl, DP_CTRL_PM, "ctrl_link",
>                                         ctrl->link->link_params.rate * 1000);
>
> @@ -1406,7 +1422,7 @@ void dp_ctrl_host_deinit(struct dp_ctrl *dp_ctrl)
>
>  static bool dp_ctrl_use_fixed_nvid(struct dp_ctrl_private *ctrl)
>  {
> -       u8 *dpcd = ctrl->panel->dpcd;
> +       const u8 *dpcd = ctrl->panel->dpcd;
>
>         /*
>          * For better interop experience, used a fixed NVID=0x8000
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index c867745..c16311b 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -144,8 +144,16 @@ static const struct msm_dp_config sc8180x_dp_cfg = {
>         .num_descs = 3,
>  };
>
> +static const struct msm_dp_config sc7280_dp_cfg = {
> +       .descs = (struct msm_dp_desc[]) {

const

> +               { .io_start = 0x0aea0000, .connector_type = DRM_MODE_CONNECTOR_eDP },
> +       },
> +       .num_descs = 1,
> +};
> +
>  static const struct of_device_id dp_dt_match[] = {
>         { .compatible = "qcom,sc7180-dp", .data = &sc7180_dp_cfg },
> +       { .compatible = "qcom,sc7280-edp", .data = &sc7280_dp_cfg },
>         { .compatible = "qcom,sc8180x-dp", .data = &sc8180x_dp_cfg },
>         { .compatible = "qcom,sc8180x-edp", .data = &sc8180x_dp_cfg },
>         {}
> @@ -1440,7 +1448,7 @@ void msm_dp_irq_postinstall(struct msm_dp *dp_display)
>
>         dp_hpd_event_setup(dp);
>
> -       dp_add_event(dp, EV_HPD_INIT_SETUP, 0, 100);
> +       dp_add_event(dp, EV_HPD_INIT_SETUP, 0, 1);

This has no explanation. What is it?
