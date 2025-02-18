Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D03BEA39E64
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2025 15:13:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E214C10E3CA;
	Tue, 18 Feb 2025 14:12:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VwfBqi9d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D80DE10E3CA
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2025 14:12:55 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-43996e95114so4088645e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2025 06:12:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739887974; x=1740492774; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tzYgRVcywhBYtuTTzJDErGjkC05GXKYOTab/tFE7SCE=;
 b=VwfBqi9dBJhsUZUPm90W5PSXS+820XiPJhxSTisywrNlnzKOJ/YtNCMyzG+gb+4LL4
 /PnnYfpRFT6VeI+pXOQ1RAFFa2bLnNsBKzVWJtWpVk376vpQZabdb4mwQDzkzecEPYVl
 pioIl45VvNWXIA2fhMc0rRTvy/OdX+ChQbdrQC783mktd1P55fgFsj5aKppRMzx5xT8K
 PgpDAOppZGJfvUXI2j1GEn6q8RnJ9/DOx2h7qwFmyyIYUTVXvAt6QFE8wdIpmg1fsz+V
 Zybl1o85j+3ExE+Reddprhw3ZastQdHaUtN08h8x1dJGeHXkPk2YHjRKSCxpP2xUOEeH
 UqqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739887974; x=1740492774;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tzYgRVcywhBYtuTTzJDErGjkC05GXKYOTab/tFE7SCE=;
 b=w/ZzToFsB0YL88Aa3TlG8m5YJNp2uhKSyuGwqo9xixrKn8kkOeTMbuCCn/jlu6zhQ/
 Y875PpqOnU/3tH/C0xtFi3X0O5R1KZ7Dh8mszPoaPcxMvhL3aZFJ7O5GS3w3pD1zwBT/
 fziE5BTaBKjQWsQSqYu0fORe5KfoTl5UAPx+t1D7B6mMR+dUCLUnR7K2SN94FvPWXyn4
 DASarZ6iTfWtgWw2UHzN95h77txxKGNPRJuTYr0YweTzdreo3jL10u9on/bGJ/Audthj
 grftCX3gedDVz64NmpYagy+fMCzyB7XrH5UKtOyS47+Bbhv1hT8fcHHUYeoUT9ZmbHva
 m8lQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV5IRDI+WjFarwbR7tAecJs92qQ3OwGqkyBkoA4oL8AC5TAUBOKMPgKkzFaVHKTx3Ow81Xgvvr5YEY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwP8SiL5w4bNf4m4BeIFph2XOVkppd7fFLst13zf7hgwbI8Sdl2
 p/u8sZ536mQ5lTy/j08dBprnHm1MYnTwcdGlflakrUFMX7s+Cq86
X-Gm-Gg: ASbGncseSlVErgxFHo8KgLa6tyJg2Giuai614TDU4t/ZezNHeUnfMrGT2fAOLN8tQZe
 tG13s9jYEBR1Yx8tnk/6cBIEHeBTmyVLDHuFjk2B4wTfTkBLyfOcOZGjpkC0GZnjoeyUlD7MdOe
 opNVcObrzYnqrvRlU8p0vTZrGeh+5Dg7ZM19WuReKb3W27gW69q1kCHJoS4/+Y+4bL2JXcapdJe
 XkBzuu+xuIUp21GvzIwxKYlooKNR/bi3im+smJlt8YWvfkV8fHlX8kMzLiiuu0FYL0sTuHrzmII
 x1OUHPwmZ/rF9xpBLEds+kng3uITFJFw9CNuzwhs2US6
X-Google-Smtp-Source: AGHT+IHQdmBtJTXbHOztlaXrqyk6KztRNhnBVJ/jRSTWe0s3IlZo6TDueGPoBa0nU58F8lBBcX3IRQ==
X-Received: by 2002:a05:600c:4f47:b0:439:9377:fa22 with SMTP id
 5b1f17b1804b1-4399377fc5bmr26339075e9.18.1739887973904; 
 Tue, 18 Feb 2025 06:12:53 -0800 (PST)
Received: from [10.254.108.83] (munvpn.amd.com. [165.204.72.6])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43986b475ffsm52786645e9.17.2025.02.18.06.12.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Feb 2025 06:12:53 -0800 (PST)
Message-ID: <6ee944fe-57a7-478c-ab8c-723ce315049f@gmail.com>
Date: Tue, 18 Feb 2025 15:12:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] dma-buf: drop caching of sg_tables
To: Simona Vetter <simona.vetter@ffwll.ch>
Cc: sumit.semwal@linaro.org, tzimmermann@suse.de, simona@ffwll.ch,
 dmitry.osipenko@collabora.com, tvrtko.ursulin@igalia.com,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
