Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8995FAA4E33
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 16:14:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDD6F10E2E7;
	Wed, 30 Apr 2025 14:14:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="ZjrfCLdL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 18955 seconds by postgrey-1.36 at gabe;
 Wed, 30 Apr 2025 14:14:35 UTC
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
 by gabe.freedesktop.org (Postfix) with ESMTP id E352810E2E7
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Apr 2025 14:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Content-Type:Message-ID:Date:MIME-Version:Subject:
 From; bh=hz5XTadKuvGW5WwL0KYb8dP7tKBGLeptPcgg3XoomuE=; b=ZjrfCLd
 Lv5OS+i5hPc4CLjk+N+IhSnVVsmAh0dFkVtqWlDmEdSXNg/gvI4xqIVqT7cqSmiU
 +vA5z41chMs7sOgi1LRwJWEMpcaAvqBEeMgwN6BcMMiU31bVolnEy49NRe0i3xPU
 bH3vCkE3VBvmg8dEAldXKkjweiRUWkiRf2/s=
Received: from [192.168.124.17] (unknown [])
 by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id
 _____wAnuGIcMBJoOD7WDg--.23620S2; 
 Wed, 30 Apr 2025 22:13:49 +0800 (CST)
Content-Type: multipart/alternative;
 boundary="------------FOlgcjN1YJPW0a1Z3gAum2gl"
Message-ID: <c93177d7-be53-4f37-96d4-d09323737581@163.com>
Date: Wed, 30 Apr 2025 22:13:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drm/prime: Support importing DMA-BUF without sg_table
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Sumit Semwal <sumit.semwal@linaro.org>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dave Airlie <airlied@redhat.com>, Sean Paul <sean@poorly.run>,
 Shixiong Ou <oushixiong@kylinos.cn>
References: <20250430085658.540746-1-oushixiong1025@163.com>
 <20250430085658.540746-2-oushixiong1025@163.com>
 <daaf1445-f0b8-490a-b87b-dab219f13571@amd.com>
From: oushixiong <oushixiong1025@163.com>
In-Reply-To: <daaf1445-f0b8-490a-b87b-dab219f13571@amd.com>
X-CM-TRANSID: _____wAnuGIcMBJoOD7WDg--.23620S2
X-Coremail-Antispam: 1Uf129KBjvJXoW3AF1UAF1fur1UXFW8Wr1rZwb_yoW3uw1fpF
 43ZFyUKrWYqFWqgF93A3ZrZa45uw4IgF4I9rZ3Jw4Y93Z5tr1qkF98Ar90vry5JryDJF1f
 tFyDtryrAryjkF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zE1v3UUUUUU=
X-Originating-IP: [113.246.124.231]
X-CM-SenderInfo: xrxvxxx0lr0wirqskqqrwthudrp/1tbiXQM-D2gSLrYaAQAAsX
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

This is a multi-part message in MIME format.
--------------FOlgcjN1YJPW0a1Z3gAum2gl
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


在 2025/4/30 19:03, Christian König 写道:
> On 4/30/25 10:56,oushixiong1025@163.com wrote:
>> From: Shixiong Ou<oushixiong@kylinos.cn>
>>
>> [WHY]
>> On some boards, the dma_mask of Aspeed devices is 0xffff_ffff, this
>> quite possibly causes the SWIOTLB to be triggered when importing dmabuf.
>> However IO_TLB_SEGSIZE limits the maximum amount of available memory
>> for DMA Streaming Mapping, as dmesg following:
>>
>> [   24.885303][ T1947] ast 0000:07:00.0: swiotlb buffer is full (sz: 3145728 bytes), total 32768 (slots), used 0 (slots)
>>
>> [HOW] Provide an interface so that attachment is not mapped when
>> importing dma-buf.
> This is unecessary. The extra abstraction in DRM is only useful when you want to implement the obj->funcs->get_sg_table() callback.
>
> When a driver doesn't want to expose an sg_table for a buffer or want some other special handling it can simply do so by implementing the DMA-buf interface directly.
>
> See drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c for an example on how to do this.
>
> Regards,
> Christian.


