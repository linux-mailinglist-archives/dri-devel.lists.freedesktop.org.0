Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 100FEA06FEE
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 09:27:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7032310ED1B;
	Thu,  9 Jan 2025 08:27:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gMdPGvuh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC70210ED1B
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2025 08:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736411222; x=1767947222;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=sM8dFIXfql+F91R3uZmsNrx9CNHQk8Dkd9vd3yg45rA=;
 b=gMdPGvuhqrLIakrxVe3w3skfSZjXajMVlNcmMvV6rel+4qVLC5roSpDu
 FoaVRNOJ/zVXEuhFa//+JwoNjEhiv6/tHx/b8WCrxuCmfSGZsExd4JiGx
 vbdAvE5i0JBaplm1cyAht4AmbSMPnAL+pVnBmTy+Nagk2VLdTt6nWMGZ1
 05dxfOgsFdWu9891NMNhAXR8s4rzU436MxuADG26R5YLaqiPDrDpYP2XY
 zB0kpdFz3d9K+uzEib1bjCVhoGed8K1G7nc/3o21i57mQ8qYcSMut2qIK
 xfRlx/kBxR2bd5kwdly3206h8O9tWHHOAG1pBhWrjqZqlNGt4ix151TtW A==;
X-CSE-ConnectionGUID: DPR0Yko3S06q24qCyog4Zg==
X-CSE-MsgGUID: pgam/G3wSOuQjS//p3YvmA==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="62037686"
X-IronPort-AV: E=Sophos;i="6.12,300,1728975600"; d="scan'208";a="62037686"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2025 00:27:02 -0800
X-CSE-ConnectionGUID: sanpVOk9RzaYGn6MO4l9Mg==
X-CSE-MsgGUID: OcvA4+GDRDKMn5v8peZLJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="134232034"
Received: from mgorski-mobl1.ger.corp.intel.com (HELO [10.245.84.116])
 ([10.245.84.116])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2025 00:26:59 -0800
Message-ID: <e696c647-d60a-4f03-9f37-315bed2a7cab@linux.intel.com>
Date: Thu, 9 Jan 2025 09:26:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/14] accel/ivpu: Dump only first MMU fault from single
 context
To: Maciej Falkowski <maciej.falkowski@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 Karol Wachowski <karol.wachowski@intel.com>
References: <20250107173238.381120-1-maciej.falkowski@linux.intel.com>
 <20250107173238.381120-7-maciej.falkowski@linux.intel.com>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20250107173238.381120-7-maciej.falkowski@linux.intel.com>
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

Reviewed-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>

