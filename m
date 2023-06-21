Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C54738459
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 15:04:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BF8C10E46A;
	Wed, 21 Jun 2023 13:04:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3F71910E46A;
 Wed, 21 Jun 2023 13:04:47 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8BxXcdu9ZJkOSMAAA--.276S3;
 Wed, 21 Jun 2023 21:04:46 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8BxrM5s9ZJkrKsAAA--.3938S3; 
 Wed, 21 Jun 2023 21:04:44 +0800 (CST)
Message-ID: <c7b2265c-1fe2-cb6e-ca97-750225aa6a64@loongson.cn>
Date: Wed, 21 Jun 2023 21:04:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v10 05/11] drm/etnaviv: Allow bypass component framework
Content-Language: en-US
To: Lucas Stach <l.stach@pengutronix.de>, Sui Jingfeng <18949883232@163.com>, 
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20230620094716.2231414-1-18949883232@163.com>
 <20230620094716.2231414-6-18949883232@163.com>
 <2c48ad0d1277f880d4d758fe3a3ad24d33e2fabe.camel@pengutronix.de>
From: Sui Jingfeng <suijingfeng@loongson.cn>
Organization: Loongson
In-Reply-To: <2c48ad0d1277f880d4d758fe3a3ad24d33e2fabe.camel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8BxrM5s9ZJkrKsAAA--.3938S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoW3KFWkJw45ZrWrAr4fJw1rKrX_yoWkWry3pF
 Z7JFWYkr48uFyqg342qrs5ZF9Ikw1Sq34Sk34kK3s3Kws0yr95tFyUtFyj93sxAr95WF43
 tr1UtrsruF4Fy3gCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUUvSb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
 xVWxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
 Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE
 14v26F4j6r4UJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07
 AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02
 F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GF
 ylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7Cj
 xVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26F
 4j6r4UJwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7I
 U1pVbDUUUUU==
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
Cc: Bjorn Helgaas <bhelgaas@google.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, etnaviv@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 2023/6/21 17:29, Lucas Stach wrote:
> Am Dienstag, dem 20.06.2023 um 17:47 +0800 schrieb Sui Jingfeng:
>> From: Sui Jingfeng <suijingfeng@loongson.cn>
>>
>> Originally, component frameworks were used to bind multiple GPU cores to a
>> virtual master. But there are chips that have only one GPU core integrated.
>> The component framework can be avoided under some circumstances, Another
>> reason is that usperspace programs such as X server and Mesa will try to
>> find the PCI device to use by default. Creating a virtual master device
>> for PCI GPUs cause unnecessary troubles.
>>
>> This patch add additional code paths to allow bypassing the component
>> frameworks, platforms with a single GPU core could probably try the
>> non-component code path also. This patch is for code shaing between the
>> PCI driver and the platform driver.
>>
>> Cc: Lucas Stach <l.stach@pengutronix.de>
>> Cc: Christian Gmeiner <christian.gmeiner@gmail.com>
>> Cc: Philipp Zabel <p.zabel@pengutronix.de>
>> Cc: Bjorn Helgaas <bhelgaas@google.com>
>> Cc: Daniel Vetter <daniel@ffwll.ch>
>> Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
>> ---
>>   drivers/gpu/drm/etnaviv/etnaviv_drv.c | 47 ++++++++++-----
>>   drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 83 +++++++++++++++++----------
>>   drivers/gpu/drm/etnaviv/etnaviv_gpu.h |  3 +
>>   3 files changed, 91 insertions(+), 42 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
>> index 6a048be02857..93ca240cd4c0 100644
>> --- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
>> +++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
>> @@ -536,10 +536,9 @@ static const struct drm_driver etnaviv_drm_driver = {
>>   	.minor              = 3,
>>   };
>>   
>> -/*
>> - * Platform driver:
>> - */
>> -static int etnaviv_bind(struct device *dev)
>> +static struct etnaviv_drm_private *etna_private_ptr;
> That's not going to fly. You are dropping the virtual master device,
> which bundles multiple GPUs together, but you are also only allowing a
> single GPU instance via this global private data pointer.
>
> I'm okay with dropping the virtual master and instantiating a DRM
> device for each PCI device, but then the driver at least needs to be
> able to handle multiple instances.

