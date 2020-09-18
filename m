Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E36E3270409
	for <lists+dri-devel@lfdr.de>; Fri, 18 Sep 2020 20:31:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7EF66ED71;
	Fri, 18 Sep 2020 18:31:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com
 [IPv6:2607:f8b0:4864:20::e43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D8686ED6C;
 Fri, 18 Sep 2020 18:31:44 +0000 (UTC)
Received: by mail-vs1-xe43.google.com with SMTP id 5so4158496vsu.5;
 Fri, 18 Sep 2020 11:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=k3/OYonyxRAgOCoqtSIJ6EYjCIOXCelSPHuXgIN+uSk=;
 b=tHe1g1sWXc0L/XBlugrLkoXJvnFyyniMWz8kHITltlHJziVQSi1h/AHZi4Pkt5FzX9
 leNf68HmyP8oKARvHcR2Yeq3lsYAZbR+X7tmmMduaOkUEkvfoN0WCoiq7tMFoviXA2RZ
 S+a6i3UT7EcD6vAByHO99fuWq6NXsV/HJAXVK6ZO+83YiurqAxvCZMNkV8DhSkd9f77v
 bP4JV0qObDKw2Rl8h21lmS6Q7eYbcdMI46bUKO84A69nYpGXcgxwDJQSBExE2uLRKeKW
 HfuifgMd+BEkthUVQy37F9RK4A6yV1551jwCkt411/yfk2UrfHhUCAp2e9r79x8v+mXs
 jFsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=k3/OYonyxRAgOCoqtSIJ6EYjCIOXCelSPHuXgIN+uSk=;
 b=PpadHTmpteKE/reYVhkAc3d0OCY7rcsZibXgAupryKHrD7qSPoqJGv+r7w0sfnoPY2
 K5iobf92rsQ2w3gRd3IdC6fh6fiH3XYTMdcMs4aA8j8UAdkM1O9IpZ6C2szC5cebiGx6
 D8eSKDNJkwtsVlRtN7hUuHOBiyojXhXNxgPBK52kh4N8DJq0NTdq4sZ+H2XTnAkA+K77
 o6R7s96ARrwaDGik3hhIf4NExyqCzA0lKidLEu3Sx3rURsuVDJnR5WNNsSve4b8ErzEB
 ODEmxPIADVV65Tal0za5+1M5N4atW32Iy0Hnx58yPLeksZli7Dat67WA9RbQ2nhiYn62
 W0Bw==
X-Gm-Message-State: AOAM530mrFKz14dHghatdmQoya9vBO+zTOgIQC+VJXeq0/yLBBAdjAes
 O9SZMum8MYrqCK8+d4QdntnRDS4Rw6v0Hb7ReXY=
X-Google-Smtp-Source: ABdhPJycVW882LRumHwuA6IzFiSfSlzW/wHX4S9DZXfwnoiwyJsd2+QxX8aBmJID+BTMFDnhN+H1/0NyTeu67ncF38A=
X-Received: by 2002:a67:e3d4:: with SMTP id k20mr12371492vsm.60.1600453903246; 
 Fri, 18 Sep 2020 11:31:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200918132505.2316382-1-daniel.vetter@ffwll.ch>
 <20200918132505.2316382-3-daniel.vetter@ffwll.ch>
 <CAM0jSHOsowOK2Vytfv4MWVTToFs-6pShMyoZy1Or90zZysH_gg@mail.gmail.com>
 <CAKMK7uEZKVZ2T2jHg_XLo+N=_9AnBZxB668wFpEXGedNDE+b2A@mail.gmail.com>
In-Reply-To: <CAKMK7uEZKVZ2T2jHg_XLo+N=_9AnBZxB668wFpEXGedNDE+b2A@mail.gmail.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Fri, 18 Sep 2020 19:31:17 +0100
Message-ID: <CAM0jSHMD5LxEHqbdP8wfRr_6SUahjddGRLVdcF2Q47GUxOhk2A@mail.gmail.com>
Subject: Re: [PATCH 2/4] drm/i915/selftests: align more to real device
 lifetimes
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
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 18 Sep 2020 at 19:22, Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
>
> On Fri, Sep 18, 2020 at 7:50 PM Matthew Auld
> <matthew.william.auld@gmail.com> wrote:
> >
> > On Fri, 18 Sep 2020 at 14:25, Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> > >
> > > The big change is device_add so that device_del can auto-cleanup
> > > devres resources. This allows us to use devm_drm_dev_alloc, which
> > > removes the last user of drm_dev_init.
> > >
> > > v2: Rebased
> > >
> > > v3: use devres_open/release_group so we can use devm without real
> > > hacks in the driver core or having to create an entire fake bus for
> > > testing drivers. Might want to extract this into helpers eventually,
> > > maybe as a mock_drm_dev_alloc or test_drm_dev_alloc.
> > >
> > > v4:
> > > - Fix IS_ERR handling (Matt)
> > > - Delete surplus put_device() in mock_device_release (intel-gfx-ci)
> > >
> > > Cc: Matthew Auld <matthew.william.auld@gmail.com>
> > > Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com> (v3)
> > > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > > ---
> > >  .../gpu/drm/i915/selftests/mock_gem_device.c  | 44 +++++++++++--------
> > >  1 file changed, 25 insertions(+), 19 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/i915/selftests/mock_gem_device.c b/drivers/gpu/drm/i915/selftests/mock_gem_device.c
> > > index ac600d395c8f..816f9af15fb3 100644
> > > --- a/drivers/gpu/drm/i915/selftests/mock_gem_device.c
> > > +++ b/drivers/gpu/drm/i915/selftests/mock_gem_device.c
> > > @@ -79,8 +79,6 @@ static void mock_device_release(struct drm_device *dev)
> > >
> > >  out:
> > >         i915_params_free(&i915->params);
> > > -       put_device(&i915->drm.pdev->dev);
> > > -       i915->drm.pdev = NULL;
> > >  }
> > >
> > >  static struct drm_driver mock_driver = {
> > > @@ -128,12 +126,6 @@ struct drm_i915_private *mock_gem_device(void)
> > >         pdev = kzalloc(sizeof(*pdev), GFP_KERNEL);
> > >         if (!pdev)
> > >                 return NULL;
> > > -       i915 = kzalloc(sizeof(*i915), GFP_KERNEL);
> > > -       if (!i915) {
> > > -               kfree(pdev);
> > > -               return NULL;
> > > -       }
> > > -
> > >         device_initialize(&pdev->dev);
> > >         pdev->class = PCI_BASE_CLASS_DISPLAY << 16;
> > >         pdev->dev.release = release_dev;
> > > @@ -144,8 +136,29 @@ struct drm_i915_private *mock_gem_device(void)
> > >         /* HACK to disable iommu for the fake device; force identity mapping */
> > >         pdev->dev.iommu = &fake_iommu;
> > >  #endif
> > > +       err = device_add(&pdev->dev);
> > > +       if (err) {
> > > +               kfree(pdev);
> > > +               return NULL;
> > > +       }
> > > +
> > > +       if (!devres_open_group(&pdev->dev, NULL, GFP_KERNEL)) {
> > > +               device_del(&pdev->dev);
> > > +               return NULL;
> > > +       }
> > > +
> > > +       i915 = devm_drm_dev_alloc(&pdev->dev, &mock_driver,
> > > +                                 struct drm_i915_private, drm);
> > > +       if (IS_ERR(i915)) {
> > > +               pr_err("Failed to allocate mock GEM device: err=%d\n", err);
> >
> > err = PTR_ERR(i915)
>
> Are you sure? We return a pointer here, and callers just expect NULL
> when stuff fails (so neither errno nor ptr-encoded errno).

I just meant for the pr_err() which is printing the err(from the
copy-paste), but it will always be zero without the above.

> -Daniel
>
> > Reviewed-by: Matthew Auld <matthew.auld@intel.com>
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
