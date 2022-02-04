Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF3A14A9733
	for <lists+dri-devel@lfdr.de>; Fri,  4 Feb 2022 10:56:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFAFA10F4EE;
	Fri,  4 Feb 2022 09:55:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [IPv6:2607:f8b0:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B7C110F326
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Feb 2022 09:55:54 +0000 (UTC)
Received: by mail-oi1-x236.google.com with SMTP id q8so7871331oiw.7
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Feb 2022 01:55:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XKzS8W1xn5TPR/GlDWZaU+1+deO1Y4moF0e2Mpo7pSc=;
 b=Quhh01JzKbHRUffBESOLWyjLlWbeB8i5pzjWt1A0s0XBHW5Zn5tCiuJr+DOZ6pW8j7
 c6aJdxi2/tB1DuG/CECXYiBEAwp5dmwfaojWNbEYBId9998PRQQk9mBBxRRGzUcFJffV
 V5QgWaQaSllFMy+gUIH0bhIjksEIs/0rhpNoI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XKzS8W1xn5TPR/GlDWZaU+1+deO1Y4moF0e2Mpo7pSc=;
 b=QwKV0shoxw5dAOmfqpE6WTdqURGi/SvBVEhI0efXKponr6gqkr9wHY2Jxl725M8cxt
 0EUUUq/g72pDuqugdAqclwQOn3fe692L/L8ajAPH6eyOl3t8LsoVj3SaRKFHJhLt+ExE
 Y6YFRAn1uXWM7FjZEk8ZZAYxW0/u6PQ+kwYBHrBNGjpBOmWgm3IITdE4EjWTNAaEn6mj
 hSTn15jCV0ep+hNnF0yIgw2BU1AOzyxNyAfaU/hHN14xHG7GDFrZzJR1ZtvzgVMhWBsD
 4sh6XyuzMEg73UpArGim6ZUsWUghcD1zmOzKSlzkS3ZhIIBQiC8tg6waXdP46CMC0jRm
 70qA==
X-Gm-Message-State: AOAM533PBbvcd2g9qZG/cIGp90ber9aXa+5Hcx4DuabuefztxtMx/YZz
 Y7/oI+3UNFdiKtCQguXSLvnORmnuU5vm4LHh4eLWwA==
X-Google-Smtp-Source: ABdhPJyyGFbAIV3np0sHoMK1CHrGfgBVuMM2vjz3bXO7jC4g0CeeO9r0SZ2xP7NzeorjPw/NwT5wUZHimnLGh0NSKio=
X-Received: by 2002:a05:6808:2221:: with SMTP id
 bd33mr930563oib.278.1643968553735; 
 Fri, 04 Feb 2022 01:55:53 -0800 (PST)
MIME-Version: 1.0
References: <20220119203541.2410082-1-John.C.Harrison@Intel.com>
 <20220119203541.2410082-3-John.C.Harrison@Intel.com>
In-Reply-To: <20220119203541.2410082-3-John.C.Harrison@Intel.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 4 Feb 2022 10:55:42 +0100
Message-ID: <CAKMK7uGijP097LzoNo=MtLHpu5a6fUj=XHP5+N6SmkW5c=9i9Q@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] drm/i915/uapi: Add query for hwconfig table
To: john.c.harrison@intel.com
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Kenneth Graunke <kenneth.w.graunke@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org,
 Slawomir Milczarek <slawomir.milczarek@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 19, 2022 at 9:35 PM <John.C.Harrison@intel.com> wrote:
