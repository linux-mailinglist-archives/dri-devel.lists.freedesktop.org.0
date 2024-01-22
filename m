Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 262AC835E47
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jan 2024 10:33:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C070310EBE3;
	Mon, 22 Jan 2024 09:33:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25A7610EBE3
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jan 2024 09:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705916008; x=1737452008;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=jJpTOvSElhTpMa77c8520Yy628Z3HXbR4Sa+/SGCJrs=;
 b=f8uoUDwwg1fF64bh/CXn1m+I+bRswgEK+UQIcgqd3HqHTtNo1mCDpV8q
 PHKt9XUw4dq6hRo7LCpuTWHNAtjiol1HMFHUQCy7LKpBKHhoal//47JCt
 Dbdqe6eXE1wTkqcjcRvSIoZYTHdxrWdYxxNxIsNF4UDVWN8fKskTsdE7k
 KaJJtFu8lWAEPpM4AhdCteUExtuG9bFn0WmZBUIf6VxJP297tz/8yf1yJ
 6vo45W5hCwBARpG+MFR0Vhameu10KAgTYpkE59EszrVJuZB6MwE/aLM/T
 A5aa6FVhOw4gsaVK5aZ+DSoZ+fj+Bwf5JXt1lqaABCl1BqRfIPlLqun8h A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10960"; a="7905815"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; 
   d="scan'208";a="7905815"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2024 01:33:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10960"; a="788884064"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; d="scan'208";a="788884064"
Received: from jlawryno-mobl.ger.corp.intel.com (HELO [10.245.80.160])
 ([10.245.80.160])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2024 01:33:26 -0800
Message-ID: <2d271e38-959d-454f-8301-9518d6777be3@linux.intel.com>
Date: Mon, 22 Jan 2024 10:33:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/9] accel/ivpu fixes for 6.8
To: dri-devel@lists.freedesktop.org
References: <20240115134434.493839-1-jacek.lawrynowicz@linux.intel.com>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20240115134434.493839-1-jacek.lawrynowicz@linux.intel.com>
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

On 15.01.2024 14:44, Jacek Lawrynowicz wrote:
> Various driver fixes:
>  - Fixes for infinite loops, missing locks and DMA-API debug warnings
>  - Deprecate DRM_IVPU_PARAM_CONTEXT_PRIORITY
>  - Improve diagnostic messages
> 
> v2 includes changes from v1 review comments and drops IRQ infinite loop patch.
> 
> Jacek Lawrynowicz (4):
>   accel/ivpu: Fix for missing lock around drm_gem_shmem_vmap()
>   accel/ivpu: Free buffer sgt on unbind
>   accel/ivpu: Disable buffer sharing among VPU contexts
>   accel/ivpu: Improve buffer object debug logs
> 
> Wachowski, Karol (5):
>   accel/ivpu: Dump MMU events in case of VPU boot timeout
>   accel/ivpu: Call diagnose failure in ivpu_mmu_cmdq_sync()
>   accel/ivpu: Add debug prints for MMU map/unmap operations
>   accel/ivpu: Add diagnostic messages when VPU fails to boot or suspend
>   accel/ivpu: Deprecate DRM_IVPU_PARAM_CONTEXT_PRIORITY param
> 
>  drivers/accel/ivpu/ivpu_drv.c         |  17 +---
>  drivers/accel/ivpu/ivpu_drv.h         |   2 +-
>  drivers/accel/ivpu/ivpu_gem.c         | 126 +++++++++-----------------
>  drivers/accel/ivpu/ivpu_gem.h         |   1 -
>  drivers/accel/ivpu/ivpu_job.c         |   3 +
>  drivers/accel/ivpu/ivpu_mmu.c         |  10 ++
>  drivers/accel/ivpu/ivpu_mmu.h         |   1 +
>  drivers/accel/ivpu/ivpu_mmu_context.c |   9 ++
>  drivers/accel/ivpu/ivpu_pm.c          |   4 +-
>  include/uapi/drm/ivpu_accel.h         |  25 ++++-
>  10 files changed, 96 insertions(+), 102 deletions(-)
> 
> --
> 2.43.0
