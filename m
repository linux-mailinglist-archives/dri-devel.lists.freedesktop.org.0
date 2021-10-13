Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDBCC42C055
	for <lists+dri-devel@lfdr.de>; Wed, 13 Oct 2021 14:43:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5BC06EA3F;
	Wed, 13 Oct 2021 12:43:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 543106EA49
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Oct 2021 12:43:23 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id r7so7924465wrc.10
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Oct 2021 05:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=1Y8FWhBN54CnmVuU6Vo2D845lCXt3GcDQE2U6wQj3lQ=;
 b=G0fYPvOLCkpZbL1tNmQZKXEA7QnV4cTjvqvtPAdUq0Wbck52L8pG+Ki6QKu3DZKJ+Z
 v5h5HLZP7ugL+heWEb+r54O08iSBNVQNATzE2Zj8e4QNvxP+r0KQ4p/eiL7uauhR97rC
 yxalSnSnGaq52d9k0KptwnpWMfh3Hdmzv+PLw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=1Y8FWhBN54CnmVuU6Vo2D845lCXt3GcDQE2U6wQj3lQ=;
 b=sD3u22GV0n4UXFqvEvCWgjX3MA8d8xIG2896A4ByK/Ze8Sq+YXQY2FJj3vXnV2XlXq
 QBmdFbzGYbRrT5OewkVMV71tIHHTE7C8yCWe/fdHu/ql+ycyVbTPvM6n+d9AsBzSzuHh
 eKxFGMIJ164wyxmkbJP30/PZV+mBkyvIFgsHvQvjfw3J0AudX/p7UeYEkLQZKjkCzgcp
 5cYE546wTl6VCObxPau/VjjDyY5rPt4ib/DwJ/5gjbLk1gPQlp4k4lhlKr3bWlamRtBV
 nBDxxfy+xi/oULFDb4etZ1oeLyzOVwi7/szkWP2T+wn3cRbxQZD+qCzFyn9q/KUqdFOO
 s0JA==
X-Gm-Message-State: AOAM530wcU/4xla0PJTJoImPPPrRJffRdfmCxEkPgbACBLGJ6DmSfcgX
 HZiRwm5xr6HRIwlYH2NcmzdZSW4v60t8uQ==
X-Google-Smtp-Source: ABdhPJwq9/WCB0g4/jQCq3hnusRzwSFUU4Ea4FsRqjDuqcOlELKhZUbmPfY+C7A8WXsDhFbAGWWapA==
X-Received: by 2002:a1c:f705:: with SMTP id v5mr2338568wmh.121.1634129001743; 
 Wed, 13 Oct 2021 05:43:21 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id j1sm1397724wrd.28.2021.10.13.05.43.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 05:43:21 -0700 (PDT)
Date: Wed, 13 Oct 2021 14:43:19 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 maarten.lankhorst@linux.intel.com, matthew.auld@intel.com
Subject: Re: [Intel-gfx] [PATCH 4/6] drm/i915: Add a struct dma_fence_work
 timeline
Message-ID: <YWbUZ2A7iLEAaRW+@phenom.ffwll.local>
References: <20211008133530.664509-1-thomas.hellstrom@linux.intel.com>
 <20211008133530.664509-5-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211008133530.664509-5-thomas.hellstrom@linux.intel.com>
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

On Fri, Oct 08, 2021 at 03:35:28PM +0200, Thomas Hellström wrote:
> The TTM managers and, possibly, the gtt address space managers will
> need to be able to order fences for async operation.
> Using dma_fence_is_later() for this will require that the fences we hand
> them are from a single fence context and ordered.
> 
> Introduce a struct dma_fence_work_timeline, and a function to attach
> struct dma_fence_work to such a timeline in a way that all previous
> fences attached to the timeline will be signaled when the latest
> attached struct dma_fence_work signals.
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

I'm not understanding why we need this:

- if we just want to order dma_fence work, then an ordered workqueue is
  what we want. Which is why hand-rolling is better than reusing
  dma_fence_work for absolutely everything.

- if we just need to make sure the public fences signal in order, then
  it's a dma_fence_chain.

Definitely no more "it looks like it's shared code but isn't" stuff in
i915.
-Daniel

