Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84464D1F992
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jan 2026 16:04:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2608410E172;
	Wed, 14 Jan 2026 15:04:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j6055P/y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D34810E172
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 15:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768403065; x=1799939065;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=xTAXUj/MnpHGClgPweHYBddg/2ywyz49ZKhJQ6HmJyY=;
 b=j6055P/ypUUEqtWn1jQY5DdI3aTea+Keh9C7bmISX55DcpElvHLoAcRz
 kLOk6H2EWESqDc8qQ40wMDSk3CAKHdgJ1gojiUNRwNrrFyYEwwU25TXta
 Ejw/UEraeJ06poWPI4xgb6Bk1WcwZ3H8mtWtCMFmDHJ8MajGS40IVZDT3
 AnCaCSQ9XucOwbQrame2mKNOTIRm9Aw+oDmnM3Hm2CBqG30FXxbjDi5qK
 2RA9a4/eTbRUVJ0qZsHSjTus5dI1yHeKIYggJy4i25TS83MtF0CluRX1K
 UDQnkRVSef6tdnuUl2sXinpUo+KnxHZH4aFd4FhQssVXacxcRjEb+VWQp g==;
X-CSE-ConnectionGUID: TgmkzdLKRHWk0Obfcm5C4Q==
X-CSE-MsgGUID: J3rD7iORRVKji6kcpOFMTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="69866532"
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; d="scan'208";a="69866532"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2026 07:04:24 -0800
X-CSE-ConnectionGUID: 5hqrb4YXTaeAVn2/WUYfTA==
X-CSE-MsgGUID: JTZ1z8/jSAKDq3kqcavSjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; d="scan'208";a="209744682"
Received: from mfalkows-mobl.ger.corp.intel.com (HELO [10.94.253.247])
 ([10.94.253.247])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2026 07:04:23 -0800
Message-ID: <cf84b137-5bf7-4688-82e6-49c185ca9cb6@linux.intel.com>
Date: Wed, 14 Jan 2026 16:04:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1] accel/amdxdna: Fix notifier_wq flushing warning
To: Lizhi Hou <lizhi.hou@amd.com>, ogabbay@kernel.org,
 quic_jhugo@quicinc.com, dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, max.zhen@amd.com, sonal.santan@amd.com,
 mario.limonciello@amd.com
References: <20260113173624.256053-1-lizhi.hou@amd.com>
Content-Language: en-US
From: "Falkowski, Maciej" <maciej.falkowski@linux.intel.com>
In-Reply-To: <20260113173624.256053-1-lizhi.hou@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

Reviewed-by: Maciej Falkowski <maciej.falkowski@linux.intel.com>

On 1/13/2026 6:36 PM, Lizhi Hou wrote:
> Create notifier_wq with WQ_MEM_RECLAIM flag to fix the possible warning.
>
>    workqueue: WQ_MEM_RECLAIM amdxdna_js:drm_sched_free_job_work [gpu_sched] is flushing !WQ_MEM_RECLAIM notifier_wq:0x0
>
> Fixes: e486147c912f ("accel/amdxdna: Add BO import and export")
> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
> ---
>   drivers/accel/amdxdna/amdxdna_pci_drv.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/accel/amdxdna/amdxdna_pci_drv.c b/drivers/accel/amdxdna/amdxdna_pci_drv.c
> index a7968fd140a9..1c83efb51f7d 100644
> --- a/drivers/accel/amdxdna/amdxdna_pci_drv.c
> +++ b/drivers/accel/amdxdna/amdxdna_pci_drv.c
> @@ -277,7 +277,7 @@ static int amdxdna_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>   		fs_reclaim_release(GFP_KERNEL);
>   	}
>   
> -	xdna->notifier_wq = alloc_ordered_workqueue("notifier_wq", 0);
> +	xdna->notifier_wq = alloc_ordered_workqueue("notifier_wq", WQ_MEM_RECLAIM);
>   	if (!xdna->notifier_wq)
>   		return -ENOMEM;
>   
