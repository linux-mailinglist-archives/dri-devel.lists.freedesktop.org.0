Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF9638940B
	for <lists+dri-devel@lfdr.de>; Wed, 19 May 2021 18:45:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20E036E213;
	Wed, 19 May 2021 16:45:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CF726E213
 for <dri-devel@lists.freedesktop.org>; Wed, 19 May 2021 16:45:30 +0000 (UTC)
Received: by mail-oi1-x231.google.com with SMTP id v22so13708098oic.2
 for <dri-devel@lists.freedesktop.org>; Wed, 19 May 2021 09:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=n3nslXd1oDD6z2dYKaP2twlQcbfdSGmidNT7OePlUG4=;
 b=WGm4Ynazm/+VSRaGLZFfQ+wqW8Rr5++iJ695Ek/3bbhik4AClKj5GYpCdUh8UkiHHi
 eyjurn9ygPiTVsBIPtYAEWjkXkRLc73SeBT2Espv26XwdPbA6X11rm0OPKWcfuDh57zN
 geAdKtd+ALWfRAw+c6AXdfjJ5AK31jWb2ojc2d418c/jR42A6GmzS9dMbUUM8+Pqn2+C
 JXOnZeWGZVxzDa10iML0VnB3WvJZBQEi+4qbh+vG4LAent7mib0PQy3b/DPhrbQsXUy1
 MlIrNYFTTxIuWUjJU6ztDcAXa0KI2hHvyY1U29jz+POWjz8FyWOIqhUyCgbITYX1YI3T
 VfHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=n3nslXd1oDD6z2dYKaP2twlQcbfdSGmidNT7OePlUG4=;
 b=D/cynRRTGYij5008hF+t8NbVqjeJ6wibnHLjYIvELtD7aFavTZaDysZuOZhRwtbJsL
 iV+GYuXYNZw5imUL/TiUwdvTm4nOzYVccpkO/y7YdM4HAcIvmp5B3jgUGhubnSp6mWle
 89kjw/9QOsTw0MTfzBvTDCEbRPE9V0rfV68VXoe/7ONkXSnnQ1vUzDRvX/ZyLWlp1E6z
 8EsDxHql5GpxIp4mK7N4xW3Qp2ziwGWgqdvPrETuZuBAcLu/uAYDN8JnF3Xio4IOG7fU
 O2Lc+lNp5cSahbpvKtl+PMz7cqH06S7VLWmRkG86eUDiKwkLJA+2ayzcqVGx6iNTWiME
 ZeOg==
X-Gm-Message-State: AOAM531Q4O/W+F0uplZZSQDJhY+/cH1tUC9/i1wMetNqYXhOSllAdZpH
 o8nEnlcQqJJdRYFGxv3fxmY401mUVCN4j6xcabw=
X-Google-Smtp-Source: ABdhPJweK6a7acvH1Sgwx5MjDUmmvzL2xv5d173VsMYsXQZDGk/wutf7xjkIJ21vtujBrS/uTGfOCmEdHfxM2IV3/Gs=
X-Received: by 2002:aca:fc50:: with SMTP id a77mr27090oii.123.1621442729658;
 Wed, 19 May 2021 09:45:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210519135723.525997-1-kai.heng.feng@canonical.com>
In-Reply-To: <20210519135723.525997-1-kai.heng.feng@canonical.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 19 May 2021 12:45:18 -0400
Message-ID: <CADnq5_OstgUmLxa4DU2s19m5E1zScKY0Pe=644BvBTp=LAPvJg@mail.gmail.com>
Subject: Re: [PATCH] vgaarb: Use ACPI HID name to find integrated GPU
To: Kai-Heng Feng <kai.heng.feng@canonical.com>
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
Cc: Dave Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, "Deucher,
 Alexander" <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 19, 2021 at 9:57 AM Kai-Heng Feng
<kai.heng.feng@canonical.com> wrote:
>
> Commit 3d42f1ddc47a ("vgaarb: Keep adding VGA device in queue") assumes
> the first device is an integrated GPU. However, on AMD platforms an
> integrated GPU can have higher PCI device number than a discrete GPU.
>
> Integrated GPU on ACPI platform generally has _DOD and _DOS method, so
> use that as predicate to find integrated GPU. If the new strategy
> doesn't work, fallback to use the first device as boot VGA.
>
> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

Unless there are any other comments, I'll apply it tomorrow.

Alex

> ---
>  drivers/gpu/vga/vgaarb.c | 31 ++++++++++++++++++++++++++-----
>  1 file changed, 26 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/vga/vgaarb.c b/drivers/gpu/vga/vgaarb.c
> index 5180c5687ee5..949fde433ea2 100644
> --- a/drivers/gpu/vga/vgaarb.c
> +++ b/drivers/gpu/vga/vgaarb.c
> @@ -50,6 +50,7 @@
>  #include <linux/screen_info.h>
>  #include <linux/vt.h>
>  #include <linux/console.h>
> +#include <linux/acpi.h>
>
>  #include <linux/uaccess.h>
>
> @@ -1450,9 +1451,23 @@ static struct miscdevice vga_arb_device = {
>         MISC_DYNAMIC_MINOR, "vga_arbiter", &vga_arb_device_fops
>  };
>
> +#if defined(CONFIG_ACPI)
> +static bool vga_arb_integrated_gpu(struct device *dev)
> +{
> +       struct acpi_device *adev = ACPI_COMPANION(dev);
> +
> +       return adev && !strcmp(acpi_device_hid(adev), ACPI_VIDEO_HID);
> +}
> +#else
> +static bool vga_arb_integrated_gpu(struct device *dev)
> +{
> +       return false;
> +}
> +#endif
> +
>  static void __init vga_arb_select_default_device(void)
>  {
> -       struct pci_dev *pdev;
> +       struct pci_dev *pdev, *found = NULL;
>         struct vga_device *vgadev;
>
>  #if defined(CONFIG_X86) || defined(CONFIG_IA64)
> @@ -1505,20 +1520,26 @@ static void __init vga_arb_select_default_device(void)
>  #endif
>
>         if (!vga_default_device()) {
> -               list_for_each_entry(vgadev, &vga_list, list) {
> +               list_for_each_entry_reverse(vgadev, &vga_list, list) {
>                         struct device *dev = &vgadev->pdev->dev;
>                         u16 cmd;
>
>                         pdev = vgadev->pdev;
>                         pci_read_config_word(pdev, PCI_COMMAND, &cmd);
>                         if (cmd & (PCI_COMMAND_IO | PCI_COMMAND_MEMORY)) {
> -                               vgaarb_info(dev, "setting as boot device (VGA legacy resources not available)\n");
> -                               vga_set_default_device(pdev);
> -                               break;
> +                               found = pdev;
> +                               if (vga_arb_integrated_gpu(dev))
> +                                       break;
>                         }
>                 }
>         }
>
> +       if (found) {
> +               vgaarb_info(&found->dev, "setting as boot device (VGA legacy resources not available)\n");
> +               vga_set_default_device(found);
> +               return;
> +       }
> +
>         if (!vga_default_device()) {
>                 vgadev = list_first_entry_or_null(&vga_list,
>                                                   struct vga_device, list);
> --
> 2.31.1
>
