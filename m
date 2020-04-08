Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 323BE1A1DBE
	for <lists+dri-devel@lfdr.de>; Wed,  8 Apr 2020 11:03:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 438DC6E9D7;
	Wed,  8 Apr 2020 09:03:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDE036E9D7
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Apr 2020 09:03:37 +0000 (UTC)
Received: by mail-oi1-x242.google.com with SMTP id q204so4029250oia.13
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Apr 2020 02:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TKV0NEsWQw/WwLXsHgDJt70f056rhfvht0rJVryOlNk=;
 b=Vi94BGxbZCHXMZTeeRX55vNsN5rut7RPJ5ogl+unH7qhPrIP0WRCx31GVOCrnx/W7w
 Uku3ckTsAhw7LzkI1Q2VLLsrl800HjFm6F/Wvk2bkryB/Mg1RB6KjCIJDVlDGiDzb4Ji
 IfuUvF0/u7DC7AOp2MQBkEOXGwxPXMy86uQcY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TKV0NEsWQw/WwLXsHgDJt70f056rhfvht0rJVryOlNk=;
 b=rJ4MnEz13PtS/VIf4CDgGrHoxoBQt0S8St8mVzDRgid9EbNdBRLA/r5moAqxdajfxW
 eDk1u1zmzXZFVIecirQ36nn8AS+g7pkG6EM8e5hnk5woWLzPynrHN6l3OGh3tUq7XNUT
 ZIo8rTwtzp5rcBB0ycKku7VUgCCyAMJGj6hNL4xiDIZBi38TAH9FKBfLL2T69cIgsFiL
 WlodlXIjxGUlOqcfikCB3mklZKEquGZiDSPOcXti8DUjLzh+nEurToDwoP1x153G81Qb
 e40zZ2gZHq2Lznh0ZwbLExerCIY0E5Z0D5wQ7ixujNuZEA6leKdfTT4KfupfoZh0JgJd
 5gtQ==
X-Gm-Message-State: AGi0PubhPWv0Es53NeaKbfTWPS2JHwcTNE475ypcy6469lriiu8JJcr+
 hAwQ44zKZXUOabTDsszon2T/GqMMbfyDrLr3RrPPQQ==
X-Google-Smtp-Source: APiQypIIWM2TeydmeQyZR38aDULLLYpENkWeTFqbzT4eRpninX/V4Kz0EEMthzUvwVpq4a22ekPdn/o8omJ+zLnUjEk=
X-Received: by 2002:a54:4189:: with SMTP id 9mr1700465oiy.128.1586336617075;
 Wed, 08 Apr 2020 02:03:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200403135828.2542770-1-daniel.vetter@ffwll.ch>
 <20200403135828.2542770-37-daniel.vetter@ffwll.ch>
 <20200408084040.GA11347@jamwan02-TSP300>
In-Reply-To: <20200408084040.GA11347@jamwan02-TSP300>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Wed, 8 Apr 2020 11:03:24 +0200
Message-ID: <CAKMK7uGQoK-8U4=XOdq9UUwRx344Y1pPbvZ7m8Ejt8aOP-JTvQ@mail.gmail.com>
Subject: Re: [PATCH 36/44] drm/komeda: use devm_drm_dev_alloc
To: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
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
Cc: Mihail Atanassov <Mihail.Atanassov@arm.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Liviu Dudau <Liviu.Dudau@arm.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>, nd <nd@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 8, 2020 at 10:41 AM james qian wang (Arm Technology China)
<james.qian.wang@arm.com> wrote:
>
> On Fri, Apr 03, 2020 at 09:58:20PM +0800, Daniel Vetter wrote:
> > Komeda uses the component framework, which does open/close a new
> > devres group around all the bind callbacks. Which means we can use
> > devm_ functions for managing the drm_device cleanup, with leaking
> > stuff in case of deferred probes or other reasons to unbind
> > components, or the component_master.
> >
> > Also note that this fixes a double-free in the probe unroll code, bot
> > drm_dev_put and kfree(kms) result in the kms allocation getting freed.
> >
> > Aside: komeda_bind could be cleaned up a lot, devm_kfree is a bit
> > redundant. Plus I'm not clear on why there's suballocations for
> > mdrv->mdev and mdrv->kms. Plus I'm not sure the lifetimes are correct
> > with all that devm_kzalloc usage ... That structure layout is also the
> > reason why komeda still uses drm_device->dev_private and can't easily
> > be replaced with a proper container_of upcasting. I'm pretty sure that
> > there's endless amounts of hotunplug/hotremove bugs in there with all
> > the unprotected dereferencing of drm_device->dev_private.
>
> Hi Daniel:
>
> Thank you for the patch.
>
> Reviewed-by: James Qian Wang <james.qian.wang@arm.com>
>
> For why komeda has two devices komeda_dev and komeda_kms_dev.
> That because komeda treats drm_crtc/plane as virtual, which pick the real
> komeda resources to satify the user's requirement. In the initial driver
> design we want to clear the difference of these two class structures
> so we defined two devices:
>
> - komeda_dev:
>   managing the real komeda device and resources.
>
> - komeda_kms_dev
>   the virtual device managing the drm related stuff like
>   komeda_crtc/plane.
>
> And yes, even for that we don't need two sub-allocations, we are planing
> to move the komeda_dev into the komeda_kms_dev or just merge two devices
> together.

