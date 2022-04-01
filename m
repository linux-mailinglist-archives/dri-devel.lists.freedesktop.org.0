Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 388EE4EF792
	for <lists+dri-devel@lfdr.de>; Fri,  1 Apr 2022 18:17:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 615DD10E1A8;
	Fri,  1 Apr 2022 16:17:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0559410E075
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Apr 2022 16:17:01 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id u16so4982545wru.4
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Apr 2022 09:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=BlLHdSQKzLW10qxx5Y9z9VrgddtbO+BnDQ5EKXmbJ0Q=;
 b=UIbxrK2aXWEAiJAEuMYjFWR4JHgUXqrWK9cW1MuoUTYgWE0B4RLG28ByjaCZJ8P3ki
 mzFOnTrDCp9ID7+gmJZlNF/41xhIFHWUCleqsJJPHjkIFdFxlWR95ikiOmYiZnyYUYYO
 mv4evkvgstov+6xn8qucIFZ8F5pxmbIPuLYCg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=BlLHdSQKzLW10qxx5Y9z9VrgddtbO+BnDQ5EKXmbJ0Q=;
 b=UqN6Cpglkw/McXU4hmYtU3LUEn/Ods4gemMImgashSdkpNrAN1/l8/poeBZWHUuT0x
 vQDV37A6qIDsN0Z/IBP6kcPVN5ugQYOV3Am8UzVjXH49jaHZZQKEG5aMOVwgVuBz4T9P
 vzLaI4lHwSNKsevPtT8ND7D+PD4iFOLSSIA/yru1uXdQa0k60VyJE2OeWNrZmQy9Z2r2
 pCLFTzB8f379j5nARHoi/csTHzuucsPSX2O4aT6r+kmWWpWNi4nXVe+/10y/wIDzRhLU
 206sr9shVwHMYBd+wzlUp+c0liX1Thmjb5s6gFVm2TwmmIsm/4of2CkRkDSnaqq8iZHl
 S+bA==
X-Gm-Message-State: AOAM532NpRgYG+LvlYi6o26CQSa6CtIw8K7cckvNk8jgXY3rFTuIaIID
 IvoqniSqAmJCarazkiT6nHGN7g==
X-Google-Smtp-Source: ABdhPJxnl4RL1VVnOWJUJ0zxXzAuUOkQC3SRJ3c4AyQYUKtmH7/uq49OU/hXoxGMuq2+lso7UFDNww==
X-Received: by 2002:adf:f14e:0:b0:203:e049:6829 with SMTP id
 y14-20020adff14e000000b00203e0496829mr7998006wro.386.1648829820353; 
 Fri, 01 Apr 2022 09:17:00 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 bg8-20020a05600c3c8800b0038e4c5967besm2368870wmb.3.2022.04.01.09.16.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Apr 2022 09:16:59 -0700 (PDT)
Date: Fri, 1 Apr 2022 18:16:57 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH 17/23] dma-buf: specify usage while adding fences to
 dma_resv obj v5
