Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C48F7E5A06
	for <lists+dri-devel@lfdr.de>; Wed,  8 Nov 2023 16:30:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73DC910E478;
	Wed,  8 Nov 2023 15:30:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E63D910E79F
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Nov 2023 15:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699457449; x=1730993449;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=GCZ1rPgZXn4zcstlpHyUx5/sgQk6gmN2H20rBm05+Vs=;
 b=DEdQEkt58r30R+vDvBIhYSA5F+FggvDVy3Z1HOAAVNEKmCqM7gqLN02X
 5lCS+YQc2BmPVkdTc3bYjuoRvhT87sO59vAPDRK/RfYMSmMOzTasQ5VeL
 kNyGIybC//U/ZyEHmN+AZjVRYKYe3fnCg4T5tKQudlkgnlpC8qkBfOgj/
 Pk7l25WqSjD7vLENsdDiZtqOkApbhzfkEfrTtbxLn+6xohkE8G6DyUthY
 EXlT8ClPSTjLvCAs1wwIU6vPQ3L9Vpll1CnBNdj7CTxjEH06zPhvv49mG
 OJcu9pJWZzMT0JdGYUP2aVYsDC2/gYM2xFgnc7gvk/T1brB3evrTacUVM A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="476014915"
X-IronPort-AV: E=Sophos;i="6.03,286,1694761200"; d="scan'208";a="476014915"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2023 07:30:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="756568938"
X-IronPort-AV: E=Sophos;i="6.03,286,1694761200"; d="scan'208";a="756568938"
Received: from jlawryno-mobl.ger.corp.intel.com (HELO [10.249.150.108])
 ([10.249.150.108])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2023 07:30:48 -0800
Message-ID: <31be3576-d7df-46f1-975e-2e7e9800efa4@linux.intel.com>
Date: Wed, 8 Nov 2023 16:30:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] accel/ivpu: Use GEM shmem
To: dri-devel@lists.freedesktop.org
References: <20231031073156.1301669-1-stanislaw.gruszka@linux.intel.com>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20231031073156.1301669-1-stanislaw.gruszka@linux.intel.com>
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

On 31.10.2023 08:31, Stanislaw Gruszka wrote:
> Use GEM shmem for buffer management code;
> 
> Previously sent as RFC:
> https://lore.kernel.org/dri-devel/20230901164842.178654-1-stanislaw.gruszka@linux.intel.com/
> 
> Compared to RFC only changelog's were improved.
> 
> Jacek Lawrynowicz (4):
>   accel/ivpu: Allocate vpu_addr in gem->open() callback
>   accel/ivpu: Fix locking in ivpu_bo_remove_all_bos_from_context()
>   accel/ivpu: Remove support for uncached buffers
>   accel/ivpu: Use GEM shmem helper for all buffers
> 
>  drivers/accel/ivpu/Kconfig            |   2 +-
>  drivers/accel/ivpu/ivpu_drv.c         |  13 +-
>  drivers/accel/ivpu/ivpu_drv.h         |   3 +
>  drivers/accel/ivpu/ivpu_fw.c          |   2 +-
>  drivers/accel/ivpu/ivpu_gem.c         | 678 ++++++++------------------
>  drivers/accel/ivpu/ivpu_gem.h         |  75 +--
>  drivers/accel/ivpu/ivpu_job.c         |   8 +-
>  drivers/accel/ivpu/ivpu_mmu.c         |   5 +-
>  drivers/accel/ivpu/ivpu_mmu_context.c |  38 +-
>  drivers/accel/ivpu/ivpu_mmu_context.h |  11 +-
>  include/uapi/drm/ivpu_accel.h         |   2 +-
>  11 files changed, 266 insertions(+), 571 deletions(-)
> 
