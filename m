Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C373EA2A801
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2025 12:59:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43E7610E82C;
	Thu,  6 Feb 2025 11:59:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UJEnvV/Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 203DE10E82C;
 Thu,  6 Feb 2025 11:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738843175; x=1770379175;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ioPTGCPofV7P0tYMQ4o8OJoZbYdhcIwWFsqfn2L38M4=;
 b=UJEnvV/YqtOngAJmIXMTalDCBh1KqRgBHWB12lg045d02Qs61Ad/Gkyt
 n1uNVkZIcj1VTjMiiiw9KkSNbWuxqaJl2ewsBm9fi6rlTO667Sw7TumoU
 pHzs7H5ZkfIUTeEGDyh+tjW2vvb9vJ/iMPHKuaxVkIv7ezR+8V249OKhe
 52DmyzsQQTJj9gqpsl2p4cN8qt3IkiRhyPZ1MyvtJjxVTuZj9lPnDB9wG
 7lzRd2+SvzT/AKAwNjK7UwfwaxsxtGNtxTaV6jARrP9e/DbVcjCKaa0Ug
 4jY6+T70oIJHRRmxD344RDjzRUGQVLy9100XmF9qMlowRU6GVoKWoTxqc w==;
X-CSE-ConnectionGUID: xZiittCqRj6Z90nJwZYuUw==
X-CSE-MsgGUID: Izcz1/QFRiCl5CrdPLXOMA==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39336034"
X-IronPort-AV: E=Sophos;i="6.13,264,1732608000"; d="scan'208";a="39336034"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2025 03:59:35 -0800
X-CSE-ConnectionGUID: yYgjYDCMQByCg51kYtppzQ==
X-CSE-MsgGUID: NM5ahS0wSIaMk76ftmKLVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,264,1732608000"; d="scan'208";a="110972140"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO [10.245.245.197])
 ([10.245.245.197])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2025 03:59:33 -0800
Message-ID: <f94d793f-bfde-411c-afa1-3325692356a6@intel.com>
Date: Thu, 6 Feb 2025 11:59:30 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: Add TTM reviewers
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Dave Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250206103544.36971-1-thomas.hellstrom@linux.intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20250206103544.36971-1-thomas.hellstrom@linux.intel.com>
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

On 06/02/2025 10:35, Thomas Hellström wrote:
> Add Matthew Auld and Matthew Brost as TTM reviewers
> 
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Dave Airlie <airlied@gmail.com>
> Cc: Simona Vetter <simona.vetter@ffwll.ch>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Reviewed-by: Christian König <christian.koenig@amd.com>

Acked-by: Matthew Auld <matthew.auld@intel.com>

> ---
>   MAINTAINERS | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 4dbf6a03e416..7a032ea9f109 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7931,6 +7931,8 @@ F:	include/drm/drm_privacy_screen*
>   DRM TTM SUBSYSTEM
>   M:	Christian Koenig <christian.koenig@amd.com>
>   M:	Huang Rui <ray.huang@amd.com>
> +R:	Matthew Auld <matthew.auld@intel.com>
> +R:	Matthew Brost <matthew.brost@intel.com>
>   L:	dri-devel@lists.freedesktop.org
>   S:	Maintained
>   T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git

