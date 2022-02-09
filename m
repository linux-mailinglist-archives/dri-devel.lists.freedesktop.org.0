Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 94FFB4AEBCC
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 09:06:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E65A10E4CE;
	Wed,  9 Feb 2022 08:06:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49BBE10E4B4;
 Wed,  9 Feb 2022 08:06:32 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id da4so3436504edb.4;
 Wed, 09 Feb 2022 00:06:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=AlT0jriH6wbaJeq4DKpilXyWkbQJRViCpjJVSH4sOEw=;
 b=gB/yWubJUGVUVqh/JeSdjTIJBtNdgAJOCLa4zkPOO/UbCmW8HjzpXX+7WLFcpSi5Al
 E3WIB5U7DmWyJbtNuTefzYuDKpBrxP+ipm1zWrVsFJG5uTZPjjHwQFaMrVSLY7/XGFKp
 opyxCMf/J7tckYM52ShMY07VKHHgQu30TjGEte/OWQ353Rvi14Iv7ybuLWdLByRjS7mg
 u2CelXLiRt4OWsWff6nU1/o4eOz6OqRAz8TyucSqY7kPH8LvggB+QdOmWQmLlkt7z77C
 USKbd+KJMenrLwD715B7nveolN8uaNyPdG7KSdmdpyv8mYqv38AI8W1/BtEigLN3Ze38
 0e1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=AlT0jriH6wbaJeq4DKpilXyWkbQJRViCpjJVSH4sOEw=;
 b=ryb57rKN5chEb5NEUhQo9drpjHkKNmn2UJ5LxuwDtBW2mXKCNvNQMHI772vfSvOH4f
 e1w3oufbs5bEnaZQFMCO6CP0uCBc+vexSEKuM73foc07FaXWtNY+4Hp0NKKpCC9K0s+t
 Uvss8nFYRxT5glcLLqqfa2bHlPkF/8g/gbuKr8+73TJP0zQ1Y3cHWQ7lxac7jucdqPbC
 baCXuGULtnI6/DjT58DO9WiQ4M8E+nRgv0pzn449sBXjHdpF5K6bSxVyZWZeACUze2jZ
 O51cgQzfhYWPxRpvvzQTaJnPpEqut35Mbc35nwhysNuR8G4D0KMmm24IvGS7QPoTGi7w
 H7RA==
X-Gm-Message-State: AOAM533e/r7qedcK9VdVH2kXbZj/gUCn7ajSd6ciKdXF+//IXZK4ezZj
 5+oPgbZG4+cxOUfMp2RC0w0=
X-Google-Smtp-Source: ABdhPJy8Hby+Y+imTPH4URC9S4Dh5ZmWrUovNluxQqyw3hNAg4QriLpe3NL6fqsy0dOdCRqBd5QSJg==
X-Received: by 2002:a05:6402:2920:: with SMTP id
 ee32mr1174900edb.310.1644393990718; 
 Wed, 09 Feb 2022 00:06:30 -0800 (PST)
Received: from ?IPV6:2a02:908:1252:fb60:5f8a:b8f9:e10:2aaa?
 ([2a02:908:1252:fb60:5f8a:b8f9:e10:2aaa])
 by smtp.gmail.com with ESMTPSA id if19sm3845431ejc.32.2022.02.09.00.06.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Feb 2022 00:06:30 -0800 (PST)
Message-ID: <7222c0e4-4b51-969c-2125-42d14cf28d69@gmail.com>
Date: Wed, 9 Feb 2022 09:06:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RFC v4 11/11] Revert 'drm/amdgpu: annotate a false positive
 recursive locking'
Content-Language: en-US
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20220209002320.6077-1-andrey.grodzovsky@amd.com>
 <20220209002320.6077-12-andrey.grodzovsky@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20220209002320.6077-12-andrey.grodzovsky@amd.com>
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
 christian.koenig@amd.com, Monk.Liu@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 09.02.22 um 01:23 schrieb Andrey Grodzovsky:
> Since we have a single instance of reset semaphore which we
> lock only once even for XGMI hive we don't need the nested
> locking hint anymore.
>
> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>

Oh, yes please :)

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 14 ++++----------
>   1 file changed, 4 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index aaecf0797484..75d0dd289023 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -4825,16 +4825,10 @@ int amdgpu_do_asic_reset(struct list_head *device_list_handle,
>   	return r;
>   }
>   
> -static void amdgpu_device_lock_reset_domain(struct amdgpu_reset_domain *reset_domain,
> -					    struct amdgpu_hive_info *hive)
> +static void amdgpu_device_lock_reset_domain(struct amdgpu_reset_domain *reset_domain)
>   {
>   	atomic_set(&reset_domain->in_gpu_reset, 1);
> -
> -	if (hive) {
> -		down_write_nest_lock(&reset_domain->sem, &hive->hive_lock);
> -	} else {
> -		down_write(&reset_domain->sem);
> -	}
> +	down_write(&reset_domain->sem);
>   }
>   
>   static void amdgpu_device_set_mp1_state(struct amdgpu_device *adev)
> @@ -5072,7 +5066,7 @@ int amdgpu_device_gpu_recover_imp(struct amdgpu_device *adev,
>   	/* We need to lock reset domain only once both for XGMI and single device */
>   	tmp_adev = list_first_entry(device_list_handle, struct amdgpu_device,
>   				    reset_list);
> -	amdgpu_device_lock_reset_domain(tmp_adev->reset_domain, hive);
> +	amdgpu_device_lock_reset_domain(tmp_adev->reset_domain);
>   
>   	/* block all schedulers and reset given job's ring */
>   	list_for_each_entry(tmp_adev, device_list_handle, reset_list) {
> @@ -5496,7 +5490,7 @@ pci_ers_result_t amdgpu_pci_error_detected(struct pci_dev *pdev, pci_channel_sta
>   		 * Locking adev->reset_domain->sem will prevent any external access
>   		 * to GPU during PCI error recovery
>   		 */
> -		amdgpu_device_lock_reset_domain(adev->reset_domain, NULL);
> +		amdgpu_device_lock_reset_domain(adev->reset_domain);
>   		amdgpu_device_set_mp1_state(adev);
>   
>   		/*

