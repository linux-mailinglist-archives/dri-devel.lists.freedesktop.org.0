Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B5E4358813
	for <lists+dri-devel@lfdr.de>; Thu,  8 Apr 2021 17:20:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 129826EB34;
	Thu,  8 Apr 2021 15:20:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4F6F6EB34;
 Thu,  8 Apr 2021 15:20:15 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id a76so1421273wme.0;
 Thu, 08 Apr 2021 08:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=v7qcvuTJQnTWwOB3Ha6/Syy7/aYA0Qf/BL1AwDzfuGU=;
 b=e3ZNlpbpavIjcSN8dIxYOE/rXgDXvsXGNe5Ir4myMhVg15nZr9dHEFBzEJZ1RIJEHH
 lFss/0FwJk6YqrYFGwcOwy4wxTXLv5vNP4drLHjRpIEj5c92ZGLzcM/1oJC8Bx2/ctsG
 rxzJ05izioG/KGa1Ww9FJ4SyhfnA3BUCjaQoW6xHxdRDUq1Cfqihsu41kzj1x3DpZxB/
 yVS6yKPyHbUKfUguXhrbdNChUuaTIm8RhsDhMO0YQ2KkmueNSFLJ7ukwaxtOLTg4tily
 /W3vhMYNxmLGBpqInhUPtsU9kvqLmvBW3tARkD4gSP8nzP2i5ZNb79cE+dg0nwu5e0ZA
 m0cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=v7qcvuTJQnTWwOB3Ha6/Syy7/aYA0Qf/BL1AwDzfuGU=;
 b=AkGgcKFt9cBvEo4c7+JXNFHGPvZV4w0JHZnO9+wDWatHLaXhzKl65/yhb/qD8MCuOs
 od/2SEi7VKfWFdyntTsd25mIdMP5sKe0dlU77l/RvGs2D8oJz5DMC8yL+/F/0wGIOnuo
 H/AMS6zJnmTYRAWoXKh1RXTXIopoCer2sd+8czQwZWn0EMFmt9lZXnEqCgHW8Bog+aoN
 BH9MFRv0jq0jnItsA21gDwrBUMbg3j/4jyj/PYJbTRmpWPcGqjNi0oMQDAHYSq/jNDnn
 UDC/CbE7ZBJjXi9J0h2ZE81Rr3rWsqZxgXToBUlEdhic4zLFGuY1QEd26OzTNxGSJoXB
 x/2Q==
X-Gm-Message-State: AOAM531Odk7hFI3t6PnTNFkOKUGQXvOUB+DhFP4DVH1dk+lr+SlmrDv2
 YnvRNpxFHirzW8yLWOqlWgXDMgSX//LUYuYDjng=
X-Google-Smtp-Source: ABdhPJwnEZiOVu05xL4G7IVf4f04NXBPNtQO9QG4ZKDgpvpOib9wUr5K++bP76nBv0xlgyUACj0JeK94OKvdYJeiSJA=
X-Received: by 2002:a05:600c:4fd0:: with SMTP id
 o16mr9194147wmq.123.1617895214533; 
 Thu, 08 Apr 2021 08:20:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210405174532.1441497-1-robdclark@gmail.com>
 <YG7l0LwVQ2s4Y0Sa@phenom.ffwll.local>
In-Reply-To: <YG7l0LwVQ2s4Y0Sa@phenom.ffwll.local>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 8 Apr 2021 08:23:42 -0700
Message-ID: <CAF6AEGsH2gbKv-Q04gRbjz=ue1TF7S_6DXa06bvYPcmYvG684w@mail.gmail.com>
Subject: Re: [PATCH 0/8] drm/msm: Swappable GEM objects
To: Rob Clark <robdclark@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 Rob Clark <robdclark@chromium.org>, 
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, 
 Jordan Crouse <jordan@cosmicpenguin.net>, 
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 8, 2021 at 4:15 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Mon, Apr 05, 2021 at 10:45:23AM -0700, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > One would normally hope not to be under enough memory pressure to need
> > to swap GEM objects to disk backed swap.  But memory backed zram swap
> > (as enabled on chromebooks, for example) can actually be quite fast
> > and useful on devices with less RAM.  On a 4GB device, opening up ~4
> > memory intensive web pages (in separate windows rather than tabs, to try
> > and prevent tab discard), I see ~500MB worth of GEM objects, of which
> > maybe only 10% are active at any time, and with unpin/evict enabled,
> > only about half resident (which is a number that gets much lower if you
> > simulate extreme memory pressure).  Assuming a 2:1 compression ratio (I
> > see a bit higher in practice, but cannot isolate swapped out GEM pages
> > vs other), that is like having an extra 100+MB of RAM, or more under
> > higher memory pressure.
> >
> > Rob Clark (8):
> >   drm/msm: ratelimit GEM related WARN_ON()s
> >   drm/msm: Reorganize msm_gem_shrinker_scan()
> >   drm/msm: Clear msm_obj->sgt in put_pages()
> >   drm/msm: Split iova purge and close
> >   drm/msm: Add $debugfs/gem stats on resident objects
> >   drm/msm: Track potentially evictable objects
> >   drm/msm: Small msm_gem_purge() fix
> >   drm/msm: Support evicting GEM objects to swap
>
> Given how much entertainement shrinkers are, should we aim for more common
> code here?
>
> Christian has tons of fun with adding something like this for ttm (well
> different shades of grey). i915 is going to adopt ttm, at least for
> discrete.
>
> The locking is also an utter pain, and msm seems to still live a lot in
> its own land here. I think as much as possible a standard approach here
> would be really good, ideally maybe as building blocks shared between ttm
> and gem-shmem drivers ...

I don't disagree.. but also replacing the engines on an airplane
mid-flight isn't a great option either.. ;-)

The hard part (esp. wrt to locking) is tracking the state of a given
bo.. ie. is it active, active+purgable, inactive+purgable,
inactive+unpinnable, etc.  Currently the shmem helpers don't really
provide anything here.  If they did, I suppose they could provide some
shrinker helpers as well.  Unfortunately these days I barely have
enough time for drm/msm, let alone bolting this onto the shmem
helpers.  I would recommend that if someone wanted to do this, that
they look at recent drm/msm shrinker patches that I've sent (ie. make
shrinker->count() lockless, and drop the locks in shrinker->scan()
body.. when the system is under heavy memory pressure, you start
getting shrinker called from all the threads so contention for mm_lock
can be a really bad problem)

(Well, the other potential problem is that drm/msm has a lot of
different possible iommu pairings across the generations, so there is
some potential here to uncover exciting new bugs.. the locking at
least is the same for all the generations and pretty easy to test with
and without lockdep with some tests that push essentially all memory
into swap)

BR,
-R

> -Daniel
>
> >
> >  drivers/gpu/drm/msm/msm_drv.c          |   2 +-
> >  drivers/gpu/drm/msm/msm_drv.h          |  13 ++-
> >  drivers/gpu/drm/msm/msm_gem.c          | 155 +++++++++++++++++--------
> >  drivers/gpu/drm/msm/msm_gem.h          |  68 +++++++++--
> >  drivers/gpu/drm/msm/msm_gem_shrinker.c | 129 ++++++++++++--------
> >  drivers/gpu/drm/msm/msm_gpu_trace.h    |  13 +++
> >  6 files changed, 272 insertions(+), 108 deletions(-)
> >
> > --
> > 2.30.2
> >
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
