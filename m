Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDA2635C8B2
	for <lists+dri-devel@lfdr.de>; Mon, 12 Apr 2021 16:28:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFCC16E5C5;
	Mon, 12 Apr 2021 14:28:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6A686E5B2
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Apr 2021 14:28:23 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id 12so13173528wrz.7
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Apr 2021 07:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=5wosYuEdRDumEnBXzIheT9pdmOTpIyhQh146dwiPvB4=;
 b=QAGr8ID0S2S/RNKo79E6PW0g5QWI2bXQrRCfA47hGGFfP5iK/eKG1MgoDSol4c2N5w
 l8T3s5GycM4L7hCmrrCh6PNxzsc8FGe/XsEUFb4FW7HYxlyYUup2thYvTMx0N05KILVn
 VPfP9iMlglUOrdS3HZmHlfg84wZKvD4Cl4Bhk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=5wosYuEdRDumEnBXzIheT9pdmOTpIyhQh146dwiPvB4=;
 b=oPEeNB7DSwIK3LxbKLoQUxdXLIEL70bKRpq0Ww2yQ9rNc+ZJkTdea932fjFR1IDKL4
 jzg5Urv/Tl1KntZnI4lsEhTy9vNXVOktBTrX9aEeiDFpWZy3eJ+Zt2VDhJUSkC8m1o0e
 0Gp9PZl5JGEd/oN1dUf2lF9U6XjHv3SXkIDMvXB/zwCloahF2xDyL37xSk9drINVrDxZ
 XYFGajAyNFS9wHbsOftVJGZBwWI+vGsCEyZ50Q1KNFNpMd91/m/ytldXqG6cUN2L5as/
 4+wIVoT4mlpAPDfYZFEljcnMNNzKlXk2zk9ujYAp6qbJcAtx9zPMqsjIXjxQR6yooDju
 +x+w==
X-Gm-Message-State: AOAM532oDlSisaHZyEzvNCLfjqaQtjbXpELMSXbMkuU+AH0bF93Dzopr
 QTV1uE0e8byzTvH0xAzG34N9Kg==
X-Google-Smtp-Source: ABdhPJwW7XJUWc6vGSnWB691vgJU4jHRcu8CrcrhHOlfLAA6xKTVcenJoOA1sHfz3snNXNY470tO9g==
X-Received: by 2002:a05:6000:1371:: with SMTP id
 q17mr23685250wrz.326.1618237702168; 
 Mon, 12 Apr 2021 07:28:22 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id g13sm21223836wrr.9.2021.04.12.07.28.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Apr 2021 07:28:21 -0700 (PDT)
Date: Mon, 12 Apr 2021 16:28:19 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH 0/8] drm/msm: Swappable GEM objects
Message-ID: <YHRZA+WBbWrUdpAV@phenom.ffwll.local>
Mail-Followup-To: Rob Clark <robdclark@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Rob Clark <robdclark@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>
References: <20210405174532.1441497-1-robdclark@gmail.com>
 <YG7l0LwVQ2s4Y0Sa@phenom.ffwll.local>
 <CAF6AEGsH2gbKv-Q04gRbjz=ue1TF7S_6DXa06bvYPcmYvG684w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAF6AEGsH2gbKv-Q04gRbjz=ue1TF7S_6DXa06bvYPcmYvG684w@mail.gmail.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 08, 2021 at 08:23:42AM -0700, Rob Clark wrote:
