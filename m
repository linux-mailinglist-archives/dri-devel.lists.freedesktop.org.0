Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B51A30633
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2025 09:47:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CD3010E441;
	Tue, 11 Feb 2025 08:47:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HnkdF70W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 279C910E441
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2025 08:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739263640; x=1770799640;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=O2n4k7Gt1NVYYJ2SAPrLTlEttn/2uOimh2XBrjHMAOk=;
 b=HnkdF70WaaGV1HXgCLS37oEusDHUDpQUptkzFu96pNO5/qz5U3SU4s5v
 6q1PZya4GNZMpUch390yWdOFr8fJdiBvN6GY/OxXe0Heq6BRuKIC8WPod
 qd/lYK80fu8/wuMFZyjXan629MJQn/8x+a+jUEpJBd4lMr1m+z+w0d9gR
 Qm3JuW76qsLCLSLfNFwPcesO5xVmAtGgL98RcvhQiifrd627ds0I7lBXJ
 c4J7v1fFNvfUdm3A9X/cKIGgy+YAdD6FvNP4hOCikjvTHf2ZaAe5aAwtq
 jQUBRmc6AuSsQHCXheX4XbpTmAt420TVz8xE5g1aK2qgb7uYACxcPxwA0 Q==;
X-CSE-ConnectionGUID: 5Ai2T5ZERhi7Dr4Yrd2Isg==
X-CSE-MsgGUID: eaUWtHm1Q9ClnZ5fcBFp6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="50099553"
X-IronPort-AV: E=Sophos;i="6.13,277,1732608000"; d="scan'208";a="50099553"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2025 00:47:20 -0800
X-CSE-ConnectionGUID: fc5CPoz5SYuvotnO9i1Nuw==
X-CSE-MsgGUID: 3e5LvWukQHyPSy2STXvTRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,277,1732608000"; d="scan'208";a="112662467"
Received: from unknown (HELO [10.217.160.151]) ([10.217.160.151])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2025 00:47:18 -0800
Message-ID: <d459faf0-a180-496a-a809-db5b5a247e94@linux.intel.com>
Date: Tue, 11 Feb 2025 09:47:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] accel/amdxdna: Add missing include linux/slab.h
To: Su Hui <suhui@nfschina.com>, min.ma@amd.com, lizhi.hou@amd.com,
 ogabbay@kernel.org
Cc: quic_jhugo@quicinc.com, George.Yang@amd.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
References: <20250211015354.3388171-1-suhui@nfschina.com>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20250211015354.3388171-1-suhui@nfschina.com>
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

Reviewed-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>

On 2/11/2025 2:53 AM, Su Hui wrote:
> When compiling without CONFIG_IA32_EMULATION, there can be some errors:
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
> Reviewed-by: Lizhi Hou <lizhi.hou@amd.com>
> ---
> v2:
>  - move the header to the include block above and keep it sorted(Jacek Lawrynowicz).
> 
>  drivers/accel/amdxdna/amdxdna_mailbox.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/accel/amdxdna/amdxdna_mailbox.c b/drivers/accel/amdxdna/amdxdna_mailbox.c
> index 814b16bb1953..e5301fac1397 100644
> --- a/drivers/accel/amdxdna/amdxdna_mailbox.c
> +++ b/drivers/accel/amdxdna/amdxdna_mailbox.c
> @@ -8,6 +8,7 @@
>  #include <linux/bitfield.h>
>  #include <linux/interrupt.h>
>  #include <linux/iopoll.h>
> +#include <linux/slab.h>
>  #include <linux/xarray.h>
>  
>  #define CREATE_TRACE_POINTS