Thanks for the reminder,

most drivers that use DRM_GEM_SHADOW_PLANE_HELPER_FUNCSand 
DRM_GEM_SHMEM_DRIVER_OPS

don't need to import the sg_table, such as the udl and the ast and so on 
at the moment.

They just need to call dma_buf_vmap() to get the kernel virtual address 
of the shared buffer.

So I wondered if there was a simple generic PRIME implementation for 
these drivers.

If you don't recommend this, Maybe try to implement it in 
DRM_GEM_SHMEM_DRIVER_OPS ?

Regards,

Shixiong Ou.

>> Signed-off-by: Shixiong Ou<oushixiong@kylinos.cn>
>> ---
>>   drivers/gpu/drm/ast/ast_drv.c          |  2 +-
>>   drivers/gpu/drm/drm_gem_shmem_helper.c | 17 +++++++
>>   drivers/gpu/drm/drm_prime.c            | 67 ++++++++++++++++++++++++--
>>   drivers/gpu/drm/udl/udl_drv.c          |  2 +-
>>   include/drm/drm_drv.h                  |  3 ++
>>   include/drm/drm_gem_shmem_helper.h     |  6 +++
>>   6 files changed, 91 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/ast/ast_drv.c b/drivers/gpu/drm/ast/ast_drv.c
>> index 6fbf62a99c48..2dac6acf79e7 100644
>> --- a/drivers/gpu/drm/ast/ast_drv.c
>> +++ b/drivers/gpu/drm/ast/ast_drv.c
>> @@ -64,7 +64,7 @@ static const struct drm_driver ast_driver = {
>>   	.minor = DRIVER_MINOR,
>>   	.patchlevel = DRIVER_PATCHLEVEL,
>>   
>> -	DRM_GEM_SHMEM_DRIVER_OPS,
>> +	DRM_GEM_SHMEM_SIMPLE_DRIVER_OPS,
>>   	DRM_FBDEV_SHMEM_DRIVER_OPS,
>>   };
>>   
>> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
>> index d99dee67353a..655d841df933 100644
>> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
>> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
>> @@ -799,6 +799,23 @@ drm_gem_shmem_prime_import_sg_table(struct drm_device *dev,
>>   }
>>   EXPORT_SYMBOL_GPL(drm_gem_shmem_prime_import_sg_table);
>>   
>> +struct drm_gem_object *
>> +drm_gem_shmem_prime_import_attachment(struct drm_device *dev,
>> +				      struct dma_buf_attachment *attach)
>> +{
>> +	size_t size = PAGE_ALIGN(attach->dmabuf->size);
>> +	struct drm_gem_shmem_object *shmem;
>> +
>> +	shmem = __drm_gem_shmem_create(dev, size, true, NULL);
>> +	if (IS_ERR(shmem))
>> +		return ERR_CAST(shmem);
>> +
>> +	drm_dbg_prime(dev, "size = %zu\n", size);
>> +
>> +	return &shmem->base;
>> +}
>> +EXPORT_SYMBOL_GPL(drm_gem_shmem_prime_import_attachment);
>> +
>>   MODULE_DESCRIPTION("DRM SHMEM memory-management helpers");
>>   MODULE_IMPORT_NS("DMA_BUF");
>>   MODULE_LICENSE("GPL v2");
>> diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
>> index 8e70abca33b9..522cf974e202 100644
>> --- a/drivers/gpu/drm/drm_prime.c
>> +++ b/drivers/gpu/drm/drm_prime.c
>> @@ -911,6 +911,62 @@ struct dma_buf *drm_gem_prime_export(struct drm_gem_object *obj,
>>   }
>>   EXPORT_SYMBOL(drm_gem_prime_export);
>>   
>> +/**
>> + * drm_gem_prime_import_dev_skip_map - core implementation of the import callback
>> + * @dev: drm_device to import into
>> + * @dma_buf: dma-buf object to import
>> + * @attach_dev: struct device to dma_buf attach
>> + *
>> + * This function exports a dma-buf without get it's scatter/gather table.
>> + *
>> + * Drivers who need to get an scatter/gather table for objects need to call
>> + * drm_gem_prime_import_dev() instead.
>> + */
>> +struct drm_gem_object *drm_gem_prime_import_dev_skip_map(struct drm_device *dev,
>> +							 struct dma_buf *dma_buf,
>> +							 struct device *attach_dev)
>> +{
>> +	struct dma_buf_attachment *attach;
>> +	struct drm_gem_object *obj;
>> +	int ret;
>> +
>> +	if (dma_buf->ops == &drm_gem_prime_dmabuf_ops) {
>> +		obj = dma_buf->priv;
>> +		if (obj->dev == dev) {
>> +			/*
>> +			 * Importing dmabuf exported from our own gem increases
>> +			 * refcount on gem itself instead of f_count of dmabuf.
>> +			 */
>> +			drm_gem_object_get(obj);
>> +			return obj;
>> +		}
>> +	}
>> +
>> +	attach = dma_buf_attach(dma_buf, attach_dev, true);
>> +	if (IS_ERR(attach))
>> +		return ERR_CAST(attach);
>> +
>> +	get_dma_buf(dma_buf);
>> +
>> +	obj = dev->driver->gem_prime_import_attachment(dev, attach);
>> +	if (IS_ERR(obj)) {
>> +		ret = PTR_ERR(obj);
>> +		goto fail_detach;
>> +	}
>> +
>> +	obj->import_attach = attach;
>> +	obj->resv = dma_buf->resv;
>> +
>> +	return obj;
>> +
>> +fail_detach:
>> +	dma_buf_detach(dma_buf, attach);
>> +	dma_buf_put(dma_buf);
>> +
>> +	return ERR_PTR(ret);
>> +}
>> +EXPORT_SYMBOL(drm_gem_prime_import_dev_skip_map);
>> +
>>   /**
>>    * drm_gem_prime_import_dev - core implementation of the import callback
>>    * @dev: drm_device to import into
>> @@ -946,9 +1002,6 @@ struct drm_gem_object *drm_gem_prime_import_dev(struct drm_device *dev,
>>   		}
>>   	}
>>   
>> -	if (!dev->driver->gem_prime_import_sg_table)
>> -		return ERR_PTR(-EINVAL);
>> -
>>   	attach = dma_buf_attach(dma_buf, attach_dev, false);
>>   	if (IS_ERR(attach))
>>   		return ERR_CAST(attach);
>> @@ -998,7 +1051,13 @@ EXPORT_SYMBOL(drm_gem_prime_import_dev);
>>   struct drm_gem_object *drm_gem_prime_import(struct drm_device *dev,
>>   					    struct dma_buf *dma_buf)
>>   {
>> -	return drm_gem_prime_import_dev(dev, dma_buf, dev->dev);
>> +	if (dev->driver->gem_prime_import_sg_table)
>> +		return drm_gem_prime_import_dev(dev, dma_buf, dev->dev);
>> +	else if (dev->driver->gem_prime_import_attachment)
>> +		return drm_gem_prime_import_dev_skip_map(dev, dma_buf, dev->dev);
>> +	else
>> +		return ERR_PTR(-EINVAL);
>> +
>>   }
>>   EXPORT_SYMBOL(drm_gem_prime_import);
>>   
>> diff --git a/drivers/gpu/drm/udl/udl_drv.c b/drivers/gpu/drm/udl/udl_drv.c
>> index 05b3a152cc33..c00d8b8834f2 100644
>> --- a/drivers/gpu/drm/udl/udl_drv.c
>> +++ b/drivers/gpu/drm/udl/udl_drv.c
>> @@ -72,7 +72,7 @@ static const struct drm_driver driver = {
>>   
>>   	/* GEM hooks */
>>   	.fops = &udl_driver_fops,
>> -	DRM_GEM_SHMEM_DRIVER_OPS,
>> +	DRM_GEM_SHMEM_SIMPLE_DRIVER_OPS,
>>   	.gem_prime_import = udl_driver_gem_prime_import,
>>   	DRM_FBDEV_SHMEM_DRIVER_OPS,
>>   
>> diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
>> index a43d707b5f36..aef8d9051fcd 100644
>> --- a/include/drm/drm_drv.h
>> +++ b/include/drm/drm_drv.h
>> @@ -326,6 +326,9 @@ struct drm_driver {
>>   				struct dma_buf_attachment *attach,
>>   				struct sg_table *sgt);
>>   
>> +	struct drm_gem_object *(*gem_prime_import_attachment)(
>> +				struct drm_device *dev,
>> +				struct dma_buf_attachment *attach);
>>   	/**
>>   	 * @dumb_create:
>>   	 *
>> diff --git a/include/drm/drm_gem_shmem_helper.h b/include/drm/drm_gem_shmem_helper.h
>> index cef5a6b5a4d6..39a93c222aaa 100644
>> --- a/include/drm/drm_gem_shmem_helper.h
>> +++ b/include/drm/drm_gem_shmem_helper.h
>> @@ -274,6 +274,9 @@ struct drm_gem_object *
>>   drm_gem_shmem_prime_import_sg_table(struct drm_device *dev,
>>   				    struct dma_buf_attachment *attach,
>>   				    struct sg_table *sgt);
>> +struct drm_gem_object *
>> +drm_gem_shmem_prime_import_attachment(struct drm_device *dev,
>> +				      struct dma_buf_attachment *attach);
>>   int drm_gem_shmem_dumb_create(struct drm_file *file, struct drm_device *dev,
>>   			      struct drm_mode_create_dumb *args);
>>   
>> @@ -287,4 +290,7 @@ int drm_gem_shmem_dumb_create(struct drm_file *file, struct drm_device *dev,
>>   	.gem_prime_import_sg_table = drm_gem_shmem_prime_import_sg_table, \
>>   	.dumb_create		   = drm_gem_shmem_dumb_create
>>   
>> +#define DRM_GEM_SHMEM_SIMPLE_DRIVER_OPS \
>> +	.gem_prime_import_attachment = drm_gem_shmem_prime_import_attachment, \
>> +	.dumb_create                 = drm_gem_shmem_dumb_create
>>   #endif /* __DRM_GEM_SHMEM_HELPER_H__ */
--------------FOlgcjN1YJPW0a1Z3gAum2gl
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">在 2025/4/30 19:03, Christian König 写道:<br>
    </div>
    <blockquote type="cite"
      cite="mid:daaf1445-f0b8-490a-b87b-dab219f13571@amd.com">
      <pre wrap="" class="moz-quote-pre">On 4/30/25 10:56, <a class="moz-txt-link-abbreviated" href="mailto:oushixiong1025@163.com">oushixiong1025@163.com</a> wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">From: Shixiong Ou <a class="moz-txt-link-rfc2396E" href="mailto:oushixiong@kylinos.cn">&lt;oushixiong@kylinos.cn&gt;</a>

