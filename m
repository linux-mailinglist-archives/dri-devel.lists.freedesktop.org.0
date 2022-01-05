Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C3319485A78
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jan 2022 22:14:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A6FE10E2D3;
	Wed,  5 Jan 2022 21:13:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67B9710E256
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jan 2022 21:13:56 +0000 (UTC)
Received: by mail-ot1-x333.google.com with SMTP id
 o3-20020a9d4043000000b0058f31f4312fso840291oti.1
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Jan 2022 13:13:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=ISVjPyfL3KOfV6g7C5TopV/TTWEXrKvfhAA2krbL5Mk=;
 b=Krl/wS800jGJxl3ShvAzsrW/gK65FLU+CMy90b2OER0L8WoKbsRpJP6vI2qbkgFosn
 dQl66gHaLEMnIEQW+NuyDFoVH4AtzqZqN7reCGno6+Sif8jmNhwr67a/Wzi2+XHIC+D7
 5qqeLS2dTV2xCR4GCiX1bFcZHisF2A+FLFLKE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=ISVjPyfL3KOfV6g7C5TopV/TTWEXrKvfhAA2krbL5Mk=;
 b=iaLE5G4dgpi7K+QLFKkNyyTM1vIX2fsYqQ0IgtSGNvjKdtoE3br1jIM9XkH+U60DAj
 eabYH30q4sr6tmo6l4Fj+xcgT6tqjoVsKce7GfedJI2bjY3qKwrbLPo+gsnM//7OaYxo
 mRcmzm6Le3wMqZAzEImePyevO/xjW49fo3E9PBRsArYXoteE+Imk8bfJuKz7k1aP0LvR
 NZ+fCyeldH8Y2k4OzZZqGBy4q1F3alopnRMydWADccTacMy7Is0JnirWVF3A6953/Y5w
 7K09ri0OFZcbCMGpK4Oc+pCrS1VeACHeKV/+f+Xxqm8c7X3yc79uisnV2onTkB1+v2Ru
 LjGg==
X-Gm-Message-State: AOAM531vYNKTrk3TqJPIXqtKfGa+lMH+AI3+Ka+ztXK7Hh18rrsxEDAt
 v1jt9i+PiisDuhaeo1523fHix+qXphR+6QnB37NSUA==
X-Google-Smtp-Source: ABdhPJzywRaiCU9j7Sj91FTrYmwIL1FU1+bcav6gdU9MZyu0RoH9bIV2rYSu8RXKtSwekbAltC+3DvT9fL9uaPW4XT4=
X-Received: by 2002:a9d:1a6:: with SMTP id e35mr164416ote.77.1641417235673;
 Wed, 05 Jan 2022 13:13:55 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 5 Jan 2022 13:13:55 -0800
MIME-Version: 1.0
In-Reply-To: <1640801745-16234-1-git-send-email-quic_khsieh@quicinc.com>
References: <1640801745-16234-1-git-send-email-quic_khsieh@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Wed, 5 Jan 2022 13:13:55 -0800
Message-ID: <CAE-0n50QyX0YsvZbAfi_bL+4-jQrdB7FFUPL3pksLW_9Xzb9hg@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm/dp: add support of tps4 (training pattern 4)
 for HBR3
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org, airlied@linux.ie,
 bjorn.andersson@linaro.org, daniel@ffwll.ch, dmitry.baryshkov@linaro.org, 
 robdclark@gmail.com, sean@poorly.run, vkoul@kernel.org
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Kuogee Hsieh <khsieh@codeaurora.org>,
 aravindh@codeaurora.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2021-12-29 10:15:45)
> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
> index 6965afa..7dea101 100644
> --- a/drivers/gpu/drm/msm/dp/dp_catalog.h
> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
> @@ -94,7 +94,7 @@ void dp_catalog_ctrl_mainlink_ctrl(struct dp_catalog *dp_catalog, bool enable);
>  void dp_catalog_ctrl_config_misc(struct dp_catalog *dp_catalog, u32 cc, u32 tb);
>  void dp_catalog_ctrl_config_msa(struct dp_catalog *dp_catalog, u32 rate,
>                                 u32 stream_rate_khz, bool fixed_nvid);
> -int dp_catalog_ctrl_set_pattern(struct dp_catalog *dp_catalog, u32 pattern);
> +int dp_catalog_ctrl_set_pattern_state_bit(struct dp_catalog *dp_catalog, u32 pattern);
>  void dp_catalog_ctrl_reset(struct dp_catalog *dp_catalog);
>  bool dp_catalog_ctrl_mainlink_ready(struct dp_catalog *dp_catalog);
>  void dp_catalog_ctrl_enable_irq(struct dp_catalog *dp_catalog, bool enable);
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index 39558a2..da6c083 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -1078,12 +1078,13 @@ static int dp_ctrl_link_train_1(struct dp_ctrl_private *ctrl,
>         int tries, old_v_level, ret = 0;
>         u8 link_status[DP_LINK_STATUS_SIZE];
>         int const maximum_retries = 4;
> +       char state_ctrl_bit = 1;
>
>         dp_catalog_ctrl_state_ctrl(ctrl->catalog, 0);
>
>         *training_step = DP_TRAINING_1;
>
> -       ret = dp_catalog_ctrl_set_pattern(ctrl->catalog, DP_TRAINING_PATTERN_1);
> +       ret = dp_catalog_ctrl_set_pattern_state_bit(ctrl->catalog, state_ctrl_bit);

Why not inline 'state_ctrl_bit' value of 1 here?

>         if (ret)
>                 return ret;
>         dp_ctrl_train_pattern_set(ctrl, DP_TRAINING_PATTERN_1 |
> @@ -1181,7 +1182,7 @@ static int dp_ctrl_link_train_2(struct dp_ctrl_private *ctrl,
>                         int *training_step)
>  {
>         int tries = 0, ret = 0;
> -       char pattern;
> +       char pattern, state_ctrl_bit;

Why is 'state_ctrl_bit' a char when the function it's passed to takes a
u32? Please be consistent with types. It would be good to make 'pattern'
into a u8 as well instead of a char to be similarly consistent.

>         int const maximum_retries = 5;
>         u8 link_status[DP_LINK_STATUS_SIZE];
>
> @@ -1189,12 +1190,20 @@ static int dp_ctrl_link_train_2(struct dp_ctrl_private *ctrl,
>
>         *training_step = DP_TRAINING_2;
>
> -       if (drm_dp_tps3_supported(ctrl->panel->dpcd))
> +       if (drm_dp_tps4_supported(ctrl->panel->dpcd)) {
> +               pattern = DP_TRAINING_PATTERN_4;
> +               state_ctrl_bit = 4;
> +       }
> +       else if (drm_dp_tps3_supported(ctrl->panel->dpcd)) {
>                 pattern = DP_TRAINING_PATTERN_3;
> -       else
> +               state_ctrl_bit = 3;
> +       }
> +       else {
>                 pattern = DP_TRAINING_PATTERN_2;
> +               state_ctrl_bit = 2;
> +       }
>
> -       ret = dp_catalog_ctrl_set_pattern(ctrl->catalog, pattern);
> +       ret = dp_catalog_ctrl_set_pattern_state_bit(ctrl->catalog, state_ctrl_bit);
>         if (ret)
>                 return ret;
>
