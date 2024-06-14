Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A67908444
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2024 09:17:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D3E010E21C;
	Fri, 14 Jun 2024 07:17:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B2nzGAcC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BC0E10E21C
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2024 07:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718349463; x=1749885463;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=11WdPBCaxokjbOem6zWYRs+AQfld7reZ1nQVg3eqr4Y=;
 b=B2nzGAcCttfKyhdHKjGaHgiWmvjzFt9N8wfgjAVWVuh8UKnG4c9Gczjr
 0gup1/oe5A3y/LxjO83GcWUc88YLEs+LxwZxWYmDEAW3dbO1Rhx69smcy
 ucRVoPb5azx50hhHpWHet1tkSTokwOldkTz8T/UaQlSyjpIzFg0+r0opp
 C4Ef0mwpid+XB3q1G8bKfOKPxazeSQP7Q88GIJ/hQJcTSwu2avv16N9WU
 es41038+9JksFjebEgmaCGD8e0/0qJPUQKzjSx6v/bcli1DUSYNT3Oa+G
 syb2OyvZLAUmMYlAvxxf0D6avcZ5uZTSVsrT2ZtkMOTQi6CqNXEKwCpL8 A==;
X-CSE-ConnectionGUID: UZ6iq9C7Q3Gj1zRZe5GcBQ==
X-CSE-MsgGUID: owGRln8rSPS1Ghr327B2dw==
X-IronPort-AV: E=McAfee;i="6700,10204,11102"; a="19076873"
X-IronPort-AV: E=Sophos;i="6.08,237,1712646000"; d="scan'208";a="19076873"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2024 00:17:42 -0700
X-CSE-ConnectionGUID: QXO8IFlITkWHtO1JIIH4ag==
X-CSE-MsgGUID: pTeMsGT/TvGpZOeQQ4y8Yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,237,1712646000"; d="scan'208";a="77892336"
Received: from jlawryno-mobl.ger.corp.intel.com (HELO [10.245.80.160])
 ([10.245.80.160])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2024 00:17:40 -0700
Message-ID: <5924f2b3-f68e-4461-8fb5-d4417644a077@linux.intel.com>
Date: Fri, 14 Jun 2024 09:17:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/15] accel/ivpu: Changes for 6.11
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com
References: <20240611120433.1012423-1-jacek.lawrynowicz@linux.intel.com>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20240611120433.1012423-1-jacek.lawrynowicz@linux.intel.com>
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

Applied to drm-mic-next

On 11.06.2024 14:04, Jacek Lawrynowicz wrote:
> Power usage and security fixes along with some cleanup.
> 
> Andrzej Kacprowski (1):
>   accel/ivpu: Increase autosuspend delay to 100ms on 40xx
> 
> Jacek Lawrynowicz (6):
>   accel/ivpu: Remove suspend_reschedule_counter
>   accel/ivpu: Implement DCT handling
>   accel/ivpu: Make selected params read-only
>   accel/ivpu: Disable MMU before checking for idle
>   accel/ivpu: Remove duplicated debug messages
>   accel/ivpu: Remove unused ivpu_rpm_get_if_active()
> 
> Maciej Falkowski (2):
>   accel/ivpu: Abort jobs of faulty context
>   accel/ivpu: Add test mode flag for disabling timeouts
> 
> Wachowski, Karol (6):
>   accel/ivpu: Add wp0_during_power_up WA
>   accel/ivpu: Disable disable_clock_relinquish WA for LNL B0+
>   accel/ivpu: Disable clock relinquish for MMIO reset
>   accel/ivpu: Update FW BOOT API headers
>   accel/ivpu: Make parts of FW image read-only
>   accel/ivpu: Synchronize device unbind with recovery work
> 
>  drivers/accel/ivpu/ivpu_debugfs.c         |  39 +++++++-
>  drivers/accel/ivpu/ivpu_drv.c             |  41 ++++++++-
>  drivers/accel/ivpu/ivpu_drv.h             |   6 +-
>  drivers/accel/ivpu/ivpu_fw.c              |  31 ++++++-
>  drivers/accel/ivpu/ivpu_fw.h              |   2 +
>  drivers/accel/ivpu/ivpu_hw.c              |  30 ++++--
>  drivers/accel/ivpu/ivpu_hw.h              |   4 +-
>  drivers/accel/ivpu/ivpu_hw_btrs.c         |  44 +++++++--
>  drivers/accel/ivpu/ivpu_hw_btrs.h         |   6 +-
>  drivers/accel/ivpu/ivpu_hw_btrs_lnl_reg.h |  10 +-
>  drivers/accel/ivpu/ivpu_ipc.c             |   3 +-
>  drivers/accel/ivpu/ivpu_ipc.h             |   4 +-
>  drivers/accel/ivpu/ivpu_job.c             |  29 +++++-
>  drivers/accel/ivpu/ivpu_job.h             |   4 +-
>  drivers/accel/ivpu/ivpu_jsm_msg.c         |  52 +++++++----
>  drivers/accel/ivpu/ivpu_jsm_msg.h         |   2 +
>  drivers/accel/ivpu/ivpu_mmu.c             |  10 +-
>  drivers/accel/ivpu/ivpu_mmu_context.c     |  86 ++++++++++++++++++
>  drivers/accel/ivpu/ivpu_mmu_context.h     |   2 +
>  drivers/accel/ivpu/ivpu_pm.c              | 106 ++++++++++++++++------
>  drivers/accel/ivpu/ivpu_pm.h              |  10 +-
>  drivers/accel/ivpu/vpu_boot_api.h         |  16 +++-
>  22 files changed, 447 insertions(+), 90 deletions(-)
> 
> --
> 2.45.1
