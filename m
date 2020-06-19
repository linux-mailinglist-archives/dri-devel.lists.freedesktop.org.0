Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3151C203021
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jun 2020 09:08:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E75F6E21C;
	Mon, 22 Jun 2020 07:07:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 781ED6E220
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jun 2020 15:15:53 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id g18so7393580qtu.13
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jun 2020 08:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=X2HlrHXMTsUGZp7zXkK0C6ORZXN08Rk3M03svjYzeco=;
 b=KCSiM2dDaLHttoqe1QHt/9yr2IYYTmKDtwUlr/2aAPsMXJotGdlS5LIUOCBI3nfUKr
 7H5hXjOFeIhEMM1rhPsYmLXsVGK+/URRxwB5gkdgB/VVBX1WNWiPWPxGzOXFSojm2k67
 xv0fxT++s5BYKLm5BozcojKfi5oVGvmGeiUTUYEK9kBmA8g9ZeUGElwaPjjy3Aw3zHUD
 ZgrJPkhJj7UA3fOZqK2qsLucfVZJHTCbjC1vzx8LgcH+mB7ndhuHBfDQHVam/u5lMZnQ
 /ScgOIQLnmny9xQ2AmPd/r9OS8erk86JqJJRaxVdcgDBEB/6Qu//RVN/4j5OzzqwuMzv
 jKuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=X2HlrHXMTsUGZp7zXkK0C6ORZXN08Rk3M03svjYzeco=;
 b=Hcw9EgK7zILJeoLhD1BEM5NPI2KV/VREqafsdn4yMv6gc06b/gmC7uyko9H/9yh8ad
 r4XTPTnGN6TzWpaogN8XpbgBgK0zeHlRNLYAO2xBqp8lClVclEbS5lcTOUaSUQYXRgfX
 EhBvWchYQQD11MaDRreefa02X/s4ci+7c+eMN8MY99YHu9HNYDelmp7kd15cfFJJ3nNI
 Ag6RpTt9f2bfu7PdReMGRtVpUYh5gxdT6CKX5+vU3h8aJTMWu8TkiEzMXv92RQ7cEGO4
 PbJIiBz4XmEP75uTaoqEXq27KJdvUFYOC/TR6W5/qmqHupfsLqnPeqpx5QboS4SKzCRG
 NIYw==
X-Gm-Message-State: AOAM530At2LPh0WIhF9Am6SVjaZ+4vYz7NWPOEMzzXcpXNp4ZywrGsVl
 FgmSy4uSCqvw0FsG9PF1vZ9ldA==
X-Google-Smtp-Source: ABdhPJwyaHoM3658+VLpg+i0sFuo+6OU0FHPK264DOfSFcO/+Xp6yT6eiXXI1R4LmEbcaqkeIQOs/w==
X-Received: by 2002:ac8:2fb0:: with SMTP id l45mr3800795qta.260.1592579752403; 
 Fri, 19 Jun 2020 08:15:52 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.48.30])
 by smtp.gmail.com with ESMTPSA id y54sm7195320qtj.28.2020.06.19.08.15.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Jun 2020 08:15:51 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.93) (envelope-from <jgg@ziepe.ca>)
 id 1jmIkB-00Ap5C-Bi; Fri, 19 Jun 2020 12:15:51 -0300
Date: Fri, 19 Jun 2020 12:15:51 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [Linaro-mm-sig] [PATCH 04/18] dma-fence: prime lockdep annotations
Message-ID: <20200619151551.GP6578@ziepe.ca>
References: <20200611083430.GD20149@phenom.ffwll.local>
 <20200611141515.GW6578@ziepe.ca>
 <20200616120719.GL20149@phenom.ffwll.local>
 <CAKMK7uE7DKUo9Z+yCpY+mW5gmKet8ugbF3yZNyHGqsJ=e-g_hA@mail.gmail.com>
 <20200617152835.GF6578@ziepe.ca>
 <20200618150051.GS20149@phenom.ffwll.local>
 <20200618172338.GM6578@ziepe.ca>
 <CAKMK7uEbqTu4q-amkLXyd1i8KNtLaoO2ZFoGqYiG6D0m0FKpOg@mail.gmail.com>
 <20200619113934.GN6578@ziepe.ca>
 <CAKMK7uE-kWA==Cko5uenMrcnopEjq42HxoDTDywzBAbHqsN13g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uE-kWA==Cko5uenMrcnopEjq42HxoDTDywzBAbHqsN13g@mail.gmail.com>
