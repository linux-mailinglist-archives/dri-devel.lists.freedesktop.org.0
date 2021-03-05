Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD9232E298
	for <lists+dri-devel@lfdr.de>; Fri,  5 Mar 2021 07:56:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52CC76EADD;
	Fri,  5 Mar 2021 06:56:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [IPv6:2607:f8b0:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC1BE6EADD
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Mar 2021 06:56:00 +0000 (UTC)
Received: by mail-pg1-x531.google.com with SMTP id g4so726030pgj.0
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Mar 2021 22:56:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=fXXHDyZIBHLXRZML6uKSyOXVnBUPIsC8PyjRDoTsi8c=;
 b=V1pVLGtXSidewpc1BUaW/R+em4Dt5/wSfRismBwn/9ACwNntumwMMYHAuiHgTsha6H
 Sd9ca39E9ZTqn5fH2eiC+rV+EvQ9ADYee0eLe12xmL3cEzOlSZlbNN32sidDGDqx+UZB
 bbVM7QOPwNPEhfu0Axnw02kGq7qHlZgu9eIGg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=fXXHDyZIBHLXRZML6uKSyOXVnBUPIsC8PyjRDoTsi8c=;
 b=F1kFRtSmsPWOqcyKZyE5qIg631NVVscT1EDSuUQbGzzDX+IfMiTI0P52Ltbrd88y0v
 Iv14z3lMTcsgo4ZwUdxHl+sf30lKO7ICncGKHEsa5an8zJFcF3Q0vbasD0AvqGcyNZQB
 XqmLOdDPvS2xGGLQykb3yjlaCmwESTfbzPLn2VRcQKCmbFfP6OrcD+Y/GDmgs9qMGEn6
 VzVIyMNwZj8+WF8hQ21e+Q37gpA3vhpGV7pz1baDLggh3vYcGfPiy9zoGr1LmbivTKne
 b2PJlO5agPToBGqXEQfn3QHbj8nqSRXcKBxfpWp82yg35slS5wVWUF5yfo9L02mbx2gV
 aZ1w==
X-Gm-Message-State: AOAM532Omyo6VMJAgXkRzrnYJs1ZDaPLPViBuNEmE76MI/vy73wZhYCk
 afbo7XQ+N2c0AYUiBGMTgoXwEQ==
X-Google-Smtp-Source: ABdhPJzzy67CRgzY77C8ioWoVCDNiqtSJJYzEJO6TfDxIUcpitXpVQjZvtkdpeyDZ5oSIErtuQTxsw==
X-Received: by 2002:a63:465d:: with SMTP id v29mr7046518pgk.225.1614927360315; 
 Thu, 04 Mar 2021 22:56:00 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:b498:4a2d:bc34:b77e])
 by smtp.gmail.com with ESMTPSA id f6sm1422647pfk.11.2021.03.04.22.55.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Mar 2021 22:55:59 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1614907912-6880-1-git-send-email-abhinavk@codeaurora.org>
References: <1614907912-6880-1-git-send-email-abhinavk@codeaurora.org>
Subject: Re: [PATCH] drm/msm/dp: Fix warnings reported by kbot in DP driver
From: Stephen Boyd <swboyd@chromium.org>
To: Abhinav Kumar <abhinavk@codeaurora.org>, dri-devel@lists.freedesktop.org
Date: Thu, 04 Mar 2021 22:55:58 -0800
Message-ID: <161492735848.1478170.885416005935439120@swboyd.mtv.corp.google.com>
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
Cc: linux-arm-msm@vger.kernel.org, Abhinav Kumar <abhinavk@codeaurora.org>,
 khsieh@codeaurora.org, seanpaul@chromium.org, tanmay@codeaurora.org,
 aravindh@codeaurora.org, freedreno@lists.freedesktop.org,
 dan.carpenter@oracle.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Maybe subject could be "Ignore debugfs failures, fix indentation, fix
logical error"?

Quoting Abhinav Kumar (2021-03-04 17:31:52)
> Fix the warnings reported by kbot across MSM DP driver.

Which warnings? Can you include them? Or at least list the three things
that are being fixed in this patch?

> 
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/dp/dp_debug.c | 33 +++++----------------------------
>  drivers/gpu/drm/msm/dp/dp_hpd.c   |  4 ++--
>  drivers/gpu/drm/msm/dp/dp_power.c |  2 +-
>  3 files changed, 8 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_debug.c b/drivers/gpu/drm/msm/dp/dp_debug.c
> index 84670bc..2f6247e 100644
> --- a/drivers/gpu/drm/msm/dp/dp_debug.c
> +++ b/drivers/gpu/drm/msm/dp/dp_debug.c
> @@ -226,7 +226,7 @@ static int dp_test_data_show(struct seq_file *m, void *data)
>                                         debug->link->test_video.test_h_width);
>                         seq_printf(m, "vdisplay: %d\n",
>                                         debug->link->test_video.test_v_height);
> -                                       seq_printf(m, "bpc: %u\n",
> +                       seq_printf(m, "bpc: %u\n",
>                                         dp_link_bit_depth_to_bpc(bpc));
>                 } else
>                         seq_puts(m, "0");

