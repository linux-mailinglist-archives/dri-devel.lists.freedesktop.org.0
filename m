Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 006C13BC862
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jul 2021 11:16:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13EFD89D6C;
	Tue,  6 Jul 2021 09:15:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5A8A89D79
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jul 2021 09:15:56 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id a8so13519119wrp.5
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Jul 2021 02:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=P7sCJq4DV3ugOnwMZYw92lBF+HR7Q04tRqU4WzqTPIA=;
 b=ZtJpInGE3VXePl1XeRiH6VtqseoQx8VuAjDX1gtL/1QTw0KBHMCfLe1Ws+iQg2YWp5
 6XkQdeoBM22++/5vKlF37qXH+/IJ6RC/u81KSGXbJWZtVk8P7VouUrGZZmwIFHRDkn01
 tHl+kgxoWb1FtggOVD+WYqHHO9Eint66UnJ1E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=P7sCJq4DV3ugOnwMZYw92lBF+HR7Q04tRqU4WzqTPIA=;
 b=Lgs67n2H6MoBjJYiyZ0/FNIIU9gSMKSm3HkckZVhTNeHUegRthokJwtTBhAssrzLcV
 MDXnoD283tVJqxUrg0GuMnecEU8rqfviZ5PnVaezPqBQe765vW/MhOWyc1Yk61jI/SXw
 Ek2Lx5+PdY2sOCtJ3Dg9q3N8wuQLK50gmlj0fjJCY6oV7/ynofQeXnRjae6CS44VRxCH
 PQD4DjcEvRNOkVNkPT0WnxBs/Sq6LkHMHa8D7oEbr9C10vz27s5xoXhxbJAwAZZBUA7K
 XbdjvSlnzEUDyCnN8GEJc+qHniV4dI/EYFzFS3/UhlKKGmhDMufhOu7l4hM3LbpxyHk3
 wsXA==
X-Gm-Message-State: AOAM533dWlLOKoBXBUFJTSas8UjSJCZtYg+tTV4AWMZrU+etcf6MRBml
 fPzA0QGJIw/wH9eIyvKgqvl6MQ==
X-Google-Smtp-Source: ABdhPJyvm9oRw4NYGiZhdPDfmpi9RvL2dWKLRPdaSmSRkgwF8i0H2V/sgupJOwbHJIfR35ZTdsvNPw==
X-Received: by 2002:a5d:554e:: with SMTP id g14mr20544903wrw.48.1625562955429; 
 Tue, 06 Jul 2021 02:15:55 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id n12sm17882194wmq.5.2021.07.06.02.15.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 02:15:55 -0700 (PDT)
Date: Tue, 6 Jul 2021 11:15:53 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH 1/2] dma-fence: export dma_fence_might_wait
Message-ID: <YOQfSWv0X6dFopPa@phenom.ffwll.local>
References: <20210706090559.1589544-1-matthew.auld@intel.com>
 <YOQe2fdqTzqyyV9L@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YOQe2fdqTzqyyV9L@phenom.ffwll.local>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 06, 2021 at 11:14:01AM +0200, Daniel Vetter wrote:
> On Tue, Jul 06, 2021 at 10:05:58AM +0100, Matthew Auld wrote:
> > It might be useful for drivers to annotate a path where hitting the
> > actual wait path might be difficult or unlikely through normal testing.
> > 
> > Suggested-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> > Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > ---
> >  drivers/dma-buf/dma-fence.c | 19 ++++++++++++++++---
> >  include/linux/dma-fence.h   |  2 ++
> >  2 files changed, 18 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> > index ce0f5eff575d..f2cd036b5243 100644
> > --- a/drivers/dma-buf/dma-fence.c
> > +++ b/drivers/dma-buf/dma-fence.c
> > @@ -335,6 +335,21 @@ void __dma_fence_might_wait(void)
> >  }
> >  #endif
> >  
> > +/**
> > + * dma_fence_might_wait - entering a section which might wait on DMA fence
> > + * critical section.
> > + *
> > + * This is also potentially useful for drivers to call directly, when annotating
> > + * a path where hitting the actual wait path might be difficult or unlikely
> > + * through normal testing.
> 
> Maybe also add a
> 
> "See also dma_fence_begin_signalling() and dma_fence_end_signalling."
> 
> here and a similar note the these two functions pointing at
> dma_fence_might_wait()? I do like to link things together when there's a
> group of functions.
> 
> With that: Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Also ack for merging through drm-intel-gt-next, I don't think anything in
drm-misc plans to use this anytime soon. But please add the dma-buf Cc:
lines for the next round (dim add-missing-cc should cover you).
-Daniel

> 
> > + */
> > +void dma_fence_might_wait(void)
> > +{
> > +	might_sleep();
> > +	__dma_fence_might_wait();
> > +}
> > +EXPORT_SYMBOL(dma_fence_might_wait);
> > +
> >  
> >  /**
> >   * dma_fence_signal_timestamp_locked - signal completion of a fence
> > @@ -495,9 +510,7 @@ dma_fence_wait_timeout(struct dma_fence *fence, bool intr, signed long timeout)
> >  	if (WARN_ON(timeout < 0))
> >  		return -EINVAL;
> >  
> > -	might_sleep();
> > -
> > -	__dma_fence_might_wait();
> > +	dma_fence_might_wait();
> >  
> >  	trace_dma_fence_wait_start(fence);
> >  	if (fence->ops->wait)
> > diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
> > index 6ffb4b2c6371..37bf4beed93f 100644
> > --- a/include/linux/dma-fence.h
> > +++ b/include/linux/dma-fence.h
> > @@ -370,6 +370,8 @@ static inline void dma_fence_end_signalling(bool cookie) {}
> >  static inline void __dma_fence_might_wait(void) {}
> >  #endif
> >  
> > +void dma_fence_might_wait(void);
> > +
> >  int dma_fence_signal(struct dma_fence *fence);
> >  int dma_fence_signal_locked(struct dma_fence *fence);
> >  int dma_fence_signal_timestamp(struct dma_fence *fence, ktime_t timestamp);
> > -- 
> > 2.26.3
> > 
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
