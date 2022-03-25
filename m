Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 60ED74E7105
	for <lists+dri-devel@lfdr.de>; Fri, 25 Mar 2022 11:18:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 483B210E377;
	Fri, 25 Mar 2022 10:18:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9878D10E392
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Mar 2022 10:17:59 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id
 123-20020a1c1981000000b0038b3616a71aso4080823wmz.4
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Mar 2022 03:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=0aC7V2mDNzElpy6JoV9pERSEeohzyPQnTb1F/WiSViA=;
 b=Mn+ARwRbFqRnk2oy7dnOKKHx91uBcpUiOIMd4eyBPo68SELuD8J/J1RYXijYacFR0T
 trQm858DiW3A+vNY3PcaKQLGZo9UXGvKlZWWMxHze7Nq1/eOYWBa7bw+rvFYMUV/UxBs
 T/xitgmmSwgUBJ6ocvhynY5upRokl3NcvgQhY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=0aC7V2mDNzElpy6JoV9pERSEeohzyPQnTb1F/WiSViA=;
 b=qGYYu/h4hb4+7e5mhsWL8XTLCX0dBjB0ci4P3POo0XhfE7buAiHuYrYGiWeSc3hRcA
 2t0spQ5EHtyvfXnJxYWGQrNcGupO12YKGWJb7pmvHzMBpqHMIamxB7/YqyGn/rzpUB6X
 xOArvL7Xm7/gGc66SfJlTZOJBOFyaqyTPyOG2PajaHIXnhWok5xpnJKecDquLgRx5/QM
 igT80LsQ1ATG4Ff7b3UFUFBCZFLFzMcluiI/U5GI8zTx/u0pxo+r4ucYYhh43++VFqcI
 BLu6f3wLSznw17IWyuCEP7QVHWMIaQfgDCoHHIuRC01KBMENu2ihIYVbKjRa38ooyp9e
 E1Iw==
X-Gm-Message-State: AOAM53109xr0D1mu7uyGgvjzmgRD05/eAAcnO/SO5tDmKh2S+DT2zqkF
 O1rClt2bPLVQScTyzN3RoIv8jm1Z2k/wjlNE++I=
X-Google-Smtp-Source: ABdhPJySTcRWNB3OFH3rh/Pj8vvL1+sAQrpoopdID698svkWEt8DcYWQ9IThQ5Kuq77l4/vA3+ZHFw==
X-Received: by 2002:a1c:3bc3:0:b0:38c:9a42:a143 with SMTP id
 i186-20020a1c3bc3000000b0038c9a42a143mr18826984wma.64.1648203478044; 
 Fri, 25 Mar 2022 03:17:58 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 z5-20020a05600c0a0500b0037bb8df81a2sm9586794wmp.13.2022.03.25.03.17.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Mar 2022 03:17:57 -0700 (PDT)
