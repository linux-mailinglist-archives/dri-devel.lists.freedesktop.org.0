Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FA3749C947
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jan 2022 13:08:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3164710E8EE;
	Wed, 26 Jan 2022 12:08:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FA3710E805;
 Wed, 26 Jan 2022 12:08:02 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id w11so13218384wra.4;
 Wed, 26 Jan 2022 04:08:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=lbVmftRj/JHZgc+JO+yUh8qOpPwaJkAadC/N/c5azzw=;
 b=FSNoyIq1VT1r7s2OaQhb47yaCXLQ+fKmFis8ErFHtaBdQUxq+YRyyS/6FzCFKndUYy
 VRaqyjwNgxu9ijAdDpdez7aLhHkSfV/D/EUqLcruH4z5+41pOt8Vegz1+WD7vncs9TQe
 ecW9kx4oF0xZXXid4qMUN1rsfI2TYAeLoPyjO+bTOgSEpavF8YFw+TpnqKE/91mWtaWJ
 B3DZAtnXADs205gABuUNUx2gCQgB4zqy0Qr5cz13+qhWjKsTadYUm1l+XVVcF14ClGvK
 L8KiUb7rHy4l/wjt969MQkdU1m35T4fIVqLxwZ6FmOr2XBipgu6PRDTf9GvozvGprnG/
 0PFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=lbVmftRj/JHZgc+JO+yUh8qOpPwaJkAadC/N/c5azzw=;
 b=niD8fMW3pAItoEnXamYMeCjvr20QTztiDCcVQHO448H6xUItBf6mLP+DlIjFYOx1Wx
 st3ocsdmeFCTCiBEQ2cnV37xgv/EUQtc2JVGNCNn2E0tBBNeoeN41HC/a8y7kC7pakn4
 0Xi8CDeGv1iayy7QSOeVVqU3QIoVNMnETacr0DKIc3DW/UAcDE7NE+YR1bKmsokZKMlT
 89RkB+dAG9oFANsMZG5r8LHKSGe73Cu+PMY2fD3qe0QTkCFeAOmsJh2od9jMPnt1eXGn
 +HrCI1pD6iobMsldcRXiD79dU/QYEz5WR5B7mEdAj8iou/V/A9yiM8pvu+GvuJDSXwcG
 f6kg==
X-Gm-Message-State: AOAM532ZZDyj2rTSI//MbmwuOzTxPHgz6H4VL9jBGl2XdaEVI6hml9+j
 543JvRmzGCd/gCyyN0IUu5hJ8EgvqOM=
X-Google-Smtp-Source: ABdhPJzYvAdK0Ojxr3MllcNWaB58xvdL4ya2skXTA6xRoj0jB8omtGk56qOOAWcQZHZXn5jEqoIwLw==
X-Received: by 2002:a5d:588b:: with SMTP id n11mr21644120wrf.375.1643198880968; 
 Wed, 26 Jan 2022 04:08:00 -0800 (PST)
Received: from ?IPV6:2a02:908:1252:fb60:6cbd:23a3:7abe:f6e2?
 ([2a02:908:1252:fb60:6cbd:23a3:7abe:f6e2])
 by smtp.gmail.com with ESMTPSA id o3sm19636365wrq.70.2022.01.26.04.07.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jan 2022 04:08:00 -0800 (PST)
Message-ID: <83d7433c-30e0-6aa0-a9a4-68c9ad8f81ec@gmail.com>
Date: Wed, 26 Jan 2022 13:07:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RFC v3 01/12] drm/amdgpu: Introduce reset domain
Content-Language: en-US
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20220125223752.200211-1-andrey.grodzovsky@amd.com>
 <20220125223752.200211-2-andrey.grodzovsky@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20220125223752.200211-2-andrey.grodzovsky@amd.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, horace.chen@amd.com,
 lijo.lazar@amd.com, jingwech@amd.com, christian.koenig@amd.com,
 Monk.Liu@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 25.01.22 um 23:37 schrieb Andrey Grodzovsky:
