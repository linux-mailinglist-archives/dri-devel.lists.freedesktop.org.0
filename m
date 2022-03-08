Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9300E4D21B9
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 20:37:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BD8010E1A9;
	Tue,  8 Mar 2022 19:37:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C61B410E1A9
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Mar 2022 19:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646768264;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+2k8YN3Ua/MfrbcPLU4d/FurtW2MEzsF3PwIrji3KUA=;
 b=AoFgmBIsuwZ8BDkjZmAYOMIvx+VY6QIISXMZeBH6up79w0NXMaAQg+fuyY6FI/g6ifRrHc
 jlB49mQDAHiFVEwB0yzFArC3YiEY7zzG0S1i3I+aZ+jwnAFunD3iKvjhEYQRGpXrz9nqyu
 iKpk2DoXKxDRvHADGsMjmP8j0AEXAZs=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-653-nAeibsNhNFazEzniGwBTzg-1; Tue, 08 Mar 2022 14:37:43 -0500
X-MC-Unique: nAeibsNhNFazEzniGwBTzg-1
Received: by mail-wm1-f71.google.com with SMTP id
 l1-20020a1c2501000000b00389c7b9254cso623681wml.1
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Mar 2022 11:37:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=+2k8YN3Ua/MfrbcPLU4d/FurtW2MEzsF3PwIrji3KUA=;
 b=4W+Rt0DlQS+JKWI9rLzjhuSj8yTLHPAQHSHZ/jKJf9ux43djSGB6Wkq4REdaCh9knQ
 5SuQ6AVv9wPaOAp7T+EB/CIsDUtjp4isFrd16WmhpO8LEKxI1Rlxut74I7mUG4CVGrix
 22AkDGzXrGtMTshOJrh4cVT+YUun6fFgl1dAj8jYbI9J18weV6SlFat53LzlttMwTlO0
 h3oKNkSbZE5Us83jT/s7RY0Xrda1ZAY99mp6NBDXUb7mIg3CL4VXj0nnLk16Yu4Bku6f
 ZQJ8MwLrfjprm09MEQClM7GksznBB4shDJC3jo2wS0P5VkRNByoZ1jbRpUWad1mUC1+g
 9OEg==
X-Gm-Message-State: AOAM532R8Kp7pi9DN5/CF93onPAHNx7EUToTExFPWM87HXqbZsNnCJ4/
 dDi2NmIF6TahAwtBv/Sc8LHNFZwpsZq87llSFbBAsr7MrEahjsLHrNFLQW8Rv49/tIYN8MKjObu
 ed4o5WylEohI+TKJhjjLlhKglZO4v
X-Received: by 2002:a5d:5707:0:b0:1f0:1815:be86 with SMTP id
 a7-20020a5d5707000000b001f01815be86mr13648914wrv.383.1646768262276; 
 Tue, 08 Mar 2022 11:37:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzQDbHk0Oyh98eHSFSfeioEZRSnYXr6P9e7XMlZU3xU/Hyrpx++ggBV0z8kJBT7QQ599GCKow==
X-Received: by 2002:a5d:5707:0:b0:1f0:1815:be86 with SMTP id
 a7-20020a5d5707000000b001f01815be86mr13648907wrv.383.1646768262062; 
 Tue, 08 Mar 2022 11:37:42 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 w9-20020a5d6089000000b001f0256761b9sm23862348wrt.45.2022.03.08.11.37.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Mar 2022 11:37:41 -0800 (PST)
Message-ID: <b1af16e7-a20f-5499-6234-c5090349305f@redhat.com>
Date: Tue, 8 Mar 2022 20:37:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 9/9] drm/virtio: Implement dumb_create_fbdev with GEM
 SHMEM helpers
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@linux.ie, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 deller@gmx.de
References: <20220303205839.28484-1-tzimmermann@suse.de>
 <20220303205839.28484-10-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220303205839.28484-10-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/3/22 21:58, Thomas Zimmermann wrote:
> Implement struct drm_driver.dumb_create_fbdev with the helpers
> provided by GEM SHMEM. Fbdev deferred I/O will now work without
> an intermediate shadow buffer for mmap.
> 
> As the virtio driver replaces several of the regular GEM SHMEM
> functions with its own implementation, some additional code is
> necessary make fbdev optimization work. Especially, the driver
> has to provide buffer-object functions for fbdev. Add the hook
> struct drm_driver.gem_create_object_fbdev, which is similar to
> struct drm_driver.gem_create_object and allows for the creation
> of dedicated fbdev buffer objects. Wire things up within GEM
> SHMEM.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/drm_gem_shmem_helper.c  |  7 +++-
>  drivers/gpu/drm/virtio/virtgpu_drv.c    |  2 +
>  drivers/gpu/drm/virtio/virtgpu_drv.h    |  2 +
>  drivers/gpu/drm/virtio/virtgpu_object.c | 54 +++++++++++++++++++++++--
>  include/drm/drm_drv.h                   | 10 +++++
>  5 files changed, 71 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
> index ab7cb7d896c3..225aa17895bd 100644
> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> @@ -71,7 +71,12 @@ __drm_gem_shmem_create(struct drm_device *dev, size_t size, bool private, bool f
>  
>  	size = PAGE_ALIGN(size);
>  
> -	if (dev->driver->gem_create_object) {
> +	if (dev->driver->gem_create_object_fbdev && fbdev) {

Same comment here to check if fbdev emulation is enabled or maybe is not
worht it ? But I think this hints the compiler to optimize the if branch.

[snip]

> +}
> +#else
> +struct drm_gem_object *virtio_gpu_create_object_fbdev(struct drm_device *dev,
> +						      size_t size)
> +{
> +	return ERR_PTR(-ENOSYS);
> +}

As mentioned, I believe this should be ERR_PTR(-ENOTSUPP) instead.

Feel free to ignore all this nits if you consider that are not applicable.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

