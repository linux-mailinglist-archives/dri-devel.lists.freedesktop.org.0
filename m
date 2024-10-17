Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 819629A25CF
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2024 16:59:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF3D910E1FF;
	Thu, 17 Oct 2024 14:59:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nO31GE3W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DCDF10E1FF
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2024 14:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729177182; x=1760713182;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=AH/JsUKsS1nSbTjXvTJQktsRYmiPJK8SmnxFLtmncF4=;
 b=nO31GE3WLqJ0GkxL8I4hZiIVKyg+57RCKrp6wU79TdAZOYxmMsKVtDTJ
 nD88rGjDQMl3RTkamKI6BpFYOhCQvYXuuS2R9NZGjefrXmvXfLyI4rhSU
 wUnJ25zfknhlPBdtoDdl3CNt9/xwNcTIRAXOGE6o9Po7J0XAzJX3mqLXf
 5hd6frXoScmPiS447MJt1aiy2qqJl2YdZBqhrfq2zanS0VvjI9t9gX7Es
 A4qgq8Eu4sEqyZx8LMmvm5dRk8Ri65JW+hiE1RzyFoUrhpsV1g489oEjx
 KcTETWPIIqWkuqnsLltR4gD+7ZReGZHwalU3o02MpOWZrmb062M62P4Dd w==;
X-CSE-ConnectionGUID: ztYNGaJpSluAScXl0ngkaw==
X-CSE-MsgGUID: vsx47+NSQxW+gYWd1chHgg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28816835"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="28816835"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2024 07:59:42 -0700
X-CSE-ConnectionGUID: WWuCQ0i5Q8mwLU5LfKpjvQ==
X-CSE-MsgGUID: V1AGjhdJTKKzZUx4TepQxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,211,1725346800"; d="scan'208";a="78910408"
Received: from capawley-mobl2.ger.corp.intel.com (HELO [10.245.114.193])
 ([10.245.114.193])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2024 07:59:41 -0700
Message-ID: <72343f91-a75a-4067-a138-9477941a90ef@linux.intel.com>
Date: Thu, 17 Oct 2024 16:59:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/11] accel/ivpu: Changes for 6.13-rc5
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com
References: <20241017145817.121590-1-jacek.lawrynowicz@linux.intel.com>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20241017145817.121590-1-jacek.lawrynowicz@linux.intel.com>
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

Oops, I meant 6.13-rc1

On 10/17/2024 4:58 PM, Jacek Lawrynowicz wrote:
>  - Remove support for deprecated and unused copy engine
>  - Improved open() performance by lazy allocating MMU page tables
>  - Error handling fixes in MMU code
>  - Extend VPU address ranges to allow bigger workloads
> 
> Andrzej Kacprowski (1):
>   accel/ivpu: Remove copy engine support
> 
> Karol Wachowski (9):
>   accel/ivpu: Do not fail when more than 1 tile is fused
>   accel/ivpu: Defer MMU root page table allocation
>   accel/ivpu: Clear CDTAB entry in case of failure
>   accel/ivpu: Unmap partially mapped BOs in case of errors
>   accel/ivpu: Use xa_alloc_cyclic() instead of custom function
>   accel/ivpu: Make command queue ID allocated on XArray
>   accel/ivpu: Don't allocate preemption buffers when MIP is disabled
>   accel/ivpu: Increase DMA address range
>   accel/ivpu: Move secondary preemption buffer allocation to DMA range
> 
> Maciej Falkowski (1):
>   accel/ivpu: Add debug Kconfig option
> 
>  drivers/accel/ivpu/Kconfig            |  10 ++
>  drivers/accel/ivpu/Makefile           |   2 +
>  drivers/accel/ivpu/ivpu_drv.c         |  31 +++--
>  drivers/accel/ivpu/ivpu_drv.h         |  16 +--
>  drivers/accel/ivpu/ivpu_fw.c          |   8 +-
>  drivers/accel/ivpu/ivpu_hw.c          |  10 +-
>  drivers/accel/ivpu/ivpu_hw_btrs.c     |  12 +-
>  drivers/accel/ivpu/ivpu_job.c         | 148 ++++++++++--------------
>  drivers/accel/ivpu/ivpu_job.h         |   2 +
>  drivers/accel/ivpu/ivpu_jsm_msg.c     |   8 +-
>  drivers/accel/ivpu/ivpu_mmu.c         | 101 ++++++----------
>  drivers/accel/ivpu/ivpu_mmu.h         |   4 +-
>  drivers/accel/ivpu/ivpu_mmu_context.c | 158 ++++++++++++++------------
>  drivers/accel/ivpu/ivpu_mmu_context.h |   9 +-
>  drivers/accel/ivpu/ivpu_pm.c          |   2 +
>  include/uapi/drm/ivpu_accel.h         |   6 +-
>  16 files changed, 243 insertions(+), 284 deletions(-)
> 
> --
> 2.45.1