[WHY]
On some boards, the dma_mask of Aspeed devices is 0xffff_ffff, this
quite possibly causes the SWIOTLB to be triggered when importing dmabuf.
However IO_TLB_SEGSIZE limits the maximum amount of available memory
for DMA Streaming Mapping, as dmesg following:

[   24.885303][ T1947] ast 0000:07:00.0: swiotlb buffer is full (sz: 3145728 bytes), total 32768 (slots), used 0 (slots)

[HOW] Provide an interface so that attachment is not mapped when
importing dma-buf.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
This is unecessary. The extra abstraction in DRM is only useful when you want to implement the obj-&gt;funcs-&gt;get_sg_table() callback.

When a driver doesn't want to expose an sg_table for a buffer or want some other special handling it can simply do so by implementing the DMA-buf interface directly.

See drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c for an example on how to do this.

Regards,
Christian.
</pre>
    </blockquote>
    <p><br>
    </p>
    <p><span
style="color: rgb(17, 17, 17); font-family: Arial, Helvetica, sans-serif; font-size: 18px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; background-color: rgb(247, 247, 247); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">Thanks for the reminder, </span></p>
    <p><span
style="color: rgb(17, 17, 17); font-family: Arial, Helvetica, sans-serif; font-size: 18px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; background-color: rgb(247, 247, 247); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">most drivers that use </span><span
style="color: rgb(17, 17, 17); font-family: Arial, Helvetica, sans-serif; font-size: 18px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; background-color: rgb(247, 247, 247); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">DRM_GEM_SHADOW_PLANE_HELPER_FUNCS</span><span
style="color: rgb(17, 17, 17); font-family: Arial, Helvetica, sans-serif; font-size: 18px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; background-color: rgb(247, 247, 247); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;"> and  DRM_GEM_SHMEM_DRIVER_OPS</span></p>
    <p><span
