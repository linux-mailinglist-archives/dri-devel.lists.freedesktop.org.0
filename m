Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA4C6AC664E
	for <lists+dri-devel@lfdr.de>; Wed, 28 May 2025 11:53:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 262D010E5BC;
	Wed, 28 May 2025 09:53:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MpTfSvyG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2DF910E5D3
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 09:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748425981; x=1779961981;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=G8m2VIyJ1oaYrxLyITuTgVmwgXSF8x0XlhA6oqokA1Y=;
 b=MpTfSvyGP1FMYV6tQ/4p2y28PRsqOllUI03JMmEUJv73gmU9p2xKA66S
 fREiKgT5AX+4ymeVCmfkNYFEtxIKgjC03ZXkWq94n5uMRGNupsLmSVJUL
 fOjvtBOAoU7oBCe966d8ggMD8IKfIXD07MbfOo9X4CIYutRvxLoRrDK6x
 4Du77f0kVhoYt4M5foEPDlDnmGKWXgB71a5t3uEvVOmrkqRtFUr9MU/Kr
 cB174vgmX0KbXpZz9oh5RDav/qOVaiHUKdgOEgXxCqcYN0mLVq0jX6v0p
 PY26OWHg7eKcHv0Wd56b7B89yMhxV/yRMppGPH1vlP1NSC/8ZVPrxSxTm g==;
X-CSE-ConnectionGUID: myUrB5pvREOpi4UnjRVWpw==
X-CSE-MsgGUID: pCJ6BNzBTt6oIEsIeVJvTg==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="50143919"
X-IronPort-AV: E=Sophos;i="6.15,320,1739865600"; d="scan'208";a="50143919"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 02:53:01 -0700
X-CSE-ConnectionGUID: OTAMnUatQbmdfL9gQkAiLg==
X-CSE-MsgGUID: 5708oBKpRpK9BqEJWOMwGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,320,1739865600"; d="scan'208";a="148234816"
Received: from fbeltech-mobl2.ger.corp.intel.com (HELO [10.245.80.225])
 ([10.245.80.225])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 02:53:01 -0700
Message-ID: <7aca9034-6797-4332-a385-8c70c045b011@linux.intel.com>
Date: Wed, 28 May 2025 11:52:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/ivpu: Reorder Doorbell Unregister and Command Queue
 Destruction
To: dri-devel@lists.freedesktop.org
Cc: jeff.hugo@oss.qualcomm.com, lizhi.hou@amd.com,
 Karol Wachowski <karol.wachowski@intel.com>
References: <20250515094124.255141-1-jacek.lawrynowicz@linux.intel.com>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20250515094124.255141-1-jacek.lawrynowicz@linux.intel.com>
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

Applied to drm-misc-fixes

On 5/15/2025 11:41 AM, Jacek Lawrynowicz wrote:
> From: Karol Wachowski <karol.wachowski@intel.com>
> 
> Refactor ivpu_cmdq_unregister() to ensure the doorbell is unregistered
> before destroying the command queue. The NPU firmware requires doorbells
> to be unregistered prior to command queue destruction.
> 
> If doorbell remains registered when command queue destroy command is sent
> firmware will automatically unregister the doorbell, making subsequent
> unregister attempts no-operations (NOPs).
> 
> Ensure compliance with firmware expectations by moving the doorbell
> unregister call ahead of the command queue destruction logic,
> thus preventing unnecessary NOP operation.
> 
> Fixes: 465a3914b254 ("accel/ivpu: Add API for command queue create/destroy/submit")
> Signed-off-by: Karol Wachowski <karol.wachowski@intel.com>
> Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
> ---
>  drivers/accel/ivpu/ivpu_job.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/accel/ivpu/ivpu_job.c b/drivers/accel/ivpu/ivpu_job.c
> index b28da35c30b67..1c8e283ad9854 100644
> --- a/drivers/accel/ivpu/ivpu_job.c
> +++ b/drivers/accel/ivpu/ivpu_job.c
> @@ -247,6 +247,10 @@ static int ivpu_cmdq_unregister(struct ivpu_file_priv *file_priv, struct ivpu_cm
>  	if (!cmdq->db_id)
>  		return 0;
>  
> +	ret = ivpu_jsm_unregister_db(vdev, cmdq->db_id);
> +	if (!ret)
> +		ivpu_dbg(vdev, JOB, "DB %d unregistered\n", cmdq->db_id);
> +
>  	if (vdev->fw->sched_mode == VPU_SCHEDULING_MODE_HW) {
>  		ret = ivpu_jsm_hws_destroy_cmdq(vdev, file_priv->ctx.id, cmdq->id);
>  		if (!ret)
> @@ -254,10 +258,6 @@ static int ivpu_cmdq_unregister(struct ivpu_file_priv *file_priv, struct ivpu_cm
>  				 cmdq->id, file_priv->ctx.id);
>  	}
>  
> -	ret = ivpu_jsm_unregister_db(vdev, cmdq->db_id);
> -	if (!ret)
> -		ivpu_dbg(vdev, JOB, "DB %d unregistered\n", cmdq->db_id);
> -
>  	xa_erase(&file_priv->vdev->db_xa, cmdq->db_id);
>  	cmdq->db_id = 0;
>  

