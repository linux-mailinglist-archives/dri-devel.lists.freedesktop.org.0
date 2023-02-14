Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93106696D9C
	for <lists+dri-devel@lfdr.de>; Tue, 14 Feb 2023 20:13:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4FCE10E267;
	Tue, 14 Feb 2023 19:13:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2a.google.com (mail-oa1-x2a.google.com
 [IPv6:2001:4860:4864:20::2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64B7C10E25B;
 Tue, 14 Feb 2023 19:13:46 +0000 (UTC)
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-1442977d77dso20315484fac.6; 
 Tue, 14 Feb 2023 11:13:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=fm4gmPXIfQl7TT3p+a7ywM2CDH3Pvh0KWdIx3zV+pQU=;
 b=nw3Ut1cNo380FKFz/sg8WROeGiSCBpjtFDhj3BUM1P7czfeXalSyCAX/jrEnRV2NHz
 lvo8nCBA6eTRGsjC1p+sqaiNcTMvcVfEJJvGLw/6uFmVCS+kbgfAN/Q7HeCOzZNQ06ma
 BJpGU7rpcAkL7a3f+KrTzViUS07PwhxlaYBO7FJ+W43a2BmfnAmM1Ux0xkVKVdlH/y7l
 6AN6yfYxeUbIaqDDCZvlTZb4+ryz3V1BIaI9I/ZNJMtrOz6VtfBjjZ8OGb7ZjVyPNL+p
 z3fUnV3PJNFWDCRqVCIxfXleOoIeuNnCgl6TLdxb+NKLhwLXebj23L6qTCrXx1go/EH9
 uNOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fm4gmPXIfQl7TT3p+a7ywM2CDH3Pvh0KWdIx3zV+pQU=;
 b=inXMXYfTRj1NawmknchVLnJFJY1KlH6H1DznezgQEz3ZHVhUh6fMZsN0ZB8oPtClRM
 enQm9vYqAYbpJFNYT9XFAx7Z+p9pX5Iq4u/GN4YwAMLa6trW4NWPNn27jkmzVFChDbO1
 Wmax2rXRBvC3nEv6ZvcQeogczDGszNdnjuIqDGhAmzGMuc2LRVMrFNoaTeP6xoTDh1qY
 5/xgKBeWg5f+NWfn9qthPv0EGvXyhzVvUh1HnEr7td7MrWxlofzWkyFrm+wqAqVRRH55
 kJHBaX2YTxxSMsE2bA+9nsbCrXNvo6Iryvo+C8RJHaqDWApa0bhbS5mnWoV+ecLbeybP
 VCxg==
X-Gm-Message-State: AO0yUKXVyrJJcMiNKn4NPRSTGrK/2JQoTb7EyoOGy5DqV3Ndrh5qI9GH
 L0ZO4gm1FLXDi+DAGnIFWGAN7DpVbuDrdxNlDn4=
X-Google-Smtp-Source: AK7set/e0gotx4YwLPHRYnSLef2nEPgNoKWPVhaU+SPcyu7/oJtJVmdOICIZHh31e6aiCixSGeUXLxf7SYqO+b7wO+0=
X-Received: by 2002:a05:6871:58c:b0:16e:460:5aee with SMTP id
 u12-20020a056871058c00b0016e04605aeemr48788oan.210.1676402025559; Tue, 14 Feb
 2023 11:13:45 -0800 (PST)
MIME-Version: 1.0
References: <20230210130647.580135-1-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20230210130647.580135-1-tvrtko.ursulin@linux.intel.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 14 Feb 2023 11:14:00 -0800
Message-ID: <CAF6AEGto9VMNLJnAs+n5H6MNoVASNasYEu3WhYYkhn5sERg4Fw@mail.gmail.com>
Subject: Re: [Intel-gfx] [RFC v2 0/5] Waitboost drm syncobj waits
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Rob Clark <robdclark@chromium.org>, Intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 10, 2023 at 5:07 AM Tvrtko Ursulin
<tvrtko.ursulin@linux.intel.com> wrote:
>
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>
> In i915 we have this concept of "wait boosting" where we give a priority boost
> for instance to fences which are actively waited upon from userspace. This has
> it's pros and cons and can certainly be discussed at lenght. However fact is
> some workloads really like it.
>
> Problem is that with the arrival of drm syncobj and a new userspace waiting
> entry point it added, the waitboost mechanism was bypassed. Hence I cooked up
> this mini series really (really) quickly to see if some discussion can be had.
>
> It adds a concept of "wait count" to dma fence, which is incremented for every
> explicit dma_fence_enable_sw_signaling and dma_fence_add_wait_callback (like
> dma_fence_add_callback but from explicit/userspace wait paths).

I was thinking about a similar thing, but in the context of dma_fence
(or rather sync_file) fd poll()ing.  How does the kernel differentiate
between "housekeeping" poll()ers that don't want to trigger boost but
simply know when to do cleanup, and waiters who are waiting with some
urgency.  I think we could use EPOLLPRI for this purpose.

Not sure how that translates to waits via the syncobj.  But I think we
want to let userspace give some hint about urgent vs housekeeping
waits.

Also, on a related topic: https://lwn.net/Articles/868468/

BR,
-R

> Individual drivers can then inspect this via dma_fence_wait_count() and decide
> to wait boost the waits on such fences.
>
> Again, quickly put together and smoke tested only - no guarantees whatsoever and
> I will rely on interested parties to test and report if it even works or how
> well.
>
> v2:
>  * Small fixups based on CI feedback:
>     * Handle decrement correctly for already signalled case while adding callback.
>     * Remove i915 assert which was making sure struct i915_request does not grow.
>  * Split out the i915 patch into three separate functional changes.
>
> Tvrtko Ursulin (5):
>   dma-fence: Track explicit waiters
>   drm/syncobj: Mark syncobj waits as external waiters
>   drm/i915: Waitboost external waits
>   drm/i915: Mark waits as explicit
>   drm/i915: Wait boost requests waited upon by others
>
>  drivers/dma-buf/dma-fence.c               | 102 ++++++++++++++++------
>  drivers/gpu/drm/drm_syncobj.c             |   6 +-
>  drivers/gpu/drm/i915/gt/intel_engine_pm.c |   1 -
>  drivers/gpu/drm/i915/i915_request.c       |  13 ++-
>  include/linux/dma-fence.h                 |  14 +++
>  5 files changed, 101 insertions(+), 35 deletions(-)
>
> --
> 2.34.1
>
