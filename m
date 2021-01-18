Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 166502FA198
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jan 2021 14:31:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C01BE6E239;
	Mon, 18 Jan 2021 13:30:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90DCB6E1E8
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Jan 2021 13:30:57 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id e15so7383859wme.0
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Jan 2021 05:30:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=jKZnFPqAQknoSSGM20J7V5Zk4rueuE5g6IsVhaZxibA=;
 b=CxELPnjBVAd5r8SUXKjQxJH6+baAk7f2CDSKs4Acyt3vkMKDU7z4u2fkfharZMdmkH
 BRCgV8k7IJltjOC/41LEZSG1/zJUACiAMOZM+N/g/G8WoVJmKITc0joMO1VTm0I2SzHo
 EH8EXfPuvzPjFWbqu0PZXfg1i28N7GNV4+Lm4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=jKZnFPqAQknoSSGM20J7V5Zk4rueuE5g6IsVhaZxibA=;
 b=PsKKvi2Zxezb2yKgvkHGBXi+QBuWh80GGzp0J/jFIQzYgbjCR88XXFd56lkWuR1t4U
 Xna0cXZ/2W0SoAvMniTi8Bn4gnzfRoEH0w0HTNP+f58vV0o69I4BPh+/dD7iiIIQTRcU
 7uYNjiioh1zYaahoZxsVK3ilVztHYfdrW+JmuCZqYt8MBP3ZDoPeMcSudE5CeQIuasC8
 w+w04tqj0H0wwZXIC+QTPlroZHZinn/I+DURuKe7STlOn+sIu7PuzNfYesOjAyFKRDeh
 2g2SZ2ZY766WFpJ198taEAp5wJYLM4KE77pCIH/73sXyuolUs6xwhDPhERHzFPmmpdE1
 g7jA==
X-Gm-Message-State: AOAM532vvNkFyVGADgIZpQWMQLksRXCqBJ6VL/qY69uksgaqXMJhlUi/
 1GhNkNboClDTSFqDmhs+bW2Dmg==
X-Google-Smtp-Source: ABdhPJyxTQM5JPR8jr+XO/IUBtP4lOZYhj2oJrrjKZ1x6K11OME5G98jBYuI+aKLK2Qtx/6XAVSFjA==
X-Received: by 2002:a05:600c:2903:: with SMTP id
 i3mr20569295wmd.41.1610976656190; 
 Mon, 18 Jan 2021 05:30:56 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id w13sm29325709wrt.52.2021.01.18.05.30.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jan 2021 05:30:55 -0800 (PST)
Date: Mon, 18 Jan 2021 14:30:53 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v4 1/6] drm: Upcast struct drm_device.dev to struct
 pci_device; replace pdev
Message-ID: <YAWNjcXghNBocFeU@phenom.ffwll.local>
References: <20210118131420.15874-1-tzimmermann@suse.de>
 <20210118131420.15874-2-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210118131420.15874-2-tzimmermann@suse.de>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: airlied@linux.ie, Sam Ravnborg <sam@ravnborg.org>,
 intel-gfx@lists.freedesktop.org, sroland@vmware.com,
 linux-graphics-maintainer@vmware.com, dri-devel@lists.freedesktop.org,
 Andy Lavr <andy.lavr@gmail.com>, intel-gvt-dev@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 18, 2021 at 02:14:15PM +0100, Thomas Zimmermann wrote:
