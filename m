Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 443742BBFA5
	for <lists+dri-devel@lfdr.de>; Sat, 21 Nov 2020 15:15:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0E306E9C1;
	Sat, 21 Nov 2020 14:15:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com
 [IPv6:2a00:1450:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A145F6E9C0;
 Sat, 21 Nov 2020 14:15:33 +0000 (UTC)
Received: by mail-ej1-x642.google.com with SMTP id bo9so11148975ejb.13;
 Sat, 21 Nov 2020 06:15:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=MQEILpb1Da6lhBERJuFdjc0onE4QJ2OI2opuqh28yCM=;
 b=PHwIi+v22sRdCPBBoewf3sT11Yh5ocl96la+UHPHkDSFf8NHmqpcC4Fp+ppSb068MX
 en63LXYnnVVHjjw5aXpV1v2l2vbuwKyXrPFOCdmL6TqzJ+oS1mpObYjKXvyMiVz81NQt
 T0ebJpwz49dWOKviJ2X1dMXPTTpznfbkfKZ9nG54H12Mgm9NZZhRf+wimsy83JvVg7l3
 3/2DN3KDzY/5PZ03W/JlqxU4iGcDiplNY7kxonePCqljXzwltjTmyFJEUZG/XJz5w2wj
 rmtFOPCblrMYsNeSWFzQ1oZUQjMZ47WRcxJAQFFdnmKTQeYadeeS3P+1UQmksfcgxPrY
 mD7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=MQEILpb1Da6lhBERJuFdjc0onE4QJ2OI2opuqh28yCM=;
 b=HNooMqP+x+DObiEFT+M9mNGxsaJo/YkAHX1o3Pzt8i7Qa9CYAnAblR88a3WajXQSag
 Supbz5z4sf+pR/pRmOKiC7deFo5eNr+a7/5LagEuzZz1fSVjWwqNlBr26rHxUHSjaeZA
 Nupmy+6wTaF+Ssmz9XDqRQPB7yPs2A7uHlyooTYV+B8BF37aOuMbCIUhfqEDHygUfLCP
 0hjFIRftTd22PLnk5OBJmj18nOX1o+aOHLblocFhMcXZt0gNT+KBfGETyslGg4Zlx31l
 fE4/Ky7Fda1QGIqi4LY5gmdKDGX/LksS4L3LeHYYNsz4viBg6jVHJ7CI9FRDUjfFYYvw
 OD9w==
X-Gm-Message-State: AOAM533aKhsJ+Jiz1dbZLow7gt/bpmGtMvFYfAq1VxX5nk27iMoPqyl+
 y/t3fzMuTTE4LGEyr7INab/G63Lz6Gs=
X-Google-Smtp-Source: ABdhPJx2ZVc0HfilUrHFxteu8m9Ou1e4etZyk5qtuHGAvY3ZBHGFaAHtfey/ZOxzWVTKA63NhWw3ZA==
X-Received: by 2002:a17:906:2e0f:: with SMTP id
 n15mr19991098eji.486.1605968132295; 
 Sat, 21 Nov 2020 06:15:32 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id e10sm2510727eds.8.2020.11.21.06.15.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 21 Nov 2020 06:15:31 -0800 (PST)
Subject: Re: [PATCH v3 01/12] drm: Add dummy page per device or GEM object
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 daniel.vetter@ffwll.ch, robh@kernel.org, l.stach@pengutronix.de,
 yuq825@gmail.com, eric@anholt.net
References: <1605936082-3099-1-git-send-email-andrey.grodzovsky@amd.com>
 <1605936082-3099-2-git-send-email-andrey.grodzovsky@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <a510b5c7-1898-f101-1cfd-a037e8fa445d@gmail.com>
Date: Sat, 21 Nov 2020 15:15:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1605936082-3099-2-git-send-email-andrey.grodzovsky@amd.com>
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
Cc: Alexander.Deucher@amd.com, gregkh@linuxfoundation.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 21.11.20 um 06:21 schrieb Andrey Grodzovsky:
> Will be used to reroute CPU mapped BO's page faults once
> device is removed.

Uff, one page for each exported DMA-buf? That's not something we can do.

We need to find a different approach here.

Can't we call alloc_page() on each fault and link them together so they 
are freed when the device is finally reaped?

Regards,
Christian.

>
> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> ---
>   drivers/gpu/drm/drm_file.c  |  8 ++++++++
>   drivers/gpu/drm/drm_prime.c | 10 ++++++++++
>   include/drm/drm_file.h      |  2 ++
>   include/drm/drm_gem.h       |  2 ++
>   4 files changed, 22 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
> index 0ac4566..ff3d39f 100644
> --- a/drivers/gpu/drm/drm_file.c
> +++ b/drivers/gpu/drm/drm_file.c
> @@ -193,6 +193,12 @@ struct drm_file *drm_file_alloc(struct drm_minor *minor)
>   			goto out_prime_destroy;
>   	}
>   
> +	file->dummy_page = alloc_page(GFP_KERNEL | __GFP_ZERO);
> +	if (!file->dummy_page) {
> +		ret = -ENOMEM;
> +		goto out_prime_destroy;
> +	}
> +
>   	return file;
>   
>   out_prime_destroy:
> @@ -289,6 +295,8 @@ void drm_file_free(struct drm_file *file)
>   	if (dev->driver->postclose)
>   		dev->driver->postclose(dev, file);
>   
> +	__free_page(file->dummy_page);
> +
>   	drm_prime_destroy_file_private(&file->prime);
>   
>   	WARN_ON(!list_empty(&file->event_list));
> diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
> index 1693aa7..987b45c 100644
> --- a/drivers/gpu/drm/drm_prime.c
> +++ b/drivers/gpu/drm/drm_prime.c
> @@ -335,6 +335,13 @@ int drm_gem_prime_fd_to_handle(struct drm_device *dev,
>   
>   	ret = drm_prime_add_buf_handle(&file_priv->prime,
>   			dma_buf, *handle);
> +
> +	if (!ret) {
> +		obj->dummy_page = alloc_page(GFP_KERNEL | __GFP_ZERO);
> +		if (!obj->dummy_page)
> +			ret = -ENOMEM;
> +	}
> +
>   	mutex_unlock(&file_priv->prime.lock);
>   	if (ret)
>   		goto fail;
> @@ -1020,6 +1027,9 @@ void drm_prime_gem_destroy(struct drm_gem_object *obj, struct sg_table *sg)
>   		dma_buf_unmap_attachment(attach, sg, DMA_BIDIRECTIONAL);
>   	dma_buf = attach->dmabuf;
>   	dma_buf_detach(attach->dmabuf, attach);
> +
> +	__free_page(obj->dummy_page);
> +
>   	/* remove the reference */
>   	dma_buf_put(dma_buf);
>   }
> diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
> index 716990b..2a011fc 100644
> --- a/include/drm/drm_file.h
> +++ b/include/drm/drm_file.h
> @@ -346,6 +346,8 @@ struct drm_file {
>   	 */
>   	struct drm_prime_file_private prime;
>   
> +	struct page *dummy_page;
> +
>   	/* private: */
>   #if IS_ENABLED(CONFIG_DRM_LEGACY)
>   	unsigned long lock_count; /* DRI1 legacy lock count */
> diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
> index 337a483..76a97a3 100644
> --- a/include/drm/drm_gem.h
> +++ b/include/drm/drm_gem.h
> @@ -311,6 +311,8 @@ struct drm_gem_object {
>   	 *
>   	 */
>   	const struct drm_gem_object_funcs *funcs;
> +
> +	struct page *dummy_page;
>   };
>   
>   /**

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
