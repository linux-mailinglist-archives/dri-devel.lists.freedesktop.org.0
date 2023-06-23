Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ECE673B785
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jun 2023 14:38:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7485110E0A8;
	Fri, 23 Jun 2023 12:37:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id 17B0F10E0A8;
 Fri, 23 Jun 2023 12:37:56 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8CxZPAhkpVkgcgAAA--.1264S3;
 Fri, 23 Jun 2023 20:37:53 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8DxzM4ekpVk14QDAA--.19014S3; 
 Fri, 23 Jun 2023 20:37:51 +0800 (CST)
Message-ID: <ed013d5f-0646-eac8-e877-b7108cb26b32@loongson.cn>
Date: Fri, 23 Jun 2023 20:37:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v10 07/11] drm/etnaviv: Add support for the dma coherent
 device
Content-Language: en-US
To: Robin Murphy <robin.murphy@arm.com>, Sui Jingfeng <18949883232@163.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20230620094716.2231414-1-18949883232@163.com>
 <20230620094716.2231414-8-18949883232@163.com>
 <8980417e-6b1a-60c3-1ebb-8a2830ba5193@arm.com>
From: Sui Jingfeng <suijingfeng@loongson.cn>
Organization: Loongson
In-Reply-To: <8980417e-6b1a-60c3-1ebb-8a2830ba5193@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8DxzM4ekpVk14QDAA--.19014S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj9fXoWfJF47Zr4fWF4fJw1ruryDArc_yoW8JF1xWo
 W7Kr1fX3WrJFWUKw4DAr17XFy3Xr4DCr9Ig3W5Kwnrta4kXF1UJ34UJ3y7tay2qr18ur4U
 Zw1UJ345ZFy7AF1rl-sFpf9Il3svdjkaLaAFLSUrUUUU0b8apTn2vfkv8UJUUUU8wcxFpf
 9Il3svdxBIdaVrn0xqx4xG64xvF2IEw4CE5I8CrVC2j2Jv73VFW2AGmfu7bjvjm3AaLaJ3
 UjIYCTnIWjp_UUUO87kC6x804xWl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI
 8IcIk0rVWrJVCq3wAFIxvE14AKwVWUXVWUAwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xG
 Y2AK021l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14
 v26r1j6r4UM28EF7xvwVC2z280aVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVCY1x0267AK
 xVW8JVW8Jr1ln4kS14v26r126r1DM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12
 xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r12
 6r1DMcIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr4
 1lc7I2V7IY0VAS07AlzVAYIcxG8wCY1x0262kKe7AKxVWUAVWUtwCF04k20xvY0x0EwIxG
 rwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AKxVWUAVWUtwC20s026c02F40E14
 v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkG
 c2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI
 0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4U
 MIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jFApnUUU
 UU=
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
Cc: Bjorn Helgaas <bhelgaas@google.com>,
 "iommu@lists.linux.dev" <iommu@lists.linux.dev>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, etnaviv@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 2023/6/23 19:52, Robin Murphy wrote:
> On 2023-06-20 10:47, Sui Jingfeng wrote:
>> From: Sui Jingfeng <suijingfeng@loongson.cn>
>>
>> Loongson CPUs maintain cache coherency by hardware, which means that the
>> data in the CPU cache is identical to the data in main system memory. As
>> for the peripheral device, most of Loongson chips chose to define the
>> peripherals as DMA coherent by default, device drivers do not need to
>> maintain the coherency between a processor and an I/O device manually.
>>
>> There are exceptions, for LS2K1000 SoC, part of peripheral device can be
>> configured as DMA non-coherent. But there is no released version of such
>> firmware exist in the market. Peripherals of older LS2K1000 is also DMA
>> non-coherent, but they are nearly outdated. So, those are trivial cases.
>>
>> Nevertheless, kernel space still need to do the probe work, because 
>> vivante
>> GPU IP has been integrated into various platform. Hence, this patch add
>> runtime detection code to probe if a specific GPU is DMA coherent, If 
>> the
>> answer is yes, we are going to utilize such features. On Loongson 
>> platform,
>> When a buffer is accessed by both the GPU and the CPU, the driver should
>> prefer ETNA_BO_CACHED over ETNA_BO_WC.
>>
>> This patch also add a new parameter: etnaviv_param_gpu_coherent, which
>> allow userspace to know if such a feature is available. Because
>> write-combined BO is still preferred in some case, especially where 
>> don't
>> need CPU read, for example, uploading compiled shader bin.
>>
>> Cc: Lucas Stach <l.stach@pengutronix.de>
>> Cc: Christian Gmeiner <christian.gmeiner@gmail.com>
>> Cc: Philipp Zabel <p.zabel@pengutronix.de>
>> Cc: Bjorn Helgaas <bhelgaas@google.com>
>> Cc: Daniel Vetter <daniel@ffwll.ch>
>> Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
>> ---
>>   drivers/gpu/drm/etnaviv/etnaviv_drv.c       | 35 +++++++++++++++++++++
>>   drivers/gpu/drm/etnaviv/etnaviv_drv.h       |  6 ++++
>>   drivers/gpu/drm/etnaviv/etnaviv_gem.c       | 22 ++++++++++---
>>   drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c |  7 ++++-
>>   drivers/gpu/drm/etnaviv/etnaviv_gpu.c       |  4 +++
>>   include/uapi/drm/etnaviv_drm.h              |  1 +
>>   6 files changed, 70 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c 
>> b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
>> index 0a365e96d371..d8e788aa16cb 100644
>> --- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
>> +++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
>> @@ -5,7 +5,9 @@
>>     #include <linux/component.h>
>>   #include <linux/dma-mapping.h>
>> +#include <linux/dma-map-ops.h>
>
> /*
>  * This header is for implementations of dma_map_ops and related code.
>  * It should not be included in drivers just using the DMA API.
>  */
>
1)

The driver can not pass the compile, without include the 
linux/dma-map-ops.h


You may be right, but Lucas suggest using dev_is_dma_coherent() function.

because the dev_is_dma_coherent() function is defined in dma-map-ops.h.


for our platform its:


```

static inline bool dev_is_dma_coherent(struct device *dev)
{
     return true;
}

```

2. drm/exynos and drm/msm also include this handler


```

$ cd drivers/gpu/drm

$ find . -name "*.c" -type f | xargs grep "dma-map-ops.h"

./exynos/exynos_drm_dma.c:#include <linux/dma-map-ops.h>
./msm/msm_gem.c:#include <linux/dma-map-ops.h>

```


>>   #include <linux/module.h>
>> +#include <linux/of_address.h>
>>   #include <linux/of_platform.h>
>>   #include <linux/uaccess.h>
>>   @@ -24,6 +26,34 @@
>>   #include "etnaviv_pci_drv.h"
>>   #include "etnaviv_perfmon.h"
>>   +static struct device_node *etnaviv_of_first_available_node(void)
>> +{
>> +    struct device_node *core_node;
>> +
>> +    for_each_compatible_node(core_node, NULL, "vivante,gc") {
>> +        if (of_device_is_available(core_node))
>> +            return core_node;
>> +    }
>> +
>> +    return NULL;
>> +}
>> +
>> +static bool etnaviv_is_dma_coherent(struct device *dev)
>> +{
>> +    struct device_node *np;
>> +    bool coherent;
>> +
>> +    np = etnaviv_of_first_available_node();
>> +    if (np) {
>> +        coherent = of_dma_is_coherent(np);
>> +        of_node_put(np);
>> +    } else {
>> +        coherent = dev_is_dma_coherent(dev);
>> +    }
>
> Please use device_get_dma_attr() like other well-behaved drivers.
>
OK, I agree with you.


```

priv->dma_coherent = device_get_dma_attr(&pdev->dev) == DEV_DMA_COHERENT;

```

Lucas,  Is above code Snippet looks fine to you?


>> +
>> +    return coherent;
>> +}
>> +
>>   /*
>>    * etnaviv private data construction and destructions:
>>    */
>> @@ -52,6 +82,11 @@ etnaviv_alloc_private(struct device *dev, struct 
>> drm_device *drm)
>>           return ERR_PTR(-ENOMEM);
>>       }
>>   +    priv->dma_coherent = etnaviv_is_dma_coherent(dev);
>> +
>> +    if (priv->dma_coherent)
>> +        drm_info(drm, "%s is dma coherent\n", dev_name(dev));
>
> I'm pretty sure the end-user doesn't care.
>
OK, i will delete it at the next version.

