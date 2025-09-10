Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B03DCB51240
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 11:16:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2792510E8A6;
	Wed, 10 Sep 2025 09:16:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SCvbiL17";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E32D10E8A6
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 09:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757495802; x=1789031802;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=f9HQ02tE/TuhrBWKzz2Uzn0/7LDmDfbWNt1giFjiiII=;
 b=SCvbiL17j+ph1oCVM8JwoIVRG37WEsjJuuCF7ZhH+9+2JEKksJyqgcEX
 SqS+G7JyWyT6LoRzW2HNoqyKo/kW+QOuFxW1BtXEjptL0LDw/0W+zEtvb
 7WOGwQ8Lu2Y5S0WjhQopA3XHxQLFW77N6AgtyvSmJqr4eGA6idd9ECieA
 6XqGFpT7hgbFDtgejRXb4HZVB/Ek8ejSf1rtxscOWY7zAPwI8VETzpR0s
 oyhJzHlXCHpuJAkYt6gq57mX0VdRzSIipO7lIlYa0POwIPDpkPNGrcOnr
 qJ51cZm4uAUaRNa4HOkIW1eq2NXuBXyHtzOVI5HBH2mLTtL98FnB1A1E0 Q==;
X-CSE-ConnectionGUID: gFnLer2lQZ+zOWcMlLxv1Q==
X-CSE-MsgGUID: Af/6HQ+DR+mvhfcaIHwPpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="59655397"
X-IronPort-AV: E=Sophos;i="6.18,253,1751266800"; d="scan'208";a="59655397"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 02:16:41 -0700
X-CSE-ConnectionGUID: gb/f5xrvTVindKAxbvBxAA==
X-CSE-MsgGUID: p04/fVOpRyi+sjtPSkiQRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,253,1751266800"; d="scan'208";a="172904602"
Received: from unknown (HELO [10.217.160.67]) ([10.217.160.67])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 02:16:39 -0700
Message-ID: <7728e693-a3f5-4eb1-a10c-09aac0009c09@linux.intel.com>
Date: Wed, 10 Sep 2025 11:16:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: Remove Jacek Lawrynowicz as intel_vpu
 maintainer
To: dri-devel@lists.freedesktop.org
Cc: jeff.hugo@oss.qualcomm.com, lizhi.hou@amd.com,
 maciej.falkowski@linux.intel.com, karol.wachowski@linux.intel.com
References: <20250910085526.230458-1-jacek.lawrynowicz@linux.intel.com>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20250910085526.230458-1-jacek.lawrynowicz@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
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

Applied to drm-misc-next

On 9/10/2025 10:55 AM, Jacek Lawrynowicz wrote:
> Remove myself from the intel_vpu driver maintainer list as I'm
> moving to another company. Time to let someone else deal with
> the NPU bugs while I pretend to know what I'm doing elsewhere!
> 
> Thanks to everyone for the great collaboration (and for putting up
> with my creative interpretations of what "minor fixes" means).
> 
> Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
> ---
>  MAINTAINERS | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 402fe14091f15..8f8c91144cc2d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7490,7 +7490,6 @@ F:	drivers/soc/ti/smartreflex.c
>  F:	include/linux/power/smartreflex.h
>  
>  DRM ACCEL DRIVERS FOR INTEL VPU
> -M:	Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
>  M:	Maciej Falkowski <maciej.falkowski@linux.intel.com>
>  M:	Karol Wachowski <karol.wachowski@linux.intel.com>
>  L:	dri-devel@lists.freedesktop.org

