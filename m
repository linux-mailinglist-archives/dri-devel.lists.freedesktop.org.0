Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B21794AEB88
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 08:54:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3691610E453;
	Wed,  9 Feb 2022 07:54:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20A0F10E3FE;
 Wed,  9 Feb 2022 07:54:45 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id a8so4806306ejc.8;
 Tue, 08 Feb 2022 23:54:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=T8VcAKbjJkQ4QKlnbd1DDwyxeMFhoJIv6sEL6W8M5Lk=;
 b=WZUeETMGIE88oyQpYzNPqlQlYaB7Y3WlKP45jd9C/6y3bZIV0BDUP4OB3EPNOLeHvq
 bKf69AM4IJkq9+zkhzj8pm3IHQLqgpB6l7OiqH2bj/jOkoKyUEnWH1dnDAUR4aYt/URw
 7EZnl5PQbAgcn+7Fxy16et52O5eFbla00j8W0vnsheI4L/4omxwVGAxGlkT26x+wvvvV
 WLEQV8xjSIobJe/DhAcXwFkS1ptl7IP3xcBjVZSRyT1mQTAB3/kghrWt3bswpZtYJAZK
 VhLqHS0iQ4nPg7D7V9Q5tVolFI1uQp6lOejhHovsKYDDKyRq/JoYsZlvkO5wPyAhvsL9
 pHCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=T8VcAKbjJkQ4QKlnbd1DDwyxeMFhoJIv6sEL6W8M5Lk=;
 b=RSHawZ/n33/61SjJqvMfnpKSPJ4wnOWnis5HmNMRPyUzpgDtnMg9+T+GgOfN0Z00CH
 uNnGwfIChXNF/UEjfHS8H5Z6bPoQMvrRIAw/AjLP/3CG0GQ+yQbBNGVeYQ3WYvf82a2Q
 M389m+DErToHXSDVmkYAE8kGT06HK+2TDii41MsZdwsksbbnW7XtKBeNACjJ1TCeJpzV
 gJ16b1Lh0P5SdCMCJ8nJsQrk43MuDldgzEHRU3mbhw9BfCV5n53GLSSiOwgFxq9Faw8+
 9ddbM8wJv3cxoojkhPqk7GU//7n1iOR0vJotO3tLwv5XhnhZunuL79P7QpP8QJTxSjqz
 wa/Q==
X-Gm-Message-State: AOAM531XXWcu+4DAUfpzeve4FDsmLzEmbqPIPRoAE/tpZURugqqlo1GG
 DlYbvPGMRDc5mD7HCcdO8hc=
X-Google-Smtp-Source: ABdhPJxmt9rUeZQVgRK7EbicJxgxd86ZamdHg0OrjQ25BUeeqYB8Z60g2dbv55ZT78bItI7EkbEFHg==
X-Received: by 2002:a17:907:7212:: with SMTP id
 dr18mr863593ejc.187.1644393283641; 
 Tue, 08 Feb 2022 23:54:43 -0800 (PST)
Received: from ?IPV6:2a02:908:1252:fb60:5f8a:b8f9:e10:2aaa?
 ([2a02:908:1252:fb60:5f8a:b8f9:e10:2aaa])
 by smtp.gmail.com with ESMTPSA id y2sm5398102edt.54.2022.02.08.23.54.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Feb 2022 23:54:43 -0800 (PST)
Message-ID: <947e0106-5c92-2f92-8a3d-502c25a7126d@gmail.com>
Date: Wed, 9 Feb 2022 08:54:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RFC v4 04/11] drm/amd/virt: For SRIOV send GPU reset directly to
 TDR queue.
Content-Language: en-US
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20220209002320.6077-1-andrey.grodzovsky@amd.com>
 <20220209002320.6077-5-andrey.grodzovsky@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20220209002320.6077-5-andrey.grodzovsky@amd.com>
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
Cc: horace.chen@amd.com, lijo.lazar@amd.com, jingwech@amd.com,
 christian.koenig@amd.com, Monk.Liu@amd.com, Liu Shaoyun <Shaoyun.Liu@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 09.02.22 um 01:23 schrieb Andrey Grodzovsky:
> No need to to trigger another work queue inside the work queue.
>
> v3:
>
> Problem:
> Extra reset caused by host side FLR notification
> following guest side triggered reset.
> Fix: Preven qeuing flr_work from mailbox irq if guest
> already executing a reset.
>
> Suggested-by: Liu Shaoyun <Shaoyun.Liu@amd.com>
> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>

Feel free to add an Acked-by: Christian König 
<christian.koenig@amd.com>, but an rb from somebody more familiar with 
the code would be better.

Regards,
Christian.

