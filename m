Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 149DE2703DD
	for <lists+dri-devel@lfdr.de>; Fri, 18 Sep 2020 20:22:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C56DB6ED64;
	Fri, 18 Sep 2020 18:22:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA9C66ED62
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Sep 2020 18:22:51 +0000 (UTC)
Received: by mail-ot1-x344.google.com with SMTP id m12so6284191otr.0
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Sep 2020 11:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Wpdm4fu8wFYkx5B5Un4U8kA8wfZLrQtiRHXSV+GvGds=;
 b=klSBawIsIGKo6Al0yL0GbADaJQWVgVu6pnv5nQ2IvtYOqR+pZcnfQGOwrsTxwXEB4j
 WTq1QqRJRuI17Gt6+KMCXvcRGAEkz2KXzXJkXdjA4q4zK+VuD4BXyYqk8EWUi3S4FFgz
 zK9ehU3h9OGAauBSAq+ORkYpBoY9p8xfc7bF0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Wpdm4fu8wFYkx5B5Un4U8kA8wfZLrQtiRHXSV+GvGds=;
 b=E596aJqakZpuysj4pSdVaUAT+e4uiC8SNWfoF0H2XIxRO8GUNtVmCJTv1E67KUMiwQ
 M43wz8nbgOUgigQ4YHLMMP1WvTQpso8nL4uGwUVU1490CruUnBjxVvK4kkwAXz+RfhcS
 FgGkDygzITJGRahT5fesszxt1dux33Tlkaum7CEW6wAN1mtBvrmUzUtDFb6eCrg5j7Bb
 hgT1m4WklNFjq6n75S2wFhXP5KA9aBUPsBq4wGnYatTGZIl0+2xwCiqPoCqIadxzy4Kj
 gI50EYbSQy5qmq/U2y3XfjT66nRH7d0iFdllQEWxhpQRZ9GwVVzWsvTF3EjWAF9Ymld1
 fdQg==
X-Gm-Message-State: AOAM531jDzMlKHXZhcCpacunda+A6lGWN0jXtXfa2OqjOPLWDIsGqYLU
 +iTqpFtkmONC+bKb47EQKUEsywL9yULyWeF8GDMEzQ==
X-Google-Smtp-Source: ABdhPJyMsifoMM+DxpbUGBbI9+OpoKJu2Hz4xJ7Ik6acnCoSjQxtnxWDM6eVwwByrTc0vOMz+TxT8gZu6D3HxL8PlVk=
X-Received: by 2002:a9d:4b99:: with SMTP id k25mr25022655otf.281.1600453370899; 
 Fri, 18 Sep 2020 11:22:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200918132505.2316382-1-daniel.vetter@ffwll.ch>
 <20200918132505.2316382-3-daniel.vetter@ffwll.ch>
 <CAM0jSHOsowOK2Vytfv4MWVTToFs-6pShMyoZy1Or90zZysH_gg@mail.gmail.com>
In-Reply-To: <CAM0jSHOsowOK2Vytfv4MWVTToFs-6pShMyoZy1Or90zZysH_gg@mail.gmail.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Fri, 18 Sep 2020 20:22:39 +0200
Message-ID: <CAKMK7uEZKVZ2T2jHg_XLo+N=_9AnBZxB668wFpEXGedNDE+b2A@mail.gmail.com>
Subject: Re: [PATCH 2/4] drm/i915/selftests: align more to real device
 lifetimes
To: Matthew Auld <matthew.william.auld@gmail.com>
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
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Sep 18, 2020 at 7:50 PM Matthew Auld
<matthew.william.auld@gmail.com> wrote:
>
> On Fri, 18 Sep 2020 at 14:25, Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> >
> > The big change is device_add so that device_del can auto-cleanup
> > devres resources. This allows us to use devm_drm_dev_alloc, which
> > removes the last user of drm_dev_init.
> >
> > v2: Rebased
> >
> > v3: use devres_open/release_group so we can use devm without real
> > hacks in the driver core or having to create an entire fake bus for
> > testing drivers. Might want to extract this into helpers eventually,
> > maybe as a mock_drm_dev_alloc or test_drm_dev_alloc.
> >
> > v4:
> > - Fix IS_ERR handling (Matt)
> > - Delete surplus put_device() in mock_device_release (intel-gfx-ci)
> >
> > Cc: Matthew Auld <matthew.william.auld@gmail.com>
> > Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com> (v3)
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > ---
> >  .../gpu/drm/i915/selftests/mock_gem_device.c  | 44 +++++++++++--------
> >  1 file changed, 25 insertions(+), 19 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/selftests/mock_gem_device.c b/drivers/gpu/drm/i915/selftests/mock_gem_device.c
> > index ac600d395c8f..816f9af15fb3 100644
> > --- a/drivers/gpu/drm/i915/selftests/mock_gem_device.c
> > +++ b/drivers/gpu/drm/i915/selftests/mock_gem_device.c
> > @@ -79,8 +79,6 @@ static void mock_device_release(struct drm_device *dev)
> >
> >  out:
> >         i915_params_free(&i915->params);
> > -       put_device(&i915->drm.pdev->dev);
> > -       i915->drm.pdev = NULL;
> >  }
> >
> >  static struct drm_driver mock_driver = {
> > @@ -128,12 +126,6 @@ struct drm_i915_private *mock_gem_device(void)
> >         pdev = kzalloc(sizeof(*pdev), GFP_KERNEL);
> >         if (!pdev)
> >                 return NULL;
> > -       i915 = kzalloc(sizeof(*i915), GFP_KERNEL);
> > -       if (!i915) {
> > -               kfree(pdev);
> > -               return NULL;
> > -       }
> > -
> >         device_initialize(&pdev->dev);
> >         pdev->class = PCI_BASE_CLASS_DISPLAY << 16;
> >         pdev->dev.release = release_dev;
> > @@ -144,8 +136,29 @@ struct drm_i915_private *mock_gem_device(void)
> >         /* HACK to disable iommu for the fake device; force identity mapping */
> >         pdev->dev.iommu = &fake_iommu;
> >  #endif
> > +       err = device_add(&pdev->dev);
> > +       if (err) {
> > +               kfree(pdev);
> > +               return NULL;
> > +       }
> > +
> > +       if (!devres_open_group(&pdev->dev, NULL, GFP_KERNEL)) {
> > +               device_del(&pdev->dev);
> > +               return NULL;
> > +       }
> > +
> > +       i915 = devm_drm_dev_alloc(&pdev->dev, &mock_driver,
> > +                                 struct drm_i915_private, drm);
> > +       if (IS_ERR(i915)) {
> > +               pr_err("Failed to allocate mock GEM device: err=%d\n", err);
>
> err = PTR_ERR(i915)

Are you sure? We return a pointer here, and callers just expect NULL
when stuff fails (so neither errno nor ptr-encoded errno).
-Daniel

> Reviewed-by: Matthew Auld <matthew.auld@intel.com>



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
