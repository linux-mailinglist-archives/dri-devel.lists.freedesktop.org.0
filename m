Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77AD9467CA9
	for <lists+dri-devel@lfdr.de>; Fri,  3 Dec 2021 18:37:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7249A7B032;
	Fri,  3 Dec 2021 17:37:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01E797B02B;
 Fri,  3 Dec 2021 17:37:13 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10187"; a="217039842"
X-IronPort-AV: E=Sophos;i="5.87,284,1631602800"; d="scan'208";a="217039842"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2021 09:36:59 -0800
X-IronPort-AV: E=Sophos;i="5.87,284,1631602800"; d="scan'208";a="610483286"
Received: from ramaling-i9x.iind.intel.com (HELO intel.com) ([10.99.66.205])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2021 09:36:56 -0800
Date: Fri, 3 Dec 2021 23:10:12 +0530
From: Ramalingam C <ramalingam.c@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH v2 6/8] drm/i915/selftests: handle object rounding
Message-ID: <20211203174012.GD27873@intel.com>
References: <20211203122426.2859679-1-matthew.auld@intel.com>
 <20211203122426.2859679-7-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211203122426.2859679-7-matthew.auld@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: bob.beckett@collabora.com,
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, adrian.larumbe@collabora.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-12-03 at 12:24:24 +0000, Matthew Auld wrote:
> Ensure we account for any object rounding due to min_page_size
> restrictions.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>

Reviewed-by: Ramalingam C <ramalingam.c@intel.com>

> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Ramalingam C <ramalingam.c@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/selftest_migrate.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/i915/gt/selftest_migrate.c b/drivers/gpu/drm/i915/gt/selftest_migrate.c
> index 12ef2837c89b..e21787301bbd 100644
> --- a/drivers/gpu/drm/i915/gt/selftest_migrate.c
> +++ b/drivers/gpu/drm/i915/gt/selftest_migrate.c
> @@ -49,6 +49,7 @@ static int copy(struct intel_migrate *migrate,
>  	if (IS_ERR(src))
>  		return 0;
>  
> +	sz = src->base.size;
>  	dst = i915_gem_object_create_internal(i915, sz);
>  	if (IS_ERR(dst))
>  		goto err_free_src;
> -- 
> 2.31.1
> 
