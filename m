Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6901D7299A9
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jun 2023 14:22:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2080910E271;
	Fri,  9 Jun 2023 12:22:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8437B10E25B;
 Fri,  9 Jun 2023 12:22:22 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8Bxa+p8GYNk_xUBAA--.3213S3;
 Fri, 09 Jun 2023 20:22:20 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8CxReR6GYNkDyELAA--.33801S3; 
 Fri, 09 Jun 2023 20:22:18 +0800 (CST)
Message-ID: <8e7fe36d-0d0d-bab4-9ace-a738d7a48111@loongson.cn>
Date: Fri, 9 Jun 2023 20:22:18 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [Intel-gfx] [PATCH v3 3/4] PCI/VGA: only deal with VGA class
 devices
To: Bjorn Helgaas <helgaas@kernel.org>, Sui Jingfeng <15330273260@189.cn>
References: <20230608191221.GA1209912@bhelgaas>
Content-Language: en-US
From: Sui Jingfeng <suijingfeng@loongson.cn>
Organization: Loongson
In-Reply-To: <20230608191221.GA1209912@bhelgaas>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8CxReR6GYNkDyELAA--.33801S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoWxtFyUWw4rAr48JFykGFykZwc_yoW7ZF4Dpa
 yrGayfKrWkWF17Cryav3WUZFy5u39Yya4fKr4Ykw1YkanxCryFqFyrKrW5A3W7JrZrGF10
 vFWUt3W7Wa1qqagCm3ZEXasCq-sJn29KB7ZKAUJUUUU3529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUUPlb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
 xVWxJr0_GcWln4kS14v26r126r1DM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12
 xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r12
 6r1DMcIj6I8E87Iv67AKxVW8Jr0_Cr1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwI
 xGrwCYjI0SjxkI62AI1cAE67vIY487MxkF7I0En4kS14v26r4a6rW5MxAIw28IcxkI7VAK
 I48JMxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v26r126r1DMI8I3I0E5I8CrV
 AFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWrXVW8Jr1l
 IxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxV
 AFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4U
 JVWxJr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x07
 jhl19UUUUU=
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
Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 Karol Herbst <kherbst@redhat.com>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, YiPeng Chai <YiPeng.Chai@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>, Yi Liu <yi.l.liu@intel.com>,
 kvm@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Jason Gunthorpe <jgg@ziepe.ca>, Ben Skeggs <bskeggs@redhat.com>,
 linux-pci@vger.kernel.org, Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 Kevin Tian <kevin.tian@intel.com>, Lijo Lazar <lijo.lazar@amd.com>,
 Bokun Zhang <Bokun.Zhang@amd.com>, intel-gfx@lists.freedesktop.org,
 Maxime Ripard <mripard@kernel.org>, loongson-kernel@lists.loongnix.cn,
 Alex Williamson <alex.williamson@redhat.com>,
 Abhishek Sahu <abhsahu@nvidia.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Yishai Hadas <yishaih@nvidia.com>, Li Yi <liyi@loongson.cn>,
 Pan Xinhui <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Cornelia Huck <cohuck@redhat.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Konig <christian.koenig@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 2023/6/9 03:12, Bjorn Helgaas wrote:
> Start with verb and capitalize to match ("Deal only with ...")
>
> On Thu, Jun 08, 2023 at 07:43:21PM +0800, Sui Jingfeng wrote:
>> From: Sui Jingfeng <suijingfeng@loongson.cn>
>>
>> vgaarb only deal with the VGA devcie(pdev->class == 0x0300), so replace the
>> pci_get_subsys() function with pci_get_class(). Filter the non pci display
>> device out. There no need to process the non display PCI device.
> s/non pci/non-PCI/
> s/non display/non-display/
>
> This is fine, and I'll merge this, but someday I would like to get rid
> of the bus_register_notifier() and call vga_arbiter_add_pci_device()
> and vga_arbiter_del_pci_device() directly from the PCI core.

Nice idea!


But I'm wondering there are traps in this.

The pci_notifier in vgaarb.c is still need on Mips platform.

Because of loading order problems.

On MIPS system, PCI devices are enumerated by pcibios_init(),

which runs after vga_arb_device_init(). This is true until now.

When vga_arb_device_init() function get called, it will capture nothing.

On that time, the system have no PCI device enumerated.

Because of this, there are various problems in the past.

This is the reason we still need the notifier,

we need a way to capture the PCI display device after vgaarb already 
loaded(finished).


On complex case, there are ASpeed BMC, loongson integrated display 
controller,

and radeon discrete video card co-exist on Loongson 3B4000 server.

I have fixed various bug at our downstream(linux-4.19) environment.


I have fixed a bug on downstream involved with aspeed bmc, by workaround[1].

