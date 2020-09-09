Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A99382631E0
	for <lists+dri-devel@lfdr.de>; Wed,  9 Sep 2020 18:29:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C8986EC86;
	Wed,  9 Sep 2020 16:29:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C79C6EC7D;
 Wed,  9 Sep 2020 16:29:32 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id c19so17625wmd.1;
 Wed, 09 Sep 2020 09:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=FZIqICSKuKNwK5rrfHPWQmz/7gXTmA9acTIMh9JnGbM=;
 b=pi75ykfy18DV7S/NN3NBbbtZymnY6pfU6QT9a96JZddOd4mXBrZu2EdeoH7bU5oyZg
 QgR8Bu3VginuZtlSo7x97ioyCAjRzuUhdne13lhlqqlc+5p95IS189Ir/Q8kCCYeTXL/
 oTut/4NLjIMvQDwcLVGaTF3xWh73E9Wm6CFXkgxg9ZhSum/1L4p5Cy6ltUyWH5uLsIdh
 6GbcFpZzPg346YqNYIFACt+lbJL/j8Ne1BbrNot5iiXge13SDhUh28dQ961Rkmg7La36
 40F6QPGS5TLCG48vzYW2i/gzSdYVCmpCoZ4nBjfoWBaWOBh5UPP12m6ckckRGh6enyLn
 sqQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=FZIqICSKuKNwK5rrfHPWQmz/7gXTmA9acTIMh9JnGbM=;
 b=Y5pBgmXHtGG4HRcNKpkQS1Z3qzNYS+pjRqurNEIfvzvRd84NymQmQ5ja+LgFdmimoz
 ezXBywwKzLMpZZ7tvelyyqeRW60r2BZLOYTzIzgKSW9UPeCHsUnScXcN4f0nWyTx0TEY
 i50NafDfqLAOjxoBQUcufsRYmm8jokTJwc/H9+3gnryIqv1q26lDOz0BbKqmjchA9fFS
 tO3+jVeHjQzi1jtyflOMNsvsI91SakDQ47amHeZ5GRKK5XffHFpWOjvuyJm4mzfq/tQz
 kSqWxpoPeTaTUDhtiMf3vCGpRODyVqg5Vz0WVehZAV2VvFzkYRpN4ccrAbj2IJpEY193
 dy0w==
X-Gm-Message-State: AOAM532aS6UjcW80GffpsMox3cqjIFNKQvzXJka0p8+0flaoFfeMMXR1
 X+R2RKxR+KG5cfw6J7XMc8M=
X-Google-Smtp-Source: ABdhPJxfgEszsopJuCfUITEuuxF0XJNqNAJoaTz5efgeSThC9Kkv/0X0rncFsBSuKUNm6IXtsNhdyg==
X-Received: by 2002:a7b:c341:: with SMTP id l1mr4488126wmj.80.1599668971100;
 Wed, 09 Sep 2020 09:29:31 -0700 (PDT)
Received: from smtp.gmail.com (a95-92-181-29.cpe.netcabo.pt. [95.92.181.29])
 by smtp.gmail.com with ESMTPSA id l9sm4410449wmh.1.2020.09.09.09.29.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Sep 2020 09:29:30 -0700 (PDT)
Date: Wed, 9 Sep 2020 13:29:24 -0300
From: Melissa Wen <melissa.srw@gmail.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 04/24] drm/vgem: Use devm_drm_dev_alloc
Message-ID: <20200909162924.nfqxv5pcmnbq3hmi@smtp.gmail.com>
References: <20200904143941.110665-1-daniel.vetter@ffwll.ch>
 <20200904143941.110665-5-daniel.vetter@ffwll.ch>
 <20200909110144.pyptgix7y7yftuxy@smtp.gmail.com>
 <CAKMK7uFJ3Yf-rnb5VAYj1xF2VZmoY+yt+zWyRcaMLU0t6eCyoA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uFJ3Yf-rnb5VAYj1xF2VZmoY+yt+zWyRcaMLU0t6eCyoA@mail.gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>, Sean Paul <seanpaul@chromium.org>,
 Sam Ravnborg <sam@ravnborg.org>, Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/09, Daniel Vetter wrote:
