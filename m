Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A723B2CD66E
	for <lists+dri-devel@lfdr.de>; Thu,  3 Dec 2020 14:14:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 929006EB68;
	Thu,  3 Dec 2020 13:14:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F06616E9B8;
 Thu,  3 Dec 2020 13:13:58 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 23202106-1500050 for multiple; Thu, 03 Dec 2020 13:13:44 +0000
MIME-Version: 1.0
In-Reply-To: <X8jH5D//XHDsXKtQ@intel.intel>
References: <X8ilneOcJAjwqU4t@mwanda> <X8jH5D//XHDsXKtQ@intel.intel>
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Check the correct variable
From: Chris Wilson <chris@chris-wilson.co.uk>
To: Andi Shyti <andi.shyti@intel.com>, Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 03 Dec 2020 13:13:42 +0000
Message-ID: <160700122270.3473.6016063697830335784@build.alporthouse.com>
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
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org, Thomas Hellström <thomas.hellstrom@intel.com>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Andi Shyti (2020-12-03 11:12:24)
> Hi Dan,
> 
> > There is a copy and paste bug in this code.  It's supposed to check
> > "obj2" instead of checking "obj" a second time.
> > 
> > Fixes: 80f0b679d6f0 ("drm/i915: Add an implementation for i915_gem_ww_ctx locking, v2.")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > ---
> >  drivers/gpu/drm/i915/selftests/i915_gem.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/selftests/i915_gem.c b/drivers/gpu/drm/i915/selftests/i915_gem.c
> > index 23a6132c5f4e..412e21604a05 100644
> > --- a/drivers/gpu/drm/i915/selftests/i915_gem.c
> > +++ b/drivers/gpu/drm/i915/selftests/i915_gem.c
> > @@ -211,8 +211,8 @@ static int igt_gem_ww_ctx(void *arg)
> >               return PTR_ERR(obj);
> >  
> >       obj2 = i915_gem_object_create_internal(i915, PAGE_SIZE);
> > -     if (IS_ERR(obj)) {
> > -             err = PTR_ERR(obj);
> > +     if (IS_ERR(obj2)) {
> > +             err = PTR_ERR(obj2);
> 
> Reviewed-by: Andi Shyti <andi.shyti@intel.com>

I gave up waiting for patchwork to spot the original patch, and pushed.

Thanks,
-Chris
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
