Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 470BC73FDAD
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jun 2023 16:21:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0668E10E2EC;
	Tue, 27 Jun 2023 14:21:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id DED5B10E2E9;
 Tue, 27 Jun 2023 14:21:16 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8AxycVb8JpkzyYDAA--.4892S3;
 Tue, 27 Jun 2023 22:21:15 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8BxB81Z8JpkJlkMAA--.41429S3; 
 Tue, 27 Jun 2023 22:21:13 +0800 (CST)
Message-ID: <8da62fff-5402-db70-eae5-9174e6753fc7@loongson.cn>
Date: Tue, 27 Jun 2023 22:21:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v7 5/8] video/aperture: Add a helper to detect if an
 aperture contains firmware FB
Content-Language: en-US
To: Sui Jingfeng <15330273260@189.cn>, Bjorn Helgaas <bhelgaas@google.com>
References: <20230613030151.216625-1-15330273260@189.cn>
 <20230613030151.216625-6-15330273260@189.cn>
From: Sui Jingfeng <suijingfeng@loongson.cn>
Organization: Loongson
In-Reply-To: <20230613030151.216625-6-15330273260@189.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8BxB81Z8JpkJlkMAA--.41429S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoWxuw1UtrW3tryktry5GFyUArc_yoW7tr1UpF
 sxAFZ8Gr4UKF1Fyay3CrWI9r4rXa1SqFWrW39xA3s3AF17AFykJr17ZFyDJrZxJrZrAa4a
 grZxtryrCa1DAFXCm3ZEXasCq-sJn29KB7ZKAUJUUUU3529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUUPvb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
 xVW8Jr0_Cr1UM2kKe7AKxVWUAVWUtwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
 AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
 tVWrXwAv7VC2z280aVAFwI0_Cr0_Gr1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwI
 xGrwCYjI0SjxkI62AI1cAE67vIY487MxkF7I0En4kS14v26r126r1DMxAIw28IcxkI7VAK
 I48JMxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v26r126r1DMI8I3I0E5I8CrV
 AFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCI
 c40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26ryj6F1UMIIF0xvE2Ix0cI8IcVCY1x0267
 AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Cr0_
 Gr1UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvjxU28
 nYUUUUU
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
Cc: Maxime Ripard <mripard@kernel.org>, linux-fbdev@vger.kernel.org,
 kvm@vger.kernel.org, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Javier Martinez Canillas <javierm@redhat.com>,
 amd-gfx@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-pci@vger.kernel.org, Helge Deller <deller@gmx.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

  PING ?

