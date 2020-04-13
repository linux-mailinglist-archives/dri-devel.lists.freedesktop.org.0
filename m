Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84B7D1A64AD
	for <lists+dri-devel@lfdr.de>; Mon, 13 Apr 2020 11:29:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E83A26E41B;
	Mon, 13 Apr 2020 09:29:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0433A89DA5
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Apr 2020 01:39:58 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id a81so8596033wmf.5
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Apr 2020 18:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AyN/h3gL1049cpXdFDaYnbMCFESReQmxEl5EsV/QxIE=;
 b=Y7Mar2Y92zLTJMkiLnBFdWA9rU3I5813JGr8i83ybHOb4pP4+PNGPokjnSgfEz5+/R
 8MYnyp1ecfae0+5tamHFcQGnTCpFsdezVxDuM960nkfph2/lvEzASa3DRjIqMz3nLYGL
 7TIppEfABo7f5zHm72kV4gTc+G+HxCNjikMKAI5JTNPKk5CJgFl6YPXrquwnts4cP4Iz
 PMzvPU6Ys1AJPKuMrgMv9bnvYJCvXK5hiP6ZDoGBuaDhEznwe47IQkcPGH2ddDQBGjSf
 /YfXgcTJe73wOdYVBXUZDqpj77riDNgoT8RgB+6fB6wl1EjgeMz1oqF+PTya2BMyaKVr
 sVFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AyN/h3gL1049cpXdFDaYnbMCFESReQmxEl5EsV/QxIE=;
 b=S5E9TAhdceF0owvJQ5YY4qoDUstbi40sKs05Ps7oQkGOj+7my266tg0DdsjpjeBPMa
 P19cba0Ozr9TE2PnQ/i4vJ2lNQe8uQlAaEdwE+cq3TcAX185nXt/Bg3EbdvT4ccY7Cnl
 17rsDJWjOKZYc3vfDmU27vAYE2qDzKT4EQaHUcF1A0RRcVO1T2k4XtQWVb2EXVt2Ox4U
 rpNQyUAd5ZjyrcB25OGE2thwc3Kny8niQgZzKQ39Hj1byJij8YaOiv619QpcqzJ/jiF8
 yfh0Jxti1q0CvqbDEedhCz3pcDe/4H6vKDDtEl8yLLG62/iCna7+NBIoO52v/L9cte3I
 P5BA==
X-Gm-Message-State: AGi0PuYBGdgTUp7Xl+YswYYEF7jpspNe5gqrFofQWAxBWoYPJJOski0d
 DT03l+1/TLtrqqrtvBXdwD3UFUoVDtvgCT+oXphBjA==
X-Google-Smtp-Source: APiQypJGmt365lwnDZunq5BXifhgZnKlqlq44CQy7pdjPF0L6QT7kprUreBXQsd9BlOpcEgNXG8x1dTxwAnCXi37pUQ=
X-Received: by 2002:a1c:7212:: with SMTP id n18mr17213521wmc.53.1586741997265; 
 Sun, 12 Apr 2020 18:39:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200409004306.18541-1-john.stultz@linaro.org>
In-Reply-To: <20200409004306.18541-1-john.stultz@linaro.org>
From: Xinliang Liu <xinliang.liu@linaro.org>
Date: Mon, 13 Apr 2020 09:39:45 +0800
Message-ID: <CAKoKPbzCiEJRoFWMMNx+O261G6=-6Dc90qbPhNQ=M-y67LXOMg@mail.gmail.com>
Subject: Re: [PATCH] drm: kirin: Revert change to add register connect helper
 functions
To: John Stultz <john.stultz@linaro.org>
X-Mailman-Approved-At: Mon, 13 Apr 2020 09:29:25 +0000
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
Cc: Xu YiPing <xuyiping@hisilicon.com>, David Airlie <airlied@linux.ie>,
 Chen Feng <puck.chen@hisilicon.com>, lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Rongrong Zou <zourongrong@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 9 Apr 2020 at 08:43, John Stultz <john.stultz@linaro.org> wrote:
