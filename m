Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C2177CD62B
	for <lists+dri-devel@lfdr.de>; Wed, 18 Oct 2023 10:16:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B365C10E3BB;
	Wed, 18 Oct 2023 08:16:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D6D310E3BB
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Oct 2023 08:16:35 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-406aaccb41dso20312925e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Oct 2023 01:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1697616994; x=1698221794; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=A3GyM+aE3SYv7cz/slJ+bSq+Pg5b4YGz7Fxntovg2vc=;
 b=ibJEOPvaygDcFbjLImoemZBrx6wVnyypxVryMX+F774K9mjDfsS+M1jtKhKyPEHHAN
 eu16OdVPJBUIpV0hrjZPiQdxfl/b2lXjtikOZtwhE9JHp22hCoq8YXrVChg3T08CdycB
 k6XTF3Ztg6pteH2QQ5wv2SMl1/RA/NMN78iCE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697616994; x=1698221794;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=A3GyM+aE3SYv7cz/slJ+bSq+Pg5b4YGz7Fxntovg2vc=;
 b=syFVL8aIhEkd2Rj+CvH8hcAkdKLicuPm/xDDv85XF6Na+EHUJXBH6/HTR+ogPkcsMu
 m1SjSmZS3jx+PFfLLXX49W+2hYdlRhBSm7M+igkiF7tn9FUIMMgIeqLkM6l3mItFD0uh
 M3xab8F5fpyQp6pkVNP0sdgqbTuJ8m8uDDdcFMmtEof5OX2lEpeIE8fVhbrx+t7+Iz8R
 mXkjHOTCUdv9XXCuMLx07NdIszYRpu66bL9sjFEpxw1Hpf50L4BZYOItZTlKTftjXvzu
 wvdFim+ClIoeTez3y2BPV91QH4mrEa+jeQASFCBFHzqy8RTYjyqLPB0lVlPElWLhEQgt
 YBLA==
X-Gm-Message-State: AOJu0YzYKzFCj0Awa6N1AQNmRgcKXBzOTa+7gujTLdxlMsi7u5ElJMjg
 gejoiqtlU6aC6EGRtlVYM1myEQ==
X-Google-Smtp-Source: AGHT+IH7ti0a2iWrHG5hQc4oTY5DuqMfFMnrjFJxXyJE8JF+2xSGG1Y/o+81CsG5FnA8AvY3dAAiBA==
X-Received: by 2002:a05:600c:4f88:b0:405:3cc1:e115 with SMTP id
 n8-20020a05600c4f8800b004053cc1e115mr3313684wmq.3.1697616993697; 
 Wed, 18 Oct 2023 01:16:33 -0700 (PDT)
Received: from dvetter-linux.ger.corp.intel.com
 (210.red-80-36-22.staticip.rima-tde.net. [80.36.22.210])
 by smtp.gmail.com with ESMTPSA id
 d13-20020a5d538d000000b003232d122dbfsm1523014wrv.66.2023.10.18.01.16.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Oct 2023 01:16:33 -0700 (PDT)
