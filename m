Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 234E7493729
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jan 2022 10:24:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97D3310E9EC;
	Wed, 19 Jan 2022 09:24:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E7AA10E9E9
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 09:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642584248;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aWIudIN9QxWVEKx/7ZECP7La1zrWZ2LylnKH/SolyCs=;
 b=DFS2HZL2oVEh794QAUcOMwyBaUY3+huVu3xRYbg30qaW6ypre2DPCzdpdGeVWCZA+FZelg
 j0eD4IuwlYZrm5urlccFIygNCUg+L8oT4MGN0lmD8/I9VdOzV92jQKPFLCgAhtd0TOIzf4
 reTM1fsBF5zfFTgIZiGVQKyEdvURvgk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-342-HDDLT-g_PTWI3HEd4Fa8hA-1; Wed, 19 Jan 2022 04:24:07 -0500
X-MC-Unique: HDDLT-g_PTWI3HEd4Fa8hA-1
Received: by mail-wm1-f70.google.com with SMTP id
 j6-20020a05600c1c0600b0034c02775da7so911155wms.3
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 01:24:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=aWIudIN9QxWVEKx/7ZECP7La1zrWZ2LylnKH/SolyCs=;
 b=A5hi36EWTrFuEFlNpgL6b4ORUuCqNdYoRw/uyPVXi0cmxr47PsoJEMaaWxepLx187P
 aRHTaytdu1HlKnIhYVHzXX5GBMKsiV3FhZX2LhZude/hTwmJePclcZ3VS3/TdftoFBno
 6UspLOy8d/KgtMJ3MUZvZl/XxuiLecxuU5ZKx1oYNybw2YVqFMHeDlNXK78JzMlWMBjf
 0/of3Qj3SJZt4FxK+VKyjhyp19j7DXpLrz9XJRleuuM/v/BVOiAXbY47Q3L/RQis9q28
 Mi+dIsYDbIqWKbMg460GysQkpTe5TGzGSVkfrXDTWa+HnqALgqvqyxBosciBEJauClsD
 GZ8g==
X-Gm-Message-State: AOAM532PkcJttTARrc94gxD1bVK39DpNmvzh/UKozliH8UXGHspwOELE
 w6cPkzbr2a5MkaD20G5Zcmlmo7dzsnxzcMpEfXyf2twWq9zJsgp3wvbtlBYAgv1VwE6CILdpo8p
 xR6ZXkw7a8Jv9wAtBQKMYjqZeTY91
X-Received: by 2002:a1c:1b97:: with SMTP id b145mr2476721wmb.181.1642584245586; 
 Wed, 19 Jan 2022 01:24:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxmw2522dyD1aMNSY3ywfNgziS7DwbYkYu8kDLLTptamzow3FKNDpjGoXLTHtU1HvH322lzuA==
X-Received: by 2002:a1c:1b97:: with SMTP id b145mr2476705wmb.181.1642584245358; 
 Wed, 19 Jan 2022 01:24:05 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id o33sm9380585wms.3.2022.01.19.01.24.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Jan 2022 01:24:05 -0800 (PST)
Message-ID: <45c3cff0-2cd3-92c5-84e7-742e076a65e6@redhat.com>
Date: Wed, 19 Jan 2022 10:24:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] drm/selftests: Select DRM_DP_HELPER
To: Thomas Zimmermann <tzimmermann@suse.de>, lyude@redhat.com,
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org
References: <20220118154418.25932-1-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220118154418.25932-1-tzimmermann@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: kernel test robot <lkp@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Thomas,

On 1/18/22 16:44, Thomas Zimmermann wrote:
> Resolve warnings about non-existing symbols by selecting DRM_DP_HELPER.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: adb9d5a2cc77 ("drm/dp: Move DisplayPort helpers into separate helper module")
> Reported-by: kernel test robot <lkp@intel.com>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: dri-devel@lists.freedesktop.org
> ---
>  drivers/gpu/drm/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index 91f54aeb0b7c..65897777d931 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -68,6 +68,7 @@ config DRM_DEBUG_SELFTEST
>  	depends on DRM
>  	depends on DEBUG_KERNEL
>  	select PRIME_NUMBERS
> +	select DRM_DP_HELPER
>  	select DRM_LIB_RANDOM
>  	select DRM_KMS_HELPER
>  	select DRM_EXPORT_FOR_TESTS if m

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

