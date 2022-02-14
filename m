Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 73E694B4661
	for <lists+dri-devel@lfdr.de>; Mon, 14 Feb 2022 10:36:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70E9D10E2B2;
	Mon, 14 Feb 2022 09:36:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F0C510E2B2
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Feb 2022 09:36:42 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id v129so9252235wme.2
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Feb 2022 01:36:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:references:in-reply-to:content-transfer-encoding;
 bh=bnk+2QCHjOg5HVJbs0OpnqiBPs+sMbu6BVO1V06EDGM=;
 b=O4Tb434c/5NEqD2Vj17dnf0UrNMhu7rua/D1kDPzrWYRyhiKkFW4mf7lYgWbGGOxOq
 Cd6KwajhtHjrj0xHgPnk0ZVoci2tB4CWt5FMwg492nli+CQ/ZxztdZNeddmPiyzJmvKo
 GgYx8CePsULbFqNZhe327FociYDcryoOxHG5sn+QQjMOulRlRtPzPepWMu56sI7IujF3
 dCI3W3jxI8J1TsAqi1q49QauQqOBgr8lqQGEdW+RspRgKwi7rkUqPQZfMLR4nStRM/HK
 ENcRIMYgtRGy22DgRo5m38E3AewbzKImUBOOpfTaeV0hH+yuvdLjOEuRPysczGh8euph
 wKZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:references:in-reply-to
 :content-transfer-encoding;
 bh=bnk+2QCHjOg5HVJbs0OpnqiBPs+sMbu6BVO1V06EDGM=;
 b=xMlWaEXcNsNjH546R/o99mqnCh5eg7DooGJDKUGpe/c0bVMtQxUVoIPDSaPSMh686i
 7erD8C+tOct9/xzq+osJZYdXLjwN33ujoXI9SWJ70VdeMkO0Pulh7PPHJpPpYKtloV5j
 QjVl0skcLbJLLl3AyYzs0XiCmy+5gMcy7q+VwxYqV5/0SmA87gOYpERHQX5KINWPsofM
 4WAB/91AfrcJu17NcT7VXDDqTdJpmI7cwJH8YENx6v4tlggfUEYIp40r74XT6+osskC+
 Fu7MOh1c/Wt2ZAzmi9q2c110HHzjVxI0nk7wX4ooYjfWh9FNgOOUkkfV2Rhz3G+gv9pI
 DRvg==
X-Gm-Message-State: AOAM533k1cd4TQzGmvirkDijnsDmPL4n0GCqHo2kQieES6xp2EdAvdSM
 yccoQRbqks5e/AyDn0qd6PI=
X-Google-Smtp-Source: ABdhPJwFrHXaW+pNblEAFbDsozUNk1NF43tF9JcO+cj77R/6wPqcf1OjEItrz5gP189emGCo+l6nrA==
X-Received: by 2002:a1c:750f:: with SMTP id o15mr10153855wmc.137.1644831400769; 
 Mon, 14 Feb 2022 01:36:40 -0800 (PST)
Received: from ?IPV6:2a02:908:1252:fb60:50d5:8646:21a1:a00a?
 ([2a02:908:1252:fb60:50d5:8646:21a1:a00a])
 by smtp.gmail.com with ESMTPSA id x1sm49471wrn.12.2022.02.14.01.36.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Feb 2022 01:36:40 -0800 (PST)
Message-ID: <047b2d6f-584f-4818-7d9f-c794f389c7be@gmail.com>
Date: Mon, 14 Feb 2022 10:36:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 01/11] drm/ttm: fix resource manager size type and
 description
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
To: matthew.william.auld@gmail.com, daniel@ffwll.ch,
 thomas.hellstrom@linux.intel.com, felix.kuehling@amd.com,
 dri-devel@lists.freedesktop.org
References: <20220214093439.2989-1-christian.koenig@amd.com>
In-Reply-To: <20220214093439.2989-1-christian.koenig@amd.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi guys,

crap I once more forgot the cover letter, but this set should be pretty 
straight forward by now.

Please review and comment,
Christian.

Am 14.02.22 um 10:34 schrieb Christian König:
> That are not pages any more.
>
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>   drivers/gpu/drm/ttm/ttm_resource.c | 6 +++---
>   include/drm/ttm/ttm_resource.h     | 2 +-
>   2 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
> index 68344c90549b..ae40e144e728 100644
> --- a/drivers/gpu/drm/ttm/ttm_resource.c
> +++ b/drivers/gpu/drm/ttm/ttm_resource.c
> @@ -153,19 +153,19 @@ void ttm_resource_set_bo(struct ttm_resource *res,
>    *
>    * @man: memory manager object to init
>    * @bdev: ttm device this manager belongs to
> - * @p_size: size managed area in pages.
> + * @size: size of managed resources in arbitary units
>    *
>    * Initialise core parts of a manager object.
>    */
>   void ttm_resource_manager_init(struct ttm_resource_manager *man,
>   			       struct ttm_device *bdev,
> -			       unsigned long p_size)
> +			       uint64_t size)
>   {
>   	unsigned i;
>   
>   	spin_lock_init(&man->move_lock);
>   	man->bdev = bdev;
> -	man->size = p_size;
> +	man->size = size;
>   
>   	for (i = 0; i < TTM_MAX_BO_PRIORITY; ++i)
>   		INIT_LIST_HEAD(&man->lru[i]);
> diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resource.h
> index 69eea9d6399b..555a11fb8a7f 100644
> --- a/include/drm/ttm/ttm_resource.h
> +++ b/include/drm/ttm/ttm_resource.h
> @@ -278,7 +278,7 @@ void ttm_resource_set_bo(struct ttm_resource *res,
>   
>   void ttm_resource_manager_init(struct ttm_resource_manager *man,
>   			       struct ttm_device *bdev,
> -			       unsigned long p_size);
> +			       uint64_t size);
>   
>   int ttm_resource_manager_evict_all(struct ttm_device *bdev,
>   				   struct ttm_resource_manager *man);

