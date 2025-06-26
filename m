Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4644EAEAAA5
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jun 2025 01:33:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 915DA10E925;
	Thu, 26 Jun 2025 23:33:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="DW9xo6/l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AD6F10E925
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jun 2025 23:33:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 76F1B457A3;
 Thu, 26 Jun 2025 23:33:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59CECC4CEEB;
 Thu, 26 Jun 2025 23:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750980800;
 bh=vbC2GLOPug5kOMvejYkJyMkJ9xu1B3O8gjNYLt5ErVk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=DW9xo6/lYAVQiwgc1gQ50Tgcs4VY4qQJqnlo3+KOkhY4Ig4ItPZ/hQ8pP8sl2717W
 LrXTt2n9Tuohuix3Qg8C0pWunv8kympVYEFcI7hS/fGqIaLGL8da1MH/Ar6JXnH6FT
 bsDihuEDI4RD0UegoB2QyZiRSa/f1Z02MM1O0jPa3Lzb8tyVCrmjqUTl9oAkewG/CN
 dmnglJAANFHsnviXQc7QcSktYcwsm1e3esJTNxIN2QLkbt/mJGFFeOxzccZGLI2gyB
 6beMyO8BIt4Elomey3lOqu0ZYg0kygV3LmEtminDytwzgzLC3jZPpeQVbFh8q1ztQG
 CjxHW59JgL7RQ==
Message-ID: <5cc01163-1feb-4a18-8060-27f4da39b2e4@kernel.org>
Date: Thu, 26 Jun 2025 18:33:15 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 9/9] PCI: Add a new 'boot_display' attribute
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Lukas Wunner <lukas@wunner.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Woodhouse <dwmw2@infradead.org>, Lu Baolu <baolu.lu@linux.intel.com>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
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
References: <20250626214721.GA1642412@bhelgaas>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <20250626214721.GA1642412@bhelgaas>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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



On 6/26/25 4:47 PM, Bjorn Helgaas wrote:
> On Thu, Jun 26, 2025 at 04:12:21PM -0500, Mario Limonciello wrote:
>> On 6/26/2025 3:45 PM, Bjorn Helgaas wrote:
>>> On Tue, Jun 24, 2025 at 03:30:42PM -0500, Mario Limonciello wrote:
>>>> From: Mario Limonciello <mario.limonciello@amd.com>
>>>>
>>>> On systems with multiple GPUs there can be uncertainty which GPU is the
>>>> primary one used to drive the display at bootup. In order to disambiguate
>>>> this add a new sysfs attribute 'boot_display' that uses the output of
>>>> video_is_primary_device() to populate whether a PCI device was used for
>>>> driving the display.
>>>>
>>>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>>>
>>> Acked-by: Bjorn Helgaas <bhelgaas@google.com>
>>>
>>> Question below.
>>>
>>>> ---
>>>> v4:
>>>>    * new patch
>>>> ---
>>>>    Documentation/ABI/testing/sysfs-bus-pci |  9 +++++++++
>>>>    drivers/pci/pci-sysfs.c                 | 14 ++++++++++++++
>>>>    2 files changed, 23 insertions(+)
>>>>
>>>> diff --git a/Documentation/ABI/testing/sysfs-bus-pci b/Documentation/ABI/testing/sysfs-bus-pci
>>>> index 69f952fffec72..897cfc1b0de0f 100644
>>>> --- a/Documentation/ABI/testing/sysfs-bus-pci
>>>> +++ b/Documentation/ABI/testing/sysfs-bus-pci
>>>> @@ -612,3 +612,12 @@ Description:
>>>>    		  # ls doe_features
>>>>    		  0001:01        0001:02        doe_discovery
>>>> +
>>>> +What:		/sys/bus/pci/devices/.../boot_display
>>>> +Date:		October 2025
>>>> +Contact:	Linux PCI developers <linux-pci@vger.kernel.org>
>>>> +Description:
>>>> +		This file indicates whether the device was used as a boot
>>>> +		display. If the device was used as the boot display, the file
>>>> +		will contain "1". If the device is a display device but wasn't
>>>> +		used as a boot display, the file will contain "0".
>>>
>>> Is there a reason to expose this file if it wasn't a boot display
>>> device?  Maybe it doesn't need to exist at all unless it contains "1"?
>>
>> I was mostly thinking that it's a handy way for userspace to know whether
>> the kernel even supports this feature.  If userspace sees that file on any
>> GPU as it walks a list then it knows it can use that for a hint.
>>
>> But if you would rather it only shows up for the boot display yes it's
>> possible to do I think.  It's just more complexity to the visibility lookup
>> to also call video_is_primary_device().
> 
> I think for a singleton situation like this it makes more sense to
> only expose the file for one device, not several files where only one
> of them contains "1".

I did an experiment with this but the PCI resources aren't ready at the 
time visibility is determined.

So either:
* the sysfs file creation needs to be deferred similar to 
pci_create_resource_files() does

or

* call to sysfs_update_group() is needed to recalculate visibility.

> 
>>>> diff --git a/drivers/pci/pci-sysfs.c b/drivers/pci/pci-sysfs.c
>>>> index 268c69daa4d57..5bbf79b1b953d 100644
>>>> --- a/drivers/pci/pci-sysfs.c
>>>> +++ b/drivers/pci/pci-sysfs.c
>>>> @@ -30,6 +30,7 @@
>>>>    #include <linux/msi.h>
>>>>    #include <linux/of.h>
>>>>    #include <linux/aperture.h>
>>>> +#include <asm/video.h>
>>>>    #include "pci.h"
>>>>    #ifndef ARCH_PCI_DEV_GROUPS
>>>> @@ -679,6 +680,13 @@ const struct attribute_group *pcibus_groups[] = {
>>>>    	NULL,
>>>>    };
>>>> +static ssize_t boot_display_show(struct device *dev, struct device_attribute *attr,
>>>> +				 char *buf)
>>>> +{
>>>> +	return sysfs_emit(buf, "%u\n", video_is_primary_device(dev));
>>>> +}
>>>> +static DEVICE_ATTR_RO(boot_display);
>>>> +
>>>>    static ssize_t boot_vga_show(struct device *dev, struct device_attribute *attr,
>>>>    			     char *buf)
>>>>    {
>>>> @@ -1698,6 +1706,7 @@ late_initcall(pci_sysfs_init);
>>>>    static struct attribute *pci_dev_dev_attrs[] = {
>>>>    	&dev_attr_boot_vga.attr,
>>>> +	&dev_attr_boot_display.attr,
>>>>    	NULL,
>>>>    };
>>>> @@ -1710,6 +1719,11 @@ static umode_t pci_dev_attrs_are_visible(struct kobject *kobj,
>>>>    	if (a == &dev_attr_boot_vga.attr && pci_is_vga(pdev))
>>>>    		return a->mode;
>>>> +#ifdef CONFIG_VIDEO
>>>> +	if (a == &dev_attr_boot_display.attr && pci_is_display(pdev))
>>>> +		return a->mode;
>>>> +#endif
>>>> +
>>>>    	return 0;
>>>>    }
>>>> -- 
>>>> 2.43.0
>>>>
>>

