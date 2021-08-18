Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D891B3F0112
	for <lists+dri-devel@lfdr.de>; Wed, 18 Aug 2021 11:57:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D130C6E50D;
	Wed, 18 Aug 2021 09:57:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8345D6E50B
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 09:57:11 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id dj8so2255701edb.2
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 02:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=Rn4A30qTQOxkstQYw62Y3prioOpHXXbJvzGKouAI1jo=;
 b=HxuZ7amf0x5rDg8Pv2sDkTar7KFdTSrkayed1hQb/rSNUcLT73vKapTE8H9oodlrl+
 XrKtbghyhAs5x9vzvwVUrXrR09KztnaG2Yh4SVOy5u7XPIz8jTtUtcddn80S6gYaezG8
 v4/iegN2atmH28uNfVXvvavIu21o+9JE6gq04=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=Rn4A30qTQOxkstQYw62Y3prioOpHXXbJvzGKouAI1jo=;
 b=tVAZaCCjSNM8VQSyw5ZzHhoJpz0CU6/e1DeGJaDrTa854XiEaffqhSElFcQjtsR+Mr
 0Qkl2B9hdEMP7MYdTXlNqYMCALODkNR/ScrBh/DHwmPY4yfAsBSWaZggOUUdMsScH50t
 0bZcvZjagHZNiA7yFCCKYrOB615jGjbLzFF1PLbbfKfhANzzB1pZju0IwNt4a2ff+b2h
 bqnyp2N31W/RLuTMbNkuwuevD7JtXY0YISiiqwLn0XaNZXEHypEIty62sVOWhn2CYvWG
 NEim80jDgr1VyQUFb8KXT8IUCYjXKIYiKVXWJCeQQIoGzclM1W/E9n7J12C6TM3dPUFw
 8GnA==
X-Gm-Message-State: AOAM533l1IdzCzm2zWE2vEmLofO13ERNZHmlpNtaHeA5E5nP36obxPCE
 1s2F6Wux6cdrLNYXeqV0u6UWWA==
X-Google-Smtp-Source: ABdhPJwYW1o49qUAQxejWY4Sn7eDQRTvw9cFiL03omJ6m7BCOJhQgKMgxhygSTQ/CZCejqpBO/2g4w==
X-Received: by 2002:a05:6402:29a:: with SMTP id
 l26mr9269082edv.347.1629280629996; 
 Wed, 18 Aug 2021 02:57:09 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id q21sm1789736eji.59.2021.08.18.02.57.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 02:57:09 -0700 (PDT)
Date: Wed, 18 Aug 2021 11:57:07 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Kees Cook <keescook@chromium.org>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org,
 Jason Ekstrand <jason@jlekstrand.net>, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
Subject: Re: [PATCH] drm/i915: Use designated initializers for init/exit table
Message-ID: <YRzZcwR0O9Fv8asJ@phenom.ffwll.local>
Mail-Followup-To: Kees Cook <keescook@chromium.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org,
 Jason Ekstrand <jason@jlekstrand.net>, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
References: <20210817233357.2379455-1-keescook@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210817233357.2379455-1-keescook@chromium.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 17, 2021 at 04:33:57PM -0700, Kees Cook wrote:
> The kernel builds with -Werror=designated-init, and __designated_init
> is used by CONFIG_GCC_PLUGIN_RANDSTRUCT for automatically selected (all
> function pointer) structures. Include the field names in the init/exit
> table. Avoids warnings like:
> 
> drivers/gpu/drm/i915/i915_module.c:59:4: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
> 
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: intel-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Fixes: a04ea6ae7c67 ("drm/i915: Use a table for i915_init/exit (v2)")
> Signed-off-by: Kees Cook <keescook@chromium.org>

Applied to drm-intel-gt-next, should show up in linux-next/next merge
window eventually (that branch isn't in linux-next for reasons).
-Daniel

> ---
>  drivers/gpu/drm/i915/i915_module.c | 37 +++++++++++++++++++-----------
>  1 file changed, 24 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_module.c b/drivers/gpu/drm/i915/i915_module.c
> index c578ea8f56a0..d8b4482c69d0 100644
> --- a/drivers/gpu/drm/i915/i915_module.c
> +++ b/drivers/gpu/drm/i915/i915_module.c
> @@ -47,19 +47,30 @@ static const struct {
>     int (*init)(void);
>     void (*exit)(void);
>  } init_funcs[] = {
> -	{ i915_check_nomodeset, NULL },
> -	{ i915_active_module_init, i915_active_module_exit },
> -	{ i915_buddy_module_init, i915_buddy_module_exit },
> -	{ i915_context_module_init, i915_context_module_exit },
> -	{ i915_gem_context_module_init, i915_gem_context_module_exit },
> -	{ i915_objects_module_init, i915_objects_module_exit },
> -	{ i915_request_module_init, i915_request_module_exit },
> -	{ i915_scheduler_module_init, i915_scheduler_module_exit },
> -	{ i915_vma_module_init, i915_vma_module_exit },
> -	{ i915_mock_selftests, NULL },
> -	{ i915_pmu_init, i915_pmu_exit },
> -	{ i915_register_pci_driver, i915_unregister_pci_driver },
> -	{ i915_perf_sysctl_register, i915_perf_sysctl_unregister },
> +	{ .init = i915_check_nomodeset },
> +	{ .init = i915_active_module_init,
> +	  .exit = i915_active_module_exit },
> +	{ .init = i915_buddy_module_init,
> +	  .exit = i915_buddy_module_exit },
> +	{ .init = i915_context_module_init,
> +	  .exit = i915_context_module_exit },
> +	{ .init = i915_gem_context_module_init,
> +	  .exit = i915_gem_context_module_exit },
> +	{ .init = i915_objects_module_init,
> +	  .exit = i915_objects_module_exit },
> +	{ .init = i915_request_module_init,
> +	  .exit = i915_request_module_exit },
> +	{ .init = i915_scheduler_module_init,
> +	  .exit = i915_scheduler_module_exit },
> +	{ .init = i915_vma_module_init,
> +	  .exit = i915_vma_module_exit },
> +	{ .init = i915_mock_selftests },
> +	{ .init = i915_pmu_init,
> +	  .exit = i915_pmu_exit },
> +	{ .init = i915_register_pci_driver,
> +	  .exit = i915_unregister_pci_driver },
> +	{ .init = i915_perf_sysctl_register,
> +	  .exit = i915_perf_sysctl_unregister },
>  };
>  static int init_progress;
>  
> -- 
> 2.30.2
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
