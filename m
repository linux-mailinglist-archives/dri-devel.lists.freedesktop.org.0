Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B9E42948C0
	for <lists+dri-devel@lfdr.de>; Wed, 21 Oct 2020 09:17:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A1586E9BD;
	Wed, 21 Oct 2020 07:17:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B68B76E0FD
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Oct 2020 22:15:58 +0000 (UTC)
Received: by mail-pj1-x1042.google.com with SMTP id lw2so73400pjb.3
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Oct 2020 15:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=Byl068bSjplKbL4+PGKJ1dC619S+qOz8jD1tUz0XwHk=;
 b=KE+PETcp6MXxJp2h7R+7wX6TA7o0bnwOzHNuKMnSSWmLWLDVi3exXozEpC2/oJlQN8
 +KRIahNRWZR0vRBqf05eo1Ca/0Copjo/AjJwsptmk2Bqoyw0eP6VNszY2u4x5ZaFVSkZ
 BbyHVYsoDxQI619GGH5gKMoNNbSkLn0vaviZk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=Byl068bSjplKbL4+PGKJ1dC619S+qOz8jD1tUz0XwHk=;
 b=dkN+V7iSEfbdERUGVSoGr2JVSaUAsry9vakt7aBQtUbvCBFRrBIKbOW2JdZpveS+sA
 +frKly0CRhu4gYlYwWdqCCXxlspZzsJPrV2FsE6UAKerd9HPLJneNMJ2WV/T0A4DmgOs
 GOtLZgj77r1yKGad71x5y9EZWnMxcLIalw1DUla6Hrg5KKd4ZKkbu1q8bvZjVyHSXRzB
 tk4GJwGNgSIRazChRCwhBCt4hg5YkaIzF7gDmZ9r7iucVkth0CxTJDsv9FNzPqqxPtQy
 FVQ4m2frHFNnndk4iyZbmXd+cZS0a9aM42s3DoRvp/iT5H3puHydV7dcdoLTNKcbGHrf
 04XQ==
X-Gm-Message-State: AOAM530jMhpee2qLYh/ZGPH4LjK1qHDad9xF40jjyrYaP5ARxdcrwiUB
 +0Cy7VJLtGwX0kw7JOdWkNyBGQ==
X-Google-Smtp-Source: ABdhPJyhGqquEURVzCUWjkxaXE1f4ZbyUwHjKWuvLzMw7wyKxAe9p8Ze3hRndsQEWKczhrZO5Thjvw==
X-Received: by 2002:a17:902:b7c3:b029:d4:bc6e:8aae with SMTP id
 v3-20020a170902b7c3b02900d4bc6e8aaemr269153plz.12.1603232158094; 
 Tue, 20 Oct 2020 15:15:58 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:201:3e52:82ff:fe6c:83ab])
 by smtp.gmail.com with ESMTPSA id e196sm50988pfh.128.2020.10.20.15.15.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Oct 2020 15:15:57 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20201020165959.7441-1-khsieh@codeaurora.org>
References: <20201020165959.7441-1-khsieh@codeaurora.org>
Subject: Re: [PATCH] drm/msm/dp: skip checking LINK_STATUS_UPDATED bit
From: Stephen Boyd <swboyd@chromium.org>
To: Kuogee Hsieh <khsieh@codeaurora.org>, robdclark@gmail.com, sean@poorly.run
Date: Tue, 20 Oct 2020 15:15:55 -0700
Message-ID: <160323215566.884498.14018580767640192186@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-Mailman-Approved-At: Wed, 21 Oct 2020 07:16:42 +0000
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

Quoting Kuogee Hsieh (2020-10-20 09:59:59)
> No need to check LINK_STATuS_UPDATED bit before

LINK_STATUS_UPDATED?

> return 6 bytes of link status during link training.

Why?

> This patch also fix phy compliance test link rate
> conversion error.

How?

> 
> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> ---

Any Fixes: tag?

>  drivers/gpu/drm/msm/dp/dp_ctrl.c | 20 ++++++--------------
>  drivers/gpu/drm/msm/dp/dp_link.c | 24 +++++++++++-------------
>  2 files changed, 17 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index 6bdaec778c4c..76e891c91c6e 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -1061,23 +1061,15 @@ static bool dp_ctrl_train_pattern_set(struct dp_ctrl_private *ctrl,
>  static int dp_ctrl_read_link_status(struct dp_ctrl_private *ctrl,
>                                     u8 *link_status)
>  {
> -       int len = 0;
> -       u32 const offset = DP_LANE_ALIGN_STATUS_UPDATED - DP_LANE0_1_STATUS;
> -       u32 link_status_read_max_retries = 100;
> -
> -       while (--link_status_read_max_retries) {
> -               len = drm_dp_dpcd_read_link_status(ctrl->aux,
> -                       link_status);
> -               if (len != DP_LINK_STATUS_SIZE) {
> -                       DRM_ERROR("DP link status read failed, err: %d\n", len);
> -                       return len;
> -               }
> +       int ret = 0, len;
>  
> -               if (!(link_status[offset] & DP_LINK_STATUS_UPDATED))
> -                       return 0;
> +       len = drm_dp_dpcd_read_link_status(ctrl->aux, link_status);
> +       if (len != DP_LINK_STATUS_SIZE) {
> +               DRM_ERROR("DP link status read failed, err: %d\n", len);
> +               ret = len;

Could this be positive if the len is greater than 0 but not
DP_LINK_STATUS_SIZE? Maybe the check should be len < 0? We certainly
don't want to return some smaller size from this function, right?

>         }
>  
> -       return -ETIMEDOUT;
> +       return ret;
>  }
>  
>  static int dp_ctrl_link_train_1(struct dp_ctrl_private *ctrl,
> diff --git a/drivers/gpu/drm/msm/dp/dp_link.c b/drivers/gpu/drm/msm/dp/dp_link.c
> index c811da515fb3..58d65daae3b3 100644
> --- a/drivers/gpu/drm/msm/dp/dp_link.c
> +++ b/drivers/gpu/drm/msm/dp/dp_link.c
> @@ -773,7 +773,8 @@ static int dp_link_process_link_training_request(struct dp_link_private *link)
>                         link->request.test_lane_count);
>  
>         link->dp_link.link_params.num_lanes = link->request.test_lane_count;
> -       link->dp_link.link_params.rate = link->request.test_link_rate;
> +       link->dp_link.link_params.rate =
> +               drm_dp_bw_code_to_link_rate(link->request.test_link_rate);

Why are we storing bw_code in test_link_rate? This looks very confusing.

>  
>         return 0;
>  }
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
