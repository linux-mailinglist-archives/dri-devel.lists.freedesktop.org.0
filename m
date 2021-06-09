Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7641A3A153F
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jun 2021 15:15:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C87536E05A;
	Wed,  9 Jun 2021 13:15:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 735816E05A
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jun 2021 13:15:02 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 v206-20020a1cded70000b02901a586d3fa23so4178503wmg.4
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Jun 2021 06:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=eVTFO9K7i34xSf6Rs5YO9CVhklxb6MbUBU8n+2/L45s=;
 b=hSwlKEB9ZyWuNKe3GYcMLWt1sPRZHfk7jJDXPvpbmXuYHwabHSFZsNGwCU9ZGkpnaY
 VyC4PmtXEX8rEkcN/45Rg4XnNLtBe4TTYBpKL4S99QBNxTYP3db9MV465pl41eniGecE
 rTPJBoqzoNNgNwjBo2NYnSaN4vyxTWsyRrflY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=eVTFO9K7i34xSf6Rs5YO9CVhklxb6MbUBU8n+2/L45s=;
 b=JbqsA8/Zg1rT4e3mpetM8vNsm0dpnGL6LJYYR7jLAgBxZTU4v4uBis0Khmx6xi9H9V
 36S+Mi03oxToNzVAeDSibiijFNbS7D9mqGaGjfYnIx1kUuA/mQe+20WR+jbKPtGNVSsf
 9kj/mLztQQ4umqX7LZ5nS7zAEQccdomP0FZiPrnN353RLEM5kHwwh3ETjxXTB+LI0YGi
 nQgZ0Iqs1RPqGiz3XzXy9h0NBc6mwtQ9fBCd5e/G2XbXPhmtU1K7eBThLW/41mtE/Hzp
 r9Ayc3qIL1DO3Z9jhkFIXVTvxod6QII7Xe6qqfWg1nsT/P9PEmFe3D0Dp1QIC2GnEgBT
 d/XQ==
X-Gm-Message-State: AOAM533kFhCXPxO8rnKUyw5su+C2FJzTFnW8HZ5FoWzpjcRtP83k9zpZ
 JJInasRojO9eGFYIcWQxNIBMXw==
X-Google-Smtp-Source: ABdhPJyA+FER6Bz6ZfD5wEr75nGo4fcpGzVtJd+SIcJZ4F8HDtWOntdg/k02gSGKgW+/aAJHNZc8Jg==
X-Received: by 2002:a05:600c:2109:: with SMTP id
 u9mr9876976wml.7.1623244501091; 
 Wed, 09 Jun 2021 06:15:01 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id s1sm6292957wmj.8.2021.06.09.06.15.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jun 2021 06:15:00 -0700 (PDT)
Date: Wed, 9 Jun 2021 15:14:58 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: Re: [PATCH] drm/i915: Add relocation exceptions for two other
 platforms
Message-ID: <YMC+0lc8i4Q97roq@phenom.ffwll.local>
References: <20210601142442.100754-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210601142442.100754-1-zbigniew.kempczynski@intel.com>
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

On Tue, Jun 01, 2021 at 04:24:42PM +0200, Zbigniew Kempczyński wrote:
> We have established previously we stop using relocations starting
> from gen12 platforms with Tigerlake as an exception. We keep this
> statement but we want to enable relocations conditionally for
> Rocketlake and Alderlake under require_force_probe flag set.
> 
> Keeping relocations under require_force_probe flag is interim solution
> until IGTs will be rewritten to use softpin.
> 
> v2: - remove inline from function definition (Jani)
>     - fix indentation
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Jason Ekstrand <jason@jlekstrand.net>

This conflicts with Lucas' switch from INTEL_GEN to GRAPHICS_VER. Can you
pls rebase and resend (with Dave's ack included).
-Daniel

> ---
>  .../gpu/drm/i915/gem/i915_gem_execbuffer.c    | 24 +++++++++++++++----
>  1 file changed, 19 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> index 297143511f99..78b86a7bc39a 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> @@ -491,16 +491,30 @@ eb_unreserve_vma(struct eb_vma *ev)
>  	ev->flags &= ~__EXEC_OBJECT_RESERVED;
>  }
>  
> +static bool platform_has_relocs_enabled(const struct i915_execbuffer *eb)
> +{
> +	/*
> +	 * Relocations are disallowed starting from gen12 with Tigerlake
> +	 * as an exception. We allow temporarily use relocations for Rocketlake
> +	 * and Alderlake when require_force_probe flag is set.
> +	 */
> +	if (INTEL_GEN(eb->i915) < 12 || IS_TIGERLAKE(eb->i915))
> +		return true;
> +
> +	if (INTEL_INFO(eb->i915)->require_force_probe &&
> +	    (IS_ROCKETLAKE(eb->i915) || IS_ALDERLAKE_S(eb->i915) ||
> +	     IS_ALDERLAKE_P(eb->i915)))
> +		return true;
> +
> +	return false;
> +}
> +
>  static int
>  eb_validate_vma(struct i915_execbuffer *eb,
>  		struct drm_i915_gem_exec_object2 *entry,
>  		struct i915_vma *vma)
>  {
> -	/* Relocations are disallowed for all platforms after TGL-LP.  This
> -	 * also covers all platforms with local memory.
> -	 */
> -	if (entry->relocation_count &&
> -	    INTEL_GEN(eb->i915) >= 12 && !IS_TIGERLAKE(eb->i915))
> +	if (entry->relocation_count && !platform_has_relocs_enabled(eb))
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
