Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 072E8728D09
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jun 2023 03:23:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D0AC10E626;
	Fri,  9 Jun 2023 01:23:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6BC1A10E620;
 Fri,  9 Jun 2023 01:23:43 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8Bx7eocf4Jke9QAAA--.2738S3;
 Fri, 09 Jun 2023 09:23:40 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8DxbMobf4Jk01sJAA--.20460S3; 
 Fri, 09 Jun 2023 09:23:39 +0800 (CST)
Message-ID: <48ca03db-1e2c-b02a-f743-7911d970851f@loongson.cn>
Date: Fri, 9 Jun 2023 09:23:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v8 1/8] drm/etnaviv: add a dedicated function to register
 an irq handler
To: Bjorn Helgaas <helgaas@kernel.org>, Sui Jingfeng <15330273260@189.cn>
References: <20230608172535.GA1207045@bhelgaas>
Content-Language: en-US
From: Sui Jingfeng <suijingfeng@loongson.cn>
Organization: Loongson
In-Reply-To: <20230608172535.GA1207045@bhelgaas>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf8DxbMobf4Jk01sJAA--.20460S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoWxCr45CF18Xr4DJFWUXFy5trc_yoW5Xr1fpF
 s7GFyYkr18ua42g34xZF98ZFya9w1fWFyxAw1Dt3sIk3s0vrs5tryYkFWUG34fAryrCw4I
 yr4jgFW7uF1Y9rgCm3ZEXasCq-sJn29KB7ZKAUJUUUU7529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUUBjb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
 Gr0_Gr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYI
 kI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUAVWU
 twAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMx
 k0xIA0c2IEe2xFo4CEbIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_
 Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67
 AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8I
 cVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI
 8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v2
 6r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07j5xhLUUUUU=
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

On 2023/6/9 01:25, Bjorn Helgaas wrote:
> On Wed, Jun 07, 2023 at 06:55:44PM +0800, Sui Jingfeng wrote:
>> From: Sui Jingfeng <suijingfeng@loongson.cn>
>>
>> Because getting IRQ from a device is platform-dependent, PCI devices have
>> different methods for getting an IRQ. This patch is a preparation patch to
>> extend the driver for the PCI device support.
>>
>> Cc: Lucas Stach <l.stach@pengutronix.de>
>> Cc: Christian Gmeiner <christian.gmeiner@gmail.com>
>> Cc: Philipp Zabel <p.zabel@pengutronix.de>
>> Cc: Bjorn Helgaas <bhelgaas@google.com>
>> Cc: Daniel Vetter <daniel@ffwll.ch>
>> Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
>> ---
>>   drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 34 ++++++++++++++++++++-------
>>   1 file changed, 25 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
>> index de8c9894967c..b9c12d3145a2 100644
>> --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
>> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
>> @@ -1817,6 +1817,29 @@ static const struct of_device_id etnaviv_gpu_match[] = {
>>   };
>>   MODULE_DEVICE_TABLE(of, etnaviv_gpu_match);
>>   
>> +static int etnaviv_gpu_register_irq(struct etnaviv_gpu *gpu, int irq)
>> +{
>> +	struct device *dev = gpu->dev;
>> +	int err;
>> +
>> +	if (irq < 0) {
>> +		dev_err(dev, "failed to get irq: %d\n", irq);
> Isn't this message redundant because platform_get_irq() already
> emitted a message for this case?
Indeed, will be fixed at version.
>> +		return irq;
>> +	}
>> +
>> +	err = devm_request_irq(dev, irq, irq_handler, 0, dev_name(dev), gpu);
>> +	if (err) {
>> +		dev_err(dev, "failed to request irq %u: %d\n", irq, err);
>> +		return err;
>> +	}
>> +
>> +	gpu->irq = irq;
>> +
>> +	dev_info(dev, "irq(%d) handler registered\n", irq);
>> +
>> +	return 0;
>> +}
>> +
>>   static int etnaviv_gpu_platform_probe(struct platform_device *pdev)
>>   {
>>   	struct device *dev = &pdev->dev;
>> @@ -1837,16 +1860,9 @@ static int etnaviv_gpu_platform_probe(struct platform_device *pdev)
>>   		return PTR_ERR(gpu->mmio);
>>   
>>   	/* Get Interrupt: */
>> -	gpu->irq = platform_get_irq(pdev, 0);
>> -	if (gpu->irq < 0)
>> -		return gpu->irq;
>> -
>> -	err = devm_request_irq(&pdev->dev, gpu->irq, irq_handler, 0,
>> -			       dev_name(gpu->dev), gpu);
>> -	if (err) {
>> -		dev_err(dev, "failed to request IRQ%u: %d\n", gpu->irq, err);
>> +	err = etnaviv_gpu_register_irq(gpu, platform_get_irq(pdev, 0));
>> +	if (err)
>>   		return err;
>> -	}
>>   
>>   	/* Get Clocks: */
>>   	gpu->clk_reg = devm_clk_get_optional(&pdev->dev, "reg");
>> -- 
>> 2.25.1
>>
-- 
Jingfeng

