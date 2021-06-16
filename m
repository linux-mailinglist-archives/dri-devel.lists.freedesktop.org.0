Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8761C3A9736
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jun 2021 12:25:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13DB1899D4;
	Wed, 16 Jun 2021 10:25:18 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 804C16E09A
 for <DRI-Devel@lists.freedesktop.org>; Wed, 16 Jun 2021 10:25:16 +0000 (UTC)
Received: by mail-ot1-x330.google.com with SMTP id
 5-20020a9d01050000b02903c700c45721so1980905otu.6
 for <DRI-Devel@lists.freedesktop.org>; Wed, 16 Jun 2021 03:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0jUF6vczkVAJdRgKZwAxHhYyT8EqRuSqu1cpD+OKfJ8=;
 b=QB8f4vOT1o9pB/Ka5GlgK2RSyUWpM3xOcoGSH0urELmwOcvE9gxq9Bs6SkgBApCksF
 plpUbYGVVKC9yoSVS0VdrymPpRlK/Yoiuz4n8NAkp4NsiG0j22IRe2ZP/tLapLzfHkak
 kMaRHQfO1E5R17JRRhNB3IRZAfZVNi10gQ+P8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0jUF6vczkVAJdRgKZwAxHhYyT8EqRuSqu1cpD+OKfJ8=;
 b=I/lx0rqXdcvUpLdzjdMkVbwtbPFL9qgzQGhit8xeK9SOy8gHLrSWPzxjLHTeAtKnnv
 4HOOD25jnhkwwgeq3mMtHrxob1ombxq903IaImNaVJpfcGVhPbQSBovLZoi8nu6boRGp
 Tu86pSvca5qkE4Mw2J6GgFVwB4ZT+vVPImLxFgGWq9Vc6X6nbTjKCdbn0+X07OHMn5rA
 gBykRe+tg4ewUYdLlhfAlPOimQoyCJ2rcXrOJLZ+6Hw3lo129HzuZuzvinxPvQSFFNIx
 X3qB+WLXrFbOLSff+Qyto2kIJv7XNeRSA4hz83GFube9mvwz0GJsSE2X0PgLKVyUK85q
 n8Nw==
X-Gm-Message-State: AOAM532ikU1aGYu958s6gCjObCFNTNzJYAtwAdm4LO390EpGCsX5XkUQ
 I9rRvmvl+CPeATUyHHPkb4edh1LV0lt/sDuiKEyUPQ==
X-Google-Smtp-Source: ABdhPJx1f5VEC37QhV1o7Mh/1Tg3T6ecwGKhYxMEyQsOCriyGSHipcKpl2tAZm9jXrW+ADneYUExlq4exxx2BwxiXtg=
X-Received: by 2002:a9d:12eb:: with SMTP id g98mr3314343otg.303.1623839115588; 
 Wed, 16 Jun 2021 03:25:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210610204626.2995262-1-John.C.Harrison@Intel.com>
 <20210610204626.2995262-4-John.C.Harrison@Intel.com>
In-Reply-To: <20210610204626.2995262-4-John.C.Harrison@Intel.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 16 Jun 2021 12:25:04 +0200
Message-ID: <CAKMK7uGO8U9a8yq73MV=xSbTA+tCQi5nqiZSD9Hwbi==fZ=R5A@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 3/3] drm/i915/uapi: Add query for L3 bank count
To: John Harrison <John.C.Harrison@intel.com>
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
Cc: intel-gfx <Intel-GFX@lists.freedesktop.org>,
 dri-devel <DRI-Devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 10, 2021 at 10:46 PM <John.C.Harrison@intel.com> wrote:
>
> From: John Harrison <John.C.Harrison@Intel.com>
>
> Various UMDs need to know the L3 bank count. So add a query API for it.

Please link to both the igt test submission for this (there's not even
a Test-with: on the cover letter) and the merge requests for the
various UMD which uses new uapi. Also as other mentioned, full uapi
kerneldoc is needed too. Please fill in any gaps in the existing docs
that relate to your addition directly (like we've e.g. done for the
extension chaining when adding lmem support).

Thanks, Daniel