> On Wed, Sep 9, 2020 at 1:01 PM Melissa Wen <melissa.srw@gmail.com> wrote:
> >
> > Hi Daniel,
> >
> > looks good to me, just a few things inline.
> >
> > On 09/04, Daniel Vetter wrote:
> > > This means we also need to slightly restructure the exit code, so that
> > > final cleanup of the drm_device is triggered by unregistering the
> > > platform device. Note that devres is both clean up when the driver is
> > > unbound (not the case for vgem, we don't bind), and also when unregistering
> > > the device (very much the case for vgem). Therefore we can rely on devres
> > > even though vgem isn't a proper platform device driver.
> > >
> > > This also somewhat untangles the load code, since the drm and platform device
> > > setup are no longer interleaved, but two distinct steps.
> > >
> > > v2: use devres_open/release_group so we can use devm without real
> > > hacks in the driver core or having to create an entire fake bus for
> > > testing drivers. Might want to extract this into helpers eventually,
> > > maybe as a mock_drm_dev_alloc or test_drm_dev_alloc.
> > >
> > > Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > > Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> > > Cc: Emil Velikov <emil.velikov@collabora.com>
> > > Cc: Sean Paul <seanpaul@chromium.org>
> > > Cc: Chris Wilson <chris@chris-wilson.co.uk>
> > > Cc: Sam Ravnborg <sam@ravnborg.org>
> > > Cc: Rob Clark <robdclark@chromium.org>
> > > ---
> > >  drivers/gpu/drm/vgem/vgem_drv.c | 55 ++++++++++++++-------------------
> > >  1 file changed, 24 insertions(+), 31 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/vgem/vgem_drv.c b/drivers/gpu/drm/vgem/vgem_drv.c
> > > index 313339bbff90..f95537627463 100644
> > > --- a/drivers/gpu/drm/vgem/vgem_drv.c
> > > +++ b/drivers/gpu/drm/vgem/vgem_drv.c
> > > @@ -401,16 +401,8 @@ static int vgem_prime_mmap(struct drm_gem_object *obj,
> > >       return 0;
> > >  }
> > >
> > > -static void vgem_release(struct drm_device *dev)
> > > -{
> > > -     struct vgem_device *vgem = container_of(dev, typeof(*vgem), drm);
> > > -
> > > -     platform_device_unregister(vgem->platform);
> > > -}
> > > -
> > >  static struct drm_driver vgem_driver = {
> > >       .driver_features                = DRIVER_GEM | DRIVER_RENDER,
> > > -     .release                        = vgem_release,
> > >       .open                           = vgem_open,
> > >       .postclose                      = vgem_postclose,
> > >       .gem_free_object_unlocked       = vgem_gem_free_object,
> > > @@ -442,48 +434,49 @@ static struct drm_driver vgem_driver = {
> > >  static int __init vgem_init(void)
> > >  {
> > >       int ret;
> > > +     struct platform_device *pdev;
> > >
> > > -     vgem_device = kzalloc(sizeof(*vgem_device), GFP_KERNEL);
> > > -     if (!vgem_device)
> > > -             return -ENOMEM;
> > > +     pdev = platform_device_register_simple("vgem", -1, NULL, 0);
> > > +     if (IS_ERR(pdev))
> > > +             return PTR_ERR(vgem_device->platform);
> > I caught this line right above.
> > It should be: return PTR_ERR (pdev), right?
> 
> Yes I will fix.
> 
> > > -     vgem_device->platform =
> > > -             platform_device_register_simple("vgem", -1, NULL, 0);
> > > -     if (IS_ERR(vgem_device->platform)) {
> > > -             ret = PTR_ERR(vgem_device->platform);
> > > -             goto out_free;
> > > +     if (!devres_open_group(&pdev->dev, NULL, GFP_KERNEL)) {
> > > +             ret = -ENOMEM;
> > > +             goto out_unregister;
> > >       }
> > >
> > > -     dma_coerce_mask_and_coherent(&vgem_device->platform->dev,
> > > +     dma_coerce_mask_and_coherent(&pdev->dev,
> > >                                    DMA_BIT_MASK(64));
> > > -     ret = drm_dev_init(&vgem_device->drm, &vgem_driver,
> > > -                        &vgem_device->platform->dev);
> > > -     if (ret)
> > > -             goto out_unregister;
> > > -     drmm_add_final_kfree(&vgem_device->drm, vgem_device);
> > > +
> > > +     vgem_device = devm_drm_dev_alloc(&pdev->dev, &vgem_driver,
> > > +                                      struct vgem_device, drm);
> > > +     if (IS_ERR(vgem_device)) {
> > > +             ret = PTR_ERR(vgem_device);
> > > +             goto out_devres;
> > > +     }
> > > +     vgem_device->platform = pdev;
> > >
> > >       /* Final step: expose the device/driver to userspace */
> > >       ret = drm_dev_register(&vgem_device->drm, 0);
> > >       if (ret)
> > > -             goto out_put;
> > > +             goto out_devres;
> > >
> > >       return 0;
> > >
> > > -out_put:
> > > -     drm_dev_put(&vgem_device->drm);
> > > -     platform_device_unregister(vgem_device->platform);
> > > -     return ret;
> > > +out_devres:
> > > +     devres_release_group(&pdev->dev, NULL);
> > >  out_unregister:
> > > -     platform_device_unregister(vgem_device->platform);
> > > -out_free:
> > > -     kfree(vgem_device);
> > > +     platform_device_unregister(pdev);
> > >       return ret;
> > >  }
> > >
> > >  static void __exit vgem_exit(void)
> > >  {
> > > +     struct platform_device *pdev = vgem_device->platform;
> > > +
> > Well, there has never been a check for a null vgem_device here before,
> > as in vkms. Should?
> 
> I think it should, but that's kinda a separate patch. Want to type it?

Make sense. Ok, I can do that.

> -Daniel
> 
> > >       drm_dev_unregister(&vgem_device->drm);
> > > -     drm_dev_put(&vgem_device->drm);
> > > +     devres_release_group(&pdev->dev, NULL);
> > > +     platform_device_unregister(pdev);
> > >  }
> > >
> > >  module_init(vgem_init);
> > > --
> > > 2.28.0
> >
> > Apart from these two points,
> >
> > Reviewed-by: Melissa Wen <melissa.srw@gmail.com>
> >
> > Thanks!
> > >
> > > _______________________________________________
> > > dri-devel mailing list
> > > dri-devel@lists.freedesktop.org
> > > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> 
> 
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
