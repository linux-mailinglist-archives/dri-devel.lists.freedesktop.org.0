Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DFC0526397F
	for <lists+dri-devel@lfdr.de>; Thu, 10 Sep 2020 03:21:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B04089E19;
	Thu, 10 Sep 2020 01:20:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6EF389823;
 Thu, 10 Sep 2020 01:20:54 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id c8so4602226edv.5;
 Wed, 09 Sep 2020 18:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3wo5Yjx1lQEjY7epFrCqThFC2PcTK5CRikb0clhHXKk=;
 b=QMFXPPGMl8QHVTh2ApEhSZ3Tt8VEhnHxuEO4uINaauJJ9FhZL6Un4/0TGdvyZ160v9
 9M7XWBUv1mNEkPAyoNrR7pRR6A+sw0RGjjcnWcUcJlOhaCow8fH473GP7Gy+9F0jWZfC
 FWPt3McCLvFKqGIR8csTB7Q6Pp++S+U6wmwYlS4HCkHwNV1zL2sd2JCWHTxWZKkepTe2
 AxK5HjK9kysTq8K5NmKf+buv00NKqWqiMblXTnXDsyrDKfFDzIamm/ALPfBdFVJ54qcF
 QfglbjTgKwcXA2olqyv8MKRUfN1/heAee39AwsBgw2sLOfkBE3XNcmHMv6KgSwElLtZt
 OwpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3wo5Yjx1lQEjY7epFrCqThFC2PcTK5CRikb0clhHXKk=;
 b=g7/UGeqd/5gtED72m/mdQPi/lDi7lc8TmRXlAzNBlGdQZxVmtew8eqkTluOJuWeI0S
 eNTWgVOqdYh1yZ1SBl7tloc/ioSmF2nn4f6c0qjvJiK9HBWlbp05LtxhCoEEctN5/DG1
 IRHrtijbcUpTR5EFfE5cQRuJHwtIVtaZniL3SZ6ZorQBu/km2f8WG2e8U6EYNQj7SBqH
 qC/mjMcj7leYry5p8Y+QLhLVxO2EOuLHpeGFNBEAexaQgdluOzcPH8hSKFoHqBj9b3vC
 5i54GfKjCOQmW619TvItZF3KtNaWjE97fo8FP+W2MBleKzXlLj7czsARuQK+3xLdrMSu
 C1hw==
X-Gm-Message-State: AOAM531WUjDP9Cz8TFa0oM0lIO/zeTBWUEA5u+4wRejhjKei+M0lxDux
 t+xu859KNDQNJOUOeqC7XqsxZ07I/k1fVZ1upfjFcfMu
X-Google-Smtp-Source: ABdhPJxuR1PoFpW/PHJZ2wDyACj/8Dwk9fs7XPkbu+vjLOtNJ/jscovOE+Dayr5DadVVNk8c0H58zKLfiD3KaUhPyj4=
X-Received: by 2002:a05:6402:1219:: with SMTP id
 c25mr7137254edw.220.1599700853417; 
 Wed, 09 Sep 2020 18:20:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200904143941.110665-1-daniel.vetter@ffwll.ch>
 <20200904143941.110665-2-daniel.vetter@ffwll.ch>
In-Reply-To: <20200904143941.110665-2-daniel.vetter@ffwll.ch>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 10 Sep 2020 11:20:41 +1000
Message-ID: <CAPM=9twn+NOZL=QJCH2-Uat4Srk6MQ3iirb0aHWwC_pXWaLOOw@mail.gmail.com>
Subject: Re: [PATCH 01/24] drm/armada: Use devm_drm_dev_alloc
To: Daniel Vetter <daniel.vetter@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Russell King <linux@armlinux.org.uk>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For the two armada patches.

Reviewed-by: Dave Airlie <airlied@redhat.com>

On Sat, 5 Sep 2020 at 00:40, Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
>
> Also remove the now no longer needed build bug on since that's already
> not needed anymore with drmm_add_final_kfree. Conversion to managed
> drm_device cleanup is easy, the final drm_dev_put() is already the
> last thing in both the bind unbind as in the unbind flow.
>
> Also, this relies on component.c correctly wrapping bind&unbind in
> separate devres groups, which it does.
>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Russell King <linux@armlinux.org.uk>
> ---
>  drivers/gpu/drm/armada/armada_drv.c | 26 ++++++--------------------
>  1 file changed, 6 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/gpu/drm/armada/armada_drv.c b/drivers/gpu/drm/armada/armada_drv.c
> index 5fc25c3f445c..a8d5908b3922 100644
> --- a/drivers/gpu/drm/armada/armada_drv.c
> +++ b/drivers/gpu/drm/armada/armada_drv.c
> @@ -87,24 +87,13 @@ static int armada_drm_bind(struct device *dev)
>                                      "armada-drm"))
>                 return -EBUSY;
>
> -       priv = kzalloc(sizeof(*priv), GFP_KERNEL);
> -       if (!priv)
> -               return -ENOMEM;
> -
> -       /*
> -        * The drm_device structure must be at the start of
> -        * armada_private for drm_dev_put() to work correctly.
> -        */
> -       BUILD_BUG_ON(offsetof(struct armada_private, drm) != 0);
> -
> -       ret = drm_dev_init(&priv->drm, &armada_drm_driver, dev);
> -       if (ret) {
> -               dev_err(dev, "[" DRM_NAME ":%s] drm_dev_init failed: %d\n",
> -                       __func__, ret);
> -               kfree(priv);
> -               return ret;
> +       priv = devm_drm_dev_alloc(dev, &armada_drm_driver,
> +                                 struct armada_private, drm);
> +       if (IS_ERR(priv)) {
> +               dev_err(dev, "[" DRM_NAME ":%s] devm_drm_dev_alloc failed: %li\n",
> +                       __func__, PTR_ERR(priv));
> +               return PTR_ERR(priv);
>         }
> -       drmm_add_final_kfree(&priv->drm, priv);
>
>         /* Remove early framebuffers */
>         ret = drm_fb_helper_remove_conflicting_framebuffers(NULL,
> @@ -174,7 +163,6 @@ static int armada_drm_bind(struct device *dev)
>   err_kms:
>         drm_mode_config_cleanup(&priv->drm);
>         drm_mm_takedown(&priv->linear);
> -       drm_dev_put(&priv->drm);
>         return ret;
>  }
>
> @@ -194,8 +182,6 @@ static void armada_drm_unbind(struct device *dev)
>
>         drm_mode_config_cleanup(&priv->drm);
>         drm_mm_takedown(&priv->linear);
> -
> -       drm_dev_put(&priv->drm);
>  }
>
>  static int compare_of(struct device *dev, void *data)
> --
> 2.28.0
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
