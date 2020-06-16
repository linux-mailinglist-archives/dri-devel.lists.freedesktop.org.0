Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 52E241FAFDA
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jun 2020 14:07:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 942A16E8B0;
	Tue, 16 Jun 2020 12:07:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFF806E8AD
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jun 2020 12:07:23 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id c71so2625261wmd.5
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jun 2020 05:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=NYym/pSqjIIqScGqLo5Ww0j4iD30dp97jCKjhc4AWYU=;
 b=knLx2ZpGdX4oGShLggmffytfxEgf558C1PyxfucnfPmqi/xmuLtoOEgBytunObB1zg
 ZIjY/LiV9KQ+0li0viBzy2fcKzZ1o4sgXX7wZfRUllT6FFVlgV9x+uZ64EdChlO5GbtO
 OQSl+XuHY2To5OLz8zVi8cT8LCc/rp6ZyX0ag=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=NYym/pSqjIIqScGqLo5Ww0j4iD30dp97jCKjhc4AWYU=;
 b=RTdBceKAu2UxGuPk7hCLrvgUoQANji0vA5vCDGHNNFxVPMnuTuoSc8ARUziDlTwvc8
 h5ejNabb+8i0hzXTwbNVhc8fKr6PstwEshXggu5lsOCAt98cg5dmrhR5LyomxKv6R/AG
 PcXnIJGm0YQ+XAmHYHsqXAEg/y6SrmX/xtsXsQwu+YqX5P/FBFX5zZA5sVPnHOxUvE44
 oowH/o5L3BkjJVVoADrC3g7ltTNHmxzKlpCxtKk9l8zwzRiWEY+KJ21oq8o56UEP3QMV
 YyjHTRKnlSQKPVWiWBiT1eBTiHMkhC5OSibkfoEiiEsRUEYORb80YKyc02gTVYUW7TV5
 M7iw==
X-Gm-Message-State: AOAM532tBL61/gJigRRTaxT4P49AJLQTelRHb0xqhJpBI5W4eTI0JDcv
 jXiFvyG1ApM5Lh82Fdj93F6Nsg==
X-Google-Smtp-Source: ABdhPJzmf+2Tj55YA8oon0+fo0R23Li5LnD45uflCXtBTtCgHH7dL0b7di5HNdwrzpMTAQLZ6BjvLA==
X-Received: by 2002:a05:600c:2116:: with SMTP id
 u22mr2832332wml.97.1592309242285; 
 Tue, 16 Jun 2020 05:07:22 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id a15sm28830028wra.86.2020.06.16.05.07.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jun 2020 05:07:21 -0700 (PDT)
Date: Tue, 16 Jun 2020 14:07:19 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [Linaro-mm-sig] [PATCH 04/18] dma-fence: prime lockdep annotations
Message-ID: <20200616120719.GL20149@phenom.ffwll.local>
Mail-Followup-To: Jason Gunthorpe <jgg@ziepe.ca>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m_=28Intel=29?= <thomas_os@shipmail.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 linux-rdma@vger.kernel.org,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 LKML <linux-kernel@vger.kernel.org>, amd-gfx@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org,
 Thomas Hellstrom <thomas.hellstrom@intel.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 linux-media@vger.kernel.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Mika Kuoppala <mika.kuoppala@intel.com>
References: <20200604081224.863494-1-daniel.vetter@ffwll.ch>
 <20200604081224.863494-5-daniel.vetter@ffwll.ch>
 <b11c2140-1b9c-9013-d9bb-9eb2c1906710@shipmail.org>
 <20200611083430.GD20149@phenom.ffwll.local>
 <20200611141515.GW6578@ziepe.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200611141515.GW6578@ziepe.ca>
X-Operating-System: Linux phenom 5.6.0-1-amd64 
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
Cc: linux-rdma@vger.kernel.org,
 Thomas =?iso-8859-1?Q?Hellstr=F6m_=28Intel=29?= <thomas_os@shipmail.org>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, Thomas Hellstrom <thomas.hellstrom@intel.com>,
 amd-gfx@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>,
 Mika Kuoppala <mika.kuoppala@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jason,

