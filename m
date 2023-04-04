Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F4E6D62A7
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 15:21:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5999A10E079;
	Tue,  4 Apr 2023 13:21:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com
 [IPv6:2001:4860:4864:20::34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 732E610E079
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Apr 2023 13:21:08 +0000 (UTC)
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-17e140619fdso34457996fac.11
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Apr 2023 06:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1680614466;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=K+F4rCah4JtOzHbfyq5oZtwQO9PPoLtwo680gha6DKY=;
 b=K5ZCHhFPCZQbNKupQk8gXaHuVssYD+It3NWFscmSBAVqW+6phRgPUwIbkEnCpaq+MJ
 6xS9DMezNlm//cH5vuNVKQOwU7+wfV5SvlpepOaWHur18aFqo9MzqEY0bmuxb+Ek4qwn
 pR963GQPGjTxxPxTnpe7ZT4suU7+8/iCF7FLE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680614466;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=K+F4rCah4JtOzHbfyq5oZtwQO9PPoLtwo680gha6DKY=;
 b=p8liGy/gDxm/dPmwzILbkrFT0SNwI39B1PYdDoal7/EQU/jEU19KxJ1sWztUowlprH
 UwmfUbIvZfPXpLQpU0ngFMMazJ7odUagVlSZxH7UWNcvzZ4cC8lb1ikfz3I4NTEAAk+w
 Y6Ar6WXQLz6wGV42E9OuoZ9Vg7KDiNz2/WaPCZdzvO0MhGddskg5gBJ130mC2Wo17+6F
 cPSpRjoF597XuXbf/9lGNv6PvsvSZT2PzERIWcWmiLZjnk4zTh9DHOOIaol3422OEOb3
 qHW0rKQxVmJBlAu5OygOuJzGwxf1eFi/OCPzbiEWtayzMV1nneYRI2ivmDybIw8OqDG0
 9asg==
X-Gm-Message-State: AAQBX9daLmHfPM03v9HKfBTg/l17EqVORDyD2M7omFsOh926QAEuHyWe
 DN7SHGS0rLpER7kJF5ZhriszJWgNk6zODslW4rziJw==
X-Google-Smtp-Source: AKy350YOJrJBY5nrKfTQ38UroSzkFg5MjS6c3ZLBSSNnpnbEzy1ys1tfMoCiEI8JtjGafmrooy4RB5NK7kx7Gp3UMks=
X-Received: by 2002:a05:6870:6025:b0:17e:ac0e:9874 with SMTP id
 t37-20020a056870602500b0017eac0e9874mr1147821oaa.8.1680614466692; Tue, 04 Apr
 2023 06:21:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210102060336.832866-1-drawat.floss@gmail.com>
In-Reply-To: <20210102060336.832866-1-drawat.floss@gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 4 Apr 2023 15:20:55 +0200
Message-ID: <CAKMK7uHRTcdZxreD5ymc2TsV9LNePeR=JgvJbnO-q2_wN99kEA@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/hyperv: Add DRM driver for hyperv synthetic video
 device
To: Deepak Rawat <drawat.floss@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: linux-hyperv@vger.kernel.org, Wei Hu <weh@microsoft.com>,
 Tang Shaofeng <shaofeng.tang@intel.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, Dexuan Cui <decui@microsoft.com>,
 dri-devel@lists.freedesktop.org, Michael Kelley <mikelley@microsoft.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Yeah way late reply, but I just stumbled over this and got a bit puzzled ...

On Sat, 2 Jan 2021 at 07:03, Deepak Rawat <drawat.floss@gmail.com> wrote:
> +/*
> + * PCI/vmbus interface
> + */
> +
> +static int hyperv_pci_probe(struct pci_dev *pdev,
> +                           const struct pci_device_id *ent)
> +{
> +       return 0;
> +}

Why do you have this dummy driver when it does nothing? Can it just be
deleted? If it's just to have a driver, then we really don't need that
on linux, there's no requirement to have a device driver for every
device in a system.

If you actually need to make sure that this pci device isn't passed to
a guest vm or something like that, then the main driver must ensure
that the pci driver is bound (ideally with component.c because
otherwise you'll get the unbind/rebind dance wrong in one of the
bazillion of subtle ways). Just having a driver doesn't stop anyone
from unbinding it and then wreaking havoc.
-Daniel

> +
> +static void hyperv_pci_remove(struct pci_dev *pdev)
> +{
> +}
> +
> +static const struct pci_device_id hyperv_pci_tbl[] = {
> +       {
> +               .vendor = PCI_VENDOR_ID_MICROSOFT,
> +               .device = PCI_DEVICE_ID_HYPERV_VIDEO,
> +       },
> +       { /* end of list */ }
> +};
> +
> +static struct pci_driver hyperv_pci_driver = {
> +       .name =         KBUILD_MODNAME,
> +       .id_table =     hyperv_pci_tbl,
> +       .probe =        hyperv_pci_probe,
> +       .remove =       hyperv_pci_remove,
> +};
> +
> +static int hyperv_get_vram_gen1(struct hyperv_device *hv)
> +{
> +       struct drm_device *dev = &hv->dev;
> +       struct pci_dev *pdev;
> +       int ret;
> +
> +       pdev = pci_get_device(PCI_VENDOR_ID_MICROSOFT,
> +                             PCI_DEVICE_ID_HYPERV_VIDEO, NULL);
> +       if (!pdev) {
> +               drm_err(dev, "Unable to find PCI Hyper-V video\n");
> +               return -ENODEV;
> +       }
> +
> +       ret = drm_fb_helper_remove_conflicting_pci_framebuffers(pdev, "hypervdrmfb");
> +       if (ret) {
> +               drm_err(dev, "Not able to remove boot fb\n");
> +               return ret;
> +       }
> +
> +       if (pci_request_region(pdev, 0, DRIVER_NAME) != 0)
> +               drm_warn(dev, "Cannot request framebuffer, boot fb still active?\n");
> +
> +       if ((pdev->resource[0].flags & IORESOURCE_MEM) == 0) {
> +               drm_err(dev, "Resource at bar 0 is not IORESOURCE_MEM\n");
> +               ret = -ENODEV;
> +               goto error;
> +       }
> +
> +       hv->fb_base = pci_resource_start(pdev, 0);
> +       hv->fb_size = pci_resource_len(pdev, 0);
> +       if (hv->fb_base == 0) {
> +               drm_err(dev, "Resource not available\n");
> +               ret = -ENODEV;
> +               goto error;
> +       }
> +
> +       hv->fb_size = min(hv->fb_size,
> +                         (unsigned long)(hv->mmio_megabytes * 1024 * 1024));
> +       hv->vram = devm_ioremap(&pdev->dev, hv->fb_base, hv->fb_size);
> +       if (!hv->vram) {
> +               drm_err(dev, "Failed to map vram\n");
> +               ret = -ENOMEM;
> +       }
> +
> +error:
> +       pci_dev_put(pdev);
> +       return ret;
> +}
> +
> +static int hyperv_get_vram_gen2(struct hyperv_device *hv,
> +                               struct hv_device *hdev)
> +{
> +       struct drm_device *dev = &hv->dev;
> +       struct apertures_struct *ap;
> +       int ret;
> +
> +       hv->fb_size = (unsigned long)(hv->mmio_megabytes * 1024 * 1024);
> +
> +       ret = vmbus_allocate_mmio(&hv->mem, hdev, 0, -1, hv->fb_size, 0x100000,
> +                                 true);
> +       if (ret) {
> +               drm_err(dev, "Failed to allocate mmio\n");
> +               return -ENOMEM;
> +       }
> +
> +       hv->vram = ioremap(hv->mem->start, hv->fb_size);
> +       if (!hv->vram) {
> +               drm_err(dev, "Failed to map vram\n");
> +               ret = -ENOMEM;
> +               goto error;
> +       }
> +
> +       hv->fb_base = hv->mem->start;
> +
> +       ap = alloc_apertures(1);
> +       if (!ap) {
> +               drm_err(dev, "Failed to get apertures\n");
> +               ret = -ENOMEM;
> +               goto error;
> +       }
> +
> +       ap->ranges[0].base = screen_info.lfb_base;
> +       ap->ranges[0].size = screen_info.lfb_size;
> +       remove_conflicting_framebuffers(ap, KBUILD_MODNAME, false);
> +       kfree(ap);
> +
> +       return 0;
> +
> +error:
> +       vmbus_free_mmio(hv->mem->start, hv->fb_size);
> +       return ret;
> +}
> +
> +static int hyperv_vmbus_probe(struct hv_device *hdev,
> +                             const struct hv_vmbus_device_id *dev_id)
> +{
> +       struct hyperv_device *hv;
> +       struct drm_device *dev;
> +       int ret;
> +
> +       hv = devm_drm_dev_alloc(&hdev->device, &hyperv_driver,
> +                               struct hyperv_device, dev);
> +       if (IS_ERR(hv))
> +               return PTR_ERR(hv);
> +
> +       dev = &hv->dev;
> +       init_completion(&hv->wait);
> +       hv_set_drvdata(hdev, hv);
> +       hv->hdev = hdev;
> +
> +       /* Get the actual VRAM size from the device */
> +       ret = synthvid_connect_vsp(hdev);
> +       if (ret) {
> +               drm_err(dev, "Failed to connect to vmbus.\n");
> +               goto err_hv_set_drv_data;
> +       }
> +
> +       if (efi_enabled(EFI_BOOT))
> +               ret = hyperv_get_vram_gen2(hv, hdev);
> +       else
> +               ret = hyperv_get_vram_gen1(hv);
> +
> +       if (ret)
> +               goto err_vmbus_close;
> +
> +       /*
> +        * Should be done only once during init and resume. Failing to update
> +        * vram location is not fatal. Device will update dirty area till
> +        * preferred resolution only.
> +        */
> +       ret = synthvid_update_vram_location(hdev, hv->fb_base);
> +       if (ret)
> +               drm_warn(dev, "Failed to update vram location.\n");
> +
> +       ret = hyperv_mode_config_init(hv);
> +       if (ret)
> +               goto err_vmbus_close;
> +
> +       ret = drm_dev_register(dev, 0);
> +       if (ret) {
> +               drm_err(dev, "Failed to register drm driver.\n");
> +               goto err_vmbus_close;
> +       }
> +
> +       drm_fbdev_generic_setup(dev, 0);
> +
> +       return 0;
> +
> +err_vmbus_close:
> +       vmbus_close(hdev->channel);
> +err_hv_set_drv_data:
> +       hv_set_drvdata(hdev, NULL);
> +       return ret;
> +}
> +
> +static int hyperv_vmbus_remove(struct hv_device *hdev)
> +{
> +       struct drm_device *dev = hv_get_drvdata(hdev);
> +       struct hyperv_device *hv = to_hv(dev);
> +
> +       drm_dev_unplug(dev);
> +       drm_atomic_helper_shutdown(dev);
> +       vmbus_close(hdev->channel);
> +       hv_set_drvdata(hdev, NULL);
> +       vmbus_free_mmio(hv->mem->start, hv->fb_size);
> +
> +       return 0;
> +}
> +
> +static int hyperv_vmbus_suspend(struct hv_device *hdev)
> +{
> +       struct drm_device *dev = hv_get_drvdata(hdev);
> +       int ret;
> +
> +       ret = drm_mode_config_helper_suspend(dev);
> +
> +       vmbus_close(hdev->channel);
> +
> +       return ret;
> +}
> +
> +static int hyperv_vmbus_resume(struct hv_device *hdev)
> +{
> +       struct drm_device *dev = hv_get_drvdata(hdev);
> +       int ret;
> +
> +       ret = synthvid_connect_vsp(hdev);
> +       if (ret)
> +               return ret;
> +
> +       return drm_mode_config_helper_resume(dev);
> +}
> +
> +static const struct hv_vmbus_device_id hyperv_vmbus_tbl[] = {
> +       /* Synthetic Video Device GUID */
> +       {HV_SYNTHVID_GUID},
> +       {}
> +};
> +
> +static struct hv_driver hyperv_hv_driver = {
> +       .name = KBUILD_MODNAME,
> +       .id_table = hyperv_vmbus_tbl,
> +       .probe = hyperv_vmbus_probe,
> +       .remove = hyperv_vmbus_remove,
> +       .suspend = hyperv_vmbus_suspend,
> +       .resume = hyperv_vmbus_resume,
> +       .driver = {
> +               .probe_type = PROBE_PREFER_ASYNCHRONOUS,
> +       },
> +};
> +
> +/* ---------------------------------------------------------------------- */
> +/* module init/exit                                                       */
> +
> +static int __init hyperv_init(void)
> +{
> +       int ret;
> +
> +       ret = pci_register_driver(&hyperv_pci_driver);
> +       if (ret != 0)
> +               return ret;
> +
> +       return vmbus_driver_register(&hyperv_hv_driver);
> +}
> +
> +static void __exit hyperv_exit(void)
> +{
> +       vmbus_driver_unregister(&hyperv_hv_driver);
> +       pci_unregister_driver(&hyperv_pci_driver);
> +}
> +
> +module_init(hyperv_init);
> +module_exit(hyperv_exit);
> +
> +MODULE_DEVICE_TABLE(pci, hyperv_pci_tbl);
> +MODULE_DEVICE_TABLE(vmbus, hyperv_vmbus_tbl);
> +MODULE_LICENSE("GPL");
> +MODULE_AUTHOR("Deepak Rawat <drawat.floss@gmail.com>");
> +MODULE_DESCRIPTION("DRM driver for hyperv synthetic video device");
> --
> 2.29.2
>


-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
