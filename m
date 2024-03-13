Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 927E587A8F7
	for <lists+dri-devel@lfdr.de>; Wed, 13 Mar 2024 15:03:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8762C10F3B2;
	Wed, 13 Mar 2024 14:03:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="H49ytbqv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CB2010F322
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Mar 2024 14:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1710338621;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Gxcyuud9PUU21oCT7HcyvGU9X3hZha1Ay6YbgZqHGYc=;
 b=H49ytbqv2Cv1yPdI7eVoFiIeDqMzYV9HbVAaItrtSQqbMzlLcHdFBkVIAmf8vtwIlJ3gFa
 g9G+YE7s+zYMzjm74yW5BhAlAkv9QVtkMfb+kct/cNhkl+OygUG5nc9HGGLOPR/g9sTrMX
 6BDrdtMVjjkkjksC9iiiRtD50fg5uyY=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-635-frM_hxmyOqyMhSq7UM4aPw-1; Wed, 13 Mar 2024 10:03:39 -0400
X-MC-Unique: frM_hxmyOqyMhSq7UM4aPw-1
Received: by mail-yw1-f200.google.com with SMTP id
 00721157ae682-60a04bc559fso84824207b3.2
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Mar 2024 07:03:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710338619; x=1710943419;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Gxcyuud9PUU21oCT7HcyvGU9X3hZha1Ay6YbgZqHGYc=;
 b=mxAEFQWBpTravUPP4djTGEwDAGgrcr3h1xDBReTm+vwsLE1AIKR8zS2k9Jx4HjmpZn
 +OBthHO0aJOGxCr5OrL1+Z4w8c1P5S8efUp5bXVmf+xvq5ELoS1oGjjkWUCNB6oRQe8j
 ypCUfvKFZuUTyY9vyRtwBhIysb3BzvcD+umRKioBle2hQySk40B3lBGdKE2z68NqtAN0
 LZ70KeN7T94V4nqu9j73rt2cefcC7LLRAuG+R1LmgnMliH4vAoXyD2ZGNQi8r1UMYzvM
 QQWqzS+Rda8KmJ79+ZGmKQDyIW9ze3cQXjBHUalpHsC8RnGD1M0LyG73mrifIrPO1IuD
 fUvA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUU6vfTRLfUUerya+XzDcFZKZ2CbR3LQAV3U2jcEUq/MeSt04q4Y3PC0jCcRzp64/V/5uiQQ1TQUnqSY31JfYODZCrZcYk62pGjL8e5Jg3z
X-Gm-Message-State: AOJu0YzPtb9G5gid9NUGEiJLKiBPnDItDhsDIt8AMqHAk/3PicpAXZ4N
 6M4ad00u7HVDxoz1AIqngNL6JdvbeuI9Lb0aRxoUE+rgwCfaQh81DenB3HFqQDJlhHJg5iPb7qI
 i+eYbKZ+dPPd3sJ6LMA643Nn2GJ2pjIuOj6AJHjUH/ksH0BKhABTCk1BWZz2dTrcSIQ==
X-Received: by 2002:a0d:eb81:0:b0:60a:15c9:1600 with SMTP id
 u123-20020a0deb81000000b0060a15c91600mr2846639ywe.37.1710338619044; 
 Wed, 13 Mar 2024 07:03:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGPG5IRrHrKwPgd/9Dh8Z9VwqPTesqBfo+4n0SoH+KhHZfNsII+UVsHejM49YUTC1uVCrEY0g==
X-Received: by 2002:a0d:eb81:0:b0:60a:15c9:1600 with SMTP id
 u123-20020a0deb81000000b0060a15c91600mr2846610ywe.37.1710338618766; 
 Wed, 13 Mar 2024 07:03:38 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 v17-20020a81b711000000b0060a3b09a5c2sm1705232ywh.84.2024.03.13.07.03.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Mar 2024 07:03:38 -0700 (PDT)
Message-ID: <b35f1b2f-82c1-4c7e-a449-54e29000cfb6@redhat.com>
Date: Wed, 13 Mar 2024 15:03:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/43] drm/mgag200: Use fbdev-shmem
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, deller@gmx.de, javierm@redhat.com
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Dave Airlie <airlied@redhat.com>
References: <20240312154834.26178-1-tzimmermann@suse.de>
 <20240312154834.26178-13-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20240312154834.26178-13-tzimmermann@suse.de>
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
>   drivers/gpu/drm/mgag200/mgag200_drv.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.c b/drivers/gpu/drm/mgag200/mgag200_drv.c
> index 573dbe256aa8b..65f2ed18b31c5 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_drv.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_drv.c
> @@ -12,7 +12,7 @@
>   #include <drm/drm_aperture.h>
>   #include <drm/drm_atomic_helper.h>
>   #include <drm/drm_drv.h>
> -#include <drm/drm_fbdev_generic.h>
> +#include <drm/drm_fbdev_shmem.h>
>   #include <drm/drm_file.h>
>   #include <drm/drm_ioctl.h>
>   #include <drm/drm_managed.h>
> @@ -285,7 +285,7 @@ mgag200_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>   	 * FIXME: A 24-bit color depth does not work with 24 bpp on
>   	 * G200ER. Force 32 bpp.
>   	 */
> -	drm_fbdev_generic_setup(dev, 32);
> +	drm_fbdev_shmem_setup(dev, 32);
>   
>   	return 0;
>   }