References: <20250211163109.12200-1-christian.koenig@amd.com>
 <20250211163109.12200-5-christian.koenig@amd.com>
 <Z7NjlfKYlxhTgRqe@phenom.ffwll.local>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <Z7NjlfKYlxhTgRqe@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8
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

Am 17.02.25 um 17:28 schrieb Simona Vetter:
> On Tue, Feb 11, 2025 at 05:31:09PM +0100, Christian König wrote:
>> That was purely for the transition from static to dynamic dma-buf
>> handling and can be removed again now.
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
> Yay!
>
> Might uncover some fun if people have meanwhile started to rely on this
> for perf or something. But we'll figure that out when it happens.

Yeah that was exactly the reason why I made this a separate patch and didn't mixed it into patch #3.

On the other hand I'm fine to keep it a bit longer if anybody complains.

Christian.

>
> Reviewed-by: Simona Vetter <simona.vetter@ffwll.ch>
>
>
>> ---
>>  drivers/dma-buf/dma-buf.c              | 34 --------------------------
>>  drivers/dma-buf/udmabuf.c              |  1 -
>>  drivers/gpu/drm/drm_prime.c            |  1 -
>>  drivers/gpu/drm/virtio/virtgpu_prime.c |  1 -
>>  include/linux/dma-buf.h                | 13 ----------
>>  5 files changed, 50 deletions(-)
>>
>> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
>> index 357b94a3dbaa..35221c4ddbf5 100644
>> --- a/drivers/dma-buf/dma-buf.c
>> +++ b/drivers/dma-buf/dma-buf.c
>> @@ -636,10 +636,6 @@ struct dma_buf *dma_buf_export(const struct dma_buf_export_info *exp_info)
>>  		    || !exp_info->ops->release))
>>  		return ERR_PTR(-EINVAL);
>>  
>> -	if (WARN_ON(exp_info->ops->cache_sgt_mapping &&
>> -		    (exp_info->ops->pin || exp_info->ops->unpin)))
>> -		return ERR_PTR(-EINVAL);
>> -
>>  	if (WARN_ON(!exp_info->ops->pin != !exp_info->ops->unpin))
>>  		return ERR_PTR(-EINVAL);
>>  
>> @@ -964,17 +960,7 @@ void dma_buf_detach(struct dma_buf *dmabuf, struct dma_buf_attachment *attach)
>>  		return;
>>  
>>  	dma_resv_lock(dmabuf->resv, NULL);
>> -
>> -	if (attach->sgt) {
>> -		mangle_sg_table(attach->sgt);
>> -		attach->dmabuf->ops->unmap_dma_buf(attach, attach->sgt,
>> -						   attach->dir);
>> -
>> -		if (dma_buf_pin_on_map(attach))
>> -			dma_buf_unpin(attach);
>> -	}
>>  	list_del(&attach->node);
>> -
>>  	dma_resv_unlock(dmabuf->resv);
>>  
>>  	if (dmabuf->ops->detach)
>> @@ -1069,18 +1055,6 @@ struct sg_table *dma_buf_map_attachment(struct dma_buf_attachment *attach,
>>  
>>  	dma_resv_assert_held(attach->dmabuf->resv);
>>  
>> -	if (attach->sgt) {
>> -		/*
>> -		 * Two mappings with different directions for the same
>> -		 * attachment are not allowed.
>> -		 */
>> -		if (attach->dir != direction &&
>> -		    attach->dir != DMA_BIDIRECTIONAL)
>> -			return ERR_PTR(-EBUSY);
>> -
>> -		return attach->sgt;
>> -	}
>> -
>>  	if (dma_buf_pin_on_map(attach)) {
>>  		ret = attach->dmabuf->ops->pin(attach);
>>  		if (ret)
>> @@ -1105,11 +1079,6 @@ struct sg_table *dma_buf_map_attachment(struct dma_buf_attachment *attach,
>>  	}
>>  	mangle_sg_table(sg_table);
>>  
>> -	if (attach->dmabuf->ops->cache_sgt_mapping) {
>> -		attach->sgt = sg_table;
>> -		attach->dir = direction;
>> -	}
>> -
>>  #ifdef CONFIG_DMA_API_DEBUG
>>  	{
>>  		struct scatterlist *sg;
>> @@ -1190,9 +1159,6 @@ void dma_buf_unmap_attachment(struct dma_buf_attachment *attach,
>>  
>>  	dma_resv_assert_held(attach->dmabuf->resv);
>>  
>> -	if (attach->sgt == sg_table)
>> -		return;
>> -
>>  	mangle_sg_table(sg_table);
>>  	attach->dmabuf->ops->unmap_dma_buf(attach, sg_table, direction);
>>  
>> diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
>> index cc7398cc17d6..2fa2c9135eac 100644
>> --- a/drivers/dma-buf/udmabuf.c
>> +++ b/drivers/dma-buf/udmabuf.c
>> @@ -285,7 +285,6 @@ static int end_cpu_udmabuf(struct dma_buf *buf,
>>  }
>>  
>>  static const struct dma_buf_ops udmabuf_ops = {
>> -	.cache_sgt_mapping = true,
>>  	.map_dma_buf	   = map_udmabuf,
>>  	.unmap_dma_buf	   = unmap_udmabuf,
>>  	.release	   = release_udmabuf,
>> diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
>> index 32a8781cfd67..c284f306d597 100644
>> --- a/drivers/gpu/drm/drm_prime.c
>> +++ b/drivers/gpu/drm/drm_prime.c
>> @@ -810,7 +810,6 @@ int drm_gem_dmabuf_mmap(struct dma_buf *dma_buf, struct vm_area_struct *vma)
>>  EXPORT_SYMBOL(drm_gem_dmabuf_mmap);
>>  
>>  static const struct dma_buf_ops drm_gem_prime_dmabuf_ops =  {
>> -	.cache_sgt_mapping = true,
>>  	.attach = drm_gem_map_attach,
>>  	.detach = drm_gem_map_detach,
>>  	.map_dma_buf = drm_gem_map_dma_buf,
>> diff --git a/drivers/gpu/drm/virtio/virtgpu_prime.c b/drivers/gpu/drm/virtio/virtgpu_prime.c
>> index fe6a0b018571..c6f3be3cb914 100644
>> --- a/drivers/gpu/drm/virtio/virtgpu_prime.c
>> +++ b/drivers/gpu/drm/virtio/virtgpu_prime.c
>> @@ -75,7 +75,6 @@ static void virtgpu_gem_unmap_dma_buf(struct dma_buf_attachment *attach,
>>  
>>  static const struct virtio_dma_buf_ops virtgpu_dmabuf_ops =  {
>>  	.ops = {
>> -		.cache_sgt_mapping = true,
>>  		.attach = virtio_dma_buf_attach,
>>  		.detach = drm_gem_map_detach,
>>  		.map_dma_buf = virtgpu_gem_map_dma_buf,
>> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
>> index c54ff2dda8cb..544f8f8c3f44 100644
>> --- a/include/linux/dma-buf.h
>> +++ b/include/linux/dma-buf.h
>> @@ -34,15 +34,6 @@ struct dma_buf_attachment;
>>   * @vunmap: [optional] unmaps a vmap from the buffer
>>   */
>>  struct dma_buf_ops {
>> -	/**
>> -	  * @cache_sgt_mapping:
>> -	  *
>> -	  * If true the framework will cache the first mapping made for each
>> -	  * attachment. This avoids creating mappings for attachments multiple
>> -	  * times.
>> -	  */
>> -	bool cache_sgt_mapping;
>> -
>>  	/**
>>  	 * @attach:
>>  	 *
>> @@ -493,8 +484,6 @@ struct dma_buf_attach_ops {
>>   * @dmabuf: buffer for this attachment.
>>   * @dev: device attached to the buffer.
>>   * @node: list of dma_buf_attachment, protected by dma_resv lock of the dmabuf.
>> - * @sgt: cached mapping.
>> - * @dir: direction of cached mapping.
>>   * @peer2peer: true if the importer can handle peer resources without pages.
>>   * @priv: exporter specific attachment data.
>>   * @importer_ops: importer operations for this attachment, if provided
>> @@ -514,8 +503,6 @@ struct dma_buf_attachment {
>>  	struct dma_buf *dmabuf;
>>  	struct device *dev;
>>  	struct list_head node;
>> -	struct sg_table *sgt;
>> -	enum dma_data_direction dir;
>>  	bool peer2peer;
>>  	const struct dma_buf_attach_ops *importer_ops;
>>  	void *importer_priv;
>> -- 
>> 2.34.1
>>

