Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ADFB5755FD8
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jul 2023 11:52:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E3CA10E216;
	Mon, 17 Jul 2023 09:52:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3836610E216
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jul 2023 09:52:04 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8AxuepAD7VkL+MFAA--.6011S3;
 Mon, 17 Jul 2023 17:52:00 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8CxF8wgD7VkXVUxAA--.30982S3; 
 Mon, 17 Jul 2023 17:51:57 +0800 (CST)
Content-Type: multipart/alternative;
 boundary="------------C7fGr9DRI2znOSw0FURZeo1Q"
Message-ID: <6b4ff3d5-293e-7bf3-f5df-babc14661c44@loongson.cn>
Date: Mon, 17 Jul 2023 17:51:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 2/6] PCI/VGA: Deal with PCI VGA compatible devices only
Content-Language: en-US
To: Sui Jingfeng <sui.jingfeng@linux.dev>, Bjorn Helgaas
 <bhelgaas@google.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, "Maciej W. Rozycki" <macro@orcam.me.uk>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>
References: <20230711134354.755966-1-sui.jingfeng@linux.dev>
 <20230711134354.755966-3-sui.jingfeng@linux.dev>
From: suijingfeng <suijingfeng@loongson.cn>
In-Reply-To: <20230711134354.755966-3-sui.jingfeng@linux.dev>
X-CM-TRANSID: AQAAf8CxF8wgD7VkXVUxAA--.30982S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoWxWw4xtF4rXryfXw4xXw13trc_yoWrXFW5pa
 4rGFWYkrykWr17Ww42qF18ZFy5ZFWkCa4rAF4jk3sIkFsrAryjqr93GrW5Jay3JrWkJF1a
 qa13tr18uwsrtagCm3ZEXasCq-sJn29KB7ZKAUJUUUUx529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3UbIjqfuFe4nvWSU5nxnvy29KBjDU0xBIdaVrnRJUUUPFb4IE77IF4wAF
 F20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r
 1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAF
 wI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67
 AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr0_Cr1UM2kKe7AKxVWUAVWU
 twAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMcIj6xIIjx
 v20xvE14v26r126r1DMcIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1l
 F7xvr2IY64vIr41l7480Y4vEI4kI2Ix0rVAqx4xJMxk0xIA0c2IEe2xFo4CEbIxvr21lc7
 CjxVAaw2AFwI0_JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l
 4IxYO2xFxVAFwI0_JF0_Jw1lx2IqxVAqx4xG67AKxVWUGVWUWwC20s026x8GjcxK67AKxV
 WUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAF
 wI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcI
 k0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4j
 6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU2E_MDUUUU
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
Cc: loongson-kernel@lists.loongnix.cn, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Mario Limonciello <mario.limonciello@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--------------C7fGr9DRI2znOSw0FURZeo1Q
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,


