Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1E8349A224
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jan 2022 02:50:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C49D910E2FE;
	Tue, 25 Jan 2022 01:50:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DAD610E2FE
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jan 2022 01:50:08 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id
 d18-20020a9d51d2000000b005a09728a8c2so388310oth.3
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 17:50:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=wUEHk84PPSq5TMcst7Q46Xs07T+hDbMqqFuqhOeSN4c=;
 b=HRToCcScCB2MmK94C4zwwPCL+sRf7G/Qg7BbMZj7V8W7nnP+AvEK28dFClVAdHckcq
 XRvwkazFnxqQjxDnh75dW4WM7LVg34SZWkKfmnQBKScjJ6Knoo5L3b5YxHgyi5e1YLBg
 4FiPnFZ5jL/oipIjK6GjFdOdpgPJrn8KgFlhI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=wUEHk84PPSq5TMcst7Q46Xs07T+hDbMqqFuqhOeSN4c=;
 b=ZDQJSJiktp38Ig4QVctI0WTuiIvPyORMxh6EPeB7lN/pVKJ1F7M8NxhyMsOec7xa36
 DUidPblw79lZ35Wr0KOY2zBNuDH3gTXyodq9D5usOXL5ud3jrDWZPkrUfBZnEBq9diqK
 RsF9wmI8xP84fGTZILzDEFSSGmra+vvB4u1Fx0DJNQigmLKcADYBKbGWeZ/+EC7RiINk
 ELtrqeWakiVKb+ouFGfP2DJ5/UG3eS6oYtWEoncOAUEmp9wh8wAkkWkeor+JAMJBmm70
 Xd7euLlcRYVpmD3eIum1J43fP4GWA05PKQwIea57+2DLxMZwZm/zBW9sKugpBFjN6vCL
 mUWw==
X-Gm-Message-State: AOAM533Ot+XpdXmTu4fbNGPWc0297vwYUBNwk94urgHq0YpnPArNmpEW
 7TxbAMwJH6kzN7nPALLqbcX9qxdSKo+m42O8pQDx4g==
X-Google-Smtp-Source: ABdhPJywHOsm6rxOv2ws+sHjp3srUtW0vaJGy7NiC9Hr/q913lcg5jyP3m/ecMVqRlFiPi0CJdg2jcKD4Q6Mx8vRJKU=
X-Received: by 2002:a05:6830:30ba:: with SMTP id
 g26mr6860402ots.159.1643075406598; 
 Mon, 24 Jan 2022 17:50:06 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 24 Jan 2022 17:50:06 -0800
MIME-Version: 1.0
In-Reply-To: <1643064292-6965-1-git-send-email-quic_khsieh@quicinc.com>
References: <1643064292-6965-1-git-send-email-quic_khsieh@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Mon, 24 Jan 2022 17:50:06 -0800
Message-ID: <CAE-0n505fYR1zpgZnC=J7WSxp_gpn6mnda9TuVjmJD8vMRn2Rg@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dp: add connector type to enhance debug messages
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
Cc: linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 aravindh@codeaurora.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2022-01-24 14:44:52)
> DP driver is a generic driver which supports both eDP and DP.
> For debugging purpose it is required to have capabilities to
> differentiate message are generated from eDP or DP. This patch
> add connector type into debug messages for this purpose.
>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c    | 20 +++++------
>  drivers/gpu/drm/msm/dp/dp_display.c | 71 ++++++++++++++++++++++++++-----------
>  2 files changed, 60 insertions(+), 31 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index 245e1b9..dcd0126 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -1396,6 +1396,8 @@ void dp_ctrl_phy_init(struct dp_ctrl *dp_ctrl)
>
>         dp_catalog_ctrl_phy_reset(ctrl->catalog);
>         phy_init(phy);
> +       DRM_DEBUG_DP("phy=%p init=%d power_on=%d\n",
> +                       phy, phy->init_count, phy->power_count);
>  }
>
>  void dp_ctrl_phy_exit(struct dp_ctrl *dp_ctrl)
> @@ -1410,6 +1412,8 @@ void dp_ctrl_phy_exit(struct dp_ctrl *dp_ctrl)
>
>         dp_catalog_ctrl_phy_reset(ctrl->catalog);
>         phy_exit(phy);
> +       DRM_DEBUG_DP("phy=%p init=%d power_on=%d\n",
> +                       phy, phy->init_count, phy->power_count);
>  }
>
>  static bool dp_ctrl_use_fixed_nvid(struct dp_ctrl_private *ctrl)
> @@ -1484,6 +1488,8 @@ static int dp_ctrl_deinitialize_mainlink(struct dp_ctrl_private *ctrl)
>         phy_exit(phy);
>         phy_init(phy);
>
> +       DRM_DEBUG_DP("phy=%p init=%d power_on=%d\n",
> +                       phy, phy->init_count, phy->power_count);
>         return 0;
>  }
>

These are entirely new messages. Adding messages isn't mentioned in the
commit text. Please either split this out or indicate in the commit text
what's going on here.

> @@ -1895,14 +1901,12 @@ int dp_ctrl_off_link_stream(struct dp_ctrl *dp_ctrl)
>
>         phy_power_off(phy);
>
> -       DRM_DEBUG_DP("After, phy=%x init_count=%d power_on=%d\n",
> -               (u32)(uintptr_t)phy, phy->init_count, phy->power_count);
> -
>         /* aux channel down, reinit phy */
>         phy_exit(phy);
>         phy_init(phy);
>
> -       DRM_DEBUG_DP("DP off link/stream done\n");
> +       DRM_DEBUG_DP("phy=%p init=%d power_on=%d\n",

The DRM_DEBUG_DP macro says it's deprecated now and we should use
drm_dbg_dp() instead. Can you use that macro instead? Then it looks like
drm->dev can actually be any old struct device, so I guess we're allowed
to pass in the particular instance of dp device this is for. Allowing us
to figure out which DP device is actually printing messages.

> +                       phy, phy->init_count, phy->power_count);
>         return ret;
>  }
>