Date: Wed, 18 Oct 2023 10:16:30 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm: Remove struct drm_flip_task from DRM interfaces
Message-ID: <ZS+UXovD+Hxfg3u5@dvetter-linux.ger.corp.intel.com>
References: <20231017122114.17247-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231017122114.17247-1-tzimmermann@suse.de>
X-Operating-System: Linux dvetter-linux.ger.corp.intel.com
 6.3.8-200.fc38.x86_64 
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
Cc: bbrezillon@kernel.org, dri-devel@lists.freedesktop.org, mripard@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 17, 2023 at 02:20:53PM +0200, Thomas Zimmermann wrote:
> Contain struct drm_flip_task and its helper functions
> drm_flip_work_allocate_task() and drm_flip_work_queue_task() within
> drm_flip_work.c There are no callers outside of the flip-work code.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/drm_flip_work.c | 27 +++++++--------------------
>  include/drm/drm_flip_work.h     | 18 ++----------------
>  2 files changed, 9 insertions(+), 36 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_flip_work.c b/drivers/gpu/drm/drm_flip_work.c
> index 060b753881a27..8c6090a90d564 100644
> --- a/drivers/gpu/drm/drm_flip_work.c
> +++ b/drivers/gpu/drm/drm_flip_work.c
> @@ -27,14 +27,12 @@
>  #include <drm/drm_print.h>
>  #include <drm/drm_util.h>
>  
> -/**
> - * drm_flip_work_allocate_task - allocate a flip-work task
> - * @data: data associated to the task
> - * @flags: allocator flags
> - *
> - * Allocate a drm_flip_task object and attach private data to it.
> - */
> -struct drm_flip_task *drm_flip_work_allocate_task(void *data, gfp_t flags)
> +struct drm_flip_task {
> +	struct list_head node;
> +	void *data;
> +};
> +
> +static struct drm_flip_task *drm_flip_work_allocate_task(void *data, gfp_t flags)
>  {
>  	struct drm_flip_task *task;
>  
> @@ -44,18 +42,8 @@ struct drm_flip_task *drm_flip_work_allocate_task(void *data, gfp_t flags)
>  
>  	return task;
>  }
> -EXPORT_SYMBOL(drm_flip_work_allocate_task);
>  
> -/**
> - * drm_flip_work_queue_task - queue a specific task
> - * @work: the flip-work
> - * @task: the task to handle
> - *
> - * Queues task, that will later be run (passed back to drm_flip_func_t
> - * func) on a work queue after drm_flip_work_commit() is called.
> - */
> -void drm_flip_work_queue_task(struct drm_flip_work *work,
> -			      struct drm_flip_task *task)
> +static void drm_flip_work_queue_task(struct drm_flip_work *work, struct drm_flip_task *task)
>  {
>  	unsigned long flags;
>  
> @@ -63,7 +51,6 @@ void drm_flip_work_queue_task(struct drm_flip_work *work,
>  	list_add_tail(&task->node, &work->queued);
>  	spin_unlock_irqrestore(&work->lock, flags);
>  }
> -EXPORT_SYMBOL(drm_flip_work_queue_task);
>  
>  /**
>   * drm_flip_work_queue - queue work
> diff --git a/include/drm/drm_flip_work.h b/include/drm/drm_flip_work.h
> index 21c3d512d25c4..6be4ba6f35143 100644
> --- a/include/drm/drm_flip_work.h
> +++ b/include/drm/drm_flip_work.h
> @@ -33,9 +33,8 @@
>   *
>   * Util to queue up work to run from work-queue context after flip/vblank.
>   * Typically this can be used to defer unref of framebuffer's, cursor
> - * bo's, etc until after vblank.  The APIs are all thread-safe.
> - * Moreover, drm_flip_work_queue_task and drm_flip_work_queue can be called
> - * in atomic context.
> + * bo's, etc until after vblank.  The APIs are all thread-safe. Moreover,
> + * drm_flip_work_queue can be called in atomic context.

Since you edit this anyway, add () so it becomes a hyperlink? Also looking
at the code it's actually drm_flip_work_commit() that's atomic safe,
_queue is not super irq safe (because it allocates and that could fail).
With that fixed.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

>   */
>  
>  struct drm_flip_work;
> @@ -51,16 +50,6 @@ struct drm_flip_work;
>   */
>  typedef void (*drm_flip_func_t)(struct drm_flip_work *work, void *val);
>  
> -/**
> - * struct drm_flip_task - flip work task
> - * @node: list entry element
> - * @data: data to pass to &drm_flip_work.func
> - */
> -struct drm_flip_task {
> -	struct list_head node;
> -	void *data;
> -};
> -
>  /**
>   * struct drm_flip_work - flip work queue
>   * @name: debug name
> @@ -79,9 +68,6 @@ struct drm_flip_work {
>  	spinlock_t lock;
>  };
>  
> -struct drm_flip_task *drm_flip_work_allocate_task(void *data, gfp_t flags);
> -void drm_flip_work_queue_task(struct drm_flip_work *work,
> -			      struct drm_flip_task *task);
>  void drm_flip_work_queue(struct drm_flip_work *work, void *val);
>  void drm_flip_work_commit(struct drm_flip_work *work,
>  		struct workqueue_struct *wq);
> -- 
> 2.42.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
