Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F8A39195B
	for <lists+dri-devel@lfdr.de>; Wed, 26 May 2021 15:59:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A7476ECD3;
	Wed, 26 May 2021 13:59:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C30906ECD3;
 Wed, 26 May 2021 13:59:02 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id q5so1260620wrs.4;
 Wed, 26 May 2021 06:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=qnZDUyUJxT2SrosvmV6mZECKLimxNEOlXEw8XpUA5gw=;
 b=LWDDpRpI+wMN7+tBUQMF4Iqw2WP12uKyBJGaTZkQQrapDB/ycYrt01ma7nm1CTd16p
 cAUtS1M2myIX1WSYvLep7c4bVOj79H+yCoeEI322GlKLgbDmrzOvScUA5/StQXqABVnf
 WaOTsfbkJO1Bj0iLgLSGPZOuFKBe4hhyMKw3gPnLTXZLkDiyp/s/+98+cVS9mb5H4yWk
 PXu3WvV1k9esmvbNlpxtnFyzC33vdLquFONsqd2eYkXqK0jH7ycB3f0lWsjhn8lkzYgh
 sTpZIG90DopZKnxoHIP+m4UMqb3qd8bGggDPO55pIOQ0F+PEq+3KMzjvVQHdVdWnynCS
 soyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=qnZDUyUJxT2SrosvmV6mZECKLimxNEOlXEw8XpUA5gw=;
 b=r9dzWRWcTQZBapLI35RzWPsDaKpU7eVtAkuS0v6Rgsv1Xaax9JXdGOwIy3cRlFpvrZ
 SoqxHOedieFPK551ofdm30G07jOqlew/pHWViwWhPm1RzOqSbzVb36ERn/t7bZGiXf3h
 PtgD+9Uqj7zJ1GCeDm9Uo0M5c+yrpUYpih1rISUJzu1BrAJrkkpHMJTJeGtQZOFL1qYf
 vyYGyZt+AVSBF8sOhfT5RY/eKVWmY3viv5YZGZDrl2gfa4wr4HnRD/Pk4BKoMAzUvrdJ
 6hVj4srGteF/fiLam2cp3L+1Ikzr6loZ9Fov0Q2sQ4cVkvYLX1jajITEpxyOLznli6Vl
 MFcw==
X-Gm-Message-State: AOAM533bgPbnuHMiTEKpw6vwYXFfmSuM9zhxGuxjKJrBrxAZ/pYucxFK
 cGGtFJBYksJC44qGEUX/0MA/V3B6n2I=
X-Google-Smtp-Source: ABdhPJy6z7RRKv1VPZoSqwy7sKpPOoQdVz2adv9iN8MjhwaVjBd6Si7eBWu8sB39e5PqAJmjoIRmlQ==
X-Received: by 2002:adf:f544:: with SMTP id j4mr194995wrp.416.1622037541543;
 Wed, 26 May 2021 06:59:01 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:1950:35e:cae9:5bed?
 ([2a02:908:1252:fb60:1950:35e:cae9:5bed])
 by smtp.gmail.com with ESMTPSA id l8sm20663457wry.55.2021.05.26.06.59.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 May 2021 06:59:01 -0700 (PDT)
Subject: Re: [PATCH] drm/amdgpu: Fix clang warning: unused label 'exit'
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20210525184431.1170373-1-andrey.grodzovsky@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <2e692137-b837-adea-6e64-ab1c2a091555@gmail.com>
Date: Wed, 26 May 2021 15:59:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210525184431.1170373-1-andrey.grodzovsky@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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
Cc: Alexander.Deucher@amd.com, kernel test robot <lkp@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 25.05.21 um 20:44 schrieb Andrey Grodzovsky:
> Problem:
> drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:332:1: warning: unused label 'exit' [-Wunused-label]
> exit:
> ^~~~~
>
> Fix: Put #ifdef CONFIG_64BIT around exit
>
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index c547c78f3513..a10b4a7ccf5d 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -330,7 +330,9 @@ void amdgpu_device_vram_access(struct amdgpu_device *adev, loff_t pos,
>   	}
>   	spin_unlock_irqrestore(&adev->mmio_idx_lock, flags);
>   
> +#ifdef CONFIG_64BIT
>   exit:
> +#endif
>   	drm_dev_exit(idx);
>   }
>   

