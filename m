Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24B7F30AB00
	for <lists+dri-devel@lfdr.de>; Mon,  1 Feb 2021 16:21:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4BFD6E7EC;
	Mon,  1 Feb 2021 15:21:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [IPv6:2607:f8b0:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 429E56E7EC
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Feb 2021 15:21:26 +0000 (UTC)
Received: by mail-ot1-x332.google.com with SMTP id h14so16616227otr.4
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Feb 2021 07:21:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+jo3Pe8+MXl1+0gBOWiSw5v0BJ545gQ4ZkTl4Ae472o=;
 b=C68l+shnh8CXf7Al768pOC3kGZUFoh1MAJFgWwa2Q+woCyTZ1UrASd8xMEzScrs0BP
 SFbseFeub+25gGn3TJ/fyxg8DK0bbeG0lYgXzPsAvqEaZFyRa9aufaTHGQuDG3/encaM
 ZXFLC9jZe17kgYq4ftgjL3Uy8HWdtDBvY3pJJwP6bVyfgR2Ie+6uUvPp2EGPSAwYqaoi
 i0GM1XPWHJrdudaHa6mqTFWLiQtcu4k1UnfMX0rsCnZcfcPaPc+NusSNvHqgt5uxPeDI
 pdSkSQWYzHQV5ehcosjOggSr778TR+yGgsILUsWlSmLQshMEeTxs4ceidv6Zr2D3EZhY
 jY5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+jo3Pe8+MXl1+0gBOWiSw5v0BJ545gQ4ZkTl4Ae472o=;
 b=d+0RbDPxK3jx3xuZHsXJOlGCu+L1NIAs+23xeecEdUwr7FVNIaymvuVvZn+LuwlpRY
 L62YXLSjdS7AXljY2lWOdgjs0Z+XOeyxVvgIHOHsk4iBZNEnnOfreq2tGH5TMS/Vg7wa
 NZBZ47d1ZvJZ1aavhhooavQkxb5hyuBs/aFZuxJTsPhuyyBv+PXYiiLReXjUUYp56m7k
 1UBf+f+gVCcZg02zPBaB9BK7mn1NNd5lWsxauhpJgv+KxNB5kfEpYWVeCecUK6EfSXjq
 bp6vUcN52DxQAbrKuTTfWG13YGchFCGjza81z1tckdtk9civjQFjyW+ZmtybLRb/wcx0
 FgRw==
X-Gm-Message-State: AOAM533rMoYkb+YVMBFtnGbfxIM3ELxza/+RWpynleQUt0Wq5sJ4Mxez
 PYve7GcN8bhZihPGyDqvykMVgKbY9tF1rbL3q8I=
X-Google-Smtp-Source: ABdhPJzOOQ7f1C42DXKVDkbqndJUWURkrsejZc9DtMgpfqIuaGu9nReoXOhqXkj4WP2KHTOx6gpq/LDW097hUb+B1M0=
X-Received: by 2002:a9d:784a:: with SMTP id c10mr12721445otm.132.1612192885533; 
 Mon, 01 Feb 2021 07:21:25 -0800 (PST)
MIME-Version: 1.0
References: <20210129084327.986630-1-kai.heng.feng@canonical.com>
In-Reply-To: <20210129084327.986630-1-kai.heng.feng@canonical.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 1 Feb 2021 10:21:14 -0500
Message-ID: <CADnq5_MduzcezmAjEGK0X7bDiY98f68s8roXc6gOTWjcpNC9Rw@mail.gmail.com>
Subject: Re: [PATCH] efifb: Ensure graphics device for efifb stays at PCI D0
To: Kai-Heng Feng <kai.heng.feng@canonical.com>
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
Cc: Hans de Goede <hdegoede@redhat.com>,
 "open list:EFIFB FRAMEBUFFER DRIVER" <linux-fbdev@vger.kernel.org>,
 pjones@redhat.com, open list <linux-kernel@vger.kernel.org>,
 "open list:FRAMEBUFFER LAYER" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jan 30, 2021 at 6:27 AM Kai-Heng Feng
<kai.heng.feng@canonical.com> wrote:
>
> We are seeing root ports on some desktop boards support D3cold for
> discrete graphics card. So when efifb is in use while graphics device
> isn't bound to a driver, PCI and ACPI will put the graphics to D3cold
> when runtime suspend kicks in, makes efifb stop working.
>
> So ensure the graphics device won't be runtime suspended, to keep efifb
> work all the time.
>
> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  drivers/video/fbdev/efifb.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/video/fbdev/efifb.c b/drivers/video/fbdev/efifb.c
> index e57c00824965..19edd7206409 100644
> --- a/drivers/video/fbdev/efifb.c
> +++ b/drivers/video/fbdev/efifb.c
> @@ -16,6 +16,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/printk.h>
>  #include <linux/screen_info.h>
> +#include <linux/pm_runtime.h>
>  #include <video/vga.h>
>  #include <asm/efi.h>
>  #include <drm/drm_utils.h> /* For drm_get_panel_orientation_quirk */
> @@ -575,6 +576,7 @@ static int efifb_probe(struct platform_device *dev)
>                 goto err_fb_dealoc;
>         }
>         fb_info(info, "%s frame buffer device\n", info->fix.id);
> +       pm_runtime_get_sync(&efifb_pci_dev->dev);
>         return 0;
>
>  err_fb_dealoc:
> @@ -601,6 +603,7 @@ static int efifb_remove(struct platform_device *pdev)
>         unregister_framebuffer(info);
>         sysfs_remove_groups(&pdev->dev.kobj, efifb_groups);
>         framebuffer_release(info);
> +       pm_runtime_put(&efifb_pci_dev->dev);
>
>         return 0;
>  }
> --
> 2.29.2
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