Date: Fri, 25 Mar 2022 11:17:55 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH 1/2] dma-buf: add dma_fence_unwrap
Message-ID: <Yj2W06Fri9jQbOrQ@phenom.ffwll.local>
References: <20220311110244.1245-1-christian.koenig@amd.com>
 <Yj2TiqwRMTNEEB3D@phenom.ffwll.local>
 <Yj2UXwOh7/bAm8+J@phenom.ffwll.local>
 <83c2935d-e5e9-7c4d-f350-9372cce26c8d@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <83c2935d-e5e9-7c4d-f350-9372cce26c8d@amd.com>
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
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 gustavo@padovan.org, sumit.semwal@linaro.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 25, 2022 at 11:10:15AM +0100, Christian König wrote:
> Am 25.03.22 um 11:07 schrieb Daniel Vetter:
> > On Fri, Mar 25, 2022 at 11:03:54AM +0100, Daniel Vetter wrote:
> > > On Fri, Mar 11, 2022 at 12:02:43PM +0100, Christian König wrote:
> > > > Add a general purpose helper to deep dive into dma_fence_chain/dma_fence_array
> > > > structures and iterate over all the fences in them.
> > > > 
> > > > This is useful when we need to flatten out all fences in those structures.
> > > > 
> > > > Signed-off-by: Christian König <christian.koenig@amd.com>
> > > > ---
> > > >   Documentation/driver-api/dma-buf.rst  |   6 +
> > > >   drivers/dma-buf/Makefile              |   1 +
> > > >   drivers/dma-buf/selftests.h           |   1 +
> > > >   drivers/dma-buf/st-dma-fence-unwrap.c | 279 ++++++++++++++++++++++++++
> > > >   include/linux/dma-fence-unwrap.h      |  99 +++++++++
> > > >   5 files changed, 386 insertions(+)
> > > >   create mode 100644 drivers/dma-buf/st-dma-fence-unwrap.c
> > > >   create mode 100644 include/linux/dma-fence-unwrap.h
> > > > 
> > > > diff --git a/Documentation/driver-api/dma-buf.rst b/Documentation/driver-api/dma-buf.rst
> > > > index 2cd7db82d9fe..7209500f08c8 100644
> > > > --- a/Documentation/driver-api/dma-buf.rst
> > > > +++ b/Documentation/driver-api/dma-buf.rst
> > > > @@ -194,6 +194,12 @@ DMA Fence Chain
> > > >   .. kernel-doc:: include/linux/dma-fence-chain.h
> > > >      :internal:
> > > > +DMA Fence unwrap
> > > > +~~~~~~~~~~~~~~~~
> > > > +
> > > > +.. kernel-doc:: include/linux/dma-fence-unwrap.h
> > > > +   :internal:
> > Ok I forgot one bikeshed: I'd just include this in dma-fence-chain.h and
> > maybe go with the dma_fence_chain_unwrap_ prefix for everything. That
> > makes it even more clearer that the two are meant to go together. Plus ofc
> > the link from struct dma_fence_chain to this iterator in the docs too.
> > 
> > Or I'm just not understanding why you made this a separate thing?
> 
> Well it should be used to unwrap dma_fence_array containers as well and I
> don't really want to add a dependency between dma_fence_chain and
> dma_fence_array.
> 
> I've spend quite some work to keep the two containers separated and also
> describe the separate use cases for each.
> 
> I can of course add some kerneldoc to let the chain and array documentation
> point to this one here.

Yeah I think as a general iterator they should be fine as a separate
thing. Also just realized that we'd need links from both array and chain
to this since it's for both.

The other thing I noticed is that we have dma_fence_chain_for_each()
already. Should we replace all users of that outside of dma-fence-chain.c
with this new thing, and move the chain specific iterator into
dma-fence-chain.c so that it's hidden and people don't make funny
accidents? Just for more safety in this maze, also ofc that's all
follow-up.
-Daniel



