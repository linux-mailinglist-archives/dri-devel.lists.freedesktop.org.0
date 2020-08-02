Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F35532356BC
	for <lists+dri-devel@lfdr.de>; Sun,  2 Aug 2020 13:51:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED8456E12A;
	Sun,  2 Aug 2020 11:51:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC6326E0F2;
 Sun,  2 Aug 2020 11:51:50 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 22008785-1500050 for multiple; Sun, 02 Aug 2020 12:51:23 +0100
MIME-Version: 1.0
In-Reply-To: <20200802114044.GD4705@intel.intel>
References: <20200802111534.5155-1-tianjia.zhang@linux.alibaba.com>
 <20200802114044.GD4705@intel.intel>
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Fix wrong return value
From: Chris Wilson <chris@chris-wilson.co.uk>
To: Andi Shyti <andi.shyti@intel.com>,
 Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
Date: Sun, 02 Aug 2020 12:51:22 +0100
Message-ID: <159636908251.23037.6183292610375916917@build.alporthouse.com>
User-Agent: alot/0.9
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
Cc: airlied@linux.ie, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 tianjia.zhang@alibaba.com, matthew.auld@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Andi Shyti (2020-08-02 12:40:44)
> Hi Tianjia,
> 
> > diff --git a/drivers/gpu/drm/i915/i915_active.c b/drivers/gpu/drm/i915/i915_active.c
> > index d960d0be5bd2..cc017e3cc9c5 100644
> > --- a/drivers/gpu/drm/i915/i915_active.c
> > +++ b/drivers/gpu/drm/i915/i915_active.c
> > @@ -758,7 +758,7 @@ int i915_active_acquire_preallocate_barrier(struct i915_active *ref,
> >       intel_engine_mask_t tmp, mask = engine->mask;
> >       struct llist_node *first = NULL, *last = NULL;
> >       struct intel_gt *gt = engine->gt;
> > -     int err;
> > +     int err = 0;
> 
> you don't need the initialization here.

But it's close enough that I can munge the patch inline.
Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
-Chris
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
