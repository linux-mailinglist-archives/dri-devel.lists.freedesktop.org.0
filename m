Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 67E5A6E0933
	for <lists+dri-devel@lfdr.de>; Thu, 13 Apr 2023 10:45:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C07CF10EA78;
	Thu, 13 Apr 2023 08:45:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DEC110EA74;
 Thu, 13 Apr 2023 08:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681375523; x=1712911523;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=F5PkYWMDzGQkvb18mYjjcwK7PyKR4t30hf5aKzG1AgM=;
 b=m/tK7PvIbBnkUAWEpeKVFi0mHzdfaee411x7+lv2zhkWQHl0ZLuqYopY
 vIMBBC+CjLgsQk52xuALUuzUDy9vxKYLu8nJsE/jGw0nvXPDJ1L/LC7GC
 M+4M4S69PmEwj53j+8Q6PT5rlB8KQzSrhyw+VFFtjtJvr5FPrshIXewNH
 pMuzw4MMjW+TS/Ucq7DkhitlI6swbMhMWzyOdVvx4W9CIUci0n6e9JGZq
 XK56qn1wpjSUsP+OunU6qmzGkIcMoFLxj+IbFnZSHa/U7V8sMqy79aCzd
 PIsyaJFPSZ04cN+Ao+m8Zgu/xD2AKglfsdSklFHC26E3Q0TyqrRcXFoCr g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="346807669"
X-IronPort-AV: E=Sophos;i="5.98,341,1673942400"; d="scan'208";a="346807669"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2023 01:45:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="666725820"
X-IronPort-AV: E=Sophos;i="5.98,341,1673942400"; d="scan'208";a="666725820"
Received: from zbiro-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.251.212.144])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2023 01:45:16 -0700
Date: Thu, 13 Apr 2023 10:44:50 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Cong Liu <liucong2@kylinos.cn>
Subject: Re: [PATCH] drm/i915: Fix memory leaks in i915 selftests
Message-ID: <ZDfBAs/RKfAljk4o@ashyti-mobl2.lan>
References: <874jpkckxw.fsf@intel.com>
 <20230413075526.221068-1-liucong2@kylinos.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230413075526.221068-1-liucong2@kylinos.cn>
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
Cc: matthew.brost@intel.com, tvrtko.ursulin@linux.intel.com, mchehab@kernel.org,
 andrzej.hajda@intel.com, intel-gfx@lists.freedesktop.org,
 jonathan.cavitt@intel.com, linux-kernel@vger.kernel.org,
 chris@chris-wilson.co.uk, rodrigo.vivi@intel.com, nirmoy.das@intel.com,
 dri-devel@lists.freedesktop.org, andi.shyti@linux.intel.com,
 gwan-gyeong.mun@intel.com, matthew.auld@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 13, 2023 at 03:55:26PM +0800, Cong Liu wrote:
> This patch fixes memory leaks on error escapes in function fake_get_pages
> 
> Fixes: c3bfba9a2225 ("drm/i915: Check for integer truncation on scatterlist creation")
> Signed-off-by: Cong Liu <liucong2@kylinos.cn>

OK, while I was proposing the adjustments suggested by Jani you
already replied to the e-mail. I will keep your version.

Anyway, next time, please, do not forget to add the r-b's, in
this case it was Andrzej's.

Andi

> ---
>  drivers/gpu/drm/i915/selftests/i915_gem_gtt.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c b/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
> index 5361ce70d3f2..154801f1c468 100644
> --- a/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
> +++ b/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
> @@ -69,8 +69,10 @@ static int fake_get_pages(struct drm_i915_gem_object *obj)
>  
>  	rem = round_up(obj->base.size, BIT(31)) >> 31;
>  	/* restricted by sg_alloc_table */
> -	if (overflows_type(rem, unsigned int))
> +	if (overflows_type(rem, unsigned int)) {
> +		kfree(pages);
>  		return -E2BIG;
> +	}
>  
>  	if (sg_alloc_table(pages, rem, GFP)) {
>  		kfree(pages);
> -- 
> 2.34.1
> 
> 
> No virus found
> 		Checked by Hillstone Network AntiVirus
