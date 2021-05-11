Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 52D9737AAAB
	for <lists+dri-devel@lfdr.de>; Tue, 11 May 2021 17:26:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADB0E6E5A4;
	Tue, 11 May 2021 15:26:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A1DD6EA61
 for <dri-devel@lists.freedesktop.org>; Tue, 11 May 2021 15:26:39 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id n25so23371425edr.5
 for <dri-devel@lists.freedesktop.org>; Tue, 11 May 2021 08:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=z2gZjvSOTXDU944K6vlW6l06lrj/UkAqPlYr48UaT6c=;
 b=QtCrYiUWYmdb3iE3bn6RAaVUjfNGhVNl6hJsy71IFzJptsiSxHAxJiIuaCPcqcpJJG
 G4DWvAXeQDs/8zKqq5QR4geJokicTIb1WW/8L1ZBgkyFPm9teowuInMNJPR2hn9rkvSI
 +M2fhcoBTkf3zt3VK1s9naRn1sBHygvN4qOfY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=z2gZjvSOTXDU944K6vlW6l06lrj/UkAqPlYr48UaT6c=;
 b=b/R087kdNMFPNu4DW+u6LUnIOOkJjHBOCf59rupFdI7YXQOrxc7Hys0eUNzJrv5D5d
 GhJ0kK5g6CSw5d1t7nfS0dG45AznuhUTWyJMNkphOkAXDwV3HrwptqDYb8hv7O2kSTY3
 3MAia0+jrwrs7nfv2WzMWw2lRuTYlQHZdLkAiaXHt/0KWXX1oSKn/bIEA3yVG82vDmwP
 AnxpWDDv2Nde70jQvyxNTVE11ep6a77KsHYcxEWhEVGHClZcd37hWh25WsmRXXH6uarn
 F50QIzejlxwsa7uZN7YHMbCvdw1I5ThJiQV1L7uw6JZP1sRaTrbhTAjpSqaiUV8lKZ1v
 kmPQ==
X-Gm-Message-State: AOAM531zT7IgLRJqTaNsbtbUr6EWG1cS5cbkvFgnJL1zkMPQipNiQ/Uj
 SG/YAy9SP/OdhitffpTc7XhwMw==
X-Google-Smtp-Source: ABdhPJy4dMrE1QWXRUelKWAqF7U7Liw5lXDlUdNG7VlRjbMs4H9WX7AnSpw7ySq1CJtw0iLsedlBbw==
X-Received: by 2002:a05:6402:3585:: with SMTP id
 y5mr37018503edc.233.1620746797756; 
 Tue, 11 May 2021 08:26:37 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id v23sm14894814eda.8.2021.05.11.08.26.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 May 2021 08:26:37 -0700 (PDT)
Date: Tue, 11 May 2021 17:26:34 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Matthew Brost <matthew.brost@intel.com>
Subject: Re: [RFC PATCH 43/97] drm/i915/guc: Add lrc descriptor context
 lookup array
Message-ID: <YJqiKksSqBpUDvPJ@phenom.ffwll.local>
References: <20210506191451.77768-1-matthew.brost@intel.com>
 <20210506191451.77768-44-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210506191451.77768-44-matthew.brost@intel.com>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
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
Cc: tvrtko.ursulin@intel.com, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, jason.ekstrand@intel.com,
 daniele.ceraolospurio@intel.com, jon.bloomfield@intel.com,
 daniel.vetter@intel.com, john.c.harrison@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 06, 2021 at 12:13:57PM -0700, Matthew Brost wrote:
> Add lrc descriptor context lookup array which can resolve the
> intel_context from the lrc descriptor index. In addition to lookup, it
> can determine in the lrc descriptor context is currently registered with
> the GuC by checking if an entry for a descriptor index is present.
> Future patches in the series will make use of this array.
> 
> Cc: John Harrison <john.c.harrison@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/uc/intel_guc.h        |  5 +++
>  .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 32 +++++++++++++++++--
>  2 files changed, 35 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> index d84f37afb9d8..2eb6c497e43c 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> @@ -6,6 +6,8 @@
>  #ifndef _INTEL_GUC_H_
>  #define _INTEL_GUC_H_
>  
> +#include "linux/xarray.h"
> +
>  #include "intel_uncore.h"
>  #include "intel_guc_fw.h"
>  #include "intel_guc_fwif.h"
> @@ -47,6 +49,9 @@ struct intel_guc {
>  	struct i915_vma *lrc_desc_pool;
>  	void *lrc_desc_pool_vaddr;
>  
> +	/* guc_id to intel_context lookup */
> +	struct xarray context_lookup;

The current code sets a disastrous example, but for stuff like this it's
always good to explain the locking, and who's holding references and how
you're handling cycles. Since I guess the intel_context also holds the
guc_id alive somehow.

Again holds for the entire series, where it makes sense (as in we don't
expect to rewrite the entire code anyway).
-Daniel

> +
>  	/* Control params for fw initialization */
>  	u32 params[GUC_CTL_MAX_DWORDS];
>  
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 6acc1ef34f92..c2b6d27404b7 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -65,8 +65,6 @@ static inline struct i915_priolist *to_priolist(struct rb_node *rb)
>  	return rb_entry(rb, struct i915_priolist, node);
>  }
>  
> -/* Future patches will use this function */
> -__attribute__ ((unused))
>  static struct guc_lrc_desc *__get_lrc_desc(struct intel_guc *guc, u32 index)
>  {
>  	struct guc_lrc_desc *base = guc->lrc_desc_pool_vaddr;
> @@ -76,6 +74,15 @@ static struct guc_lrc_desc *__get_lrc_desc(struct intel_guc *guc, u32 index)
>  	return &base[index];
>  }
>  
> +static inline struct intel_context *__get_context(struct intel_guc *guc, u32 id)
> +{
> +	struct intel_context *ce = xa_load(&guc->context_lookup, id);
> +
> +	GEM_BUG_ON(id >= GUC_MAX_LRC_DESCRIPTORS);
> +
> +	return ce;
> +}
> +
>  static int guc_lrc_desc_pool_create(struct intel_guc *guc)
>  {
>  	u32 size;
> @@ -96,6 +103,25 @@ static void guc_lrc_desc_pool_destroy(struct intel_guc *guc)
>  	i915_vma_unpin_and_release(&guc->lrc_desc_pool, I915_VMA_RELEASE_MAP);
>  }
>  
> +static inline void reset_lrc_desc(struct intel_guc *guc, u32 id)
> +{
> +	struct guc_lrc_desc *desc = __get_lrc_desc(guc, id);
> +
> +	memset(desc, 0, sizeof(*desc));
> +	xa_erase_irq(&guc->context_lookup, id);
> +}
> +
> +static inline bool lrc_desc_registered(struct intel_guc *guc, u32 id)
> +{
> +	return __get_context(guc, id);
> +}
> +
> +static inline void set_lrc_desc_registered(struct intel_guc *guc, u32 id,
> +					   struct intel_context *ce)
> +{
> +	xa_store_irq(&guc->context_lookup, id, ce, GFP_ATOMIC);
> +}
> +
>  static void guc_add_request(struct intel_guc *guc, struct i915_request *rq)
>  {
>  	/* Leaving stub as this function will be used in future patches */
> @@ -404,6 +430,8 @@ int intel_guc_submission_init(struct intel_guc *guc)
>  	 */
>  	GEM_BUG_ON(!guc->lrc_desc_pool);
>  
> +	xa_init_flags(&guc->context_lookup, XA_FLAGS_LOCK_IRQ);
> +
>  	return 0;
>  }
>  
> -- 
> 2.28.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
