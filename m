Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E737B554303
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 08:53:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00216113B12;
	Wed, 22 Jun 2022 06:53:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53BA2113B12;
 Wed, 22 Jun 2022 06:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655880789; x=1687416789;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ABLekP1DeJgDEsR/LSwop4OZSr2BAo0sZd/g3m629qA=;
 b=jlwr/PO1toXzJjzNVWRYJXuBxgaHFXjyfB53TZI1Kt5BvC9KvmQzpoFh
 GD8fDp1wYlDzQYZ99Jr12zrmd4LyK5BOb20InCVa+Jphi13xJcar68HLC
 Q+J1S5hqMylAAwobA75BXMUG8AVPtOJz/j+2A5CeGr/5UtrbHFYUs4RV7
 CKJJ1K5U86CEOtx5a7qQRS+n82aeR2l/sCJuC8W2mwgAFxOcOg/OLTjQu
 X/xQ89ydGz7yuZ5KTWw2Qj9MqNKSsvXvJSbWaVn8XKgqalsA1r36PzbM6
 jQYn7q+lr0VYgQTOJ7GwFb/YAhz9JsebS3IsM0X8SAN1PpHrY5dD+hCtZ A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10385"; a="269052338"
X-IronPort-AV: E=Sophos;i="5.92,211,1650956400"; d="scan'208";a="269052338"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2022 23:53:08 -0700
X-IronPort-AV: E=Sophos;i="5.92,211,1650956400"; d="scan'208";a="615039874"
Received: from ebrazil-mobl1.amr.corp.intel.com (HELO [10.213.200.60])
 ([10.213.200.60])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2022 23:53:06 -0700
Message-ID: <529b043a-e6af-cd1c-c6b8-a7778c2799d0@linux.intel.com>
Date: Wed, 22 Jun 2022 07:53:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] drm/i915: Fix spelling typo in comment
Content-Language: en-US
To: 1064094935@qq.com, Jani Nikula <jani.nikula@linux.intel.com>
References: <tencent_7B226C4A9BC2B5EEB37B70C188B5015D290A@qq.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <tencent_7B226C4A9BC2B5EEB37B70C188B5015D290A@qq.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, pengfuyuan <pengfuyuan@kylinos.cn>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, k2ci <kernel-bot@kylinos.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 16/06/2022 08:08, 1064094935@qq.com wrote:
> From: pengfuyuan <pengfuyuan@kylinos.cn>
> 
> Fix spelling typo in comment.
> 
> Reported-by: k2ci <kernel-bot@kylinos.cn>
> Signed-off-by: pengfuyuan <pengfuyuan@kylinos.cn>
> ---
>   drivers/gpu/drm/i915/gem/i915_gem_tiling.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_tiling.c b/drivers/gpu/drm/i915/gem/i915_gem_tiling.c
> index 80ac0db1ae8c..85518b28cd72 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_tiling.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_tiling.c
> @@ -114,7 +114,7 @@ u32 i915_gem_fence_alignment(struct drm_i915_private *i915, u32 size,
>   	return i915_gem_fence_size(i915, size, tiling, stride);
>   }
>   
> -/* Check pitch constriants for all chips & tiling formats */
> +/* Check pitch constraints for all chips & tiling formats */
>   static bool
>   i915_tiling_ok(struct drm_i915_gem_object *obj,
>   	       unsigned int tiling, unsigned int stride)

Merged to drm-intel-gt-next - thanks for the patch!

Regards,

Tvrtko
