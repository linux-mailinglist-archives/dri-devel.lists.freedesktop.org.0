Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 74F1C7565DD
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jul 2023 16:08:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 232DE10E259;
	Mon, 17 Jul 2023 14:08:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id 92E8D10E259;
 Mon, 17 Jul 2023 14:08:40 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8BxIvBmS7VkL_YFAA--.14985S3;
 Mon, 17 Jul 2023 22:08:38 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8DxzM5iS7VkZZExAA--.6420S3; 
 Mon, 17 Jul 2023 22:08:34 +0800 (CST)
Message-ID: <c78fa692-b4cd-3a84-139e-12c855ff5264@loongson.cn>
Date: Mon, 17 Jul 2023 22:07:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 4/9] PCI/VGA: Improve the default VGA device selection
To: Sui Jingfeng <sui.jingfeng@linux.dev>, David Airlie <airlied@gmail.com>
References: <20230711164310.791756-1-sui.jingfeng@linux.dev>
 <20230711164310.791756-5-sui.jingfeng@linux.dev>
Content-Language: en-US
From: suijingfeng <suijingfeng@loongson.cn>
In-Reply-To: <20230711164310.791756-5-sui.jingfeng@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf8DxzM5iS7VkZZExAA--.6420S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj9fXoWfGFy8uF1rCw4Uuw1xXFWrWFX_yoW8JF43Wo
 WfWr43XF1FkFyxAaykAr9xGF13XFZ5Gasxur4rAFn8Xa9xZF1Yg3yag3W3Xw15Cr1FyrW7
 Zw1Utw4fAFZ7Jas7l-sFpf9Il3svdjkaLaAFLSUrUUUUeb8apTn2vfkv8UJUUUU8wcxFpf
 9Il3svdxBIdaVrn0xqx4xG64xvF2IEw4CE5I8CrVC2j2Jv73VFW2AGmfu7bjvjm3AaLaJ3
 UjIYCTnIWjp_UUUO57kC6x804xWl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI
 8IcIk0rVWrJVCq3wAFIxvE14AKwVWUXVWUAwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xG
 Y2AK021l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14
 v26r4UJVWxJr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x02
 67AKxVWxJr0_GcWln4kS14v26r126r1DM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6x
 kI12xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v2
 6r126r1DMcIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64
 vIr41lc7I2V7IY0VAS07AlzVAYIcxG8wCY1x0262kKe7AKxVW8ZVWrXwCF04k20xvY0x0E
 wIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AKxVWUAVWUtwC20s026c02F4
 0E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Wrv_Gr1U
 MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I
 0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8
 JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUaT
 a0DUUUU
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
Cc: linux-fbdev@vger.kernel.org, Cornelia Huck <cohuck@redhat.com>,
 Karol Herbst <kherbst@redhat.com>, dri-devel@lists.freedesktop.org,
 YiPeng Chai <YiPeng.Chai@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>, Likun Gao <Likun.Gao@amd.com>,
 Yi Liu <yi.l.liu@intel.com>, kvm@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Jason Gunthorpe <jgg@ziepe.ca>,
 Ben Skeggs <bskeggs@redhat.com>, Kevin Tian <kevin.tian@intel.com>,
 Lijo Lazar <lijo.lazar@amd.com>, Jani Nikula <jani.nikula@intel.com>,
 Bokun Zhang <Bokun.Zhang@amd.com>, intel-gfx@lists.freedesktop.org,
 Alex Williamson <alex.williamson@redhat.com>,
 Abhishek Sahu <abhsahu@nvidia.com>, Maxime Ripard <mripard@kernel.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Yishai Hadas <yishaih@nvidia.com>, Pan Xinhui <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Konig <christian.koenig@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,