Chen Huacai grabbing my patch[1] and rewrite it, submit together with 
him-self's.

Its fine,  but those patch still look paleness in the front of Loongson 
integrated display controller.

Loongson integrated display controller don't has a dedicated VRAM bar.

vga_is_firmware_default() will lose its effectiveness then.

This is the reason we reveal our patch(0004 in this series) to face 
upstream.

Its not only for loongson integrated display controller through.

Its not uncommon that ARM servers have A aspeed BMC and discrete amdgpu 
or old radeon card.

Let the device drivers gave us a hint probably can help to resolve 
multi-video card co-exist

problem.

Consider that sometime user want to use integrate gpu, sometime user 
want to use discrete gpu.

Also, during driver developing(or debugging),

driver writer may want override the default boot device.


vgaarb probable shouldn't make the decision

without giving the device driver a chance to override.


Beside,  vga_is_firmware_default() only apply for PCI display device.

On ARM64 system, there are a lot of platform device.

If we move this function back to the device driver,

it probably applicable for a platform display controller + one/two PCI 
display devices case.


We find a method at downstream during we get efifb works LoongArch platform.

We can utilize the screen_info, screen_info say where's the firmware 
framebuffer is located at.

Drivers for specific hardware platform perhaps know more clearly than 
vgaarb.

if it is the default boot device.


[1] 
https://lore.kernel.org/all/20210514080025.1828197-6-chenhuacai@loongson.cn/

> Or if you wanted to do that now, that would be even better :)
>
> Bjorn
>
>> Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
>> ---
>>   drivers/pci/vgaarb.c | 22 ++++++++++++----------
>>   1 file changed, 12 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/pci/vgaarb.c b/drivers/pci/vgaarb.c
>> index 7f0347f4f6fd..b0bf4952a95d 100644
>> --- a/drivers/pci/vgaarb.c
>> +++ b/drivers/pci/vgaarb.c
>> @@ -756,10 +756,6 @@ static bool vga_arbiter_add_pci_device(struct pci_dev *pdev)
>>   	struct pci_dev *bridge;
>>   	u16 cmd;
>>   
>> -	/* Only deal with VGA class devices */
>> -	if ((pdev->class >> 8) != PCI_CLASS_DISPLAY_VGA)
>> -		return false;
>> -
>>   	/* Allocate structure */
>>   	vgadev = kzalloc(sizeof(struct vga_device), GFP_KERNEL);
>>   	if (vgadev == NULL) {
>> @@ -1499,7 +1495,9 @@ static int pci_notify(struct notifier_block *nb, unsigned long action,
>>   	struct pci_dev *pdev = to_pci_dev(dev);
>>   	bool notify = false;
>>   
>> -	vgaarb_dbg(dev, "%s\n", __func__);
>> +	/* Only deal with VGA class devices */
>> +	if ((pdev->class >> 8) != PCI_CLASS_DISPLAY_VGA)
>> +		return 0;
>>   
>>   	/* For now we're only intereted in devices added and removed. I didn't
>>   	 * test this thing here, so someone needs to double check for the
>> @@ -1509,6 +1507,8 @@ static int pci_notify(struct notifier_block *nb, unsigned long action,
>>   	else if (action == BUS_NOTIFY_DEL_DEVICE)
>>   		notify = vga_arbiter_del_pci_device(pdev);
>>   
>> +	vgaarb_dbg(dev, "%s: action = %lu\n", __func__, action);
>> +
>>   	if (notify)
>>   		vga_arbiter_notify_clients();
>>   	return 0;
>> @@ -1533,8 +1533,8 @@ static struct miscdevice vga_arb_device = {
>>   
>>   static int __init vga_arb_device_init(void)
>>   {
>> +	struct pci_dev *pdev = NULL;
>>   	int rc;
>> -	struct pci_dev *pdev;
>>   
>>   	rc = misc_register(&vga_arb_device);
>>   	if (rc < 0)
>> @@ -1545,11 +1545,13 @@ static int __init vga_arb_device_init(void)
>>   	/* We add all PCI devices satisfying VGA class in the arbiter by
>>   	 * default
>>   	 */
>> -	pdev = NULL;
>> -	while ((pdev =
>> -		pci_get_subsys(PCI_ANY_ID, PCI_ANY_ID, PCI_ANY_ID,
>> -			       PCI_ANY_ID, pdev)) != NULL)
>> +	while (1) {
>> +		pdev = pci_get_class(PCI_CLASS_DISPLAY_VGA << 8, pdev);
>> +		if (!pdev)
>> +			break;
>> +
>>   		vga_arbiter_add_pci_device(pdev);
>> +	};
>>   
>>   	pr_info("loaded\n");
>>   	return rc;
>> -- 
>> 2.25.1
>>
-- 
Jingfeng

