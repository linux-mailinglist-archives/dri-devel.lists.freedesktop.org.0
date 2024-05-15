Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 246108C6054
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2024 07:56:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 014C210E10D;
	Wed, 15 May 2024 05:56:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B6ZjpNDm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83AEA10E10D
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2024 05:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715752588; x=1747288588;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=tR7tuPODVjSSwdf9YTgXOC0yW5v8jv3rzTMYp5fdtVs=;
 b=B6ZjpNDmjDL4BIRrnHbgOm4xSTE1PsCwlFQq+SwUAOx0/cdaHFhCF5th
 PqWmDoBzhGORDCmqSM1KCC+YYt3ihybd+W9h3pvQMxt6RAd4wJpABsh2H
 swTQgxfjK9paVAqb9vhIe+aDzhJtL89HZhVSqmd0Q3NOud5VdcbUMuXW5
 M+e6IcbgnIMgNEpxuwzpV1Eo6ceCIAaEXx2NeOkzN9T4sZh8Vxy6LT8DD
 ss/QYW+0Ez6Xm/m/XlQN8nVuPXaqOI4LQGbpNugltek89qfsuIgK4rG0V
 oKVDo64LuaqEzUE7AONz06PWCiDgAVW0rcMcKh+gsseWjY8sz7eVEFwPa A==;
X-CSE-ConnectionGUID: c0Itr19BRDydJ50Ac6PKfA==
X-CSE-MsgGUID: Nr8OGjb5RvK2f4X05N2QfQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11073"; a="34290350"
X-IronPort-AV: E=Sophos;i="6.08,160,1712646000"; d="scan'208";a="34290350"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2024 22:56:27 -0700
X-CSE-ConnectionGUID: V2rzSXteSPaZvtK5ZhCn9w==
X-CSE-MsgGUID: A9eEVe+ZS6+CidTVYfwJAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,160,1712646000"; d="scan'208";a="35832490"
Received: from jlawryno-mobl.ger.corp.intel.com (HELO [10.245.101.99])
 ([10.245.101.99])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2024 22:56:27 -0700
Message-ID: <ec989694-4d31-4c22-b4a3-6a9160c00244@linux.intel.com>
Date: Wed, 15 May 2024 07:56:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/12] accel/ivpu: Changes for 6.10
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com
References: <20240513120431.3187212-1-jacek.lawrynowicz@linux.intel.com>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20240513120431.3187212-1-jacek.lawrynowicz@linux.intel.com>
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

On 13.05.2024 14:04, Jacek Lawrynowicz wrote:
> There are couple of major new features in this patchset:
>   * Hardware scheduler support (disabled by default)
>   * Profiling support
>   * Expose NPU busy time in sysfs
> 
> Other then that, there are two small random fixes.
> 
> v2: Included Jeffrey's v1 comments
> 
> v1: https://lore.kernel.org/dri-devel/20240508132106.2387464-1-jacek.lawrynowicz@linux.intel.com
> 
> Jacek Lawrynowicz (2):
>   accel/ivpu: Update VPU FW API headers
>   accel/ivpu: Increase reset counter when warm boot fails
> 
> Tomasz Rusinowicz (3):
>   accel/ivpu: Add NPU profiling support
>   accel/ivpu: Configure fw logging using debugfs
>   accel/ivpu: Share NPU busy time in sysfs
> 
> Wachowski, Karol (7):
>   accel/ivpu: Add sched_mode module param
>   accel/ivpu: Create priority based command queues
>   accel/ivpu: Implement support for preemption buffers
>   accel/ivpu: Add HWS JSM messages
>   accel/ivpu: Implement support for hardware scheduler
>   accel/ivpu: Add resume engine support
>   accel/ivpu: Add force snoop module parameter
> 
>  drivers/accel/ivpu/Makefile       |   6 +-
>  drivers/accel/ivpu/ivpu_debugfs.c |  50 +++++
>  drivers/accel/ivpu/ivpu_drv.c     |  44 ++++-
>  drivers/accel/ivpu/ivpu_drv.h     |  23 ++-
>  drivers/accel/ivpu/ivpu_fw.c      |  10 +
>  drivers/accel/ivpu/ivpu_fw.h      |   2 +
>  drivers/accel/ivpu/ivpu_gem.h     |  11 +-
>  drivers/accel/ivpu/ivpu_hw.h      |   3 +-
>  drivers/accel/ivpu/ivpu_hw_37xx.c |   7 +-
>  drivers/accel/ivpu/ivpu_hw_40xx.c |   9 +-
>  drivers/accel/ivpu/ivpu_job.c     | 295 ++++++++++++++++++++++------
>  drivers/accel/ivpu/ivpu_job.h     |   2 +
>  drivers/accel/ivpu/ivpu_jsm_msg.c | 259 ++++++++++++++++++++++++-
>  drivers/accel/ivpu/ivpu_jsm_msg.h |  20 +-
>  drivers/accel/ivpu/ivpu_mmu.c     |  12 +-
>  drivers/accel/ivpu/ivpu_ms.c      | 309 ++++++++++++++++++++++++++++++
>  drivers/accel/ivpu/ivpu_ms.h      |  36 ++++
>  drivers/accel/ivpu/ivpu_pm.c      |   5 +
>  drivers/accel/ivpu/ivpu_sysfs.c   |  58 ++++++
>  drivers/accel/ivpu/ivpu_sysfs.h   |  13 ++
>  drivers/accel/ivpu/vpu_jsm_api.h  |  14 +-
>  include/uapi/drm/ivpu_accel.h     |  69 ++++++-
>  22 files changed, 1173 insertions(+), 84 deletions(-)
>  create mode 100644 drivers/accel/ivpu/ivpu_ms.c
>  create mode 100644 drivers/accel/ivpu/ivpu_ms.h
>  create mode 100644 drivers/accel/ivpu/ivpu_sysfs.c
>  create mode 100644 drivers/accel/ivpu/ivpu_sysfs.h
> 
> --
> 2.43.2