style="color: rgb(17, 17, 17); font-family: Arial, Helvetica, sans-serif; font-size: 18px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; background-color: rgb(247, 247, 247); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">don't need to import the sg_table, such as the udl and the ast and so on at the moment. </span></p>
    <p><span
style="color: rgb(17, 17, 17); font-family: Arial, Helvetica, sans-serif; font-size: 18px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; background-color: rgb(247, 247, 247); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">They just need to call dma_buf_vmap() to get the kernel virtual address of the shared buffer.</span></p>
    <p><span
style="color: rgb(17, 17, 17); font-family: Arial, Helvetica, sans-serif; font-size: 18px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; background-color: rgb(247, 247, 247); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">So I wondered if there was a simple generic PRIME implementation for these drivers.</span></p>
    <p><span
style="color: rgb(17, 17, 17); font-family: Arial, Helvetica, sans-serif; font-size: 18px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; background-color: rgb(247, 247, 247); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">If you don't recommend this, </span><span
style="color: rgb(17, 17, 17); font-family: Arial, Helvetica, sans-serif; font-size: 18px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; background-color: rgb(247, 247, 247); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">Maybe try to implement it in </span><span
style="color: rgb(17, 17, 17); font-family: Arial, Helvetica, sans-serif; font-size: 18px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; background-color: rgb(247, 247, 247); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">DRM_GEM_SHMEM_DRIVER_OPS ?</span></p>
    <p><span
