Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B12B7835FD4
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jan 2024 11:36:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44CB510E680;
	Mon, 22 Jan 2024 10:36:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1606D10E680
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jan 2024 10:36:05 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-40e9d4ab5f3so33013275e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jan 2024 02:36:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705919704; x=1706524504; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wUaBjTF8ze7TJQKlKI0DO8wsNhCqTacpbxQmnNsDib0=;
 b=BkArbsUQcqTDUJ/GmuzNSfb8e3id2482hZ8TI66tl8blyqFWbvfoaNaUTGwzo5o7Pw
 kZza3yesmgfZMfF2MrjVTv4sSwYPFyO4XG9lvXjTwXRXc7ekZN/DkSDxWtxnoMfgaSF1
 Cpy6zhGfpqsZE42femwPT26qNazX/Tai+b3ID3FzX4QnzEAobJqM4LuWNBHxrWlWb3u+
 HBiBB5MN/geKosbnsim56pRrRwER9tHEuKs0Nyys6oMSMUZjy21og/hOYVGbbUlzPFkw
 4lBBcAw49KhOmjACXu64XmreUUg+aFM9sQTUF4UUobdkQVecdPHKe/PwV4IikDrnH0m2
 gFsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705919704; x=1706524504;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wUaBjTF8ze7TJQKlKI0DO8wsNhCqTacpbxQmnNsDib0=;
 b=K6Szp5O6mFDE50M6HQZuL36jLy3mHaFHWSDgYgajbFkjROjJO1f/4/TPzfDG9UbpjK
 BCzXW52FDC9X+Hz9eOEtnBq1utYKAldpy8u2UlqM1f/w3sRcS+NfLe7TjLjet2RQcIuG
 KnR/1Z/xa5mXsh0PQnEiun7DGih4XB4wOj4rj5DHmyaMTgnCrKb6ew9Rj23VMSZZGyJo
 l4G72p5ekMCrJc9mr2EyiSGOQbNuyp6fUek0s/emwIOuYbeqZ/xkPXnhX26F7WPSVfNx
 FtXB4DnMFbmbuZ9I8mmldgkZCLq0bc6XFVQIMHD6d9oHfRr6N8VUapkA6QnTSYx722Rz
 SuZA==
X-Gm-Message-State: AOJu0YxCHcoeQ5pZGFWbK6myVxlDTKB4c3syESXipbKKNBy1JXr2sABH
 Dtrp38N5VQdW4pVt36mSqf+GRyK01zFz6aoeSpYZqWHkSmzvgVnl
X-Google-Smtp-Source: AGHT+IEBg93W5Ic2cq8LVxb2U2hPd7pLRG/nN6Z0J3Udrdl4B95BIKuujofcMkdi+IpBnJPrzbr9Pg==
X-Received: by 2002:a05:600c:548e:b0:40e:615f:32cc with SMTP id
 iv14-20020a05600c548e00b0040e615f32ccmr2257718wmb.185.1705919703859; 
 Mon, 22 Jan 2024 02:35:03 -0800 (PST)
Received: from [10.254.108.81] (munvpn.amd.com. [165.204.72.6])
 by smtp.gmail.com with ESMTPSA id
 ay2-20020a05600c1e0200b0040ead97f70dsm3088330wmb.24.2024.01.22.02.35.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jan 2024 02:35:03 -0800 (PST)
Message-ID: <8035f515-591f-4c87-bf0a-23d5705d9b1c@gmail.com>
Date: Mon, 22 Jan 2024 11:35:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Linaro-mm-sig] [PATCH v5 1/6] dma-buf: Add
 dma_buf_{begin,end}_access()
Content-Language: en-US
To: Paul Cercueil <paul@crapouillou.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonathan Corbet <corbet@lwn.net>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
References: <20240119141402.44262-1-paul@crapouillou.net>
 <20240119141402.44262-2-paul@crapouillou.net>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20240119141402.44262-2-paul@crapouillou.net>
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
Cc: Michael Hennerich <Michael.Hennerich@analog.com>, linux-doc@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 =?UTF-8?Q?Nuno_S=C3=A1?= <noname.nuno@gmail.com>,
 Jonathan Cameron <jic23@kernel.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 19.01.24 um 15:13 schrieb Paul Cercueil:
> These functions should be used by device drivers when they start and
> stop accessing the data of DMABUF. It allows DMABUF importers to cache
> the dma_buf_attachment while ensuring that the data they want to access
> is available for their device when the DMA transfers take place.

As Daniel already noted as well this is a complete no-go from the 
DMA-buf design point of view.

Regards,
Christian.

