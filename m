Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 865F83AC0C2
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jun 2021 04:29:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE42C6E94F;
	Fri, 18 Jun 2021 02:29:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 375CA6E855
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jun 2021 02:29:36 +0000 (UTC)
Received: by mail-pg1-x532.google.com with SMTP id u190so2708211pgd.8
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jun 2021 19:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=lfPVG5Rlds1gsdNwyYiwTk3qXAK1bjtNSBW/loIyjKY=;
 b=E2p6v27bJYXXFcPeI5HII06b35v9VeR4Y4LrX8rCAPy1EKcPKWRNCLSeoRvFB6gu7a
 20danzHU+5B4CO5YgjmOJsLR+X+AJ+glc5VcTxedFJ3oKqjyLWzZO24FXuUSB+0naqmE
 k6pwiekhhbjBwqo4/5qvEF6ACa0hCftM65IOE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=lfPVG5Rlds1gsdNwyYiwTk3qXAK1bjtNSBW/loIyjKY=;
 b=AstXDy54vTZL77n3SwXoOA/v8yaFKbrW5b6aqj1Syy/1Q+haaILHayTvWQZRKceieg
 UwhiXQok04Iu/o6QaDx0igvpIW9We9Tta9ziO0EjF6HLMyrdXZmX7o0PgDPJaIpvY0GD
 TurFdmDlRl3LEF0EV8Mf5E5Ja8ayzMojovTu80BNsb9mbOK/duaHecVG5jwpHSJcSU5E
 wkgBxqrRT1XtEI4DQWJvcNtPLe3kEZsP385weh4pREst8xGPmursnWcWfGkDB231Ktcs
 2jXpGnAx80F1A1eVKE540nnjN9UB7MAZTxygvkcBw3LAhX9o8Zurw/4IE9NEZu9RWTXL
 kI/Q==
X-Gm-Message-State: AOAM530WMHporWlppGwtQkB8FcQUMnYdtp2QRIhLACWwW2EjWJTmoRqF
 ZgnUkAMbjaVsNfhfk2iDe59f9A==
X-Google-Smtp-Source: ABdhPJyS6c3QGhrzjMIrW+aGUG63njKnr2ncdaOY4gTWMcv6MJ1tkZvI9BCbGpvn07MueABqKDk/xQ==
X-Received: by 2002:a63:5c4a:: with SMTP id n10mr7829823pgm.279.1623983375774; 
 Thu, 17 Jun 2021 19:29:35 -0700 (PDT)
Received: from google.com ([2409:10:2e40:5100:51a0:fc:f202:9f8])
 by smtp.gmail.com with ESMTPSA id v7sm6368683pfi.187.2021.06.17.19.29.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 19:29:35 -0700 (PDT)
Date: Fri, 18 Jun 2021 11:29:30 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Sergey Senozhatsky <senozhatsky@chromium.org>,
 Matthew Auld <matthew.william.auld@gmail.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Chris Wilson <chris@chris-wilson.co.uk>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: drm/i915: __GFP_RETRY_MAYFAIL allocations in stable kernels
Message-ID: <YMwFCoHzjnuH80p6@google.com>
References: <YMdPcWZi4x7vnCxI@google.com> <YMuGGqs4cDotxuKO@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YMuGGqs4cDotxuKO@phenom.ffwll.local>
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

On (21/06/17 19:27), Daniel Vetter wrote:
> > 
> > So can all allocations in gen8_init_scratch() use
> > 	GFP_KERNEL | __GFP_RETRY_MAYFAIL | __GFP_NOWARN
> 
> Yeah that looks all fairly broken tbh. The only thing I didn't know was
> that GFP_DMA32 wasn't a full gfp mask with reclaim bits set as needed. I
> guess it would be clearer if we use GFP_KERNEL | __GFP_DMA32 for these.

Looks good.

> The commit that introduced a lot of this, including I915_GFP_ALLOW_FAIL
> seems to be
> 
> commit 1abb70f5955d1a9021f96359a2c6502ca569b68d
> Author: Chris Wilson <chris@chris-wilson.co.uk>
> Date:   Tue May 22 09:36:43 2018 +0100
> 
>     drm/i915/gtt: Allow pagedirectory allocations to fail
> 
> which used a selftest as justification, not real world workloads, so looks
> rather dubious.

Exactly, the commit we landed internally partially reverts 1abb70f5955
in 4.19 and 5.4 kernels. I don't mind I915_GFP_ALLOW_FAIL and so on, I
kept those bits, but we need reclaim. I can reproduce cases when order:0
allocation fails with
	__GFP_HIGHMEM|__GFP_RETRY_MAYFAIL
but succeeds with
	GFP_KERNEL|__GFP_HIGHMEM|__GFP_RETRY_MAYFAIL


ON a side note, I'm not very sure if __GFP_RETRY_MAYFAIL is actually
needed. Especially seeing it in syscalls is a bit uncommon:

  drm_ioctl()
   i915_gem_context_create_ioctl()
    i915_gem_create_context()
     i915_ppgtt_create()
      setup_scratch_page()           // __GFP_RETRY_MAYFAIL

But with GFP_KERNEL at least it tries to make some reclaim progress
between retries, so it seems to be good enough.