> On Thu, Apr 8, 2021 at 4:15 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > On Mon, Apr 05, 2021 at 10:45:23AM -0700, Rob Clark wrote:
> > > From: Rob Clark <robdclark@chromium.org>
> > >
> > > One would normally hope not to be under enough memory pressure to need
> > > to swap GEM objects to disk backed swap.  But memory backed zram swap
> > > (as enabled on chromebooks, for example) can actually be quite fast
> > > and useful on devices with less RAM.  On a 4GB device, opening up ~4
> > > memory intensive web pages (in separate windows rather than tabs, to try
> > > and prevent tab discard), I see ~500MB worth of GEM objects, of which
> > > maybe only 10% are active at any time, and with unpin/evict enabled,
> > > only about half resident (which is a number that gets much lower if you
> > > simulate extreme memory pressure).  Assuming a 2:1 compression ratio (I
> > > see a bit higher in practice, but cannot isolate swapped out GEM pages
> > > vs other), that is like having an extra 100+MB of RAM, or more under
> > > higher memory pressure.
> > >
> > > Rob Clark (8):
> > >   drm/msm: ratelimit GEM related WARN_ON()s
> > >   drm/msm: Reorganize msm_gem_shrinker_scan()
> > >   drm/msm: Clear msm_obj->sgt in put_pages()
> > >   drm/msm: Split iova purge and close
> > >   drm/msm: Add $debugfs/gem stats on resident objects
> > >   drm/msm: Track potentially evictable objects
> > >   drm/msm: Small msm_gem_purge() fix
> > >   drm/msm: Support evicting GEM objects to swap
> >
> > Given how much entertainement shrinkers are, should we aim for more common
> > code here?
> >
> > Christian has tons of fun with adding something like this for ttm (well
> > different shades of grey). i915 is going to adopt ttm, at least for
> > discrete.
> >
> > The locking is also an utter pain, and msm seems to still live a lot in
> > its own land here. I think as much as possible a standard approach here
> > would be really good, ideally maybe as building blocks shared between ttm
> > and gem-shmem drivers ...
> 
> I don't disagree.. but also replacing the engines on an airplane
> mid-flight isn't a great option either.. ;-)
> 
> The hard part (esp. wrt to locking) is tracking the state of a given
> bo.. ie. is it active, active+purgable, inactive+purgable,
> inactive+unpinnable, etc.  Currently the shmem helpers don't really
> provide anything here.  If they did, I suppose they could provide some
> shrinker helpers as well.  Unfortunately these days I barely have
> enough time for drm/msm, let alone bolting this onto the shmem
> helpers.  I would recommend that if someone wanted to do this, that
> they look at recent drm/msm shrinker patches that I've sent (ie. make
> shrinker->count() lockless, and drop the locks in shrinker->scan()
> body.. when the system is under heavy memory pressure, you start
> getting shrinker called from all the threads so contention for mm_lock
> can be a really bad problem)
> 
> (Well, the other potential problem is that drm/msm has a lot of
> different possible iommu pairings across the generations, so there is
> some potential here to uncover exciting new bugs.. the locking at
> least is the same for all the generations and pretty easy to test with
> and without lockdep with some tests that push essentially all memory
> into swap)

So what we aimed for with i915 and discrete gpu is to first align on
locking with dma_resv_lock for all buffer state, plus a bunch of
lru/allocator locks for lists and stuff.

And then with more aligned locking, figure out how to maybe share more
code.

The trouble is that right now neither shmem helpers, nor drivers using
them, are really using dma_resv_lock to protect their per-buffer state.

So yeah it's a bit an awkward situation, and I don't know myself really
how to get out of it. Lack of people with tons of free time doesn't help
much.

So best case I think is that every time we touch helpers or drivers
locking in a big way, we check whether it's at least slightly going
towards dma_resv_lock or not. And at least make sure we're not going
backwards, and maybe not spin wheels at standstill.

I guess my question is, what would be good to have to make sure we at
least all agree on the overall direction?
-Daniel

> 
> BR,
> -R
> 
> > -Daniel
> >
> > >
> > >  drivers/gpu/drm/msm/msm_drv.c          |   2 +-
> > >  drivers/gpu/drm/msm/msm_drv.h          |  13 ++-
> > >  drivers/gpu/drm/msm/msm_gem.c          | 155 +++++++++++++++++--------
> > >  drivers/gpu/drm/msm/msm_gem.h          |  68 +++++++++--
> > >  drivers/gpu/drm/msm/msm_gem_shrinker.c | 129 ++++++++++++--------
> > >  drivers/gpu/drm/msm/msm_gpu_trace.h    |  13 +++
> > >  6 files changed, 272 insertions(+), 108 deletions(-)
> > >
> > > --
> > > 2.30.2
> > >
> > > _______________________________________________
> > > dri-devel mailing list
> > > dri-devel@lists.freedesktop.org
> > > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> >
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
