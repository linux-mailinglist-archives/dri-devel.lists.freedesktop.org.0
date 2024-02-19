Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 257F885A046
	for <lists+dri-devel@lfdr.de>; Mon, 19 Feb 2024 10:54:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7571C10E28B;
	Mon, 19 Feb 2024 09:54:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GUdDEX6s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 563D010E291
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Feb 2024 09:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708336449; x=1739872449;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=XOS1cN699ODwQMEiR5t+L4EkwzevjNlIRL6hCZDQalg=;
 b=GUdDEX6s3BQQG01VdXl+l/H1Ua9HhncZ3ZXekNPKNBlW9X2CTBTsOPm8
 edv6WnOyuUeFfyksDz7wanLgH8XD0f4ApiJGW9839l2EZDsu5T8H7eY7n
 2cJVp8f8A9Hf2tG8igkrVZu/Wqtu6cyOSuIXYTTbIehejSCOHmHkp0SbB
 Ws06TNSrVN842q7/5JzPBAihhqatQTrvVJoEyExVeDB/bkUbAFuFK5Eg8
 ixpfxryfIwjEq2rwS4OBz0cnyW3rA/ObPrVIZJ3Kfbw0sncyi0OQDwun3
 ZlH1098NzwR7YsYfyV8ul5N87DSku/qmZqiENAtOBXvS/y0ZaAQc/bJs3 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10988"; a="19835073"
X-IronPort-AV: E=Sophos;i="6.06,170,1705392000"; d="scan'208";a="19835073"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2024 01:54:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,170,1705392000"; 
   d="scan'208";a="4396577"
Received: from jlawryno-mobl.ger.corp.intel.com (HELO [10.245.114.39])
 ([10.245.114.39])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2024 01:54:08 -0800
Message-ID: <0329c485-75ec-4952-8480-3d6726b12fa8@linux.intel.com>
Date: Mon, 19 Feb 2024 10:54:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/8] accel/ivpu changes for 6.9
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com
References: <20240214081305.290108-1-jacek.lawrynowicz@linux.intel.com>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20240214081305.290108-1-jacek.lawrynowicz@linux.intel.com>
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

Added missing SOB and applied to drm-misc-next

On 14.02.2024 09:12, Jacek Lawrynowicz wrote:
> Mostly code refactoring and cleanup.
> 
> Please note that FW API headers are maintained by a separate team
> and I would prefer not to modify them.
> 
> Jacek Lawrynowicz (5):
>   accel/ivpu: Rename TILE_SKU_BOTH_MTL to TILE_SKU_BOTH
>   accel/ivpu: Remove legacy firmware name
>   accel/ivpu: Update FW API headers
>   accel/ivpu: Fix ivpu_reset_engine_fn merge issue
>   accel/ivpu: Rename VPU to NPU in message strings
> 
> Krystian Pradzynski (1):
>   accel/ivpu: Add support for FW boot param system_time_us
> 
> Wachowski, Karol (2):
>   accel/ivpu: Use lazy allocation for doorbell IDs
>   accel/ivpu: Refactor BO creation functions
> 
>  drivers/accel/ivpu/ivpu_debugfs.c | 32 +++++++-------
>  drivers/accel/ivpu/ivpu_drv.c     | 12 ++++--
>  drivers/accel/ivpu/ivpu_drv.h     |  7 +++-
>  drivers/accel/ivpu/ivpu_fw.c      | 49 +++++++++++++---------
>  drivers/accel/ivpu/ivpu_fw_log.c  |  6 +--
>  drivers/accel/ivpu/ivpu_gem.c     | 70 ++++++++++++++++---------------
>  drivers/accel/ivpu/ivpu_gem.h     |  6 ++-
>  drivers/accel/ivpu/ivpu_hw_37xx.c | 10 ++---
>  drivers/accel/ivpu/ivpu_hw_40xx.c | 10 ++---
>  drivers/accel/ivpu/ivpu_ipc.c     | 12 +++---
>  drivers/accel/ivpu/ivpu_job.c     | 20 ++++++---
>  drivers/accel/ivpu/ivpu_pm.c      | 10 ++---
>  drivers/accel/ivpu/vpu_boot_api.h | 46 ++++++++++++++------
>  drivers/accel/ivpu/vpu_jsm_api.h  | 32 +++++++++-----
>  14 files changed, 194 insertions(+), 128 deletions(-)
> 
> --
> 2.43.0
