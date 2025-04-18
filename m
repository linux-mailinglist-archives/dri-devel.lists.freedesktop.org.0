Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10A60A94879
	for <lists+dri-devel@lfdr.de>; Sun, 20 Apr 2025 19:31:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A25710E0A1;
	Sun, 20 Apr 2025 17:31:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="BxEnbQge";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FEE110EB97
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Apr 2025 13:38:24 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-22c50beb0d5so2184435ad.3
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Apr 2025 06:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744983504; x=1745588304; darn=lists.freedesktop.org;
 h=content-transfer-encoding:from:in-reply-to:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gPTcC0Qo0IfweDpTBHJVf2QO3zsuTW+Lm6WypoA0fRY=;
 b=BxEnbQgeuwU5Owne8pG42O6lPgmAnbTCMQrECFQ49x4gorTo8CpRa9pe+x4H2SVecD
 HwrYRW9JI8x9C4EolmQk8syS8K6YOj2zOypiu9oGsqP7LK3tZVyHz+Il/FKHswdL63XG
 eqqn9NHLT4s2dydWEJHy+cdFqZIRjyt5xGDNbTCroulxyIitXKvkIvg1RY3sFMuwc++6
 HVDZpDXgAvmgkJXHiSzgXCEAjxsBzLPz7ZDJYTyn/nA8NMtCHZjkN+2bd5A8itPy8iDJ
 q0mDfgNl66kVZtwPyitv8PHUBjwf44QM5b5kjtgLt7O8nNGZa+TRJq6aMxaUeFtRLB9A
 DRvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744983504; x=1745588304;
 h=content-transfer-encoding:from:in-reply-to:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gPTcC0Qo0IfweDpTBHJVf2QO3zsuTW+Lm6WypoA0fRY=;
 b=SThqd2D8JVoLOhGdV2eG+ojKd109sXXb0UyP++ssmM3wJ4dnbq9c8PZsUy9Kn4q52N
 JyDwh0eRCsEdT2QOEaihwuh+V96wRG7WYxqIPcq1ODTOQ0SsJgRmeRIOqKENJyQzv1xP
 KnpX7tJ0I1ozz3LH/CPtqTj79gJXRPEfHkg1DSmW7gOhD/vc0FJmAR89aWod5+0GXVvC
 3H/DtKhoL3IdEcL9Cv5suLKDAG6bwPQ+dSiChh6KNwLO6AwVnMUyP22vPAQHExWb0krb
 2okf3WOUywsJhlt8RHFlJ0X2TDGCOT0FyO/5rQ3YD/gFngd2nb+EDy2vcnW1ho0FuEXb
 dg0Q==
X-Gm-Message-State: AOJu0YzVnFp1Wmk3a8izkeMR+kNVdBqeVCwCUE7BHj4a8G2cEqInVz5e
 6yAcyuaL6rh0h/8NRCkTeH2FYNIt4hjW9suUOASOF93T8hjW3e6z
X-Gm-Gg: ASbGncsZ4zHpGjD5fsva5KvIDdNcCJwY8MdrYqdAhYkueLgeBzP7EcCBiqjbA2WWyH3
 O2gSamoO308wWVTGlSj3CYkODCwRQo/4ZEiR58MvWzbyty/U/hEC3aaGB5Kw+snJlIt1Jgar1/7
 Jx6VOY4KlaKyc7zoALKWRq1n6y1zsd8aC6wU0szChHWcLXxbeIua/VUgiUY3G6LxgAaBHRSoGgC
 Y+nA1sRar4pbNVr2A0Xy7vDTTwyhxlfbR4M0j0hQSyAkbC0/HL5J+W9bUNbUXXdm6qfVf4TJgAK
 KNIAzPrGJ5uxjNiMFHlBJR3OWlk9ehMNoR0+mbuLs/NhLpTa4vzi9GxpwgVnbvpmaTnsbyZ/C/m
 GJgskTyXreyhEGlcYOuQ4nWIVYg==
X-Google-Smtp-Source: AGHT+IEYryzzRgr0FcDDUzJNYZVMf5qL5xMbHqFRL9xrVSNiBPnB48rP0O+OYmAEiF3wFKWEMbeD2w==
X-Received: by 2002:a17:902:d4cc:b0:215:a57e:88d6 with SMTP id
 d9443c01a7336-22c530bc997mr14523115ad.0.1744983503877; 
 Fri, 18 Apr 2025 06:38:23 -0700 (PDT)
Received: from ?IPV6:2406:3400:21b:310:2ef0:5dff:fe09:98db?
 ([2406:3400:21b:310:2ef0:5dff:fe09:98db])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22c50bdb1d2sm16663205ad.25.2025.04.18.06.38.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Apr 2025 06:38:23 -0700 (PDT)
Message-ID: <417a77f3-8532-4528-9c3d-89671d1e6177@gmail.com>
Date: Fri, 18 Apr 2025 23:38:16 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] drm/panfrost: reorder pd/clk/rst sequence
To: Philippe Simons <simons.philippe@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-sunxi@lists.linux.dev, Andre Przywara <andre.przywara@arm.com>,
 =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Philipp Zabel <p.zabel@pengutronix.de>