On 1/7/2025 6:32 PM, Maciej Falkowski wrote:
> From: Karol Wachowski <karol.wachowski@intel.com>
> 
> Stop dumping consecutive faults from an already faulty context immediately,
> instead of waiting for the context abort thread handler (IRQ handler bottom
> half) to abort currently executing jobs.
> 
> Remove 'R' (record events) bit from context descriptor of a faulty
> context to prevent future faults generation.
> 
> This change speeds up the IRQ handler by eliminating the need to print the
> fault content repeatedly. Additionally, it prevents flooding dmesg with
> errors, which was occurring due to the delay in the bottom half of the
> handler stopping fault-generating jobs.
> 
> Signed-off-by: Karol Wachowski <karol.wachowski@intel.com>
> Signed-off-by: Maciej Falkowski <maciej.falkowski@linux.intel.com>
> ---
>  drivers/accel/ivpu/ivpu_mmu.c         | 51 ++++++++++++++++++++++++---
>  drivers/accel/ivpu/ivpu_mmu_context.c | 13 -------
>  drivers/accel/ivpu/ivpu_mmu_context.h |  2 --
>  3 files changed, 46 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/accel/ivpu/ivpu_mmu.c b/drivers/accel/ivpu/ivpu_mmu.c
> index 21f820dd0c65..5ee4df892b3e 100644
> --- a/drivers/accel/ivpu/ivpu_mmu.c
> +++ b/drivers/accel/ivpu/ivpu_mmu.c
> @@ -870,23 +870,64 @@ static u32 *ivpu_mmu_get_event(struct ivpu_device *vdev)
>  	return evt;
>  }
>  
> +static int ivpu_mmu_disable_events(struct ivpu_device *vdev, u32 ssid)
> +{
> +	struct ivpu_mmu_info *mmu = vdev->mmu;
> +	struct ivpu_mmu_cdtab *cdtab = &mmu->cdtab;
> +	u64 *entry;
> +	u64 val;
> +
> +	if (ssid > IVPU_MMU_CDTAB_ENT_COUNT)
> +		return -EINVAL;
> +
> +	entry = cdtab->base + (ssid * IVPU_MMU_CDTAB_ENT_SIZE);
> +
> +	val = READ_ONCE(entry[0]);
> +	val &= ~IVPU_MMU_CD_0_R;
> +	WRITE_ONCE(entry[0], val);
> +
> +	if (!ivpu_is_force_snoop_enabled(vdev))
> +		clflush_cache_range(entry, IVPU_MMU_CDTAB_ENT_SIZE);
> +
> +	ivpu_mmu_cmdq_write_cfgi_all(vdev);
> +
> +	return 0;
> +}
> +
>  void ivpu_mmu_irq_evtq_handler(struct ivpu_device *vdev)
>  {
> +	struct ivpu_file_priv *file_priv;
> +	u32 last_ssid = -1;
>  	u32 *event;
>  	u32 ssid;
>  
>  	ivpu_dbg(vdev, IRQ, "MMU event queue\n");
>  
> -	while ((event = ivpu_mmu_get_event(vdev)) != NULL) {
> -		ivpu_mmu_dump_event(vdev, event);
> -
> +	while ((event = ivpu_mmu_get_event(vdev))) {
>  		ssid = FIELD_GET(IVPU_MMU_EVT_SSID_MASK, event[0]);
> +
> +		if (ssid == last_ssid)
> +			continue;
> +
> +		xa_lock(&vdev->context_xa);
> +		file_priv = xa_load(&vdev->context_xa, ssid);
> +		if (file_priv) {
> +			if (file_priv->has_mmu_faults) {
> +				event = NULL;
> +			} else {
> +				ivpu_mmu_disable_events(vdev, ssid);
> +				file_priv->has_mmu_faults = true;
> +			}
> +		}
> +		xa_unlock(&vdev->context_xa);
> +
> +		if (event)
> +			ivpu_mmu_dump_event(vdev, event);
> +
>  		if (ssid == IVPU_GLOBAL_CONTEXT_MMU_SSID) {
>  			ivpu_pm_trigger_recovery(vdev, "MMU event");
>  			return;
>  		}
> -
> -		ivpu_mmu_user_context_mark_invalid(vdev, ssid);
>  		REGV_WR32(IVPU_MMU_REG_EVTQ_CONS_SEC, vdev->mmu->evtq.cons);
>  	}
>  
> diff --git a/drivers/accel/ivpu/ivpu_mmu_context.c b/drivers/accel/ivpu/ivpu_mmu_context.c
> index 891967a95bc3..d373443bbc83 100644
> --- a/drivers/accel/ivpu/ivpu_mmu_context.c
> +++ b/drivers/accel/ivpu/ivpu_mmu_context.c
> @@ -631,16 +631,3 @@ void ivpu_mmu_reserved_context_fini(struct ivpu_device *vdev)
>  	ivpu_mmu_cd_clear(vdev, vdev->rctx.id);
>  	ivpu_mmu_context_fini(vdev, &vdev->rctx);
>  }
> -
> -void ivpu_mmu_user_context_mark_invalid(struct ivpu_device *vdev, u32 ssid)
> -{
> -	struct ivpu_file_priv *file_priv;
> -
> -	xa_lock(&vdev->context_xa);
> -
> -	file_priv = xa_load(&vdev->context_xa, ssid);
> -	if (file_priv)
> -		file_priv->has_mmu_faults = true;
> -
> -	xa_unlock(&vdev->context_xa);
> -}
> diff --git a/drivers/accel/ivpu/ivpu_mmu_context.h b/drivers/accel/ivpu/ivpu_mmu_context.h
> index 8042fc067062..f255310968cf 100644
> --- a/drivers/accel/ivpu/ivpu_mmu_context.h
> +++ b/drivers/accel/ivpu/ivpu_mmu_context.h
> @@ -37,8 +37,6 @@ void ivpu_mmu_global_context_fini(struct ivpu_device *vdev);
>  int ivpu_mmu_reserved_context_init(struct ivpu_device *vdev);
>  void ivpu_mmu_reserved_context_fini(struct ivpu_device *vdev);
>  
> -void ivpu_mmu_user_context_mark_invalid(struct ivpu_device *vdev, u32 ssid);
> -
>  int ivpu_mmu_context_insert_node(struct ivpu_mmu_context *ctx, const struct ivpu_addr_range *range,
>  				 u64 size, struct drm_mm_node *node);
>  void ivpu_mmu_context_remove_node(struct ivpu_mmu_context *ctx, struct drm_mm_node *node);

