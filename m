Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDD6772FBA9
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jun 2023 12:50:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A63C10E43D;
	Wed, 14 Jun 2023 10:50:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0116A10E24E;
 Wed, 14 Jun 2023 10:50:36 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8AxW+p7m4lkURgFAA--.10857S3;
 Wed, 14 Jun 2023 18:50:35 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8DxK8p6m4lkKIUaAA--.1634S3; 
 Wed, 14 Jun 2023 18:50:34 +0800 (CST)
Message-ID: <dbf0d89f-717a-1f78-aef2-f30506751d4d@loongson.cn>
Date: Wed, 14 Jun 2023 18:50:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v7 2/8] PCI/VGA: Deal only with VGA class devices
To: Sui Jingfeng <15330273260@189.cn>, Bjorn Helgaas <bhelgaas@google.com>
References: <20230613030151.216625-1-15330273260@189.cn>
 <20230613030151.216625-3-15330273260@189.cn>
Content-Language: en-US
From: Sui Jingfeng <suijingfeng@loongson.cn>
Organization: Loongson
In-Reply-To: <20230613030151.216625-3-15330273260@189.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8DxK8p6m4lkKIUaAA--.1634S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoWxXr43WFyxtr4ruFWDXr4xAFc_yoW5tr1xpF
 yrGa45KrW8Ga4xW3y2qF18ZFy5ZFZ0ka4rtr42k34FkFWqkw1qqF95GFyYq343JrWkJF1I
 qa1ayrnruanFgabCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUUv2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v2
 6rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
 8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AK
 xVWxJVW8Jr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxk0xIA0c2IEe2xFo4
 CEbIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG
 67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MI
 IYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E
 14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWxJV
 W8Jr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU13E
 fUUUUUU==
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
Cc: linux-fbdev@vger.kernel.org, kvm@vger.kernel.org,
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-pci@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 2023/6/13 11:01, Sui Jingfeng wrote:
> From: Sui Jingfeng <suijingfeng@loongson.cn>
>
> Deal only with the VGA devcie(pdev->class == 0x0300), so replace the
> pci_get_subsys() function with pci_get_class(). Filter the non-PCI display
> device(pdev->class != 0x0300) out. There no need to process the non-display
> PCI device.
>
> Cc: Bjorn Helgaas <bhelgaas@google.com>
> Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
> ---
>   drivers/pci/vgaarb.c | 22 ++++++++++++----------
>   1 file changed, 12 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/pci/vgaarb.c b/drivers/pci/vgaarb.c
> index c1bc6c983932..22a505e877dc 100644
> --- a/drivers/pci/vgaarb.c
> +++ b/drivers/pci/vgaarb.c
> @@ -754,10 +754,6 @@ static bool vga_arbiter_add_pci_device(struct pci_dev *pdev)
>   	struct pci_dev *bridge;
>   	u16 cmd;
>   
> -	/* Only deal with VGA class devices */
> -	if ((pdev->class >> 8) != PCI_CLASS_DISPLAY_VGA)
> -		return false;
> -

Hi, here is probably a bug fixing.

For an example, nvidia render only GPU typically has 0x0380.

at its PCI class number, but  render only GPU should not participate in 
the arbitration.

As it shouldn't snoop the legacy fixed VGA address.

It(render only GPU) can not display anything.


But 0x0380 >> 8 = 0x03, the filter  failed.


>   	/* Allocate structure */
>   	vgadev = kzalloc(sizeof(struct vga_device), GFP_KERNEL);
>   	if (vgadev == NULL) {
> @@ -1500,7 +1496,9 @@ static int pci_notify(struct notifier_block *nb, unsigned long action,
>   	struct pci_dev *pdev = to_pci_dev(dev);
>   	bool notify = false;
>   
> -	vgaarb_dbg(dev, "%s\n", __func__);
> +	/* Only deal with VGA class devices */
> +	if (pdev->class != PCI_CLASS_DISPLAY_VGA << 8)
> +		return 0;

So here we only care 0x0300, my initial intent is to make an optimization,

nowadays sane display graphic card should all has 0x0300 as its PCI 
class number, is this complete right?

```

#define PCI_BASE_CLASS_DISPLAY        0x03
#define PCI_CLASS_DISPLAY_VGA        0x0300
#define PCI_CLASS_DISPLAY_XGA        0x0301
#define PCI_CLASS_DISPLAY_3D        0x0302
#define PCI_CLASS_DISPLAY_OTHER        0x0380

```

Any ideas ?

>   	/* For now we're only intereted in devices added and removed. I didn't
>   	 * test this thing here, so someone needs to double check for the
> @@ -1510,6 +1508,8 @@ static int pci_notify(struct notifier_block *nb, unsigned long action,
>   	else if (action == BUS_NOTIFY_DEL_DEVICE)
>   		notify = vga_arbiter_del_pci_device(pdev);
>   
> +	vgaarb_dbg(dev, "%s: action = %lu\n", __func__, action);
> +
>   	if (notify)
>   		vga_arbiter_notify_clients();
>   	return 0;
> @@ -1534,8 +1534,8 @@ static struct miscdevice vga_arb_device = {
>   
>   static int __init vga_arb_device_init(void)
>   {
> +	struct pci_dev *pdev = NULL;
>   	int rc;
> -	struct pci_dev *pdev;
>   
>   	rc = misc_register(&vga_arb_device);
>   	if (rc < 0)
> @@ -1545,11 +1545,13 @@ static int __init vga_arb_device_init(void)
>   
>   	/* We add all PCI devices satisfying VGA class in the arbiter by
>   	 * default */
> -	pdev = NULL;
> -	while ((pdev =
> -		pci_get_subsys(PCI_ANY_ID, PCI_ANY_ID, PCI_ANY_ID,
> -			       PCI_ANY_ID, pdev)) != NULL)
> +	while (1) {
> +		pdev = pci_get_class(PCI_CLASS_DISPLAY_VGA << 8, pdev);
> +		if (!pdev)
> +			break;
> +
>   		vga_arbiter_add_pci_device(pdev);
> +	}
>   
>   	pr_info("loaded\n");
>   	return rc;

-- 
Jingfeng

