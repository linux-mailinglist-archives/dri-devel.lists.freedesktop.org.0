Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2097E3CF9F8
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jul 2021 14:59:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BC1689B12;
	Tue, 20 Jul 2021 12:58:57 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0C0489AEE
 for <DRI-Devel@lists.freedesktop.org>; Tue, 20 Jul 2021 12:58:55 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id c12so7887233wrt.3
 for <DRI-Devel@lists.freedesktop.org>; Tue, 20 Jul 2021 05:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=TcTp0wobItD6AuKo9qIA9DC0sXZDvU6Zw78LL0e3Un8=;
 b=hp9aI4S4ySgXltACuCVM1NtzhsUlFuf/5xfGaPOweWkhyqTu1YUzCzkzoCkrxoBCnD
 0ZMhY44EzJb66foqVdYZ43JRIwzAoQU1UeIuQ3jO3sgSadMVbz8/E2tt+ScoKeUqTQ4e
 s2WrbukFcv2LPnXuHtvsk1FjxGBHL9jRXKWlQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=TcTp0wobItD6AuKo9qIA9DC0sXZDvU6Zw78LL0e3Un8=;
 b=d6BTozEvOMjIHyXCw3FESDlC+oAhIzRVGbsgz0mNfqYM2hF+tMLa6ck/+B1SfIpvIG
 CwaebRUZc9c8ivlh2zg0GBMh08U9lfycw4LxpuMvddWTdIwF002lheZ++t180MX4rCFK
 vjzCuSQW8OxxPw+zdQ0UYnoxw8CK4NR8mapsyXyYgID8UpndlinE6QiS2a3fdD33Zav+
 PpoNikAwQ9/eMTrVAi0uZXtkRxsbU7uBt9pJNCwE41mk5U/+hs0KXZd45zV42ZEhS4CA
 aAxPofQ2D19nI3Hzzh80czJahQHX8KejxP489CC+twMcahhnZdBRb2WjxugTnUBEo6S+
 +rdA==
X-Gm-Message-State: AOAM531EHKSYpgaC42yL4d8aKEF2C2Oqp1ID3cAFgCcoGHjfLw0Bx3yW
 gEVULiyKXhM7bu7mtF5YyW30JwKeOFcFlw==
X-Google-Smtp-Source: ABdhPJzo1gNkWbMJv45R3wNpOxwiQD4mM3Z0a/jZXLfzKY1hNQ+LEPnIJr5HZjLb2KKvrEViHthaHg==
X-Received: by 2002:a5d:4e81:: with SMTP id e1mr35469113wru.48.1626785934335; 
 Tue, 20 Jul 2021 05:58:54 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id p7sm18753143wmq.5.2021.07.20.05.58.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 05:58:53 -0700 (PDT)
Date: Tue, 20 Jul 2021 14:58:51 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: John Harrison <john.c.harrison@intel.com>
Subject: Re: [Intel-gfx] [PATCH 3/3] drm/i915/uapi: Add query for L3 bank count
Message-ID: <YPbIi2vcYh7/3ELv@phenom.ffwll.local>
References: <20210610204626.2995262-1-John.C.Harrison@Intel.com>
 <20210610204626.2995262-4-John.C.Harrison@Intel.com>
 <CAKMK7uGO8U9a8yq73MV=xSbTA+tCQi5nqiZSD9Hwbi==fZ=R5A@mail.gmail.com>
 <84e44807-6cbb-b156-0a13-ef7715bad66b@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <84e44807-6cbb-b156-0a13-ef7715bad66b@intel.com>
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
Cc: intel-gfx <Intel-GFX@lists.freedesktop.org>,
 dri-devel <DRI-Devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 15, 2021 at 03:16:08PM -0700, John Harrison wrote:
> On 6/16/2021 03:25, Daniel Vetter wrote:
> > On Thu, Jun 10, 2021 at 10:46 PM <John.C.Harrison@intel.com> wrote:
> > > From: John Harrison <John.C.Harrison@Intel.com>
> > > 
> > > Various UMDs need to know the L3 bank count. So add a query API for it.
> > Please link to both the igt test submission for this (there's not even
> > a Test-with: on the cover letter)
> Is there a wiki page that describes all such tags? That is not one I was
> aware of and I can't find anything in the Kernel patch submission wiki or
> DRM maintainers wiki that mentions it.

It's in the CI docs (linked from the main page too)

https://intel-gfx-ci.01.org/test-with.html

> >   and the merge requests for the
> > various UMD which uses new uapi.
> Is there a particular tag to use for this?

I think often just a link to the merge request in the cover letter.
Sometimes people also put the link in the uapi patch itself in the commit
message. Which I think would be best.
-Daniel



