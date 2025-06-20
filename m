Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02426AE1F91
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jun 2025 17:57:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB11C10EB81;
	Fri, 20 Jun 2025 15:57:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="dMluZ3go";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8976110E233
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jun 2025 15:57:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 12EA85C6842;
 Fri, 20 Jun 2025 15:54:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DFB9C4CEEF;
 Fri, 20 Jun 2025 15:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750435016;
 bh=0/Yq00Po9hqFh21kg/bqFD/QAGJ5CVo5hl9dHMq0V5o=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=dMluZ3goj5wb11sMDmc3+xCKL1yqf1bsRZI3DxM7uG1KXtXt6C7MAqktYANFHHSuf
 Frgwrq+4RZBVltnb5P6MkMmrn1V8fD0OxVdrVTSfZT+rQG2Imxj5XevWyFkdZCmiY+
 ch/RwVduOAGedgkwB7gIRW0jutMz12GvWKhtnHqQF7Q273p3a1Mxw09XmodM6IdZWf
 mBLzMLbaMt7KS9Qt1zJoyPXRZH7OYcp3YYF2sL4h+l/1t5V4l2yjFI0QsyU9eIPJGS
 URhtkW63RC9+TxOytsaLyDgSj5zAc1DJw6+22JfmondzKh0LMan4WBUMSolFC4+7NY
 9S8CfRC6cet/w==
Message-ID: <b3462e88-e24a-43d9-8437-b6d378a3b5d3@kernel.org>
Date: Fri, 20 Jun 2025 10:56:53 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/7] fbcon: Make a symlink to the device selected as
 primary
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Bjorn Helgaas <bhelgaas@google.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Lukas Wunner <lukas@wunner.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Woodhouse <dwmw2@infradead.org>,
 Lu Baolu <baolu.lu@linux.intel.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:INTEL IOMMU (VT-d)" <iommu@lists.linux.dev>,
 "open list:PCI SUBSYSTEM" <linux-pci@vger.kernel.org>,
 "open list:VFIO DRIVER" <kvm@vger.kernel.org>,
 "open list:SOUND" <linux-sound@vger.kernel.org>,
 Daniel Dadap <ddadap@nvidia.com>,
 Mario Limonciello <mario.limonciello@amd.com>
References: <20250620024943.3415685-1-superm1@kernel.org>
 <20250620024943.3415685-8-superm1@kernel.org>
 <a22ecd33-460d-41bf-920c-529645d173e3@suse.de>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <a22ecd33-460d-41bf-920c-529645d173e3@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/20/25 3:47 AM, Thomas Zimmermann wrote:
> Hi
> 
> Am 20.06.25 um 04:49 schrieb Mario Limonciello:
>> From: Mario Limonciello <mario.limonciello@amd.com>
>>
>> Knowing which device is the primary device can be useful for userspace
>> to make decisions on which device to start a display server.
>>
>> Create a link to that device called 'primary_device'.
>>
>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>> ---
>>   drivers/video/fbdev/core/fbcon.c | 10 +++++++++-
>>   1 file changed, 9 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/ 
>> core/fbcon.c
>> index 2df48037688d1..46f21570723e5 100644
>> --- a/drivers/video/fbdev/core/fbcon.c
>> +++ b/drivers/video/fbdev/core/fbcon.c
> 
> You cannot rely on this, as fbcon might be disabled entirely.

So the other idea I had was to have a new file boot_console.

How would you feel about this instead (or even in addition to the symlink)?

diff --git a/drivers/pci/pci-sysfs.c b/drivers/pci/pci-sysfs.c
index 268c69daa4d5..8535950b4c0f 100644
--- a/drivers/pci/pci-sysfs.c
+++ b/drivers/pci/pci-sysfs.c
@@ -30,6 +30,7 @@
  #include <linux/msi.h>
  #include <linux/of.h>
  #include <linux/aperture.h>
+#include <asm/video.h>
  #include "pci.h"

  #ifndef ARCH_PCI_DEV_GROUPS
@@ -679,6 +680,13 @@ const struct attribute_group *pcibus_groups[] = {
         NULL,
  };

+static ssize_t boot_console_show(struct device *dev, struct 
device_attribute *attr,
+                                char *buf)
+{
+       return sysfs_emit(buf, "%u\n", video_is_primary_device(dev));
+}
+static DEVICE_ATTR_RO(boot_console);
+
  static ssize_t boot_vga_show(struct device *dev, struct 
device_attribute *attr,
                              char *buf)
  {
@@ -1698,6 +1706,7 @@ late_initcall(pci_sysfs_init);

  static struct attribute *pci_dev_dev_attrs[] = {
         &dev_attr_boot_vga.attr,
+       &dev_attr_boot_console.attr,
         NULL,
  };

@@ -1710,6 +1719,9 @@ static umode_t pci_dev_attrs_are_visible(struct 
kobject *kobj,
         if (a == &dev_attr_boot_vga.attr && pci_is_vga(pdev))
                 return a->mode;

+       if (a == &dev_attr_boot_console.attr && pci_is_display(pdev))
+               return a->mode;
+
         return 0;
  }


> 
> Best regards
> Thomas
> 
>> @@ -2934,7 +2934,7 @@ static void fbcon_select_primary(struct fb_info 
>> *info)
>>   {
>>       if (!map_override && primary_device == -1 &&
>>           video_is_primary_device(info->device)) {
>> -        int i;
>> +        int i, r;
>>           printk(KERN_INFO "fbcon: %s (fb%i) is primary device\n",
>>                  info->fix.id, info->node);
>> @@ -2949,6 +2949,10 @@ static void fbcon_select_primary(struct fb_info 
>> *info)
>>                      first_fb_vc + 1, last_fb_vc + 1);
>>               info_idx = primary_device;
>>           }
>> +        r = sysfs_create_link(&fbcon_device->kobj, &info->device->kobj,
>> +                      "primary_device");
>> +        if (r)
>> +            pr_err("fbcon: Failed to link to primary device: %d\n", r);
>>       }
>>   }
>> @@ -3376,6 +3380,10 @@ void __init fb_console_init(void)
>>   void __exit fb_console_exit(void)
>>   {
>> +#ifdef CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY
>> +    if (primary_device != -1)
>> +        sysfs_remove_link(&fbcon_device->kobj, "primary_device");
>> +#endif
>>   #ifdef CONFIG_FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER
>>       console_lock();
>>       if (deferred_takeover)
> 

