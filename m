Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACE743D2C84
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jul 2021 21:14:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CACB86E822;
	Thu, 22 Jul 2021 19:14:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AE456E7D0
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 19:14:23 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id h9so7749662oih.4
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 12:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=wSvpCRiJmPrrtav1DmRC8DqUe0S6Omo2vxlNGYfx92Q=;
 b=Go+wWAXUxyLK4e/Lq/KcAs1fXB+LWfLLQGaA8F9OwN0D7tI2y8wDFaSbucrENDCWwg
 wF5r2zdEqu9iOztnA/2aZEePbF7+AIVFkvkIK5FZl2o0Zy0ITF4L9CNjlzoOsS4sRSEF
 V1sSVkDnZA03rV6XsH94QXCNGpRxh4VuKb+28=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=wSvpCRiJmPrrtav1DmRC8DqUe0S6Omo2vxlNGYfx92Q=;
 b=cfiMtGw7JQA1IxnpV1/IfmblFxofue0uTO4dKJYW2yDu9TX2F6UFrE3jxBjXYcDobG
 T8u/Q0EZUHRJOQohGqTdxMY/8y7AM3JAzVwCJRHPxq0k+no1jJ5RbK2RsR076HeQQ4oy
 aqag0ka3N/3Ur0HZfH+OD8grOalomcqSEqsJIttK0lST48pGepZrAq4ZtUhdLLPl5mrw
 Z59nbSxx7UE+rQaExKhhOTvl1lwJ3ucULhcprjHAsobRWdLicgKMgWfdPgmi6cIYu08l
 uesxIuMG6QUJJSPfz4ztWFjf00LWFCSeZsALyIYcbpDP1caMFTv8rhFe5YAzxpv04i1R
 HxJg==
X-Gm-Message-State: AOAM532Pt6EZkA0sY8zHjrykv3Be+EX4OGhoXGyj7D6I8v+H9pCqT8lJ
 Sm7r5G6Mn2+grhzayTYzQNUzXtArCn4uqdIxlrV14w==
X-Google-Smtp-Source: ABdhPJw7Jt83PWgkfrVNzrviXsR60shUZD8zaTYGns8S9nFsjxPcFIie+Z6Wfga+wCD/0nvVj837eKPNf/ac32p/eOQ=
X-Received: by 2002:a05:6808:114a:: with SMTP id
 u10mr1052996oiu.19.1626981262785; 
 Thu, 22 Jul 2021 12:14:22 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 22 Jul 2021 19:14:21 +0000
MIME-Version: 1.0
In-Reply-To: <1626191647-13901-8-git-send-email-khsieh@codeaurora.org>
References: <1626191647-13901-1-git-send-email-khsieh@codeaurora.org>
 <1626191647-13901-8-git-send-email-khsieh@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Thu, 22 Jul 2021 19:14:21 +0000
Message-ID: <CAE-0n525b3V9D+aT_xwHQK-g6SjAXse4j7f1wHQHzeL3EEFV_w@mail.gmail.com>
Subject: Re: [PATCH v2 7/7] drm/msm/dp: retrain link when loss of symbol lock
 detected
To: Kuogee Hsieh <khsieh@codeaurora.org>, dri-devel@lists.freedesktop.org, 
 robdclark@gmail.com, sean@poorly.run
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
Cc: airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, abhinavk@codeaurora.org,
 bjorn.andersson@linaro.org, aravindh@codeaurora.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2021-07-13 08:54:07)
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index 6a013b0..20951c8 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -1638,6 +1638,25 @@ static bool dp_ctrl_clock_recovery_any_ok(
>         return drm_dp_clock_recovery_ok(link_status, lane_count);
>  }
>
> +static bool dp_ctrl_loss_symbol_lock(struct dp_ctrl_private *ctrl)
> +{
> +       u8 link_status[DP_LINK_STATUS_SIZE];
> +       u8 status;
> +       int i;
> +       int num_lanes = ctrl->link->link_params.num_lanes;
> +
> +       dp_ctrl_read_link_status(ctrl, link_status);
> +
> +       for (i = 0; i < num_lanes; i++) {
> +               status = link_status[i / 2];
> +               status >>= ((i % 2) * 4);
> +               if (!(status & DP_LANE_SYMBOL_LOCKED))
> +                       return true;
> +       }
> +
> +       return false;
> +}

Can this function move to drivers/gpu/drm/drm_dp_helper.c and be called
drm_dp_symbol_locked()?

> +
>  int dp_ctrl_on_link(struct dp_ctrl *dp_ctrl)
>  {
>         int rc = 0;
