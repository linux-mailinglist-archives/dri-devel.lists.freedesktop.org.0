Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C60CE434694
	for <lists+dri-devel@lfdr.de>; Wed, 20 Oct 2021 10:12:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAB6C6E20F;
	Wed, 20 Oct 2021 08:12:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CF596E20F;
 Wed, 20 Oct 2021 08:12:13 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10142"; a="215643948"
X-IronPort-AV: E=Sophos;i="5.87,166,1631602800"; d="scan'208";a="215643948"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2021 01:12:13 -0700
X-IronPort-AV: E=Sophos;i="5.87,166,1631602800"; d="scan'208";a="444856117"
Received: from jbellfah-mobl.ger.corp.intel.com (HELO [10.252.29.183])
 ([10.252.29.183])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2021 01:12:10 -0700
Subject: Re: drm/i915: remove duplicate include in mock_region.c
To: Ran Jianping <cgel.zte@gmail.com>
Cc: airlied@linux.ie, chris@chris-wilson.co.uk, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 linux-kernel@vger.kernel.org, maarten.lankhorst@linux.intel.com,
 ran.jianping@zte.com.cn, rodrigo.vivi@intel.com,
 thomas.hellstrom@linux.intel.com, zealci@zte.com.cn
References: <130dcbfd-ee6d-0d9a-602f-1aaca1229099@intel.com>
 <20211020080401.1037442-1-ran.jianping@zte.com.cn>
From: Matthew Auld <matthew.auld@intel.com>
Message-ID: <269d8cad-1379-ec7c-21f3-d73b7be1ec70@intel.com>
Date: Wed, 20 Oct 2021 09:12:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20211020080401.1037442-1-ran.jianping@zte.com.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
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

On 20/10/2021 09:04, Ran Jianping wrote:
> From: ran jianping <ran.jianping@zte.com.cn>
> 
> 'drm/ttm/ttm_placement.h' included in
> 'drivers/gpu/drm/i915/selftests/mock_region.c' is duplicated.
> It is also included on the 9 line.
> 
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: ran jianping <ran.jianping@zte.com.cn>

Pushed to drm-intel-gt-next. Thanks.

> ---
>   drivers/gpu/drm/i915/selftests/mock_region.c | 2 --
>   1 file changed, 2 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/selftests/mock_region.c b/drivers/gpu/drm/i915/selftests/mock_region.c
> index efa86dffe3c6..b6747b3eeac5 100644
> --- a/drivers/gpu/drm/i915/selftests/mock_region.c
> +++ b/drivers/gpu/drm/i915/selftests/mock_region.c
> @@ -6,7 +6,5 @@
>   #include <drm/ttm/ttm_placement.h>
>   #include <linux/scatterlist.h>
>   
> -#include <drm/ttm/ttm_placement.h>
> -
>   #include "gem/i915_gem_region.h"
>   #include "intel_memory_region.h"
> 
