Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF474358195
	for <lists+dri-devel@lfdr.de>; Thu,  8 Apr 2021 13:20:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F326E6EA9D;
	Thu,  8 Apr 2021 11:20:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 209D06EA9D
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Apr 2021 11:20:23 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 o20-20020a05600c4fd4b0290114265518afso1024454wmq.4
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Apr 2021 04:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=p9/vcGnQMibF9rkDWZtUMCI7BNJHmwZHzupvVKqVu3E=;
 b=YnHMsaO2s1KNWHEyZA+FBnXLbzo0kKMYlmU9l9iP1g4DGl7O4FRzWyFDCE5BWmlipe
 byHjyxws/nm6+Um0woHg/dDHbRJEKezIUFT3iWU5a8w1PU2e7m+WM6pVFy2MfWlfxoAa
 LoEdm8nFSDszG2vkXnarWkoZ7cVvGd0uGCunY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=p9/vcGnQMibF9rkDWZtUMCI7BNJHmwZHzupvVKqVu3E=;
 b=VPzwNhElo0qQL75596n3FXQrTeLuxlyLhIf7mgKe/WP1yF3eKvikVwi9JQoqMQxz5M
 pYsNzMvQlbp1n230I0AL90/yoPMpxWrxfKMkS+eys/YS3SkRLiI1PMS6g6g+Tx5DHYy6
 4igdsFUHVTakx/bIDO2Vev+BfCUAiKXz6ObyQW0lhwEc1O6WqxgLhF3ru+XIClzS7+oj
 gYx03ponkLI+NPdgfnfaaxQfzpC643kXG0kXqO1rSmRO1209LfQNcfU6bxZaCfJksJDK
 uvByPBAwbuniJ4KSyRN+jS9Pb0BStlf0pcSBc/D+GXI2mP25e1ADV5c78+qWrPh8/5Wq
 hAIA==
X-Gm-Message-State: AOAM531ScsQLK3/KmoghNkd9x7iaKLc5mOYIPPHf0V8vKGxPkys35tln
 40d01w4ORL9jut4M/ZesnmVd2w==
X-Google-Smtp-Source: ABdhPJyGIebRl0LCNGA8cQnrb+fYGQT/Pf+/l14E/xAG36Cx4IwUC+NrIjreWsTLESHVxP3rRmlSCQ==
X-Received: by 2002:a05:600c:4fd0:: with SMTP id
 o16mr7872267wmq.123.1617880821826; 
 Thu, 08 Apr 2021 04:20:21 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id c16sm55234757wrs.81.2021.04.08.04.20.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Apr 2021 04:20:21 -0700 (PDT)
Date: Thu, 8 Apr 2021 13:20:19 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Huang Guobin <huangguobin4@huawei.com>
Subject: Re: [PATCH -next] gma500: Use DEFINE_SPINLOCK() for spinlock
Message-ID: <YG7m8z5n223DqDht@phenom.ffwll.local>
Mail-Followup-To: Huang Guobin <huangguobin4@huawei.com>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <1617710114-48071-1-git-send-email-huangguobin4@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1617710114-48071-1-git-send-email-huangguobin4@huawei.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 06, 2021 at 07:55:14PM +0800, Huang Guobin wrote:
> From: Guobin Huang <huangguobin4@huawei.com>
> 
> spinlock can be initialized automatically with DEFINE_SPINLOCK()
> rather than explicitly calling spin_lock_init().
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Guobin Huang <huangguobin4@huawei.com>

Applied to drm-misc-next, thanks for your patch.
-Daniel

> ---
>  drivers/gpu/drm/gma500/power.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/gma500/power.c b/drivers/gpu/drm/gma500/power.c
> index 56ef88237ef6..f07641dfa5a4 100644
> --- a/drivers/gpu/drm/gma500/power.c
> +++ b/drivers/gpu/drm/gma500/power.c
> @@ -36,7 +36,7 @@
>  #include <linux/pm_runtime.h>
>  
>  static struct mutex power_mutex;	/* Serialize power ops */
> -static spinlock_t power_ctrl_lock;	/* Serialize power claim */
> +static DEFINE_SPINLOCK(power_ctrl_lock);	/* Serialize power claim */
>  
>  /**
>   *	gma_power_init		-	initialise power manager
> @@ -55,7 +55,6 @@ void gma_power_init(struct drm_device *dev)
>  	dev_priv->display_power = true;	/* We start active */
>  	dev_priv->display_count = 0;	/* Currently no users */
>  	dev_priv->suspended = false;	/* And not suspended */
> -	spin_lock_init(&power_ctrl_lock);
>  	mutex_init(&power_mutex);
>  
>  	if (dev_priv->ops->init_pm)
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
