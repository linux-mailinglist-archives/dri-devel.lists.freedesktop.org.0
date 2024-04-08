Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55A6D89BB18
	for <lists+dri-devel@lfdr.de>; Mon,  8 Apr 2024 11:02:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FF3C112311;
	Mon,  8 Apr 2024 09:02:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hQGxZ/kQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 108B8112310
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Apr 2024 09:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712566942; x=1744102942;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=xTdEWG6ffNkRHSU94Ra5So/Y5WBk6zfpiUra+a7SV/s=;
 b=hQGxZ/kQjpQIwkYJwj/sWA4CurEAqCi8MJbfGj6lTAuOU9EAMZyE1yZI
 WUnVpLrLzMEXdL+4SobkNeZk/RChKV+jALKmepBpxJklxzrZBhzxU2CUD
 Mj0L9SwhO9SW1cpAl+X7kk1GGBlmLVN2UhYZgsKY5zjNhUY36Fz7UOUs/
 bgB5WpL1yfpWBlerxGPPzrIFehiseFvcr6EpsooA4bmvugT8EWbubstEW
 usFDXwmRQs+vRMeOFQzKlmdEXIt4fRh5jKAJdCvwjZcnaGpf4ocUWghfZ
 ALGq5fGIiGlguClv9IrgGPHV3WFsSsP6P6Yr2z54d0gUsZQY8sKNXYHKW w==;
X-CSE-ConnectionGUID: A5guCVXJSQuwAIqk28CHQg==
X-CSE-MsgGUID: GWjb3l4PSha79bD57EQ1/Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11037"; a="11625820"
X-IronPort-AV: E=Sophos;i="6.07,186,1708416000"; d="scan'208";a="11625820"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 02:02:21 -0700
X-CSE-ConnectionGUID: A2NVYi21TvqxlA6zYd0wyg==
X-CSE-MsgGUID: sumzI1zUTB2/EahMDrWYCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,186,1708416000"; d="scan'208";a="19947900"
Received: from jlawryno-mobl.ger.corp.intel.com (HELO [10.246.3.118])
 ([10.246.3.118])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 02:02:20 -0700
Message-ID: <efda28cd-3bc9-43a5-b9ab-3cd9f94705d3@linux.intel.com>
Date: Mon, 8 Apr 2024 11:02:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/8] accel/ivpu: Fixes for 6.9-rc3
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com
References: <20240402104929.941186-1-jacek.lawrynowicz@linux.intel.com>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20240402104929.941186-1-jacek.lawrynowicz@linux.intel.com>
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

Applied to drm-misc-fixes

On 02.04.2024 12:49, Jacek Lawrynowicz wrote:
> A couple of small stability fixes, one UAPI fix and some error message fixes.
> 
> Jacek Lawrynowicz (5):
>   accel/ivpu: Remove d3hot_after_power_off WA
>   accel/ivpu: Put NPU back to D3hot after failed resume
>   accel/ivpu: Return max freq for DRM_IVPU_PARAM_CORE_CLOCK_RATE
>   accel/ivpu: Fix missed error message after VPU rename
>   accel/ivpu: Fix deadlock in context_xa
> 
> Wachowski, Karol (3):
>   accel/ivpu: Check return code of ipc->lock init
>   accel/ivpu: Fix PCI D0 state entry in resume
>   accel/ivpu: Improve clarity of MMU error messages
> 
>  drivers/accel/ivpu/ivpu_drv.c     | 40 ++++++++++---------------------
>  drivers/accel/ivpu/ivpu_drv.h     |  3 +--
>  drivers/accel/ivpu/ivpu_hw.h      |  6 +++++
>  drivers/accel/ivpu/ivpu_hw_37xx.c | 11 ++++-----
>  drivers/accel/ivpu/ivpu_hw_40xx.c |  6 +++++
>  drivers/accel/ivpu/ivpu_ipc.c     |  8 +++++--
>  drivers/accel/ivpu/ivpu_mmu.c     |  8 +++----
>  drivers/accel/ivpu/ivpu_pm.c      | 14 +++++------
>  8 files changed, 46 insertions(+), 50 deletions(-)
> 
> --
> 2.43.2