> ---
>   drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c | 9 ++++++---
>   drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c | 9 ++++++---
>   drivers/gpu/drm/amd/amdgpu/mxgpu_vi.c | 9 ++++++---
>   3 files changed, 18 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c b/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c
> index 56da5ab82987..5869d51d8bee 100644
> --- a/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c
> +++ b/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c
> @@ -282,7 +282,7 @@ static void xgpu_ai_mailbox_flr_work(struct work_struct *work)
>   	if (amdgpu_device_should_recover_gpu(adev)
>   		&& (!amdgpu_device_has_job_running(adev) ||
>   		adev->sdma_timeout == MAX_SCHEDULE_TIMEOUT))
> -		amdgpu_device_gpu_recover(adev, NULL);
> +		amdgpu_device_gpu_recover_imp(adev, NULL);
>   }
>   
>   static int xgpu_ai_set_mailbox_rcv_irq(struct amdgpu_device *adev,
> @@ -307,8 +307,11 @@ static int xgpu_ai_mailbox_rcv_irq(struct amdgpu_device *adev,
>   
>   	switch (event) {
>   		case IDH_FLR_NOTIFICATION:
> -		if (amdgpu_sriov_runtime(adev))
> -			schedule_work(&adev->virt.flr_work);
> +		if (amdgpu_sriov_runtime(adev) && !amdgpu_in_reset(adev))
> +			WARN_ONCE(!queue_work(adev->reset_domain.wq,
> +					      &adev->virt.flr_work),
> +				  "Failed to queue work! at %s",
> +				  __func__);
>   		break;
>   		case IDH_QUERY_ALIVE:
>   			xgpu_ai_mailbox_send_ack(adev);
> diff --git a/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c b/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
> index 477d0dde19c5..5728a6401d73 100644
> --- a/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
> @@ -309,7 +309,7 @@ static void xgpu_nv_mailbox_flr_work(struct work_struct *work)
>   		adev->gfx_timeout == MAX_SCHEDULE_TIMEOUT ||
>   		adev->compute_timeout == MAX_SCHEDULE_TIMEOUT ||
>   		adev->video_timeout == MAX_SCHEDULE_TIMEOUT))
> -		amdgpu_device_gpu_recover(adev, NULL);
> +		amdgpu_device_gpu_recover_imp(adev, NULL);
>   }
>   
>   static int xgpu_nv_set_mailbox_rcv_irq(struct amdgpu_device *adev,
> @@ -337,8 +337,11 @@ static int xgpu_nv_mailbox_rcv_irq(struct amdgpu_device *adev,
>   
>   	switch (event) {
>   	case IDH_FLR_NOTIFICATION:
> -		if (amdgpu_sriov_runtime(adev))
> -			schedule_work(&adev->virt.flr_work);
> +		if (amdgpu_sriov_runtime(adev) && !amdgpu_in_reset(adev))
> +			WARN_ONCE(!queue_work(adev->reset_domain.wq,
> +					      &adev->virt.flr_work),
> +				  "Failed to queue work! at %s",
> +				  __func__);
>   		break;
>   		/* READY_TO_ACCESS_GPU is fetched by kernel polling, IRQ can ignore
>   		 * it byfar since that polling thread will handle it,
> diff --git a/drivers/gpu/drm/amd/amdgpu/mxgpu_vi.c b/drivers/gpu/drm/amd/amdgpu/mxgpu_vi.c
> index aef9d059ae52..02290febfcf4 100644
> --- a/drivers/gpu/drm/amd/amdgpu/mxgpu_vi.c
> +++ b/drivers/gpu/drm/amd/amdgpu/mxgpu_vi.c
> @@ -521,7 +521,7 @@ static void xgpu_vi_mailbox_flr_work(struct work_struct *work)
>   
>   	/* Trigger recovery due to world switch failure */
>   	if (amdgpu_device_should_recover_gpu(adev))
> -		amdgpu_device_gpu_recover(adev, NULL);
> +		amdgpu_device_gpu_recover_imp(adev, NULL);
>   }
>   
>   static int xgpu_vi_set_mailbox_rcv_irq(struct amdgpu_device *adev,
> @@ -550,8 +550,11 @@ static int xgpu_vi_mailbox_rcv_irq(struct amdgpu_device *adev,
>   		r = xgpu_vi_mailbox_rcv_msg(adev, IDH_FLR_NOTIFICATION);
>   
>   		/* only handle FLR_NOTIFY now */
> -		if (!r)
> -			schedule_work(&adev->virt.flr_work);
> +		if (!r && !amdgpu_in_reset(adev))
> +			WARN_ONCE(!queue_work(adev->reset_domain.wq,
> +					      &adev->virt.flr_work),
> +				  "Failed to queue work! at %s",
> +				  __func__);
>   	}
>   
>   	return 0;

