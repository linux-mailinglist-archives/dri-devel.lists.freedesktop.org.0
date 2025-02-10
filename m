Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11AE5A2E811
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2025 10:43:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF38510E4DD;
	Mon, 10 Feb 2025 09:43:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Sa87ltDx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6209210E4DD
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 09:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739180614; x=1770716614;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=0pUNFOEBOA/bUdc92ju0BJmYOTZUzllU9khd7afAmBk=;
 b=Sa87ltDxS8HYG0otW5hWUsqW5srPJLFDAG4+CiTIkrLaapVZbbxr/HDe
 KPzmGyvAiTmzTqce/3bhR0oBSTZSxtQw2FnogyT0h1w/jPONsaYK45E2A
 4BJlTDGxymkMmsJiY5wDmSqYgzdAio5VsyFE/JyJ/dcU/wS4z5P1bjC92
 4+RwYoMSYCOlPV2DuYZYphClqVP1FU5+zLHlIIr5NJ25VL7yP84i5+4kM
 jJ38Xr+nrfim4JvRpSJdiqIPOcUtuL1rGDLVKktRJrtVIt2nQxQnPX9ac
 HvredeICGntXEBYCR40M1gooDLvXx7HModRhFBpULm5siSQumY1xXKc5v w==;
X-CSE-ConnectionGUID: aRLP84L5TVS4R+FBSrZCVA==
X-CSE-MsgGUID: u/Eo8MQlQtyP9Kgmvq8B5A==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="50737154"
X-IronPort-AV: E=Sophos;i="6.13,274,1732608000"; d="scan'208";a="50737154"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2025 01:43:33 -0800
X-CSE-ConnectionGUID: O7W/l4usSU6qZYIIoAae/Q==
X-CSE-MsgGUID: pcTRZCcsSBeLLVNUDYD+7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="116208180"
Received: from mgorski-mobl1.ger.corp.intel.com (HELO [10.245.84.116])
 ([10.245.84.116])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2025 01:43:29 -0800
Message-ID: <43eb87f7-0d47-43a7-b34a-9180f50de3b2@linux.intel.com>
Date: Mon, 10 Feb 2025 10:43:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/amdxdna: Add missing include linux/slab.h
To: Su Hui <suhui@nfschina.com>, min.ma@amd.com, lizhi.hou@amd.com,
 ogabbay@kernel.org
Cc: quic_jhugo@quicinc.com, George.Yang@amd.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
References: <20250208080548.1062441-1-suhui@nfschina.com>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20250208080548.1062441-1-suhui@nfschina.com>
Content-Type: text/plain; charset=UTF-8
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

Hi,

please move the header to the include block above an keep it sorted:
#include <linux/iopoll.h>
-->#include <linux/slab.h><--
#include <linux/xarray.h>


On 2/8/2025 9:05 AM, Su Hui wrote:
> When compiling without CONFIG_IA32_EMULATION, there are some errors:
> 
> drivers/accel/amdxdna/amdxdna_mailbox.c: In function ‘mailbox_release_msg’:
> drivers/accel/amdxdna/amdxdna_mailbox.c:197:2: error: implicit declaration
> of function ‘kfree’.
>   197 |  kfree(mb_msg);
>       |  ^~~~~
> drivers/accel/amdxdna/amdxdna_mailbox.c: In function ‘xdna_mailbox_send_msg’:
> drivers/accel/amdxdna/amdxdna_mailbox.c:418:11: error:implicit declaration
> of function ‘kzalloc’.
>   418 |  mb_msg = kzalloc(sizeof(*mb_msg) + pkg_size, GFP_KERNEL);
>       |           ^~~~~~~
> 
> Add the missing include.
> 
> Fixes: b87f920b9344 ("accel/amdxdna: Support hardware mailbox")
> Signed-off-by: Su Hui <suhui@nfschina.com>
> ---
>  drivers/accel/amdxdna/amdxdna_mailbox.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/accel/amdxdna/amdxdna_mailbox.c b/drivers/accel/amdxdna/amdxdna_mailbox.c
> index 814b16bb1953..80b4b20addd6 100644
> --- a/drivers/accel/amdxdna/amdxdna_mailbox.c
> +++ b/drivers/accel/amdxdna/amdxdna_mailbox.c
> @@ -12,6 +12,7 @@
>  
>  #define CREATE_TRACE_POINTS
>  #include <trace/events/amdxdna.h>
> +#include <linux/slab.h>
>  
>  #include "amdxdna_mailbox.h"
>  