> Defined a reset_domain struct such that
> all the entities that go through reset
> together will be serialized one against
> another. Do it for both single device and
> XGMI hive cases.
>
> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> Suggested-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> Suggested-by: Christian König <ckoenig.leichtzumerken@gmail.com>
> Reviewed-by: Christian König <christian.koenig@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu.h        |  7 +++++++
>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 20 +++++++++++++++++++-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c   |  9 +++++++++
>   drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.h   |  2 ++
>   4 files changed, 37 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> index 9f017663ac50..b5ff76aae7e0 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> @@ -812,6 +812,11 @@ struct amd_powerplay {
>   
>   #define AMDGPU_RESET_MAGIC_NUM 64
>   #define AMDGPU_MAX_DF_PERFMONS 4
> +
> +struct amdgpu_reset_domain {
> +	struct workqueue_struct *wq;
> +};
> +
>   struct amdgpu_device {
>   	struct device			*dev;
>   	struct pci_dev			*pdev;
> @@ -1096,6 +1101,8 @@ struct amdgpu_device {
>   
>   	struct amdgpu_reset_control     *reset_cntl;
>   	uint32_t                        ip_versions[HW_ID_MAX][HWIP_MAX_INSTANCE];
> +
> +	struct amdgpu_reset_domain	reset_domain;

I'm a bit confused, shouldn't this be a pointer?

Regards,
Christian.

>   };
>   
>   static inline struct amdgpu_device *drm_to_adev(struct drm_device *ddev)
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index 90d22a376632..0f3e6c078f88 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -2391,9 +2391,27 @@ static int amdgpu_device_ip_init(struct amdgpu_device *adev)
>   	if (r)
>   		goto init_failed;
>   
> -	if (adev->gmc.xgmi.num_physical_nodes > 1)
> +	if (adev->gmc.xgmi.num_physical_nodes > 1) {
> +		struct amdgpu_hive_info *hive;
> +
>   		amdgpu_xgmi_add_device(adev);
>   
> +		hive = amdgpu_get_xgmi_hive(adev);
> +		if (!hive || !hive->reset_domain.wq) {
> +			DRM_ERROR("Failed to obtain reset domain info for XGMI hive:%llx", hive->hive_id);
> +			r = -EINVAL;
> +			goto init_failed;
> +		}
> +
> +		adev->reset_domain.wq = hive->reset_domain.wq;
> +	} else {
> +		adev->reset_domain.wq = alloc_ordered_workqueue("amdgpu-reset-dev", 0);
> +		if (!adev->reset_domain.wq) {
> +			r = -ENOMEM;
> +			goto init_failed;
> +		}
> +	}
> +
>   	/* Don't init kfd if whole hive need to be reset during init */
>   	if (!adev->gmc.xgmi.pending_reset)
>   		amdgpu_amdkfd_device_init(adev);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
> index 567df2db23ac..a858e3457c5c 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
> @@ -392,6 +392,14 @@ struct amdgpu_hive_info *amdgpu_get_xgmi_hive(struct amdgpu_device *adev)
>   		goto pro_end;
>   	}
>   
> +	hive->reset_domain.wq = alloc_ordered_workqueue("amdgpu-reset-hive", 0);
> +	if (!hive->reset_domain.wq) {
> +		dev_err(adev->dev, "XGMI: failed allocating wq for reset domain!\n");
> +		kfree(hive);
> +		hive = NULL;
> +		goto pro_end;
> +	}
> +
>   	hive->hive_id = adev->gmc.xgmi.hive_id;
>   	INIT_LIST_HEAD(&hive->device_list);
>   	INIT_LIST_HEAD(&hive->node);
> @@ -401,6 +409,7 @@ struct amdgpu_hive_info *amdgpu_get_xgmi_hive(struct amdgpu_device *adev)
>   	task_barrier_init(&hive->tb);
>   	hive->pstate = AMDGPU_XGMI_PSTATE_UNKNOWN;
>   	hive->hi_req_gpu = NULL;
> +
>   	/*
>   	 * hive pstate on boot is high in vega20 so we have to go to low
>   	 * pstate on after boot.
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.h
> index d2189bf7d428..6121aaa292cb 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.h
> @@ -42,6 +42,8 @@ struct amdgpu_hive_info {
>   		AMDGPU_XGMI_PSTATE_MAX_VEGA20,
>   		AMDGPU_XGMI_PSTATE_UNKNOWN
>   	} pstate;
> +
> +	struct amdgpu_reset_domain reset_domain;
>   };
>   
>   struct amdgpu_pcs_ras_field {

