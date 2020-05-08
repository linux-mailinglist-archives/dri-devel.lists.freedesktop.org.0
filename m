Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B8321CA49D
	for <lists+dri-devel@lfdr.de>; Fri,  8 May 2020 08:56:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 705016EA84;
	Fri,  8 May 2020 06:56:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B590C6EA84
 for <dri-devel@lists.freedesktop.org>; Fri,  8 May 2020 06:56:32 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id e26so9085567wmk.5
 for <dri-devel@lists.freedesktop.org>; Thu, 07 May 2020 23:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=+r1ChwrCS3/k7P2VK2Vu7B854WMxHDIdiHxfZnkw7h8=;
 b=HhNd5FWa8BneHtpmwlSoHzcTRY2N5PEnBnfQy95HkFNNBbmcZJFbutsAdkktV695YA
 U5g7A6VJ9TQ8sFPfHiqTzDqZKHq49xMUaOU41vDDgnhCxEoulotSAiksTJ3/YTeD2vPE
 1Ji3VGKMjRwYq1NyuTVXNz9kXLJ2C/XngdiMU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=+r1ChwrCS3/k7P2VK2Vu7B854WMxHDIdiHxfZnkw7h8=;
 b=oMybb39o2mTajTzRMXaomvBXW1MOdCQE+w5ZrHXeMkY9/sF2qPfCbPOgt/d42xXa0M
 hy2YLfHsj5LLj9sEEjmd8JuUfPT+is6FGLEVY3R4A/fCMcvwpHgleznXVL54uepCS1eJ
 lkN0nH+YHvwMCxHrMw42Xu9r8n56vKYxG/rEvNio1dh+WqRnv2ZU/ojYUA9oPYlHCaN0
 mTzVQ/eXZYntf60Rqpy5LK/23uATE2vJsv1WyKxVXn/y7WhJu7Mxiz71AoCdKcGiwKvo
 XLeFiJ0L3hIPEd6gGxhIBZdw9GhwvCcO3zPd1XfXzArPhRK9s70v60zTb4xu+47vJpKL
 Sihg==
X-Gm-Message-State: AGi0PuaGVNTYauuTpOBROt+8MWlaLf2iikd2oCTYvpNDPtDzZrf2Nfik
 /Ih25UOdFBN8u2Rh/pCq+Wl+jx628y0=
X-Google-Smtp-Source: APiQypKeS/EGJ6PB4xP7B7CByPonUX+Okc20fchR4oXOxqWv8y+5N2Y0SXZiUl97zgOPgAPtCwL8pQ==
X-Received: by 2002:a05:600c:1008:: with SMTP id
 c8mr13957599wmc.14.1588920991290; 
 Thu, 07 May 2020 23:56:31 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id l5sm11212079wmi.22.2020.05.07.23.56.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2020 23:56:30 -0700 (PDT)
Date: Fri, 8 May 2020 08:56:28 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Mika Kahola <mika.kahola@intel.com>
Subject: Re: [PATCH v2] uapi/drm/drm_fourcc.h: Note on platform specificity
 for format modifiers
Message-ID: <20200508065628.GD1383626@phenom.ffwll.local>
References: <20200506120827.12250-1-mika.kahola@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200506120827.12250-1-mika.kahola@intel.com>
X-Operating-System: Linux phenom 5.4.0-4-amd64 
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 06, 2020 at 03:08:27PM +0300, Mika Kahola wrote:
> Make an additional note on DRM format modifiers for x and y tiling. These
> format modifiers are defined for BDW+ platforms and therefore definition
> is not valid for older gens. This is due to address swizzling for tiled
> surfaces is no longer used. For newer platforms main memory controller has
> a more effective address swizzling algorithm.
> 
> v2: Rephrase comment (Daniel)
> 
> Signed-off-by: Mika Kahola <mika.kahola@intel.com>

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  include/uapi/drm/drm_fourcc.h | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)
> 
> diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
> index 8bc0b31597d8..9e488d10f8b4 100644
> --- a/include/uapi/drm/drm_fourcc.h
> +++ b/include/uapi/drm/drm_fourcc.h
> @@ -354,9 +354,12 @@ extern "C" {
>   * a platform-dependent stride. On top of that the memory can apply
>   * platform-depending swizzling of some higher address bits into bit6.
>   *
> - * This format is highly platforms specific and not useful for cross-driver
> - * sharing. It exists since on a given platform it does uniquely identify the
> - * layout in a simple way for i915-specific userspace.
> + * Note that this layout is only accurate on intel gen 8+ or valleyview chipsets.
> + * On earlier platforms the is highly platforms specific and not useful for
> + * cross-driver sharing. It exists since on a given platform it does uniquely
> + * identify the layout in a simple way for i915-specific userspace, which
> + * facilitated conversion of userspace to modifiers. Additionally the exact
> + * format on some really old platforms is not known.
>   */
>  #define I915_FORMAT_MOD_X_TILED	fourcc_mod_code(INTEL, 1)
>  
> @@ -369,9 +372,12 @@ extern "C" {
>   * memory can apply platform-depending swizzling of some higher address bits
>   * into bit6.
>   *
> - * This format is highly platforms specific and not useful for cross-driver
> - * sharing. It exists since on a given platform it does uniquely identify the
> - * layout in a simple way for i915-specific userspace.
> + * Note that this layout is only accurate on intel gen 8+ or valleyview chipsets.
> + * On earlier platforms the is highly platforms specific and not useful for
> + * cross-driver sharing. It exists since on a given platform it does uniquely
> + * identify the layout in a simple way for i915-specific userspace, which
> + * facilitated conversion of userspace to modifiers. Additionally the exact
> + * format on some really old platforms is not known.
>   */
>  #define I915_FORMAT_MOD_Y_TILED	fourcc_mod_code(INTEL, 2)
>  
> -- 
> 2.20.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
