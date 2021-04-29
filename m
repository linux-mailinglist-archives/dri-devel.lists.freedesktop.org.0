Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE0B636EA9B
	for <lists+dri-devel@lfdr.de>; Thu, 29 Apr 2021 14:38:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74C7E6EE93;
	Thu, 29 Apr 2021 12:37:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C65B6EE93
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Apr 2021 12:37:57 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id z6so5493202wrm.4
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Apr 2021 05:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=TsdfzRj63EGH81gJ3Y8YhWdjxQcITcYLvCxhLp8oLa4=;
 b=Ms4QJsUzo3TeP1TZ9W4TkKmzMyV9nWniwZwOdlkxVmwDLejnh+ZfmYmi7TV0pnWqDu
 o/qd7iIj2YJBEBiYg9m2zWHMHBNku8kN53BFZlDVe1Q3yFc8pE4P5XayXz6aIkEJBNZN
 S/iIjQsEFVlungLxnZTWch0E1BYZpx6CJMOyA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=TsdfzRj63EGH81gJ3Y8YhWdjxQcITcYLvCxhLp8oLa4=;
 b=cqqI0Fv9as4yo3ynsbawPDwpBYFP4xabGx3vdANVvagB5rzsRMo2mgDFtcrbkYOlFX
 07eYaxb4hSt7mRzujd24iNtctgUCUKm+QByuCJ9tw9zGGMgQxGaNvTI6N8YXSDKrkHkZ
 DG3qvkHnnsGxWE0ZbQisK9EFcqgLRFHfYQlnS+BY6Rtu/tnrJFSPq+Xd6FLLIUjP187T
 pMXtYBEFAGZGBGWeAJNSGlBiWoZOprogmtuXjXdn3aZDJWWT3roHDE16yjLYxDYKqtW6
 /WeutxhmgRssBqWRkffm6YUgc4CCFrtRNgFN0DN1Typzs99K7lRXyxDFwMY2CSy+tgwb
 FEhg==
X-Gm-Message-State: AOAM5307IN1NAWM0cGN/8wJNKuirzXYtSkcKm3MUjPcWmgsu6u1Cvb5t
 ut5x9CN10+MWwHzP6dVGAE4MdA==
X-Google-Smtp-Source: ABdhPJwNrGFnGkHdx9hhkHY0p6gLBCffx3MP8tZxahZK1cwGhDjYRDgwYu4zcDf6+3GbbkLfCoVbNg==
X-Received: by 2002:a5d:6452:: with SMTP id d18mr33802588wrw.127.1619699876292; 
 Thu, 29 Apr 2021 05:37:56 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id t20sm9892217wmi.35.2021.04.29.05.37.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Apr 2021 05:37:55 -0700 (PDT)
Date: Thu, 29 Apr 2021 14:37:54 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Jason Ekstrand <jason@jlekstrand.net>
Subject: Re: [PATCH 15/21] drm/i915/gt: Drop i915_address_space::file
Message-ID: <YIqook/gsI/w9OXf@phenom.ffwll.local>
References: <20210423223131.879208-1-jason@jlekstrand.net>
 <20210423223131.879208-16-jason@jlekstrand.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210423223131.879208-16-jason@jlekstrand.net>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 23, 2021 at 05:31:25PM -0500, Jason Ekstrand wrote:
> There's a big comment saying how useful it is but no one is using this
> for anything.
> 
> Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>

I was trying to find anything before all your deletions, but alas nothing.
I did spent a bit of time on this, and discovered that the debugfs use was
nuked in

db80a1294c23 ("drm/i915/gem: Remove per-client stats from debugfs/i915_gem_objects")

After going through quite a few iterations, e.g.

5b5efdf79abf ("drm/i915: Make debugfs/per_file_stats scale better")
f6e8aa387171 ("drm/i915: Report the number of closed vma held by each context in debugfs")

