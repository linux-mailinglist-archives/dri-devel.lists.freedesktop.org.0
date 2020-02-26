Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 74FD816F49C
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2020 01:59:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59CDA6E06B;
	Wed, 26 Feb 2020 00:59:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E3F36E060;
 Wed, 26 Feb 2020 00:59:16 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id j17so1651790edp.3;
 Tue, 25 Feb 2020 16:59:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=41dIRKzCHut5g8ULikn2zx6erU7p8Xh0VLc4jTiVCc4=;
 b=O+TIDjLetEnT2gz+kRGSEfKzJ3gZm54fhVuuw2o9NH/TCdmpc530coe/gSUyy6JkVV
 hp4I4Tt0D4oO6Jq7z3rPlT5qjP0pC2eAqX3fHvscjkk/rSoLXphauA4TQi5N8rUG2RJn
 H9cMp9gTpeGK3EGLpkW15/eCBTfdTp+f7sNiP/2mCMQLmxywtMHas0sD8mQYeCOVCpLg
 MykJsWuqmKNLL23XnKMoLa7+H92C1e7lF0KmHN9ZRr+9Seofo3+cczjalXrRV5jUQLc0
 JQtvE6GOsgSni/HKHXgosx1LXU72/dYi2ptrteciLbu787zgnCQVsatna7aUZhM5ZPcA
 njZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=41dIRKzCHut5g8ULikn2zx6erU7p8Xh0VLc4jTiVCc4=;
 b=j0D1Rqf7pw7qNhr39GWCSeie8u5M0Rg+y9AES5Jw47kxdNSuUJ0mahFiY6YbMJ1SCC
 02XiB2eK7VmYboYBH3Io0LZkbkWia4l1Y5z4rJoW5Sxj9D6CY4I1SBk1XV+5ofMP+knx
 ZuLC7LaP65idm9zk2HAzS99hyEJYV2ypl6YOtLBSplasRVk/cOlElqDfpI6nxHQS2FI2
 AkwmOxXJ+nUeK+hhweGFYcRLbITOwgWMhqJ/gLi0AAQjg/wOqIrVE+ZZkIPKIMMWECAt
 IfWNJmx3RbWlEG6bEV3ApPT6Z2h0eg6UUfeQzTy25SuMNsfr4EGdzgYqWxSNzbWn9tiX
 oMAQ==
X-Gm-Message-State: APjAAAWmJnhkU//jjmHGcTZbMiNrAJE/xiVaK9HZkC4IuKGGDlPPu1x4
 4tXxaj2prd6Jsaj0o1FHCG2G4bG+6vU9wGI61lcs0Q==
X-Google-Smtp-Source: APXvYqy+o+spYlkpd4xZ2v0xZdO4bB5nJGwJneHFcbDWmY6rMi3XrscjFYSA8O3XYDcxOfzTeyUYrAaPUgr+F/SUKz4=
X-Received: by 2002:a17:906:5f89:: with SMTP id
 a9mr1635153eju.267.1582678754601; 
 Tue, 25 Feb 2020 16:59:14 -0800 (PST)
MIME-Version: 1.0
References: <1582223216-23459-1-git-send-email-jcrouse@codeaurora.org>
 <1582223216-23459-5-git-send-email-jcrouse@codeaurora.org>
 <CALAqxLWc4QQPyh=R6=0uFnLLicTYJ3NMO6QSc_yF31bJ2Z_rkQ@mail.gmail.com>
In-Reply-To: <CALAqxLWc4QQPyh=R6=0uFnLLicTYJ3NMO6QSc_yF31bJ2Z_rkQ@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 25 Feb 2020 16:59:02 -0800
Message-ID: <CAF6AEGtYvjgoYxsxyu2-juuTsp9mBJUdRRUWAT3doLtpju4UmQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] drm/msm/a6xx: Use the DMA API for GMU memory
 objects
To: John Stultz <john.stultz@linaro.org>
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
Cc: freedreno <freedreno@lists.freedesktop.org>,
 Douglas Anderson <dianders@chromium.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>, lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>,
 Todd Kjos <tkjos@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 25, 2020 at 3:54 PM John Stultz <john.stultz@linaro.org> wrote:
>
> On Thu, Feb 20, 2020 at 10:27 AM Jordan Crouse <jcrouse@codeaurora.org> wrote:
> >
> > The GMU has very few memory allocations and uses a flat memory space so
> > there is no good reason to go out of our way to bypass the DMA APIs which
> > were basically designed for this exact scenario.
> >
> > v2: Pass force_dma false to of_dma_configure to require that the DMA
> > region be set up and return error from of_dma_configure to fail probe.
> >
> > Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> > ---
> >
> >  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 112 +++-------------------------------
> >  drivers/gpu/drm/msm/adreno/a6xx_gmu.h |   5 +-
> >  2 files changed, 11 insertions(+), 106 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> > index 983afea..c36b38b 100644
> > --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> ...
> > -       count = bo->size >> PAGE_SHIFT;
> > +       bo->virt = dma_alloc_attrs(gmu->dev, bo->size, &bo->iova, GFP_KERNEL,
> > +               bo->attrs);
> >
> ...
> > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> > index 2af91ed..31bd1987 100644
> > --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> > @@ -13,7 +13,7 @@ struct a6xx_gmu_bo {
> >         void *virt;
> >         size_t size;
> >         u64 iova;
> > -       struct page **pages;
> > +       unsigned long attrs;
> >  };
>
> As a head up, Todd reported that this patch is causing build trouble
> w/ arm32, as the iova needs to be a dma_attr_t.
>
> I've got a patch for the android-mainline tree to fix this, but you
> might want to spin a v3 to address this.
>   https://android-review.googlesource.com/c/kernel/common/+/1243928
>

I guess based on robher's comments on the bindings, there will be a v3..

BR,
-R
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
