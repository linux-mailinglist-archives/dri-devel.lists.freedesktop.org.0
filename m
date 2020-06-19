Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 056F62002A8
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jun 2020 09:22:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B84E66EC2A;
	Fri, 19 Jun 2020 07:22:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9FC86EC1B
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jun 2020 07:22:21 +0000 (UTC)
Received: by mail-oi1-x242.google.com with SMTP id a21so7625466oic.8
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jun 2020 00:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DqEsfHHZMDjVjBSRzofGz02dqQOVqzrxROmLfkgGgfU=;
 b=A5HUcVec8RYu1bZm00Qb0nJy7vZOa/JILGkLgAuTZ8La1+bbfcPUqNdntXVxb3kR5C
 Pun8MPh8/elm4LjPbSFd8pHjYzxyAljbGO8JxS8ebVDq1mtIlkNyW1F1f57hRQ1lpcHC
 J28+KzCYOCc4U1wxOh8Jq++Bii/KSrEjFghhI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DqEsfHHZMDjVjBSRzofGz02dqQOVqzrxROmLfkgGgfU=;
 b=o6RThXEE0H0B1OhtJkPrpA1dWUfBb0S1oR3QJw+8Vg0qXsQva9u8yUZBlvrXl7/HIW
 /FZo+WCN3v4pzbg5yQso4axA66QJzudo5UvUj1HXbyJseM6CcktTopAt2EaqIAeZBYQ6
 C12DAeEh5VHBLS6beY4iPbcuVaOsqp/vFOzyqjwURpCAMzAwNtPaLHUWSEWLS/B6qr+m
 vYLt70xyovlyShNpdOLaB3HyhxLZZt9zV/wLVQRuZFUq+aE3T2jM2BaLqDqNsN6ZqO2P
 MPKJ6fo1ZrHFUakgVf6xYfPff4OBGW6ZG1HJDb3piokGkcML4ZQE7xut5GJ2OD+1NGfZ
 cigQ==
X-Gm-Message-State: AOAM533Ek7I4WgwBOmXVzos1jI+Mk7fKwswy2N4n0u499XngnvIuxkmU
 LVc2877Pcmr/hB10ZrZHr5LAfL4wIAoxOcVajSX1Wg==
X-Google-Smtp-Source: ABdhPJzUUv7A3YRtNgpCeUlEiMcyk3Jq4GEcOu2c5HObmsMsz8k+i9bAqj56TkqNTZ0MhscUp+R1cXMiit1pfYTZUok=
X-Received: by 2002:aca:ad97:: with SMTP id w145mr2091861oie.128.1592551341034; 
 Fri, 19 Jun 2020 00:22:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200604081224.863494-1-daniel.vetter@ffwll.ch>
 <20200604081224.863494-5-daniel.vetter@ffwll.ch>
 <b11c2140-1b9c-9013-d9bb-9eb2c1906710@shipmail.org>
 <20200611083430.GD20149@phenom.ffwll.local> <20200611141515.GW6578@ziepe.ca>
 <20200616120719.GL20149@phenom.ffwll.local>
 <CAKMK7uE7DKUo9Z+yCpY+mW5gmKet8ugbF3yZNyHGqsJ=e-g_hA@mail.gmail.com>
 <20200617152835.GF6578@ziepe.ca> <20200618150051.GS20149@phenom.ffwll.local>
 <20200618172338.GM6578@ziepe.ca>
In-Reply-To: <20200618172338.GM6578@ziepe.ca>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 19 Jun 2020 09:22:09 +0200
Message-ID: <CAKMK7uEbqTu4q-amkLXyd1i8KNtLaoO2ZFoGqYiG6D0m0FKpOg@mail.gmail.com>
Subject: Re: [Linaro-mm-sig] [PATCH 04/18] dma-fence: prime lockdep annotations
To: Jason Gunthorpe <jgg@ziepe.ca>
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
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m_=28Intel=29?= <thomas_os@shipmail.org>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
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