X-Mailman-Approved-At: Mon, 22 Jun 2020 07:07:47 +0000
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
Cc: linux-rdma <linux-rdma@vger.kernel.org>,
 Thomas =?utf-8?B?SGVsbHN0csO2bSAoSW50ZWwp?= <thomas_os@shipmail.org>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Thomas Hellstrom <thomas.hellstrom@intel.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Mika Kuoppala <mika.kuoppala@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 19, 2020 at 05:06:04PM +0200, Daniel Vetter wrote:
> On Fri, Jun 19, 2020 at 1:39 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
> >
> > On Fri, Jun 19, 2020 at 09:22:09AM +0200, Daniel Vetter wrote:
> > > > As I've understood GPU that means you need to show that the commands
> > > > associated with the buffer have completed. This is all local stuff
> > > > within the driver, right? Why use fence (other than it already exists)
> > >
> > > Because that's the end-of-dma thing. And it's cross-driver for the
> > > above reasons, e.g.
> > > - device A renders some stuff. Userspace gets dma_fence A out of that
> > > (well sync_file or one of the other uapi interfaces, but you get the
> > > idea)
> > > - userspace (across process or just different driver) issues more
> > > rendering for device B, which depends upon the rendering done on
> > > device A. So dma_fence A is an dependency and will block this dma
> > > operation. Userspace (and the kernel) gets dma_fence B out of this
> > > - because unfortunate reasons, the same rendering on device B also
> > > needs a userptr buffer, which means that dma_fence B is also the one
> > > that the mmu_range_notifier needs to wait on before it can tell core
> > > mm that it can go ahead and release those pages
> >
> > I was afraid you'd say this - this is complete madness for other DMA
> > devices to borrow the notifier hook of the first device!
> 
> The first device might not even have a notifier. This is the 2nd
> device, waiting on a dma_fence of its own, but which happens to be
> queued up as a dma operation behind something else.
> 
> > What if the first device is a page faulting device and doesn't call
> > dma_fence??
> 
> Not sure what you mean with this ... even if it does page-faulting for
> some other reasons, it'll emit a dma_fence which the 2nd device can
> consume as a dependency.

At some point the pages under the buffer have to be either pinned
or protected by mmu notifier. So each and every single device doing
DMA to these pages must either pin, or use mmu notifier.

Driver A should never 'borrow' a notifier from B

If each driver controls its own lifetime of the buffers, why can't the
driver locally wait for its device to finish?

Can't the GPUs cancel work that is waiting on a DMA fence? Ie if
Driver A detects that work completed and wants to trigger a DMA fence,
but it now knows the buffer is invalidated, can't it tell driver B to
give up?

> The problem is that there's piles of other dependencies for a dma job.
> GPU doesn't just consume a single buffer each time, it consumes entire
> lists of buffers and mixes them all up in funny ways. Some of these
> buffers are userptr, entirely local to the device. Other buffers are
> just normal device driver allocations (and managed with some shrinker
> to keep them in check). And then there's the actually shared dma-buf
> with other devices. The trouble is that they're all bundled up
> together.

But why does this matter? Does the GPU itself consume some work and
then stall internally waiting for an external DMA fence?

Otherwise I would expect this dependency chain should be breakable by
aborting work waiting on fences upon invalidation (without stalling)

> > Do not need to wait on dma_fence in notifiers.
> 
> Maybe :-) The goal of this series is more to document current rules
> and make them more consistent. Fixing them if we don't like them might
> be a follow-up task, but that would likely be a pile more work. First
> we need to know what the exact shape of the problem even is.

Fair enough

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