On 2023/7/11 21:43, Sui Jingfeng wrote:
> From: Sui Jingfeng<suijingfeng@loongson.cn>
>
> Currently, vgaarb only cares about PCI VGA-compatible class devices.
>
> While vga_arbiter_del_pci_device() gets called unbalanced when some PCI
> device is about to be removed. This happens even during the boot process.
>
> Another reason is that the vga_arb_device_init() function is not efficient.
> Since we only care about VGA-compatible devices (pdev->class == 0x030000),
> We could filter the unqualified devices out in the vga_arb_device_init()
> function. While the current implementation is to search all PCI devices
> in a system, this is not necessary.
>
> Reviewed-by: Mario Limonciello<mario.limonciello@amd.com>
> Signed-off-by: Sui Jingfeng<suijingfeng@loongson.cn>
> ---
>   drivers/pci/vgaarb.c | 25 +++++++++++++------------
>   1 file changed, 13 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/pci/vgaarb.c b/drivers/pci/vgaarb.c
> index c1bc6c983932..021116ed61cb 100644
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
>   	/* Allocate structure */
>   	vgadev = kzalloc(sizeof(struct vga_device), GFP_KERNEL);
>   	if (vgadev == NULL) {
> @@ -1502,6 +1498,10 @@ static int pci_notify(struct notifier_block *nb, unsigned long action,
>   
>   	vgaarb_dbg(dev, "%s\n", __func__);
>   
> +	/* Deal with VGA compatible devices only */
> +	if ((pdev->class >> 8) != PCI_CLASS_DISPLAY_VGA)
> +		return 0;
> +
>   	/* For now we're only intereted in devices added and removed. I didn't
>   	 * test this thing here, so someone needs to double check for the
>   	 * cases of hotplugable vga cards. */
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
> @@ -1543,13 +1543,14 @@ static int __init vga_arb_device_init(void)
>   
>   	bus_register_notifier(&pci_bus_type, &pci_notifier);
>   
> -	/* We add all PCI devices satisfying VGA class in the arbiter by
> -	 * default */
> -	pdev = NULL;
> -	while ((pdev =
> -		pci_get_subsys(PCI_ANY_ID, PCI_ANY_ID, PCI_ANY_ID,
> -			       PCI_ANY_ID, pdev)) != NULL)
> -		vga_arbiter_add_pci_device(pdev);
> +	/*
> +	 * We add all PCI VGA compatible devices in the arbiter by default
> +	 */
> +	do {
> +		pdev = pci_get_class(PCI_CLASS_DISPLAY_VGA << 8, pdev);
> +		if (pdev)
> +			vga_arbiter_add_pci_device(pdev);
> +	} while (pdev);

I suddenly remember one more thing that I forget to explain.

In a previous thread[1] of previous version of this series,

Maciej seems argue that PCI_CLASS_NOT_DEFINED_VGA should be handled also.

But, even I try to handled PCI_CLASS_NOT_DEFINED_VGA at here,

this card still will not be annotate as boot_vga,

because the pci_dev_attrs_are_visible() function only consider VGA compatible devices

which (pdev->class >> 8 == PCI_CLASS_DISPLAY_VGA) is true. See [2].


Intel integrated GPU is more intelligent,

which could change their class of the PCI(e) device to 0x038000 when

multiple GPU co-exist. Even though the GPU can display. This is configurable by

the firmware, but this is trying to escape the arbitration by changing is PCI id.


So, PCI devices belong to the PCI_CLASS_DISPLAY_OTHER, PCI_CLASS_DISPLAY_3D and PCI_CLASS_DISPLAY_XGA

can not participate in the arbitration. They are all will be get filtered.

So, this is a limitation of the vgaarb itself.

While I could help to improve it in the future, what do you think?

Is my express clear?

[1] 
https://lkml.kernel.org/nouveau/alpine.DEB.2.21.2306190339590.14084@angie.orcam.me.uk/#t

[2] 
https://elixir.bootlin.com/linux/latest/source/drivers/pci/pci-sysfs.c#L1544

>   
>   	pr_info("loaded\n");
>   	return rc;
--------------C7fGr9DRI2znOSw0FURZeo1Q
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi,<br>
    </p>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2023/7/11 21:43, Sui Jingfeng wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20230711134354.755966-3-sui.jingfeng@linux.dev">
      <pre class="moz-quote-pre" wrap="">From: Sui Jingfeng <a class="moz-txt-link-rfc2396E" href="mailto:suijingfeng@loongson.cn">&lt;suijingfeng@loongson.cn&gt;</a>

Currently, vgaarb only cares about PCI VGA-compatible class devices.

While vga_arbiter_del_pci_device() gets called unbalanced when some PCI
device is about to be removed. This happens even during the boot process.

Another reason is that the vga_arb_device_init() function is not efficient.
Since we only care about VGA-compatible devices (pdev-&gt;class == 0x030000),
We could filter the unqualified devices out in the vga_arb_device_init()
function. While the current implementation is to search all PCI devices
in a system, this is not necessary.

Reviewed-by: Mario Limonciello <a class="moz-txt-link-rfc2396E" href="mailto:mario.limonciello@amd.com">&lt;mario.limonciello@amd.com&gt;</a>
Signed-off-by: Sui Jingfeng <a class="moz-txt-link-rfc2396E" href="mailto:suijingfeng@loongson.cn">&lt;suijingfeng@loongson.cn&gt;</a>
---
 drivers/pci/vgaarb.c | 25 +++++++++++++------------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/drivers/pci/vgaarb.c b/drivers/pci/vgaarb.c
index c1bc6c983932..021116ed61cb 100644
--- a/drivers/pci/vgaarb.c
+++ b/drivers/pci/vgaarb.c
@@ -754,10 +754,6 @@ static bool vga_arbiter_add_pci_device(struct pci_dev *pdev)
 	struct pci_dev *bridge;
 	u16 cmd;
 
-	/* Only deal with VGA class devices */
-	if ((pdev-&gt;class &gt;&gt; 8) != PCI_CLASS_DISPLAY_VGA)
-		return false;
-
 	/* Allocate structure */
 	vgadev = kzalloc(sizeof(struct vga_device), GFP_KERNEL);
 	if (vgadev == NULL) {
@@ -1502,6 +1498,10 @@ static int pci_notify(struct notifier_block *nb, unsigned long action,
 
 	vgaarb_dbg(dev, "%s\n", __func__);
 
+	/* Deal with VGA compatible devices only */
+	if ((pdev-&gt;class &gt;&gt; 8) != PCI_CLASS_DISPLAY_VGA)
+		return 0;
+
 	/* For now we're only intereted in devices added and removed. I didn't
 	 * test this thing here, so someone needs to double check for the
 	 * cases of hotplugable vga cards. */
@@ -1534,8 +1534,8 @@ static struct miscdevice vga_arb_device = {
 
 static int __init vga_arb_device_init(void)
 {
+	struct pci_dev *pdev = NULL;
 	int rc;
-	struct pci_dev *pdev;
 
 	rc = misc_register(&amp;vga_arb_device);
 	if (rc &lt; 0)
@@ -1543,13 +1543,14 @@ static int __init vga_arb_device_init(void)
 
 	bus_register_notifier(&amp;pci_bus_type, &amp;pci_notifier);
 
-	/* We add all PCI devices satisfying VGA class in the arbiter by
-	 * default */
-	pdev = NULL;
-	while ((pdev =
-		pci_get_subsys(PCI_ANY_ID, PCI_ANY_ID, PCI_ANY_ID,
-			       PCI_ANY_ID, pdev)) != NULL)
-		vga_arbiter_add_pci_device(pdev);
+	/*
+	 * We add all PCI VGA compatible devices in the arbiter by default
+	 */
+	do {
+		pdev = pci_get_class(PCI_CLASS_DISPLAY_VGA &lt;&lt; 8, pdev);
+		if (pdev)
+			vga_arbiter_add_pci_device(pdev);
+	} while (pdev);
</pre>
    </blockquote>
    <pre id="b">I suddenly remember one more thing that I forget to explain.

In a previous thread[1] of previous version of this series,

Maciej seems argue that PCI_CLASS_NOT_DEFINED_VGA should be handled also.

But, even I try to handled PCI_CLASS_NOT_DEFINED_VGA at here,

this card still will not be annotate as boot_vga,

because the pci_dev_attrs_are_visible() function only consider VGA compatible devices

which (pdev-&gt;class &gt;&gt; 8 == PCI_CLASS_DISPLAY_VGA) is true. See [2].


Intel integrated GPU is more intelligent,

which could change their class of the PCI(e) device to 0x038000 when

multiple GPU co-exist. Even though the GPU can display. This is configurable by

the firmware, but this is trying to escape the arbitration by changing is PCI id. 


So, PCI devices belong to the PCI_CLASS_DISPLAY_OTHER, PCI_CLASS_DISPLAY_3D and PCI_CLASS_DISPLAY_XGA

can not participate in the arbitration. They are all will be get filtered. 

So, this is a limitation of the vgaarb itself.

While I could help to improve it in the future, what do you think?

Is my express clear?

</pre>
    <p></p>
    <p>[1]
<a class="moz-txt-link-freetext" href="https://lkml.kernel.org/nouveau/alpine.DEB.2.21.2306190339590.14084@angie.orcam.me.uk/#t">https://lkml.kernel.org/nouveau/alpine.DEB.2.21.2306190339590.14084@angie.orcam.me.uk/#t</a></p>
    <p>[2]
<a class="moz-txt-link-freetext" href="https://elixir.bootlin.com/linux/latest/source/drivers/pci/pci-sysfs.c#L1544">https://elixir.bootlin.com/linux/latest/source/drivers/pci/pci-sysfs.c#L1544</a><br>
    </p>
    <blockquote type="cite"
      cite="mid:20230711134354.755966-3-sui.jingfeng@linux.dev">
      <pre class="moz-quote-pre" wrap=""> 
 	pr_info("loaded\n");
 	return rc;
</pre>
    </blockquote>
  </body>
</html>

--------------C7fGr9DRI2znOSw0FURZeo1Q--

