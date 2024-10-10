Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D432998969
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2024 16:26:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C98110E938;
	Thu, 10 Oct 2024 14:26:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fJqnlGyJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4402210E934;
 Thu, 10 Oct 2024 14:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728570390; x=1760106390;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=SfaVrHsyRDiiNLTeKYLLQ7EMDgSXlFmjaaTR7pxwo8Y=;
 b=fJqnlGyJdDTH/jreRiBpj/v0bZzUyF4Cvb+gmt09E93+EOgktbiWMB4P
 OIVNfzjtQxD9RhT/XpmJY/iJUBNDZS0+QxQ/XU/PANRl9U/y3x77/u1vQ
 CgN+N7x5z+bcVsphpWiQSrQjN+pXnQJMBB1EIsggLdzJKr73iZt1P1x2Z
 /hQ34f/Ie4jA82io1vGoDyrQ0gKXXdkOd+t+AQLUfjEP0NdxBSZhhxR2l
 yOMqLi2k1IxYm25MMYNymDEbp3LlhLnqYVTm4aAOy7zz0EO49iPJOL/SV
 qMM9G8PfRPm5EkwKjgymOQYqGX4AAOwPnJBHpOZEwgtEJ0t5D983mElTg g==;
X-CSE-ConnectionGUID: bgUpjIG0R7GA6kyYzhagag==
X-CSE-MsgGUID: E4wyEeUVQm233P6HtOwrlg==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="39321544"
X-IronPort-AV: E=Sophos;i="6.11,193,1725346800"; d="scan'208";a="39321544"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2024 07:26:29 -0700
X-CSE-ConnectionGUID: 1qrtrVVuQaanVQ2qc+zrrA==
X-CSE-MsgGUID: IYfkZglOQaGiQII4PHs77Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,193,1725346800"; d="scan'208";a="76928468"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.245.160.182])
 ([10.245.160.182])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2024 07:26:27 -0700
Message-ID: <2dc60e45-7a9d-4fcf-acc1-43e5dcd7ce04@linux.intel.com>
Date: Thu, 10 Oct 2024 16:26:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/ttm: Fix incorrect use of kernel-doc format
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Stephen Rothwell <sfr@canb.auug.org.au>
References: <20241010124545.82023-1-thomas.hellstrom@linux.intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20241010124545.82023-1-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
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


On 10/10/2024 2:45 PM, Thomas Hellström wrote:
> Add a missing colon.
>
> Cc: dri-devel@lists.freedesktop.org
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Closes: https://lore.kernel.org/linux-next/20241010160942.192caf60@canb.auug.org.au/
> Fixes: fc5d96670eb2 ("drm/ttm: Move swapped objects off the manager's LRU list")
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>  include/drm/ttm/ttm_device.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/drm/ttm/ttm_device.h b/include/drm/ttm/ttm_device.h
> index 438358f72716..39b8636b1845 100644
> --- a/include/drm/ttm/ttm_device.h
> +++ b/include/drm/ttm/ttm_device.h
> @@ -252,7 +252,7 @@ struct ttm_device {
>  	spinlock_t lru_lock;
>  
>  	/**
> -	 * @unevictable Buffer objects which are pinned or swapped and as such
> +	 * @unevictable: Buffer objects which are pinned or swapped and as such
>  	 * not on an LRU list.
>  	 */
>  	struct list_head unevictable;
