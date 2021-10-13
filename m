Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04F8042C20F
	for <lists+dri-devel@lfdr.de>; Wed, 13 Oct 2021 16:04:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D4546E0AF;
	Wed, 13 Oct 2021 14:04:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A3AF6E087
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Oct 2021 14:04:51 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id g25so8862997wrb.2
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Oct 2021 07:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=8arhVRVJMM/h5+bGfd41jsxKdQFpqyddyEDa37EQIQ8=;
 b=TdCz2jiMPVNPGmXy1MfLiPR+cHK0cAYyfdkweSUyxLdb93OAoNSp0t1ewpI4zSMeA4
 dY+WsqKuPpowLcQY8W1qL29R4MwcY94W6g+eSpWuF0gRLqmpYRYUzqlCTVe16cJh3/Vh
 pN1WbuyNHLBMLwTZsjyNQusxAOeMxNvF0NWu4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=8arhVRVJMM/h5+bGfd41jsxKdQFpqyddyEDa37EQIQ8=;
 b=c0cDqyE7M+kzFhEIVsxxwjxAcuGCFwwFFgjhcC9ztgf2HzR3sUa8VXPntfpUYqNxRX
 QtnZoUb544xgLlbHK+ye28EJZ9nydfZlsdQcQXt7RzdkDAIxjMKNFnNf54dPAV6lVsjQ
 LEeNuPsltyYpI45Pr4WlLKyVW5qiSxp7u7Oo/aWRZPedc9oHiGghHR3UzmxrHZ3U5oiR
 GV0wR94EcxLOEd7Rr6cWe7AxacNIaki0iaM/qjj+RD9X/6kV3Vw5JyNgZNldmrk3bXhr
 9Fl32P4XXhcmALtBquLs598T7vo8rKYYo8lK+2QsY1AKouuI0obYsQijqjFx9TzPvCE8
 nOzA==
X-Gm-Message-State: AOAM530Nnp/yEz6rnLDKP3RGstpOKiPl3b7y7PZ0cRxDs1IFCgX0b1bo
 e9qb35mfU73W4bn9Uk7NwfzNrg==
X-Google-Smtp-Source: ABdhPJygRDKWOSNpd6ZdotmTHdQYpKRtkoIUvlMILRACpq5gJocRd+rbfydJiSsRbGMYRPk3kb970w==
X-Received: by 2002:a05:600c:378a:: with SMTP id
 o10mr12659347wmr.77.1634133888765; 
 Wed, 13 Oct 2021 07:04:48 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id c132sm5643138wma.22.2021.10.13.07.04.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 07:04:48 -0700 (PDT)
Date: Wed, 13 Oct 2021 16:04:46 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 daniel@ffwll.ch, tvrtko.ursulin@linux.intel.com
Subject: Re: [PATCH 03/28] dma-buf: add dma_resv selftest v3
Message-ID: <YWbnfhU+4bHKluhf@phenom.ffwll.local>
References: <20211005113742.1101-1-christian.koenig@amd.com>
 <20211005113742.1101-4-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211005113742.1101-4-christian.koenig@amd.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 05, 2021 at 01:37:17PM +0200, Christian König wrote:
> Just exercising a very minor subset of the functionality, but already
> proven useful.
> 
> v2: add missing locking
> v3: some more cleanup and consolidation, add unlocked test as well
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>

Yeah this is great, since if we then get some specific bug later on it's
going to be very easy to add the unit test for the precise bug hopefully.

