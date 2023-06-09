Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 309D1728DE6
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jun 2023 04:27:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7518B10E62F;
	Fri,  9 Jun 2023 02:27:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0B34B10E62E;
 Fri,  9 Jun 2023 02:27:42 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8DxDesdjoJkddkAAA--.2723S3;
 Fri, 09 Jun 2023 10:27:41 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8DxFOQbjoJkAIAJAA--.29115S3; 
 Fri, 09 Jun 2023 10:27:40 +0800 (CST)
Message-ID: <0d2ba099-9817-13be-c85b-997211443119@loongson.cn>
Date: Fri, 9 Jun 2023 10:27:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [Intel-gfx] [PATCH v3 4/4] PCI/VGA: introduce is_boot_device
 function callback to vga_client_register
Content-Language: en-US
To: Bjorn Helgaas <helgaas@kernel.org>, Sui Jingfeng <15330273260@189.cn>
References: <20230608191924.GA1210122@bhelgaas>
From: Sui Jingfeng <suijingfeng@loongson.cn>
Organization: Loongson
In-Reply-To: <20230608191924.GA1210122@bhelgaas>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf8DxFOQbjoJkAIAJAA--.29115S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoW3Ar18try3CFy3XryDGry5ZFc_yoWDGF18pF
 WrJFy5AFWfZF4I9r47X3W5AFyYv3yIvayrGrW7Cw1Yga45Cr9YqFyFyry5tryxJrZ7CF17
 tFn8tay7uF4jvFXCm3ZEXasCq-sJn29KB7ZKAUJUUUUf529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUUPlb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAF
 wI0_Gr1j6F4UJwAaw2AFwI0_JF0_Jw1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2
 xF0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_
 JF0_Jw1lYx0Ex4A2jsIE14v26F4j6r4UJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64
 vIr41lc7I2V7IY0VAS07AlzVAYIcxG8wCY1x0262kKe7AKxVW8ZVWrXwCF04k20xvY0x0E
 wIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AKxVWUAVWUtwC20s026c02F4
 0E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Wrv_Gr1U
 MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I
 0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWx
 JVW8Jr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x07
 j-CztUUUUU=
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

On 2023/6/9 03:19, Bjorn Helgaas wrote:
> On Thu, Jun 08, 2023 at 07:43:22PM +0800, Sui Jingfeng wrote:
>> From: Sui Jingfeng <suijingfeng@loongson.cn>
>>
>> The vga_is_firmware_default() function is arch-dependent, which doesn't
>> sound right. At least, it also works on the Mips and LoongArch platforms.
>> Tested with the drm/amdgpu and drm/radeon drivers. However, it's difficult
>> to enumerate all arch-driver combinations. I'm wrong if there is only one
>> exception.
>>
>> With the observation that device drivers typically have better knowledge
>> about which PCI bar contains the firmware framebuffer, which could avoid
>> the need to iterate all of the PCI BARs.
>>
>> But as a PCI function at pci/vgaarb.c, vga_is_firmware_default() is
>> probably not suitable to make such an optimization for a specific device.
>>
>> There are PCI display controllers that don't have a dedicated VRAM bar,
>> this function will lose its effectiveness in such a case. Luckily, the
>> device driver can provide an accurate workaround.
>>
>> Therefore, this patch introduces a callback that allows the device driver
>> to tell the VGAARB if the device is the default boot device. This patch
>> only intends to introduce the mechanism, while the implementation is left
>> to the device driver authors. Also honor the comment: "Clients have two
>> callback mechanisms they can use"
> s/bar/BAR/ (several)
>
> Nothing here uses the callback.  I don't want to merge this until we
> have a user.

This is chicken and egg question.

If you could help get this merge first, I will show you the first user.

> I'm not sure why the device driver should know whether its device is
> the default boot device.

It's not that the device driver should know,

but it's about that the device driver has the right to override.

Device driver may have better approach to identify the default boot device.

>> Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |  2 +-
>>   drivers/gpu/drm/i915/display/intel_vga.c   |  3 +--
>>   drivers/gpu/drm/nouveau/nouveau_vga.c      |  2 +-
>>   drivers/gpu/drm/radeon/radeon_device.c     |  2 +-
>>   drivers/pci/vgaarb.c                       | 22 ++++++++++++++++++----
>>   drivers/vfio/pci/vfio_pci_core.c           |  2 +-
>>   include/linux/vgaarb.h                     |  8 +++++---
>>   7 files changed, 28 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> index 5c7d40873ee2..7a096f2d5c16 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> @@ -3960,7 +3960,7 @@ int amdgpu_device_init(struct amdgpu_device *adev,
>>   	/* this will fail for cards that aren't VGA class devices, just
>>   	 * ignore it */
>>   	if ((adev->pdev->class >> 8) == PCI_CLASS_DISPLAY_VGA)
>> -		vga_client_register(adev->pdev, amdgpu_device_vga_set_decode);
>> +		vga_client_register(adev->pdev, amdgpu_device_vga_set_decode, NULL);
>>   
>>   	px = amdgpu_device_supports_px(ddev);
>>   
>> diff --git a/drivers/gpu/drm/i915/display/intel_vga.c b/drivers/gpu/drm/i915/display/intel_vga.c
>> index 286a0bdd28c6..98d7d4dffe9f 100644
>> --- a/drivers/gpu/drm/i915/display/intel_vga.c
>> +++ b/drivers/gpu/drm/i915/display/intel_vga.c
>> @@ -115,7 +115,6 @@ intel_vga_set_decode(struct pci_dev *pdev, bool enable_decode)
>>   
>>   int intel_vga_register(struct drm_i915_private *i915)
>>   {
>> -
>>   	struct pci_dev *pdev = to_pci_dev(i915->drm.dev);
>>   	int ret;
>>   
>> @@ -127,7 +126,7 @@ int intel_vga_register(struct drm_i915_private *i915)
>>   	 * then we do not take part in VGA arbitration and the
>>   	 * vga_client_register() fails with -ENODEV.
>>   	 */
>> -	ret = vga_client_register(pdev, intel_vga_set_decode);
>> +	ret = vga_client_register(pdev, intel_vga_set_decode, NULL);
>>   	if (ret && ret != -ENODEV)
>>   		return ret;
>>   
>> diff --git a/drivers/gpu/drm/nouveau/nouveau_vga.c b/drivers/gpu/drm/nouveau/nouveau_vga.c
>> index f8bf0ec26844..162b4f4676c7 100644
>> --- a/drivers/gpu/drm/nouveau/nouveau_vga.c
>> +++ b/drivers/gpu/drm/nouveau/nouveau_vga.c
>> @@ -92,7 +92,7 @@ nouveau_vga_init(struct nouveau_drm *drm)
>>   		return;
>>   	pdev = to_pci_dev(dev->dev);
>>   
>> -	vga_client_register(pdev, nouveau_vga_set_decode);
>> +	vga_client_register(pdev, nouveau_vga_set_decode, NULL);
>>   
>>   	/* don't register Thunderbolt eGPU with vga_switcheroo */
>>   	if (pci_is_thunderbolt_attached(pdev))
>> diff --git a/drivers/gpu/drm/radeon/radeon_device.c b/drivers/gpu/drm/radeon/radeon_device.c
>> index afbb3a80c0c6..71f2ff39d6a1 100644
>> --- a/drivers/gpu/drm/radeon/radeon_device.c
>> +++ b/drivers/gpu/drm/radeon/radeon_device.c
>> @@ -1425,7 +1425,7 @@ int radeon_device_init(struct radeon_device *rdev,
>>   	/* if we have > 1 VGA cards, then disable the radeon VGA resources */
>>   	/* this will fail for cards that aren't VGA class devices, just
>>   	 * ignore it */
>> -	vga_client_register(rdev->pdev, radeon_vga_set_decode);
>> +	vga_client_register(rdev->pdev, radeon_vga_set_decode, NULL);
>>   
>>   	if (rdev->flags & RADEON_IS_PX)
>>   		runtime = true;
>> diff --git a/drivers/pci/vgaarb.c b/drivers/pci/vgaarb.c
>> index b0bf4952a95d..d3dab61e0ef2 100644
>> --- a/drivers/pci/vgaarb.c
>> +++ b/drivers/pci/vgaarb.c
>> @@ -53,6 +53,7 @@ struct vga_device {
>>   	bool bridge_has_one_vga;
>>   	bool is_firmware_default;	/* device selected by firmware */
>>   	unsigned int (*set_decode)(struct pci_dev *pdev, bool decode);
>> +	bool (*is_boot_device)(struct pci_dev *pdev);
>>   };
>>   
>>   static LIST_HEAD(vga_list);
>> @@ -614,10 +615,17 @@ static bool vga_is_boot_device(struct vga_device *vgadev)
>>   	if (boot_vga && boot_vga->is_firmware_default)
>>   		return false;
>>   
>> -	if (vga_is_firmware_default(pdev)) {
>> -		vgadev->is_firmware_default = true;
>> +	/*
>> +	 * Ask the device driver first, if registered. Fallback to the
>> +	 * default implement if the callback is non-exist.
>> +	 */
>> +	if (vgadev->is_boot_device)
>> +		vgadev->is_firmware_default = vgadev->is_boot_device(pdev);
>> +	else
>> +		vgadev->is_firmware_default = vga_is_firmware_default(pdev);
>> +
>> +	if (vgadev->is_firmware_default)
>>   		return true;
>> -	}
>>   
>>   	/*
>>   	 * A legacy VGA device has MEM and IO enabled and any bridges
>> @@ -954,6 +962,10 @@ EXPORT_SYMBOL(vga_set_legacy_decoding);
>>    * @set_decode callback: If a client can disable its GPU VGA resource, it
>>    * will get a callback from this to set the encode/decode state.
>>    *
>> + * @is_boot_device: callback to the device driver, query if a client is the
>> + * default boot device, as the device driver typically has better knowledge
>> + * if specific device is the boot device. But this callback is optional.
>> + *
>>    * Rationale: we cannot disable VGA decode resources unconditionally, some
>>    * single GPU laptops seem to require ACPI or BIOS access to the VGA registers
>>    * to control things like backlights etc. Hopefully newer multi-GPU laptops do
>> @@ -969,7 +981,8 @@ EXPORT_SYMBOL(vga_set_legacy_decoding);
>>    * Returns: 0 on success, -1 on failure
>>    */
>>   int vga_client_register(struct pci_dev *pdev,
>> -		unsigned int (*set_decode)(struct pci_dev *pdev, bool decode))
>> +		unsigned int (*set_decode)(struct pci_dev *pdev, bool decode),
>> +		bool (*is_boot_device)(struct pci_dev *pdev))
>>   {
>>   	int ret = -ENODEV;
>>   	struct vga_device *vgadev;
>> @@ -981,6 +994,7 @@ int vga_client_register(struct pci_dev *pdev,
>>   		goto bail;
>>   
>>   	vgadev->set_decode = set_decode;
>> +	vgadev->is_boot_device = is_boot_device;
>>   	ret = 0;
>>   
>>   bail:
>> diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci_core.c
>> index a5ab416cf476..2a8873a330ba 100644
>> --- a/drivers/vfio/pci/vfio_pci_core.c
>> +++ b/drivers/vfio/pci/vfio_pci_core.c
>> @@ -2067,7 +2067,7 @@ static int vfio_pci_vga_init(struct vfio_pci_core_device *vdev)
>>   	if (ret)
>>   		return ret;
>>   
>> -	ret = vga_client_register(pdev, vfio_pci_set_decode);
>> +	ret = vga_client_register(pdev, vfio_pci_set_decode, NULL);
>>   	if (ret)
>>   		return ret;
>>   	vga_set_legacy_decoding(pdev, vfio_pci_set_decode(pdev, false));
>> diff --git a/include/linux/vgaarb.h b/include/linux/vgaarb.h
>> index d36225c582ee..66fe80ffad76 100644
>> --- a/include/linux/vgaarb.h
>> +++ b/include/linux/vgaarb.h
>> @@ -50,7 +50,8 @@ struct pci_dev *vga_default_device(void);
>>   void vga_set_default_device(struct pci_dev *pdev);
>>   int vga_remove_vgacon(struct pci_dev *pdev);
>>   int vga_client_register(struct pci_dev *pdev,
>> -		unsigned int (*set_decode)(struct pci_dev *pdev, bool state));
>> +		unsigned int (*set_decode)(struct pci_dev *pdev, bool state),
>> +		bool (*is_boot_device)(struct pci_dev *pdev));
>>   #else /* CONFIG_VGA_ARB */
>>   static inline void vga_set_legacy_decoding(struct pci_dev *pdev,
>>   		unsigned int decodes)
>> @@ -76,7 +77,8 @@ static inline int vga_remove_vgacon(struct pci_dev *pdev)
>>   	return 0;
>>   }
>>   static inline int vga_client_register(struct pci_dev *pdev,
>> -		unsigned int (*set_decode)(struct pci_dev *pdev, bool state))
>> +		unsigned int (*set_decode)(struct pci_dev *pdev, bool state),
>> +		bool (*is_boot_device)(struct pci_dev *pdev))
>>   {
>>   	return 0;
>>   }
>> @@ -114,7 +116,7 @@ static inline int vga_get_uninterruptible(struct pci_dev *pdev,
>>   
>>   static inline void vga_client_unregister(struct pci_dev *pdev)
>>   {
>> -	vga_client_register(pdev, NULL);
>> +	vga_client_register(pdev, NULL, NULL);
>>   }
>>   
>>   #endif /* LINUX_VGA_H */
>> -- 
>> 2.25.1
>>
-- 
Jingfeng

