Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7A0CA14C80
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2025 10:53:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5982C10E2FE;
	Fri, 17 Jan 2025 09:53:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iIjOPlqX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6C1710E1D0
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2025 09:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737107580; x=1768643580;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=/eOpDNrgHjyl8J+WkxY33S8cp+IEaKLW/Dw7n7YlvHE=;
 b=iIjOPlqXapI/9re2oU1j8wqXdgGncpJFpzMppTiVYMbiSsGm3YthNNgx
 STeRGe33ynpWMJS4+qhyB2JpW8gdbtHnBZ4KxY5+smmtwGLiNrwHJ7Jpb
 4FnPR0hwKbwxwglJNmBByg0/ELbyqCjq56usvUsQ13Q6nin020Uvxz83c
 mZzSRDiX2LRxUQDIBC3eXginwd2RS8EBDXuwx6w64AMfDcBPVXrhv64wF
 h09JU3QB1Fppsze0wUjvBdwEaU96lVd5GTlVdhkLoPeYD3dViNilYphWl
 lVhqib2wOHpRub2xrht7uraje5YYeYNy2LT1gfsVj2FAm0Kfh5dC3Avxf g==;
X-CSE-ConnectionGUID: 4LC/tKx/Q2aUsu0tq7ZDPA==
X-CSE-MsgGUID: Ub7MJycjS2yfUd+shNgvBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11317"; a="41466315"
X-IronPort-AV: E=Sophos;i="6.13,211,1732608000"; d="scan'208";a="41466315"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2025 01:52:59 -0800
X-CSE-ConnectionGUID: SuPxQCRJSJClv1xwkhLfSQ==
X-CSE-MsgGUID: lkBa3WfqR96j8WEKaby1nA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,211,1732608000"; d="scan'208";a="105622708"
Received: from mgorski-mobl1.ger.corp.intel.com (HELO [10.245.84.116])
 ([10.245.84.116])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2025 01:52:57 -0800
Message-ID: <cf07df77-c2c5-48ec-ac42-2c16207a3d5c@linux.intel.com>
Date: Fri, 17 Jan 2025 10:52:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: Update intel_vpu maintainer list
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 stanislaw.gruszka@linux.intel.com, maciej.falkowski@linux.intel.com
References: <20250114084436.1326127-1-jacek.lawrynowicz@linux.intel.com>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20250114084436.1326127-1-jacek.lawrynowicz@linux.intel.com>
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

On 1/14/2025 9:44 AM, Jacek Lawrynowicz wrote:
> Slawek moved to another project and Maciej will be replacing him.
> 
> Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 33fe500bf3ae6..8f2a266a6c404 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7054,7 +7054,7 @@ F:	include/linux/power/smartreflex.h
>  
>  DRM ACCEL DRIVERS FOR INTEL VPU
>  M:	Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
> -M:	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
> +M:	Maciej Falkowski <maciej.falkowski@linux.intel.com>
>  L:	dri-devel@lists.freedesktop.org
>  S:	Supported
>  T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git

