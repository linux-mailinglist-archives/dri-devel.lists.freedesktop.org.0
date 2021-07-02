Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17E803BA44D
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jul 2021 21:16:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C5896E1DE;
	Fri,  2 Jul 2021 19:16:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 753BD6E1E0
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jul 2021 19:16:30 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id a8so1988804wrp.5
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Jul 2021 12:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=CJZ66ZHRahf3MuzOHvcbR8txgxK1tXasYSH3KpOnrjo=;
 b=krMTpEMYXPoslVYQR7vaiA1VkVzU+BBWMNBxhxOyHtRvh8VvTicmBCG5qS78wwshU4
 2bsU9axx3nLiFGJBkJWZCCuU1OeIgJN0v7qr5XzGxw9Dm9zjZg8pXeD/opXPVkF9UrIZ
 bMXLFutb5HfS08RLgSu+9EPZ7DiNbUvvrDcMQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=CJZ66ZHRahf3MuzOHvcbR8txgxK1tXasYSH3KpOnrjo=;
 b=gCWR6qbq3/XN0a+YjXG0134/auY+CdooYppnaaP9Gc+Zc+ULXQg7tibixclU6H8jUB
 dvsrCMHU/A2qcMTWtRiGiw3hjiBZHvnrzQKicTRmq5jF6IICN2js1QAlFBh7YvmhbQrZ
 WnapQOz2VkS4iKomJDfV1O5Gv6cAmyDE6Sp6/d3mlLJBtZ744zTv/STM0w+XoO5uSpcQ
 Rh43HHRhF2NJyH3wcppoVAVAgWMFRfbIb4f3PBEltoJo+qcQSF/83BOTDxPqQ7KSYw4K
 I68zrATvS0OE4ffF7hw9OV4p2whCutxZtah02LADr3FY7Ziev/HAKxNM+K1k7ZrXhzUH
 XF9Q==
X-Gm-Message-State: AOAM53218WpJlUsTu+ieMctxMsshCNSAj028mnlgd/RyMrnFRiLoKjU8
 mUnK5dv7biVd0FrHC0mID7mOSw==
X-Google-Smtp-Source: ABdhPJxL1XTsXjAMpLSxu3+5p0E2TjLqfG3lp5CazxP5eoff1D7H8PkNI+HMgmM3W5xF54/6WVLbIw==
X-Received: by 2002:a5d:524e:: with SMTP id k14mr1302458wrc.390.1625253389020; 
 Fri, 02 Jul 2021 12:16:29 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id h9sm3802480wmb.35.2021.07.02.12.16.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jul 2021 12:16:27 -0700 (PDT)
Date: Fri, 2 Jul 2021 21:16:26 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH 2/3] drm/i915/uapi: reject caching ioctls for discrete
Message-ID: <YN9mCrx53/a5y/8n@phenom.ffwll.local>
References: <20210701143650.1094468-1-matthew.auld@intel.com>
 <20210701143650.1094468-2-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210701143650.1094468-2-matthew.auld@intel.com>
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
Cc: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Jason Ekstrand <jason@jlekstrand.net>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Kenneth Graunke <kenneth@whitecape.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 01, 2021 at 03:36:49PM +0100, Matthew Auld wrote:
> It's a noop on DG1, and in the future when need to support other devices
> which let us control the coherency, then it should be an immutable
> creation time property for the BO.
> 
> Suggested-by: Daniel Vetter <daniel@ffwll.ch>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Kenneth Graunke <kenneth@whitecape.org>
> Cc: Jason Ekstrand <jason@jlekstrand.net>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Ramalingam C <ramalingam.c@intel.com>

For this and the next can you pls add kerneldoc for the uapi structs and
then add a note there that on dgfx they're disallowed? Same for the next
one.

At least I'd like if we can document uapi here as we go, so that we have
something to point people to when they as "what has changed? what should I
do in my userspace driver?".

Also please make sure these two have acks from mesa devs before you land
them.

Thanks, Daniel

> ---
>  drivers/gpu/drm/i915/gem/i915_gem_domain.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_domain.c b/drivers/gpu/drm/i915/gem/i915_gem_domain.c
> index 7d1400b13429..43004bef55cb 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_domain.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_domain.c
> @@ -268,6 +268,9 @@ int i915_gem_get_caching_ioctl(struct drm_device *dev, void *data,
>  	struct drm_i915_gem_object *obj;
>  	int err = 0;
>  
> +	if (IS_DGFX(to_i915(dev)))
> +		return -ENODEV;
> +
>  	rcu_read_lock();
>  	obj = i915_gem_object_lookup_rcu(file, args->handle);
>  	if (!obj) {
> @@ -303,6 +306,9 @@ int i915_gem_set_caching_ioctl(struct drm_device *dev, void *data,
>  	enum i915_cache_level level;
>  	int ret = 0;
>  
> +	if (IS_DGFX(i915))
> +		return -ENODEV;
> +
>  	switch (args->caching) {
>  	case I915_CACHING_NONE:
>  		level = I915_CACHE_NONE;
> -- 
> 2.26.3
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
