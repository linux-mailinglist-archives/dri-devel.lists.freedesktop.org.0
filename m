Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD33728D27
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jun 2023 03:37:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B07110E620;
	Fri,  9 Jun 2023 01:37:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id C8E3310E620;
 Fri,  9 Jun 2023 01:37:04 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8Dxi+o_goJkP9UAAA--.2631S3;
 Fri, 09 Jun 2023 09:37:03 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8BxC8o+goJkeWMJAA--.20503S3; 
 Fri, 09 Jun 2023 09:37:02 +0800 (CST)
Message-ID: <ec178d79-f96b-072e-aa1b-dd2bf7c9cdd0@loongson.cn>
Date: Fri, 9 Jun 2023 09:37:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v8 6/8] drm/etnaviv: add driver support for the PCI devices
Content-Language: en-US
To: Bjorn Helgaas <helgaas@kernel.org>, Sui Jingfeng <15330273260@189.cn>
References: <20230608173243.GA1207429@bhelgaas>
From: Sui Jingfeng <suijingfeng@loongson.cn>
Organization: Loongson
In-Reply-To: <20230608173243.GA1207429@bhelgaas>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf8BxC8o+goJkeWMJAA--.20503S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoW7Cw18KryxAF15Aw4kGr1Dtwc_yoW8KF1rpF
 WrJFZ0kr409FW5Kw1xXFn5ZFyFka1Sv340v348Cw12gws0vFyrKr4UAFyDAFnxJr4rGFna
 yw4Yyr47ua1jyrXCm3ZEXasCq-sJn29KB7ZKAUJUUUU7529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUUBYb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
 6r4j6r4UJwAaw2AFwI0_Jrv_JF1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0c
 Ia020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jw0_
 WrylYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrw
 CYjI0SjxkI62AI1cAE67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j
 6r4UMxCIbckI1I0E14v26r1Y6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwV
 AFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv2
 0xvE14v26r4j6ryUMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4
 v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AK
 xVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8EeHDUUUUU==
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
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Bjorn Helgaas <bhelgaas@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 2023/6/9 01:32, Bjorn Helgaas wrote:
> On Wed, Jun 07, 2023 at 06:55:49PM +0800, Sui Jingfeng wrote:
>> From: Sui Jingfeng <suijingfeng@loongson.cn>
>>
>> This patch adds PCI driver support on top of what we already have. Take
>> the GC1000 in LS7A1000/LS2K1000 as the first instance of the PCI device
>> driver. There is only one GPU core for the GC1000 in the LS7A1000 and
>> LS2K1000. Therefore, component frameworks can be avoided.
>> +#ifdef CONFIG_DRM_ETNAVIV_PCI_DRIVER
>> +#include "etnaviv_pci_drv.h"
>> +#endif
> With trivial stubs for etnaviv_register_pci_driver() and
> etnaviv_unregister_pci_driver(), I think you could get rid of all
> these #ifdefs.

OK, then, I will try to add dummy implement at etnaviv_pci_drv.h,

Thanks.

>> +void etnaviv_drm_unbind(struct device *dev, bool component)
>>   {
>>   	struct etnaviv_drm_private *priv = etna_private_ptr;
>>   	struct drm_device *drm = priv->drm;
>> @@ -746,6 +750,12 @@ static int __init etnaviv_init(void)
>>   	if (ret != 0)
>>   		goto unregister_gpu_driver;
>>   
>> +#ifdef CONFIG_DRM_ETNAVIV_PCI_DRIVER
>> +	ret = etnaviv_register_pci_driver();
>> +	if (ret != 0)
>> +		goto unregister_platform_driver;
>> +#endif
>> +
>>   	/*
>>   	 * If the DT contains at least one available GPU device, instantiate
>>   	 * the DRM platform device.
>> @@ -763,7 +773,7 @@ static int __init etnaviv_init(void)
>>   		break;
>>   	}
>>   
>> -	return 0;
>> +	return ret;
>>   
>>   unregister_platform_driver:
>>   	platform_driver_unregister(&etnaviv_platform_driver);
>> @@ -778,6 +788,10 @@ static void __exit etnaviv_exit(void)
>>   	etnaviv_destroy_platform_device(&etnaviv_platform_device);
>>   	platform_driver_unregister(&etnaviv_platform_driver);
>>   	platform_driver_unregister(&etnaviv_gpu_driver);
>> +
>> +#ifdef CONFIG_DRM_ETNAVIV_PCI_DRIVER
>> +	etnaviv_unregister_pci_driver();
>> +#endif
>> +static const struct pci_device_id etnaviv_pci_id_lists[] = {
>> +	{PCI_VENDOR_ID_LOONGSON, 0x7a15, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0},
>> +	{PCI_VENDOR_ID_LOONGSON, 0x7a05, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0},
> PCI_VDEVICE()

This make it impossible to hook device-specific data in the future.

But currently there no device specific data associated with the 0x7a05 and 0x7a15,

so it's acceptable for now. Thanks.

> Bjorn

-- 
Jingfeng

