Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B5DB0DEAF
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jul 2025 16:32:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3183010E699;
	Tue, 22 Jul 2025 14:32:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NMNcsbs2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92F2E10E699
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 14:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753194757; x=1784730757;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=5MBAmMC0Hx/N65d/N0RN6i+TJ1ysdUcZUZNcMwdl9Vw=;
 b=NMNcsbs2nkxhjGbab7JTZkySq4tbr3oEQCclvuZ3hrTlwESjV6OSvIyP
 qYhUMwkR3jDgpSkPBxZ3icv0oIvlJlOyp6t5mDjqNAlJnePNDVALhjC8f
 hLOu5Sk5P76AyXqjbKpjUJ5v5jFaLTAaGwWUoujPJp+Y6qWrQ9pC29oUb
 JBIIvP3CP9Rk1l9GfYx4E/fqCkZ1fGj0N9lD+poP+xlO2YC8ZTkrDcEbA
 0saThFxKfTJYGOgU1pTTZiMZX2RISwrfpoYWOxRIg8VCzP3GBKx/Cql9C
 YH5lW75xuineFEAF7Xedx1mtVlg74GBpp47rsYbnuIDW1zzLAnMWgIsbH A==;
X-CSE-ConnectionGUID: a0CArr3dTOq3vo1k6cfmOA==
X-CSE-MsgGUID: LfQOvlYoTdmJG52BPQ3Kpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11500"; a="55538079"
X-IronPort-AV: E=Sophos;i="6.16,331,1744095600"; d="scan'208";a="55538079"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2025 07:32:36 -0700
X-CSE-ConnectionGUID: uPDDupdhSaiXPa6UnSyBsA==
X-CSE-MsgGUID: BYilkft0RyuyX/ybapcUNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,331,1744095600"; d="scan'208";a="159719395"
Received: from mfalkows-mobl.ger.corp.intel.com (HELO [10.245.121.109])
 ([10.245.121.109])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2025 07:32:35 -0700
Message-ID: <718b6520-2058-40db-9b2c-871d83470c7d@linux.intel.com>
Date: Tue, 22 Jul 2025 16:32:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: Add new intel_vpu maintainer
To: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Cc: jeff.hugo@oss.qualcomm.com, lizhi.hou@amd.com,
 karol.wachowski@linux.intel.com
References: <20250722100421.500984-1-jacek.lawrynowicz@linux.intel.com>
Content-Language: en-US
From: "Falkowski, Maciej" <maciej.falkowski@linux.intel.com>
In-Reply-To: <20250722100421.500984-1-jacek.lawrynowicz@linux.intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Maciej Falkowski <maciej.falkowski@linux.intel.com>

On 7/22/2025 12:04 PM, Jacek Lawrynowicz wrote:
> Add Karol as a new intel_vpu maintainer.
>
> Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
> ---
>   MAINTAINERS | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 7e7515a412e9d..22dc118f43d89 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7386,6 +7386,7 @@ F:	include/linux/power/smartreflex.h
>   DRM ACCEL DRIVERS FOR INTEL VPU
>   M:	Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
>   M:	Maciej Falkowski <maciej.falkowski@linux.intel.com>
> +M:	Karol Wachowski <karol.wachowski@linux.intel.com>
>   L:	dri-devel@lists.freedesktop.org
>   S:	Supported
>   T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
