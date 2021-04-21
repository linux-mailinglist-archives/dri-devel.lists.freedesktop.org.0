Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 10259366E48
	for <lists+dri-devel@lfdr.de>; Wed, 21 Apr 2021 16:32:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41A956E9BE;
	Wed, 21 Apr 2021 14:32:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB8076E9C0
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Apr 2021 14:32:51 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id k25so42604728oic.4
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Apr 2021 07:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=O4NdzpZfqirPp0gvR813Ah3uNgfBFiqBDJuyFPyGu1E=;
 b=Kjz9TxZBQw4kQOiJ6hp0eg94TUg7BhRw7HZ8u74uB33gpDmRY6KAQzDoDFyY9qiFDU
 0rqSNQr7DET8P3ubXLIabb344MfpQ/1AxVSeePgjKBgtjwzU3vl+QIi3xmXZ083gD0/9
 LQhoP5fRUPucz1zsAF4aXtw1RiIZpoROr55O8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=O4NdzpZfqirPp0gvR813Ah3uNgfBFiqBDJuyFPyGu1E=;
 b=WLL8EWA1jX3d6zGXVSgZHAjQWf4PRNMQoc67lrG/WdgiGU+3VreDDCDElmfXpAzEal
 K1TCpDOR/l93dZ3t7JkbtcGH3EpYNnpsbwtrgtsqqGYCAU7M012RQ3CcGUrHHt1Ud4V2
 OZh+eAf/ds9NEWvvsEKzShPaikbVnPDhapuWswo9I0f4mMe7Fzb8mhll8OkkJW9IU0EI
 LM2uB5s3sAqaMLOmrXP2TqD1aerPAvWv4EM3sCwFM6tYe6o1URB33FCryoHCCRWwB9bY
 6HtwOAYOgZ4wYzbju8o7rZgp+p6aIn181+2EAQPxneIfr0gVxobQcrCE/7pMUJPvIjnw
 JknQ==
X-Gm-Message-State: AOAM530+vD8hZ7Mj1TDk94Vq6ZHBVcGs+nTFq2fvchXiEqE7vJ8KSoci
 FEa4FaeS3JocCGHPYCJR1/k0FatV8y8J0/Q3FP9yKw==
X-Google-Smtp-Source: ABdhPJzplxjGkMkE3Q1aIt+OfIn0aKTDJphbICRrJaG7SWlq7lWbgO/UnV/T4onLOoKBjH6XsduDUlgmuHX60sLxXw8=
X-Received: by 2002:a05:6808:9b0:: with SMTP id
 e16mr6459393oig.128.1619015571169; 
 Wed, 21 Apr 2021 07:32:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210421120938.546076-1-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20210421120938.546076-1-maarten.lankhorst@linux.intel.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Wed, 21 Apr 2021 16:32:40 +0200
Message-ID: <CAKMK7uF51AyrqydPVwy4u=H9h2apk2uYhnvUFRijDCY4Y2OKzQ@mail.gmail.com>
Subject: Re: [PATCH] drm/i915: Fix docbook descriptions for i915_gem_shrinker
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
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
Cc: Dave Airlie <airlied@linux.ie>, Stephen Rothwell <sfr@canb.auug.org.au>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 21, 2021 at 2:09 PM Maarten Lankhorst
<maarten.lankhorst@linux.intel.com> wrote:
>
> Fixes the following htmldocs warning:
> drivers/gpu/drm/i915/gem/i915_gem_shrinker.c:102: warning: Function parameter or member 'ww' not described in 'i915_gem_shrink'
>
> Fixes: cf41a8f1dc1e ("drm/i915: Finally remove obj->mm.lock.")
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/i915/gem/i915_gem_shrinker.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c b/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
> index 7545ddd83659..f4fb68e8955a 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
> @@ -72,6 +72,7 @@ static void try_to_writeback(struct drm_i915_gem_object *obj,
>
>  /**
>   * i915_gem_shrink - Shrink buffer object caches
> + * @ww: i915 gem ww acquire ctx, or NULL
>   * @i915: i915 device
>   * @target: amount of memory to make available, in pages
>   * @nr_scanned: optional output for number of pages scanned (incremental)
> --
> 2.31.0
>


-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