style="color: rgb(17, 17, 17); font-family: Arial, Helvetica, sans-serif; font-size: 18px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; background-color: rgb(247, 247, 247); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">
</span></p>
    <p>Regards,</p>
    <p>Shixiong Ou.<br>
    </p>
    <blockquote type="cite"
      cite="mid:daaf1445-f0b8-490a-b87b-dab219f13571@amd.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
Signed-off-by: Shixiong Ou <a class="moz-txt-link-rfc2396E" href="mailto:oushixiong@kylinos.cn">&lt;oushixiong@kylinos.cn&gt;</a>
---
 drivers/gpu/drm/ast/ast_drv.c          |  2 +-
 drivers/gpu/drm/drm_gem_shmem_helper.c | 17 +++++++
 drivers/gpu/drm/drm_prime.c            | 67 ++++++++++++++++++++++++--
 drivers/gpu/drm/udl/udl_drv.c          |  2 +-
 include/drm/drm_drv.h                  |  3 ++
 include/drm/drm_gem_shmem_helper.h     |  6 +++
 6 files changed, 91 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_drv.c b/drivers/gpu/drm/ast/ast_drv.c
index 6fbf62a99c48..2dac6acf79e7 100644
--- a/drivers/gpu/drm/ast/ast_drv.c
+++ b/drivers/gpu/drm/ast/ast_drv.c
@@ -64,7 +64,7 @@ static const struct drm_driver ast_driver = {
 	.minor = DRIVER_MINOR,
 	.patchlevel = DRIVER_PATCHLEVEL,
 
-	DRM_GEM_SHMEM_DRIVER_OPS,
+	DRM_GEM_SHMEM_SIMPLE_DRIVER_OPS,
 	DRM_FBDEV_SHMEM_DRIVER_OPS,
 };
 
diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index d99dee67353a..655d841df933 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -799,6 +799,23 @@ drm_gem_shmem_prime_import_sg_table(struct drm_device *dev,
 }
 EXPORT_SYMBOL_GPL(drm_gem_shmem_prime_import_sg_table);
 
+struct drm_gem_object *
+drm_gem_shmem_prime_import_attachment(struct drm_device *dev,
+				      struct dma_buf_attachment *attach)
+{
+	size_t size = PAGE_ALIGN(attach-&gt;dmabuf-&gt;size);
+	struct drm_gem_shmem_object *shmem;
+
+	shmem = __drm_gem_shmem_create(dev, size, true, NULL);
+	if (IS_ERR(shmem))
+		return ERR_CAST(shmem);
+
+	drm_dbg_prime(dev, "size = %zu\n", size);
+
+	return &amp;shmem-&gt;base;
+}
+EXPORT_SYMBOL_GPL(drm_gem_shmem_prime_import_attachment);
+
 MODULE_DESCRIPTION("DRM SHMEM memory-management helpers");
 MODULE_IMPORT_NS("DMA_BUF");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
index 8e70abca33b9..522cf974e202 100644
--- a/drivers/gpu/drm/drm_prime.c
+++ b/drivers/gpu/drm/drm_prime.c
@@ -911,6 +911,62 @@ struct dma_buf *drm_gem_prime_export(struct drm_gem_object *obj,
 }
 EXPORT_SYMBOL(drm_gem_prime_export);
 
+/**
+ * drm_gem_prime_import_dev_skip_map - core implementation of the import callback
+ * @dev: drm_device to import into
+ * @dma_buf: dma-buf object to import
+ * @attach_dev: struct device to dma_buf attach
+ *
+ * This function exports a dma-buf without get it's scatter/gather table.
+ *
+ * Drivers who need to get an scatter/gather table for objects need to call
+ * drm_gem_prime_import_dev() instead.
+ */
+struct drm_gem_object *drm_gem_prime_import_dev_skip_map(struct drm_device *dev,
+							 struct dma_buf *dma_buf,
+							 struct device *attach_dev)
+{
+	struct dma_buf_attachment *attach;
+	struct drm_gem_object *obj;
+	int ret;
+
+	if (dma_buf-&gt;ops == &amp;drm_gem_prime_dmabuf_ops) {
+		obj = dma_buf-&gt;priv;
+		if (obj-&gt;dev == dev) {
+			/*
+			 * Importing dmabuf exported from our own gem increases
+			 * refcount on gem itself instead of f_count of dmabuf.
+			 */
+			drm_gem_object_get(obj);
+			return obj;
+		}
+	}
+
+	attach = dma_buf_attach(dma_buf, attach_dev, true);
+	if (IS_ERR(attach))
+		return ERR_CAST(attach);
+
+	get_dma_buf(dma_buf);
+
+	obj = dev-&gt;driver-&gt;gem_prime_import_attachment(dev, attach);
+	if (IS_ERR(obj)) {
+		ret = PTR_ERR(obj);
+		goto fail_detach;
+	}
+
+	obj-&gt;import_attach = attach;
+	obj-&gt;resv = dma_buf-&gt;resv;
+
+	return obj;
+
+fail_detach:
+	dma_buf_detach(dma_buf, attach);
+	dma_buf_put(dma_buf);
+
+	return ERR_PTR(ret);
+}
+EXPORT_SYMBOL(drm_gem_prime_import_dev_skip_map);
+
 /**
  * drm_gem_prime_import_dev - core implementation of the import callback
  * @dev: drm_device to import into
@@ -946,9 +1002,6 @@ struct drm_gem_object *drm_gem_prime_import_dev(struct drm_device *dev,
 		}
 	}
 
-	if (!dev-&gt;driver-&gt;gem_prime_import_sg_table)
-		return ERR_PTR(-EINVAL);
-
 	attach = dma_buf_attach(dma_buf, attach_dev, false);
 	if (IS_ERR(attach))
 		return ERR_CAST(attach);
@@ -998,7 +1051,13 @@ EXPORT_SYMBOL(drm_gem_prime_import_dev);
 struct drm_gem_object *drm_gem_prime_import(struct drm_device *dev,
 					    struct dma_buf *dma_buf)
 {
-	return drm_gem_prime_import_dev(dev, dma_buf, dev-&gt;dev);
+	if (dev-&gt;driver-&gt;gem_prime_import_sg_table)
+		return drm_gem_prime_import_dev(dev, dma_buf, dev-&gt;dev);
+	else if (dev-&gt;driver-&gt;gem_prime_import_attachment)
+		return drm_gem_prime_import_dev_skip_map(dev, dma_buf, dev-&gt;dev);
+	else
+		return ERR_PTR(-EINVAL);
+
 }
 EXPORT_SYMBOL(drm_gem_prime_import);
 
diff --git a/drivers/gpu/drm/udl/udl_drv.c b/drivers/gpu/drm/udl/udl_drv.c
index 05b3a152cc33..c00d8b8834f2 100644
--- a/drivers/gpu/drm/udl/udl_drv.c
+++ b/drivers/gpu/drm/udl/udl_drv.c
@@ -72,7 +72,7 @@ static const struct drm_driver driver = {
 
 	/* GEM hooks */
 	.fops = &amp;udl_driver_fops,