The above removed the need for vm->file because stats debugfs file
filtered using stats->vm instead of stats->file.

History goes on until the original introduction of this (again for
debugfs) in

2bfa996e031b ("drm/i915: Store owning file on the i915_address_space")

> ---
>  drivers/gpu/drm/i915/gem/i915_gem_context.c |  9 ---------
>  drivers/gpu/drm/i915/gt/intel_gtt.h         | 10 ----------
>  drivers/gpu/drm/i915/selftests/mock_gtt.c   |  1 -
>  3 files changed, 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> index 7929d5a8be449..db9153e0f85a7 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> @@ -921,17 +921,10 @@ static int gem_context_register(struct i915_gem_context *ctx,
>  				u32 *id)
>  {
>  	struct drm_i915_private *i915 = ctx->i915;
> -	struct i915_address_space *vm;
>  	int ret;
>  
>  	ctx->file_priv = fpriv;
>  
> -	mutex_lock(&ctx->mutex);
> -	vm = i915_gem_context_vm(ctx);
> -	if (vm)
> -		WRITE_ONCE(vm->file, fpriv); /* XXX */
> -	mutex_unlock(&ctx->mutex);
> -
>  	ctx->pid = get_task_pid(current, PIDTYPE_PID);
>  	snprintf(ctx->name, sizeof(ctx->name), "%s[%d]",
>  		 current->comm, pid_nr(ctx->pid)); 
> @@ -1030,8 +1023,6 @@ int i915_gem_vm_create_ioctl(struct drm_device *dev, void *data,
>  	if (IS_ERR(ppgtt))
>  		return PTR_ERR(ppgtt);
>  
> -	ppgtt->vm.file = file_priv;
> -
>  	if (args->extensions) {
>  		err = i915_user_extensions(u64_to_user_ptr(args->extensions),
>  					   NULL, 0,
> diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.h b/drivers/gpu/drm/i915/gt/intel_gtt.h
> index e67e34e179131..4c46068e63c9d 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gtt.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gtt.h
> @@ -217,16 +217,6 @@ struct i915_address_space {

Pls also delete the drm_i915_file_private pre-dcl in this file.

With this added and the history adequately covered in the commit message:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>


>  	struct intel_gt *gt;
>  	struct drm_i915_private *i915;
>  	struct device *dma;
> -	/*
> -	 * Every address space belongs to a struct file - except for the global
> -	 * GTT that is owned by the driver (and so @file is set to NULL). In
> -	 * principle, no information should leak from one context to another
> -	 * (or between files/processes etc) unless explicitly shared by the
> -	 * owner. Tracking the owner is important in order to free up per-file
> -	 * objects along with the file, to aide resource tracking, and to
> -	 * assign blame.
> -	 */
> -	struct drm_i915_file_private *file;
>  	u64 total;		/* size addr space maps (ex. 2GB for ggtt) */
>  	u64 reserved;		/* size addr space reserved */
>  
> diff --git a/drivers/gpu/drm/i915/selftests/mock_gtt.c b/drivers/gpu/drm/i915/selftests/mock_gtt.c
> index 5c7ae40bba634..cc047ec594f93 100644
> --- a/drivers/gpu/drm/i915/selftests/mock_gtt.c
> +++ b/drivers/gpu/drm/i915/selftests/mock_gtt.c
> @@ -73,7 +73,6 @@ struct i915_ppgtt *mock_ppgtt(struct drm_i915_private *i915, const char *name)
>  	ppgtt->vm.gt = &i915->gt;
>  	ppgtt->vm.i915 = i915;
>  	ppgtt->vm.total = round_down(U64_MAX, PAGE_SIZE);
> -	ppgtt->vm.file = ERR_PTR(-ENODEV);
>  	ppgtt->vm.dma = i915->drm.dev;
>  
>  	i915_address_space_init(&ppgtt->vm, VM_CLASS_PPGTT);
> -- 
> 2.31.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
