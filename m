Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 01B5E732910
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jun 2023 09:39:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E169A10E5C2;
	Fri, 16 Jun 2023 07:39:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6212310E5C1;
 Fri, 16 Jun 2023 07:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686901188; x=1718437188;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=zR/q57BnaqCgd/85u6YxIJpWBkIsG+pQaZNyG6A2gJQ=;
 b=lEbc7iZpWGH61zPhtXWk7i8SiLLVFaS/7stNG8kDidFQlk6/YumJSgrb
 DNDxN/SUdwlR5w4jvNYAD8Z1IQOUYl5OiUauPqzq618OQ0My+rsEpqv+S
 khpDlUVwIoSsrKPbx+IoBuKGXO5nTqYcpUxs0RIXTd9gudcjk7sLuMiS9
 sUEQQ2CN4pe3l0WnpMwGiZhL7NSg7S8KmUEeXQfOGz3BkrzMgFcbfrLlf
 1cgMU99UYVG2XwC5tDDpMmsW8IEUJ/zcyTjiVLSiO0+Ne2wSXNGkk7GNB
 PngkIfjeyfU1Yd0uRIvQufsMaBjX7ERM/ctve/DcPL/HOY6nk5el5hZCE Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="359157210"
X-IronPort-AV: E=Sophos;i="6.00,246,1681196400"; d="scan'208";a="359157210"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2023 00:39:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="825643779"
X-IronPort-AV: E=Sophos;i="6.00,246,1681196400"; d="scan'208";a="825643779"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.252.62.27])
 ([10.252.62.27])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2023 00:39:46 -0700
Message-ID: <02e78707-5266-16d1-3dbf-b1d5aab87e51@linux.intel.com>
Date: Fri, 16 Jun 2023 09:39:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [Intel-gfx] [PATCH] Remove incorrect hard coded cache coherrency
 setting
To: Zhanjun Dong <zhanjun.dong@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20230615224343.965937-1-zhanjun.dong@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20230615224343.965937-1-zhanjun.dong@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

Hi Zhanjun,

Patch subject should specify component. In this case it should be

drm/i915/gt:  Remove incorrect hard coded cache coherency setting

On 6/16/2023 12:43 AM, Zhanjun Dong wrote:
> The previouse i915_gem_object_create_internal already set it with proper value before function return. This hard coded setting is incorrect for platforms like MTL, thus need to be removed.


This needs to be wrapped. Try ./scripts/checkpatch.pl on the patch to  
find out more.

Otherwise It makes sense to remove that line.

Thanks,

Nirmoy

>
> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_timeline.c | 2 --
>   1 file changed, 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_timeline.c b/drivers/gpu/drm/i915/gt/intel_timeline.c
> index b9640212d659..693d18e14b00 100644
> --- a/drivers/gpu/drm/i915/gt/intel_timeline.c
> +++ b/drivers/gpu/drm/i915/gt/intel_timeline.c
> @@ -26,8 +26,6 @@ static struct i915_vma *hwsp_alloc(struct intel_gt *gt)
>   	if (IS_ERR(obj))
>   		return ERR_CAST(obj);
>   
> -	i915_gem_object_set_cache_coherency(obj, I915_CACHE_LLC);
> -
>   	vma = i915_vma_instance(obj, &gt->ggtt->vm, NULL);
>   	if (IS_ERR(vma))
>   		i915_gem_object_put(obj);
