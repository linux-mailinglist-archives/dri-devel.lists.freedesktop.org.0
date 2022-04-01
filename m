Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FA5F4EF6FE
	for <lists+dri-devel@lfdr.de>; Fri,  1 Apr 2022 17:58:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39EB210F4EE;
	Fri,  1 Apr 2022 15:58:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40E1F10F4EE
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Apr 2022 15:58:01 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id b19so4858123wrh.11
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Apr 2022 08:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=YUqzSu4G7NFSiRDS6FAcC1tRBY3HYqQQ5UXS+6cj2Zo=;
 b=OHaeOEmCT/1YG78RCCbmux5pqc7NZ89/zLkohSynygjLDzlXrY6XbWQUzfjxP0I08e
 qr8tzDBnUuVditvFFGXqK6Rj8K1TSWwqsMo6Urb6UA1aeWBMfxZZ52TTX67D5BZCMCfY
 0vPR6BUCpFG0PCg4LviZBAEuqaYzLgxTBWbeU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=YUqzSu4G7NFSiRDS6FAcC1tRBY3HYqQQ5UXS+6cj2Zo=;
 b=GImXsb8Kb66ud/Uk44KHl7vQIHkak0RMd3J2IG2rN6FUB1rWGg0WnQnW/vll5cQ+0t
 YEQp8IsslHLNMM2ynz2XrLK+DcCigvcBOru6a5YYvjZ9U9vxmlLrKtC6xW5cUguCwXqL
 mMBE4kiPmYBV88a5YDTTX7rafDz7AOg9DSBMT0/3aDvrJ8bIsKwei7SbnHI2Gx+UgPNv
 AIQyQP/r65F0hv5cokEMJ/P8CRJPTyF6TUinlqJdPyRGsa+hK9R55veKohsZlkmrrsfK
 8xntkbrKbNRXaNRgOkjYJRw2dla10Aad1vWYxOBuqz/F9p5XwSNntrCWEf7rEfSdja8r
 5vwg==
X-Gm-Message-State: AOAM532t9RTVx7kgiNknyfaULFpEcw1Uo7tB37DrbY+BLB3XkjBgoMEW
 HBEC9dUVCBmMepZkLhbEPanRSvk2kprVRAhq
X-Google-Smtp-Source: ABdhPJxA3cSn4145pjBRQs2KCxQDoT+sRNMGK1NTdD+TTxdzDb9ykM0Dfgs5M+G0Cs656u8wuJym8g==
X-Received: by 2002:a5d:6208:0:b0:203:dde4:c76e with SMTP id
 y8-20020a5d6208000000b00203dde4c76emr8170252wru.273.1648828679704; 
 Fri, 01 Apr 2022 08:57:59 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 k11-20020a5d6d4b000000b0020599079f68sm2373757wri.106.2022.04.01.08.57.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Apr 2022 08:57:59 -0700 (PDT)
Date: Fri, 1 Apr 2022 17:57:57 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH 03/23] dma-buf: add dma_resv_get_singleton v2
Message-ID: <YkchBXGnOvrD+jFw@phenom.ffwll.local>
References: <20220321135856.1331-1-christian.koenig@amd.com>
 <20220321135856.1331-3-christian.koenig@amd.com>
 <8e12de76-5206-81f8-0b8e-1c31865a7633@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8e12de76-5206-81f8-0b8e-1c31865a7633@amd.com>
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

On Fri, Apr 01, 2022 at 10:21:22AM +0200, Christian König wrote:
> Daniel any more comments on this one here?
> 
> It's the prerequisite to a bunch of other patches and I would like to get it
> out of my feet.

Apologies for the miss, I thought I've r-b stamped this one already.

