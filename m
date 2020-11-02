Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AD232A3EA9
	for <lists+dri-devel@lfdr.de>; Tue,  3 Nov 2020 09:16:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7E676EC53;
	Tue,  3 Nov 2020 08:14:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF29F6E3C1
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Nov 2020 20:53:06 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id o129so12216789pfb.1
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Nov 2020 12:53:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=l5vIbL7zQ7n4XZHyhwW01YWfGRyYMBZYUrSZpG6FbLs=;
 b=N0yLEXezBABYB2tPL4AuEEXwYGKOXDecmwzSVE8bnDq1ew8Ubu+drYtDQ/NkpIwcJf
 L3moZQiC5mITS4SqyL/PT6mN0ypSPUqxLBDFRjbu8vIECqjZCFTggm2bmAKVkQOiW7kM
 58q6lALMnQgpix4nh/2pSGxpVTZSZ9/N1Ym6I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=l5vIbL7zQ7n4XZHyhwW01YWfGRyYMBZYUrSZpG6FbLs=;
 b=PBoUfQc05+D12g/p0aZkDHM5GhYtOE2DNx22QzIeVYtvo4NqaSIDi/BygWzwb9fjVK
 5bIx6DP7LZCWmAxfpe0IsT6vc7fWjpU9VGrZ0uGSaj0dcegIlZbT0hN+L/aWySnpEAmL
 Rr+8ZA6HHdYRr+5ki37wtO0TW7gqNP5U0DiPbaNNJ5YVXl8/55nbXbcxKHyne7li6cfj
 Fq1Xb9syKcWoK8W2etRGj2SbpUp8R1na2PVIo4wATKTQZwbqXtSYIygDv6l5rEMrtVxO
 zs12Ee9sKVbEiSQazY+nYb5ERlFFYaWI5lS2Rpr1W0i5jpKh29LTU0HEsUx6ntjDiMcA
 3pUw==
X-Gm-Message-State: AOAM5318d1bLG0nLQLy0wyUdetKm/KW6CVY9Gw6DkdpgrNyX37QhkSyx
 BDAD4GsMIKzVHwDh0BqL7EvTJw==
X-Google-Smtp-Source: ABdhPJw1NO5xOgyXHyhI3oWwQJeO56qgUTuPxt4QU+RDUNnB48VToL/F4DAVmG01MfXtEfgKrDhsEw==
X-Received: by 2002:a17:90a:4742:: with SMTP id y2mr13520pjg.228.1604350386498; 
 Mon, 02 Nov 2020 12:53:06 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:3e52:82ff:fe6c:83ab])
 by smtp.gmail.com with ESMTPSA id y5sm15250451pfq.79.2020.11.02.12.53.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2020 12:53:05 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20201030232310.11100-1-khsieh@codeaurora.org>
References: <20201030232310.11100-1-khsieh@codeaurora.org>
Subject: Re: [PATCH v2] drm/msm/dp: skip checking LINK_STATUS_UPDATED bit
From: Stephen Boyd <swboyd@chromium.org>
To: Kuogee Hsieh <khsieh@codeaurora.org>, robdclark@gmail.com, sean@poorly.run
Date: Mon, 02 Nov 2020 12:53:04 -0800
Message-ID: <160435038402.884498.10403326257118588679@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-Mailman-Approved-At: Tue, 03 Nov 2020 08:14:24 +0000
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
Cc: rnayak@codeaurora.org, airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 abhinavk@codeaurora.org, khsieh@codeaurora.org, tanmay@codeaurora.org,
 aravindh@codeaurora.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2020-10-30 16:23:10)
> Some dongle will not clear LINK_STATUS_UPDATED bit after
> DPCD read which cause link training failed. This patch

$ git grep 'this patch' -- Documentation/process/submitting-patches.rst

> just read 6 bytes of DPCD link status from sink and return
> without checking LINK_STATUS_UPDATED bit.
> Link rate read back from sink need to be convert into
> really rate by timing 2.7Mb. 

This last sentence doesn't make sense to me, sorry. What is being said?

> For example 0x0A is equivalent
> to 2.7Gb. This patch also convert link rate correctly to fix
> phy compliance test link rate error.
> 
> Chanegs in V2:
> -- revise commit text
> 
> Fixes: fd4a29bed29b (drm/msm/dp: DisplayPort PHY compliance tests fixup)
> 

Shouldn't be any space here between SoB and Fixes tag.

> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c | 20 ++++++--------------
>  drivers/gpu/drm/msm/dp/dp_link.c | 24 +++++++++++-------------
>  2 files changed, 17 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index 904698dfc7f7..844ba756a2c6 100644
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

So if this returns the integer 2 it's OK? Shouldn't it return some error
value?

>         }
>  
> -       return -ETIMEDOUT;
> +       return ret;
>  }
>  
>  static int dp_ctrl_link_train_1(struct dp_ctrl_private *ctrl,
> diff --git a/drivers/gpu/drm/msm/dp/dp_link.c b/drivers/gpu/drm/msm/dp/dp_link.c
> index 49d7fad36fc4..64a002d100c7 100644
> --- a/drivers/gpu/drm/msm/dp/dp_link.c
> +++ b/drivers/gpu/drm/msm/dp/dp_link.c
> @@ -943,20 +944,17 @@ static u8 get_link_status(const u8 link_status[DP_LINK_STATUS_SIZE], int r)
>   */
>  static int dp_link_process_link_status_update(struct dp_link_private *link)
>  {
> -       if (!(get_link_status(link->link_status,
> -                               DP_LANE_ALIGN_STATUS_UPDATED) &
> -                               DP_LINK_STATUS_UPDATED) ||
> -                       (drm_dp_clock_recovery_ok(link->link_status,
> -                                       link->dp_link.link_params.num_lanes) &&
> -                       drm_dp_channel_eq_ok(link->link_status,
> -                                       link->dp_link.link_params.num_lanes)))
> -               return -EINVAL;
> +       bool channel_eq_done = drm_dp_channel_eq_ok(link->link_status,
> +                       link->dp_link.link_params.num_lanes);
> +
> +       bool clock_recovery_done = drm_dp_clock_recovery_ok(link->link_status,
> +                       link->dp_link.link_params.num_lanes);
>  
>         DRM_DEBUG_DP("channel_eq_done = %d, clock_recovery_done = %d\n",
> -                       drm_dp_clock_recovery_ok(link->link_status,
> -                       link->dp_link.link_params.num_lanes),
> -                       drm_dp_clock_recovery_ok(link->link_status,
> -                       link->dp_link.link_params.num_lanes));
> +                       channel_eq_done, clock_recovery_done);
> +
> +       if (channel_eq_done && clock_recovery_done)
> +               return -EINVAL;
>  
>         return 0;
>  }
> 
> base-commit: 03a9adc88c206b3857ce95f4f4d3b185d429fa31

What is this commit?
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
