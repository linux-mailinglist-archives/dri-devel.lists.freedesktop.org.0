Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E411FC80E
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jun 2020 09:58:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3E5B6E24E;
	Wed, 17 Jun 2020 07:58:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com
 [IPv6:2607:f8b0:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CB646E133
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jun 2020 07:58:06 +0000 (UTC)
Received: by mail-oi1-x243.google.com with SMTP id i74so1021159oib.0
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jun 2020 00:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=X+Qtu+2ZAyZXkh/oo1Lz6E9/PFmVPHRpkYwfH9QQzoY=;
 b=Rnq7BerEC1NJ+s3KJhsfuws9Kg+j4pWFkQJLmI518tzrC8znQHM1y1XOVL+e9QQvGC
 mOcEQIpeKlQI3Ch0XEzDajgEy3Ss5YB513C5XhgrGC29v//2jcdDFh59xMl7mJC4egNc
 wZOOJ+JmjjXVx9gZJsvcArI7aR28zLTWFwR6Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=X+Qtu+2ZAyZXkh/oo1Lz6E9/PFmVPHRpkYwfH9QQzoY=;
 b=Rk59y5lQK47eI+vkRtrtHrBL3mJ9J3X0M/F0ImuNeM/mYTg0Vgd3nzgj2r+Dc9pgSb
 /rZ+Sl3A2PMI0GpoZmaS3lVnZn+iF3kF0HUm4rOHKAO7qE8pkwxumzN9o5bMuemyP0rx
 mVbqltUEq8sPEQmzW6wqC92c2NdG9IQp3zfnU9vNgk8VV6cnAnuGfjV8nNY3cFDhs0Rb
 MFCMNvmxoWdK9GI30Py01aNE1EVZ7kaO1/gE4ChI/jKc5mcX6e5jqhP3XGI6FpOuNYJh
 vtmtFAMHimZ0ruHRbpwHZHJl9wb4JSa0vhhR0CjsElU6QGkIH0jOkiKh7jTlkuNEUUpF
 n2wg==
X-Gm-Message-State: AOAM531tso7LoL/pIN0YrWw3yga45Pf6pG0oXtz3QOJV8IBRRdGj4JK5
 rAMuDd3H78U7U0rxXZtl4/40jSDNyxam/zXgDbq5bA==
X-Google-Smtp-Source: ABdhPJyg/qc6FJuRZYZqNNd5IMYVmnKGSrITOouFVSzC2Mh6TfEGJcQ4YwgOLOvW4cWrgZZvjXq69o3dCj+ez8idqyo=
X-Received: by 2002:aca:ed42:: with SMTP id l63mr6006514oih.101.1592380685425; 
 Wed, 17 Jun 2020 00:58:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200604081224.863494-1-daniel.vetter@ffwll.ch>
 <20200604081224.863494-5-daniel.vetter@ffwll.ch>
 <b11c2140-1b9c-9013-d9bb-9eb2c1906710@shipmail.org>
 <20200611083430.GD20149@phenom.ffwll.local> <20200611141515.GW6578@ziepe.ca>
 <20200616120719.GL20149@phenom.ffwll.local> <20200616145312.GC6578@ziepe.ca>
In-Reply-To: <20200616145312.GC6578@ziepe.ca>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 17 Jun 2020 09:57:54 +0200
Message-ID: <CAKMK7uER6ax1zr14xYLKqDfDZp+ycBsY9Yx7JaVkKQ849VfSPg@mail.gmail.com>
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

On Wed, Jun 17, 2020 at 9:27 AM Jason Gunthorpe <jgg@ziepe.ca> wrote:
>
> On Tue, Jun 16, 2020 at 02:07:19PM +0200, Daniel Vetter wrote:
> > > > I've pinged a bunch of armsoc gpu driver people and ask them how much this
> > > > hurts, so that we have a clear answer. On x86 I don't think we have much
> > > > of a choice on this, with userptr in amd and i915 and hmm work in nouveau
> > > > (but nouveau I think doesn't use dma_fence in there).
> > >
> > > Right, nor will RDMA ODP.
> >
> > Hm, what's the context here? I thought RDMA side you really don't want
> > dma_fence in mmu_notifiers, so not clear to me what you're agreeing on
> > here.
>
> rdma does not use dma_fence at all, and though it is hard to tell, I
> didn't notice a dma_fence in the nouveau invalidation call path.

Nouveau for compute has hw page faults. It doesn't have hw page faults
for non-compute fixed function blocks afaik, so there's a hybrid model
going on. But nouveau also doesn't support userspace memory (instead
of driver-allocated buffer objects) for these fixed function blocks,
so no need to have a dma_fence_wait in there.

> At the very least I think there should be some big warning that
> dma_fence in notifiers should be avoided.

Yeah I'm working on documentation, and also the notifiers here
hopefully make it clear it's massive pain. I think we could even make
a hard rule that dma_fence in mmu notifier outside of drivers/gpu is a
bug/misfeature.

Might be a good idea to add a MAINTAINERS entry with a K: regex
pattern, so that you can catch such modifiers. We do already have such
a pattern for dma-fence, to catch abuse. So if you want I could type
up a documentation patch for this, get your and others acks and the
dri-devel folks would enforce that the dma_fence_wait madness doesn't
leak beyond drivers/gpu

> Ie it is strange that the new totally-not-a-gpu drivers use dma_fence,
> they surely don't have the same constraints as the existing GPU world,
> and it would be annoying to see dma_fence notifiers spring up in them

If you mean drivers/misc/habanalabs, that's going to get taken care of:


commit ed65bfd9fd86dec3772570b0320ca85b9fb69f2e
Author: Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Mon May 11 11:11:42 2020 +0200

    habanalabs: don't set default fence_ops->wait

    It's the default.

    Also so much for "we're not going to tell the graphics people how to
    review their code", dma_fence is a pretty core piece of gpu driver
    infrastructure. And it's very much uapi relevant, including piles of
    corresponding userspace protocols and libraries for how to pass these
    around.

    Would be great if habanalabs would not use this (from a quick look
    it's not needed at all), since open source the userspace and playing
    by the usual rules isn't on the table. If that's not possible (because
    it's actually using the uapi part of dma_fence to interact with gpu
    drivers) then we have exactly what everyone promised we'd want to
    avoid.

    Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
    Reviewed-by: Oded Gabbay <oded.gabbay@gmail.com>
    Signed-off-by: Oded Gabbay <oded.gabbay@gmail.com>

Oded has agreed to remove the dma-fence usage, since they really don't
need it (and all the baggage that comes with it), plain old completion
is enough for their use. This use is also why I added the regex to
MAINTAINERS, so that in the future we can catch people who try to use
dma_fence because it looks cute and useful, and are completely
oblivious to all the pain and headaches involved.

Cheers, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
