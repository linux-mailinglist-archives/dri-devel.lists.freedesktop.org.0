Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F5C071870A
	for <lists+dri-devel@lfdr.de>; Wed, 31 May 2023 18:08:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EBA010E4F1;
	Wed, 31 May 2023 16:08:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3906110E51B;
 Wed, 31 May 2023 16:08:44 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8DxDOsLcXdkqAIDAA--.2300S3;
 Thu, 01 Jun 2023 00:08:43 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Cx77MJcXdkY5uCAA--.16244S3; 
 Thu, 01 Jun 2023 00:08:41 +0800 (CST)
Message-ID: <950fdaaa-b62c-7f36-a499-9eca71c8bc47@loongson.cn>
Date: Thu, 1 Jun 2023 00:08:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v6 5/6] drm/etnaviv: add driver support for the PCI devices
Content-Language: en-US
To: Bjorn Helgaas <helgaas@kernel.org>
References: <ZHZIXZPuCkFSMF4H@bhelgaas>
From: Sui Jingfeng <suijingfeng@loongson.cn>
Organization: Loongson
In-Reply-To: <ZHZIXZPuCkFSMF4H@bhelgaas>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Cx77MJcXdkY5uCAA--.16244S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBjvJXoW3Jw17Wry8uFWftFW7urW3ZFb_yoWxZw4DpF
 W5JayYkrWkWFW8K3s7XF43ZFy3tw4SqFyF934Ut3sFv390vry8GryrtF4YkF9xXrZagFyI
 vF4UKrW7uF45JaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 bx8YFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
 1l1IIY67AEw4v_JrI_Jryl8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
 wVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwA2z4
 x0Y4vEx4A2jsIE14v26r1j6r4UM28EF7xvwVC2z280aVCY1x0267AKxVWUJVW8JwAS0I0E
 0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzV
 Aqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S
 6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxk0xIA0c2IEe2xFo4CEbIxvr21l42xK82
 IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC2
 0s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMI
 IF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF
 0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87
 Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07URa0PUUUUU=
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
Cc: Li Yi <liyi@loongson.cn>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
 loongson-kernel@lists.loongnix.cn,
 Russell King <linux+etnaviv@armlinux.org.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 2023/5/31 03:02, Bjorn Helgaas wrote:
> On Wed, May 31, 2023 at 12:06:42AM +0800, Sui Jingfeng wrote:
>> This patch adds PCI driver support on top of what already have. Take the
>> GC1000 in LS7A1000/LS2K1000 as the first instance of the PCI device driver.
>> There is only one GPU core for the GC1000 in the LS7A1000 and LS2K1000.
>> Therefore, component frameworks can be avoided. Because we want to bind the
>> DRM driver service to the PCI driver manually.
>> +	 * Loongson Mips and LoongArch CPU(ls3a5000, ls3a4000, ls2k1000la)
>> +	 * maintain cache coherency by hardware
>> +	 */
>> +	if (IS_ENABLED(CONFIG_CPU_LOONGSON64) || IS_ENABLED(CONFIG_LOONGARCH))
>> +		priv->has_cached_coherent = true;
> This looks like something that should be a runtime check, not a
> compile-time check.
>
> If it's possible to build a single kernel image that runs on Loongson
> MIPS or LoongArch CPU and, in addition, runs on other platforms, you
> cannot assume that all the others maintain this cache coherency.

Nice catch! I don't even realize this!


LS3A4000 is mips64r2 with MSA SIMD, while LS3A5000 is LoongArch,

instruction set, compiler, and binary interface are totally changed.

Therefore, it's impossible to build a single kernel image that runs on 
all Loongson CPUs.

Currently, I can guarantee that this works on the Loongson platform.

My initial intent here is to let priv->has_cached_coherent be *true* on 
the Loongson platform (both mips and loongarch).

I do know there are some other vendors who bought GPU IP from Vivante.

say GC7000, and integrate it into their discrete GPU product.

But it is also a PCI device, but this is another story; it deserves 
another patch.

I don't know if Etnaviv folk find some similar hardware on Arm Arch,

Some Arm CPUs do not maintain cached coherency on hardware.

The has_cached_coherent member can be set to false on such hardware.

For us, it seems that there is no need to do runtime checking,

because they are all cached coherent by default.


Can I improve this in the future, currently I don't have a good idea.

>> +static struct etnaviv_drm_private *etna_private_s;
> A static pointer looks wrong because it probably limits you to a
> single instance of something.

This structure is shared by all GPU cores.

Originally, Etnaviv was a component-based driver.

It's one driver wrangler for all GPU cores. (One piece of driver rules 
them all.)

This structure is shared by all GPU cores and does not have a copy per 
GPU core.

>> @@ -727,6 +756,12 @@ static int __init etnaviv_init(void)
>>   	if (ret != 0)
>>   		goto unregister_gpu_driver;
>>   
>> +#ifdef CONFIG_DRM_ETNAVIV_PCI_DRIVER
>> +	ret = pci_register_driver(&etnaviv_pci_driver);
>> +#endif
>> +	if (ret != 0)
>> +		goto unregister_platform_driver;
> Why is this outside the #ifdef?  If CONFIG_DRM_ETNAVIV_PCI_DRIVER is
> not set, you already tested "ret != 0" above and will never take this
> goto.