> 
> Thanks,
> Christian.
> 
> > -Daniel
> > 
> > > > +
> > > >   DMA Fence uABI/Sync File
> > > >   ~~~~~~~~~~~~~~~~~~~~~~~~
> > > > diff --git a/drivers/dma-buf/Makefile b/drivers/dma-buf/Makefile
> > > > index 511805dbeb75..4c9eb53ba3f8 100644
> > > > --- a/drivers/dma-buf/Makefile
> > > > +++ b/drivers/dma-buf/Makefile
> > > > @@ -12,6 +12,7 @@ dmabuf_selftests-y := \
> > > >   	selftest.o \
> > > >   	st-dma-fence.o \
> > > >   	st-dma-fence-chain.o \
> > > > +	st-dma-fence-unwrap.o \
> > > >   	st-dma-resv.o
> > > >   obj-$(CONFIG_DMABUF_SELFTESTS)	+= dmabuf_selftests.o
> > > > diff --git a/drivers/dma-buf/selftests.h b/drivers/dma-buf/selftests.h
> > > > index 97d73aaa31da..851965867d9c 100644
> > > > --- a/drivers/dma-buf/selftests.h
> > > > +++ b/drivers/dma-buf/selftests.h
> > > > @@ -12,4 +12,5 @@
> > > >   selftest(sanitycheck, __sanitycheck__) /* keep first (igt selfcheck) */
> > > >   selftest(dma_fence, dma_fence)
> > > >   selftest(dma_fence_chain, dma_fence_chain)
> > > > +selftest(dma_fence_unwrap, dma_fence_unwrap)
> > > >   selftest(dma_resv, dma_resv)
> > > > diff --git a/drivers/dma-buf/st-dma-fence-unwrap.c b/drivers/dma-buf/st-dma-fence-unwrap.c
> > > > new file mode 100644
> > > > index 000000000000..d821faaebe93
> > > > --- /dev/null
> > > > +++ b/drivers/dma-buf/st-dma-fence-unwrap.c
> > > > @@ -0,0 +1,279 @@
> > > > +// SPDX-License-Identifier: MIT
> > > > +
> > > > +/*
> > > > + * Copyright (C) 2022 Advanced Micro Devices, Inc.
> > > > + */
> > > > +
> > > > +#include <linux/dma-fence-unwrap.h>
> > > > +#if 0
> > > > +#include <linux/kernel.h>
> > > > +#include <linux/kthread.h>
> > > > +#include <linux/mm.h>
> > > > +#include <linux/sched/signal.h>
> > > > +#include <linux/slab.h>
> > > > +#include <linux/spinlock.h>
> > > > +#include <linux/random.h>
> > > > +#endif
> > > > +
> > > > +#include "selftest.h"
> > > > +
> > > > +#define CHAIN_SZ (4 << 10)
> > > > +
> > > > +static struct kmem_cache *slab_fences;
> > > Your own slab feels a bit like overkill. kmalloc/kfree not good enough?
> > > 
> > > > +
> > > > +static inline struct mock_fence {
> > > > +	struct dma_fence base;
> > > > +	spinlock_t lock;
> > > > +} *to_mock_fence(struct dma_fence *f) {
> > > > +	return container_of(f, struct mock_fence, base);
> > > > +}
> > > > +
> > > > +static const char *mock_name(struct dma_fence *f)
> > > > +{
> > > > +	return "mock";
> > > > +}
> > > > +
> > > > +static void mock_fence_release(struct dma_fence *f)
> > > > +{
> > > > +	kmem_cache_free(slab_fences, to_mock_fence(f));
> > > > +}
> > > > +
> > > > +static const struct dma_fence_ops mock_ops = {
> > > > +	.get_driver_name = mock_name,
> > > > +	.get_timeline_name = mock_name,
> > > > +	.release = mock_fence_release,
> > > > +};
> > > > +
> > > > +static struct dma_fence *mock_fence(void)
> > > > +{
> > > > +	struct mock_fence *f;
> > > > +
> > > > +	f = kmem_cache_alloc(slab_fences, GFP_KERNEL);
> > > > +	if (!f)
> > > > +		return NULL;
> > > > +
> > > > +	spin_lock_init(&f->lock);
> > > > +	dma_fence_init(&f->base, &mock_ops, &f->lock, 0, 0);
> > > > +
> > > > +	return &f->base;
> > > > +}
> > > > +
> > > > +static struct dma_fence *mock_array(unsigned int num_fences, ...)
> > > > +{
> > > > +	struct dma_fence_array *array;
> > > > +	struct dma_fence **fences;
> > > > +	va_list valist;
> > > > +	int i;
> > > > +
> > > > +	fences = kcalloc(num_fences, sizeof(*fences), GFP_KERNEL);
> > > > +	if (!fences)
> > > > +		return NULL;
> > > > +
> > > > +	va_start(valist, num_fences);
> > > > +	for (i = 0; i < num_fences; ++i)
> > > > +		fences[i] = va_arg(valist, typeof(*fences));
> > > > +	va_end(valist);
> > > > +
> > > > +	array = dma_fence_array_create(num_fences, fences,
> > > > +				       dma_fence_context_alloc(1),
> > > > +				       1, false);
> > > > +	if (!array)
> > > > +		goto cleanup;
> > > > +	return &array->base;
> > > > +
> > > > +cleanup:
> > > > +	for (i = 0; i < num_fences; ++i)
> > > > +		dma_fence_put(fences[i]);
> > > > +	kfree(fences);
> > > > +	return NULL;
> > > > +}
> > > > +
> > > > +static struct dma_fence *mock_chain(struct dma_fence *prev,
> > > > +				    struct dma_fence *fence)
> > > > +{
> > > > +	struct dma_fence_chain *f;
> > > > +
> > > > +	f = dma_fence_chain_alloc();
> > > > +	if (!f) {
> > > > +		dma_fence_put(prev);
> > > > +		dma_fence_put(fence);
> > > > +		return NULL;
> > > > +	}
> > > > +
> > > > +	dma_fence_chain_init(f, prev, fence, 1);
> > > > +	return &f->base;
> > > > +}
> > > > +
> > > > +static int sanitycheck(void *arg)
> > > > +{
> > > > +	struct dma_fence *f, *chain, *array;
> > > > +	int err = 0;
> > > > +
> > > > +	f = mock_fence();
> > > > +	if (!f)
> > > > +		return -ENOMEM;
> > > > +
> > > > +	array = mock_array(1, f);
> > > > +	if (!array)
> > > > +		return -ENOMEM;
> > > > +
> > > > +	chain = mock_chain(NULL, array);
> > > > +	if (!chain)
> > > > +		return -ENOMEM;
> > > > +
> > > > +	dma_fence_signal(f);
> > > > +	dma_fence_put(chain);
> > > > +	return err;
> > > > +}
> > > > +
> > > > +static int unwrap_array(void *arg)
> > > > +{
> > > > +	struct dma_fence *fence, *f1, *f2, *array;
> > > > +	struct dma_fence_unwrap iter;
> > > > +	int err = 0;
> > > > +
> > > > +	f1 = mock_fence();
> > > > +	if (!f1)
> > > > +		return -ENOMEM;
> > > > +
> > > > +	f2 = mock_fence();
> > > > +	if (!f2) {
> > > > +		dma_fence_put(f1);
> > > > +		return -ENOMEM;
> > > > +	}
> > > > +
> > > > +	array = mock_array(2, f1, f2);
> > > > +	if (!array)
> > > > +		return -ENOMEM;
> > > > +
> > > > +	dma_fence_unwrap_for_each(fence, &iter, array) {
> > > > +		if (fence == f1) {
> > > > +			f1 = NULL;
> > > > +		} else if (fence == f2) {
> > > > +			f2 = NULL;
> > > > +		} else {
> > > > +			pr_err("Unexpected fence!\n");
> > > > +			err = -EINVAL;
> > > > +		}
> > > > +	}
> > > > +
> > > > +	if (f1 || f2) {
> > > > +		pr_err("Not all fences seen!\n");
> > > > +		err = -EINVAL;
> > > > +	}
> > > > +
> > > > +	dma_fence_signal(f1);
> > > > +	dma_fence_signal(f2);
> > > > +	dma_fence_put(array);
> > > > +	return 0;
> > > > +}
> > > > +
> > > > +static int unwrap_chain(void *arg)
> > > > +{
> > > > +	struct dma_fence *fence, *f1, *f2, *chain;
> > > > +	struct dma_fence_unwrap iter;
> > > > +	int err = 0;
> > > > +
> > > > +	f1 = mock_fence();
> > > > +	if (!f1)
> > > > +		return -ENOMEM;
> > > > +
> > > > +	f2 = mock_fence();
> > > > +	if (!f2) {
> > > > +		dma_fence_put(f1);
> > > > +		return -ENOMEM;
> > > > +	}
> > > > +
> > > > +	chain = mock_chain(f1, f2);
> > > > +	if (!chain)
> > > > +		return -ENOMEM;
> > > > +
> > > > +	dma_fence_unwrap_for_each(fence, &iter, chain) {
> > > > +		if (fence == f1) {
> > > > +			f1 = NULL;
> > > > +		} else if (fence == f2) {
> > > > +			f2 = NULL;
> > > > +		} else {
> > > > +			pr_err("Unexpected fence!\n");
> > > > +			err = -EINVAL;
> > > > +		}
> > > > +	}
> > > > +
> > > > +	if (f1 || f2) {
> > > > +		pr_err("Not all fences seen!\n");
> > > > +		err = -EINVAL;
> > > > +	}
> > > > +
> > > > +	dma_fence_signal(f1);
> > > > +	dma_fence_signal(f2);
> > > > +	dma_fence_put(chain);
> > > > +	return 0;
> > > > +}
> > > > +
> > > > +static int unwrap_chain_array(void *arg)
> > > > +{
> > > > +	struct dma_fence *fence, *f1, *f2, *array, *chain;
> > > > +	struct dma_fence_unwrap iter;
> > > > +	int err = 0;
> > > > +
> > > > +	f1 = mock_fence();
> > > > +	if (!f1)
> > > > +		return -ENOMEM;
> > > > +
> > > > +	f2 = mock_fence();
> > > > +	if (!f2) {
> > > > +		dma_fence_put(f1);
> > > > +		return -ENOMEM;
> > > > +	}
> > > > +
> > > > +	array = mock_array(2, f1, f2);
> > > > +	if (!array)
> > > > +		return -ENOMEM;
> > > > +
> > > > +	chain = mock_chain(NULL, array);
> > > > +	if (!chain)
> > > > +		return -ENOMEM;
> > > > +
> > > > +	dma_fence_unwrap_for_each(fence, &iter, chain) {
> > > > +		if (fence == f1) {
> > > > +			f1 = NULL;
> > > > +		} else if (fence == f2) {
> > > > +			f2 = NULL;
> > > > +		} else {
> > > > +			pr_err("Unexpected fence!\n");
> > > > +			err = -EINVAL;
> > > > +		}
> > > > +	}
> > > > +
> > > > +	if (f1 || f2) {
> > > > +		pr_err("Not all fences seen!\n");
> > > > +		err = -EINVAL;
> > > > +	}
> > > > +
> > > > +	dma_fence_signal(f1);
> > > > +	dma_fence_signal(f2);
> > > > +	dma_fence_put(chain);
> > > > +	return 0;
> > > > +}
> > > > +
> > > > +int dma_fence_unwrap(void)
> > > > +{
> > > > +	static const struct subtest tests[] = {
> > > > +		SUBTEST(sanitycheck),
> > > > +		SUBTEST(unwrap_array),
> > > > +		SUBTEST(unwrap_chain),
> > > > +		SUBTEST(unwrap_chain_array),
> > > > +	};
> > > > +	int ret;
> > > > +
> > > > +	slab_fences = KMEM_CACHE(mock_fence,
> > > > +				 SLAB_TYPESAFE_BY_RCU |
> > > > +				 SLAB_HWCACHE_ALIGN);
> > > > +	if (!slab_fences)
> > > > +		return -ENOMEM;
> > > > +
> > > > +	ret = subtests(tests, NULL);
> > > > +
> > > > +	kmem_cache_destroy(slab_fences);
> > > > +	return ret;
> > > > +}
> > > > diff --git a/include/linux/dma-fence-unwrap.h b/include/linux/dma-fence-unwrap.h
> > > > new file mode 100644
> > > > index 000000000000..54963df00c98
> > > > --- /dev/null
> > > > +++ b/include/linux/dma-fence-unwrap.h
> > > > @@ -0,0 +1,99 @@
> > > > +/* SPDX-License-Identifier: GPL-2.0-only */
> > > > +/*
> > > > + * fence-chain: chain fences together in a timeline
> > > > + *
> > > > + * Copyright (C) 2022 Advanced Micro Devices, Inc.
> > > > + * Authors:
> > > > + *	Christian König <christian.koenig@amd.com>
> > > > + */
> > > > +
> > > > +#ifndef __LINUX_DMA_FENCE_UNWRAP_H
> > > > +#define __LINUX_DMA_FENCE_UNWRAP_H
> > > > +
> > > > +#include <linux/dma-fence-chain.h>
> > > > +#include <linux/dma-fence-array.h>
> > > > +
> > > > +/**
> > > > + * struct dma_fence_unwrap - cursor into the container structure
> > > I think adding "This should be used together with
> > > dma_fence_unwrap_for_each() iterator macro." would be nice here. I just
> > > like links :-)
> > > 
> > > > + */
> > > > +struct dma_fence_unwrap {
> > > > +	/**
> > > > +	 * @chain: potential dma_fence_chain, but can be other fence as well
> > > > +	 */
> > > > +	struct dma_fence *chain;
> > > > +	/**
> > > > +	 * @array: potential dma_fence_array, but can be other fence as well
> > > > +	 */
> > > > +	struct dma_fence *array;
> > > > +	/**
> > > > +	 * @index: last returned index if @array is really a dma_fence_array
> > > > +	 */
> > > > +	unsigned int index;
> > > > +};
> > > > +
> > > > +/**
> > > > + * dma_fence_unwrap_array - helper to unwrap dma_fence_arrays
> > > > + * @cursor: cursor to initialize
> > > > + *
> > > > + * Helper function to unwrap dma_fence_array containers, don't touch directly.
> > > > + * Use dma_fence_unwrap_first/next instead.
> > > > + */
> > > > +static inline struct dma_fence *
> > > > +dma_fence_unwrap_array(struct dma_fence_unwrap * cursor)
> > > Since this is a helper that no one should call I'd give it a __ prefix and
> > > drop the kerneldoc. Documenting stuff that people shouldn't use is
> > > confusing :-)
> > > 
> > > > +{
> > > > +	cursor->array = dma_fence_chain_contained(cursor->chain);
> > > > +	cursor->index = 0;
> > > > +	return dma_fence_array_first(cursor->array);
> > > > +}
> > > > +
> > > > +/**
> > > > + * dma_fence_unwrap_first - return the first fence from fence containers
> > > > + * @head: the entrypoint into the containers
> > > > + * @cursor: current position inside the containers
> > > > + *
> > > > + * Unwraps potential dma_fence_chain/dma_fence_array containers and return the
> > > > + * first fence.
> > > > + */
> > > > +static inline struct dma_fence *
> > > > +dma_fence_unwrap_first(struct dma_fence *head, struct dma_fence_unwrap *cursor)
> > > > +{
> > > > +	cursor->chain = dma_fence_get(head);
> > > > +	return dma_fence_unwrap_array(cursor);
> > > > +}
> > > > +
> > > > +/**
> > > > + * dma_fence_unwrap_next - return the next fence from a fence containers
> > > > + * @cursor: current position inside the containers
> > > > + *
> > > > + * Continue unwrapping the dma_fence_chain/dma_fence_array containers and return
> > > > + * the next fence from them.
> > > > + */
> > > > +static inline struct dma_fence *
> > > > +dma_fence_unwrap_next(struct dma_fence_unwrap *cursor)
> > > > +{
> > > > +	struct dma_fence *tmp;
> > > > +
> > > > +	++cursor->index;
> > > > +	tmp = dma_fence_array_next(cursor->array, cursor->index);
> > > > +	if (tmp)
> > > > +		return tmp;
> > > > +
> > > > +	cursor->chain = dma_fence_chain_walk(cursor->chain);
> > > > +	return dma_fence_unwrap_array(cursor);
> > > > +}
> > > > +
> > > > +/**
> > > > + * dma_fence_unwrap_for_each - iterate over all fences in containers
> > > > + * @fence: current fence
> > > > + * @cursor: current position inside the containers
> > > > + * @head: starting point for the iterator
> > > > + *
> > > > + * Unwrap dma_fence_chain and dma_fence_array containers and deep dive into all
> > > > + * potential fences in them. If @head is just a normal fence only that one is
> > > > + * returned.
> > > > + */
> > > > +#define dma_fence_unwrap_for_each(fence, cursor, head)			\
> > > > +	for (fence = dma_fence_unwrap_first(head, cursor); fence;	\
> > > > +	     fence = dma_fence_unwrap_next(cursor))
> > > > +
> > > > +#endif
> > > I think it'd be really good to add a small paragraph to struct
> > > dma_fence_chain that this macro and iterator should be used for walking
> > > over all fences in a chain, including any fence arrays or anything like
> > > that.
> > > 
> > > With the bikesheds addressed:
> > > 
> > > Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > > 
> > > > -- 
> > > > 2.25.1
> > > > 
> > > -- 
> > > Daniel Vetter
> > > Software Engineer, Intel Corporation
> > > https://nam11.safelinks.protection.outlook.com/?url=http%3A%2F%2Fblog.ffwll.ch%2F&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7Caa747083900b451d359308da0e4745e3%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637837996532802687%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=Jts5%2BObWJHeUG4oy2biwj5Bf3PKkMrYU%2F0EihvQRNuY%3D&amp;reserved=0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
