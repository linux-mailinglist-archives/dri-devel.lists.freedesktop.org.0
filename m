Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2797C3BC7C2
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jul 2021 10:22:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF44F89885;
	Tue,  6 Jul 2021 08:21:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E23AD89885
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jul 2021 08:21:56 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id u8so24970957wrq.8
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Jul 2021 01:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Bo54FfXv6rPJpYqoOIsZYNbtKh3+hspeGROQqF8pl3I=;
 b=ORN85oagfnMDknFS2EHgn9msr6nXk1CfbJvFweRXiT1Ko7SGPLy4KT4ieItrI7Mqyk
 9gH9r2k6fx1VKW/wTKuRx2eZJGILh5q6gd2DyZOYOmj1r06BBqqOtBtgm8tdhedpSVqF
 0aUzTcios1Q43HcIrFnHhO3gNirHSckKkcOtk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Bo54FfXv6rPJpYqoOIsZYNbtKh3+hspeGROQqF8pl3I=;
 b=R8e8dh+xTdsAk5PdUexhE6vFASpqqR26rNU1wFi7kImC3lANO0NNEpVU90OuBwavxW
 PLUPLadJxn8AWU2jHnxfYIiswxX1lWA+eGJCbY2CyHEWeavDavWpGGQf4qP5iaMltnOy
 RbSkc4Mdi8v9mXKdl4+5AUmPzbSpCgBXV/6z1iUAjvy78e/VKqIiDVuoNvLgq6z3veBt
 HmmrV8QdxVk984O3HRQmnsafWy8w6Gdmm2YI8BcllTsmsWyRnpYUIvXDGDaDMmdFCws9
 tLXV2yRqI/oBjmicJsYEHGknaFpEfwLMNdvOTWiGCV9YSphTveIzTQCQvmUKvj0TBt37
 zrOQ==
X-Gm-Message-State: AOAM531PIkWWtdUmoURdIhDLQaZ3JL2u1RErAx2VIqdsO0NiVJzHE0nW
 cCXT9ft57xvwqsQ/sRDbLLX3DapHZnyW4w==
X-Google-Smtp-Source: ABdhPJwemNY8jYebg1slsChfmgAPVDvFNDL1YiCrQSXL2eLiApJcnd4S38sqU0tGIyrhgZVQvBo6KQ==
X-Received: by 2002:a5d:4e08:: with SMTP id p8mr20388502wrt.425.1625559715594; 
 Tue, 06 Jul 2021 01:21:55 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id a9sm16132143wrn.8.2021.07.06.01.21.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 01:21:54 -0700 (PDT)
Date: Tue, 6 Jul 2021 10:21:53 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Huacai Chen <chenhuacai@loongson.cn>
Subject: Re: [PATCH] vgaarb: Rework default VGA device selection
Message-ID: <YOQSoQgFn/t4TzX5@phenom.ffwll.local>
References: <20210705100503.1120643-1-chenhuacai@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210705100503.1120643-1-chenhuacai@loongson.cn>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
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
Cc: David Airlie <airlied@linux.ie>, Bjorn Helgaas <bhelgaas@google.com>,
 Xuefeng Li <lixuefeng@loongson.cn>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 05, 2021 at 06:05:03PM +0800, Huacai Chen wrote:
