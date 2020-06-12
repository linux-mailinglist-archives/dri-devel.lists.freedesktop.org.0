Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 851831F727C
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jun 2020 05:35:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E608C6E118;
	Fri, 12 Jun 2020 03:35:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8314C6E118
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jun 2020 03:35:17 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id m21so5391332eds.13
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jun 2020 20:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JI0DNPn0mw2LeMlZNFJRm1edlcByvB+ztrobwB0kc+E=;
 b=mdLTSaXFlWPjeajIEmpqRY79+v8n+HTgR1ixiGuHs6QowIsjXdzilsXizLL+GazUcG
 L0WBxq2M56fbGgeki9m3OVbU09IzsSHmNA01mr4WtAf0ESZG0a/cDv4u0ncwf4oVjrup
 7Jxsoj5gDHfefQ+3nOSTiJM1SncSGePaZrIhMMoixML/d2XVI28BF40AjeQULB/YLxoQ
 XXqWLzW2y+NoB5Lh2uzgk3tNsOXwtVFjbBZph14hxsOAJnC9ZzCNANqjAxIXOBNvfV0r
 +dGtEnU4XenQZP/X//lu00UwSIsIKGRfEp36uNzzsexNnQQ6lHRsKmZ8oJb+layfj1BW
 1wrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JI0DNPn0mw2LeMlZNFJRm1edlcByvB+ztrobwB0kc+E=;
 b=hPif9lTFRNCKLbUwwyDqT/hYnC9JJilvnAdK3yUCJ5QKA3Ao2rAR2yYm6+fq2P9kk3
 L9NvX22DScjaxK9XBd3yTGuvmtebKDaSL0SaI1n+t9JsVNImzoyyV8iuIh9RRXqoKx9D
 fJPC/lx4TpnYyMF4aGKlF72TjSLqZWTj+VmumVyntxD6rGr8Pba2NdZi0ve86YNS+Y9c
 MS8cy/ViIvxT3GqPCYOLt7ziaUIg9CdCAQ9EJ67UHlv7QmX/ypJwtsz3l7cKrmblkpDc
 rfMwZ8iuStqXp8vFRuau31ivCqJi5ouUdPJvwQtMYUCjpzVNBEjqksqo0h92lciHElYZ
 /hGg==
X-Gm-Message-State: AOAM532KF6pjDAUxqND8SOUD8CmW4v+6LNnhBJM9DWKT4X0MBgyJpiTm
 VsombTI/GuTU5mEqL0+J0ENwLZcrSWiqsWiS4tw=
X-Google-Smtp-Source: ABdhPJyKpe0ygVRxt8U4uiWEZG2UakTSkk+OREQUkSZTXvJKUzlUUdzylujk0khPi5w2RtnMhnW2lccL8SConn8oCsE=
X-Received: by 2002:a50:98c1:: with SMTP id j59mr9971040edb.120.1591932916015; 
 Thu, 11 Jun 2020 20:35:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200610004659.10401-1-abhinavk@codeaurora.org>
In-Reply-To: <20200610004659.10401-1-abhinavk@codeaurora.org>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 11 Jun 2020 20:35:41 -0700
Message-ID: <CAF6AEGsOX_QoOnMhqKuUHhhNjL_PgxF_5O7sYKi1Hkj5FmRpGw@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: call drm_mode_config_reset before
 drm_dev_register
To: Abhinav Kumar <abhinavk@codeaurora.org>
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
Cc: linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, pdhaval@codeaurora.org,
 Sean Paul <seanpaul@chromium.org>, aravindh@codeaurora.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 9, 2020 at 5:47 PM Abhinav Kumar <abhinavk@codeaurora.org> wrote:
>
> As per the documentation of drm_dev_register, all drivers should
> call drm_dev_register after all the initialization is completed.
> This also means that drm_mode_config_reset should be done before
> drm_dev_register.
>
> Change the sequence to align with this documentation.
>
> Signed-off-by: Abhinav Kumar <abhinavk@codeaurora.org>

I assume this is just a cleanup you noticed, and not fixing a bug you
are hitting (in which case I'll pick it up next merge window, rather
than -fixes)

Reviewed-by: Rob Clark <robdclark@gmail.com>

> ---
>  drivers/gpu/drm/msm/msm_drv.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index 29295dee2a2e..9e77cc7f1fa4 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -538,12 +538,12 @@ static int msm_drm_init(struct device *dev, struct drm_driver *drv)
>                 }
>         }
>
> +       drm_mode_config_reset(ddev);
> +
>         ret = drm_dev_register(ddev, 0);
>         if (ret)
>                 goto err_msm_uninit;
>
> -       drm_mode_config_reset(ddev);
> -
>  #ifdef CONFIG_DRM_FBDEV_EMULATION
>         if (kms && fbdev)
>                 priv->fbdev = msm_fbdev_init(ddev);
> --
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
