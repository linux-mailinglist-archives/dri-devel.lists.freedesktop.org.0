Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BBA6A07037
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 09:43:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B732E10E06F;
	Thu,  9 Jan 2025 08:43:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H0lfDcBN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 414E610E06F
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2025 08:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736412202; x=1767948202;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=6CFOTRA8LgpEngrp+mwKZTgO4TPPxMt/+ywCkKq/qt0=;
 b=H0lfDcBNdt8JCNz0YZ6JdoQK1bd4gbqkHaFLpVn7nkU7GVotPUfQN5Xd
 9FsNgzU8HTilEPbHWso8WMPRvhvE9mjsemwkqHyzDU0UVAqiGkPFwXCJr
 IZXv6YDcsAP+xIyaiCMTPFTLvF87goJWsk6fc7LpzREWDkC0CPm8shYQw
 oL6JRfv8h/UliclT56yKidm+eBn5xToCVja0xoaIhA4nauI5Kb5kpgiQ0
 fXPLthy0CYmuFoJrMEr1gRD2FHG0z/ObgpPsZXGm3U/fPtuEPOmcL6uf1
 jAS9bv7Q81Xjr+S87+HMkZWT9WS6BYjk+InGFw0cPrqPPwTI5bQ1Ectkl Q==;
X-CSE-ConnectionGUID: bXrwVXAZTUiqtyoB9TDoeQ==
X-CSE-MsgGUID: jNVzZU4CSMmIeUjZl54a2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="36355433"
X-IronPort-AV: E=Sophos;i="6.12,300,1728975600"; d="scan'208";a="36355433"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2025 00:43:22 -0800
X-CSE-ConnectionGUID: avWj6mSbTOqJx83E1yZj1Q==
X-CSE-MsgGUID: XGJ7ecOBRYyGs2lDoq3ynQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,300,1728975600"; d="scan'208";a="134180628"
Received: from mgorski-mobl1.ger.corp.intel.com (HELO [10.245.84.116])
 ([10.245.84.116])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2025 00:43:19 -0800
Message-ID: <3eab5779-ded9-4eea-92f7-03dcbfe90669@linux.intel.com>
Date: Thu, 9 Jan 2025 09:43:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/14] accel/ivpu: Changes for 6.14
To: Maciej Falkowski <maciej.falkowski@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com
References: <20250107173238.381120-1-maciej.falkowski@linux.intel.com>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20250107173238.381120-1-maciej.falkowski@linux.intel.com>
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

On 1/7/2025 6:32 PM, Maciej Falkowski wrote:
> This patchset contains latest changes for Intel NPU driver
> including enabling HWS by default, adding memory utilization,
> MMU optimizations, and others.
> 
> Jacek Lawrynowicz (1):
>   accel/ivpu: Enable HWS by default on all platforms
> 
> Karol Wachowski (11):
>   accel/ivpu: Separate DB ID and CMDQ ID allocations from CMDQ
>     allocation
>   accel/ivpu: Add API for command queue create/destroy/submit
>   accel/ivpu: Abort all jobs after command queue unregister
>   accel/ivpu: Dump only first MMU fault from single context
>   accel/ivpu: Move parts of MMU event IRQ handling to thread handler
>   accel/ivpu: Fix missing MMU events from reserved SSID
>   accel/ivpu: Set command queue management capability based on HWS
>   accel/ivpu: Fix locking order in ivpu_cmdq_destroy_ioctl
>   accel/ivpu: Fix locking order in ivpu_job_submit
>   accel/ivpu: Add handling of VPU_JSM_STATUS_MVNCI_CONTEXT_VIOLATION_HW
>   accel/ivpu: Add platform detection for presilicon
> 
> Maciej Falkowski (2):
>   accel/ivpu: Expose NPU memory utilization info in sysfs
>   accel/ivpu: Use workqueue for IRQ handling
> 
>  drivers/accel/ivpu/ivpu_drv.c             |  88 ++--
>  drivers/accel/ivpu/ivpu_drv.h             |  10 +-
>  drivers/accel/ivpu/ivpu_fw.c              |  13 +-
>  drivers/accel/ivpu/ivpu_hw.c              |  46 +-
>  drivers/accel/ivpu/ivpu_hw.h              |   9 -
>  drivers/accel/ivpu/ivpu_hw_btrs.c         |  10 +-
>  drivers/accel/ivpu/ivpu_hw_btrs.h         |   1 +
>  drivers/accel/ivpu/ivpu_hw_btrs_lnl_reg.h |   1 +
>  drivers/accel/ivpu/ivpu_ipc.c             |   7 +-
>  drivers/accel/ivpu/ivpu_ipc.h             |   2 +-
>  drivers/accel/ivpu/ivpu_job.c             | 508 ++++++++++++++++------
>  drivers/accel/ivpu/ivpu_job.h             |   8 +-
>  drivers/accel/ivpu/ivpu_mmu.c             | 112 ++++-
>  drivers/accel/ivpu/ivpu_mmu.h             |   2 +
>  drivers/accel/ivpu/ivpu_mmu_context.c     |  13 -
>  drivers/accel/ivpu/ivpu_mmu_context.h     |   2 -
>  drivers/accel/ivpu/ivpu_pm.c              |   3 +-
>  drivers/accel/ivpu/ivpu_pm.h              |   2 +-
>  drivers/accel/ivpu/ivpu_sysfs.c           |  35 +-
>  include/uapi/drm/ivpu_accel.h             |  84 ++++
>  20 files changed, 661 insertions(+), 295 deletions(-)
> 