> 
> John.
> 
> >   Also as other mentioned, full uapi
> > kerneldoc is needed too. Please fill in any gaps in the existing docs
> > that relate to your addition directly (like we've e.g. done for the
> > extension chaining when adding lmem support).
> > 
> > Thanks, Daniel
> > 
> > > Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> > > ---
> > >   drivers/gpu/drm/i915/gt/intel_gt.c | 15 +++++++++++++++
> > >   drivers/gpu/drm/i915/gt/intel_gt.h |  1 +
> > >   drivers/gpu/drm/i915/i915_query.c  | 22 ++++++++++++++++++++++
> > >   drivers/gpu/drm/i915/i915_reg.h    |  1 +
> > >   include/uapi/drm/i915_drm.h        |  1 +
> > >   5 files changed, 40 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
> > > index 2161bf01ef8b..708bb3581d83 100644
> > > --- a/drivers/gpu/drm/i915/gt/intel_gt.c
> > > +++ b/drivers/gpu/drm/i915/gt/intel_gt.c
> > > @@ -704,3 +704,18 @@ void intel_gt_info_print(const struct intel_gt_info *info,
> > > 
> > >          intel_sseu_dump(&info->sseu, p);
> > >   }
> > > +
> > > +int intel_gt_get_l3bank_count(struct intel_gt *gt)
> > > +{
> > > +       struct drm_i915_private *i915 = gt->i915;
> > > +       intel_wakeref_t wakeref;
> > > +       u32 fuse3;
> > > +
> > > +       if (GRAPHICS_VER(i915) < 12)
> > > +               return -ENODEV;
> > > +
> > > +       with_intel_runtime_pm(gt->uncore->rpm, wakeref)
> > > +               fuse3 = intel_uncore_read(gt->uncore, GEN10_MIRROR_FUSE3);
> > > +
> > > +       return hweight32(REG_FIELD_GET(GEN12_GT_L3_MODE_MASK, ~fuse3));
> > > +}
> > > diff --git a/drivers/gpu/drm/i915/gt/intel_gt.h b/drivers/gpu/drm/i915/gt/intel_gt.h
> > > index 7ec395cace69..46aa1cf4cf30 100644
> > > --- a/drivers/gpu/drm/i915/gt/intel_gt.h
> > > +++ b/drivers/gpu/drm/i915/gt/intel_gt.h
> > > @@ -77,6 +77,7 @@ static inline bool intel_gt_is_wedged(const struct intel_gt *gt)
> > > 
> > >   void intel_gt_info_print(const struct intel_gt_info *info,
> > >                           struct drm_printer *p);
> > > +int intel_gt_get_l3bank_count(struct intel_gt *gt);
> > > 
> > >   void intel_gt_watchdog_work(struct work_struct *work);
> > > 
> > > diff --git a/drivers/gpu/drm/i915/i915_query.c b/drivers/gpu/drm/i915/i915_query.c
> > > index 96bd8fb3e895..0e92bb2d21b2 100644
> > > --- a/drivers/gpu/drm/i915/i915_query.c
> > > +++ b/drivers/gpu/drm/i915/i915_query.c
> > > @@ -10,6 +10,7 @@
> > >   #include "i915_perf.h"
> > >   #include "i915_query.h"
> > >   #include <uapi/drm/i915_drm.h>
> > > +#include "gt/intel_gt.h"
> > > 
> > >   static int copy_query_item(void *query_hdr, size_t query_sz,
> > >                             u32 total_length,
> > > @@ -502,6 +503,26 @@ static int query_hwconfig_table(struct drm_i915_private *i915,
> > >          return hwconfig->size;
> > >   }
> > > 
> > > +static int query_l3banks(struct drm_i915_private *i915,
> > > +                        struct drm_i915_query_item *query_item)
> > > +{
> > > +       u32 banks;
> > > +
> > > +       if (query_item->length == 0)
> > > +               return sizeof(banks);
> > > +
> > > +       if (query_item->length < sizeof(banks))
> > > +               return -EINVAL;
> > > +
> > > +       banks = intel_gt_get_l3bank_count(&i915->gt);
> > > +
> > > +       if (copy_to_user(u64_to_user_ptr(query_item->data_ptr),
> > > +                        &banks, sizeof(banks)))
> > > +               return -EFAULT;
> > > +
> > > +       return sizeof(banks);
> > > +}
> > > +
> > >   static int (* const i915_query_funcs[])(struct drm_i915_private *dev_priv,
> > >                                          struct drm_i915_query_item *query_item) = {
> > >          query_topology_info,
> > > @@ -509,6 +530,7 @@ static int (* const i915_query_funcs[])(struct drm_i915_private *dev_priv,
> > >          query_perf_config,
> > >          query_memregion_info,
> > >          query_hwconfig_table,
> > > +       query_l3banks,
> > >   };
> > > 
> > >   int i915_query_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> > > diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
> > > index eb13c601d680..e9ba88fe3db7 100644
> > > --- a/drivers/gpu/drm/i915/i915_reg.h
> > > +++ b/drivers/gpu/drm/i915/i915_reg.h
> > > @@ -3099,6 +3099,7 @@ static inline bool i915_mmio_reg_valid(i915_reg_t reg)
> > >   #define        GEN10_MIRROR_FUSE3              _MMIO(0x9118)
> > >   #define GEN10_L3BANK_PAIR_COUNT     4
> > >   #define GEN10_L3BANK_MASK   0x0F
> > > +#define GEN12_GT_L3_MODE_MASK 0xFF
> > > 
> > >   #define GEN8_EU_DISABLE0               _MMIO(0x9134)
> > >   #define   GEN8_EU_DIS0_S0_MASK         0xffffff
> > > diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
> > > index 87d369cae22a..20d18cca5066 100644
> > > --- a/include/uapi/drm/i915_drm.h
> > > +++ b/include/uapi/drm/i915_drm.h
> > > @@ -2234,6 +2234,7 @@ struct drm_i915_query_item {
> > >   #define DRM_I915_QUERY_PERF_CONFIG      3
> > >   #define DRM_I915_QUERY_MEMORY_REGIONS   4
> > >   #define DRM_I915_QUERY_HWCONFIG_TABLE   5
> > > +#define DRM_I915_QUERY_L3_BANK_COUNT    6
> > >   /* Must be kept compact -- no holes and well documented */
> > > 
> > >          /**
> > > --
> > > 2.25.1
> > > 
> > > _______________________________________________
> > > Intel-gfx mailing list
> > > Intel-gfx@lists.freedesktop.org
> > > https://lists.freedesktop.org/mailman/listinfo/intel-gfx
> > 
> > 
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
