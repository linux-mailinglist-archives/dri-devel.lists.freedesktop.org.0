Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8879C1CD205
	for <lists+dri-devel@lfdr.de>; Mon, 11 May 2020 08:45:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B2D86E1BC;
	Mon, 11 May 2020 06:45:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E1456E1BC;
 Mon, 11 May 2020 06:45:31 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id u16so17763355wmc.5;
 Sun, 10 May 2020 23:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=1EGHCNZLop6lpa2MpQukB0Jzk7xjNDSSnPYZVksTl3g=;
 b=SzyQivQ/k/7XrX8ar4XJQSn6XsTnFG6KqOIWxsJDuWQaChKGSnVAjtH0PyEm1stXRX
 2hdUyzb8OXIMagIdiS94rTquleNZLkmhyeLuYncHNTgT3mjGHceSe0v0LHx63jEUAOPS
 5zR0mNg8H0+PD7hmGrH18koC9v0HpLJ0uyvbWs2qnDhEszLQTM6EjsPZFrzbH6CDK7Bh
 yjaLRU8Xw1xNvKBua9jLiFz1qOznXnd8+2Ag0BPocSmLSEh2muXsod8FWd5IkGf2ndSD
 ww5ZFpHG8nxl2qMqw28CHdfCe/tbQWI4PBHxXwajJX8BbZIjQvGHmCDMOe7JJcK8xBmk
 RciQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=1EGHCNZLop6lpa2MpQukB0Jzk7xjNDSSnPYZVksTl3g=;
 b=pjVxYyQoAsPLLeRmC+Qb54gXAWQboE8rUXdkOqjCIdo6uI3bFasYKqFvEgC1bWCB/u
 GaoW1SNXqw8MhmM94BQKPs5BAjusSbtEXu9Bp6vccaOZteX/EiuO0JvkfQvp0yCyfg2p
 3AmoI6wLNuNcwQZGGOZslLybh1xiP6g15BZJTBnZRelXmfa80n9MtETeiqvVWw2dqRhi
 +UaSPjn32qJw+//v0CQK6SAHaBdOynHYSorry/VBJegqvWnAi3jHzs5H/ZouZrlE+3Ke
 pYY2GxwJPeq/qlYrMVZRyfGN6xmtMs15t8Tr57AN2njiFkPiX9sG23rXyTqY7In7ll5q
 7Uxg==
X-Gm-Message-State: AGi0PuYb/s2N+15RGclQvkgSSLoh1ogqJ952HXoP+2qKmFVimgW3fycY
 4ail9qdK7TLCLIuLYxA6OII=
X-Google-Smtp-Source: APiQypK5EFJWbdLc5bXtXjCxgAaG3RfG35us+gztlEfpNe17D+ozOZBQZM+xCfL9V1I+x56wlVuhTA==
X-Received: by 2002:a1c:1f16:: with SMTP id f22mr10040983wmf.46.1589179529773; 
 Sun, 10 May 2020 23:45:29 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id d9sm874290wmd.10.2020.05.10.23.45.28
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 10 May 2020 23:45:29 -0700 (PDT)
Subject: Re: [PATCH 1/6] drm/ttm: Add unampping of the entire device address
 space
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <1589050310-19666-1-git-send-email-andrey.grodzovsky@amd.com>
 <1589050310-19666-2-git-send-email-andrey.grodzovsky@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <e293af59-99df-c147-68d6-8fa3ade38829@gmail.com>
Date: Mon, 11 May 2020 08:45:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1589050310-19666-2-git-send-email-andrey.grodzovsky@amd.com>
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
Reply-To: christian.koenig@amd.com
Cc: daniel.vetter@ffwll.ch, michel@daenzer.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 09.05.20 um 20:51 schrieb Andrey Grodzovsky:
> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> ---
>   drivers/gpu/drm/ttm/ttm_bo.c    | 22 +++++++++++++++++++++-
>   include/drm/ttm/ttm_bo_driver.h |  2 ++
>   2 files changed, 23 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index c5b516f..eae61cc 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -1750,9 +1750,29 @@ void ttm_bo_unmap_virtual(struct ttm_buffer_object *bo)
>   	ttm_bo_unmap_virtual_locked(bo);
>   	ttm_mem_io_unlock(man);
>   }
> +EXPORT_SYMBOL(ttm_bo_unmap_virtual);
>   
> +void ttm_bo_unmap_virtual_address_space(struct ttm_bo_device *bdev)
> +{
> +	struct ttm_mem_type_manager *man;
> +	int i;
>   
> -EXPORT_SYMBOL(ttm_bo_unmap_virtual);

> +	for (i = 0; i < TTM_NUM_MEM_TYPES; i++) {
> +		man = &bdev->man[i];
> +		if (man->has_type && man->use_type)
> +			ttm_mem_io_lock(man, false);
> +	}

You should drop that it will just result in a deadlock warning for 
Nouveau and has no effect at all.

Apart from that looks good to me,
Christian.

> +
> +	unmap_mapping_range(bdev->dev_mapping, 0, 0 , 1);
> +	/*TODO What about ttm_mem_io_free_vm(bo) ? */
> +
> +	for (i = TTM_NUM_MEM_TYPES - 1; i >= 0; i--) {
> +		man = &bdev->man[i];
> +		if (man->has_type && man->use_type)
> +			ttm_mem_io_unlock(man);
> +	}
> +}
> +EXPORT_SYMBOL(ttm_bo_unmap_virtual_address_space);
>   
>   int ttm_bo_wait(struct ttm_buffer_object *bo,
>   		bool interruptible, bool no_wait)
> diff --git a/include/drm/ttm/ttm_bo_driver.h b/include/drm/ttm/ttm_bo_driver.h
> index c9e0fd0..3133463 100644
> --- a/include/drm/ttm/ttm_bo_driver.h
> +++ b/include/drm/ttm/ttm_bo_driver.h
> @@ -600,6 +600,8 @@ int ttm_bo_device_init(struct ttm_bo_device *bdev,
>    */
>   void ttm_bo_unmap_virtual(struct ttm_buffer_object *bo);
>   
> +void ttm_bo_unmap_virtual_address_space(struct ttm_bo_device *bdev);
> +
>   /**
>    * ttm_bo_unmap_virtual
>    *

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
