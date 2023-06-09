Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2F9B728DA6
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jun 2023 04:11:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0F4410E62D;
	Fri,  9 Jun 2023 02:11:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id 67D6F10E09C;
 Fri,  9 Jun 2023 02:11:37 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8DxSupXioJkANgAAA--.2712S3;
 Fri, 09 Jun 2023 10:11:35 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8DxbMpXioJk2nYJAA--.20758S3; 
 Fri, 09 Jun 2023 10:11:35 +0800 (CST)
Message-ID: <83b2f92f-eab5-a19c-7d6b-3a70e66b9aae@loongson.cn>
Date: Fri, 9 Jun 2023 10:11:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [Intel-gfx] [PATCH v3 3/4] PCI/VGA: only deal with VGA class
 devices
Content-Language: en-US
To: Bjorn Helgaas <helgaas@kernel.org>, Sui Jingfeng <15330273260@189.cn>
References: <20230608191221.GA1209912@bhelgaas>
From: Sui Jingfeng <suijingfeng@loongson.cn>
Organization: Loongson
In-Reply-To: <20230608191221.GA1209912@bhelgaas>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf8DxbMpXioJk2nYJAA--.20758S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoWxXrWDXr1fCry3ArW5uF4Dtrc_yoW5Kry8pa
 yrGayFkFW8W347Gry2qF4UZFyavrWkta4Syr4Yk34FkFWqkF18tFyrCry5Z343ArZ5GF1I
 qay2yF17Ww45tagCm3ZEXasCq-sJn29KB7ZKAUJUUUU3529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUUPSb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
 xVW8Jr0_Cr1UM2kKe7AKxVWUAVWUtwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
 AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
 AVWUtwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI4
 8JMxk0xIA0c2IEe2xFo4CEbIxvr21lc7CjxVAaw2AFwI0_GFv_Wryl42xK82IYc2Ij64vI
 r41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_JF0_Jw1lx2IqxVAqx4xG67
 AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26rWY6r4UJwCI
 c40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267
 AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_
 Cr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IUnsZ23
 UUUUU==
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

Will be fixed at next version, thanks for the strict checking,

I will try to bring this rigorous to the other patch of myself in the 
future.

> This is fine, and I'll merge this, but someday I would like to get rid
> of the bus_register_notifier() and call vga_arbiter_add_pci_device()
> and vga_arbiter_del_pci_device() directly from the PCI core.
>
> Or if you wanted to do that now, that would be even better :)

I think, I probably should only do what I'm good at.


The "good at" here means that It's under prepared,

already matured with thinking(or consideration) by myself.

And also including testing(on two or three architecture).


That idea is belong to you, I would like to see how does it going to 
happen only.

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

