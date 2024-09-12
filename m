Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B414977393
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2024 23:28:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2C1210E1F8;
	Thu, 12 Sep 2024 21:28:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="uXdMVsHM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com
 [209.85.167.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3929810E1F8
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2024 21:28:14 +0000 (UTC)
Received: by mail-oi1-f177.google.com with SMTP id
 5614622812f47-3e03974b6a5so698810b6e.3
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2024 14:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1726176493; x=1726781293;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=EVBoJCNLRR8X5TrQ/I9maABRhanYWycmzMG9wsr9TFk=;
 b=uXdMVsHMIotEBqfTeBxJaWZV48IvpUfWUcu1hDjBCANZxFnFSTF7XvDtGUtddsnITA
 jXn8HesaIPh2gCuBTTK9XBBy29DKcm+DUqCUA8OYREWJ1o42veLAsWpUOMwS0UsrZvPW
 SZubnjIHjNOkS1NNkvO9OhbuFlzxaNvh596D7uDZOury+IZtYMAeTSBUOVOgzBGkD5U4
 cLeEa6le8nJ0UOYZhx0ic8RZcIQcvFkWuQTil4oa6rvSDBMirlMTU54B7dlC+3GCxXhO
 DAld/yTpVBt7NqUY8/0aBr4arddNrFYk/YphFyER3pKnGnIUyskmS4lar+OVZlE5dwJq
 LQlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726176493; x=1726781293;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EVBoJCNLRR8X5TrQ/I9maABRhanYWycmzMG9wsr9TFk=;
 b=HAakzMwoTntBU+0hk+hcwToewUKaJN0zmwJIzHxWbexl9h61tVMLA6lEaHkX/W85IM
 v85Vdg3ONQUab0R1Y+w9cTbN6mNp8JXpvsirFH+A1z90nqev0lZ+4jA5y1jCVamLOgZb
 VTaD7rEhfPckQFV4foPcV28oo+GRzz85RfF+GKQe4iSYl2OAJ5lis4oiHtAZHKtm5JDz
 g9GOl561ulJ9aZBLee5hQJa8J7SRZDoexO5r6vj0SL8LppaERntNjT4qV+af7nUgpV/M
 Lono03Gr1ENDTomUMAJ0xwj2eR4/RR8HTkkyNfWuBnzfnm3VBGnan2eJMNPdBWsgtYAQ
 EsVw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW1HyDh9m4nIzslBrJXwQsfLl9A4xLOQt3Ci8lhMeKOBECIVFXacL8gDEmrQZPeBNsNb/FBu/jmIfs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx2bBMyY3LDGEClxu4YJwSSvLZZ3LAIlHFC350YTPf+ewkLZFAZ
 9oGLBLPGYOs3r6hB0BVNRMDkBMMXD7SBXc28bVqZ/0IkYyLf3K/jo5e9CNGHsWle1AFM2D0+CHC
 VhA==
X-Google-Smtp-Source: AGHT+IE+PplQfr1wmi1rPq6cfJUOVee5axfQ/fpUSWcQDWuQhtkqeGRwdyj65KxYO5B4v8hXLcmStg==
X-Received: by 2002:a05:6808:10c1:b0:3e0:6809:ab18 with SMTP id
 5614622812f47-3e071a8f33emr2960910b6e.13.1726176493194; 
 Thu, 12 Sep 2024 14:28:13 -0700 (PDT)
Received: from google.com (30.64.135.34.bc.googleusercontent.com.
 [34.135.64.30]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-3e039c05857sm2544147b6e.45.2024.09.12.14.28.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Sep 2024 14:28:12 -0700 (PDT)
Date: Thu, 12 Sep 2024 14:28:10 -0700
From: Justin Stitt <justinstitt@google.com>
To: Yafang Shao <laoar.shao@gmail.com>
Cc: akpm@linux-foundation.org, torvalds@linux-foundation.org, 
 alx@kernel.org, ebiederm@xmission.com, alexei.starovoitov@gmail.com, 
 rostedt@goodmis.org, catalin.marinas@arm.com,
 penguin-kernel@i-love.sakura.ne.jp, 
 linux-mm@kvack.org, linux-fsdevel@vger.kernel.org, 
 linux-trace-kernel@vger.kernel.org, audit@vger.kernel.org,
 linux-security-module@vger.kernel.org, 
 selinux@vger.kernel.org, bpf@vger.kernel.org, netdev@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>
Subject: Re: [PATCH v8 8/8] drm: Replace strcpy() with strscpy()
Message-ID: <qqpiar6nlyuill6eng7safauo2xzzpx46cv6wku4xe42qsw47m@rirhsxrdzm2z>
References: <20240828030321.20688-1-laoar.shao@gmail.com>
 <20240828030321.20688-9-laoar.shao@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240828030321.20688-9-laoar.shao@gmail.com>
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

Hi,

On Wed, Aug 28, 2024 at 11:03:21AM GMT, Yafang Shao wrote:
> To prevent erros from occurring when the src string is longer than the
> dst string in strcpy(), we should use strscpy() instead. This
> approach also facilitates future extensions to the task comm.
> 
> Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: David Airlie <airlied@gmail.com>
> ---
>  drivers/gpu/drm/drm_framebuffer.c     | 2 +-
>  drivers/gpu/drm/i915/i915_gpu_error.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_framebuffer.c b/drivers/gpu/drm/drm_framebuffer.c
> index 888aadb6a4ac..2d6993539474 100644
> --- a/drivers/gpu/drm/drm_framebuffer.c
> +++ b/drivers/gpu/drm/drm_framebuffer.c
> @@ -868,7 +868,7 @@ int drm_framebuffer_init(struct drm_device *dev, struct drm_framebuffer *fb,
>  	INIT_LIST_HEAD(&fb->filp_head);
>  
>  	fb->funcs = funcs;
> -	strcpy(fb->comm, current->comm);
> +	strscpy(fb->comm, current->comm);
>  
>  	ret = __drm_mode_object_add(dev, &fb->base, DRM_MODE_OBJECT_FB,
>  				    false, drm_framebuffer_free);
> diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i915/i915_gpu_error.c

There are other strcpy() in this file but it seems all control paths to
the copies themselves stem from string literals, so it is probably fine
not to also change those ones. But, if a v9 is required and you're
feeling up to it, we should probably replace them too, as per [1].


> index 96c6cafd5b9e..afa9dae39378 100644
> --- a/drivers/gpu/drm/i915/i915_gpu_error.c
> +++ b/drivers/gpu/drm/i915/i915_gpu_error.c
> @@ -1412,7 +1412,7 @@ static bool record_context(struct i915_gem_context_coredump *e,
>  	rcu_read_lock();
>  	task = pid_task(ctx->pid, PIDTYPE_PID);
>  	if (task) {
> -		strcpy(e->comm, task->comm);
> +		strscpy(e->comm, task->comm);
>  		e->pid = task->pid;
>  	}
>  	rcu_read_unlock();
> -- 
> 2.43.5
> 
>


Reviewed-by: Justin Stitt <justinstitt@google.com>

[1]: https://www.kernel.org/doc/html/latest/process/deprecated.html#strcpy

Thanks
Justin
