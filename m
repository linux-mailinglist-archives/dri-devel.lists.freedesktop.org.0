Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBA5A4084C6
	for <lists+dri-devel@lfdr.de>; Mon, 13 Sep 2021 08:35:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE8F96E0EE;
	Mon, 13 Sep 2021 06:35:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DB2F6E0EA;
 Mon, 13 Sep 2021 06:35:21 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id u15so6791772wru.6;
 Sun, 12 Sep 2021 23:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=LbcEmfabhxm2ckfm8rbUMEm3e+HfMvU1gfc4WWJqITg=;
 b=R5DC60OTBDLJK4WJN6JTN1RCt7bCA29CZS5ULWApukWfx6SOvW3hDPrORzKRFsoei0
 X5HJ/qZClU7qAbr5bCX6gCPFER8IswNmA2Drr/oXL1uKBsBfN+8e7P/0mlhbb+F1WQyB
 ccXkVLWMHWLzHzlbM7GiQn96lSYbS7sWnxXUP5+PhZijkknp4GC7j4xsPUf9N5WEaYG2
 qU17xKvjYa+O8NHkVM3d08HuAy5ti3BBu0r2q9uWxmQ/aEgp9RBJcmqMxrrdVoiarjaq
 t8I6sr70altDDtLgKoCVaMUF4q4qLgOiZt9omSwFIiQ3HUnQvAwM6xTIhIP3tL2rcsL2
 t6fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=LbcEmfabhxm2ckfm8rbUMEm3e+HfMvU1gfc4WWJqITg=;
 b=RUUsDhrvRcgEvSdXM9wPixEFNG7PgLxDtV5NF3mzXX8OwEf3TYpXgHf8/ZCt0CtJUd
 /BOG9EEMDuHZ1ylh/VwQkoPmRyQy8XwHSPuPRAIk538NIWKzMOqfNH9cPbg+OOHnkmiI
 Jz/VIfeFtry/6HP8Mk3CKCzLwPGxWhc28jqenho3o2d59+CnOXrzxzAp7b6oJ+ehcfb/
 Uud8eYbcYkIQZPrssD0Tu250WljvdvgZENg6B8Iwlf2GNcaIy/9nl69KuGb6u+PgDyt1
 pI6+pkXHc04LNQHgL1HCnR/WyOblgnjUUGK1o/53WfEqr0alXqjwXiBxSJORNjP6JmMA
 egDw==
X-Gm-Message-State: AOAM532/ppd1p7c3p+9VCU61h1DG+PraeUCO9c5+aXCo7UYjTEJoc2Fz
 trFsCyW2l8Kq2+uXBYjPfgM=
X-Google-Smtp-Source: ABdhPJzW9SjXgPJKaQiDmzk8PjlpmgDtzy/TB5CYG8AMPJliqwimjLrXe2lQkxEIdPI4M9XUMJldyw==
X-Received: by 2002:adf:e5c2:: with SMTP id a2mr10534691wrn.251.1631514920027; 
 Sun, 12 Sep 2021 23:35:20 -0700 (PDT)
Received: from [192.168.178.21] (p5b0ea1b5.dip0.t-ipconnect.de.
 [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id m29sm6763099wrb.89.2021.09.12.23.35.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Sep 2021 23:35:19 -0700 (PDT)
Subject: Re: [RFC PATCH] drm/ttm: Try to check if new ttm man out of bounds
 during compile
To: xinhui pan <xinhui.pan@amd.com>, amd-gfx@lists.freedesktop.org
Cc: christian.koenig@amd.com, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, Guchun.Chen@amd.com
References: <20210913033623.296390-1-xinhui.pan@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <ab044048-9739-f955-880e-612fb6214826@gmail.com>
Date: Mon, 13 Sep 2021 08:35:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210913033623.296390-1-xinhui.pan@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 13.09.21 um 05:36 schrieb xinhui pan:
> Allow TTM know if vendor set new ttm mananger out of bounds by adding
> build_bug_on.

I really like the part in the inline functions, but the wrappers around 
the ttm_range_man_init/fini look a bit awkward of hand.

Christian.

>
> Signed-off-by: xinhui pan <xinhui.pan@amd.com>
> ---
>   drivers/gpu/drm/ttm/ttm_range_manager.c |  2 ++
>   include/drm/ttm/ttm_device.h            |  3 +++
>   include/drm/ttm/ttm_range_manager.h     | 10 ++++++++++
>   3 files changed, 15 insertions(+)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_range_manager.c b/drivers/gpu/drm/ttm/ttm_range_manager.c
> index 03395386e8a7..47e304719b88 100644
> --- a/drivers/gpu/drm/ttm/ttm_range_manager.c
> +++ b/drivers/gpu/drm/ttm/ttm_range_manager.c
> @@ -127,6 +127,8 @@ static const struct ttm_resource_manager_func ttm_range_manager_func = {
>   	.debug = ttm_range_man_debug
>   };
>   
> +#undef ttm_range_man_init
> +#undef ttm_range_man_fini
>   /**
>    * ttm_range_man_init
>    *
> diff --git a/include/drm/ttm/ttm_device.h b/include/drm/ttm/ttm_device.h
> index 07d722950d5b..6f23724f5a06 100644
> --- a/include/drm/ttm/ttm_device.h
> +++ b/include/drm/ttm/ttm_device.h
> @@ -285,12 +285,15 @@ int ttm_device_swapout(struct ttm_device *bdev, struct ttm_operation_ctx *ctx,
>   static inline struct ttm_resource_manager *
>   ttm_manager_type(struct ttm_device *bdev, int mem_type)
>   {
> +	BUILD_BUG_ON(__builtin_constant_p(mem_type)
> +		     && mem_type >= TTM_NUM_MEM_TYPES);
>   	return bdev->man_drv[mem_type];
>   }
>   
>   static inline void ttm_set_driver_manager(struct ttm_device *bdev, int type,
>   					  struct ttm_resource_manager *manager)
>   {
> +	BUILD_BUG_ON(__builtin_constant_p(type) && type >= TTM_NUM_MEM_TYPES);
>   	bdev->man_drv[type] = manager;
>   }
>   
> diff --git a/include/drm/ttm/ttm_range_manager.h b/include/drm/ttm/ttm_range_manager.h
> index 22b6fa42ac20..9250ade54e2c 100644
> --- a/include/drm/ttm/ttm_range_manager.h
> +++ b/include/drm/ttm/ttm_range_manager.h
> @@ -38,5 +38,15 @@ int ttm_range_man_init(struct ttm_device *bdev,
>   		       unsigned long p_size);
>   int ttm_range_man_fini(struct ttm_device *bdev,
>   		       unsigned type);
> +#define ttm_range_man_init(bdev, type, use_tt, size) ({	\
> +	BUILD_BUG_ON(__builtin_constant_p(type)		\
> +			&& type >= TTM_NUM_MEM_TYPES);	\
> +	ttm_range_man_init(bdev, type, use_tt, size);	\
> +})
> +#define ttm_range_man_fini(bdev, type) ({		\
> +	BUILD_BUG_ON(__builtin_constant_p(type)		\
> +			&& type >= TTM_NUM_MEM_TYPES);	\
> +	ttm_range_man_fini(bdev, type);			\
> +})
>   
>   #endif

