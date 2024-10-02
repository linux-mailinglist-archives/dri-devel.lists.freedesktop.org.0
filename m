Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F061E98D4F3
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2024 15:26:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B01710E339;
	Wed,  2 Oct 2024 13:26:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VhuQngfs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BA2C10E339
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Oct 2024 13:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727875569; x=1759411569;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=25+MaR8CBScAHOk7XyEAqruUS8MUZ20tvCHvENGeIZQ=;
 b=VhuQngfsDv+UuMXLBr3nGGHr5rzuomupGI5pc2w0ZZKRjfwAjmFy2hSF
 6V9CGCxzJPV92VfVg71zi1OEj2lsBjomrHE+SB8BU2KBYuIJBlb87J8CJ
 iKQwaeI4dyhNSvWZfi7GCntL3K71KPEv0zUXgdumjRjmSFJz8fzypBwPb
 qgQtvI4oE5UpXM7lAJx8O9WMRrsNloePGDGkPwrF8PlgrSoLraM3eze0f
 0R1nUb6C6Vb0eo5/gx7shgkV8OSD/cGPAjUaiF5oDXUnsxl1MvuLleKn7
 c2iVWE+sBI+9YXC3a13JPHXmfnWyqHINa3LFK6dL1ZjDwbNbdqT3qJVNU Q==;
X-CSE-ConnectionGUID: GPV2cwUMTFqEE5Qgg1egbg==
X-CSE-MsgGUID: uJth1uA2TcSiNxU/vgqa0Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="37705940"
X-IronPort-AV: E=Sophos;i="6.11,171,1725346800"; d="scan'208";a="37705940"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2024 06:26:08 -0700
X-CSE-ConnectionGUID: QEdfdyrCQuSIKa+H+bUQUg==
X-CSE-MsgGUID: RQ9g6klqTIWC2Rpzsc2d/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,171,1725346800"; d="scan'208";a="78864586"
Received: from jpdavis-mobl1.ger.corp.intel.com (HELO [10.246.18.68])
 ([10.246.18.68])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2024 06:26:06 -0700
Message-ID: <6f18b890-2fa2-4c81-ab4e-2816d0ce98d9@linux.intel.com>
Date: Wed, 2 Oct 2024 15:26:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/31] accel/ivpu: Fixes for 6.12-rc1
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com
References: <20240930195322.461209-1-jacek.lawrynowicz@linux.intel.com>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20240930195322.461209-1-jacek.lawrynowicz@linux.intel.com>
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

