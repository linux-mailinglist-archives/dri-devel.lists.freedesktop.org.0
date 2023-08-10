Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3588B7777AC
	for <lists+dri-devel@lfdr.de>; Thu, 10 Aug 2023 13:56:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70A9610E1B6;
	Thu, 10 Aug 2023 11:56:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id C9DD410E1B6
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Aug 2023 11:56:37 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8Cxh+hz0NRklqUUAA--.8752S3;
 Thu, 10 Aug 2023 19:56:35 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Dx4eRq0NRkUBlTAA--.10908S3; 
 Thu, 10 Aug 2023 19:56:34 +0800 (CST)
Message-ID: <bfe424f2-6dad-c8c9-ec82-8eda70f23cdf@loongson.cn>
Date: Thu, 10 Aug 2023 19:56:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 07/11] PCI/VGA: vga_client_register() return -ENODEV on
 failure, not -1
Content-Language: en-US
To: =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Sui Jingfeng <sui.jingfeng@linux.dev>
References: <20230808223412.1743176-1-sui.jingfeng@linux.dev>
 <20230808223412.1743176-8-sui.jingfeng@linux.dev>
 <b1a964e-a94b-2316-eeaf-fec2b2fa833b@linux.intel.com>
From: suijingfeng <suijingfeng@loongson.cn>
In-Reply-To: <b1a964e-a94b-2316-eeaf-fec2b2fa833b@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Dx4eRq0NRkUBlTAA--.10908S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoWxWrWUXF4xJFWxJF1UAFWkuFX_yoW5Zr1rpF
 yrtF1Ykry8ur18uw42y3W5XFyS934vq348GrWjg3WfArWYvr9Y9F1IqF1Ygr1UGrZ2kF48
 tF43ta9093WDZFgCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUUBFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
 xVW8Jr0_Cr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
 AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
 XVWUAwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI4
 8JMxk0xIA0c2IEe2xFo4CEbIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_
 Jr0_Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8Gjc
 xK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0
 cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8V
 AvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E
 14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07jepB-UUUUU=
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
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Helgaas <bhelgaas@google.com>,
 Dave Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,


On 2023/8/9 21:52, Ilpo Järvinen wrote:
> On Wed, 9 Aug 2023, Sui Jingfeng wrote:
>
>> From: Sui Jingfeng <suijingfeng@loongson.cn>
>>
> Changelog body is missing.


I thought that probably the Fixes tag could be taken as the body of this commit,
since there are no warnings when I check the whole series with checkpatch.pl.


>> Fixes: 934f992c763a ("drm/i915: Recognise non-VGA display devices")
>> Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
>> ---
>>   drivers/pci/vgaarb.c | 15 ++++++---------
>>   1 file changed, 6 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/pci/vgaarb.c b/drivers/pci/vgaarb.c
>> index 811510253553..a6b8c0def35d 100644
>> --- a/drivers/pci/vgaarb.c
>> +++ b/drivers/pci/vgaarb.c
>> @@ -964,7 +964,7 @@ EXPORT_SYMBOL(vga_set_legacy_decoding);
>>    *
>>    * To unregister just call vga_client_unregister().
>>    *
>> - * Returns: 0 on success, -1 on failure
>> + * Returns: 0 on success, -ENODEV on failure
> So this is the true substance of this change??
>
Yes.


> It doesn't warrant Fixes tag which requires a real problem to fix. An
> incorrect comment is not enough.
>
> I think the shortlog is a bit misleading as is because it doesn't in any
> way indicate the problem is only in a comment.

But it's that commit(934f992c763a) alter the return value of vga_client_register(),
which make the commit and code don't match anymore.


>>    */
>>   int vga_client_register(struct pci_dev *pdev,
>>   		unsigned int (*set_decode)(struct pci_dev *pdev, bool decode))
>> @@ -975,16 +975,13 @@ int vga_client_register(struct pci_dev *pdev,
>>   
>>   	spin_lock_irqsave(&vga_lock, flags);
>>   	vgadev = vgadev_find(pdev);
>> -	if (!vgadev)
>> -		goto bail;
>> -
>> -	vgadev->set_decode = set_decode;
>> -	ret = 0;
>> -
>> -bail:
>> +	if (vgadev) {
>> +		vgadev->set_decode = set_decode;
>> +		ret = 0;
>> +	}
>>   	spin_unlock_irqrestore(&vga_lock, flags);
>> -	return ret;
>>   
>> +	return ret;
> No logic changes in this at all? I don't think it belongs to the same
> patch. I'm not sure if the new logic is improvement anyway.


Yes, the new logic is just improvement, no function change.
Strict speaking, you are right. One patch do one thing.


>   I'd prefer to
> initialize ret = 0 instead:
>
> 	int ret = 0;
> 	...
> 	if (!vgadev) {
> 		err = -ENODEV;
> 		goto unlock;
> 	}
> 	...
> unlock:
> 	...
>

But this is same as the original coding style, no fundamental improve.
The key point is to make the wrapped code between the spin_lock_irqsave() and spin_unlock_irqrestore() compact.
my patch remove the necessary 'goto' statement and the 'bail' label.
After apply my patch, the vga_client_register() function became as this:

int vga_client_register(struct pci_dev *pdev,
         unsigned int (*set_decode)(struct pci_dev *pdev, bool decode))
{
     int ret = -ENODEV;
     struct vga_device *vgadev;
     unsigned long flags;

     spin_lock_irqsave(&vga_lock, flags);
     vgadev = vgadev_find(pdev);
     if (vgadev) {
         vgadev->set_decode = set_decode;
         ret = 0;
     }
     spin_unlock_irqrestore(&vga_lock, flags);

     return ret;
}