On arch/platform without CONFIG_PCI enabled,

CONFIG_DRM_ETNAVIV_PCI_DRIVER config option will not be enabled.


On such cases, GCC complains when compile with  W=1:


drivers/gpu/drm/etnaviv/etnaviv_drv.c: In function ‘etnaviv_init’:
drivers/gpu/drm/etnaviv/etnaviv_drv.c:787:1: warning: label 
‘unregister_platform_driver’ defined but not used [-Wunused-label]
   787 | unregister_platform_driver:
       | ^~~~~~~~~~~~~~~~~~~~~~~~~~

This is the pain that #ifdefs and #endif bring to us.

We want to zero out compile warnings.

Otherwise, Intel's compiler test robot will come here and warn you!

Yet another test for "ret != 0" doesn't hurt much, probably could be 
optimized out by the compiler.

We are afraid of warnings.

>> +static int etnaviv_gpu_plat_drv_init(struct etnaviv_gpu *gpu, bool component)
>> +{
>> +	struct device *dev = gpu->dev;
>> +	struct platform_device *pdev = to_platform_device(dev);
>> +	int err;
>> +
>> +	/* Map registers: */
>> +	gpu->mmio = devm_platform_ioremap_resource(pdev, 0);
>> +	if (IS_ERR(gpu->mmio))
>> +		return PTR_ERR(gpu->mmio);
>> +
>> +	if (component) {
>> +		err = component_add(dev, &gpu_ops);
>> +		if (err < 0) {
>> +			dev_err(dev, "failed to register component: %d\n", err);
>> +			return err;
>> +		}
>> +	}
>> +
>> +	return 0;
>> +}
> All this platform driver rearrangement looks like it should be a
> separate patch so adding PCI support only adds PCI-related stuff.
>
Indeed, this is acceptable.
>> +++ b/drivers/gpu/drm/etnaviv/etnaviv_pci_drv.c
>> @@ -0,0 +1,87 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +
>> +#include <linux/pci.h>
>> +
>> +#include "etnaviv_drv.h"
>> +#include "etnaviv_gpu.h"
>> +#include "etnaviv_pci_drv.h"
>> +
>> +enum etnaviv_pci_gpu_family {
>> +	GC1000_IN_LS7A1000 = 0,
>> +	GC1000_IN_LS2K1000 = 1,
> Seems unused; why is this here?

Want to use it to provide device-specific information.

For example, LS2K1000 is an SoC, and LS7A1000 is a bridge chipset.

The GC1000 in those chips is a 32-bit GPU. even though the host is a 
64-bit system.

This GPU can only access memory below 4 GB.

This can be used to provide information known at compile time.

Attach the has_cached_coherent member to the chip model defined here？

>> +static int etnaviv_pci_probe(struct pci_dev *pdev,
>> +			     const struct pci_device_id *ent)
>> +{
>> +	struct device *dev = &pdev->dev;
>> +	int ret;
>> +
>> +	ret = pcim_enable_device(pdev);
>> +	if (ret) {
>> +		dev_err(&pdev->dev, "failed to enable\n");
> Use "dev", no need for "&pdev->dev" since you already looked it up
> above.  Also below for dma_set_mask_and_coherent().

Ok, acceptable.  You are a really serious man and quite professional.

>
>> +		return ret;
>> +	}
>> +
>> +	pci_set_master(pdev);
>> +
>> +	ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
>> +static const struct pci_device_id etnaviv_pci_id_lists[] = {
>> +	{0x0014, 0x7a15, PCI_ANY_ID, PCI_ANY_ID, 0, 0, GC1000_IN_LS7A1000},
>> +	{0x0014, 0x7a05, PCI_ANY_ID, PCI_ANY_ID, 0, 0, GC1000_IN_LS2K1000},
>> +	{0, 0, 0, 0, 0, 0, 0}
> Should probably use PCI_DEVICE_DATA().  Use PCI_VENDOR_ID_LOONGSON.

Originally, I wanted to keep them on the same line, at the same time, 
avoiding complaints from checkpatch.pl.

PCI_VENDOR_ID_LOONGSON is too long. No problem, will be fixed in the next version.

> Only "{ }" required to terminate.
>
>> +++ b/drivers/gpu/drm/etnaviv/etnaviv_pci_drv.h
>> @@ -0,0 +1,12 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +
>> +#ifndef __ETNAVIV_PCI_DRV_H__
>> +#define __ETNAVIV_PCI_DRV_H__
>> +
>> +#include <linux/pci.h>
> This #include isn't required by this file.

Let me give you a reason to do this:

My initial idea is that other source files only need to include 
"etnaviv_pci_drv.h",

OK, new.  will be fixed in the next version.

>> +#ifdef CONFIG_DRM_ETNAVIV_PCI_DRIVER
>> +extern struct pci_driver etnaviv_pci_driver;
>> +#endif
>> +
>> +#endif

-- 
Jingfeng