On 2023/6/13 11:01, Sui Jingfeng wrote:
> From: Sui Jingfeng <suijingfeng@loongson.cn>
>
> This patch adds the aperture_contain_firmware_fb() function to do the
> determination. Unfortunately due to the fact that apertures list will be
> freed dynamically, the location and size information of the firmware fb
> will be lost after dedicated drivers call
> aperture_remove_conflicting_devices(),
> aperture_remove_conflicting_pci_devices() or
> aperture_remove_all_conflicting_devices() functions
>
> We handle this problem by introducing two static variables which record the
> firmware framebuffer's start addrness and end addrness. It assumes that the
> system has only one active firmware framebuffer driver at a time.
>
> We don't use the global structure screen_info here, because PCI resource
> may get reallocated(the VRAM BAR could be moved) at kernel boot stage.
>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Javier Martinez Canillas <javierm@redhat.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Helge Deller <deller@gmx.de>
> Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
> ---
>   drivers/gpu/drm/drm_aperture.c | 16 ++++++++++++++++
>   drivers/video/aperture.c       | 29 +++++++++++++++++++++++++++++
>   include/drm/drm_aperture.h     |  2 ++
>   include/linux/aperture.h       |  7 +++++++
>   4 files changed, 54 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_aperture.c b/drivers/gpu/drm/drm_aperture.c
> index 5729f3bb4398..6e5d8a08683c 100644
> --- a/drivers/gpu/drm/drm_aperture.c
> +++ b/drivers/gpu/drm/drm_aperture.c
> @@ -190,3 +190,19 @@ int drm_aperture_remove_conflicting_pci_framebuffers(struct pci_dev *pdev,
>   	return aperture_remove_conflicting_pci_devices(pdev, req_driver->name);
>   }
>   EXPORT_SYMBOL(drm_aperture_remove_conflicting_pci_framebuffers);
> +
> +/**
> + * drm_aperture_contain_firmware_fb - Determine if a aperture contains firmware framebuffer
> + *
> + * @base: the aperture's base address in physical memory
> + * @size: aperture size in bytes
> + *
> + * Returns:
> + * true on if there is a firmware framebuffer belong to the aperture passed in,
> + * or false otherwise.
> + */
> +bool drm_aperture_contain_firmware_fb(resource_size_t base, resource_size_t size)
> +{
> +	return aperture_contain_firmware_fb(base, base + size);
> +}
> +EXPORT_SYMBOL(drm_aperture_contain_firmware_fb);
> diff --git a/drivers/video/aperture.c b/drivers/video/aperture.c
> index 561be8feca96..5a5422cec669 100644
> --- a/drivers/video/aperture.c
> +++ b/drivers/video/aperture.c
> @@ -141,6 +141,9 @@ struct aperture_range {
>   static LIST_HEAD(apertures);
>   static DEFINE_MUTEX(apertures_lock);
>   
> +static resource_size_t firm_fb_start;
> +static resource_size_t firm_fb_end;
> +
>   static bool overlap(resource_size_t base1, resource_size_t end1,
>   		    resource_size_t base2, resource_size_t end2)
>   {
> @@ -170,6 +173,9 @@ static int devm_aperture_acquire(struct device *dev,
>   
>   	mutex_lock(&apertures_lock);
>   
> +	firm_fb_start = base;
> +	firm_fb_end = end;
> +
>   	list_for_each(pos, &apertures) {
>   		ap = container_of(pos, struct aperture_range, lh);
>   		if (overlap(base, end, ap->base, ap->base + ap->size)) {
> @@ -377,3 +383,26 @@ int aperture_remove_conflicting_pci_devices(struct pci_dev *pdev, const char *na
>   
>   }
>   EXPORT_SYMBOL(aperture_remove_conflicting_pci_devices);
> +
> +/**
> + * aperture_contain_firmware_fb - Detect if the firmware framebuffer belong to
> + *                                a aperture.
> + * @ap_start: the aperture's start address in physical memory
> + * @ap_end: the aperture's end address in physical memory
> + *
> + * Returns:
> + * true on if there is a firmware framebuffer belong to the aperture passed in,
> + * or false otherwise.
> + */
> +bool aperture_contain_firmware_fb(resource_size_t ap_start, resource_size_t ap_end)
> +{
> +	/* No firmware framebuffer support */
> +	if (!firm_fb_start || !firm_fb_end)
> +		return false;
> +
> +	if (firm_fb_start >= ap_start && firm_fb_end <= ap_end)
> +		return true;
> +
> +	return false;
> +}
> +EXPORT_SYMBOL(aperture_contain_firmware_fb);
> diff --git a/include/drm/drm_aperture.h b/include/drm/drm_aperture.h
> index cbe33b49fd5d..6a0b9bacb081 100644
> --- a/include/drm/drm_aperture.h
> +++ b/include/drm/drm_aperture.h
> @@ -35,4 +35,6 @@ drm_aperture_remove_framebuffers(const struct drm_driver *req_driver)
>   							    req_driver);
>   }
>   
> +bool drm_aperture_contain_firmware_fb(resource_size_t base, resource_size_t size);
> +
>   #endif
> diff --git a/include/linux/aperture.h b/include/linux/aperture.h
> index 1a9a88b11584..d4dc5917c49b 100644
> --- a/include/linux/aperture.h
> +++ b/include/linux/aperture.h
> @@ -19,6 +19,8 @@ int aperture_remove_conflicting_devices(resource_size_t base, resource_size_t si
>   int __aperture_remove_legacy_vga_devices(struct pci_dev *pdev);
>   
>   int aperture_remove_conflicting_pci_devices(struct pci_dev *pdev, const char *name);
> +
> +bool aperture_contain_firmware_fb(resource_size_t ap_start, resource_size_t ap_end);
>   #else
>   static inline int devm_aperture_acquire_for_platform_device(struct platform_device *pdev,
>   							    resource_size_t base,
> @@ -42,6 +44,11 @@ static inline int aperture_remove_conflicting_pci_devices(struct pci_dev *pdev,
>   {
>   	return 0;
>   }
> +
> +static inline bool aperture_contain_firmware_fb(resource_size_t ap_start, resource_size_t ap_end)
> +{
> +	return false;
> +}
>   #endif
>   
>   /**

-- 
Jingfeng

