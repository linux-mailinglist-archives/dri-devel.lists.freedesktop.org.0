Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B2DF94462C
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2024 10:05:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B811410E8B4;
	Thu,  1 Aug 2024 08:05:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ciFgMwUS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33EFF10E8B3;
 Thu,  1 Aug 2024 08:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722499528; x=1754035528;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=HWd2wCZHR7SamwtRb8Cd2KRourXGX+zIVqt6Dh4Gs8o=;
 b=ciFgMwUSZ4317Vi5ojj9t0GmbyS06aKDA/h21ZwXqTeVkk+2nPQa1E5P
 wbAZApWNOCCNaNS1RbSLWE2yqe8xtoKdARn3e23RZ5sAZB66zXk8arp4i
 QL3pXh1EBZMA3EkbVF+0BbvqM4QHi1QVhngO5D/CnROEYrzfl7UBsSEvE
 ody3xQDIk853fW6GUn64bFs3RHNZCxXqldVlwQVjXNtHz6tipbRYKe3jm
 WhxDdNO2MjKywrosUwvivSaU7Ca0cm+m/S+gBbi6NyTdo7Qo7o2SNcxHs
 jvlivnu37S/t1GYve7ab+OUHdwVxCc4l8e1K0tg2hh0RwmccDvwyuGuzK Q==;
X-CSE-ConnectionGUID: jVhwV2BhS+q9puMFPYBEGw==
X-CSE-MsgGUID: vTEYg3uNQGWtwwFJzjf5UA==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="42958094"
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; d="scan'208";a="42958094"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 01:05:27 -0700
X-CSE-ConnectionGUID: NjPbgrZqSP2YhSwYTUgxwA==
X-CSE-MsgGUID: ffHAlusUSjq6rv3tc+XSsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; d="scan'208";a="78256604"
Received: from mwiniars-desk2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.228])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 01:05:24 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: maarten.lankhorst@linux.intel.com, rodrigo.vivi@intel.com
Subject: Re: [PATCH v4 2/3] drm/printer: Allow NULL data in devcoredump printer
In-Reply-To: <20240731213221.2523989-3-matthew.brost@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240731213221.2523989-1-matthew.brost@intel.com>
 <20240731213221.2523989-3-matthew.brost@intel.com>
Date: Thu, 01 Aug 2024 11:05:21 +0300
Message-ID: <87le1gwtvi.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Wed, 31 Jul 2024, Matthew Brost <matthew.brost@intel.com> wrote:
> Useful to determine size of devcoreump before writing it out.

I find it useful to have this special case documented, with an example,
so it's easier to see how handy this really is.

BR,
Jani.


>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/drm_print.c | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_print.c b/drivers/gpu/drm/drm_print.c
> index cf24dfdeb6b2..a1a4de9f9c44 100644
> --- a/drivers/gpu/drm/drm_print.c
> +++ b/drivers/gpu/drm/drm_print.c
> @@ -100,8 +100,9 @@ void __drm_puts_coredump(struct drm_printer *p, const char *str)
>  			copy = iterator->remain;
>  
>  		/* Copy out the bit of the string that we need */
> -		memcpy(iterator->data,
> -			str + (iterator->start - iterator->offset), copy);
> +		if (iterator->data)
> +			memcpy(iterator->data,
> +				str + (iterator->start - iterator->offset), copy);
>  
>  		iterator->offset = iterator->start + copy;
>  		iterator->remain -= copy;
> @@ -110,7 +111,8 @@ void __drm_puts_coredump(struct drm_printer *p, const char *str)
>  
>  		len = min_t(ssize_t, strlen(str), iterator->remain);
>  
> -		memcpy(iterator->data + pos, str, len);
> +		if (iterator->data)
> +			memcpy(iterator->data + pos, str, len);
>  
>  		iterator->offset += len;
>  		iterator->remain -= len;
> @@ -140,8 +142,9 @@ void __drm_printfn_coredump(struct drm_printer *p, struct va_format *vaf)
>  	if ((iterator->offset >= iterator->start) && (len < iterator->remain)) {
>  		ssize_t pos = iterator->offset - iterator->start;
>  
> -		snprintf(((char *) iterator->data) + pos,
> -			iterator->remain, "%pV", vaf);
> +		if (iterator->data)
> +			snprintf(((char *) iterator->data) + pos,
> +				iterator->remain, "%pV", vaf);
>  
>  		iterator->offset += len;
>  		iterator->remain -= len;

-- 
Jani Nikula, Intel
