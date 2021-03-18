Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A113B3406DB
	for <lists+dri-devel@lfdr.de>; Thu, 18 Mar 2021 14:28:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81D8A6E8F2;
	Thu, 18 Mar 2021 13:27:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 198186E8F2
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Mar 2021 13:27:56 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id 61so5525784wrm.12
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Mar 2021 06:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=xkMIGK74X6G/emJXPPRUEJAUaDQbwzNFJDZsIuSZhD0=;
 b=S79+ToxCSgKay9BxaJ7SvuCcyRU6ZYY5mgab1Tl4u6Jp/8Y3DIqI1NGmJVCPwMxo7+
 KB+BkIoYB3VGSR9Ea+H/QK1aAlv3DLZK/p+T+oSdhqVNmPQ61XU39iwgATc/XY0aSbCb
 YJmb3L1eTFjAfL7IzIWFNhWv+F82PK3eVpB+A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=xkMIGK74X6G/emJXPPRUEJAUaDQbwzNFJDZsIuSZhD0=;
 b=CSNXSk4ke1ge+80jAjmhWDE/VEzelGk3E3DhhupUKfY6hxCaTqT5MrH1eptIeeaXmA
 LuCUB8+YAgGYP+/Xe1j1dZuTHBGFQ1KcNrwZdgS6Rat8HbGnMNbyWAQb/OyFp/w05xsC
 5NCUoP7nXUSnifKw3n49ZJyG2y4UNI3t4zXGG6zeXdn8b/+p9IPZvsj7DEa82Vh53F3B
 QcDPUp2o8UOf1rSjbqaA+PQAJBrLcX24scrsT7uBHQUWJc5oHzF1giNWC3UTz16THjwY
 Ut1Zl/dV5WAl+bUD9HoRoBwrOJ+842tVubrdIiTBjaCV+zgIxujGCdCxEoQvn5yhskIr
 a7ug==
X-Gm-Message-State: AOAM532ww5aCnUR+EoIUydEISu6qaVnkAZTQdMDwFBeBVmxXqwxinIxb
 d/cyjo159zjxDliToQJb+EGXmg==
X-Google-Smtp-Source: ABdhPJxdFazp2dWVeG9nErBvvNn1y5BLqDSBUvTIRZBd6Wexx5qerHL26WtUPDhPqInHW+KeqVwqJQ==
X-Received: by 2002:adf:fe48:: with SMTP id m8mr9613642wrs.135.1616074074786; 
 Thu, 18 Mar 2021 06:27:54 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id h62sm2622849wmf.37.2021.03.18.06.27.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Mar 2021 06:27:54 -0700 (PDT)
Date: Thu, 18 Mar 2021 14:27:52 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Jason Ekstrand <jason@jlekstrand.net>
Subject: Re: [Intel-gfx] [PATCH 3/5] drm/i915: Disable pread/pwrite ioctl's
 for future platforms (v3)
Message-ID: <YFNVWJsX6Yq0+/Zx@phenom.ffwll.local>
References: <20210315143428.1471489-1-jason@jlekstrand.net>
 <20210317234014.2271006-1-jason@jlekstrand.net>
 <20210317234014.2271006-4-jason@jlekstrand.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210317234014.2271006-4-jason@jlekstrand.net>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 17, 2021 at 06:40:12PM -0500, Jason Ekstrand wrote:
> From: Ashutosh Dixit <ashutosh.dixit@intel.com>
> 
> The rationale for this change is roughly as follows:
> 
>  1. The functionality can be done entirely in userspace with a
>     combination of mmap + memcpy
> 
>  2. The only reason anyone in userspace is still using it is because
>     someone implemented bo_subdata that way in libdrm ages ago and
>     they're all too lazy to write the 5 lines of code to do a map.
> 
>  3. This falls cleanly into the category of things which will only get
>     more painful with local memory support.
> 
> These ioctls aren't used much anymore by "real" userspace drivers.
> Vulkan has never used them and neither has the iris GL driver.  The old
> i965 GL driver does use PWRITE for glBufferSubData but it only supports
> up through Gen11; Gen12 was never enabled in i965.  The compute driver
> has never used PREAD/PWRITE.  The only remaining user is the media
> driver which uses it exactly twice and they're easily removed [1] so
> expecting them to drop it going forward is reasonable.
> 
> IGT changes which handle this kernel change have also been submitted [2].
> 
> [1] https://github.com/intel/media-driver/pull/1160
> [2] https://patchwork.freedesktop.org/series/81384/
> 
> v2 (Jason Ekstrand):
>  - Improved commit message with the status of all usermode drivers
>  - A more future-proof platform check
> 
> v3 (Jason Ekstrand):
>  - Drop the HAS_LMEM checks as they're already covered by the version
>    checks
> 
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
> Reviewed-by: Jason Ekstrand <jason@jlekstrand.net>

Merged the first three here. For the scheduler/context stuff I think we
should go back to normal due process with kernel patch + igt patches
tested together, then land igt first, then kernel, just to avoid hiccups
in CI.

Thanks, Daniel

> ---
>  drivers/gpu/drm/i915/i915_gem.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/i915_gem.c b/drivers/gpu/drm/i915/i915_gem.c
> index b2e3b5cfccb4a..80915467e0d84 100644
> --- a/drivers/gpu/drm/i915/i915_gem.c
> +++ b/drivers/gpu/drm/i915/i915_gem.c
> @@ -374,10 +374,17 @@ int
>  i915_gem_pread_ioctl(struct drm_device *dev, void *data,
>  		     struct drm_file *file)
>  {
> +	struct drm_i915_private *i915 = to_i915(dev);
>  	struct drm_i915_gem_pread *args = data;
>  	struct drm_i915_gem_object *obj;
>  	int ret;
>  
> +	/* PREAD is disallowed for all platforms after TGL-LP.  This also
> +	 * covers all platforms with local memory.
> +	 */
> +	if (INTEL_GEN(i915) >= 12 && !IS_TIGERLAKE(i915))
> +		return -EOPNOTSUPP;
> +
>  	if (args->size == 0)
>  		return 0;
>  
> @@ -675,10 +682,17 @@ int
>  i915_gem_pwrite_ioctl(struct drm_device *dev, void *data,
>  		      struct drm_file *file)
>  {
> +	struct drm_i915_private *i915 = to_i915(dev);
>  	struct drm_i915_gem_pwrite *args = data;
>  	struct drm_i915_gem_object *obj;
>  	int ret;
>  
> +	/* PWRITE is disallowed for all platforms after TGL-LP.  This also
> +	 * covers all platforms with local memory.
> +	 */
> +	if (INTEL_GEN(i915) >= 12 && !IS_TIGERLAKE(i915))
> +		return -EOPNOTSUPP;
> +
>  	if (args->size == 0)
>  		return 0;
>  
> -- 
> 2.29.2
> 
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
