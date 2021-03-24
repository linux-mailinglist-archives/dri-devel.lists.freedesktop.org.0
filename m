Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73D3034753C
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 11:01:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03D0E6E9A1;
	Wed, 24 Mar 2021 10:01:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40F966E9A0
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 10:01:47 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 j20-20020a05600c1914b029010f31e15a7fso817305wmq.1
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 03:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=Rx9Rrt/z2zFgoBGaEEFsYywvK+LMAW4MrtxKYsFOxi8=;
 b=jFre5dwClSH3ihB4O1rKSqw+4vWvAXTVpllJLmcWCS9AgfYt6KOglUjZBQIycdVaEt
 tBt1wuUwWXtozPuxBmfMZpgCLLrCgdwINZBRvlfwlPyocmCJ1DaaSzXk0p3miF6bLb7N
 aA0x6yhgA6Y7KfzxCpdm9tixP/U2cPfInnFfA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=Rx9Rrt/z2zFgoBGaEEFsYywvK+LMAW4MrtxKYsFOxi8=;
 b=nyNL/6CUJZZZyaspN5lbEwj2fqJg3aPKOzsLBOSqEgE8GjydAutuJuyDetAp1AwRyn
 tGk+Bbezn3vZFiuqPb6KnNq/f5sARXPcF2Ig+2L/9UPi+XJxc/npWc2UreZqtkTS/ECw
 4La5xrxWs7nANajsJeLSOtRSU8Hfjwv7/3ijUjPFZN2Xw6Ug2dwJV0AuQl4PjW+5hJ7B
 rvs2+I8tvTVAQ2Jo3MUNncQJGhpxYTdBw5KhEB4fnEJROIpAp3PFfqNzxdnTQrLdQRTR
 KLcyrEEhwz2GIXc1A9D5jVwjdnhfmBQWDjtQ4C6/w4pUOyjlKnw4Z6kh+mTmXeLr1mgA
 njMA==
X-Gm-Message-State: AOAM531y2bw9HiWYqxmAM+q4OKwwzn8yEopx4deqeG9wXG3wxNwXCw6Y
 tgWhgZ2qk7kFDukwRKL/Fns6QQ==
X-Google-Smtp-Source: ABdhPJzZO9UI2vZj6xofrTq7y71eZw5LhOLy8ME2YPH+gQPzgAUK1BFVHzywoWotW3V4Wde3lxsOXQ==
X-Received: by 2002:a7b:c0d1:: with SMTP id s17mr2074690wmh.153.1616580105822; 
 Wed, 24 Mar 2021 03:01:45 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id e13sm2443665wrg.72.2021.03.24.03.01.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Mar 2021 03:01:45 -0700 (PDT)
Date: Wed, 24 Mar 2021 11:01:43 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Liam Howlett <liam.howlett@oracle.com>
Subject: Re: [PATCH] i915_vma: Rename vma_lookup to i915_vma_lookup
Message-ID: <YFsOB5fWBJSxo03E@phenom.ffwll.local>
Mail-Followup-To: Liam Howlett <liam.howlett@oracle.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 David Airlie <airlied@linux.ie>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
References: <20210323134208.3077275-1-Liam.Howlett@Oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210323134208.3077275-1-Liam.Howlett@Oracle.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: David Airlie <airlied@linux.ie>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 23, 2021 at 01:42:21PM +0000, Liam Howlett wrote:
> Use i915 prefix to avoid name collision with future vma_lookup() in mm.
> 
> Signed-off-by: Liam R. Howlett <Liam.Howlett@Oracle.com>
> Reviewed-by: Matthew Wilcox (Oracle) <willy@infradead.org>

Applied to i915-gem-next branch for 5.13. We have a bit a branch shuffling
going on right now so unusal path, it should show up in linux-next through
drm-next hopefully this week still.
-Daniel

> ---
>  drivers/gpu/drm/i915/i915_vma.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
> index caa9b041616b..ee0028c697f6 100644
> --- a/drivers/gpu/drm/i915/i915_vma.c
> +++ b/drivers/gpu/drm/i915/i915_vma.c
> @@ -230,7 +230,7 @@ vma_create(struct drm_i915_gem_object *obj,
>  }
>  
>  static struct i915_vma *
> -vma_lookup(struct drm_i915_gem_object *obj,
> +i915_vma_lookup(struct drm_i915_gem_object *obj,
>  	   struct i915_address_space *vm,
>  	   const struct i915_ggtt_view *view)
>  {
> @@ -278,7 +278,7 @@ i915_vma_instance(struct drm_i915_gem_object *obj,
>  	GEM_BUG_ON(!atomic_read(&vm->open));
>  
>  	spin_lock(&obj->vma.lock);
> -	vma = vma_lookup(obj, vm, view);
> +	vma = i915_vma_lookup(obj, vm, view);
>  	spin_unlock(&obj->vma.lock);
>  
>  	/* vma_create() will resolve the race if another creates the vma */
> -- 
> 2.30.0

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