On Fri, Jun 19, 2020 at 8:58 AM Jason Gunthorpe <jgg@ziepe.ca> wrote:
>
> On Thu, Jun 18, 2020 at 05:00:51PM +0200, Daniel Vetter wrote:
> > On Wed, Jun 17, 2020 at 12:28:35PM -0300, Jason Gunthorpe wrote:
> > > On Wed, Jun 17, 2020 at 08:48:50AM +0200, Daniel Vetter wrote:
> > >
> > > > Now my understanding for rdma is that if you don't have hw page fault
> > > > support,
> > >
> > > The RDMA ODP feature is restartable HW page faulting just like nouveau
> > > has. The classical MR feature doesn't have this. Only mlx5 HW supports
> > > ODP today.
> > >
> > > > It's only gpus (I think) which are in this awkward in-between spot
> > > > where dynamic memory management really is much wanted, but the hw
> > > > kinda sucks. Aside, about 10+ years ago we had a similar problem with
> > > > gpu hw, but for security: Many gpu didn't have any kinds of page
> > > > tables to isolate different clients from each another. drivers/gpu
> > > > fixed this by parsing&validating what userspace submitted to make sure
> > > > it's only every accessing its own buffers. Most gpus have become
> > > > reasonable nowadays and do have proper per-process pagetables (gpu
> > > > process, not the pasid stuff), but even today there's still some of
> > > > the old model left in some of the smallest SoC.
> > >
> > > But I still don't understand why a dma fence is needed inside the GPU
> > > driver itself in the notifier.
> > >
> > > Surely the GPU driver can block and release the notifier directly from
> > > its own command processing channel?
> > >
> > > Why does this fence and all it entails need to leak out across
> > > drivers?
> >
> > So 10 years ago we had this world of every gpu driver is its own bucket,
> > nothing leaks out to the world. But the world had a different idea how
> > gpus where supposed to work, with stuff like:
>
> Sure, I understand DMA fence, but why does a *notifier* need it?
>
> The job of the notifier is to guarentee that the device it is
> connected to is not doing DMA before it returns.
>
> That just means you need to prove that device is done with the buffer.
>
> As I've understood GPU that means you need to show that the commands
> associated with the buffer have completed. This is all local stuff
> within the driver, right? Why use fence (other than it already exists)

Because that's the end-of-dma thing. And it's cross-driver for the
above reasons, e.g.
- device A renders some stuff. Userspace gets dma_fence A out of that
(well sync_file or one of the other uapi interfaces, but you get the
idea)
- userspace (across process or just different driver) issues more
rendering for device B, which depends upon the rendering done on
device A. So dma_fence A is an dependency and will block this dma
operation. Userspace (and the kernel) gets dma_fence B out of this
- because unfortunate reasons, the same rendering on device B also
needs a userptr buffer, which means that dma_fence B is also the one
that the mmu_range_notifier needs to wait on before it can tell core
mm that it can go ahead and release those pages
- unhappiness ensues, because now the mmu notifier from device B can
get hung up on the dma operation device A is doing

If you want to avoid this either a) have less shitty hw (not an
option, gpus are gpus, it is slowly getting better though) or b) force
userspace to stall before handing over to next device (about as
uncool) or c) just pin all the memory always, who cares (also rather
unpopular, gpus tend to use all the memory they can get).

I guess the thing with gpus is that dma operations aren't like
read/writes for pretty much everything else, but essentially compute
contexts (usually implemented as ringbuffers where you stream stuff
into) with cross everything dependencies. This even holds within a
single gpu, since pretty much all modern gpus have multiple different
engines special on different things. And yup that's directly exposed
to userspace, for vulkan and other low-level gpu apis even directly to
applications. So dma operation for gpu isn't just "done when the
read/write finishes", but pulls in an entire chain of dependencies and
ordering that needs to happen before it can even start.

-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
