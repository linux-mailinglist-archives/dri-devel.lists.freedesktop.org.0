Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDAA46D00A1
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 12:05:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B18BC10ED94;
	Thu, 30 Mar 2023 10:05:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com
 [IPv6:2607:f8b0:4864:20::b2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D89F10ED94
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 10:05:30 +0000 (UTC)
Received: by mail-yb1-xb2b.google.com with SMTP id j7so22775911ybg.4
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 03:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680170729;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=WgoKuCIBwgckhU5BejJJvSWb2GJbmr7RiOOAd94YUdI=;
 b=ag1ZcK0+OFBcxgjI+fRJFjlY/GQ96iAeX/H8l3sgMulu4IkZjsFGuCjMItmFk0bnuT
 dRP2YrCnbGrvI3a2iS0900ToZZ2DZZH40LZGQIvUqI1WRBDT19EyiGu/Pcv9ZMeDzUS9
 37x5rght4u+Fmc/wzsF05sSMndMFL1qDPKZ6kfmOEvGvCmh3GB/ogemvpEvv/ca+1Wif
 2lva36DCMhHqFfxRwaNqLp/OMr9VUfQvbzI1fTi+x8VwMZ/ZWctUmADBPTPBM78qW6Uu
 Ki549T8+Ny2y5iBEB2kZ1F9WCYuRtBXLHh27LPLhE+X5D9ylcFl5KJGVsVLmh2bmOM8h
 0JrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680170729;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WgoKuCIBwgckhU5BejJJvSWb2GJbmr7RiOOAd94YUdI=;
 b=7ypUoVqIl/MOO5vpAtt7WI2puZbi+T+zp0tuQ7RqNEKqWWoDUe2/lBxDzpQ0HmZM46
 6daRU/ZCW++QbqhCfxcYZfmNIN5KWdYe4A6qg1saQmwNI2cKdG4es5wqZNQ4X4mKQ1BR
 JyYx8YGXkT1VFuJ6GQo/HNCKplE1a67gCCZ88zreHCjUtD8g9ONp6cl39MRlY2473oYB
 SsSUjVwhQMqk+RLBvSlV2ra7BebiQj/VFerLvB2pXXjxy/CPwYgETq/jZCEYQMe3q3iH
 GEvhBLXSjO7xDE/MnUuJGpVAmD88Gy49PvWX/w53IH5wX/fTlHCIu/Ib1ITova3keNG0
 yTew==
X-Gm-Message-State: AAQBX9dGtvc9eFhTxXO1daKH4FlNDRoqVDz4MheVIVX0wrd1Xp65zjJi
 PFi5B7D+AYbjSgCGUOgtqGQgCukapE5uZHemHx5xAA==
X-Google-Smtp-Source: AKy350ZipAZcOkTjtM8Tf0YDGNmJgPaAsrxIL1oh8fvqdo2Gaqh00PpDJqjToaaRqtiHvVoYDF6PBqnJqmYASCGNMLk=
X-Received: by 2002:a05:6902:1549:b0:b77:be38:6406 with SMTP id
 r9-20020a056902154900b00b77be386406mr11733804ybu.9.1680170729341; Thu, 30 Mar
 2023 03:05:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230330074150.7637-1-tzimmermann@suse.de>
 <20230330074150.7637-6-tzimmermann@suse.de>
In-Reply-To: <20230330074150.7637-6-tzimmermann@suse.de>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 30 Mar 2023 13:05:18 +0300
Message-ID: <CAA8EJpookZF4nQjYtZjaK8FcF1iy7EJrj18UNOjhyfGDuOoBag@mail.gmail.com>
Subject: Re: [PATCH 5/6] drm/msm: Initialize fbdev DRM client
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: freedreno@lists.freedesktop.org, sean@poorly.run, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, javierm@redhat.com,
 linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 30 Mar 2023 at 10:41, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> Initialize the fbdev client in the fbdev code with empty helper
> functions. Also clean up the client. The helpers will later
> implement various functionality of the DRM client. No functional
> changes.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/msm/msm_fbdev.c | 38 +++++++++++++++++++++++++++++++--
>  1 file changed, 36 insertions(+), 2 deletions(-)

With the nit below fixed:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

>
> diff --git a/drivers/gpu/drm/msm/msm_fbdev.c b/drivers/gpu/drm/msm/msm_fbdev.c
> index 95b193a5e0d5..6c3665c5f4f6 100644
> --- a/drivers/gpu/drm/msm/msm_fbdev.c
> +++ b/drivers/gpu/drm/msm/msm_fbdev.c
> @@ -119,6 +119,30 @@ static const struct drm_fb_helper_funcs msm_fb_helper_funcs = {
>         .fb_probe = msm_fbdev_create,
>  };
>
> +/*
> + * struct drm_client
> + */
> +
> +static void msm_fbdev_client_unregister(struct drm_client_dev *client)
> +{ }
> +
> +static int msm_fbdev_client_restore(struct drm_client_dev *client)
> +{
> +       return 0;
> +}
> +
> +static int msm_fbdev_client_hotplug(struct drm_client_dev *client)
> +{
> +       return 0;
> +}
> +
> +static const struct drm_client_funcs msm_fbdev_client_funcs = {
> +       .owner          = THIS_MODULE,
> +       .unregister     = msm_fbdev_client_unregister,
> +       .restore        = msm_fbdev_client_restore,
> +       .hotplug        = msm_fbdev_client_hotplug,
> +};
> +
>  /* initialize fbdev helper */
>  struct drm_fb_helper *msm_fbdev_init(struct drm_device *dev)
>  {
> @@ -131,10 +155,16 @@ struct drm_fb_helper *msm_fbdev_init(struct drm_device *dev)
>
>         drm_fb_helper_prepare(dev, helper, 32, &msm_fb_helper_funcs);
>
> +       ret = drm_client_init(dev, &helper->client, "fbdev", &msm_fbdev_client_funcs);
> +       if (ret) {
> +               drm_err(dev, "Failed to register client: %d\n", ret);
> +               goto err_drm_fb_helper_unprepare;
> +       }
> +
>         ret = drm_fb_helper_init(dev, helper);
>         if (ret) {
>                 DRM_DEV_ERROR(dev->dev, "could not init fbdev: ret=%d\n", ret);
> -               goto fail;
> +               goto err_drm_client_release;
>         }
>
>         ret = drm_fb_helper_initial_config(helper);
> @@ -145,8 +175,11 @@ struct drm_fb_helper *msm_fbdev_init(struct drm_device *dev)
>
>  fini:
>         drm_fb_helper_fini(helper);
> -fail:
> +err_drm_client_release:
> +       drm_client_release(&helper->client);
> +err_drm_fb_helper_unprepare:
>         drm_fb_helper_unprepare(helper);
> +       kfree(helper);

This one should go to the patch 3

>         return NULL;
>  }
>
> @@ -168,6 +201,7 @@ void msm_fbdev_free(struct drm_device *dev)
>                 drm_framebuffer_remove(fb);
>         }
>
> +       drm_client_release(&helper->client);
>         drm_fb_helper_unprepare(helper);
>         kfree(helper);
>
> --
> 2.40.0
>


-- 
With best wishes
Dmitry
