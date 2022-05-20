Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2BE352F042
	for <lists+dri-devel@lfdr.de>; Fri, 20 May 2022 18:12:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5324C10E723;
	Fri, 20 May 2022 16:12:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com
 [IPv6:2607:f8b0:4864:20::1136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD32D10E723
 for <dri-devel@lists.freedesktop.org>; Fri, 20 May 2022 16:12:15 +0000 (UTC)
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-2ff90e0937aso17506797b3.4
 for <dri-devel@lists.freedesktop.org>; Fri, 20 May 2022 09:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Pqyi41QHS9ba9YCVsZZlxgBFqkmxdii+DOUhWsNf4JM=;
 b=pP66Xe8ijIgmgl31Z/kiMDxKh22aJaoVav0zIa60uSGQ4LdQCbEGb3tS0k2UT+HXEL
 gSMi0+ul0SutrYvq4AtHncggCfFsWrVWcylzfn189g5irleNcf0tCKxNfdM2nKIdUtH2
 M8XSoIjMjVZTi4WaWieoAkWZni/ICU8bi5lEmcU88oJqMNxUvIdXbnVgEqblseViKBrE
 sMMSqY7xRVqMSIdhKaMO1uzpgO2RXUoM8uz34W7aIeNKnXkifYS5QjEL05cYsNH58ZC+
 b5C3+QIswMaiwrfsk50mUmacgz/TorB8CI/2nKvVK/D7HzUM48TqywDKLE/UbO0C5P88
 ZBrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Pqyi41QHS9ba9YCVsZZlxgBFqkmxdii+DOUhWsNf4JM=;
 b=l2o4a1myVhmazEEejhZGHcHK1wXzZfOVmzWvLBh/QRGPA8tZV/jkYxSGoLe4dPOaQs
 klLYP6OZvb+i3Fb+2I8tRZ83zWJLtfC6VhM4lPprgMc/gfsDqQlY18ggIlN4M6hO3qe2
 NtCQUMsfYtXFSZFWD4MOcQbiFPAvqQOzFQnmHM5wdHpgPKeDh7OJw1vS8R8gnyWmK59G
 85JMkqeIi4qGpxoxVeEYy4UmJ7syImOchSJr1u7Rth3LPDcfzDAjtd3YmaqZ//gPJiMa
 im5BBr+F2VfhfbF34gItHkdDq1mCgKW0rfjlvQgagNnBw7jDAIQvFLwDFJB/9FHEZCWE
 PVbw==
X-Gm-Message-State: AOAM531w7qsfYrc9pLD7HJF2OgUaet8PXH5DaEwrR5rwuP48QiimiNQv
 JYx85rqSpw34+GyBAVRRNMDfFbiOT72lgOSshVw=
X-Google-Smtp-Source: ABdhPJxKP8s7sEVnqbYH7qAZQFC4arPAJxuj8I3habwoVp/wJFjzMmoEthmrmYhmLJq9L0XjlSC2xwc7eMXvYCjLJZY=
X-Received: by 2002:a81:3605:0:b0:2ff:29ec:2ef2 with SMTP id
 d5-20020a813605000000b002ff29ec2ef2mr10708414ywa.137.1653063135013; Fri, 20
 May 2022 09:12:15 -0700 (PDT)
MIME-Version: 1.0
References: <1653031240-13623-1-git-send-email-ssengar@linux.microsoft.com>
In-Reply-To: <1653031240-13623-1-git-send-email-ssengar@linux.microsoft.com>
From: Deepak Rawat <drawat.floss@gmail.com>
Date: Fri, 20 May 2022 09:12:04 -0700
Message-ID: <CAHFnvW01rOJq2yuFQ2u692XKz9uNfoDoYmXYShpkS+rjeZSyUg@mail.gmail.com>
Subject: Re: [PATCH] drm/hyperv : Removing the restruction of VRAM allocation
 with PCI bar size
To: Saurabh Sengar <ssengar@linux.microsoft.com>
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
Cc: linux-hyperv@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Haiyang Zhang <haiyangz@microsoft.com>, ssengar@microsoft.com,
 Dexuan Cui <decui@microsoft.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 20, 2022 at 12:20 AM Saurabh Sengar
<ssengar@linux.microsoft.com> wrote:
>
> There were two different approaches getting used in this driver to
> allocate vram:
>         1. VRAM allocation from PCI region for Gen1
>         2. VRAM alloaction from MMIO region for Gen2
> First approach limilts the vram to PCI BAR size, which is 64 MB in most
> legacy systems. This limits the maximum resolution to be restricted to
> 64 MB size, and with recent conclusion on fbdev issue its concluded to have
> similar allocation strategy for both Gen1 and Gen2. This patch unifies
> the Gen1 and Gen2 vram allocation strategy.
>
> Signed-off-by: Saurabh Sengar <ssengar@linux.microsoft.com>
> ---
> FBdev patch Ref :
> https://lore.kernel.org/lkml/20220428143746.sya775ro5zi3kgm3@liuwe-devbox-debian-v2/T/
>
>  drivers/gpu/drm/hyperv/hyperv_drm_drv.c | 76 ++-----------------------
>  1 file changed, 4 insertions(+), 72 deletions(-)
>
> diff --git a/drivers/gpu/drm/hyperv/hyperv_drm_drv.c b/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
> index 4a8941fa0815..a32afd84f361 100644
> --- a/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
> +++ b/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
> @@ -69,57 +69,8 @@ static struct pci_driver hyperv_pci_driver = {
>         .remove =       hyperv_pci_remove,
>  };
>
> -static int hyperv_setup_gen1(struct hyperv_drm_device *hv)
> -{
> -       struct drm_device *dev = &hv->dev;
> -       struct pci_dev *pdev;
> -       int ret;
> -
> -       pdev = pci_get_device(PCI_VENDOR_ID_MICROSOFT,
> -                             PCI_DEVICE_ID_HYPERV_VIDEO, NULL);
> -       if (!pdev) {
> -               drm_err(dev, "Unable to find PCI Hyper-V video\n");
> -               return -ENODEV;
> -       }
> -
> -       ret = drm_aperture_remove_conflicting_pci_framebuffers(pdev, &hyperv_driver);
> -       if (ret) {
> -               drm_err(dev, "Not able to remove boot fb\n");
> -               return ret;
> -       }
> -
> -       if (pci_request_region(pdev, 0, DRIVER_NAME) != 0)
> -               drm_warn(dev, "Cannot request framebuffer, boot fb still active?\n");
> -
> -       if ((pdev->resource[0].flags & IORESOURCE_MEM) == 0) {
> -               drm_err(dev, "Resource at bar 0 is not IORESOURCE_MEM\n");
> -               ret = -ENODEV;
> -               goto error;
> -       }
> -
> -       hv->fb_base = pci_resource_start(pdev, 0);
> -       hv->fb_size = pci_resource_len(pdev, 0);
> -       if (!hv->fb_base) {
> -               drm_err(dev, "Resource not available\n");
> -               ret = -ENODEV;
> -               goto error;
> -       }
> -
> -       hv->fb_size = min(hv->fb_size,
> -                         (unsigned long)(hv->mmio_megabytes * 1024 * 1024));
> -       hv->vram = devm_ioremap(&pdev->dev, hv->fb_base, hv->fb_size);
> -       if (!hv->vram) {
> -               drm_err(dev, "Failed to map vram\n");
> -               ret = -ENOMEM;
> -       }
> -
> -error:
> -       pci_dev_put(pdev);
> -       return ret;
> -}
> -
> -static int hyperv_setup_gen2(struct hyperv_drm_device *hv,
> -                            struct hv_device *hdev)
> +static int hyperv_setup_gen(struct hyperv_drm_device *hv,
> +                           struct hv_device *hdev)
>  {

nit: This can be renamed to hyperv_setup_vram instead.

Reviewed-by: Deepak Rawat <drawat.floss@gmail.com>

>         struct drm_device *dev = &hv->dev;
>         int ret;
> @@ -181,10 +132,7 @@ static int hyperv_vmbus_probe(struct hv_device *hdev,
>                 goto err_hv_set_drv_data;
>         }
>
> -       if (efi_enabled(EFI_BOOT))
> -               ret = hyperv_setup_gen2(hv, hdev);
> -       else
> -               ret = hyperv_setup_gen1(hv);
> +       ret = hyperv_setup_gen(hv, hdev);
>
>         if (ret)
>                 goto err_vmbus_close;
> @@ -225,29 +173,13 @@ static int hyperv_vmbus_remove(struct hv_device *hdev)
>  {
>         struct drm_device *dev = hv_get_drvdata(hdev);
>         struct hyperv_drm_device *hv = to_hv(dev);
> -       struct pci_dev *pdev;
>
>         drm_dev_unplug(dev);
>         drm_atomic_helper_shutdown(dev);
>         vmbus_close(hdev->channel);
>         hv_set_drvdata(hdev, NULL);
>
> -       /*
> -        * Free allocated MMIO memory only on Gen2 VMs.
> -        * On Gen1 VMs, release the PCI device
> -        */
> -       if (efi_enabled(EFI_BOOT)) {
> -               vmbus_free_mmio(hv->mem->start, hv->fb_size);
> -       } else {
> -               pdev = pci_get_device(PCI_VENDOR_ID_MICROSOFT,
> -                                     PCI_DEVICE_ID_HYPERV_VIDEO, NULL);
> -               if (!pdev) {
> -                       drm_err(dev, "Unable to find PCI Hyper-V video\n");
> -                       return -ENODEV;
> -               }
> -               pci_release_region(pdev, 0);
> -               pci_dev_put(pdev);
> -       }
> +       vmbus_free_mmio(hv->mem->start, hv->fb_size);
>
>         return 0;
>  }
> --
> 2.25.1
>
