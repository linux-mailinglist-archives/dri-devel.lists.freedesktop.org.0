Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A17C2697D1
	for <lists+dri-devel@lfdr.de>; Mon, 14 Sep 2020 23:38:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E0F9898C4;
	Mon, 14 Sep 2020 21:38:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E50E898C4;
 Mon, 14 Sep 2020 21:38:48 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id l9so1452034wme.3;
 Mon, 14 Sep 2020 14:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ihTzgaqZL21cp5u6aE8gFpXoIW3k+3h2RUuuZoHivDI=;
 b=mD1ZJR2DXzzxVx+Pjxc37jdOU4K0ln6R1ma1YVADIagbOKyyKNnIYMUHdwtxVDLYh6
 6B9zoPUwyWldGez1f9yje/ywAuZAJ7yO98sqcmf8S2opZ1SxHHxHErtrVNFirQdwr/LM
 gEoxSI6+HD95hXzhJ368dwlDkkWe7tKaf71PMhp8ch72IUDVE6gG/Aw3+p9Sf4m/lkL7
 v9GprNDzKdK6NtgAjRUF7YyY6VXj5sWOQ3NHbXKozqRllKxaI/kvJ9BYywuR3S7nJDSr
 JkRZ2sl3Hub+2CvwMv6fjFPvyo9JP/uHc2/jQAL/tPpgPInWrMn3SyweAmiG5Jd2f0LK
 mnNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ihTzgaqZL21cp5u6aE8gFpXoIW3k+3h2RUuuZoHivDI=;
 b=obgPE1l0r9T4Jac9xtfWe166Sk/DrBOZ4ePspflsB2+AbK69GTmZT14HZaeDdvJKSs
 hzfKZ8f3hE4sjhbY8eKazOIldXogWrET/AudVxsbePqCYMJ4N51YKv/H5yovwHYGfld0
 OBvih7g+R7/xYkic+HG9OwiuvDdHSEisuGqXmRAWOup8qsq8h1yatGrtt5ylDQ00nazc
 Y0w7+m5Z8LeOyps5uw6LXXl70NNTH/mk+JV/uBd8joDU1wTcotEjbsScE4CGgZJ3L6G5
 K20na/FJCWET4vzTP9NiZ9GWJpxtmxGdHeTu3RDqIpo3+TUv3K8rY1rhz7zUGmPuQE/Q
 tXEw==
X-Gm-Message-State: AOAM530iTV9BqBDykiv9ygWdrSg7z4kEUPHucNX+s2HqMbMqw3jkgF9L
 00Ffk4Gk9sv4pDzUBGKRbTPe2G0G11k+b3il/Fs=
X-Google-Smtp-Source: ABdhPJx74gmY8qsl29dYFAn20fh3pYlsaYIH6widJjpleL5+ADoi+T7ZXr+pA05kHQOhPeTW9ypzPMQ4VOSNEPPyQpw=
X-Received: by 2002:a1c:e90b:: with SMTP id q11mr1295903wmc.39.1600119527036; 
 Mon, 14 Sep 2020 14:38:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200904012218.4971-1-luben.tuikov@amd.com>
 <20200904012218.4971-2-luben.tuikov@amd.com>
 <CADnq5_NRyOfP48C5w4Q87qx98-hTLQP7PsP8OhGMbXJBu_Gb4A@mail.gmail.com>
 <20200907080608.GP2352366@phenom.ffwll.local>
 <20200907080726.GQ2352366@phenom.ffwll.local>
 <6b97cb7f-61f2-8e89-c7bf-f98166accf39@amd.com>
 <bae5883a-0edd-7510-321f-2ae6fffeacf4@amd.com>