On 9/30/2024 9:52 PM, Jacek Lawrynowicz wrote:
> Most notable changes are coredump and tracing support.
> The rest are stability fixes, some refactoring and typos.
> 
> Changes in v2:
> - Fix typos in FW API headers
> - Split fw refactor commit into 2 commits and improved commit messages
> - Fixed commit messages for state dump and power island commits
> - Added limit and NULL termination for FW version string
> - Documented sched_mode sysfs file
> 
> 
> Andrzej Kacprowski (4):
>   accel/ivpu: Update VPU FW API headers
>   accel/ivpu: Allow reading dvfs_mode debugfs file
>   accel/ivpu: Add test_mode bit to force turbo
>   accel/ivpu: Fix reset_engine debugfs file logic
> 
> Jacek Lawrynowicz (11):
>   accel/ivpu: Rename ivpu_log_level to fw_log_level
>   accel/ivpu: Refactor functions in ivpu_fw_log.c
>   accel/ivpu: Fix fw log printing
>   accel/ivpu: Limit FW version string length
>   accel/ivpu: Stop using hardcoded DRIVER_DATE
>   accel/ivpu: Add auto selection logic for job scheduler
>   accel/ivpu: Remove invalid warnings
>   accel/ivpu: Increase MS info buffer size
>   accel/ivpu: Fix ivpu_jsm_dyndbg_control()
>   accel/ivpu: Remove HWS_EXTRA_EVENTS from test modes
>   accel/ivpu: Fix typos in ivpu_pm.c
> 
> Jakub Pawlak (1):
>   accel/ivpu: Add tracing for IPC/PM/JOB
> 
> Karol Wachowski (12):
>   accel/ivpu: Add coredump support
>   accel/ivpu: Set 500 ns delay between power island TRICKLE and ENABLE
>   accel/ivpu: Turn on autosuspend on Simics
>   accel/ivpu: Add FW version debugfs entry
>   accel/ivpu: Remove 1-tile power up Simics workaround
>   accel/ivpu: Add one jiffy to bo_wait_ioctl timeout value
>   accel/ivpu: Print JSM message result in case of error
>   accel/ivpu: Remove skip of clock own resource ack on Simics
>   accel/ivpu: Prevent recovery invocation during probe and resume
>   accel/ivpu: Refactor failure diagnostics during boot
>   accel/ivpu: Do not fail on cmdq if failed to allocate preemption
>     buffers
>   accel/ivpu: Use whole user and shave ranges for preemption buffers
> 
> Tomasz Rusinowicz (3):
>   accel/ivpu: Reset fw log on cold boot
>   accel/ivpu: Add FW state dump on TDR
>   accel/ivpu: Make DB_ID and JOB_ID allocations incremental
> 
>  drivers/accel/ivpu/Kconfig             |   1 +
>  drivers/accel/ivpu/Makefile            |   6 +-
>  drivers/accel/ivpu/ivpu_coredump.c     |  39 ++++
>  drivers/accel/ivpu/ivpu_coredump.h     |  25 ++
>  drivers/accel/ivpu/ivpu_debugfs.c      |  86 +++----
>  drivers/accel/ivpu/ivpu_drv.c          |  52 +++--
>  drivers/accel/ivpu/ivpu_drv.h          |  13 +-
>  drivers/accel/ivpu/ivpu_fw.c           |  26 ++-
>  drivers/accel/ivpu/ivpu_fw.h           |   9 +-
>  drivers/accel/ivpu/ivpu_fw_log.c       | 113 +++++----
>  drivers/accel/ivpu/ivpu_fw_log.h       |  17 +-
>  drivers/accel/ivpu/ivpu_gem.c          |   3 +
>  drivers/accel/ivpu/ivpu_hw.c           |   5 +-
>  drivers/accel/ivpu/ivpu_hw.h           |   1 -
>  drivers/accel/ivpu/ivpu_hw_btrs.c      |   9 -
>  drivers/accel/ivpu/ivpu_hw_ip.c        |   8 +-
>  drivers/accel/ivpu/ivpu_ipc.c          |  45 ++--
>  drivers/accel/ivpu/ivpu_ipc.h          |   9 +-
>  drivers/accel/ivpu/ivpu_job.c          | 102 +++++----
>  drivers/accel/ivpu/ivpu_jsm_msg.c      |  34 +--
>  drivers/accel/ivpu/ivpu_jsm_msg.h      |   2 +
>  drivers/accel/ivpu/ivpu_ms.c           |   2 +-
>  drivers/accel/ivpu/ivpu_pm.c           |  24 +-
>  drivers/accel/ivpu/ivpu_sysfs.c        |  24 ++
>  drivers/accel/ivpu/ivpu_trace.h        |  73 ++++++
>  drivers/accel/ivpu/ivpu_trace_points.c |   9 +
>  drivers/accel/ivpu/vpu_boot_api.h      |  45 ++--
>  drivers/accel/ivpu/vpu_jsm_api.h       | 303 +++++++++++++++++++++----
>  include/uapi/drm/ivpu_accel.h          |   3 -
>  29 files changed, 797 insertions(+), 291 deletions(-)
>  create mode 100644 drivers/accel/ivpu/ivpu_coredump.c
>  create mode 100644 drivers/accel/ivpu/ivpu_coredump.h
>  create mode 100644 drivers/accel/ivpu/ivpu_trace.h
>  create mode 100644 drivers/accel/ivpu/ivpu_trace_points.c
> 
> --
> 2.45.1