Nice catch!


By multiple instances, do you means that multiple vivante GPU core ?


Currently we don't know how to handle multiple PCI GPU instances,

The main reason is that we don't have such a hardware.

I still think,

the PCI device itself still should be the master, other GPU cores can be 
initialized manually.

or bind to this PCI device master with priori knowledge./
/

> Also what exactly is the problem with the virtual master device?

mesa's piple loader will find the PCI device to use by default.

the virtual master device is a platform device.

PCI device go first.

> Couldn't we just instantiate one of those for each PCI device to
> minimize the changes needed to the bind/unbind logic?
If we have such a hardware,

I don't expect each of them could populate to be a stand alone PCI 
device instance.

Often, the mmio registers of the multiple instantiate are offset-ed 
within the same PCI BAR.

Multiple PCI device usually means multiple device driver.


To be honest, this is already the minimal change we can do,

which don't introduce duplication like the patch we made one years ago.


>
> Regards,
> Lucas
>
>> +
>> +static int etnaviv_drm_bind(struct device *dev, bool component)
>>   {
>>   	struct etnaviv_drm_private *priv;
>>   	struct drm_device *drm;
>> @@ -556,12 +555,15 @@ static int etnaviv_bind(struct device *dev)
>>   	}
>>   
>>   	drm->dev_private = priv;
>> +	etna_private_ptr = priv;
>>   
>>   	dma_set_max_seg_size(dev, SZ_2G);
>>   
>> -	dev_set_drvdata(dev, drm);
>> +	if (component)
>> +		ret = component_bind_all(dev, drm);
>> +	else
>> +		ret = etnaviv_gpu_bind(dev, NULL, drm);
>>   
>> -	ret = component_bind_all(dev, drm);
>>   	if (ret < 0)
>>   		goto out_free_priv;
>>   
>> @@ -574,7 +576,10 @@ static int etnaviv_bind(struct device *dev)
>>   	return 0;
>>   
>>   out_unbind:
>> -	component_unbind_all(dev, drm);
>> +	if (component)
>> +		component_unbind_all(dev, drm);
>> +	else
>> +		etnaviv_gpu_unbind(dev, NULL, drm);
>>   out_free_priv:
>>   	etnaviv_free_private(priv);
>>   out_put:
>> @@ -583,14 +588,17 @@ static int etnaviv_bind(struct device *dev)
>>   	return ret;
>>   }
>>   
>> -static void etnaviv_unbind(struct device *dev)
>> +static void etnaviv_drm_unbind(struct device *dev, bool component)
>>   {
>> -	struct drm_device *drm = dev_get_drvdata(dev);
>> -	struct etnaviv_drm_private *priv = drm->dev_private;
>> +	struct etnaviv_drm_private *priv = etna_private_ptr;
>> +	struct drm_device *drm = priv->drm;
>>   
>>   	drm_dev_unregister(drm);
>>   
>> -	component_unbind_all(dev, drm);
>> +	if (component)
>> +		component_unbind_all(dev, drm);
>> +	else
>> +		etnaviv_gpu_unbind(dev, NULL, drm);
>>   
>>   	etnaviv_free_private(priv);
>>   
>> @@ -599,9 +607,22 @@ static void etnaviv_unbind(struct device *dev)
>>   	drm_dev_put(drm);
>>   }
>>   
>> +/*
>> + * Platform driver:
>> + */
>> +static int etnaviv_master_bind(struct device *dev)
>> +{
>> +	return etnaviv_drm_bind(dev, true);
>> +}
>> +
>> +static void etnaviv_master_unbind(struct device *dev)
>> +{
>> +	return etnaviv_drm_unbind(dev, true);
>> +}
>> +
>>   static const struct component_master_ops etnaviv_master_ops = {
>> -	.bind = etnaviv_bind,
>> -	.unbind = etnaviv_unbind,
>> +	.bind = etnaviv_master_bind,
>> +	.unbind = etnaviv_master_unbind,
>>   };
>>   
>>   static int etnaviv_pdev_probe(struct platform_device *pdev)
>> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
>> index 5e88fa95dac2..059be8c89c5a 100644
>> --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
>> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
>> @@ -1737,8 +1737,7 @@ static const struct thermal_cooling_device_ops cooling_ops = {
>>   	.set_cur_state = etnaviv_gpu_cooling_set_cur_state,
>>   };
>>   
>> -static int etnaviv_gpu_bind(struct device *dev, struct device *master,
>> -	void *data)
>> +int etnaviv_gpu_bind(struct device *dev, struct device *master, void *data)
>>   {
>>   	struct drm_device *drm = data;
>>   	struct etnaviv_drm_private *priv = drm->dev_private;
>> @@ -1769,7 +1768,6 @@ static int etnaviv_gpu_bind(struct device *dev, struct device *master,
>>   	if (ret < 0)
>>   		goto out_sched;
>>   
>> -
>>   	gpu->drm = drm;
>>   	gpu->fence_context = dma_fence_context_alloc(1);
>>   	xa_init_flags(&gpu->user_fences, XA_FLAGS_ALLOC);
>> @@ -1798,8 +1796,7 @@ static int etnaviv_gpu_bind(struct device *dev, struct device *master,
>>   	return ret;
>>   }
>>   
>> -static void etnaviv_gpu_unbind(struct device *dev, struct device *master,
>> -	void *data)
>> +void etnaviv_gpu_unbind(struct device *dev, struct device *master, void *data)
>>   {
>>   	struct etnaviv_gpu *gpu = dev_get_drvdata(dev);
>>   
>> @@ -1867,9 +1864,11 @@ static int etnaviv_gpu_register_irq(struct etnaviv_gpu *gpu, int irq)
>>   	return 0;
>>   }
>>   
>> -static int etnaviv_gpu_platform_probe(struct platform_device *pdev)
>> +/* platform independent */
>> +
>> +static int etnaviv_gpu_driver_create(struct device *dev, void __iomem *mmio,
>> +				     int irq, bool component, bool has_clk)
>>   {
>> -	struct device *dev = &pdev->dev;
>>   	struct etnaviv_gpu *gpu;
>>   	int err;
>>   
>> @@ -1877,24 +1876,22 @@ static int etnaviv_gpu_platform_probe(struct platform_device *pdev)
>>   	if (!gpu)
>>   		return -ENOMEM;
>>   
>> -	gpu->dev = &pdev->dev;
>> +	gpu->dev = dev;
>> +	gpu->mmio = mmio;
>>   	mutex_init(&gpu->lock);
>>   	mutex_init(&gpu->sched_lock);
>>   
>> -	/* Map registers: */
>> -	gpu->mmio = devm_platform_ioremap_resource(pdev, 0);
>> -	if (IS_ERR(gpu->mmio))
>> -		return PTR_ERR(gpu->mmio);
>> -
>>   	/* Get Interrupt: */
>> -	err = etnaviv_gpu_register_irq(gpu, platform_get_irq(pdev, 0));
>> +	err = etnaviv_gpu_register_irq(gpu, irq);
>>   	if (err)
>>   		return err;
>>   
>>   	/* Get Clocks: */
>> -	err = etnaviv_gpu_clk_get(gpu);
>> -	if (err)
>> -		return err;
>> +	if (has_clk) {
>> +		err = etnaviv_gpu_clk_get(gpu);
>> +		if (err)
>> +			return err;
>> +	}
>>   
>>   	/* TODO: figure out max mapped size */
>>   	dev_set_drvdata(dev, gpu);
>> @@ -1904,24 +1901,27 @@ static int etnaviv_gpu_platform_probe(struct platform_device *pdev)
>>   	 * autosuspend delay is rather arbitary: no measurements have
>>   	 * yet been performed to determine an appropriate value.
>>   	 */
>> -	pm_runtime_use_autosuspend(gpu->dev);
>> -	pm_runtime_set_autosuspend_delay(gpu->dev, 200);
>> -	pm_runtime_enable(gpu->dev);
>> -
>> -	err = component_add(&pdev->dev, &gpu_ops);
>> -	if (err < 0) {
>> -		dev_err(&pdev->dev, "failed to register component: %d\n", err);
>> -		return err;
>> +	pm_runtime_use_autosuspend(dev);
>> +	pm_runtime_set_autosuspend_delay(dev, 200);
>> +	pm_runtime_enable(dev);
>> +
>> +	if (component) {
>> +		err = component_add(dev, &gpu_ops);
>> +		if (err < 0) {
>> +			dev_err(dev, "failed to register component: %d\n", err);
>> +			return err;
>> +		}
>>   	}
>>   
>>   	return 0;
>>   }
>>   
>> -static int etnaviv_gpu_platform_remove(struct platform_device *pdev)
>> +static void etnaviv_gpu_driver_destroy(struct device *dev, bool component)
>>   {
>> -	component_del(&pdev->dev, &gpu_ops);
>> -	pm_runtime_disable(&pdev->dev);
>> -	return 0;
>> +	if (component)
>> +		component_del(dev, &gpu_ops);
>> +
>> +	pm_runtime_disable(dev);
>>   }
>>   
>>   static int etnaviv_gpu_rpm_suspend(struct device *dev)
>> @@ -1971,6 +1971,31 @@ static const struct dev_pm_ops etnaviv_gpu_pm_ops = {
>>   	RUNTIME_PM_OPS(etnaviv_gpu_rpm_suspend, etnaviv_gpu_rpm_resume, NULL)
>>   };
>>   
>> +static int etnaviv_gpu_platform_probe(struct platform_device *pdev)
>> +{
>> +	struct device *dev = &pdev->dev;
>> +	void __iomem *mmio;
>> +	int irq;
>> +
>> +	/* Map registers: */
>> +	mmio = devm_platform_ioremap_resource(pdev, 0);
>> +	if (IS_ERR(mmio))
>> +		return PTR_ERR(mmio);
>> +
>> +	irq = platform_get_irq(pdev, 0);
>> +
>> +	return etnaviv_gpu_driver_create(dev, mmio, irq, true, true);
>> +}
>> +
>> +static int etnaviv_gpu_platform_remove(struct platform_device *pdev)
>> +{
>> +	struct device *dev = &pdev->dev;
>> +
>> +	etnaviv_gpu_driver_destroy(dev, true);
>> +
>> +	return 0;
>> +}
>> +
>>   struct platform_driver etnaviv_gpu_driver = {
>>   	.driver = {
>>   		.name = "etnaviv-gpu",
>> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h b/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
>> index 98c6f9c320fc..1ec829a649b5 100644
>> --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
>> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
>> @@ -206,6 +206,9 @@ void etnaviv_gpu_pm_put(struct etnaviv_gpu *gpu);
>>   int etnaviv_gpu_wait_idle(struct etnaviv_gpu *gpu, unsigned int timeout_ms);
>>   void etnaviv_gpu_start_fe(struct etnaviv_gpu *gpu, u32 address, u16 prefetch);
>>   
>> +int etnaviv_gpu_bind(struct device *dev, struct device *master, void *data);
>> +void etnaviv_gpu_unbind(struct device *dev, struct device *master, void *data);
>> +
>>   extern struct platform_driver etnaviv_gpu_driver;
>>   
>>   #endif /* __ETNAVIV_GPU_H__ */

-- 
Jingfeng

