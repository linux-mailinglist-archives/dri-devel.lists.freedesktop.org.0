Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C52A552BBC
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jun 2022 09:21:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33E1311270C;
	Tue, 21 Jun 2022 07:21:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C04601126C9;
 Tue, 21 Jun 2022 07:21:24 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id h23so25487718ejj.12;
 Tue, 21 Jun 2022 00:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=EIp8WFtlC6D8eHvoW3+kRmQcmtWDBEDOQ4OlVigNAJM=;
 b=g4tmaC6dFWmXTR8r2wdVCKE5qbi7hpODoYlsjJ6PN5YdqYfhN+DT5tmfy+5uldJo4N
 UMy9NnxU5gf1FIEL4b5QM2tzBDhISfoQaozdq1HfDpCfRyLnJUdD/gNlq242BqYCvsvC
 Z1LT04Q8wTNgybQEI0qLwf9K3T2spqAnjNjCdMYru7u5vDR80RS0AJBjAIpKuD7ROmqL
 /rK1bVZE6V1dKhFr1o3Cu4jfJR/y8r72dGr3f8GscBF6u7fOJZsy9OJgUy8uA7mm8a0E
 deTLxlLgRmu84VC43MNiGRfUK8Xs+fYPpyi2iD8EFjTF+UIJyVywYiDMb211Uxh6EOLC
 zjog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=EIp8WFtlC6D8eHvoW3+kRmQcmtWDBEDOQ4OlVigNAJM=;
 b=VAYeqsIef/3p+j4VkMOEP1S3GjtnuzqtlJn/YHPm+ZHabpKByMEAzQuc275Ny8cP24
 jmH7VoSATWTfoMA/CAIbzBEBdcCgBeDT58ZHBpWZVSqxF8uVPamTDov7AaR5Yz2uYPWc
 7XCsTG6/+Bdd5+7JFa6lKKc64b4eIv/Wkn3WII7ELI9JVaaDzM9X+ePuid1PTTYabP+l
 gEEkdtDCE37hXBJ5eM5pCcpGqtm92Db91agQQ7rjL8kk7pyxI4sp+zNS6F4dV3u1cQkr
 Ha0HinqzpOyMcpqyNVdEoe384Z/4MrJEaRb0BgjN96VN9DKZMdE/43d0bvMGeCFWRaEb
 gsuQ==
X-Gm-Message-State: AJIora+v2dGEcqDMGkIkyR1lI53lzBS/Dbyay5JU7DJ+Yq8eWHQWyTRA
 xaNIE2HU3cEGqUVhDsyS5RZ6ebIjfhI=
X-Google-Smtp-Source: AGRyM1sZzFGcgfzMYzzrJ1W9ZNF2wHMFHNvIKi2VZlr8HVlwNUAG19JEL1n/0/LUbVicxyvAHbvTqw==
X-Received: by 2002:a17:906:b048:b0:6fe:be4a:3ecf with SMTP id
 bj8-20020a170906b04800b006febe4a3ecfmr24672195ejb.104.1655796083111; 
 Tue, 21 Jun 2022 00:21:23 -0700 (PDT)
Received: from [192.168.178.21] (p57b0bd9f.dip0.t-ipconnect.de.
 [87.176.189.159]) by smtp.gmail.com with ESMTPSA id
 b17-20020a1709063cb100b00722bc0aa9e3sm3007448ejh.162.2022.06.21.00.21.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jun 2022 00:21:22 -0700 (PDT)
Message-ID: <f4058d23-6290-a6df-0288-40fe6a86076e@gmail.com>
Date: Tue, 21 Jun 2022 09:21:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 2/5] drm/amdgpu: Add put fence in
 amdgpu_fence_driver_clear_job_fences
Content-Language: en-US
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20220620220302.86389-1-andrey.grodzovsky@amd.com>
 <20220620220302.86389-3-andrey.grodzovsky@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20220620220302.86389-3-andrey.grodzovsky@amd.com>
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
Cc: jingwen.chen2@amd.com, Christian.Koenig@amd.com, monk.liu@amd.com,
 yiqing.yao@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 21.06.22 um 00:02 schrieb Andrey Grodzovsky:
> This function should drop the fence refcount when it extracts the
> fence from the fence array, just as it's done in amdgpu_fence_process.
>
> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> index 957437a5558c..a9ae3beaa1d3 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> @@ -595,8 +595,10 @@ void amdgpu_fence_driver_clear_job_fences(struct amdgpu_ring *ring)
>   	for (i = 0; i <= ring->fence_drv.num_fences_mask; i++) {
>   		ptr = &ring->fence_drv.fences[i];
>   		old = rcu_dereference_protected(*ptr, 1);
> -		if (old && old->ops == &amdgpu_job_fence_ops)
> +		if (old && old->ops == &amdgpu_job_fence_ops) {
>   			RCU_INIT_POINTER(*ptr, NULL);
> +			dma_fence_put(old);
> +		}
>   	}
>   }
>   

