Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC55E9B5ED1
	for <lists+dri-devel@lfdr.de>; Wed, 30 Oct 2024 10:26:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2915A10E766;
	Wed, 30 Oct 2024 09:26:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ceWxC8MQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B264B10E766
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Oct 2024 09:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730280376; x=1761816376;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=HsfxAB+P+hDedUzR6FdzPAI+XFT+oqysjF3WVe7LSJU=;
 b=ceWxC8MQpUjNkJsAaXvZvYTvIVjJBwokNgoReFeVfKz26nZGr5KggHm2
 mYDBl+BDmCAhu3brPh3+x9BwY3pzCYY3r7Xd51qfV3femf/EL8Or7ZCTW
 YtLrwUlTj53BTNJOrZKcWClG+cihR5HFgtTrIO/uuIPV3KL1IF88Xvb6B
 YQNri0/i+LAx3xHgQy4ej/YadZW+Vi+2OwSZqBtho6YDSX3jAN+mf6ZLC
 k47EzEHIzxO+YM7vgS6AD3vxiUokPznVX9eQEcUKLvnsCRm8yEazHYMNj
 tXQZkfWq7ipQvHUsztdBp99on15KqmK4JryaJryLT6DN+E4RPAHmsWxFC A==;
X-CSE-ConnectionGUID: CP75qLi/R+CsRVQm4WjjJg==
X-CSE-MsgGUID: M9xSjV2TRAq7FEDy0hIMiw==
X-IronPort-AV: E=McAfee;i="6700,10204,11240"; a="29869608"
X-IronPort-AV: E=Sophos;i="6.11,244,1725346800"; d="scan'208";a="29869608"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2024 02:26:17 -0700
X-CSE-ConnectionGUID: ArGRF6G9SFuvZdM4WskO5w==
X-CSE-MsgGUID: 4eRD517gQQSB1LYjSu+lQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,244,1725346800"; d="scan'208";a="82341912"
Received: from jcarrol-mobl.ger.corp.intel.com (HELO [10.245.85.88])
 ([10.245.85.88])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2024 02:26:15 -0700
Message-ID: <2c88f9ce-9006-4ee1-b64c-16839c8766e9@linux.intel.com>
Date: Wed, 30 Oct 2024 10:26:13 +0100
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

Applied to drm-mic-next

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

