Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C9CE756042
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jul 2023 12:20:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73A0510E224;
	Mon, 17 Jul 2023 10:20:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1B1B610E223;
 Mon, 17 Jul 2023 10:20:18 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8BxHOvhFbVkTeUFAA--.10505S3;
 Mon, 17 Jul 2023 18:20:17 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8BxB83hFbVkdFsxAA--.63881S3; 
 Mon, 17 Jul 2023 18:20:17 +0800 (CST)
Message-ID: <abc98932-121b-c410-0f51-aab71f2c8a2f@loongson.cn>
Date: Mon, 17 Jul 2023 18:20:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v1 8/8] drm/etnaviv: Add a helper to get a pointer to the
 first available node
Content-Language: en-US
To: Lucas Stach <l.stach@pengutronix.de>,
 Sui Jingfeng <sui.jingfeng@linux.dev>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20230623100822.274706-1-sui.jingfeng@linux.dev>
 <20230623100822.274706-9-sui.jingfeng@linux.dev>
 <66749b1b4523d2859b9fbc6e9120e5f1e887d531.camel@pengutronix.de>
From: suijingfeng <suijingfeng@loongson.cn>
In-Reply-To: <66749b1b4523d2859b9fbc6e9120e5f1e887d531.camel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf8BxB83hFbVkdFsxAA--.63881S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoWxur1UKw1fAFyUtr43trWUAwc_yoW5tr47pF
 W8GFWYkrWkWFyYg34IqFZ8ZFyY9w1Iq3yFk3srtw1vk3s0yryfGryFgr4UCF93AFZ5GF40
 vr10gr17uF48JrXCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUU9Sb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
 xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
 1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv
 67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07
 AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C2
 67AKxVWUXVWUAwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI
 8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWU
 CwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r
 1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBI
 daVFxhVjvjDU0xZFpf9x07jYSoJUUUUU=
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
Cc: loongson-kernel@lists.loongnix.cn, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 2023/7/17 18:07, Lucas Stach wrote:
> Am Freitag, dem 23.06.2023 um 18:08 +0800 schrieb Sui Jingfeng:
>> From: Sui Jingfeng <suijingfeng@loongson.cn>
>>
>> This make the code in etnaviv_pdev_probe() less twisted, drop the reference
>> to device node after finished. Also kill a double blank line.
>>
> I can't spot the double blank line you claim to remove.
>
>> Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
>> ---
>>   drivers/gpu/drm/etnaviv/etnaviv_drv.c | 32 ++++++++++++++++++---------
>>   1 file changed, 22 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
>> index 7d0eeab3e8b7..3446f8eabf59 100644
>> --- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
>> +++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
>> @@ -27,6 +27,19 @@
>>    * DRM operations:
>>    */
>>   
>> +/* If the DT contains at least one available GPU, return a pointer to it */
>> +

Here is the double blank line my patch remove, it (a blank line) is occupied by
the comment of "/* If the DT contains at least one available GPU, return a pointer to it */"


> I think the code in the function is simple enough that we don't need a
> comment explaining what it does.

Ok, then I'll remove the comment at the next version. Thanks


> Regards,
> Lucas
>
>> +static struct device_node *etnaviv_of_first_node(void)
>> +{
>> +	struct device_node *np;
>> +
>> +	for_each_compatible_node(np, NULL, "vivante,gc") {
>> +		if (of_device_is_available(np))
>> +			return np;
>> +	}
>> +
>> +	return NULL;
>> +}
>>   
>>   static void load_gpu(struct drm_device *dev)
>>   {
>> @@ -587,7 +600,7 @@ static const struct component_master_ops etnaviv_master_ops = {
>>   static int etnaviv_pdev_probe(struct platform_device *pdev)
>>   {
>>   	struct device *dev = &pdev->dev;
>> -	struct device_node *first_node = NULL;
>> +	struct device_node *first_node;
>>   	struct component_match *match = NULL;
>>   
>>   	if (!dev->platform_data) {
>> @@ -597,11 +610,10 @@ static int etnaviv_pdev_probe(struct platform_device *pdev)
>>   			if (!of_device_is_available(core_node))
>>   				continue;
>>   
>> -			if (!first_node)
>> -				first_node = core_node;
>> -
>>   			drm_of_component_match_add(&pdev->dev, &match,
>>   						   component_compare_of, core_node);
>> +
>> +			of_node_put(core_node);
>>   		}
>>   	} else {
>>   		char **names = dev->platform_data;
>> @@ -634,8 +646,11 @@ static int etnaviv_pdev_probe(struct platform_device *pdev)
>>   	 * device as the GPU we found. This assumes that all Vivante
>>   	 * GPUs in the system share the same DMA constraints.
>>   	 */
>> -	if (first_node)
>> +	first_node = etnaviv_of_first_node();
>> +	if (first_node) {
>>   		of_dma_configure(&pdev->dev, first_node, true);
>> +		of_node_put(first_node);
>> +	}
>>   
>>   	return component_master_add_with_match(dev, &etnaviv_master_ops, match);
>>   }
>> @@ -709,17 +724,14 @@ static int __init etnaviv_init(void)
>>   	 * If the DT contains at least one available GPU device, instantiate
>>   	 * the DRM platform device.
>>   	 */
>> -	for_each_compatible_node(np, NULL, "vivante,gc") {
>> -		if (!of_device_is_available(np))
>> -			continue;
>> +	np = etnaviv_of_first_node();
>> +	if (np) {
>>   		of_node_put(np);
>>   
>>   		ret = etnaviv_create_platform_device("etnaviv",
>>   						     &etnaviv_platform_device);
>>   		if (ret)
>>   			goto unregister_platform_driver;
>> -
>> -		break;
>>   	}
>>   
>>   	return 0;

