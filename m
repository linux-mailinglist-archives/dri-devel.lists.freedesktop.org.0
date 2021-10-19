Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA2AE433234
	for <lists+dri-devel@lfdr.de>; Tue, 19 Oct 2021 11:26:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CF286E139;
	Tue, 19 Oct 2021 09:26:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCFE86E138;
 Tue, 19 Oct 2021 09:26:42 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10141"; a="209263213"
X-IronPort-AV: E=Sophos;i="5.85,384,1624345200"; d="scan'208";a="209263213"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2021 02:26:42 -0700
X-IronPort-AV: E=Sophos;i="5.85,384,1624345200"; d="scan'208";a="574104083"
Received: from cdonoghx-mobl1.ger.corp.intel.com (HELO [10.213.194.99])
 ([10.213.194.99])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2021 02:26:39 -0700
Subject: Re: [PATCH] remove duplicate include in mock_region.c
To: cgel.zte@gmail.com, jani.nikula@linux.intel.com
Cc: joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
 airlied@linux.ie, daniel@ffwll.ch, thomas.hellstrom@linux.intel.com,
 chris@chris-wilson.co.uk, maarten.lankhorst@linux.intel.com,
 ran.jianping@zte.com.cn, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Zeal Robot <zealci@zte.com.cn>
References: <20211019090205.1003458-1-ran.jianping@zte.com.cn>
From: Matthew Auld <matthew.auld@intel.com>
Message-ID: <130dcbfd-ee6d-0d9a-602f-1aaca1229099@intel.com>
Date: Tue, 19 Oct 2021 10:26:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20211019090205.1003458-1-ran.jianping@zte.com.cn>
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

On 19/10/2021 10:02, cgel.zte@gmail.com wrote:
> From: Ran Jianping <ran.jianping@zte.com.cn>
> 
> 'drm/ttm/ttm_placement.h' included in
> 'drivers/gpu/drm/i915/selftests/mock_region.c' is duplicated.
> It is also included on the 9 line.
> 
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: Ran Jianping <ran.jianping@zte.com.cn>

Commit tile should ideally be prefixed with 'drm/i915:'.

Can fix up when pushing though. Thanks,
Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> ---
>   drivers/gpu/drm/i915/selftests/mock_region.c | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/selftests/mock_region.c b/drivers/gpu/drm/i915/selftests/mock_region.c
> index efa86dffe3c6..75793008c4ef 100644
> --- a/drivers/gpu/drm/i915/selftests/mock_region.c
> +++ b/drivers/gpu/drm/i915/selftests/mock_region.c
> @@ -6,8 +6,6 @@
>   #include <drm/ttm/ttm_placement.h>
>   #include <linux/scatterlist.h>
>   
> -#include <drm/ttm/ttm_placement.h>
> -
>   #include "gem/i915_gem_region.h"
>   #include "intel_memory_region.h"
>   #include "intel_region_ttm.h"
> 