-	DRM_GEM_SHMEM_DRIVER_OPS,
+	DRM_GEM_SHMEM_SIMPLE_DRIVER_OPS,
 	.gem_prime_import = udl_driver_gem_prime_import,
 	DRM_FBDEV_SHMEM_DRIVER_OPS,
 
diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
index a43d707b5f36..aef8d9051fcd 100644
--- a/include/drm/drm_drv.h
+++ b/include/drm/drm_drv.h
@@ -326,6 +326,9 @@ struct drm_driver {
 				struct dma_buf_attachment *attach,
 				struct sg_table *sgt);
 
+	struct drm_gem_object *(*gem_prime_import_attachment)(
+				struct drm_device *dev,
+				struct dma_buf_attachment *attach);
 	/**
 	 * @dumb_create:
 	 *
diff --git a/include/drm/drm_gem_shmem_helper.h b/include/drm/drm_gem_shmem_helper.h
index cef5a6b5a4d6..39a93c222aaa 100644
--- a/include/drm/drm_gem_shmem_helper.h
+++ b/include/drm/drm_gem_shmem_helper.h
@@ -274,6 +274,9 @@ struct drm_gem_object *
 drm_gem_shmem_prime_import_sg_table(struct drm_device *dev,
 				    struct dma_buf_attachment *attach,
 				    struct sg_table *sgt);
+struct drm_gem_object *
+drm_gem_shmem_prime_import_attachment(struct drm_device *dev,
+				      struct dma_buf_attachment *attach);
 int drm_gem_shmem_dumb_create(struct drm_file *file, struct drm_device *dev,
 			      struct drm_mode_create_dumb *args);
 
@@ -287,4 +290,7 @@ int drm_gem_shmem_dumb_create(struct drm_file *file, struct drm_device *dev,
 	.gem_prime_import_sg_table = drm_gem_shmem_prime_import_sg_table, \
 	.dumb_create		   = drm_gem_shmem_dumb_create
 
+#define DRM_GEM_SHMEM_SIMPLE_DRIVER_OPS \
+	.gem_prime_import_attachment = drm_gem_shmem_prime_import_attachment, \
+	.dumb_create                 = drm_gem_shmem_dumb_create
 #endif /* __DRM_GEM_SHMEM_HELPER_H__ */
</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------FOlgcjN1YJPW0a1Z3gAum2gl--