>
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>
> ---
> v5: New patch
> ---
>   drivers/dma-buf/dma-buf.c | 66 +++++++++++++++++++++++++++++++++++++++
>   include/linux/dma-buf.h   | 37 ++++++++++++++++++++++
>   2 files changed, 103 insertions(+)
>
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index 8fe5aa67b167..a8bab6c18fcd 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -830,6 +830,8 @@ static struct sg_table * __map_dma_buf(struct dma_buf_attachment *attach,
>    *     - dma_buf_mmap()
>    *     - dma_buf_begin_cpu_access()
>    *     - dma_buf_end_cpu_access()
> + *     - dma_buf_begin_access()
> + *     - dma_buf_end_access()
>    *     - dma_buf_map_attachment_unlocked()
>    *     - dma_buf_unmap_attachment_unlocked()
>    *     - dma_buf_vmap_unlocked()
> @@ -1602,6 +1604,70 @@ void dma_buf_vunmap_unlocked(struct dma_buf *dmabuf, struct iosys_map *map)
>   }
>   EXPORT_SYMBOL_NS_GPL(dma_buf_vunmap_unlocked, DMA_BUF);
>   
> +/**
> + * @dma_buf_begin_access - Call before any hardware access from/to the DMABUF
> + * @attach:	[in]	attachment used for hardware access
> + * @sg_table:	[in]	scatterlist used for the DMA transfer
> + * @direction:  [in]    direction of DMA transfer
> + */
> +int dma_buf_begin_access(struct dma_buf_attachment *attach,
> +			 struct sg_table *sgt, enum dma_data_direction dir)
> +{
> +	struct dma_buf *dmabuf;
> +	bool cookie;
> +	int ret;
> +
> +	if (WARN_ON(!attach))
> +		return -EINVAL;
> +
> +	dmabuf = attach->dmabuf;
> +
> +	if (!dmabuf->ops->begin_access)
> +		return 0;
> +
> +	cookie = dma_fence_begin_signalling();
> +	ret = dmabuf->ops->begin_access(attach, sgt, dir);
> +	dma_fence_end_signalling(cookie);
> +
> +	if (WARN_ON_ONCE(ret))
> +		return ret;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_NS_GPL(dma_buf_begin_access, DMA_BUF);
> +
> +/**
> + * @dma_buf_end_access - Call after any hardware access from/to the DMABUF
> + * @attach:	[in]	attachment used for hardware access
> + * @sg_table:	[in]	scatterlist used for the DMA transfer
> + * @direction:  [in]    direction of DMA transfer
> + */
> +int dma_buf_end_access(struct dma_buf_attachment *attach,
> +		       struct sg_table *sgt, enum dma_data_direction dir)
> +{
> +	struct dma_buf *dmabuf;
> +	bool cookie;
> +	int ret;
> +
> +	if (WARN_ON(!attach))
> +		return -EINVAL;
> +
> +	dmabuf = attach->dmabuf;
> +
> +	if (!dmabuf->ops->end_access)
> +		return 0;
> +
> +	cookie = dma_fence_begin_signalling();
> +	ret = dmabuf->ops->end_access(attach, sgt, dir);
> +	dma_fence_end_signalling(cookie);
> +
> +	if (WARN_ON_ONCE(ret))
> +		return ret;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_NS_GPL(dma_buf_end_access, DMA_BUF);
> +
>   #ifdef CONFIG_DEBUG_FS
>   static int dma_buf_debug_show(struct seq_file *s, void *unused)
>   {
> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> index 8ff4add71f88..8ba612c7cc16 100644
> --- a/include/linux/dma-buf.h
> +++ b/include/linux/dma-buf.h
> @@ -246,6 +246,38 @@ struct dma_buf_ops {
>   	 */
>   	int (*end_cpu_access)(struct dma_buf *, enum dma_data_direction);
>   
> +	/**
> +	 * @begin_access:
> +	 *
> +	 * This is called from dma_buf_begin_access() when a device driver
> +	 * wants to access the data of the DMABUF. The exporter can use this
> +	 * to flush/sync the caches if needed.
> +	 *
> +	 * This callback is optional.
> +	 *
> +	 * Returns:
> +	 *
> +	 * 0 on success or a negative error code on failure.
> +	 */
> +	int (*begin_access)(struct dma_buf_attachment *, struct sg_table *,
> +			    enum dma_data_direction);
> +
> +	/**
> +	 * @end_access:
> +	 *
> +	 * This is called from dma_buf_end_access() when a device driver is
> +	 * done accessing the data of the DMABUF. The exporter can use this
> +	 * to flush/sync the caches if needed.
> +	 *
> +	 * This callback is optional.
> +	 *
> +	 * Returns:
> +	 *
> +	 * 0 on success or a negative error code on failure.
> +	 */
> +	int (*end_access)(struct dma_buf_attachment *, struct sg_table *,
> +			  enum dma_data_direction);
> +
>   	/**
>   	 * @mmap:
>   	 *
> @@ -606,6 +638,11 @@ void dma_buf_detach(struct dma_buf *dmabuf,
>   int dma_buf_pin(struct dma_buf_attachment *attach);
>   void dma_buf_unpin(struct dma_buf_attachment *attach);
>   
> +int dma_buf_begin_access(struct dma_buf_attachment *attach,
> +			 struct sg_table *sgt, enum dma_data_direction dir);
> +int dma_buf_end_access(struct dma_buf_attachment *attach,
> +		       struct sg_table *sgt, enum dma_data_direction dir);
> +
>   struct dma_buf *dma_buf_export(const struct dma_buf_export_info *exp_info);
>   
>   int dma_buf_fd(struct dma_buf *dmabuf, int flags);

