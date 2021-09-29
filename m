Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E0F41C407
	for <lists+dri-devel@lfdr.de>; Wed, 29 Sep 2021 14:00:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB2176EA43;
	Wed, 29 Sep 2021 12:00:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5FE76EA45;
 Wed, 29 Sep 2021 12:00:28 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10121"; a="204410750"
X-IronPort-AV: E=Sophos;i="5.85,332,1624345200"; d="scan'208";a="204410750"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2021 05:00:28 -0700
X-IronPort-AV: E=Sophos;i="5.85,332,1624345200"; d="scan'208";a="538788801"
Received: from jmaugusx-mobl1.gar.corp.intel.com (HELO [10.249.254.159])
 ([10.249.254.159])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2021 05:00:26 -0700
Message-ID: <a459cbd914e8c71c78a61a7461449434655c96d3.camel@linux.intel.com>
Subject: Re: [PATCH v5 13/13] drm/i915/ttm: enable shmem tt backend
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Date: Wed, 29 Sep 2021 14:00:24 +0200
In-Reply-To: <20210927114114.152310-13-matthew.auld@intel.com>
References: <20210927114114.152310-1-matthew.auld@intel.com>
 <20210927114114.152310-13-matthew.auld@intel.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

On Mon, 2021-09-27 at 12:41 +0100, Matthew Auld wrote:
> Turn on the shmem tt backend, and enable shrinking.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> index 46d57541c0b2..4ae630fbc5cd 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> @@ -1093,6 +1093,7 @@ static u64 i915_ttm_mmap_offset(struct
> drm_i915_gem_object *obj)
>  
>  static const struct drm_i915_gem_object_ops i915_gem_ttm_obj_ops = {
>         .name = "i915_gem_object_ttm",
> +       .flags = I915_GEM_OBJECT_IS_SHRINKABLE,
>  
>         .get_pages = i915_ttm_get_pages,
>         .put_pages = i915_ttm_put_pages,

Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Now that BAT is running a DG1 again, it might be worth to give the
series a rerun. Perhaps with the "rework object initialization
slightly" as a HAX patch to unblock the mman + following selftest.

/Thomas


