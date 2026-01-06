Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64D55CF9439
	for <lists+dri-devel@lfdr.de>; Tue, 06 Jan 2026 17:08:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C2F610E51A;
	Tue,  6 Jan 2026 16:08:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IT//WTsa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D499310E51A;
 Tue,  6 Jan 2026 16:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767715723; x=1799251723;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=vYuyr9p9PDRjQ1A7P2i31hH3OkA5pGRFUrFLXA32ASI=;
 b=IT//WTsaQai9VF2ynbl0gINi8h/t6f6cVS3vuWW0o0YLGPGjM+GYcUUn
 gl+WeQN8OS24eOc3eaTmPqjVi+NYFb6KPVaTwizAuyTuu7ZU9NIX60wd1
 ptGqkB5I505SBirW+b1x8TJAD3PyiC1qq4YSIGIA0oDPBuFe+Ak53GX80
 29CNtFHSMopWFC1e6PjrJhwCIiIzJPKTy3RF3hUCv8PN8glmdlGg58pQD
 nNaBU3PsrMaSQS2MwvZx3Voc/HYFQJIocLXWteu4ttzbI2SGLzDg7dJad
 qDdHNIKLG92yvTQ8qkXmtZhp3ZR/2L305ShxZxPhHSKYYjuC/3R6Q+moG A==;
X-CSE-ConnectionGUID: Nx4sPWtqQ0ShDE7sA/wJ7Q==
X-CSE-MsgGUID: tHYHtq9VRJWACSLFYa5WmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="94550177"
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; d="scan'208";a="94550177"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2026 08:08:42 -0800
X-CSE-ConnectionGUID: NXXY2jrzQVOjwSg0ysyWjA==
X-CSE-MsgGUID: EJsBuTf2TMGvcA3JpOlEuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; d="scan'208";a="201825229"
Received: from amilburn-desk.amilburn-desk (HELO [10.245.245.21])
 ([10.245.245.21])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2026 08:08:42 -0800
Message-ID: <a814c4c7-8f45-47dd-97b3-e1c2e4755c80@intel.com>
Date: Tue, 6 Jan 2026 16:08:39 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/tests/drm_buddy: Add tests for allocations
 exceeding max_order
To: Sanjay Yadav <sanjay.kumar.yadav@intel.com>,
 dri-devel@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
References: <20251222065238.1661415-4-sanjay.kumar.yadav@intel.com>
 <20251222065238.1661415-6-sanjay.kumar.yadav@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20251222065238.1661415-6-sanjay.kumar.yadav@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 22/12/2025 06:52, Sanjay Yadav wrote:
> Add kunit tests that exercise edge cases where allocation requests
> exceed mm->max_order after rounding. This can happen with
> non-power-of-two VRAM sizes when the allocator rounds up requests.
> 
> For example, with 10G VRAM (8G + 2G roots), mm->max_order represents
> the 8G block. A 9G allocation can round up to 16G in multiple ways:
> CONTIGUOUS allocation rounds to next power-of-two, or non-CONTIGUOUS
> with 8G min_block_size rounds to next alignment boundary.
> 
> The test validates CONTIGUOUS and RANGE flag combinations, ensuring that
> only CONTIGUOUS-alone allocations use try_harder fallback, while other
> combinations return -EINVAL when rounded size exceeds memory, preventing
> BUG_ON assertions.
> 
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
> Suggested-by: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Sanjay Yadav <sanjay.kumar.yadav@intel.com>

Reviewed-by: Matthew Auld <matthew.auld@intel.com>