> We have DRM drivers based on USB, SPI and platform devices. All of them
> are fine with storing their device reference in struct drm_device.dev.
> PCI devices should be no exception. Therefore struct drm_device.pdev is
> deprecated.
> 
> Instead upcast from struct drm_device.dev with to_pci_dev(). PCI-specific
> code can use dev_is_pci() to test for a PCI device. This patch changes
> the DRM core code and documentation accordingly.
> 
> v4:
> 	* split-off pdev deprecation into separate patch
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Tested-by: Andy Lavr <andy.lavr@gmail.com>
> Acked-by: Sam Ravnborg <sam@ravnborg.org>

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/drm_agpsupport.c |  9 ++++++---
>  drivers/gpu/drm/drm_bufs.c       |  4 ++--
>  drivers/gpu/drm/drm_edid.c       |  7 ++++++-
>  drivers/gpu/drm/drm_irq.c        | 12 +++++++-----
>  drivers/gpu/drm/drm_pci.c        | 26 +++++++++++++++-----------
>  drivers/gpu/drm/drm_vm.c         |  2 +-
>  6 files changed, 37 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_agpsupport.c b/drivers/gpu/drm/drm_agpsupport.c
> index 8b690ef306de..7e765cb0efee 100644
> --- a/drivers/gpu/drm/drm_agpsupport.c
> +++ b/drivers/gpu/drm/drm_agpsupport.c
> @@ -103,11 +103,13 @@ int drm_agp_info_ioctl(struct drm_device *dev, void *data,
>   */
>  int drm_agp_acquire(struct drm_device *dev)
>  {
> +	struct pci_dev *pdev = to_pci_dev(dev->dev);
> +
>  	if (!dev->agp)
>  		return -ENODEV;
>  	if (dev->agp->acquired)
>  		return -EBUSY;
> -	dev->agp->bridge = agp_backend_acquire(dev->pdev);
> +	dev->agp->bridge = agp_backend_acquire(pdev);
>  	if (!dev->agp->bridge)
>  		return -ENODEV;
>  	dev->agp->acquired = 1;
> @@ -402,14 +404,15 @@ int drm_agp_free_ioctl(struct drm_device *dev, void *data,
>   */
>  struct drm_agp_head *drm_agp_init(struct drm_device *dev)
>  {
> +	struct pci_dev *pdev = to_pci_dev(dev->dev);
>  	struct drm_agp_head *head = NULL;
>  
>  	head = kzalloc(sizeof(*head), GFP_KERNEL);
>  	if (!head)
>  		return NULL;
> -	head->bridge = agp_find_bridge(dev->pdev);
> +	head->bridge = agp_find_bridge(pdev);
>  	if (!head->bridge) {
> -		head->bridge = agp_backend_acquire(dev->pdev);
> +		head->bridge = agp_backend_acquire(pdev);
>  		if (!head->bridge) {
>  			kfree(head);
>  			return NULL;
> diff --git a/drivers/gpu/drm/drm_bufs.c b/drivers/gpu/drm/drm_bufs.c
> index aeb1327e3077..e3d77dfefb0a 100644
> --- a/drivers/gpu/drm/drm_bufs.c
> +++ b/drivers/gpu/drm/drm_bufs.c
> @@ -326,7 +326,7 @@ static int drm_addmap_core(struct drm_device *dev, resource_size_t offset,
>  		 * As we're limiting the address to 2^32-1 (or less),
>  		 * casting it down to 32 bits is no problem, but we
>  		 * need to point to a 64bit variable first. */
> -		map->handle = dma_alloc_coherent(&dev->pdev->dev,
> +		map->handle = dma_alloc_coherent(dev->dev,
>  						 map->size,
>  						 &map->offset,
>  						 GFP_KERNEL);
> @@ -556,7 +556,7 @@ int drm_legacy_rmmap_locked(struct drm_device *dev, struct drm_local_map *map)
>  	case _DRM_SCATTER_GATHER:
>  		break;
>  	case _DRM_CONSISTENT:
> -		dma_free_coherent(&dev->pdev->dev,
> +		dma_free_coherent(dev->dev,
>  				  map->size,
>  				  map->handle,
>  				  map->offset);
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 394cc55b3214..c2bbe7bee7b6 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -32,6 +32,7 @@
>  #include <linux/i2c.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
> +#include <linux/pci.h>
>  #include <linux/slab.h>
>  #include <linux/vga_switcheroo.h>
>  
> @@ -2075,9 +2076,13 @@ EXPORT_SYMBOL(drm_get_edid);
>  struct edid *drm_get_edid_switcheroo(struct drm_connector *connector,
>  				     struct i2c_adapter *adapter)
>  {
> -	struct pci_dev *pdev = connector->dev->pdev;
> +	struct drm_device *dev = connector->dev;
> +	struct pci_dev *pdev = to_pci_dev(dev->dev);
>  	struct edid *edid;
>  
> +	if (drm_WARN_ON_ONCE(dev, !dev_is_pci(dev->dev)))
> +		return NULL;
> +
>  	vga_switcheroo_lock_ddc(pdev);
>  	edid = drm_get_edid(connector, adapter);
>  	vga_switcheroo_unlock_ddc(pdev);
> diff --git a/drivers/gpu/drm/drm_irq.c b/drivers/gpu/drm/drm_irq.c
> index 803af4bbd214..c3bd664ea733 100644
> --- a/drivers/gpu/drm/drm_irq.c
> +++ b/drivers/gpu/drm/drm_irq.c
> @@ -122,7 +122,7 @@ int drm_irq_install(struct drm_device *dev, int irq)
>  		dev->driver->irq_preinstall(dev);
>  
>  	/* PCI devices require shared interrupts. */
> -	if (dev->pdev)
> +	if (dev_is_pci(dev->dev))
>  		sh_flags = IRQF_SHARED;
>  
>  	ret = request_irq(irq, dev->driver->irq_handler,
> @@ -140,7 +140,7 @@ int drm_irq_install(struct drm_device *dev, int irq)
>  	if (ret < 0) {
>  		dev->irq_enabled = false;
>  		if (drm_core_check_feature(dev, DRIVER_LEGACY))
> -			vga_client_register(dev->pdev, NULL, NULL, NULL);
> +			vga_client_register(to_pci_dev(dev->dev), NULL, NULL, NULL);
>  		free_irq(irq, dev);
>  	} else {
>  		dev->irq = irq;
> @@ -203,7 +203,7 @@ int drm_irq_uninstall(struct drm_device *dev)
>  	DRM_DEBUG("irq=%d\n", dev->irq);
>  
>  	if (drm_core_check_feature(dev, DRIVER_LEGACY))
> -		vga_client_register(dev->pdev, NULL, NULL, NULL);
> +		vga_client_register(to_pci_dev(dev->dev), NULL, NULL, NULL);
>  
>  	if (dev->driver->irq_uninstall)
>  		dev->driver->irq_uninstall(dev);
> @@ -252,6 +252,7 @@ int drm_legacy_irq_control(struct drm_device *dev, void *data,
>  {
>  	struct drm_control *ctl = data;
>  	int ret = 0, irq;
> +	struct pci_dev *pdev;
>  
>  	/* if we haven't irq we fallback for compatibility reasons -
>  	 * this used to be a separate function in drm_dma.h
> @@ -262,12 +263,13 @@ int drm_legacy_irq_control(struct drm_device *dev, void *data,
>  	if (!drm_core_check_feature(dev, DRIVER_LEGACY))
>  		return 0;
>  	/* UMS was only ever supported on pci devices. */
> -	if (WARN_ON(!dev->pdev))
> +	if (WARN_ON(!dev_is_pci(dev->dev)))
>  		return -EINVAL;
>  
>  	switch (ctl->func) {
>  	case DRM_INST_HANDLER:
> -		irq = dev->pdev->irq;
> +		pdev = to_pci_dev(dev->dev);
> +		irq = pdev->irq;
>  
>  		if (dev->if_version < DRM_IF_VERSION(1, 2) &&
>  		    ctl->irq != irq)
> diff --git a/drivers/gpu/drm/drm_pci.c b/drivers/gpu/drm/drm_pci.c
> index 5370e6b492fd..2294a1580d35 100644
> --- a/drivers/gpu/drm/drm_pci.c
> +++ b/drivers/gpu/drm/drm_pci.c
> @@ -70,7 +70,7 @@ drm_dma_handle_t *drm_pci_alloc(struct drm_device * dev, size_t size, size_t ali
>  		return NULL;
>  
>  	dmah->size = size;
> -	dmah->vaddr = dma_alloc_coherent(&dev->pdev->dev, size,
> +	dmah->vaddr = dma_alloc_coherent(dev->dev, size,
>  					 &dmah->busaddr,
>  					 GFP_KERNEL);
>  
> @@ -93,7 +93,7 @@ EXPORT_SYMBOL(drm_pci_alloc);
>   */
>  void drm_pci_free(struct drm_device * dev, drm_dma_handle_t * dmah)
>  {
> -	dma_free_coherent(&dev->pdev->dev, dmah->size, dmah->vaddr,
> +	dma_free_coherent(dev->dev, dmah->size, dmah->vaddr,
>  			  dmah->busaddr);
>  	kfree(dmah);
>  }
> @@ -112,16 +112,18 @@ static int drm_get_pci_domain(struct drm_device *dev)
>  		return 0;
>  #endif /* __alpha__ */
>  
> -	return pci_domain_nr(dev->pdev->bus);
> +	return pci_domain_nr(to_pci_dev(dev->dev)->bus);
>  }
>  
>  int drm_pci_set_busid(struct drm_device *dev, struct drm_master *master)
>  {
> +	struct pci_dev *pdev = to_pci_dev(dev->dev);
> +
>  	master->unique = kasprintf(GFP_KERNEL, "pci:%04x:%02x:%02x.%d",
>  					drm_get_pci_domain(dev),
> -					dev->pdev->bus->number,
> -					PCI_SLOT(dev->pdev->devfn),
> -					PCI_FUNC(dev->pdev->devfn));
> +					pdev->bus->number,
> +					PCI_SLOT(pdev->devfn),
> +					PCI_FUNC(pdev->devfn));
>  	if (!master->unique)
>  		return -ENOMEM;
>  
> @@ -131,12 +133,14 @@ int drm_pci_set_busid(struct drm_device *dev, struct drm_master *master)
>  
>  static int drm_pci_irq_by_busid(struct drm_device *dev, struct drm_irq_busid *p)
>  {
> +	struct pci_dev *pdev = to_pci_dev(dev->dev);
> +
>  	if ((p->busnum >> 8) != drm_get_pci_domain(dev) ||
> -	    (p->busnum & 0xff) != dev->pdev->bus->number ||
> -	    p->devnum != PCI_SLOT(dev->pdev->devfn) || p->funcnum != PCI_FUNC(dev->pdev->devfn))
> +	    (p->busnum & 0xff) != pdev->bus->number ||
> +	    p->devnum != PCI_SLOT(pdev->devfn) || p->funcnum != PCI_FUNC(pdev->devfn))
>  		return -EINVAL;
>  
> -	p->irq = dev->pdev->irq;
> +	p->irq = pdev->irq;
>  
>  	DRM_DEBUG("%d:%d:%d => IRQ %d\n", p->busnum, p->devnum, p->funcnum,
>  		  p->irq);
> @@ -164,7 +168,7 @@ int drm_legacy_irq_by_busid(struct drm_device *dev, void *data,
>  		return -EOPNOTSUPP;
>  
>  	/* UMS was only ever support on PCI devices. */
> -	if (WARN_ON(!dev->pdev))
> +	if (WARN_ON(!dev_is_pci(dev->dev)))
>  		return -EINVAL;
>  
>  	if (!drm_core_check_feature(dev, DRIVER_HAVE_IRQ))
> @@ -188,7 +192,7 @@ void drm_pci_agp_destroy(struct drm_device *dev)
>  static void drm_pci_agp_init(struct drm_device *dev)
>  {
>  	if (drm_core_check_feature(dev, DRIVER_USE_AGP)) {
> -		if (pci_find_capability(dev->pdev, PCI_CAP_ID_AGP))
> +		if (pci_find_capability(to_pci_dev(dev->dev), PCI_CAP_ID_AGP))
>  			dev->agp = drm_agp_init(dev);
>  		if (dev->agp) {
>  			dev->agp->agp_mtrr = arch_phys_wc_add(
> diff --git a/drivers/gpu/drm/drm_vm.c b/drivers/gpu/drm/drm_vm.c
> index 6d5a03b32238..9b3b989d7cad 100644
> --- a/drivers/gpu/drm/drm_vm.c
> +++ b/drivers/gpu/drm/drm_vm.c
> @@ -278,7 +278,7 @@ static void drm_vm_shm_close(struct vm_area_struct *vma)
>  			case _DRM_SCATTER_GATHER:
>  				break;
>  			case _DRM_CONSISTENT:
> -				dma_free_coherent(&dev->pdev->dev,
> +				dma_free_coherent(dev->dev,
>  						  map->size,
>  						  map->handle,
>  						  map->offset);
> -- 
> 2.29.2
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
