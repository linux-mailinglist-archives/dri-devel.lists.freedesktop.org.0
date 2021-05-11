Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6231D37ACA5
	for <lists+dri-devel@lfdr.de>; Tue, 11 May 2021 19:05:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFC476EA86;
	Tue, 11 May 2021 17:05:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0983A6EA84
 for <dri-devel@lists.freedesktop.org>; Tue, 11 May 2021 17:05:00 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id j19so1370045edr.12
 for <dri-devel@lists.freedesktop.org>; Tue, 11 May 2021 10:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=OAXk/8WHwKVhPFW9td3pa9U9iAIkU4/3QR+Ow5Nxdqc=;
 b=ZlgARLQdMzjYHaR/whOmTR94TG0qV7bL4Ca2pC/57DDuFETVn2I3rjsR7mbg0SA+oq
 zZMasK/7Vd6qBl9ksgmtY3kMRwq4N//O8ogaj+sQVMyJhTqKkZnItVvc7W/WrWm6pXVY
 UPmz4eJwNsTwMgYW2q9hTFFzJz1p20BnbMlCQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=OAXk/8WHwKVhPFW9td3pa9U9iAIkU4/3QR+Ow5Nxdqc=;
 b=mzxe90d0wZy32PBtHR+sBN6EXNu3CEfOEHx38QtVpRUuORfdlJSZFZJYdRvZ9uWzV5
 myKZVga5/dj1EaJyJaFdOnSlBGu7ihE7q05NkF8q3WROXOfuhfC/2OvtSBdqwRiEPx9+
 mnO7v/pV7FNlFZQ1hBwkEYf5BIJAfBPzSGGxICLwUp6XW02PKPeVy+DseBfTZOKFSR8S
 We8uNw5O19Xcwa0Zj8DPML9GAbJN/d4N20E1pDxmqmZnBm5Vc1kWk1tbzAy+HmDRsAZp
 2oTyF6OYBqSY2QdB/mI29VI0O9mChTOBQ9HD5M2upO7/4265mfbGsAIwnS0cH36c7v0N
 WLHA==
X-Gm-Message-State: AOAM530RT9QHcoXQ7vrmSXjpDgMxYYhLOp4gwmclJsGUVZdYft1Nj9En
 WkJ6CcCvaxd5xxJlG1UGINP6bA==
X-Google-Smtp-Source: ABdhPJzZTZaIFT1evKYYji9vcL166SCamP1fSF5H4QOMkMWXu1LMSXvPbHlNUQX3jQoQUqSHRD7HaA==
X-Received: by 2002:aa7:d513:: with SMTP id y19mr36832686edq.9.1620752698783; 
 Tue, 11 May 2021 10:04:58 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id f7sm1018653edd.5.2021.05.11.10.04.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 May 2021 10:04:58 -0700 (PDT)
Date: Tue, 11 May 2021 19:04:56 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: Re: [PATCH] drm/i915: Add relocation exceptions for two other
 platforms
Message-ID: <YJq5OHIO8ThIiKCz@phenom.ffwll.local>
References: <20210511083139.54002-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210511083139.54002-1-zbigniew.kempczynski@intel.com>
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
Cc: Dave Airlie <airlied@redhat.com>, intel-gfx@lists.freedesktop.org,
 Jason Ekstrand <jason@jlekstrand.net>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 11, 2021 at 10:31:39AM +0200, Zbigniew Kempczyński wrote:
> We have established previously we stop using relocations starting
> from gen12 platforms with Tigerlake as an exception. Unfortunately
> we need extend transition period and support relocations for two
> other igfx platforms - Rocketlake and Alderlake.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Jason Ekstrand <jason@jlekstrand.net>

So the annoying thing here is that now media-driver is fixed:

https://github.com/intel/media-driver/commit/144020c37770083974bedf59902b70b8f444c799

Which means igt is really the only thing left.

Dave, is this still ok for an acked exception, or is this now leaning
towards "just fix igt"?
-Daniel
> ---
>  drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> index 297143511f99..f80da1d6d9b2 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> @@ -496,11 +496,15 @@ eb_validate_vma(struct i915_execbuffer *eb,
>  		struct drm_i915_gem_exec_object2 *entry,
>  		struct i915_vma *vma)
>  {
> -	/* Relocations are disallowed for all platforms after TGL-LP.  This
> -	 * also covers all platforms with local memory.
> +	/*
> +	 * Relocations are disallowed starting from gen12 with some exceptions
> +	 * - TGL/RKL/ADL.
>  	 */
>  	if (entry->relocation_count &&
> -	    INTEL_GEN(eb->i915) >= 12 && !IS_TIGERLAKE(eb->i915))
> +	    INTEL_GEN(eb->i915) >= 12 && !(IS_TIGERLAKE(eb->i915) ||
> +					   IS_ROCKETLAKE(eb->i915) ||
> +					   IS_ALDERLAKE_S(eb->i915) ||
> +					   IS_ALDERLAKE_P(eb->i915)))
>  		return -EINVAL;
>  
>  	if (unlikely(entry->flags & eb->invalid_flags))
> -- 
> 2.26.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
