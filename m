Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B1F5E31DE5B
	for <lists+dri-devel@lfdr.de>; Wed, 17 Feb 2021 18:36:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E499C6E9A4;
	Wed, 17 Feb 2021 17:36:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76AAB6E9A3
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Feb 2021 17:36:22 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id fa16so1880355pjb.1
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Feb 2021 09:36:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=WY6BWQE+OiB63lkzsmOgRmOC11+SnGhNqoMsqPgupK0=;
 b=GprgssCWFqAFmY0cF2yEF2MPhDCjdfUL8SjA6Y++eq8i4XcOu4c8qwI3dKrBcZABFQ
 McRxKZJkcg7vkbxQJFUJwisk5b9MME3e2RUDKt+voxBDyp+sc7W7UNA9z41HvXUI7KpG
 G/CgtqDUunpMsp4gDi7IUyw+U4sU+HoYw8OwE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=WY6BWQE+OiB63lkzsmOgRmOC11+SnGhNqoMsqPgupK0=;
 b=fDAo7oRScMZ3TYEqf0oTZCnE7zL0c7o7vdRbxKKNFfIZWRkPBfv/9+qrzW4fWu4DTK
 KwHFlcT+3jIr8Klf7L65rOHNeYB9s/lUJnWEJDbCDLmNbpARYl9kKL/myI5pjlWBSmc3
 KP4as3ZRGB2Z57325SFE/+BRSRSuixgGneFS0awbp3gkEGb+2+vIaZnWW5oEvHYkuf4c
 R+QONDYvDAUotTfgXOeQY90DCKeP5uyEwknfemIQAETiOMfKw1/HVKpsWNUgPEH9H/Ts
 PfLqB4HaRfXQs+jPETY86wMvBKmSUacL/A9pOLq//UkOMz1641YIvtznaADyOWUkn07N
 Ddbw==
X-Gm-Message-State: AOAM533gL2T7bEAy80v0l992MYXIwUoH4kbZqRK+EHKoiq+o4YxlBcfo
 xpdX6YgKsBr0qSAZ+jOLdfSTJA==
X-Google-Smtp-Source: ABdhPJyhWhQ9ajxWuvuPPlk0WDsx0eU1nYFqyGy8fAj+49lGy1XE7lbsHVRetwAlivzQsGqhK0yUdQ==
X-Received: by 2002:a17:90a:aa0d:: with SMTP id
 k13mr10652749pjq.210.1613583382027; 
 Wed, 17 Feb 2021 09:36:22 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:e915:2799:f43d:3184])
 by smtp.gmail.com with ESMTPSA id np7sm2638673pjb.10.2021.02.17.09.36.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Feb 2021 09:36:21 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1613581122-8473-1-git-send-email-khsieh@codeaurora.org>
References: <1613581122-8473-1-git-send-email-khsieh@codeaurora.org>
Subject: Re: [PATCH] drm/msm/dp: add support of HBR3 link rate
From: Stephen Boyd <swboyd@chromium.org>
To: Kuogee Hsieh <khsieh@codeaurora.org>, robdclark@gmail.com, sean@poorly.run,
 Vinod Koul <vkoul@kernel.org>
Date: Wed, 17 Feb 2021 09:36:18 -0800
Message-ID: <161358337887.1254594.12898848287081049541@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
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

Quoting Kuogee Hsieh (2021-02-17 08:58:42)
> Add hbr3_hbr2 voltage and pre-emphasis swing table to support
> HBR3 link rate
> 
> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/dp/dp_panel.c   |  4 ----
>  drivers/phy/qualcomm/phy-qcom-qmp.c | 24 ++++++++++++++++++++++--

This spans to subsystems so at least you should run get_maintainers and
include phy maintainers. Maybe it should be split into two patches too
so it can go via different trees.

>  2 files changed, 22 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
> index 9cc8166..63112fa 100644
> --- a/drivers/gpu/drm/msm/dp/dp_panel.c
> +++ b/drivers/gpu/drm/msm/dp/dp_panel.c
> @@ -76,10 +76,6 @@ static int dp_panel_read_dpcd(struct dp_panel *dp_panel)
>         if (link_info->num_lanes > dp_panel->max_dp_lanes)
>                 link_info->num_lanes = dp_panel->max_dp_lanes;
>  
> -       /* Limit support upto HBR2 until HBR3 support is added */
> -       if (link_info->rate >= (drm_dp_bw_code_to_link_rate(DP_LINK_BW_5_4)))
> -               link_info->rate = drm_dp_bw_code_to_link_rate(DP_LINK_BW_5_4);
> -
>         DRM_DEBUG_DP("version: %d.%d\n", major, minor);
>         DRM_DEBUG_DP("link_rate=%d\n", link_info->rate);
>         DRM_DEBUG_DP("lane_count=%d\n", link_info->num_lanes);
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
> index 0939a9e..cc5ef59 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
> @@ -2965,6 +2965,21 @@ static void qcom_qmp_phy_dp_aux_init(struct qmp_phy *qphy)
>                qphy->pcs + QSERDES_V3_DP_PHY_AUX_INTERRUPT_MASK);
>  }
>  
> +
> +static u8 const qmp_dp_v3_pre_emphasis_hbr3_hbr2[4][4] = {

Should be static const u8 qmp_dp...

> +        {0x00, 0x0C, 0x15, 0x1A},
> +        {0x02, 0x0E, 0x16, 0xFF},
> +        {0x02, 0x11, 0xFF, 0xFF},
> +        {0x04, 0xFF, 0xFF, 0xFF}
> +};
> +
> +static u8 const qmp_dp_v3_voltage_swing_hbr3_hbr2[4][4] = {

Same.

> +        {0x02, 0x12, 0x16, 0x1A},

Please add a space after { and before } and use lowercase hex to match
the qmp_dp_v3_pre_emphasis_hbr_rbr design.

> +        {0x09, 0x19, 0x1F, 0xFF},
> +        {0x10, 0x1F, 0xFF, 0xFF},
> +        {0x1F, 0xFF, 0xFF, 0xFF}
> +};
> +
>  static const u8 qmp_dp_v3_pre_emphasis_hbr_rbr[4][4] = {
>         { 0x00, 0x0c, 0x14, 0x19 },
>         { 0x00, 0x0b, 0x12, 0xff },
> @@ -3000,8 +3015,13 @@ static void qcom_qmp_phy_configure_dp_tx(struct qmp_phy *qphy)
>                 drvr_en = 0x10;
>         }
>  
> -       voltage_swing_cfg = qmp_dp_v3_voltage_swing_hbr_rbr[v_level][p_level];
> -       pre_emphasis_cfg = qmp_dp_v3_pre_emphasis_hbr_rbr[v_level][p_level];
> +       if (dp_opts->link_rate <= 2700) {
> +               voltage_swing_cfg = qmp_dp_v3_voltage_swing_hbr_rbr[v_level][p_level];
> +               pre_emphasis_cfg = qmp_dp_v3_pre_emphasis_hbr_rbr[v_level][p_level];
> +       } else {
> +               voltage_swing_cfg = qmp_dp_v3_voltage_swing_hbr3_hbr2[v_level][p_level];
> +               pre_emphasis_cfg = qmp_dp_v3_pre_emphasis_hbr3_hbr2[v_level][p_level];
> +       }
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