Indentation.

> @@ -368,44 +368,21 @@ static int dp_debug_init(struct dp_debug *dp_debug, struct drm_minor *minor)
>         int rc = 0;
>         struct dp_debug_private *debug = container_of(dp_debug,
>                         struct dp_debug_private, dp_debug);
> -       struct dentry *file;
> -       struct dentry *test_active;
> -       struct dentry *test_data, *test_type;
>  
> -       file = debugfs_create_file("dp_debug", 0444, minor->debugfs_root,
> +       debugfs_create_file("dp_debug", 0444, minor->debugfs_root,
>                         debug, &dp_debug_fops);
> -       if (IS_ERR_OR_NULL(file)) {
> -               rc = PTR_ERR(file);
> -               DRM_ERROR("[%s] debugfs create file failed, rc=%d\n",
> -                                 DEBUG_NAME, rc);
> -       }
>  
> -       test_active = debugfs_create_file("msm_dp_test_active", 0444,
> +       debugfs_create_file("msm_dp_test_active", 0444,
>                         minor->debugfs_root,
>                         debug, &test_active_fops);
> -       if (IS_ERR_OR_NULL(test_active)) {
> -               rc = PTR_ERR(test_active);
> -               DRM_ERROR("[%s] debugfs test_active failed, rc=%d\n",
> -                                 DEBUG_NAME, rc);
> -       }
>  
> -       test_data = debugfs_create_file("msm_dp_test_data", 0444,
> +       debugfs_create_file("msm_dp_test_data", 0444,
>                         minor->debugfs_root,
>                         debug, &dp_test_data_fops);
> -       if (IS_ERR_OR_NULL(test_data)) {
> -               rc = PTR_ERR(test_data);
> -               DRM_ERROR("[%s] debugfs test_data failed, rc=%d\n",
> -                                 DEBUG_NAME, rc);
> -       }
>  
> -       test_type = debugfs_create_file("msm_dp_test_type", 0444,
> +       debugfs_create_file("msm_dp_test_type", 0444,
>                         minor->debugfs_root,
>                         debug, &dp_test_type_fops);
> -       if (IS_ERR_OR_NULL(test_type)) {
> -               rc = PTR_ERR(test_type);
> -               DRM_ERROR("[%s] debugfs test_type failed, rc=%d\n",
> -                                 DEBUG_NAME, rc);
> -       }

Debugfs failures.

>  
>         debug->root = minor->debugfs_root;
>  
> diff --git a/drivers/gpu/drm/msm/dp/dp_hpd.c b/drivers/gpu/drm/msm/dp/dp_hpd.c
> index 5b8fe3202..e1c90fa 100644
> --- a/drivers/gpu/drm/msm/dp/dp_hpd.c
> +++ b/drivers/gpu/drm/msm/dp/dp_hpd.c
> @@ -34,8 +34,8 @@ int dp_hpd_connect(struct dp_usbpd *dp_usbpd, bool hpd)
>  
>         dp_usbpd->hpd_high = hpd;
>  
> -       if (!hpd_priv->dp_cb && !hpd_priv->dp_cb->configure
> -                               && !hpd_priv->dp_cb->disconnect) {
> +       if (!hpd_priv->dp_cb || !hpd_priv->dp_cb->configure
> +                               || !hpd_priv->dp_cb->disconnect) {

Logical error.

>                 pr_err("hpd dp_cb not initialized\n");
>                 return -EINVAL;
>         }
> diff --git a/drivers/gpu/drm/msm/dp/dp_power.c b/drivers/gpu/drm/msm/dp/dp_power.c
> index 9c4ea00..3961ba4 100644
> --- a/drivers/gpu/drm/msm/dp/dp_power.c
> +++ b/drivers/gpu/drm/msm/dp/dp_power.c
> @@ -269,7 +269,7 @@ int dp_power_clk_enable(struct dp_power *dp_power,
>                 DRM_ERROR("failed to '%s' clks for: %s. err=%d\n",
>                         enable ? "enable" : "disable",
>                         dp_parser_pm_name(pm_type), rc);
> -                       return rc;
> +               return rc;

Indentation.

>         }
>  
>         if (pm_type == DP_CORE_PM)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