Yeah I think the logical split makes a lot of sense, e.g. amdgpu has a
similar split between the drm front-end structures, and the DC
back-end stuff that deals with the hardware. Same as other drivers.
The issue I think I'm seeing with komeda is all the pointer chasing
(not a problem, just a bit of indirection that's not strictly needed),
and that when you unload the back-end disappears right away, while the
front-end might still be used by userspace. And then all the pointers
you have lead to oopses.

I admit that for built-in hw hotunplug isn't really a major use-case.
But we do have some usb drivers nowadays in drm, so I'm trying to
clean this all up a bit and make sure that as many drivers as possible
have clean&correct code in this area.

Anyway if you're already planning to look into this then awesome!

Cheers, Daniel

> Thanks
> James
>
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > Cc: "James (Qian) Wang" <james.qian.wang@arm.com>
> > Cc: Liviu Dudau <liviu.dudau@arm.com>
> > Cc: Mihail Atanassov <mihail.atanassov@arm.com>
> > ---
> >  drivers/gpu/drm/arm/display/komeda/komeda_kms.c | 16 +++++-----------
> >  1 file changed, 5 insertions(+), 11 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_kms.c b/drivers/gpu/drm/arm/display/komeda/komeda_kms.c
> > index 16dfd5cdb66c..6b85d5f4caa8 100644
> > --- a/drivers/gpu/drm/arm/display/komeda/komeda_kms.c
> > +++ b/drivers/gpu/drm/arm/display/komeda/komeda_kms.c
> > @@ -261,18 +261,16 @@ static void komeda_kms_mode_config_init(struct komeda_kms_dev *kms,
> >
> >  struct komeda_kms_dev *komeda_kms_attach(struct komeda_dev *mdev)
> >  {
> > -     struct komeda_kms_dev *kms = kzalloc(sizeof(*kms), GFP_KERNEL);
> > +     struct komeda_kms_dev *kms;
> >       struct drm_device *drm;
> >       int err;
> >
> > -     if (!kms)
> > -             return ERR_PTR(-ENOMEM);
> > +     kms = devm_drm_dev_alloc(mdev->dev, &komeda_kms_driver,
> > +                              struct komeda_kms_dev, base);
> > +     if (IS_ERR(kms))
> > +             return kms;
> >
> >       drm = &kms->base;
> > -     err = drm_dev_init(drm, &komeda_kms_driver, mdev->dev);
> > -     if (err)
> > -             goto free_kms;
> > -     drmm_add_final_kfree(drm, kms);
> >
> >       drm->dev_private = mdev;
> >
> > @@ -329,9 +327,6 @@ struct komeda_kms_dev *komeda_kms_attach(struct komeda_dev *mdev)
> >       drm_mode_config_cleanup(drm);
> >       komeda_kms_cleanup_private_objs(kms);
> >       drm->dev_private = NULL;
> > -     drm_dev_put(drm);
> > -free_kms:
> > -     kfree(kms);
> >       return ERR_PTR(err);
> >  }
> >
> > @@ -348,5 +343,4 @@ void komeda_kms_detach(struct komeda_kms_dev *kms)
> >       drm_mode_config_cleanup(drm);
> >       komeda_kms_cleanup_private_objs(kms);
> >       drm->dev_private = NULL;
> > -     drm_dev_put(drm);
> >  }
> > --
> > 2.25.1



-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