In-Reply-To: <bae5883a-0edd-7510-321f-2ae6fffeacf4@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 14 Sep 2020 17:38:35 -0400
Message-ID: <CADnq5_PMw2_nt9LRzn_cH-oS82E2Jz77QWwZr13JDUvij61MMg@mail.gmail.com>
Subject: Re: [PATCH 1/1] drm/amdgpu: Convert to using devm_drm_dev_alloc()
To: Luben Tuikov <luben.tuikov@amd.com>
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
Cc: Alexander Deucher <Alexander.Deucher@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Sep 11, 2020 at 4:50 PM Luben Tuikov <luben.tuikov@amd.com> wrote:
>
> On 2020-09-08 16:09, Luben Tuikov wrote:
> > On 2020-09-07 04:07, Daniel Vetter wrote:
> >> On Mon, Sep 07, 2020 at 10:06:08AM +0200, Daniel Vetter wrote:
> >>> On Sat, Sep 05, 2020 at 11:50:05AM -0400, Alex Deucher wrote:
> >>>> On Thu, Sep 3, 2020 at 9:22 PM Luben Tuikov <luben.tuikov@amd.com> wrote:
> >>>>>
> >>>>> Convert to using devm_drm_dev_alloc(),
> >>>>> as drm_dev_init() is going away.
> >>>>>
> >>>>> Signed-off-by: Luben Tuikov <luben.tuikov@amd.com>
> >>>>
> >>>> I think we can drop the final drm_put in the error case?  I think the
> >>>> unwinding in current devm code should take care of it.
> >>>
> >>> Same applies for the pci remove hook too.
> >>
> >> KASAN run with unload should have caught this.
> >
> > But it didn't? Why?
> > Could it be that drm_dev_put() actually got
> > the kref to 0 and then drm_dev_release()
> > was called which did a kfree()?
> >
> > Could you try that same unload KASAN run but
> > with your suggestion of removing drm_dev_put() from
> > amdgpu_pci_remove()? What do you get then?
>
> Hi Daniel,
>
> Have you had a chance to run this unload KASAN run with
> your suggestion of removing drm_dev_put() from
> the PCI release hook?
>
> If it "should have caught this", but it didn't,
> perhaps it did catch it when you removed the drm_dev_put()
> hook from the PCI release hook, when you did a KASAN unload run?
> Showing that drm_dev_put() is still necessary, since,
> 1) we're still using kref,
> 2) kref is kref-init-ed under devm_drm_dev_alloc() as I pointed
>    out in my reply to Alex in this thread.
>
> I believe KASAN (and logic) show this patch to be solid.
>
> >
> >> I strongly recommend doing
> >> that for any changes to the unload code, it's way to easy to mix up
> >> something and release it in the wrong order or from the wrong callback or
> >> with the wrong managed (devm_ vs drmm_) functions.
> >
> > Sorry, I don't understand what you mean by "doing that"? Do
> > you mean "not calling drm_dev_put()"? Sure, but what
> > are we supposed to call instead?
> >
> > I also don't understand what you mean by "easy to mix up something
> > and release it in wrong order or from the wrong callback..." etc.
> >
> > If you want things to happen in certain order,
> > you can either put the correct-order-sequence
> > behind the non-zero-->0 transition of kref, say in
> > drm_dev_release() as it is right now,
> >
> > static void drm_dev_release(struct kref *ref)
> > {
> >         struct drm_device *dev = container_of(ref, struct drm_device, ref);
> >
> >         if (dev->driver->release)
> >                 dev->driver->release(dev);
> >
> >         drm_managed_release(dev);
> >
> >         kfree(dev->managed.final_kfree);
> > }
> >
> > Or you can remove kref from DRM dev (which I do not
> > recommend), and stipulate the release sequence
> > as I asked in Message-ID: <165961bb-3b5b-cedc-2fc0-838b7999d2e3@amd.com>,
> > "Re: [PATCH] drm/managed: Cleanup of unused functions and polishing docs".
> >
> > Then we can follow that and submit patches to conform.
>
> Eagerly awaiting your response on this so that we can conform
> to the direction you're setting forth.
>
> Are you removing kref (release() cb) from DRM and if so,
> what function should we call in order to do the "final"
> (although without kref, the notion of "final" is obviated)
> free, OR kref stays in and this patch, which conforms
> to using devm_drm_dev_alloc(), as postulated by you,
> can go in.

devm_drm_dev_init() calls devm_add_action() which adds
devm_drm_dev_init_release() as the function which gets called for
resource unwinding.  That calls drm_dev_put() which handles the ref
counting and clean up, so I don't think we need to call drm_dev_put()
in any of our unwinding paths anymore.  All of the drm bits are
handled for us.

Alex

>
> Regards,
> Luben
>
> >
> > Regards,
> > Luben
> >
> >
> >
> >> -Daniel
> >>
> >>> -Daniel
> >>>>
> >>>> Alex
> >>>>
> >>>>> ---
> >>>>>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 11 +++--------
> >>>>>  1 file changed, 3 insertions(+), 8 deletions(-)
> >>>>>
> >>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> >>>>> index 146a85c8df1c..06d994187c24 100644
> >>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> >>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> >>>>> @@ -1142,18 +1142,13 @@ static int amdgpu_pci_probe(struct pci_dev *pdev,
> >>>>>         if (ret)
> >>>>>                 return ret;
> >>>>>
> >>>>> -       adev = kzalloc(sizeof(*adev), GFP_KERNEL);
> >>>>> -       if (!adev)
> >>>>> -               return -ENOMEM;
> >>>>> +       adev = devm_drm_dev_alloc(&pdev->dev, &kms_driver, typeof(*adev), ddev);
> >>>>> +       if (IS_ERR(adev))
> >>>>> +               return PTR_ERR(adev);
> >>>>>
> >>>>>         adev->dev  = &pdev->dev;
> >>>>>         adev->pdev = pdev;
> >>>>>         ddev = adev_to_drm(adev);
> >>>>> -       ret = drm_dev_init(ddev, &kms_driver, &pdev->dev);
> >>>>> -       if (ret)
> >>>>> -               goto err_free;
> >>>>> -
> >>>>> -       drmm_add_final_kfree(ddev, adev);
> >>>>>
> >>>>>         if (!supports_atomic)
> >>>>>                 ddev->driver_features &= ~DRIVER_ATOMIC;
> >>>>> --
> >>>>> 2.28.0.394.ge197136389
> >>>>>
> >>>>> _______________________________________________
> >>>>> amd-gfx mailing list
> >>>>> amd-gfx@lists.freedesktop.org
> >>>>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;data=02%7C01%7Cluben.tuikov%40amd.com%7C0c811cf4c16d4f79bc0d08d853051125%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637350628521258815&amp;sdata=k9GiFNi%2Fu6Y1AlW7ea1cQINYigfYbrvPk2RkmUJkY8U%3D&amp;reserved=0
> >>>
> >>> --
> >>> Daniel Vetter
> >>> Software Engineer, Intel Corporation
> >>> https://nam11.safelinks.protection.outlook.com/?url=http%3A%2F%2Fblog.ffwll.ch%2F&amp;data=02%7C01%7Cluben.tuikov%40amd.com%7C0c811cf4c16d4f79bc0d08d853051125%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637350628521258815&amp;sdata=aIT9t6q0qCTy%2BZhHPH0XIJgZ%2FYNF8xwzAQ2HlbxxMDk%3D&amp;reserved=0
> >>
> >
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