I scrolled through, looks correct.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/dma-buf/Makefile      |   3 +-
>  drivers/dma-buf/selftests.h   |   1 +
>  drivers/dma-buf/st-dma-resv.c | 282 ++++++++++++++++++++++++++++++++++
>  3 files changed, 285 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/dma-buf/st-dma-resv.c
> 
> diff --git a/drivers/dma-buf/Makefile b/drivers/dma-buf/Makefile
> index 1ef021273a06..511805dbeb75 100644
> --- a/drivers/dma-buf/Makefile
> +++ b/drivers/dma-buf/Makefile
> @@ -11,6 +11,7 @@ obj-$(CONFIG_DMABUF_SYSFS_STATS) += dma-buf-sysfs-stats.o
>  dmabuf_selftests-y := \
>  	selftest.o \
>  	st-dma-fence.o \
> -	st-dma-fence-chain.o
> +	st-dma-fence-chain.o \
> +	st-dma-resv.o
>  
>  obj-$(CONFIG_DMABUF_SELFTESTS)	+= dmabuf_selftests.o
> diff --git a/drivers/dma-buf/selftests.h b/drivers/dma-buf/selftests.h
> index bc8cea67bf1e..97d73aaa31da 100644
> --- a/drivers/dma-buf/selftests.h
> +++ b/drivers/dma-buf/selftests.h
> @@ -12,3 +12,4 @@
>  selftest(sanitycheck, __sanitycheck__) /* keep first (igt selfcheck) */
>  selftest(dma_fence, dma_fence)
>  selftest(dma_fence_chain, dma_fence_chain)
> +selftest(dma_resv, dma_resv)
> diff --git a/drivers/dma-buf/st-dma-resv.c b/drivers/dma-buf/st-dma-resv.c
> new file mode 100644
> index 000000000000..50d3791ccb8c
> --- /dev/null
> +++ b/drivers/dma-buf/st-dma-resv.c
> @@ -0,0 +1,282 @@
> +/* SPDX-License-Identifier: MIT */
> +
> +/*
> +* Copyright © 2019 Intel Corporation
> +* Copyright © 2021 Advanced Micro Devices, Inc.
> +*/
> +
> +#include <linux/slab.h>
> +#include <linux/spinlock.h>
> +#include <linux/dma-resv.h>
> +
> +#include "selftest.h"
> +
> +static struct spinlock fence_lock;
> +
> +static const char *fence_name(struct dma_fence *f)
> +{
> +	return "selftest";
> +}
> +
> +static const struct dma_fence_ops fence_ops = {
> +	.get_driver_name = fence_name,
> +	.get_timeline_name = fence_name,
> +};
> +
> +static struct dma_fence *alloc_fence(void)
> +{
> +	struct dma_fence *f;
> +
> +	f = kmalloc(sizeof(*f), GFP_KERNEL);
> +	if (!f)
> +		return NULL;
> +
> +	dma_fence_init(f, &fence_ops, &fence_lock, 0, 0);
> +	return f;
> +}
> +
> +static int sanitycheck(void *arg)
> +{
> +	struct dma_resv resv;
> +	struct dma_fence *f;
> +	int r;
> +
> +	f = alloc_fence();
> +	if (!f)
> +		return -ENOMEM;
> +
> +	dma_fence_signal(f);
> +	dma_fence_put(f);
> +
> +	dma_resv_init(&resv);
> +	r = dma_resv_lock(&resv, NULL);
> +	if (r)
> +		pr_err("Resv locking failed\n");
> +	else
> +		dma_resv_unlock(&resv);
> +	dma_resv_fini(&resv);
> +	return r;
> +}
> +
> +static int test_signaling(void *arg, bool shared)
> +{
> +	struct dma_resv resv;
> +	struct dma_fence *f;
> +	int r;
> +
> +	f = alloc_fence();
> +	if (!f)
> +		return -ENOMEM;
> +
> +	dma_resv_init(&resv);
> +	r = dma_resv_lock(&resv, NULL);
> +	if (r) {
> +		pr_err("Resv locking failed\n");
> +		goto err_free;
> +	}
> +
> +	if (shared) {
> +		r = dma_resv_reserve_shared(&resv, 1);
> +		if (r) {
> +			pr_err("Resv shared slot allocation failed\n");
> +			goto err_unlock;
> +		}
> +
> +		dma_resv_add_shared_fence(&resv, f);
> +	} else {
> +		dma_resv_add_excl_fence(&resv, f);
> +	}
> +
> +	if (dma_resv_test_signaled(&resv, shared)) {
> +		pr_err("Resv unexpectedly signaled\n");
> +		r = -EINVAL;
> +		goto err_unlock;
> +	}
> +	dma_fence_signal(f);
> +	if (!dma_resv_test_signaled(&resv, shared)) {
> +		pr_err("Resv not reporting signaled\n");
> +		r = -EINVAL;
> +		goto err_unlock;
> +	}
> +err_unlock:
> +	dma_resv_unlock(&resv);
> +err_free:
> +	dma_resv_fini(&resv);
> +	dma_fence_put(f);
> +	return r;
> +}
> +
> +static int test_excl_signaling(void *arg)
> +{
> +	return test_signaling(arg, false);
> +}
> +
> +static int test_shared_signaling(void *arg)
> +{
> +	return test_signaling(arg, true);
> +}
> +
> +static int test_for_each(void *arg, bool shared)
> +{
> +	struct dma_resv_iter cursor;
> +	struct dma_fence *f, *fence;
> +	struct dma_resv resv;
> +	int r;
> +
> +	f = alloc_fence();
> +	if (!f)
> +		return -ENOMEM;
> +
> +	dma_resv_init(&resv);
> +	r = dma_resv_lock(&resv, NULL);
> +	if (r) {
> +		pr_err("Resv locking failed\n");
> +		goto err_free;
> +	}
> +
> +	if (shared) {
> +		r = dma_resv_reserve_shared(&resv, 1);
> +		if (r) {
> +			pr_err("Resv shared slot allocation failed\n");
> +			goto err_unlock;
> +		}
> +
> +		dma_resv_add_shared_fence(&resv, f);
> +	} else {
> +		dma_resv_add_excl_fence(&resv, f);
> +	}
> +
> +	r = -ENOENT;
> +	dma_resv_for_each_fence(&cursor, &resv, shared, fence) {
> +		if (!r) {
> +			pr_err("More than one fence found\n");
> +			r = -EINVAL;
> +			goto err_unlock;
> +		}
> +		if (f != fence) {
> +			pr_err("Unexpected fence\n");
> +			r = -EINVAL;
> +			goto err_unlock;
> +		}
> +		if (dma_resv_iter_is_exclusive(&cursor) != !shared) {
> +			pr_err("Unexpected fence usage\n");
> +			r = -EINVAL;
> +			goto err_unlock;
> +		}
> +		r = 0;
> +	}
> +	if (r) {
> +		pr_err("No fence found\n");
> +		goto err_unlock;
> +	}
> +	dma_fence_signal(f);
> +err_unlock:
> +	dma_resv_unlock(&resv);
> +err_free:
> +	dma_resv_fini(&resv);
> +	dma_fence_put(f);
> +	return r;
> +}
> +
> +static int test_excl_for_each(void *arg)
> +{
> +	return test_for_each(arg, false);
> +}
> +
> +static int test_shared_for_each(void *arg)
> +{
> +	return test_for_each(arg, false);
> +}
> +
> +static int test_for_each_unlocked(void *arg, bool shared)
> +{
> +	struct dma_resv_iter cursor;
> +	struct dma_fence *f, *fence;
> +	struct dma_resv resv;
> +	int r;
> +
> +	f = alloc_fence();
> +	if (!f)
> +		return -ENOMEM;
> +
> +	dma_resv_init(&resv);
> +	r = dma_resv_lock(&resv, NULL);
> +	if (r) {
> +		pr_err("Resv locking failed\n");
> +		goto err_free;
> +	}
> +
> +	if (shared) {
> +		r = dma_resv_reserve_shared(&resv, 1);
> +		if (r) {
> +			pr_err("Resv shared slot allocation failed\n");
> +			dma_resv_unlock(&resv);
> +			goto err_free;
> +		}
> +
> +		dma_resv_add_shared_fence(&resv, f);
> +	} else {
> +		dma_resv_add_excl_fence(&resv, f);
> +	}
> +	dma_resv_unlock(&resv);
> +
> +	r = -ENOENT;
> +	dma_resv_iter_begin(&cursor, &resv, shared);
> +	dma_resv_for_each_fence_unlocked(&cursor, fence) {
> +		if (!r) {
> +			dma_resv_iter_end(&cursor);
> +			pr_err("More than one fence found\n");
> +			r = -EINVAL;
> +			goto err_free;
> +		}
> +		if (f != fence) {
> +			dma_resv_iter_end(&cursor);
> +			pr_err("Unexpected fence\n");
> +			r = -EINVAL;
> +			goto err_free;
> +		}
> +		if (dma_resv_iter_is_exclusive(&cursor) != !shared) {
> +			dma_resv_iter_end(&cursor);
> +			pr_err("Unexpected fence usage\n");
> +			r = -EINVAL;
> +			goto err_free;
> +		}
> +		r = 0;
> +	}
> +	dma_resv_iter_end(&cursor);
> +	if (r) {
> +		pr_err("No fence found\n");
> +		goto err_free;
> +	}
> +	dma_fence_signal(f);
> +err_free:
> +	dma_resv_fini(&resv);
> +	dma_fence_put(f);
> +	return r;
> +}
> +
> +static int test_excl_for_each_unlocked(void *arg)
> +{
> +	return test_for_each_unlocked(arg, false);
> +}
> +
> +static int test_shared_for_each_unlocked(void *arg)
> +{
> +	return test_for_each_unlocked(arg, true);
> +}
> +
> +int dma_resv(void)
> +{
> +	static const struct subtest tests[] = {
> +		SUBTEST(sanitycheck),
> +		SUBTEST(test_excl_signaling),
> +		SUBTEST(test_shared_signaling),
> +		SUBTEST(test_excl_for_each),
> +		SUBTEST(test_shared_for_each),
> +		SUBTEST(test_excl_for_each_unlocked),
> +		SUBTEST(test_shared_for_each_unlocked),
> +	};
> +
> +	spin_lock_init(&fence_lock);
> +	return subtests(tests, NULL);
> +}
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
