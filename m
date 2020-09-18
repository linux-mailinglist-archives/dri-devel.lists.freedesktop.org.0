Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BA8827044E
	for <lists+dri-devel@lfdr.de>; Fri, 18 Sep 2020 20:46:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E257F6ED79;
	Fri, 18 Sep 2020 18:46:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com
 [IPv6:2607:f8b0:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C0FD6ED78
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Sep 2020 18:46:32 +0000 (UTC)
Received: by mail-oi1-x243.google.com with SMTP id m7so8211439oie.0
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Sep 2020 11:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OWLyOFBXBxuFdicK9yh047E68CrePj5JHVLn2jb/hgc=;
 b=lQvac9yCQ4Y2xlyr74/8n4qf9CnTcQBST85F8+GVbkq7rzolXv7kz+igClydLKjZj1
 o91k31LQSk+eWcXrsFPidOeb4oW83/rLZrLHmMtlMIhPXSVuiKeCyWxk8n+SrEPnIAnU
 5j1J+Icym0AwNt5pm6IdahgQF4QcXO4DVXCH4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OWLyOFBXBxuFdicK9yh047E68CrePj5JHVLn2jb/hgc=;
 b=qoVA2WVv4Bua/2/JH0EnLL+cw7EebOLlwdgLLK18M8sKl7Q0sYGXwMkBYzgI29gZec
 fru9ddUXJc2rtBR1NI6n7vS7CqOuJPchu8qmcVe9SfQ1Gg6zKdd9LyljmyTP6m0cA8lc
 UaPPfjSpRv/G/cd15oyf/V0CU0jE3tyBlyUE8+rDZLUTyMG47LFSYJaf8sHAYrBUiaVo
 rfk3U3oLJm20vMTMzqxF34QFUj3h2HVc5iirnZy2bWSgCzrCqIu2b2zYPkWly+WMPL2a
 jJHNMblkarSNGiodk01ngtMWpXHRA2U1oBJcttiBDA0sG5nk4+5F/assb0+NPrQwX4d5
 0aHg==
X-Gm-Message-State: AOAM5321r2vqhqpfbQrHO0n64uZUr9zFgfjqzB5IBxfb5G/mfxUg2mXW
 apj8KAehZDbzzeeeIQO7gwJJr+FaLeyQpQAS1xZE5Q==
X-Google-Smtp-Source: ABdhPJxqVjGzJuuq1jWn3cgjpH7+eNSVRZvjkCFdXEg4lpR1qompWyNFCyiO5+s97tVf5PCeSp5L1BJf1tOBo85cET8=
X-Received: by 2002:aca:6083:: with SMTP id u125mr10441527oib.14.1600454791755; 
 Fri, 18 Sep 2020 11:46:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200918132505.2316382-1-daniel.vetter@ffwll.ch>
 <20200918132505.2316382-3-daniel.vetter@ffwll.ch>
 <CAM0jSHOsowOK2Vytfv4MWVTToFs-6pShMyoZy1Or90zZysH_gg@mail.gmail.com>
 <CAKMK7uEZKVZ2T2jHg_XLo+N=_9AnBZxB668wFpEXGedNDE+b2A@mail.gmail.com>
 <CAM0jSHMD5LxEHqbdP8wfRr_6SUahjddGRLVdcF2Q47GUxOhk2A@mail.gmail.com>
In-Reply-To: <CAM0jSHMD5LxEHqbdP8wfRr_6SUahjddGRLVdcF2Q47GUxOhk2A@mail.gmail.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Fri, 18 Sep 2020 20:46:20 +0200
Message-ID: <CAKMK7uH+CnVrzrGoMAq2dFnTQWigmb36qTJ8p4fJx9vAwig3Fw@mail.gmail.com>
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

On Fri, Sep 18, 2020 at 8:31 PM Matthew Auld
<matthew.william.auld@gmail.com> wrote:
>
> On Fri, 18 Sep 2020 at 19:22, Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> >
> > On Fri, Sep 18, 2020 at 7:50 PM Matthew Auld
> > <matthew.william.auld@gmail.com> wrote:
> > >
> > > On Fri, 18 Sep 2020 at 14:25, Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> > > >
> > > > The big change is device_add so that device_del can auto-cleanup
> > > > devres resources. This allows us to use devm_drm_dev_alloc, which
> > > > removes the last user of drm_dev_init.
> > > >
> > > > v2: Rebased
> > > >
> > > > v3: use devres_open/release_group so we can use devm without real
> > > > hacks in the driver core or having to create an entire fake bus for
> > > > testing drivers. Might want to extract this into helpers eventually,
> > > > maybe as a mock_drm_dev_alloc or test_drm_dev_alloc.
> > > >
> > > > v4:
> > > > - Fix IS_ERR handling (Matt)
> > > > - Delete surplus put_device() in mock_device_release (intel-gfx-ci)
> > > >
> > > > Cc: Matthew Auld <matthew.william.auld@gmail.com>
> > > > Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com> (v3)
> > > > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > > > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > > > ---
> > > >  .../gpu/drm/i915/selftests/mock_gem_device.c  | 44 +++++++++++--------
> > > >  1 file changed, 25 insertions(+), 19 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/i915/selftests/mock_gem_device.c b/drivers/gpu/drm/i915/selftests/mock_gem_device.c
> > > > index ac600d395c8f..816f9af15fb3 100644
> > > > --- a/drivers/gpu/drm/i915/selftests/mock_gem_device.c
> > > > +++ b/drivers/gpu/drm/i915/selftests/mock_gem_device.c
> > > > @@ -79,8 +79,6 @@ static void mock_device_release(struct drm_device *dev)
> > > >
> > > >  out:
> > > >         i915_params_free(&i915->params);
> > > > -       put_device(&i915->drm.pdev->dev);
> > > > -       i915->drm.pdev = NULL;
> > > >  }
> > > >
> > > >  static struct drm_driver mock_driver = {
> > > > @@ -128,12 +126,6 @@ struct drm_i915_private *mock_gem_device(void)
> > > >         pdev = kzalloc(sizeof(*pdev), GFP_KERNEL);
> > > >         if (!pdev)
> > > >                 return NULL;
> > > > -       i915 = kzalloc(sizeof(*i915), GFP_KERNEL);
> > > > -       if (!i915) {
> > > > -               kfree(pdev);
> > > > -               return NULL;
> > > > -       }
> > > > -
> > > >         device_initialize(&pdev->dev);
> > > >         pdev->class = PCI_BASE_CLASS_DISPLAY << 16;
> > > >         pdev->dev.release = release_dev;
> > > > @@ -144,8 +136,29 @@ struct drm_i915_private *mock_gem_device(void)
> > > >         /* HACK to disable iommu for the fake device; force identity mapping */
> > > >         pdev->dev.iommu = &fake_iommu;
> > > >  #endif
> > > > +       err = device_add(&pdev->dev);
> > > > +       if (err) {
> > > > +               kfree(pdev);
> > > > +               return NULL;
> > > > +       }
> > > > +
> > > > +       if (!devres_open_group(&pdev->dev, NULL, GFP_KERNEL)) {
> > > > +               device_del(&pdev->dev);
> > > > +               return NULL;
> > > > +       }
> > > > +
> > > > +       i915 = devm_drm_dev_alloc(&pdev->dev, &mock_driver,
> > > > +                                 struct drm_i915_private, drm);
> > > > +       if (IS_ERR(i915)) {
> > > > +               pr_err("Failed to allocate mock GEM device: err=%d\n", err);
> > >
> > > err = PTR_ERR(i915)
> >
> > Are you sure? We return a pointer here, and callers just expect NULL
> > when stuff fails (so neither errno nor ptr-encoded errno).
>
> I just meant for the pr_err() which is printing the err(from the
> copy-paste), but it will always be zero without the above.

Ah right, I missed that when applying your previous comment, thanks
for pointing it out.
-Daniel

>
> > -Daniel
> >
> > > Reviewed-by: Matthew Auld <matthew.auld@intel.com>
> >
> >
> >
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