>
> From: Rodrigo Vivi <rodrigo.vivi@intel.com>
>
> GuC contains a consolidated table with a bunch of information about the
> current device.
>
> Previously, this information was spread and hardcoded to all the components
> including GuC, i915 and various UMDs. The goal here is to consolidate
> the data into GuC in a way that all interested components can grab the
> very latest and synchronized information using a simple query.
>
> As per most of the other queries, this one can be called twice.
> Once with item.length=0 to determine the exact buffer size, then
> allocate the user memory and call it again for to retrieve the
> table data. For example:
>   struct drm_i915_query_item item = {
>     .query_id = DRM_I915_QUERY_HWCONCFIG_TABLE;
>   };
>   query.items_ptr = (int64_t) &item;
>   query.num_items = 1;
>
>   ioctl(fd, DRM_IOCTL_I915_QUERY, query, sizeof(query));
>
>   if (item.length <= 0)
>     return -ENOENT;
>
>   data = malloc(item.length);
>   item.data_ptr = (int64_t) &data;
>   ioctl(fd, DRM_IOCTL_I915_QUERY, query, sizeof(query));
>
>   // Parse the data as appropriate...
>
> The returned array is a simple and flexible KLV (Key/Length/Value)
> formatted table. For example, it could be just:
>   enum device_attr {
>      ATTR_SOME_VALUE = 0,
>      ATTR_SOME_MASK  = 1,
>   };
>
>   static const u32 hwconfig[] = {
>       ATTR_SOME_VALUE,
>       1,             // Value Length in DWords
>       8,             // Value
>
>       ATTR_SOME_MASK,
>       3,
>       0x00FFFFFFFF, 0xFFFFFFFF, 0xFF000000,
>   };
>
> The attribute ids are defined in a hardware spec.
>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> Cc: Kenneth Graunke <kenneth.w.graunke@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Slawomir Milczarek <slawomir.milczarek@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/i915/i915_query.c | 23 +++++++++++++++++++++++
>  include/uapi/drm/i915_drm.h       |  1 +
>  2 files changed, 24 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/i915_query.c b/drivers/gpu/drm/i915/i915_query.c
> index 2dfbc22857a3..609e64d5f395 100644
> --- a/drivers/gpu/drm/i915/i915_query.c
> +++ b/drivers/gpu/drm/i915/i915_query.c
> @@ -479,12 +479,35 @@ static int query_memregion_info(struct drm_i915_private *i915,
>         return total_length;
>  }
>
> +static int query_hwconfig_table(struct drm_i915_private *i915,
> +                               struct drm_i915_query_item *query_item)
> +{
> +       struct intel_gt *gt = to_gt(i915);
> +       struct intel_guc_hwconfig *hwconfig = &gt->uc.guc.hwconfig;
> +
> +       if (!hwconfig->size || !hwconfig->ptr)
> +               return -ENODEV;
> +
> +       if (query_item->length == 0)
> +               return hwconfig->size;
> +
> +       if (query_item->length < hwconfig->size)
> +               return -EINVAL;
> +
> +       if (copy_to_user(u64_to_user_ptr(query_item->data_ptr),
> +                        hwconfig->ptr, hwconfig->size))
> +               return -EFAULT;
> +
> +       return hwconfig->size;
> +}
> +
>  static int (* const i915_query_funcs[])(struct drm_i915_private *dev_priv,
>                                         struct drm_i915_query_item *query_item) = {
>         query_topology_info,
>         query_engine_info,
>         query_perf_config,
>         query_memregion_info,
> +       query_hwconfig_table,
>  };
>
>  int i915_query_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
> index 914ebd9290e5..132515199f27 100644
> --- a/include/uapi/drm/i915_drm.h
> +++ b/include/uapi/drm/i915_drm.h
> @@ -2685,6 +2685,7 @@ struct drm_i915_query_item {
>  #define DRM_I915_QUERY_ENGINE_INFO     2
>  #define DRM_I915_QUERY_PERF_CONFIG      3
>  #define DRM_I915_QUERY_MEMORY_REGIONS   4
> +#define DRM_I915_QUERY_HWCONFIG_TABLE   5
>  /* Must be kept compact -- no holes and well documented */

New uapi needs kerneldoc in the uapi header, and please fill in any
gaps you have (i.e. if the query uapi this is built on top of isn't
fully documented yet).

Also this holds across the board, so please keep in mind in patch review.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