> 
> Thanks,
> Christian.
> 
> Am 21.03.22 um 14:58 schrieb Christian König:
> > Add a function to simplify getting a single fence for all the fences in
> > the dma_resv object.
> > 
> > v2: fix ref leak in error handling
> > 
> > Signed-off-by: Christian König <christian.koenig@amd.com>
> > ---
> >   drivers/dma-buf/dma-resv.c | 52 ++++++++++++++++++++++++++++++++++++++
> >   include/linux/dma-resv.h   |  2 ++
> >   2 files changed, 54 insertions(+)
> > 
> > diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
> > index 5001e9b4420a..c09fd8da0c85 100644
> > --- a/drivers/dma-buf/dma-resv.c
> > +++ b/drivers/dma-buf/dma-resv.c
> > @@ -34,6 +34,7 @@
> >    */
> >   #include <linux/dma-resv.h>
> > +#include <linux/dma-fence-array.h>
> >   #include <linux/export.h>
> >   #include <linux/mm.h>
> >   #include <linux/sched/mm.h>
> > @@ -650,6 +651,57 @@ int dma_resv_get_fences(struct dma_resv *obj, bool write,
> >   }
> >   EXPORT_SYMBOL_GPL(dma_resv_get_fences);
> > +/**
> > + * dma_resv_get_singleton - Get a single fence for all the fences
> > + * @obj: the reservation object
> > + * @write: true if we should return all fences
> > + * @fence: the resulting fence
> > + *
> > + * Get a single fence representing all the fences inside the resv object.
> > + * Returns either 0 for success or -ENOMEM.
> > + *
> > + * Warning: This can't be used like this when adding the fence back to the resv
> > + * object since that can lead to stack corruption when finalizing the
> > + * dma_fence_array.

Please add the standard boilerplate here:

Returns 0 on success and negative error values on failure.

> > + */
> > +int dma_resv_get_singleton(struct dma_resv *obj, bool write,
> > +			   struct dma_fence **fence)
> > +{
> > +	struct dma_fence_array *array;
> > +	struct dma_fence **fences;
> > +	unsigned count;
> > +	int r;
> > +
> > +	r = dma_resv_get_fences(obj, write, &count, &fences);

Deep down in here we already have the dma_resv_assert_held, so I'm happy.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> > +        if (r)
> > +		return r;
> > +
> > +	if (count == 0) {
> > +		*fence = NULL;
> > +		return 0;
> > +	}
> > +
> > +	if (count == 1) {
> > +		*fence = fences[0];
> > +		kfree(fences);
> > +		return 0;
> > +	}
> > +
> > +	array = dma_fence_array_create(count, fences,
> > +				       dma_fence_context_alloc(1),
> > +				       1, false);
> > +	if (!array) {
> > +		while (count--)
> > +			dma_fence_put(fences[count]);
> > +		kfree(fences);
> > +		return -ENOMEM;
> > +	}
> > +
> > +	*fence = &array->base;
> > +	return 0;
> > +}
> > +EXPORT_SYMBOL_GPL(dma_resv_get_singleton);
> > +
> >   /**
> >    * dma_resv_wait_timeout - Wait on reservation's objects
> >    * shared and/or exclusive fences.
> > diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
> > index 202cc65d0621..08512c1e215d 100644
> > --- a/include/linux/dma-resv.h
> > +++ b/include/linux/dma-resv.h
> > @@ -449,6 +449,8 @@ void dma_resv_replace_fences(struct dma_resv *obj, uint64_t context,
> >   void dma_resv_add_excl_fence(struct dma_resv *obj, struct dma_fence *fence);
> >   int dma_resv_get_fences(struct dma_resv *obj, bool write,
> >   			unsigned int *num_fences, struct dma_fence ***fences);
> > +int dma_resv_get_singleton(struct dma_resv *obj, bool write,
> > +			   struct dma_fence **fence);
> >   int dma_resv_copy_fences(struct dma_resv *dst, struct dma_resv *src);
> >   long dma_resv_wait_timeout(struct dma_resv *obj, bool wait_all, bool intr,
> >   			   unsigned long timeout);
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
