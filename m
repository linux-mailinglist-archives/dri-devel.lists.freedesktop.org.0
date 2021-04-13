Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 021B435E5CE
	for <lists+dri-devel@lfdr.de>; Tue, 13 Apr 2021 20:02:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD6FF6E855;
	Tue, 13 Apr 2021 18:02:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C81AF6E855
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Apr 2021 18:02:04 +0000 (UTC)
Received: by mail-ot1-x32c.google.com with SMTP id
 i16-20020a9d68d00000b0290286edfdfe9eso6285067oto.3
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Apr 2021 11:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fHA8s5MMieO6Snjywal6xJCUm0gIgD+1eKzza+J7cuM=;
 b=s7ZAufZAYNKjblQOw+B+4z2MCYxMr9kFplVRO/ZQIj1G9z3WTuYel2cCIHAB7oQmCB
 OOqe9agLj5w9L/ftEhVsCphhVUEQDNr+UpqOJngNkXrCuUFCEcxsy+j8rOA+ESro2qPH
 W3G4MaAV8FaCK7hMsCOXRj6sJ9hgZWaWEEu72E9lDvE0tEgms4e26FxgkTV8MtiaBnfr
 2Ic+4/37kZ/VmK7zGkB+WxEpbrUktfv0qidCemRuN/K0XgpqDU1xkU8JKJpoHbfMCHOG
 vtw8MSsCYUTWQs2ey3nM2k8OTq4/62xFq9R9LvcRYwwwa8O+mJbTBx3GgO66KySxhvNk
 oEqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fHA8s5MMieO6Snjywal6xJCUm0gIgD+1eKzza+J7cuM=;
 b=EKxQgNJGKXa23ncjs4Qwq7TFNAyIOYuUF75lzs9xwdGSYs6Cu5b5coqYYdIfaKzUEO
 YaDy9tWImJeUtry0Kg8rUlqtBtEY3V9X83XMQUCMi3rJHIVJd5eE0ZHNiSKsnj6KmKet
 yRqeLm/1031/LYVNVGE4iEG77iW77O3jtyk223Ylg+y9svM9hlIQ7AWDdolpBgvZjZrp
 zOrchvI04MbF4CfFj0MpbldV1W9X7NKtEtBM8Pgcwf2aNu+tf94Epg3QGqTEu8bUQyKK
 NP+trT7P8VJb/QvSpRosWy5ROsq4EMHLvl9JerozK2AhajF5ZTZJIJdVyAzMz/CXKuS8
 bQsg==
X-Gm-Message-State: AOAM533nlxCjZzVe5h2LVpE4Zqr9C8/g3z025nZ93ZGw6LtKHBGE03BG
 8oXFTeXhmSPh0jhfYtJTAshALHpif3wVegkjvL/aoxR9dpOGIA==
X-Google-Smtp-Source: ABdhPJwKp9kx8LCCHYYOObQkm6QFG7ycSzZPJLrD86v6pdphkyvlQTitF2UXqG5zbwz7GgkxeHX2UQfr8QowmSbhmVw=
X-Received: by 2002:a9d:663:: with SMTP id 90mr29429927otn.311.1618336924138; 
 Tue, 13 Apr 2021 11:02:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210413170508.968148-1-kai.heng.feng@canonical.com>
In-Reply-To: <20210413170508.968148-1-kai.heng.feng@canonical.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 13 Apr 2021 14:01:53 -0400
Message-ID: <CADnq5_P7_7jOZWTo+KCj3jOpmyDPN8eH3jNTgg3xLC4V9QM7kQ@mail.gmail.com>
Subject: Re: [PATCH] efifb: Check efifb_pci_dev before using it
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
Cc: "open list:EFIFB FRAMEBUFFER DRIVER" <linux-fbdev@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:FRAMEBUFFER LAYER" <dri-devel@lists.freedesktop.org>,
 pjones@redhat.com, Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 13, 2021 at 1:05 PM Kai-Heng Feng
<kai.heng.feng@canonical.com> wrote:
>
> On some platforms like Hyper-V and RPi4 with UEFI firmware, efifb is not
> a PCI device.
>
> So make sure efifb_pci_dev is found before using it.
>
> Fixes: a6c0fd3d5a8b ("efifb: Ensure graphics device for efifb stays at PCI D0")
> BugLink: https://bugs.launchpad.net/bugs/1922403
> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  drivers/video/fbdev/efifb.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/video/fbdev/efifb.c b/drivers/video/fbdev/efifb.c
> index f58a545b3bf3..8ea8f079cde2 100644
> --- a/drivers/video/fbdev/efifb.c
> +++ b/drivers/video/fbdev/efifb.c
> @@ -575,7 +575,8 @@ static int efifb_probe(struct platform_device *dev)
>                 goto err_fb_dealoc;
>         }
>         fb_info(info, "%s frame buffer device\n", info->fix.id);
> -       pm_runtime_get_sync(&efifb_pci_dev->dev);
> +       if (efifb_pci_dev)
> +               pm_runtime_get_sync(&efifb_pci_dev->dev);
>         return 0;
>
>  err_fb_dealoc:
> @@ -602,7 +603,8 @@ static int efifb_remove(struct platform_device *pdev)
>         unregister_framebuffer(info);
>         sysfs_remove_groups(&pdev->dev.kobj, efifb_groups);
>         framebuffer_release(info);
> -       pm_runtime_put(&efifb_pci_dev->dev);
> +       if (efifb_pci_dev)
> +               pm_runtime_put(&efifb_pci_dev->dev);
>
>         return 0;
>  }
> --
> 2.30.2
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