Somehow this got stuck somewhere in the mail queues, only popped up just
now ...

On Thu, Jun 11, 2020 at 11:15:15AM -0300, Jason Gunthorpe wrote:
> On Thu, Jun 11, 2020 at 10:34:30AM +0200, Daniel Vetter wrote:
> > > I still have my doubts about allowing fence waiting from within shrinkers.
> > > IMO ideally they should use a trywait approach, in order to allow memory
> > > allocation during command submission for drivers that
> > > publish fences before command submission. (Since early reservation object
> > > release requires that).
> > 
> > Yeah it is a bit annoying, e.g. for drm/scheduler I think we'll end up
> > with a mempool to make sure it can handle it's allocations.
> > 
> > > But since drivers are already waiting from within shrinkers and I take your
> > > word for HMM requiring this,
> > 
> > Yeah the big trouble is HMM and mmu notifiers. That's the really awkward
> > one, the shrinker one is a lot less established.
> 
> I really question if HW that needs something like DMA fence should
> even be using mmu notifiers - the best use is HW that can fence the
> DMA directly without having to get involved with some command stream
> processing.
> 
> Or at the very least it should not be a generic DMA fence but a
> narrowed completion tied only into the same GPU driver's command
> completion processing which should be able to progress without
> blocking.

The problem with gpus is that these completions leak across the board like
mad. Both internally within memory managers (made a lot worse with p2p
direct access to vram), and through uapi.

Many gpus still have a very hard time preempting, so doing an overall
switch in drivers/gpu to a memory management model where that is required
is not a very realistic option.  And minimally you need either preempt
(still takes a while, but a lot faster generally than waiting for work to
complete) or hw faults (just a bunch of tlb flushes plus virtual indexed
caches, so just the caveat of that for a gpu, which has lots and big tlbs
and caches). So preventing the completion leaks within the kernel is I
think unrealistic, except if we just say "well sorry, run on windows,
mkay" for many gpu workloads. Or more realistic "well sorry, run on the
nvidia blob with nvidia hw".

The userspace side we can somewhat isolate, at least for pure compute
workloads. But the thing is drivers/gpu is a continum from tiny socs
(where dma_fence is a very nice model) to huge compute stuff (where it's
maybe not the nicest, but hey hw sucks so still neeeded). Doing full on
break in uapi somewhere in there is at least a bit awkward, e.g. some of
the media codec code on intel runs all the way from the smallest intel soc
to the big transcode servers.

So the current status quo is "total mess, every driver defines their own
rules". All I'm trying to do is some common rules here, do make this mess
slightly more manageable and overall reviewable and testable.

I have no illusions that this is fundamentally pretty horrible, and the
leftover wiggle room for writing memory manager is barely more than a
hairline. Just not seeing how other options are better.

> The intent of notifiers was never to endlessly block while vast
> amounts of SW does work.
> 
> Going around and switching everything in a GPU to GFP_ATOMIC seems
> like bad idea.

It's not everyone, or at least not everywhere, it's some fairly limited
cases. Also, even if we drop the mmu_notifier on the floor, then we're
stuck with shrinkers and GFP_NOFS. Still need a mempool of some sorts to
guarantee you get out of a bind, so not much better.

At least that's my current understanding of where we are across all
drivers.

> > I've pinged a bunch of armsoc gpu driver people and ask them how much this
> > hurts, so that we have a clear answer. On x86 I don't think we have much
> > of a choice on this, with userptr in amd and i915 and hmm work in nouveau
> > (but nouveau I think doesn't use dma_fence in there). 
> 
> Right, nor will RDMA ODP. 

Hm, what's the context here? I thought RDMA side you really don't want
dma_fence in mmu_notifiers, so not clear to me what you're agreeing on
here.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
