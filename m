Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8723659FCE7
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 16:11:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B98C10ED16;
	Wed, 24 Aug 2022 14:11:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2314910EE14;
 Wed, 24 Aug 2022 14:10:58 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id t5so22201791edc.11;
 Wed, 24 Aug 2022 07:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=kqPUQCej5vuqxvtj8Chlk3T/0EwQ6MX8daIfGCr7o8M=;
 b=jTVBzq0qwP/Jiix3oxmDZ7+wYfTBhEWTauZQdu8hOviYHBGCplvf/sjEo/RV5EynDV
 F/3igCTqIWBw9y1M+Tz1KtUNZJ/Vc7vYsDCQckxSEEaEAATSUMLMhhZM/uRvXPKJwTID
 JFPXKVME1YPvW3AWEEt8IY1tnflEl6+s2+VTI3lNdEf9I2/bpW1ED4ELRE0sMfvAneeH
 /StlMvl5hA5f4v6Ub32YqKj3011/RpihmCQ/mxpFLVUJNkoTI8bwaIrfE8kqKCGPv4z9
 I+UIpLo6Qj3px/bXQ4vWO4iPykWOgMwW3vwWBjvKVJT+EdtLeVH/fQX5AFSNWc9Rj8ry
 Hsqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=kqPUQCej5vuqxvtj8Chlk3T/0EwQ6MX8daIfGCr7o8M=;
 b=pBYITOfsug3+bwNnwLpjSYbi1v5Oq5nEWkiRy9jjwM4kMYrGo1l97uv2HJF1jw4QRK
 U6lzaCEzWJhTga60iK55ZK2t/RCQfjgjvV4jGtSNkR/8rgVtKnyE7oArvLJycCE5uZtk
 SnsukO3BXVvUxbgOZJeF2z6EXgbJZue6UlaJqfE5InlgmxaswMCOr94H8sUi+CyxNuKU
 NxoP47+cV4QDltKYqD3eGAmlR6MXt16DKlrHQyHnPP3SrJAwli4ajgFDmBS1X4tgBeOh
 7jpmGbPjIaxUJnBKZkYdSbplOs29R3CTMe0bjQsmzs6QbIA3snDZW9yzqXIRfXASPQXz
 J9LA==
X-Gm-Message-State: ACgBeo2TSuTmM6m/GO6Ti/EHgXDz/nR9wKiX820bxxwsmnvw5BG1i05O
 mMek/NFeolmq4qRPh6XWtpQ=
X-Google-Smtp-Source: AA6agR4FhXaC9pbWpsAk9+dYxjrSjwUKJso4IGx0zPGDwcQGaUM8T/17R/PS2YwW53RL5Bz2crZ4pw==
X-Received: by 2002:a05:6402:358a:b0:446:da94:e68c with SMTP id
 y10-20020a056402358a00b00446da94e68cmr7682224edc.356.1661350256435; 
 Wed, 24 Aug 2022 07:10:56 -0700 (PDT)
Received: from ?IPV6:2a02:908:1256:79a0:62ca:57d9:b533:6057?
 ([2a02:908:1256:79a0:62ca:57d9:b533:6057])
 by smtp.gmail.com with ESMTPSA id
 u18-20020a1709061db200b0073d6d760daesm1229270ejh.60.2022.08.24.07.10.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Aug 2022 07:10:55 -0700 (PDT)
Message-ID: <abb7842a-ca07-59db-927b-06c3dc17974c@gmail.com>
Date: Wed, 24 Aug 2022 16:10:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 9/9] dma-buf: Remove internal lock
Content-Language: en-US
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Gert Wollny <gert.wollny@collabora.com>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 Daniel Stone <daniel@fooishbar.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Clark <robdclark@gmail.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, Thierry Reding
 <thierry.reding@gmail.com>, Tomasz Figa <tfiga@chromium.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas_os@shipmail.org>,
 Qiang Yu <yuq825@gmail.com>
References: <20220824102248.91964-1-dmitry.osipenko@collabora.com>
 <20220824102248.91964-10-dmitry.osipenko@collabora.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20220824102248.91964-10-dmitry.osipenko@collabora.com>
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
Cc: lima@lists.freedesktop.org, linux-rdma@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, linaro-mm-sig@lists.linaro.org,
 dri-devel@lists.freedesktop.org, Dmitry Osipenko <digetx@gmail.com>,
 kernel@collabora.com, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 24.08.22 um 12:22 schrieb Dmitry Osipenko:
