Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1533888CAC7
	for <lists+dri-devel@lfdr.de>; Tue, 26 Mar 2024 18:28:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37A3710F15B;
	Tue, 26 Mar 2024 17:28:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="JIU8uQiO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com
 [209.85.219.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3879E10F15B
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Mar 2024 17:28:12 +0000 (UTC)
Received: by mail-yb1-f174.google.com with SMTP id
 3f1490d57ef6-dcbd1d4904dso5891416276.3
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Mar 2024 10:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711474091; x=1712078891; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=SXBeZKhcT8cc6xEPK8lT0ioRsYyHLX/6E0d+anBqJaU=;
 b=JIU8uQiO5mOERJOWv94mT46BbzSfyYN17azzl2ZctEd7LTr+juiGGn+/N52uJynyiH
 mffvpCEsiY8hGZTNE2Wr448dcnSF5PGoCVk5B0nJ5rgEavujYGv2/wdn8ZciRmD/FC2E
 wQYE7smyLvSB39vpovhKoLNQUEiUdfGaxf//UF5jzbeubCsjJHZsvBFKLtlWxKV4nGSu
 196JX+NDmRyBioXme/n5Dil0qPQ3zI6aN083zATfA1o4k3wf8X6sfZE5Q8o58JNWFBgU
 bqoSSpWIbO1tK7KdtnYuU1KxhkTZmuAxpJlwyFevnp2W3Izz6RI8xRO7Lm5QriTakqNy
 7kyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711474091; x=1712078891;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SXBeZKhcT8cc6xEPK8lT0ioRsYyHLX/6E0d+anBqJaU=;
 b=JIkIL7HUQjT+uulIU8AJDkir7tvv3hhk4iY/7o6w/r5Ye04CR1laFRIF6/7hKj+vwA
 85oa6w17UtDocW0cJONWirC0g9r8OTG3UL5p27qxdItIV6z823UhCHmorduOpBnfoblG
 jMlMP7wbXk9E2CxLdikJROrfAwUwvZmhwg9ubk+pLGWXFQyICDejEhY77ssahv5jt3qI
 VP7BrULyXGJYfvk0ax0gp2CJNqjg+DxnfdK/ySL9wcjJ1tU5gXlL2nT2h9kr0O4xqX4Q
 3UUXE5bmHpyAqqxG4GHi+Z3tsBnT2A3kpOwtA06wL1QivM6k03JaiMyPDR935YnrEfy+
 7SuA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWzfU2Mu37xoAyrtQTkkB6UxblXffGI8n/l0HeEYhj/D7XTJyz7aoW82r+/+vo8V5sMn6FRkx5SyiMbc3p4NEBa46OolxCu9sYBEX9sYz2c
X-Gm-Message-State: AOJu0YyYb0mC5rUwR4nwnmD7aaPCthXPUQLt8rNj7VR2Kkm2Lj5bnBmr
 IFDyx/xjqnqvdy37CzGtaPXJr4TIsGuTn48fpPc7OK3m9ow0QFi8oxCEbZiju9nHxFPYpO36MyL
 EzGqjz9B0JyXTfBGzkVlFYK8Uc31BXPefBAxSDw==
X-Google-Smtp-Source: AGHT+IF8oCoFpEp71E1giwtUat9k2YbUrYq99NDd4Haoh0o4mELmlRE1suS9PZwgmFksoxYgU2zB/MGudwuTU6Jk6K8=
X-Received: by 2002:a25:6605:0:b0:dcb:fa70:c09 with SMTP id
 a5-20020a256605000000b00dcbfa700c09mr7919663ybc.28.1711474091018; Tue, 26 Mar
 2024 10:28:11 -0700 (PDT)
MIME-Version: 1.0
References: <20240326-msm-dp-cleanup-v1-0-e775556ecec0@quicinc.com>
 <20240326-msm-dp-cleanup-v1-1-e775556ecec0@quicinc.com>
In-Reply-To: <20240326-msm-dp-cleanup-v1-1-e775556ecec0@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 26 Mar 2024 19:28:00 +0200
Message-ID: <CAA8EJpqfYTCwubTXF9PROwH-621u32sJ-=_Dr5z77dcHwKtQDA@mail.gmail.com>
Subject: Re: [PATCH 1/6] drm/msm/dp: Drop unused dp_debug struct
To: Bjorn Andersson <andersson@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Bjorn Andersson <quic_bjorande@quicinc.com>
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

On Tue, 26 Mar 2024 at 17:06, Bjorn Andersson <andersson@kernel.org> wrote:
>
> From: Bjorn Andersson <quic_bjorande@quicinc.com>
>
> The members of struct dp_debug are no longer used, so the only purpose
> of this struct is as a type of the return value of dp_debug_get(), to
> signal success/error.
>
> Drop the struct in favor of signalling the result of initialization
> using an int.
>
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_debug.c   | 38 ++++++++++---------------------------
>  drivers/gpu/drm/msm/dp/dp_debug.h   | 38 +++++++++++--------------------------
>  drivers/gpu/drm/msm/dp/dp_display.c | 10 ++--------
>  3 files changed, 23 insertions(+), 63 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_debug.c b/drivers/gpu/drm/msm/dp/dp_debug.c
> index eca5a02f9003..a631cbe0e599 100644
> --- a/drivers/gpu/drm/msm/dp/dp_debug.c
> +++ b/drivers/gpu/drm/msm/dp/dp_debug.c
> @@ -21,8 +21,6 @@ struct dp_debug_private {
>         struct dp_link *link;
>         struct dp_panel *panel;
>         struct drm_connector *connector;
> -
> -       struct dp_debug dp_debug;
>  };
>
>  static int dp_debug_show(struct seq_file *seq, void *p)
> @@ -199,11 +197,8 @@ static const struct file_operations test_active_fops = {
>         .write = dp_test_active_write
>  };
>
> -static void dp_debug_init(struct dp_debug *dp_debug, struct dentry *root, bool is_edp)
> +static void dp_debug_init(struct dp_debug_private *debug, struct dentry *root, bool is_edp)
>  {
> -       struct dp_debug_private *debug = container_of(dp_debug,
> -                       struct dp_debug_private, dp_debug);
> -
>         debugfs_create_file("dp_debug", 0444, root,
>                         debug, &dp_debug_fops);
>
> @@ -222,39 +217,26 @@ static void dp_debug_init(struct dp_debug *dp_debug, struct dentry *root, bool i
>         }
>  }
>
> -struct dp_debug *dp_debug_get(struct device *dev, struct dp_panel *panel,
> -               struct dp_link *link,
> -               struct drm_connector *connector,
> -               struct dentry *root, bool is_edp)
> +int dp_debug_get(struct device *dev, struct dp_panel *panel,
> +                struct dp_link *link,
> +                struct drm_connector *connector,
> +                struct dentry *root, bool is_edp)
>  {
>         struct dp_debug_private *debug;
> -       struct dp_debug *dp_debug;
> -       int rc;
>
>         if (!dev || !panel || !link) {
>                 DRM_ERROR("invalid input\n");
> -               rc = -EINVAL;
> -               goto error;
> +               return -EINVAL;
>         }
>
>         debug = devm_kzalloc(dev, sizeof(*debug), GFP_KERNEL);
> -       if (!debug) {
> -               rc = -ENOMEM;
> -               goto error;
> -       }
> +       if (!debug)
> +               return -ENOMEM;
>
> -       debug->dp_debug.debug_en = false;
>         debug->link = link;
>         debug->panel = panel;
>
> -       dp_debug = &debug->dp_debug;
> -       dp_debug->vdisplay = 0;
> -       dp_debug->hdisplay = 0;
> -       dp_debug->vrefresh = 0;
> -
> -       dp_debug_init(dp_debug, root, is_edp);
> +       dp_debug_init(debug, root, is_edp);
>
> -       return dp_debug;
> - error:
> -       return ERR_PTR(rc);
> +       return 0;

Since there is nothing more to get, could you please move the
devm_kzalloc to dp_debug_init and call it directly from dp_display.c?

>  }
> diff --git a/drivers/gpu/drm/msm/dp/dp_debug.h b/drivers/gpu/drm/msm/dp/dp_debug.h
> index 9b3b2e702f65..c57200751c9f 100644
> --- a/drivers/gpu/drm/msm/dp/dp_debug.h
> +++ b/drivers/gpu/drm/msm/dp/dp_debug.h
> @@ -9,22 +9,6 @@
>  #include "dp_panel.h"
>  #include "dp_link.h"
>
> -/**
> - * struct dp_debug
> - * @debug_en: specifies whether debug mode enabled
> - * @vdisplay: used to filter out vdisplay value
> - * @hdisplay: used to filter out hdisplay value
> - * @vrefresh: used to filter out vrefresh value
> - * @tpg_state: specifies whether tpg feature is enabled
> - */
> -struct dp_debug {
> -       bool debug_en;
> -       int aspect_ratio;
> -       int vdisplay;
> -       int hdisplay;
> -       int vrefresh;
> -};
> -
>  #if defined(CONFIG_DEBUG_FS)
>
>  /**
> @@ -41,22 +25,22 @@ struct dp_debug {
>   * This function sets up the debug module and provides a way
>   * for debugfs input to be communicated with existing modules
>   */
> -struct dp_debug *dp_debug_get(struct device *dev, struct dp_panel *panel,
> -               struct dp_link *link,
> -               struct drm_connector *connector,
> -               struct dentry *root,
> -               bool is_edp);
> +int dp_debug_get(struct device *dev, struct dp_panel *panel,
> +                struct dp_link *link,
> +                struct drm_connector *connector,
> +                struct dentry *root,
> +                bool is_edp);
>
>  #else
>
>  static inline
> -struct dp_debug *dp_debug_get(struct device *dev, struct dp_panel *panel,
> -               struct dp_link *link,
> -               struct drm_connector *connector,
> -               struct dentry *root,
> -               bool is_edp)
> +int dp_debug_get(struct device *dev, struct dp_panel *panel,
> +                struct dp_link *link,
> +                struct drm_connector *connector,
> +                struct dentry *root,
> +                bool is_edp)
>  {
> -       return ERR_PTR(-EINVAL);
> +       return -EINVAL;
>  }
>
>  #endif /* defined(CONFIG_DEBUG_FS) */
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index c4cb82af5c2f..a9187be95166 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -93,7 +93,6 @@ struct dp_display_private {
>         struct dp_link    *link;
>         struct dp_panel   *panel;
>         struct dp_ctrl    *ctrl;
> -       struct dp_debug   *debug;
>
>         struct dp_display_mode dp_mode;
>         struct msm_dp dp_display;
> @@ -1431,14 +1430,9 @@ void dp_display_debugfs_init(struct msm_dp *dp_display, struct dentry *root, boo
>         dp = container_of(dp_display, struct dp_display_private, dp_display);
>         dev = &dp->dp_display.pdev->dev;
>
> -       dp->debug = dp_debug_get(dev, dp->panel,
> -                                       dp->link, dp->dp_display.connector,
> -                                       root, is_edp);
> -       if (IS_ERR(dp->debug)) {
> -               rc = PTR_ERR(dp->debug);
> +       rc = dp_debug_get(dev, dp->panel, dp->link, dp->dp_display.connector, root, is_edp);
> +       if (rc)
>                 DRM_ERROR("failed to initialize debug, rc = %d\n", rc);
> -               dp->debug = NULL;
> -       }
>  }
>
>  int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
>
> --
> 2.43.0
>


-- 
With best wishes
Dmitry