> ---
>  drivers/gpu/drm/i915/i915_sw_fence_work.c | 89 ++++++++++++++++++++++-
>  drivers/gpu/drm/i915/i915_sw_fence_work.h | 58 +++++++++++++++
>  2 files changed, 145 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_sw_fence_work.c b/drivers/gpu/drm/i915/i915_sw_fence_work.c
> index 5b55cddafc9b..87cdb3158042 100644
> --- a/drivers/gpu/drm/i915/i915_sw_fence_work.c
> +++ b/drivers/gpu/drm/i915/i915_sw_fence_work.c
> @@ -5,6 +5,66 @@
>   */
>  
>  #include "i915_sw_fence_work.h"
> +#include "i915_utils.h"
> +
> +/**
> + * dma_fence_work_timeline_attach - Attach a struct dma_fence_work to a
> + * timeline.
> + * @tl: The timeline to attach to.
> + * @f: The struct dma_fence_work.
> + * @tl_cb: The i915_sw_dma_fence_cb needed to attach to the
> + * timeline. This is typically embedded into the structure that also
> + * embeds the struct dma_fence_work.
> + *
> + * This function takes a timeline reference and associates it with the
> + * struct dma_fence_work. That reference is given up when the fence
> + * signals. Furthermore it assigns a fence context and a seqno to the
> + * dma-fence, and then chains upon the previous fence of the timeline
> + * if any, to make sure that the fence signals after that fence. The
> + * @tl_cb callback structure is needed for that chaining. Finally
> + * the registered last fence of the timeline is replaced by this fence, and
> + * the timeline takes a reference on the fence, which is released when
> + * the fence signals.
> + */
> +void dma_fence_work_timeline_attach(struct dma_fence_work_timeline *tl,
> +				    struct dma_fence_work *f,
> +				    struct i915_sw_dma_fence_cb *tl_cb)
> +{
> +	struct dma_fence *await;
> +
> +	if (tl->ops->get)
> +		tl->ops->get(tl);
> +
> +	spin_lock(&tl->lock);
> +	await = tl->last_fence;
> +	tl->last_fence = dma_fence_get(&f->dma);
> +	f->dma.seqno = tl->seqno++;
> +	f->dma.context = tl->context;
> +	f->tl = tl;
> +	spin_unlock(&tl->lock);
> +
> +	if (await) {
> +		__i915_sw_fence_await_dma_fence(&f->chain, await, tl_cb);
> +		dma_fence_put(await);
> +	}
> +}
> +
> +static void dma_fence_work_timeline_detach(struct dma_fence_work *f)
> +{
> +	struct dma_fence_work_timeline *tl = f->tl;
> +	bool put = false;
> +
> +	spin_lock(&tl->lock);
> +	if (tl->last_fence == &f->dma) {
> +		put = true;
> +		tl->last_fence = NULL;
> +	}
> +	spin_unlock(&tl->lock);
> +	if (tl->ops->put)
> +		tl->ops->put(tl);
> +	if (put)
> +		dma_fence_put(&f->dma);
> +}
>  
>  static void dma_fence_work_complete(struct dma_fence_work *f)
>  {
> @@ -13,6 +73,9 @@ static void dma_fence_work_complete(struct dma_fence_work *f)
>  	if (f->ops->release)
>  		f->ops->release(f);
>  
> +	if (f->tl)
> +		dma_fence_work_timeline_detach(f);
> +
>  	dma_fence_put(&f->dma);
>  }
>  
> @@ -53,14 +116,17 @@ fence_notify(struct i915_sw_fence *fence, enum i915_sw_fence_notify state)
>  
>  static const char *get_driver_name(struct dma_fence *fence)
>  {
> -	return "dma-fence";
> +	struct dma_fence_work *f = container_of(fence, typeof(*f), dma);
> +
> +	return (f->tl && f->tl->ops->name) ? f->tl->ops->name : "dma-fence";
>  }
>  
>  static const char *get_timeline_name(struct dma_fence *fence)
>  {
>  	struct dma_fence_work *f = container_of(fence, typeof(*f), dma);
>  
> -	return f->ops->name ?: "work";
> +	return (f->tl && f->tl->name) ? f->tl->name :
> +		f->ops->name ?: "work";
>  }
>  
>  static void fence_release(struct dma_fence *fence)
> @@ -84,6 +150,7 @@ void dma_fence_work_init(struct dma_fence_work *f,
>  {
>  	f->ops = ops;
>  	f->error = 0;
> +	f->tl = NULL;
>  	spin_lock_init(&f->lock);
>  	dma_fence_init(&f->dma, &fence_ops, &f->lock, 0, 0);
>  	i915_sw_fence_init(&f->chain, fence_notify);
> @@ -97,3 +164,21 @@ int dma_fence_work_chain(struct dma_fence_work *f, struct dma_fence *signal)
>  
>  	return __i915_sw_fence_await_dma_fence(&f->chain, signal, &f->cb);
>  }
> +
> +/**
> + * dma_fence_work_timeline_init - Initialize a dma_fence_work timeline
> + * @tl: The timeline to initialize,
> + * @name: The name of the timeline,
> + * @ops: The timeline operations.
> + */
> +void dma_fence_work_timeline_init(struct dma_fence_work_timeline *tl,
> +				  const char *name,
> +				  const struct dma_fence_work_timeline_ops *ops)
> +{
> +	tl->name = name;
> +	spin_lock_init(&tl->lock);
> +	tl->context = dma_fence_context_alloc(1);
> +	tl->seqno = 0;
> +	tl->last_fence = NULL;
> +	tl->ops = ops;
> +}
> diff --git a/drivers/gpu/drm/i915/i915_sw_fence_work.h b/drivers/gpu/drm/i915/i915_sw_fence_work.h
> index caa59fb5252b..6f41ee360133 100644
> --- a/drivers/gpu/drm/i915/i915_sw_fence_work.h
> +++ b/drivers/gpu/drm/i915/i915_sw_fence_work.h
> @@ -14,6 +14,53 @@
>  #include "i915_sw_fence.h"
>  
>  struct dma_fence_work;
> +struct dma_fence_work_timeline;
> +
> +/**
> + * struct dma_fence_work_timeline_ops - Timeline operations struct
> + * @name: Timeline ops name. This field is used if the timeline itself has
> + * a NULL name. Can be set to NULL in which case a default name is used.
> + *
> + * The struct dma_fence_work_timeline is intended to be embeddable.
> + * We use the ops to get and put the parent structure.
> + */
> +struct dma_fence_work_timeline_ops {
> +	/**
> +	 * Timeline ops name. Used if the timeline itself has no name.
> +	 */
> +	const char *name;
> +
> +	/**
> +	 * put() - Put the structure embedding the timeline
> +	 * @tl: The timeline
> +	 */
> +	void (*put)(struct dma_fence_work_timeline *tl);
> +
> +	/**
> +	 * get() - Get the structure embedding the timeline
> +	 * @tl: The timeline
> +	 */
> +	void (*get)(struct dma_fence_work_timeline *tl);
> +};
> +
> +/**
> + * struct dma_fence_work_timeline - Simple timeline struct for dma_fence_work
> + * @name: The name of the timeline. May be set to NULL. Immutable
> + * @lock: Protects mutable members of the structure.
> + * @context: The timeline fence context. Immutable.
> + * @seqno: The previous seqno used. Protected by @lock.
> + * @last_fence : The previous fence of the timeline. Protected by @lock.
> + * @ops: The timeline operations struct. Immutable.
> + */
> +struct dma_fence_work_timeline {
> +	const char *name;
> +	/** Protects mutable members of the structure */
> +	spinlock_t lock;
> +	u64 context;
> +	u64 seqno;
> +	struct dma_fence *last_fence;
> +	const struct dma_fence_work_timeline_ops *ops;
> +};
>  
>  struct dma_fence_work_ops {
>  	const char *name;
> @@ -30,6 +77,9 @@ struct dma_fence_work {
>  	struct i915_sw_dma_fence_cb cb;
>  
>  	struct work_struct work;
> +
> +	struct dma_fence_work_timeline *tl;
> +
>  	const struct dma_fence_work_ops *ops;
>  };
>  
> @@ -65,4 +115,12 @@ static inline void dma_fence_work_commit_imm(struct dma_fence_work *f)
>  	dma_fence_work_commit(f);
>  }
>  
> +void dma_fence_work_timeline_attach(struct dma_fence_work_timeline *tl,
> +				    struct dma_fence_work *f,
> +				    struct i915_sw_dma_fence_cb *tl_cb);
> +
> +void dma_fence_work_timeline_init(struct dma_fence_work_timeline *tl,
> +				  const char *name,
> +				  const struct dma_fence_work_timeline_ops *ops);
> +
>  #endif /* I915_SW_FENCE_WORK_H */
> -- 
> 2.31.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
