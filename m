Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 567505B3F39
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 21:07:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A2F510EDB9;
	Fri,  9 Sep 2022 19:06:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe30.google.com (mail-vs1-xe30.google.com
 [IPv6:2607:f8b0:4864:20::e30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EB1E10EDB6;
 Fri,  9 Sep 2022 19:06:54 +0000 (UTC)
Received: by mail-vs1-xe30.google.com with SMTP id i1so2680060vsc.9;
 Fri, 09 Sep 2022 12:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=ahr14h6KjlyOLxYXPAD4hS0TZjmkL0paFuUiYdgkD0s=;
 b=iX5Xydo/Hc2RaWqEtFNZ+b8pT3uTmTNTwMis8W63WAkrjmv1dj3TO26rpoSDowHb8X
 Ea6o5nkPc8osXBO+eDUg4r5vJw14F6/BzM1PuR0ji5eNWTZ01z+b1onwv2skwetzPieg
 6KKZ8Ku0AhQ4Ma/R52Z0QfbcVAfXRkR+ALPNFw9N/2ZfZTnKBfgry+CHI4KV3t4PS6OR
 KO1/RWZSobotWZfzVHJm2urieXjAX6iRkGk+6zmjxZnNXEqkUOi7DfAQI3AWWdlHlbU8
 jLaw+SGWegoHDigXkzejk1HDQfnhiaqkkQPQjzoxBrTZphEQtJvY0Dg+aQKK7iO5OQ9q
 /nFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=ahr14h6KjlyOLxYXPAD4hS0TZjmkL0paFuUiYdgkD0s=;
 b=lJTS6jPsofAcChZWXeRwJv4u1cvBn+/eRYPmbvKK3j0jWKaLTi2EfOJPP9gTW/GSRX
 ll7wykhw7/tuepCVWIoPwoPVes1ywzHvbHYrlx1pxUBUAU1NPkGUUXauJN8WudfqDe7U
 h0VC30kIa6jix8g6yFMEHfwV8WdLWuyjYoJHuKmi3ETQo3EqWMZ2VP6MNe6Uq8ayU0qn
 KtphENueQHc88PQTG+JGYpGvsSNvJhBPgp1bf8KI4SDkjuvB8TZuty6CUp3Sqn77ACkI
 +xx6n0FSpv4qwT4FN/K56uIzu/HpMIgxAREMyGgX32tJ8Jna/aYS7aZJwBiIKBvFzt0o
 z9Wg==
X-Gm-Message-State: ACgBeo2GJ1Uwy9S2d5tViaTU5352hAE8Kf5F7d40dXmVreiFbtS4gvcS
 ocxD6vRPkraCHWP4f/LtPrkWgZNSHYmmELfz9Ek=
X-Google-Smtp-Source: AA6agR5028DA7OqZ9J9sMFi7dkLQnKJMdrQ0zAppoctI1FwlBjJBW3gpcuNvgALdzQrHynswLpBZL/WwynuYEgcuqbw=
X-Received: by 2002:a05:6102:538:b0:398:2ca3:bec2 with SMTP id
 m24-20020a056102053800b003982ca3bec2mr4860540vsa.56.1662750413144; Fri, 09
 Sep 2022 12:06:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220904214134.408619-1-jim.cromie@gmail.com>
 <20220904214134.408619-24-jim.cromie@gmail.com>
 <Yxg2b2stA27B6B0t@phenom.ffwll.local>
In-Reply-To: <Yxg2b2stA27B6B0t@phenom.ffwll.local>
From: jim.cromie@gmail.com
Date: Fri, 9 Sep 2022 13:06:27 -0600
Message-ID: <CAJfuBxx3T3SquEWe-Uj0UW3zHacup_sHe0SWsffNzNj1XMmuQg@mail.gmail.com>
Subject: Re: [PATCH v6 23/57] drm: POC drm on dyndbg - use in core, 2 helpers, 
 3 drivers.
To: Jim Cromie <jim.cromie@gmail.com>, Jason Baron <jbaron@akamai.com>, 
 Greg KH <gregkh@linuxfoundation.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 intel-gvt-dev@lists.freedesktop.org, 
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, 
 Sean Paul <seanpaul@chromium.org>, robdclark@gmail.com, 
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, Joe Perches <joe@perches.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 7, 2022 at 12:13 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Sun, Sep 04, 2022 at 03:41:00PM -0600, Jim Cromie wrote:
> > Use DECLARE_DYNDBG_CLASSMAP across DRM:
> >
> >  - in .c files, since macro defines/initializes a record
> >
> >  - in drivers, $mod_{drv,drm,param}.c
> >    ie where param setup is done, since a classmap is param related
> >
> >  - in drm/drm_print.c
> >    since existing __drm_debug param is defined there,
> >    and we ifdef it, and provide an elaborated alternative.
> >
> >  - in drm_*_helper modules:
> >    dp/drm_dp - 1st item in makefile target
> >    drivers/gpu/drm/drm_crtc_helper.c - random pick iirc.
> >
> > Since these modules all use identical CLASSMAP declarations (ie: names
> > and .class_id's) they will all respond together to "class DRM_UT_*"
> > query-commands:
> >
> >   :#> echo class DRM_UT_KMS +p > /proc/dynamic_debug/control
> >
> > NOTES:
> >
> > This changes __drm_debug from int to ulong, so BIT() is usable on it.
> >
> > DRM's enum drm_debug_category values need to sync with the index of
> > their respective class-names here.  Then .class_id == category, and
> > dyndbg's class FOO mechanisms will enable drm_dbg(DRM_UT_KMS, ...).
> >
> > Though DRM needs consistent categories across all modules, thats not
> > generally needed; modules X and Y could define FOO differently (ie a
> > different NAME => class_id mapping), changes are made according to
> > each module's private class-map.
> >
> > No callsites are actually selected by this patch, since none are
> > class'd yet.
> >
> > Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
>
> So maybe I should just try, but what happens if a drm module doesn't have
> these classbits declared? You simply have to use the raw number instead?

without the classnames declared via macro,
dyndbg has no names by which to validate the query.
raw class numbers are not usable into >control.
This is what privatizes the module's class-id space.

If the macro is missing, the drm_dbg()s ( after conversion to reside
atop dyndbg)
will do this in `cat control`
                        seq_printf(m, " class unknown, _id:%d", dp->class_id);



>
> > ---
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 14 +++++++++++++
> >  drivers/gpu/drm/display/drm_dp_helper.c | 13 ++++++++++++
> >  drivers/gpu/drm/drm_crtc_helper.c       | 13 ++++++++++++
> >  drivers/gpu/drm/drm_print.c             | 27 +++++++++++++++++++++++--
> >  drivers/gpu/drm/i915/i915_params.c      | 12 +++++++++++
> >  drivers/gpu/drm/nouveau/nouveau_drm.c   | 13 ++++++++++++
> >  include/drm/drm_print.h                 |  3 ++-
> >  7 files changed, 92 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> > index de7144b06e93..97e184f44a52 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> > @@ -38,6 +38,8 @@
> >  #include <linux/mmu_notifier.h>
> >  #include <linux/suspend.h>
> >  #include <linux/cc_platform.h>
> > +#include <linux/fb.h>
> > +#include <linux/dynamic_debug.h>
> >
> >  #include "amdgpu.h"
> >  #include "amdgpu_irq.h"
> > @@ -185,6 +187,18 @@ int amdgpu_vcnfw_log;
> >
> >  static void amdgpu_drv_delayed_reset_work_handler(struct work_struct *work);
> >
> > +DECLARE_DYNDBG_CLASSMAP(drm_debug_classes, DD_CLASS_TYPE_DISJOINT_BITS, 0,
>
> Iirc we've talked about maybe some kbuild trickery so that any module
> under drivers/gpu/drm gets these by default. I don't think we need to have
> this for the first cut, but a macro to avoid the copypaste mistakes would
> be really good here.

It *may be* that theres a perfect place to declare it once, for everyone.
For me thats exploratory, error prone.
Proving that the sub-optimal worked seemed a good place to stop.

that said, theres a macro in test-dynamic-debug that is a candidate
for wider availability - it needs a better name

#define DD_SYS_WRAP(_model, _flags)                                     \
        static unsigned long bits_##_model;                             \
        static struct ddebug_class_param _flags##_model = {             \
                .bits = &bits_##_model,                                 \
                .flags = #_flags,                                       \
                .map = &map_##_model,                                   \
        };                                                              \
        module_param_cb(_flags##_##_model, &param_ops_dyndbg_classes,
&_flags##_model, 0600)