Fixes: f6b1772b2555 ('vgaarb: remove the unused irq_set_state argument 
to vga_client_register')


Because after applied that patch, there have only one callback mechanism 
we can use, not two anymore.


On 2023/7/12 00:43, Sui Jingfeng wrote:
> From: Sui Jingfeng <suijingfeng@loongson.cn>
>
> Currently, the strategy of selecting the default boot on a multiple video
> card coexistence system is not perfect. Potential problems are:
>
> 1) This function is a no-op on non-x86 architectures.
> 2) It does not take the PCI Bar may get relocated into consideration.
> 3) It is not effective for the PCI device without a dedicated VRAM Bar.
> 4) It is device-agnostic, thus it has to waste the effort to iterate all
>     of the PCI Bar to find the VRAM aperture.
> 5) It has invented lots of methods to determine which one is the default
>     boot device, but this is still a policy because it doesn't give the
>     user a choice to override.
>
> With the observation that device drivers may have better knowledge about
> which PCI bar contains the firmware FB. This patch tries to solve the above
> problems by introducing a function callback to the vga_client_register()
> function interface. DRM device drivers for the PCI device could provide
> a xx_vga_is_primary_gpu() function callback during the driver loading time.
> Once the driver binds the device successfully, VRAARB will call back to
> the driver. This gives the device drivers a chance to provide accurate
> boot device identification. Which in turn unlock the abitration service
> to non-x86 architectures. A device driver can also just pass a NULL pointer
> to keep the original behavior.
>
> This patch is intended to introducing the mechanism only, the specific
> implementation is left to the authors of various device driver. Also honor
> the comment: "Clients have *TWO* callback mechanisms they can use"
>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Christian Konig <christian.koenig@amd.com>
> Cc: Pan Xinhui <Xinhui.Pan@amd.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> Cc: Ben Skeggs <bskeggs@redhat.com>
> Cc: Karol Herbst <kherbst@redhat.com>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Bjorn Helgaas <bhelgaas@google.com>
> Cc: Alex Williamson <alex.williamson@redhat.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Hawking Zhang <Hawking.Zhang@amd.com>
> Cc: Mario Limonciello <mario.limonciello@amd.com>
> Cc: Lijo Lazar <lijo.lazar@amd.com>
> Cc: YiPeng Chai <YiPeng.Chai@amd.com>
> Cc: Bokun Zhang <Bokun.Zhang@amd.com>
> Cc: Likun Gao <Likun.Gao@amd.com>
> Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
> Cc: Jason Gunthorpe <jgg@ziepe.ca>
> CC: Kevin Tian <kevin.tian@intel.com>
> Cc: Cornelia Huck <cohuck@redhat.com>
> Cc: Yishai Hadas <yishaih@nvidia.com>
> Cc: Abhishek Sahu <abhsahu@nvidia.com>
> Cc: Yi Liu <yi.l.liu@intel.com>
> Acked-by: Jani Nikula <jani.nikula@intel.com> # i915
> Reviewed-by: Lyude Paul <lyude@redhat.com> # nouveau
> Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |  2 +-
>   drivers/gpu/drm/i915/display/intel_vga.c   |  3 +-
>   drivers/gpu/drm/loongson/lsdc_drv.c        |  2 +-
>   drivers/gpu/drm/nouveau/nouveau_vga.c      |  2 +-
>   drivers/gpu/drm/radeon/radeon_device.c     |  2 +-
>   drivers/pci/vgaarb.c                       | 55 ++++++++++++++++++++--
>   drivers/vfio/pci/vfio_pci_core.c           |  2 +-
>   include/linux/vgaarb.h                     |  8 ++--
>   8 files changed, 61 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index a92c6189b4b6..d98f0801ac77 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -4103,7 +4103,7 @@ int amdgpu_device_init(struct amdgpu_device *adev,
>   	/* this will fail for cards that aren't VGA class devices, just
>   	 * ignore it */
>   	if ((adev->pdev->class >> 8) == PCI_CLASS_DISPLAY_VGA)
> -		vga_client_register(adev->pdev, amdgpu_device_vga_set_decode);
> +		vga_client_register(adev->pdev, amdgpu_device_vga_set_decode, NULL);
>   
>   	px = amdgpu_device_supports_px(ddev);
>   
> diff --git a/drivers/gpu/drm/i915/display/intel_vga.c b/drivers/gpu/drm/i915/display/intel_vga.c
> index 286a0bdd28c6..98d7d4dffe9f 100644
> --- a/drivers/gpu/drm/i915/display/intel_vga.c
> +++ b/drivers/gpu/drm/i915/display/intel_vga.c
> @@ -115,7 +115,6 @@ intel_vga_set_decode(struct pci_dev *pdev, bool enable_decode)
>   
>   int intel_vga_register(struct drm_i915_private *i915)
>   {
> -
>   	struct pci_dev *pdev = to_pci_dev(i915->drm.dev);
>   	int ret;
>   
> @@ -127,7 +126,7 @@ int intel_vga_register(struct drm_i915_private *i915)
>   	 * then we do not take part in VGA arbitration and the
>   	 * vga_client_register() fails with -ENODEV.
>   	 */
> -	ret = vga_client_register(pdev, intel_vga_set_decode);
> +	ret = vga_client_register(pdev, intel_vga_set_decode, NULL);
>   	if (ret && ret != -ENODEV)
>   		return ret;
>   
> diff --git a/drivers/gpu/drm/loongson/lsdc_drv.c b/drivers/gpu/drm/loongson/lsdc_drv.c
> index 188ec82afcfb..d10a28c2c494 100644
> --- a/drivers/gpu/drm/loongson/lsdc_drv.c
> +++ b/drivers/gpu/drm/loongson/lsdc_drv.c
> @@ -289,7 +289,7 @@ static int lsdc_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>   
>   	pci_set_drvdata(pdev, ddev);
>   
> -	vga_client_register(pdev, lsdc_vga_set_decode);
> +	vga_client_register(pdev, lsdc_vga_set_decode, NULL);
>   
>   	drm_kms_helper_poll_init(ddev);
>   
> diff --git a/drivers/gpu/drm/nouveau/nouveau_vga.c b/drivers/gpu/drm/nouveau/nouveau_vga.c
> index f8bf0ec26844..162b4f4676c7 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_vga.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_vga.c
> @@ -92,7 +92,7 @@ nouveau_vga_init(struct nouveau_drm *drm)
>   		return;
>   	pdev = to_pci_dev(dev->dev);
>   
> -	vga_client_register(pdev, nouveau_vga_set_decode);
> +	vga_client_register(pdev, nouveau_vga_set_decode, NULL);
>   
>   	/* don't register Thunderbolt eGPU with vga_switcheroo */
>   	if (pci_is_thunderbolt_attached(pdev))
> diff --git a/drivers/gpu/drm/radeon/radeon_device.c b/drivers/gpu/drm/radeon/radeon_device.c
> index afbb3a80c0c6..71f2ff39d6a1 100644
> --- a/drivers/gpu/drm/radeon/radeon_device.c
> +++ b/drivers/gpu/drm/radeon/radeon_device.c
> @@ -1425,7 +1425,7 @@ int radeon_device_init(struct radeon_device *rdev,
>   	/* if we have > 1 VGA cards, then disable the radeon VGA resources */
>   	/* this will fail for cards that aren't VGA class devices, just
>   	 * ignore it */
> -	vga_client_register(rdev->pdev, radeon_vga_set_decode);
> +	vga_client_register(rdev->pdev, radeon_vga_set_decode, NULL);
>   
>   	if (rdev->flags & RADEON_IS_PX)
>   		runtime = true;
> diff --git a/drivers/pci/vgaarb.c b/drivers/pci/vgaarb.c
> index 953daf731b2c..610ddcccef24 100644
> --- a/drivers/pci/vgaarb.c
> +++ b/drivers/pci/vgaarb.c
> @@ -53,6 +53,7 @@ struct vga_device {
>   	bool bridge_has_one_vga;
>   	bool is_firmware_default;	/* device selected by firmware */
>   	unsigned int (*set_decode)(struct pci_dev *pdev, bool decode);
> +	bool (*is_primary_gpu)(struct pci_dev *pdev);
>   };
>   
>   static LIST_HEAD(vga_list);
> @@ -958,6 +959,13 @@ EXPORT_SYMBOL(vga_set_legacy_decoding);
>    * @set_decode callback: If a client can disable its GPU VGA resource, it
>    * will get a callback from this to set the encode/decode state.
>    *
> + * @is_primary_gpu callback: call back to the device driver, query if a PCI
> + * GPU client is the primary display device, as device drivers (drm-based
> + * or fbdev-based) may have better knowledge if a specific device is the
> + * default boot device or should be the default boot device. But this
> + * callback is optional. A device driver can simply pass a NULL pointer to
> + * adhere to the original rules of arbitration.
> + *
>    * Rationale: we cannot disable VGA decode resources unconditionally, some
>    * single GPU laptops seem to require ACPI or BIOS access to the VGA registers
>    * to control things like backlights etc. Hopefully newer multi-GPU laptops do
> @@ -973,7 +981,8 @@ EXPORT_SYMBOL(vga_set_legacy_decoding);
>    * Returns: 0 on success, -1 on failure
>    */
>   int vga_client_register(struct pci_dev *pdev,
> -		unsigned int (*set_decode)(struct pci_dev *pdev, bool decode))
> +		unsigned int (*set_decode)(struct pci_dev *pdev, bool decode),
> +		bool (*is_primary_gpu)(struct pci_dev *pdev))
>   {
>   	int ret = -ENODEV;
>   	struct vga_device *vgadev;
> @@ -985,6 +994,7 @@ int vga_client_register(struct pci_dev *pdev,
>   		goto bail;
>   
>   	vgadev->set_decode = set_decode;
> +	vgadev->is_primary_gpu = is_primary_gpu;
>   	ret = 0;
>   
>   bail:
> @@ -1490,6 +1500,30 @@ static void vga_arbiter_notify_clients(void)
>   	spin_unlock_irqrestore(&vga_lock, flags);
>   }
>   
> +static void vga_arbiter_do_arbitration(struct pci_dev *pdev)
> +{
> +	struct vga_device *vgadev;
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&vga_lock, flags);
> +	list_for_each_entry(vgadev, &vga_list, list) {
> +		if (vgadev->pdev != pdev)
> +			continue;
> +
> +		/* This device already the boot device, do nothing */
> +		if (pdev == vga_default_device())
> +			break;
> +
> +		if (vgadev->is_primary_gpu) {
> +			if (vgadev->is_primary_gpu(pdev)) {
> +				vgaarb_info(&pdev->dev, "Overriding as primary GPU\n");
> +				vga_set_default_device(pdev);
> +			}
> +		}
> +	}
> +	spin_unlock_irqrestore(&vga_lock, flags);
> +}
> +
>   static int pci_notify(struct notifier_block *nb, unsigned long action,
>   		      void *data)
>   {
> @@ -1509,13 +1543,24 @@ static int pci_notify(struct notifier_block *nb, unsigned long action,
>   	 * cases of hotplugable vga cards.
>   	 */
>   
> -	if (action == BUS_NOTIFY_ADD_DEVICE)
> +	switch (action) {
> +	case BUS_NOTIFY_ADD_DEVICE:
>   		notify = vga_arbiter_add_pci_device(pdev);
> -	else if (action == BUS_NOTIFY_DEL_DEVICE)
> +		if (notify)
> +			vga_arbiter_notify_clients();
> +		break;
> +	case BUS_NOTIFY_DEL_DEVICE:
>   		notify = vga_arbiter_del_pci_device(pdev);
> +		if (notify)
> +			vga_arbiter_notify_clients();
> +		break;
> +	case BUS_NOTIFY_BOUND_DRIVER:
> +		vga_arbiter_do_arbitration(pdev);
> +		break;
> +	default:
> +		break;
> +	}
>   
> -	if (notify)
> -		vga_arbiter_notify_clients();
>   	return 0;
>   }
>   
> diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci_core.c
> index 20d7b69ea6ff..531c4d8ef26e 100644
> --- a/drivers/vfio/pci/vfio_pci_core.c
> +++ b/drivers/vfio/pci/vfio_pci_core.c
> @@ -2108,7 +2108,7 @@ static int vfio_pci_vga_init(struct vfio_pci_core_device *vdev)
>   	if (ret)
>   		return ret;
>   
> -	ret = vga_client_register(pdev, vfio_pci_set_decode);
> +	ret = vga_client_register(pdev, vfio_pci_set_decode, NULL);
>   	if (ret)
>   		return ret;
>   	vga_set_legacy_decoding(pdev, vfio_pci_set_decode(pdev, false));
> diff --git a/include/linux/vgaarb.h b/include/linux/vgaarb.h
> index 97129a1bbb7d..e4102be21f47 100644
> --- a/include/linux/vgaarb.h
> +++ b/include/linux/vgaarb.h
> @@ -33,7 +33,8 @@ struct pci_dev *vga_default_device(void);
>   void vga_set_default_device(struct pci_dev *pdev);
>   int vga_remove_vgacon(struct pci_dev *pdev);
>   int vga_client_register(struct pci_dev *pdev,
> -		unsigned int (*set_decode)(struct pci_dev *pdev, bool state));
> +		unsigned int (*set_decode)(struct pci_dev *pdev, bool state),
> +		bool (*is_primary_gpu)(struct pci_dev *pdev));
>   #else /* CONFIG_VGA_ARB */
>   static inline void vga_set_legacy_decoding(struct pci_dev *pdev,
>   		unsigned int decodes)
> @@ -59,7 +60,8 @@ static inline int vga_remove_vgacon(struct pci_dev *pdev)
>   	return 0;
>   }
>   static inline int vga_client_register(struct pci_dev *pdev,
> -		unsigned int (*set_decode)(struct pci_dev *pdev, bool state))
> +		unsigned int (*set_decode)(struct pci_dev *pdev, bool state),
> +		bool (*is_primary_gpu)(struct pci_dev *pdev))
>   {
>   	return 0;
>   }
> @@ -97,7 +99,7 @@ static inline int vga_get_uninterruptible(struct pci_dev *pdev,
>   
>   static inline void vga_client_unregister(struct pci_dev *pdev)
>   {
> -	vga_client_register(pdev, NULL);
> +	vga_client_register(pdev, NULL, NULL);
>   }
>   
>   #endif /* LINUX_VGA_H */