References: <20250403055210.54486-1-simons.philippe@gmail.com>
 <20250403055210.54486-4-simons.philippe@gmail.com>
Content-Language: en-US
In-Reply-To: <20250403055210.54486-4-simons.philippe@gmail.com>
From: John Williams <porschemad911@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Sun, 20 Apr 2025 17:31:13 +0000
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

I have regression tested this patch on the following devices:

Powkiddy RGB10X - Rockchip RK3326 (Mali G31)

Powkiddy RGB20 Pro - Rockchip RK3566 (Mali G52)

Odroid Go Ultra - Amlogic S922X (Mali G52)

Gameforce ACE - Rockchip RK3588S (Mali G610)

No regressions found during cold boot or with wake after sleep.

Tested-by: John Williams <porschemad911@gmail.com>

On 3/4/25 16:52, Philippe Simons wrote:
> According to Mali manuals, the powerup sequence should be
> enable pd, asserting the reset then enabling the clock and
> the reverse for powerdown.
>
> Signed-off-by: Philippe Simons <simons.philippe@gmail.com>
> ---
>   drivers/gpu/drm/panfrost/panfrost_device.c | 38 +++++++++++-----------
>   1 file changed, 19 insertions(+), 19 deletions(-)
>
> diff --git a/drivers/gpu/drm/panfrost/panfrost_device.c b/drivers/gpu/drm/panfrost/panfrost_device.c
> index 93d48e97ce10..5d35076b2e6d 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_device.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_device.c
> @@ -209,10 +209,20 @@ int panfrost_device_init(struct panfrost_device *pfdev)
>   
>   	spin_lock_init(&pfdev->cycle_counter.lock);
>   
> +	err = panfrost_pm_domain_init(pfdev);
> +	if (err)
> +		return err;
> +
> +	err = panfrost_reset_init(pfdev);
> +	if (err) {
> +		dev_err(pfdev->dev, "reset init failed %d\n", err);
> +		goto out_pm_domain;
> +	}
> +
>   	err = panfrost_clk_init(pfdev);
>   	if (err) {
>   		dev_err(pfdev->dev, "clk init failed %d\n", err);
> -		return err;
> +		goto out_reset;
>   	}
>   
>   	err = panfrost_devfreq_init(pfdev);
> @@ -229,25 +239,15 @@ int panfrost_device_init(struct panfrost_device *pfdev)
>   			goto out_devfreq;
>   	}
>   
> -	err = panfrost_reset_init(pfdev);
> -	if (err) {
> -		dev_err(pfdev->dev, "reset init failed %d\n", err);
> -		goto out_regulator;
> -	}
> -
> -	err = panfrost_pm_domain_init(pfdev);
> -	if (err)
> -		goto out_reset;
> -
>   	pfdev->iomem = devm_platform_ioremap_resource(pfdev->pdev, 0);
>   	if (IS_ERR(pfdev->iomem)) {
>   		err = PTR_ERR(pfdev->iomem);
> -		goto out_pm_domain;
> +		goto out_regulator;
>   	}
>   
>   	err = panfrost_gpu_init(pfdev);
>   	if (err)
> -		goto out_pm_domain;
> +		goto out_regulator;
>   
>   	err = panfrost_mmu_init(pfdev);
>   	if (err)
> @@ -268,16 +268,16 @@ int panfrost_device_init(struct panfrost_device *pfdev)
>   	panfrost_mmu_fini(pfdev);
>   out_gpu:
>   	panfrost_gpu_fini(pfdev);
> -out_pm_domain:
> -	panfrost_pm_domain_fini(pfdev);
> -out_reset:
> -	panfrost_reset_fini(pfdev);
>   out_regulator:
>   	panfrost_regulator_fini(pfdev);
>   out_devfreq:
>   	panfrost_devfreq_fini(pfdev);
>   out_clk:
>   	panfrost_clk_fini(pfdev);
> +out_reset:
> +	panfrost_reset_fini(pfdev);
> +out_pm_domain:
> +	panfrost_pm_domain_fini(pfdev);
>   	return err;
>   }
>   
> @@ -287,11 +287,11 @@ void panfrost_device_fini(struct panfrost_device *pfdev)
>   	panfrost_job_fini(pfdev);
>   	panfrost_mmu_fini(pfdev);
>   	panfrost_gpu_fini(pfdev);
> -	panfrost_pm_domain_fini(pfdev);
> -	panfrost_reset_fini(pfdev);
>   	panfrost_devfreq_fini(pfdev);
>   	panfrost_regulator_fini(pfdev);
>   	panfrost_clk_fini(pfdev);
> +	panfrost_reset_fini(pfdev);
> +	panfrost_pm_domain_fini(pfdev);
>   }
>   
>   #define PANFROST_EXCEPTION(id) \