>
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_gt.c | 15 +++++++++++++++
>  drivers/gpu/drm/i915/gt/intel_gt.h |  1 +
>  drivers/gpu/drm/i915/i915_query.c  | 22 ++++++++++++++++++++++
>  drivers/gpu/drm/i915/i915_reg.h    |  1 +
>  include/uapi/drm/i915_drm.h        |  1 +
>  5 files changed, 40 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
> index 2161bf01ef8b..708bb3581d83 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt.c
> @@ -704,3 +704,18 @@ void intel_gt_info_print(const struct intel_gt_info *info,
>
>         intel_sseu_dump(&info->sseu, p);
>  }
> +
> +int intel_gt_get_l3bank_count(struct intel_gt *gt)
> +{
> +       struct drm_i915_private *i915 = gt->i915;
> +       intel_wakeref_t wakeref;
> +       u32 fuse3;
> +
> +       if (GRAPHICS_VER(i915) < 12)
> +               return -ENODEV;
> +
> +       with_intel_runtime_pm(gt->uncore->rpm, wakeref)
> +               fuse3 = intel_uncore_read(gt->uncore, GEN10_MIRROR_FUSE3);
> +
> +       return hweight32(REG_FIELD_GET(GEN12_GT_L3_MODE_MASK, ~fuse3));
> +}
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.h b/drivers/gpu/drm/i915/gt/intel_gt.h
> index 7ec395cace69..46aa1cf4cf30 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt.h
> @@ -77,6 +77,7 @@ static inline bool intel_gt_is_wedged(const struct intel_gt *gt)
>
>  void intel_gt_info_print(const struct intel_gt_info *info,
>                          struct drm_printer *p);
> +int intel_gt_get_l3bank_count(struct intel_gt *gt);
>
>  void intel_gt_watchdog_work(struct work_struct *work);
>
> diff --git a/drivers/gpu/drm/i915/i915_query.c b/drivers/gpu/drm/i915/i915_query.c
> index 96bd8fb3e895..0e92bb2d21b2 100644
> --- a/drivers/gpu/drm/i915/i915_query.c
> +++ b/drivers/gpu/drm/i915/i915_query.c
> @@ -10,6 +10,7 @@
>  #include "i915_perf.h"
>  #include "i915_query.h"
>  #include <uapi/drm/i915_drm.h>
> +#include "gt/intel_gt.h"
>
>  static int copy_query_item(void *query_hdr, size_t query_sz,
>                            u32 total_length,
> @@ -502,6 +503,26 @@ static int query_hwconfig_table(struct drm_i915_private *i915,
>         return hwconfig->size;
>  }
>
> +static int query_l3banks(struct drm_i915_private *i915,
> +                        struct drm_i915_query_item *query_item)
> +{
> +       u32 banks;
> +
> +       if (query_item->length == 0)
> +               return sizeof(banks);
> +
> +       if (query_item->length < sizeof(banks))
> +               return -EINVAL;
> +
> +       banks = intel_gt_get_l3bank_count(&i915->gt);
> +
> +       if (copy_to_user(u64_to_user_ptr(query_item->data_ptr),
> +                        &banks, sizeof(banks)))
> +               return -EFAULT;
> +
> +       return sizeof(banks);
> +}
> +
>  static int (* const i915_query_funcs[])(struct drm_i915_private *dev_priv,
>                                         struct drm_i915_query_item *query_item) = {
>         query_topology_info,
> @@ -509,6 +530,7 @@ static int (* const i915_query_funcs[])(struct drm_i915_private *dev_priv,
>         query_perf_config,
>         query_memregion_info,
>         query_hwconfig_table,
> +       query_l3banks,
>  };
>
>  int i915_query_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
> index eb13c601d680..e9ba88fe3db7 100644
> --- a/drivers/gpu/drm/i915/i915_reg.h
> +++ b/drivers/gpu/drm/i915/i915_reg.h
> @@ -3099,6 +3099,7 @@ static inline bool i915_mmio_reg_valid(i915_reg_t reg)
>  #define        GEN10_MIRROR_FUSE3              _MMIO(0x9118)
>  #define GEN10_L3BANK_PAIR_COUNT     4
>  #define GEN10_L3BANK_MASK   0x0F
> +#define GEN12_GT_L3_MODE_MASK 0xFF
>
>  #define GEN8_EU_DISABLE0               _MMIO(0x9134)
>  #define   GEN8_EU_DIS0_S0_MASK         0xffffff
> diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
> index 87d369cae22a..20d18cca5066 100644
> --- a/include/uapi/drm/i915_drm.h
> +++ b/include/uapi/drm/i915_drm.h
> @@ -2234,6 +2234,7 @@ struct drm_i915_query_item {
>  #define DRM_I915_QUERY_PERF_CONFIG      3
>  #define DRM_I915_QUERY_MEMORY_REGIONS   4
>  #define DRM_I915_QUERY_HWCONFIG_TABLE   5
> +#define DRM_I915_QUERY_L3_BANK_COUNT    6
>  /* Must be kept compact -- no holes and well documented */
>
>         /**
> --
> 2.25.1
>
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
