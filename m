Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EBD357CB6C
	for <lists+dri-devel@lfdr.de>; Thu, 21 Jul 2022 15:08:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95BE710FD00;
	Thu, 21 Jul 2022 13:08:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A61610FCBE;
 Thu, 21 Jul 2022 13:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658408911; x=1689944911;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=2uKZEJQsehXBmfegRTdLkR14GGknjRcpexMkOtCqVKw=;
 b=T84lUyfWQXsSdUGWypow4aThvKTaEZHEm1txrWW3vkiliE5dZycEgJFt
 ybSOFDIL96k5Rrf0tJ+h/7U1t3EQofE+5bYFUkIhcsKzV9PgzwEbxeQAK
 mSacQ8iJhcFIitxhDQYQWElb0TVOeui89XroOo1sAfUKpR7nAMH6B1lak
 ivTjA2v1vdcy3Snth6oYtVVAWsUtdotV3kaK8ghLx97gTrp08oKUzy4rO
 P0CuMpHDH/dTTXkVDLx5SZet1cFg/eAauda4jr0mb5sbBHp4fQ9pbGdHF
 kH3Jms5A3uW3ruOI87ywSgtya/YROhEbzA96nx7DbGmnKCm1X3RKaiCmR g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10414"; a="284595048"
X-IronPort-AV: E=Sophos;i="5.92,289,1650956400"; d="scan'208";a="284595048"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2022 06:08:30 -0700
X-IronPort-AV: E=Sophos;i="5.92,289,1650956400"; d="scan'208";a="656735336"
Received: from mstrobel-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.251.210.203])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2022 06:08:26 -0700
Date: Thu, 21 Jul 2022 15:08:20 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Jason Wang <wangborong@cdjrlc.com>
Subject: Re: [PATCH] drm/i915/selftests: Fix comment typo
Message-ID: <YtlPxPZ/BWATWL1J@alfio.lan>
References: <20220716040520.31676-1-wangborong@cdjrlc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220716040520.31676-1-wangborong@cdjrlc.com>
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
Cc: matthew.brost@intel.com, tvrtko.ursulin@linux.intel.com,
 michal.winiarski@intel.com, andi.shyti@linux.intel.com, airlied@linux.ie,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, rodrigo.vivi@intel.com, zhou1615@umn.edu,
 John.C.Harrison@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jason,

On Sat, Jul 16, 2022 at 12:05:20PM +0800, Jason Wang wrote:
> Fix the double `wait' typo in comment.
> 
> Signed-off-by: Jason Wang <wangborong@cdjrlc.com>

Few warnings for this patch:

 1. you missed Rodrigo's r-b tag.
 2. please add a counter to your patch, this would be [PATCH v2]
 3. please add a changelog, as this is a single patch, do it
    after the '---'

No need to resend, just keep the three notes in mind for your
next patches. Anyway, thanks for the fix and as I am at it:

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi

> ---
>  drivers/gpu/drm/i915/selftests/i915_request.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/selftests/i915_request.c b/drivers/gpu/drm/i915/selftests/i915_request.c
> index c56a0c2cd2f7..ec05f578a698 100644
> --- a/drivers/gpu/drm/i915/selftests/i915_request.c
> +++ b/drivers/gpu/drm/i915/selftests/i915_request.c
> @@ -971,7 +971,7 @@ static struct i915_vma *empty_batch(struct drm_i915_private *i915)
>  	if (err)
>  		goto err;
>  
> -	/* Force the wait wait now to avoid including it in the benchmark */
> +	/* Force the wait now to avoid including it in the benchmark */
>  	err = i915_vma_sync(vma);
>  	if (err)
>  		goto err_pin;
> -- 
> 2.35.1