> The internal dma-buf lock isn't needed anymore because the updated
> locking specification claims that dma-buf reservation must be locked
> by importers, and thus, the internal data is already protected by the
> reservation lock. Remove the obsoleted internal lock.
>
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/dma-buf/dma-buf.c | 14 ++++----------
>   include/linux/dma-buf.h   |  9 ---------
>   2 files changed, 4 insertions(+), 19 deletions(-)
>
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index 696d132b02f4..a0406254f0ae 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -656,7 +656,6 @@ struct dma_buf *dma_buf_export(const struct dma_buf_export_info *exp_info)
>   
>   	dmabuf->file = file;
>   
> -	mutex_init(&dmabuf->lock);
>   	INIT_LIST_HEAD(&dmabuf->attachments);
>   
>   	mutex_lock(&db_list.lock);
> @@ -1503,7 +1502,7 @@ EXPORT_SYMBOL_NS_GPL(dma_buf_mmap_unlocked, DMA_BUF);
>   int dma_buf_vmap(struct dma_buf *dmabuf, struct iosys_map *map)
>   {
>   	struct iosys_map ptr;
> -	int ret = 0;
> +	int ret;
>   
>   	iosys_map_clear(map);
>   
> @@ -1515,28 +1514,25 @@ int dma_buf_vmap(struct dma_buf *dmabuf, struct iosys_map *map)
>   	if (!dmabuf->ops->vmap)
>   		return -EINVAL;
>   
> -	mutex_lock(&dmabuf->lock);
>   	if (dmabuf->vmapping_counter) {
>   		dmabuf->vmapping_counter++;
>   		BUG_ON(iosys_map_is_null(&dmabuf->vmap_ptr));
>   		*map = dmabuf->vmap_ptr;
> -		goto out_unlock;
> +		return 0;
>   	}
>   
>   	BUG_ON(iosys_map_is_set(&dmabuf->vmap_ptr));
>   
>   	ret = dmabuf->ops->vmap(dmabuf, &ptr);
>   	if (WARN_ON_ONCE(ret))
> -		goto out_unlock;
> +		return ret;
>   
>   	dmabuf->vmap_ptr = ptr;
>   	dmabuf->vmapping_counter = 1;
>   
>   	*map = dmabuf->vmap_ptr;
>   
> -out_unlock:
> -	mutex_unlock(&dmabuf->lock);
> -	return ret;
> +	return 0;
>   }
>   EXPORT_SYMBOL_NS_GPL(dma_buf_vmap, DMA_BUF);
>   
> @@ -1578,13 +1574,11 @@ void dma_buf_vunmap(struct dma_buf *dmabuf, struct iosys_map *map)
>   	BUG_ON(dmabuf->vmapping_counter == 0);
>   	BUG_ON(!iosys_map_is_equal(&dmabuf->vmap_ptr, map));
>   
> -	mutex_lock(&dmabuf->lock);
>   	if (--dmabuf->vmapping_counter == 0) {
>   		if (dmabuf->ops->vunmap)
>   			dmabuf->ops->vunmap(dmabuf, map);
>   		iosys_map_clear(&dmabuf->vmap_ptr);
>   	}
> -	mutex_unlock(&dmabuf->lock);
>   }
>   EXPORT_SYMBOL_NS_GPL(dma_buf_vunmap, DMA_BUF);
>   
> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> index d48d534dc55c..aed6695bbb50 100644
> --- a/include/linux/dma-buf.h
> +++ b/include/linux/dma-buf.h
> @@ -326,15 +326,6 @@ struct dma_buf {
>   	/** @ops: dma_buf_ops associated with this buffer object. */
>   	const struct dma_buf_ops *ops;
>   
> -	/**
> -	 * @lock:
> -	 *
> -	 * Used internally to serialize list manipulation, attach/detach and
> -	 * vmap/unmap. Note that in many cases this is superseeded by
> -	 * dma_resv_lock() on @resv.
> -	 */
> -	struct mutex lock;
> -
>   	/**
>   	 * @vmapping_counter:
>   	 *