> Currently, vga_arb_device_init() selects the first probed VGA device
> with VGA legacy resources enabled as the default device. However, some
> BMC-based VGA cards (e.g., AST2500 and HiSilicon D05) don't enable VGA
> legacy resources because their built-in upstream bridges don't support
> PCI_BRIDGE_CTL_VGA. This makes "no default VGA card" and breaks X.org
> auto-detection.
> 
> Commit a37c0f48950b56f6ef2e ("vgaarb: Select a default VGA device even
> if there's no legacy VGA") try to solve this problem but fails on some
> platforms, because it relies on the initcall order:
> 
> We should call vga_arb_device_init() after PCI enumeration, otherwise it
> may fail to select the default VGA device. Since vga_arb_device_init()
> and PCI enumeration function (i.e., pcibios_init() or acpi_init()) are
> both wrapped by subsys_initcall(), their sequence is not assured. So, it
> is possible to use subsys_initcall_sync() instead of subsys_initcall()
> to wrap vga_arb_device_init().
> 
> However, the above approach still has drawbacks, it cannot handle the
> cases that a VGA card is hot-plugged, or the gpu driver is compiled as a
> module.
> 
> So, as suggested by Bjorn Helgaas, this patch rework the selection:
> 1, Remove direct vga_arb_select_default_device() calls in vga_arb_
>    device_init().
> 2, Rename vga_arb_select_default_device() to vga_arb_update_default_
>    device(), which selects the first probed VGA device as the default
>    (whether legacy resources enabled or not), and update the default
>    device if a better one is found (device with legacy resources enabled
>    is better, device owns the firmware framebuffer is even better).
> 3, Every time a new VGA device is probed, vga_arbiter_add_pci_device()
>    is called, and vga_arb_update_default_device() is also called. So the
>    hotplug case and the module case can also be handled.
> 
> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>

Sounds reasonable, but because this is defacto pci stuff that just isn't
in drivers/pci (maybe we should move it) I'll defer to Bjorn's review
before I apply this patch.
-Daniel

> ---
>  drivers/gpu/vga/vgaarb.c | 219 +++++++++++++++++----------------------
>  1 file changed, 97 insertions(+), 122 deletions(-)
> 
> diff --git a/drivers/gpu/vga/vgaarb.c b/drivers/gpu/vga/vgaarb.c
> index 949fde433ea2..07770aae3aaf 100644
> --- a/drivers/gpu/vga/vgaarb.c
> +++ b/drivers/gpu/vga/vgaarb.c
> @@ -586,6 +586,97 @@ void vga_put(struct pci_dev *pdev, unsigned int rsrc)
>  }
>  EXPORT_SYMBOL(vga_put);
>  
> +#if defined(CONFIG_ACPI)
> +static bool vga_arb_integrated_gpu(struct device *dev)
> +{
> +	struct acpi_device *adev = ACPI_COMPANION(dev);
> +
> +	return adev && !strcmp(acpi_device_hid(adev), ACPI_VIDEO_HID);
> +}
> +#else
> +static bool vga_arb_integrated_gpu(struct device *dev)
> +{
> +	return false;
> +}
> +#endif
> +
> +static void vga_arb_update_default_device(struct vga_device *vgadev)
> +{
> +	struct pci_dev *pdev = vgadev->pdev;
> +	struct device *dev = &pdev->dev;
> +	struct vga_device *vgadev_default;
> +#if defined(CONFIG_X86) || defined(CONFIG_IA64)
> +	int i;
> +	unsigned long flags;
> +	u64 base = screen_info.lfb_base;
> +	u64 size = screen_info.lfb_size;
> +	u64 limit;
> +	resource_size_t start, end;
> +#endif
> +
> +	/* Deal with VGA default device. Use first enabled one
> +	 * by default if arch doesn't have it's own hook
> +	 */
> +	if (!vga_default_device()) {
> +		if ((vgadev->owns & VGA_RSRC_LEGACY_MASK) == VGA_RSRC_LEGACY_MASK)
> +			vgaarb_info(dev, "setting as boot VGA device\n");
> +		else
> +			vgaarb_info(dev, "setting as boot device (VGA legacy resources not available)\n");
> +		vga_set_default_device(pdev);
> +	}
> +
> +	vgadev_default = vgadev_find(vga_default);
> +
> +	/* Overridden by a better device */
> +	if (vgadev_default && ((vgadev_default->owns & VGA_RSRC_LEGACY_MASK) == 0)
> +		&& ((vgadev->owns & VGA_RSRC_LEGACY_MASK) == VGA_RSRC_LEGACY_MASK)) {
> +		vgaarb_info(dev, "overriding boot VGA device\n");
> +		vga_set_default_device(pdev);
> +	}
> +
> +	if (vga_arb_integrated_gpu(dev)) {
> +		vgaarb_info(dev, "overriding boot VGA device\n");
> +		vga_set_default_device(pdev);
> +	}
> +
> +#if defined(CONFIG_X86) || defined(CONFIG_IA64)
> +	if (screen_info.capabilities & VIDEO_CAPABILITY_64BIT_BASE)
> +		base |= (u64)screen_info.ext_lfb_base << 32;
> +
> +	limit = base + size;
> +
> +	/*
> +	 * Override vga_arbiter_add_pci_device()'s I/O based detection
> +	 * as it may take the wrong device (e.g. on Apple system under
> +	 * EFI).
> +	 *
> +	 * Select the device owning the boot framebuffer if there is
> +	 * one.
> +	 */
> +
> +	/* Does firmware framebuffer belong to us? */
> +	for (i = 0; i < DEVICE_COUNT_RESOURCE; i++) {
> +		flags = pci_resource_flags(vgadev->pdev, i);
> +
> +		if ((flags & IORESOURCE_MEM) == 0)
> +			continue;
> +
> +		start = pci_resource_start(vgadev->pdev, i);
> +		end  = pci_resource_end(vgadev->pdev, i);
> +
> +		if (!start || !end)
> +			continue;
> +
> +		if (base < start || limit >= end)
> +			continue;
> +
> +		if (vgadev->pdev != vga_default_device())
> +			vgaarb_info(dev, "overriding boot device\n");
> +		vga_set_default_device(vgadev->pdev);
> +	}
> +#endif
> +}
> +
>  /*
>   * Rules for using a bridge to control a VGA descendant decoding: if a bridge
>   * has only one VGA descendant then it can be used to control the VGA routing
> @@ -643,6 +734,11 @@ static void vga_arbiter_check_bridge_sharing(struct vga_device *vgadev)
>  		}
>  		new_bus = new_bus->parent;
>  	}
> +
> +	if (vgadev->bridge_has_one_vga == true)
> +		vgaarb_info(&vgadev->pdev->dev, "bridge control possible\n");
> +	else
> +		vgaarb_info(&vgadev->pdev->dev, "no bridge control possible\n");
>  }
>  
>  /*
> @@ -713,15 +809,7 @@ static bool vga_arbiter_add_pci_device(struct pci_dev *pdev)
>  		bus = bus->parent;
>  	}
>  
> -	/* Deal with VGA default device. Use first enabled one
> -	 * by default if arch doesn't have it's own hook
> -	 */
> -	if (vga_default == NULL &&
> -	    ((vgadev->owns & VGA_RSRC_LEGACY_MASK) == VGA_RSRC_LEGACY_MASK)) {
> -		vgaarb_info(&pdev->dev, "setting as boot VGA device\n");
> -		vga_set_default_device(pdev);
> -	}
> -
> +	vga_arb_update_default_device(vgadev);
>  	vga_arbiter_check_bridge_sharing(vgadev);
>  
>  	/* Add to the list */
> @@ -1451,111 +1539,10 @@ static struct miscdevice vga_arb_device = {
>  	MISC_DYNAMIC_MINOR, "vga_arbiter", &vga_arb_device_fops
>  };
>  
> -#if defined(CONFIG_ACPI)
> -static bool vga_arb_integrated_gpu(struct device *dev)
> -{
> -	struct acpi_device *adev = ACPI_COMPANION(dev);
> -
> -	return adev && !strcmp(acpi_device_hid(adev), ACPI_VIDEO_HID);
> -}
> -#else
> -static bool vga_arb_integrated_gpu(struct device *dev)
> -{
> -	return false;
> -}
> -#endif
> -
> -static void __init vga_arb_select_default_device(void)
> -{
> -	struct pci_dev *pdev, *found = NULL;
> -	struct vga_device *vgadev;
> -
> -#if defined(CONFIG_X86) || defined(CONFIG_IA64)
> -	u64 base = screen_info.lfb_base;
> -	u64 size = screen_info.lfb_size;
> -	u64 limit;
> -	resource_size_t start, end;
> -	unsigned long flags;
> -	int i;
> -
> -	if (screen_info.capabilities & VIDEO_CAPABILITY_64BIT_BASE)
> -		base |= (u64)screen_info.ext_lfb_base << 32;
> -
> -	limit = base + size;
> -
> -	list_for_each_entry(vgadev, &vga_list, list) {
> -		struct device *dev = &vgadev->pdev->dev;
> -		/*
> -		 * Override vga_arbiter_add_pci_device()'s I/O based detection
> -		 * as it may take the wrong device (e.g. on Apple system under
> -		 * EFI).
> -		 *
> -		 * Select the device owning the boot framebuffer if there is
> -		 * one.
> -		 */
> -
> -		/* Does firmware framebuffer belong to us? */
> -		for (i = 0; i < DEVICE_COUNT_RESOURCE; i++) {
> -			flags = pci_resource_flags(vgadev->pdev, i);
> -
> -			if ((flags & IORESOURCE_MEM) == 0)
> -				continue;
> -
> -			start = pci_resource_start(vgadev->pdev, i);
> -			end  = pci_resource_end(vgadev->pdev, i);
> -
> -			if (!start || !end)
> -				continue;
> -
> -			if (base < start || limit >= end)
> -				continue;
> -
> -			if (!vga_default_device())
> -				vgaarb_info(dev, "setting as boot device\n");
> -			else if (vgadev->pdev != vga_default_device())
> -				vgaarb_info(dev, "overriding boot device\n");
> -			vga_set_default_device(vgadev->pdev);
> -		}
> -	}
> -#endif
> -
> -	if (!vga_default_device()) {
> -		list_for_each_entry_reverse(vgadev, &vga_list, list) {
> -			struct device *dev = &vgadev->pdev->dev;
> -			u16 cmd;
> -
> -			pdev = vgadev->pdev;
> -			pci_read_config_word(pdev, PCI_COMMAND, &cmd);
> -			if (cmd & (PCI_COMMAND_IO | PCI_COMMAND_MEMORY)) {
> -				found = pdev;
> -				if (vga_arb_integrated_gpu(dev))
> -					break;
> -			}
> -		}
> -	}
> -
> -	if (found) {
> -		vgaarb_info(&found->dev, "setting as boot device (VGA legacy resources not available)\n");
> -		vga_set_default_device(found);
> -		return;
> -	}
> -
> -	if (!vga_default_device()) {
> -		vgadev = list_first_entry_or_null(&vga_list,
> -						  struct vga_device, list);
> -		if (vgadev) {
> -			struct device *dev = &vgadev->pdev->dev;
> -			vgaarb_info(dev, "setting as boot device (VGA legacy resources not available)\n");
> -			vga_set_default_device(vgadev->pdev);
> -		}
> -	}
> -}
> -
>  static int __init vga_arb_device_init(void)
>  {
>  	int rc;
>  	struct pci_dev *pdev;
> -	struct vga_device *vgadev;
>  
>  	rc = misc_register(&vga_arb_device);
>  	if (rc < 0)
> @@ -1571,18 +1558,6 @@ static int __init vga_arb_device_init(void)
>  			       PCI_ANY_ID, pdev)) != NULL)
>  		vga_arbiter_add_pci_device(pdev);
>  
> -	list_for_each_entry(vgadev, &vga_list, list) {
> -		struct device *dev = &vgadev->pdev->dev;
> -
> -		if (vgadev->bridge_has_one_vga)
> -			vgaarb_info(dev, "bridge control possible\n");
> -		else
> -			vgaarb_info(dev, "no bridge control possible\n");
> -	}
> -
> -	vga_arb_select_default_device();
> -
> -	pr_info("loaded\n");
>  	return rc;
>  }
>  subsys_initcall(vga_arb_device_init);
> -- 
> 2.27.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
