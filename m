Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CDC9E3E53A2
	for <lists+dri-devel@lfdr.de>; Tue, 10 Aug 2021 08:38:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 118DB89EA9;
	Tue, 10 Aug 2021 06:38:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 313C889EA9
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Aug 2021 06:38:46 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id k4so12224904wms.3
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Aug 2021 23:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=QcIJY41uAzBRDJL+tMwtpLREfeamN5syF4dVjhDGcqc=;
 b=MtdxtwU8X7QR3u3FOZYMAiX+/OFHUM/0Om7LftC8xXK590N9itpb4tOKvRZ4eSycb6
 UsvLLOsInksukuzghUF1N5TEC2ojc3/TFg3Bc5GlTW/ezQUuj6kjqU2QYOYAXfZ0KzW5
 zBeyA2e7tLG0ymDCj5mas8zANta4tNbVKLJ4A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=QcIJY41uAzBRDJL+tMwtpLREfeamN5syF4dVjhDGcqc=;
 b=JSGApzOqS8N61aS+tFhafeh2zrueNpvn86Jc1XpYDMPt53f+lW7YfNn3AUYtdHpD6l
 hT9VAEbYUtXtty998LDxHHjTVe6ocN6OHXocPPu8X3xLDj0gwUv9dJddUY8c9ZwtxcsB
 4EErjynIT3x0HilJKcXhQpads7sWpzCF9lnKE1mijN1HnZFx85vd6D+rvm3CaxLwWaWb
 Bo0KTb8Ynq24chwBkpS+R4XDJC/cKYmRlamtfQ2wHvdL/6rjM1kO96JGGViFi3VsNLFP
 KR2RUCHd1yymz9SDXHB9TsrSd65PQU9Ig7LtEQeh+ZqTpI2C/bXGJG006JmpO52c2pdt
 668Q==
X-Gm-Message-State: AOAM531xshJer7pa99lTjZHcPrio4U4WzQkZl+ayZSQ4gb1qXLLFYFt+
 u+hvKFO5SLSZhhAg6ZyRMGHsoA==
X-Google-Smtp-Source: ABdhPJxEXkDz+yiuyVkrDVONeES5BBpLDREtOiLglCngRK/J1T2FyPYh/qFgH7MF2GqBluhiZHV9uw==
X-Received: by 2002:a05:600c:1c86:: with SMTP id
 k6mr2857796wms.79.1628577524758; 
 Mon, 09 Aug 2021 23:38:44 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id i5sm21690264wrw.13.2021.08.09.23.38.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Aug 2021 23:38:44 -0700 (PDT)
Date: Tue, 10 Aug 2021 08:38:42 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 0/1] Fix gem_ctx_persistence failures with GuC submission
Message-ID: <YRIe8jEI+0TLreAI@phenom.ffwll.local>
References: <20210729003400.151864-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210729003400.151864-1-matthew.brost@intel.com>
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

On Wed, Jul 28, 2021 at 05:33:59PM -0700, Matthew Brost wrote:
> Should fix below failures with GuC submission for the following tests:
> gem_exec_balancer --r noheartbeat
> gem_ctx_persistence --r heartbeat-close
> 
> Not going to fix:
> gem_ctx_persistence --r heartbeat-many
> gem_ctx_persistence --r heartbeat-stop

After looking at that big thread and being very confused: Are we fixing an
actual use-case here, or is this another case of blindly following igts
tests just because they exist?

I'm leaning towards that we should stall on this, and first document what
exactly is the actual intention behind all this, and then fix up the tests
to match (if needed). And only then fix up GuC to match whatever we
actually want to do.
-Daniel

> 
> As the above tests change the heartbeat value to 0 (off) after the
> context is closed and we have no way to detect that with GuC submission
> unless we keep a list of closed but running contexts which seems like
> overkill for a non-real world use case. We likely should just skip these
> tests with GuC submission.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> 
> Matthew Brost (1):
>   drm/i915: Check if engine has heartbeat when closing a context
> 
>  drivers/gpu/drm/i915/gem/i915_gem_context.c   |  5 +++--
>  drivers/gpu/drm/i915/gt/intel_context_types.h |  2 ++
>  drivers/gpu/drm/i915/gt/intel_engine.h        | 21 ++-----------------
>  .../drm/i915/gt/intel_execlists_submission.c  | 14 +++++++++++++
>  .../gpu/drm/i915/gt/uc/intel_guc_submission.c |  6 +++++-
>  .../gpu/drm/i915/gt/uc/intel_guc_submission.h |  2 --
>  6 files changed, 26 insertions(+), 24 deletions(-)
> 
> -- 
> 2.28.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
