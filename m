Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CDD275A14B
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jul 2023 00:04:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A052D10E077;
	Wed, 19 Jul 2023 22:04:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id F2F7410E056;
 Wed, 19 Jul 2023 22:04:23 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8AxFvHmXbhkA3MHAA--.19093S3;
 Thu, 20 Jul 2023 06:04:22 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Cx7yPlXbhkPxo1AA--.40661S3; 
 Thu, 20 Jul 2023 06:04:22 +0800 (CST)
Message-ID: <d490f455-5228-b85a-656a-dce11586dee5@loongson.cn>
Date: Thu, 20 Jul 2023 06:04:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [Intel-gfx] [PATCH v3 3/9] PCI/VGA: Switch to
 aperture_contain_firmware_fb_nonreloc()
Content-Language: en-US
To: Bjorn Helgaas <helgaas@kernel.org>, Sui Jingfeng <sui.jingfeng@linux.dev>
References: <20230719204314.GA512532@bhelgaas>
From: suijingfeng <suijingfeng@loongson.cn>
In-Reply-To: <20230719204314.GA512532@bhelgaas>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf8Cx7yPlXbhkPxo1AA--.40661S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoWxAr47uw17Jryxtw1rAr1xtFc_yoWrZw4xpa
 n5AFZ3Aa1DGr4rG3W2v3W2vF1Fvws7GFyUKF98Zw1ru3sIkwn7Kr18ArZ0v3s7ArZ7Ja1S
 vF43tw15uan8ZFXCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUUvIb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
 6r4j6r4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc
 02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAF
 wI0_Cr0_Gr1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1c
 AE67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8C
 rVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8Zw
 CIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x02
 67AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Cr
 0_Gr1UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07Ui
 mi_UUUUU=
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
Cc: linux-fbdev@vger.kernel.org, kvm@vger.kernel.org, linux-pci@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 2023/7/20 04:43, Bjorn Helgaas wrote:
> [+cc linux-pci; I don't apply or ack PCI patches unless they appear there]
>
> On Wed, Jul 12, 2023 at 12:43:04AM +0800, Sui Jingfeng wrote:
>> From: Sui Jingfeng <suijingfeng@loongson.cn>
>>
>> The observation behind this is that we should avoid accessing the global
>> screen_info directly. Call the aperture_contain_firmware_fb_nonreloc()
>> function to implement the detection of whether an aperture contains the
>> firmware FB.
> Because it's better to access the global screen_info from
> aperture_contain_firmware_fb_nonreloc()?  The reasoning here is not
> super clear to me.

Yes, honestly the benefits of this patch is not obvious.

But I do have some (may not practical) ideas in my mind when I create 
this patch.

See my explanation at the end.


>> This patch helps to decouple the determination from the implementation.
>> Or, in other words, we intend to make the determination opaque to the
>> caller. The determination may choose to be arch-dependent or
>> arch-independent. But vgaarb, as a consumer of the determination,
>> shouldn't care how the does determination is implemented.
> "how the determination ..."  (drop the "does")
Ok, will be fixed at the next version.
>
> Are you saying that aperture_contain_firmware_fb_nonreloc() might be
> arch-dependent?  Are there multiple callers?  Or does this just move
> code from one place to a more appropriate place?

1) To form a unify approach, and drop the screen_info.h header.

There are similar cleanup patch at patchwork.


screen_info.h is definitely arch-dependent, while vgaarb is just 
device-dependent.

I think, they do have subtle difference.


2) Convert the *device driven* to the "driver driven".

Move it from vgaarb.c to video/apperture allow code sharing.

While this function are not going to be shared in vgaarb.

Previous it is the device make the decision,

after applied this patch it allow driver make the decision.

They do have subtle difference.

Emm, I will try to give some examples at the next version.


3) I was imagine to drag platform display controllers in (get platform 
devices involved in the arbitration).

As Alex seem hint to implement something platform-independent.

The aperture_contain_firmware_fb_nonreloc() actually is possible be shared.

The aperture of platform device will be not moved.

So it seems that platform device driver could call this function to do 
something else.


>> Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
>> ---
>>   drivers/pci/vgaarb.c | 19 ++++---------------
>>   1 file changed, 4 insertions(+), 15 deletions(-)
>>
>> diff --git a/drivers/pci/vgaarb.c b/drivers/pci/vgaarb.c
>> index bf96e085751d..953daf731b2c 100644
>> --- a/drivers/pci/vgaarb.c
>> +++ b/drivers/pci/vgaarb.c
>> @@ -14,6 +14,7 @@
>>   #define vgaarb_info(dev, fmt, arg...)	dev_info(dev, "vgaarb: " fmt, ##arg)
>>   #define vgaarb_err(dev, fmt, arg...)	dev_err(dev, "vgaarb: " fmt, ##arg)
>>   
>> +#include <linux/aperture.h>
>>   #include <linux/module.h>
>>   #include <linux/kernel.h>
>>   #include <linux/pci.h>
>> @@ -26,7 +27,6 @@
>>   #include <linux/poll.h>
>>   #include <linux/miscdevice.h>
>>   #include <linux/slab.h>
>> -#include <linux/screen_info.h>
>>   #include <linux/vt.h>
>>   #include <linux/console.h>
>>   #include <linux/acpi.h>
>> @@ -558,20 +558,11 @@ void vga_put(struct pci_dev *pdev, unsigned int rsrc)
>>   }
>>   EXPORT_SYMBOL(vga_put);
>>   
>> +/* Select the device owning the boot framebuffer if there is one */
>>   static bool vga_is_firmware_default(struct pci_dev *pdev)
>>   {
>>   #if defined(CONFIG_X86) || defined(CONFIG_IA64)
>> -	u64 base = screen_info.lfb_base;
>> -	u64 size = screen_info.lfb_size;
>>   	struct resource *r;
>> -	u64 limit;
>> -
>> -	/* Select the device owning the boot framebuffer if there is one */
>> -
>> -	if (screen_info.capabilities & VIDEO_CAPABILITY_64BIT_BASE)
>> -		base |= (u64)screen_info.ext_lfb_base << 32;
>> -
>> -	limit = base + size;
>>   
>>   	/* Does firmware framebuffer belong to us? */
>>   	pci_dev_for_each_resource(pdev, r) {
>> @@ -581,10 +572,8 @@ static bool vga_is_firmware_default(struct pci_dev *pdev)
>>   		if (!r->start || !r->end)
>>   			continue;
>>   
>> -		if (base < r->start || limit >= r->end)
>> -			continue;
>> -
>> -		return true;
>> +		if (aperture_contain_firmware_fb_nonreloc(r->start, r->end))
>> +			return true;
>>   	}
>>   #endif
>>   	return false;
>> -- 
>> 2.25.1
>>