>> +
>>       return priv;
>>   }
>>   diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.h 
>> b/drivers/gpu/drm/etnaviv/etnaviv_drv.h
>> index 9cd72948cfad..644e5712c050 100644
>> --- a/drivers/gpu/drm/etnaviv/etnaviv_drv.h
>> +++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.h
>> @@ -46,6 +46,12 @@ struct etnaviv_drm_private {
>>       struct xarray active_contexts;
>>       u32 next_context_id;
>>   +    /*
>> +     * If true, the GPU is capable of snooping cpu cache. Here, it
>> +     * also means that cache coherency is enforced by the hardware.
>> +     */
>> +    bool dma_coherent;
>> +
>>       /* list of GEM objects: */
>>       struct mutex gem_lock;
>>       struct list_head gem_list;
>> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.c 
>> b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
>> index b5f73502e3dd..39bdc3774f2d 100644
>> --- a/drivers/gpu/drm/etnaviv/etnaviv_gem.c
>> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
>> @@ -343,6 +343,7 @@ void *etnaviv_gem_vmap(struct drm_gem_object *obj)
>>   static void *etnaviv_gem_vmap_impl(struct etnaviv_gem_object *obj)
>>   {
>>       struct page **pages;
>> +    pgprot_t prot;
>>         lockdep_assert_held(&obj->lock);
>>   @@ -350,8 +351,19 @@ static void *etnaviv_gem_vmap_impl(struct 
>> etnaviv_gem_object *obj)
>>       if (IS_ERR(pages))
>>           return NULL;
>>   -    return vmap(pages, obj->base.size >> PAGE_SHIFT,
>> -            VM_MAP, pgprot_writecombine(PAGE_KERNEL));
>> +    switch (obj->flags) {
>> +    case ETNA_BO_CACHED:
>> +        prot = PAGE_KERNEL;
>> +        break;
>> +    case ETNA_BO_UNCACHED:
>> +        prot = pgprot_noncached(PAGE_KERNEL);
>> +        break;
>> +    case ETNA_BO_WC:
>> +    default:
>> +        prot = pgprot_writecombine(PAGE_KERNEL);
>> +    }
>> +
>> +    return vmap(pages, obj->base.size >> PAGE_SHIFT, VM_MAP, prot);
>>   }
>>     static inline enum dma_data_direction etnaviv_op_to_dma_dir(u32 op)
>> @@ -369,6 +381,7 @@ int etnaviv_gem_cpu_prep(struct drm_gem_object 
>> *obj, u32 op,
>>   {
>>       struct etnaviv_gem_object *etnaviv_obj = to_etnaviv_bo(obj);
>>       struct drm_device *dev = obj->dev;
>> +    struct etnaviv_drm_private *priv = dev->dev_private;
>>       bool write = !!(op & ETNA_PREP_WRITE);
>>       int ret;
>>   @@ -395,7 +408,7 @@ int etnaviv_gem_cpu_prep(struct drm_gem_object 
>> *obj, u32 op,
>>               return ret == 0 ? -ETIMEDOUT : ret;
>>       }
>>   -    if (etnaviv_obj->flags & ETNA_BO_CACHED) {
>> +    if (!priv->dma_coherent && etnaviv_obj->flags & ETNA_BO_CACHED) {
>
> TBH the existing condition already looks a bit sketchy - even if 
> userspace has a non-cacheable mapping, a DMA sync may need to do 
> things other than cache maintenance - but this change certainly isn't 
> making things any better. If you can demonstrate a *measurable* and 
> significant overhead from calling dma_sync_sgtable_*() on your 
> platform when the device is coherent and nothing is bounce-buffered, 
> then the first thing we can do is look at making that quicker (for 
> everyone). Otherwise, this seems like the famous bad kind of premature 
> optimisation.
>
OK, I agree with you, both you and Lucas told to remove this.

I will remove this at next version.


It doesn't hurt much to the performance. On our platform, the 
performance is GPU bound.


> Thanks,
> Robin.
>
>> dma_sync_sgtable_for_cpu(dev->dev, etnaviv_obj->sgt,
>>                        etnaviv_op_to_dma_dir(op));
>>           etnaviv_obj->last_cpu_prep_op = op;
>> @@ -408,8 +421,9 @@ int etnaviv_gem_cpu_fini(struct drm_gem_object *obj)
>>   {
>>       struct drm_device *dev = obj->dev;
>>       struct etnaviv_gem_object *etnaviv_obj = to_etnaviv_bo(obj);
>> +    struct etnaviv_drm_private *priv = dev->dev_private;
>>   -    if (etnaviv_obj->flags & ETNA_BO_CACHED) {
>> +    if (!priv->dma_coherent && etnaviv_obj->flags & ETNA_BO_CACHED) {
>>           /* fini without a prep is almost certainly a userspace 
>> error */
>>           WARN_ON(etnaviv_obj->last_cpu_prep_op == 0);
>>           dma_sync_sgtable_for_device(dev->dev, etnaviv_obj->sgt,
>> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c 
>> b/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
>> index 3524b5811682..754126992264 100644
>> --- a/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
>> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
>> @@ -112,11 +112,16 @@ static const struct etnaviv_gem_ops 
>> etnaviv_gem_prime_ops = {
>>   struct drm_gem_object *etnaviv_gem_prime_import_sg_table(struct 
>> drm_device *dev,
>>       struct dma_buf_attachment *attach, struct sg_table *sgt)
>>   {
>> +    struct etnaviv_drm_private *priv = dev->dev_private;
>>       struct etnaviv_gem_object *etnaviv_obj;
>>       size_t size = PAGE_ALIGN(attach->dmabuf->size);
>> +    u32 cache_flags = ETNA_BO_WC;
>>       int ret, npages;
>>   -    ret = etnaviv_gem_new_private(dev, size, ETNA_BO_WC,
>> +    if (priv->dma_coherent)
>> +        cache_flags = ETNA_BO_CACHED;
>> +
>> +    ret = etnaviv_gem_new_private(dev, size, cache_flags,
>>                         &etnaviv_gem_prime_ops, &etnaviv_obj);
>>       if (ret < 0)
>>           return ERR_PTR(ret);
>> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c 
>> b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
>> index d6a21e97feb1..d99ac675ce8b 100644
>> --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
>> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
>> @@ -164,6 +164,10 @@ int etnaviv_gpu_get_param(struct etnaviv_gpu 
>> *gpu, u32 param, u64 *value)
>>           *value = gpu->identity.eco_id;
>>           break;
>>   +    case ETNAVIV_PARAM_GPU_COHERENT:
>> +        *value = priv->dma_coherent;
>> +        break;
>> +
>>       default:
>>           DBG("%s: invalid param: %u", dev_name(gpu->dev), param);
>>           return -EINVAL;
>> diff --git a/include/uapi/drm/etnaviv_drm.h 
>> b/include/uapi/drm/etnaviv_drm.h
>> index af024d90453d..76baf45d7158 100644
>> --- a/include/uapi/drm/etnaviv_drm.h
>> +++ b/include/uapi/drm/etnaviv_drm.h
>> @@ -77,6 +77,7 @@ struct drm_etnaviv_timespec {
>>   #define ETNAVIV_PARAM_GPU_PRODUCT_ID                0x1c
>>   #define ETNAVIV_PARAM_GPU_CUSTOMER_ID               0x1d
>>   #define ETNAVIV_PARAM_GPU_ECO_ID                    0x1e
>> +#define ETNAVIV_PARAM_GPU_COHERENT                  0x1f
>>     #define ETNA_MAX_PIPES 4

-- 
Jingfeng