Message-ID: <YkcleRFZkv2kpBA5@phenom.ffwll.local>
References: <20220321135856.1331-1-christian.koenig@amd.com>
 <20220321135856.1331-17-christian.koenig@amd.com>
 <YkMpD6bamZ3THpMg@phenom.ffwll.local>
 <31041478-fe09-bf47-b1b2-5db01a157c23@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <31041478-fe09-bf47-b1b2-5db01a157c23@amd.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org, daniel.vetter@ffwll.ch
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 01, 2022 at 05:01:13PM +0200, Christian König wrote:
> 
> 
> Am 29.03.22 um 17:43 schrieb Daniel Vetter:
> > On Mon, Mar 21, 2022 at 02:58:50PM +0100, Christian König wrote:
> > [SNIP]
> > >   /**
> > > - * dma_resv_add_shared_fence - Add a fence to a shared slot
> > > + * dma_resv_add_fence - Add a fence to the dma_resv obj
> > >    * @obj: the reservation object
> > > - * @fence: the shared fence to add
> > > + * @fence: the fence to add
> > > + * @usage: how the fence is used, see enum dma_resv_usage
> > >    *
> > > - * Add a fence to a shared slot, @obj must be locked with dma_resv_lock(), and
> > > + * Add a fence to a slot, @obj must be locked with dma_resv_lock(), and
> > >    * dma_resv_reserve_fences() has been called.
> > >    *
> > >    * See also &dma_resv.fence for a discussion of the semantics.
> > >    */
> > > -void dma_resv_add_shared_fence(struct dma_resv *obj, struct dma_fence *fence)
> > > +void dma_resv_add_fence(struct dma_resv *obj, struct dma_fence *fence,
> > > +			enum dma_resv_usage usage)
> > >   {
> > >   	struct dma_resv_list *fobj;
> > >   	struct dma_fence *old;
> > > @@ -274,44 +308,45 @@ void dma_resv_add_shared_fence(struct dma_resv *obj, struct dma_fence *fence)
> > >   	dma_resv_assert_held(obj);
> > > -	/* Drivers should not add containers here, instead add each fence
> > > -	 * individually.
> > > +	/* TODO: Drivers should not add containers here, instead add each fence
> > > +	 * individually. Disabled for now until we cleaned up amdgpu/ttm.
> > >   	 */
> > > -	WARN_ON(dma_fence_is_container(fence));
> > > +	/* WARN_ON(dma_fence_is_container(fence)); */
> > Uh this looks like it's a misplaced hack?
> 
> Unfortunately not.
> 
> > If you do need it and cant get rid of it with patch reordering, then I
> > think it needs to be split out for extra attention.
> 
> The problem is that I would need to squash removing the amdgpu workaround
> into this patch as well.
> 
> And I don't really want to make this patch more complicated that it already
> is.

Yeah I got it later on. Please explain the story in the commit message,
and how it'll be resolved. Otherwise this is a bit much wtf to merge :-)

> 
> > > diff --git a/drivers/gpu/drm/lima/lima_gem.c b/drivers/gpu/drm/lima/lima_gem.c
> > > index 9435a3ca71c8..38caa7f78871 100644
> > > --- a/drivers/gpu/drm/lima/lima_gem.c
> > > +++ b/drivers/gpu/drm/lima/lima_gem.c
> > > @@ -366,7 +366,7 @@ int lima_gem_submit(struct drm_file *file, struct lima_submit *submit)
> > >   		if (submit->bos[i].flags & LIMA_SUBMIT_BO_WRITE)
> > >   			dma_resv_add_excl_fence(lima_bo_resv(bos[i]), fence);
> > Not very compile-tested it seems.
> 
> At least it used to compile fine once, but obviously need to give it another
> go.
> 
> > I think it'd be good to split this further:
> > 
> > - Add dma_resv_add_fence, which just adds either an exclusive or shared
> >    fences.
> > - Convert drivers, cc driver authors (this patch doesn't seem to have
> >    them).
> > 
> > I think the above two could also be a single patch, but should work even
> > more split.
> 
> That is easier said than done. I will see what I can do.
> 
> The other documentation comments you had should be fixed in the next round,
> but you might want to take another full look at this.

Yeah I get that it's utter pain. I think if you add a list to the commit
message with a few comments on how each driver is touched and all that
(i.e. at least type up the separate commmit messages for the separate
patches that should be split, but are a real pain to split), then I think
that's fine.

I've also done audit patches in the past which had that per-driver blurb
to cover all the cases, sometimes that's the least crappy way to do
things.

Holds also for the other patches which then add USAGE_KERNEL and
USAGE_BOOKKEEPING - splitting is a bit much but at least having a
per-driver blurb of what/why you change would be really good to include I
think. Just so we remember a bit easier why things changed. I think then
we should be good here with these (well aside from the one ttm change that
I didn't follow yet in another patch).
-Daniel

> 
> Thanks,
> Christian.
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
