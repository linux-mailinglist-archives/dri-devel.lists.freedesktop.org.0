Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CCFB87A8F5
	for <lists+dri-devel@lfdr.de>; Wed, 13 Mar 2024 15:03:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C97D10F322;
	Wed, 13 Mar 2024 14:03:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="epC0hUDy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FD7E10F3B2
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Mar 2024 14:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1710338621;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KUZt6MNgjNHKhgTBbA2vfDVZEI9VXutMPGq00oedqJk=;
 b=epC0hUDyv6MVNWsYE3rpnxG5GxFPUx2E9rkU2vTy5LZy9eLoINzRtrHrp9tEt5s0Giix3b
 PLriXlM0N81TyF1WgjVdfHeBJjOsn3Gaq6EFnCTzIOQiNyJs/jgymvjTVL9AbeqNTp7Jvy
 BwfxJLSR9W/c72j+PUdu0wOncFrtlv0=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-20-XqIta1PWNWWNFMwcunrkyA-1; Wed, 13 Mar 2024 10:03:29 -0400
X-MC-Unique: XqIta1PWNWWNFMwcunrkyA-1
Received: by mail-yw1-f200.google.com with SMTP id
 00721157ae682-60cbba6f571so5446117b3.1
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Mar 2024 07:03:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710338609; x=1710943409;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KUZt6MNgjNHKhgTBbA2vfDVZEI9VXutMPGq00oedqJk=;
 b=mItc+r0VYNVYkikLowAVkAAUBKvxSLp/yE1jXeauKryTm0c7HrylBvdqCh6ziQfcmx
 wuCVjvaV/cD0lOBVP2K1HudcRwvdgv1K4Qd6E2FOQc9wEsIBs89/lp7B3F85L5q5xjG4
 N2pG3E8KSdyxaFmY9aXOGLAXABx40M/SahevDAFilUyfYxonKjOHzTdK7gpyFbLcpfQZ
 yBVhuh3FBmXniP06Bp3Pvr2Ih94cJ947boKW7s0ro6zUAqZhVvT5+WpR6Qg7XteQptjK
 yeDlTD9A5VhOBuzB8LCdk6eGXxkvTSO1quWJOn4s9tvZkMpAsBnU9fJAVo1cLJ55Saq0
 IDEw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXLD5286FAuc/yS9hdI59RGqKynxS+sxsGl3xiEVYOSA24YToo8qYBD2mBQaxG4vS1pVKRprFMJNRZwOb6vHumrJdd6EHbHqFfAM50pgMhD
X-Gm-Message-State: AOJu0YxHuDhYHvGJEvsdOxMg4iQyQQKcYDhZoBl1Zzy2jLjxtc6rh1Nf
 MuuhQ8zWNjrLRGh2jeGFfTy6PUPOw8jdKbFsRnA9rXwCTY7m4QO3oFerYKNNo3dv9AAAa2bC8iR
 Qp6jZ+RKLmR40T36uA26b8SWHt4z43ksJZ4hGCE3fjx0T1khJ7Ms2IdUQ6xTNlVHmbQ==
X-Received: by 2002:a81:9246:0:b0:60a:747:3bfe with SMTP id
 j67-20020a819246000000b0060a07473bfemr2725724ywg.8.1710338609427; 
 Wed, 13 Mar 2024 07:03:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHWdsshGcAcaIQgsFp7I99HVmihocR1aZSa+pyc4phvvEbHewV9fwCvq2Sn0OpTojhIl+9vRw==
X-Received: by 2002:a81:9246:0:b0:60a:747:3bfe with SMTP id
 j67-20020a819246000000b0060a07473bfemr2725674ywg.8.1710338608970; 
 Wed, 13 Mar 2024 07:03:28 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 v17-20020a81b711000000b0060a3b09a5c2sm1705232ywh.84.2024.03.13.07.03.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Mar 2024 07:03:28 -0700 (PDT)
Message-ID: <4ebc7904-ac18-480e-91be-d9338f1c01d2@redhat.com>
Date: Wed, 13 Mar 2024 15:03:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/43] drm/ast: Use fbdev-shmem
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, deller@gmx.de, javierm@redhat.com
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Dave Airlie <airlied@redhat.com>
References: <20240312154834.26178-1-tzimmermann@suse.de>
 <20240312154834.26178-10-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20240312154834.26178-10-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

-- 

Jocelyn

On 12/03/2024 16:45, Thomas Zimmermann wrote:
> Implement fbdev emulation with fbdev-shmem. Avoids the overhead of
> fbdev-generic's additional shadow buffering. No functional changes.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Jocelyn Falempe <jfalempe@redhat.com>
> ---
>   drivers/gpu/drm/ast/ast_drv.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ast/ast_drv.c b/drivers/gpu/drm/ast/ast_drv.c
> index 90bcb1eb9cd94..4fcab4304e176 100644
> --- a/drivers/gpu/drm/ast/ast_drv.c
> +++ b/drivers/gpu/drm/ast/ast_drv.c
> @@ -32,7 +32,7 @@
>   #include <drm/drm_aperture.h>
>   #include <drm/drm_atomic_helper.h>
>   #include <drm/drm_drv.h>
> -#include <drm/drm_fbdev_generic.h>
> +#include <drm/drm_fbdev_shmem.h>
>   #include <drm/drm_gem_shmem_helper.h>
>   #include <drm/drm_module.h>
>   #include <drm/drm_probe_helper.h>
> @@ -359,7 +359,7 @@ static int ast_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>   	if (ret)
>   		return ret;
>   
> -	drm_fbdev_generic_setup(drm, 32);
> +	drm_fbdev_shmem_setup(drm, 32);
>   
>   	return 0;
>   }