>
> Daniel noted[1] that commit d606dc9a6323 ("drm: kirin: Add
> register connect helper functions in drm init") was unnecessary
> and incorrect, as drm_dev_register does register connectors for
> us.
>
> Thus, this patch reverts the change as suggested by Daniel.
>
> [1]: https://lore.kernel.org/lkml/CAKMK7uHr5U-pPsxdQ4MpfK5v8iLjphDFug_3VTiUAf06nhS=yQ@mail.gmail.com/
>
> Cc: Xu YiPing <xuyiping@hisilicon.com>
> Cc: Rongrong Zou <zourongrong@gmail.com>
> Cc: Xinliang Liu <xinliang.liu@linaro.org>
> Cc: Xinwei Kong <kong.kongxinwei@hisilicon.com>
> Cc: Chen Feng <puck.chen@hisilicon.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: dri-devel <dri-devel@lists.freedesktop.org>
> Signed-off-by: John Stultz <john.stultz@linaro.org>

Thanks John for the fix.
Acked-by: Xinliang Liu <xinliang.liu@linaro.org>
Applied to drm-misc.

-Xinliang

> ---
>  .../gpu/drm/hisilicon/kirin/kirin_drm_ade.c   |  1 -
>  .../gpu/drm/hisilicon/kirin/kirin_drm_drv.c   | 43 -------------------
>  .../gpu/drm/hisilicon/kirin/kirin_drm_drv.h   |  1 -
>  3 files changed, 45 deletions(-)
>
> diff --git a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c
> index 86000127d4ee..c339e632522a 100644
> --- a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c
> +++ b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c
> @@ -940,7 +940,6 @@ static struct drm_driver ade_driver = {
>  };
>
>  struct kirin_drm_data ade_driver_data = {
> -       .register_connects = false,
>         .num_planes = ADE_CH_NUM,
>         .prim_plane = ADE_CH1,
>         .channel_formats = channel_formats,
> diff --git a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c
> index d3145ae877d7..4349da3e2379 100644
> --- a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c
> +++ b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c
> @@ -219,40 +219,6 @@ static int kirin_drm_kms_cleanup(struct drm_device *dev)
>         return 0;
>  }
>
> -static int kirin_drm_connectors_register(struct drm_device *dev)
> -{
> -       struct drm_connector *connector;
> -       struct drm_connector *failed_connector;
> -       struct drm_connector_list_iter conn_iter;
> -       int ret;
> -
> -       mutex_lock(&dev->mode_config.mutex);
> -       drm_connector_list_iter_begin(dev, &conn_iter);
> -       drm_for_each_connector_iter(connector, &conn_iter) {
> -               ret = drm_connector_register(connector);
> -               if (ret) {
> -                       failed_connector = connector;
> -                       goto err;
> -               }
> -       }
> -       drm_connector_list_iter_end(&conn_iter);
> -       mutex_unlock(&dev->mode_config.mutex);
> -
> -       return 0;
> -
> -err:
> -       drm_connector_list_iter_begin(dev, &conn_iter);
> -       drm_for_each_connector_iter(connector, &conn_iter) {
> -               if (failed_connector == connector)
> -                       break;
> -               drm_connector_unregister(connector);
> -       }
> -       drm_connector_list_iter_end(&conn_iter);
> -       mutex_unlock(&dev->mode_config.mutex);
> -
> -       return ret;
> -}
> -
>  static int kirin_drm_bind(struct device *dev)
>  {
>         struct kirin_drm_data *driver_data;
> @@ -279,17 +245,8 @@ static int kirin_drm_bind(struct device *dev)
>
>         drm_fbdev_generic_setup(drm_dev, 32);
>
> -       /* connectors should be registered after drm device register */
> -       if (driver_data->register_connects) {
> -               ret = kirin_drm_connectors_register(drm_dev);
> -               if (ret)
> -                       goto err_drm_dev_unregister;
> -       }
> -
>         return 0;
>
> -err_drm_dev_unregister:
> -       drm_dev_unregister(drm_dev);
>  err_kms_cleanup:
>         kirin_drm_kms_cleanup(drm_dev);
>  err_drm_dev_put:
> diff --git a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.h b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.h
> index 4d5c05a24065..dee8ec2f7f2e 100644
> --- a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.h
> +++ b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.h
> @@ -37,7 +37,6 @@ struct kirin_drm_data {
>         u32 channel_formats_cnt;
>         int config_max_width;
>         int config_max_height;
> -       bool register_connects;
>         u32 num_planes;
>         u32 prim_plane;
>
> --
> 2.17.1
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
