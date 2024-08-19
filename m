Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A5E795716A
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 19:03:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A19C410E30C;
	Mon, 19 Aug 2024 17:03:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VU3gOX/4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9D4610E30C;
 Mon, 19 Aug 2024 17:03:52 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-201f7fb09f6so29498785ad.2; 
 Mon, 19 Aug 2024 10:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724087032; x=1724691832; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BmNdRfQwBhxaT1HwilI10sPKkC7lH+s3BpK82jwzrS8=;
 b=VU3gOX/4ZGWMBGvmItVSDqztcU0IbhAc98blGWmNPVBKWD1VrNiARCX4R2V3ZowiyM
 9Qyg8LvqDyhoe5ttTqNikGVZTFVniNxtA0hTNeh1AvgMpC60hF7Pgflfn+rcpC72nDzQ
 kvfsN9FwrIYTDsWK2Y0uzmZffd9eCgiYd2wbsFz0gzwTOssB39TzZbx6tsSzDwLeumB7
 617LMiFecVdoZoatpXdt8TZHnyZMcQXQrzSWXB4SBkX3XJJSN2OvXuN7RZe7HbuzA/cq
 6RJFsagC8a3TjDooRQ/KCPon/bJeIJHFUMQmslK7Z/gzLzEO1/dOOmbmCMMTLsvH3TcP
 520A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724087032; x=1724691832;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BmNdRfQwBhxaT1HwilI10sPKkC7lH+s3BpK82jwzrS8=;
 b=cGmSnXW61AcEv3RaUNM6tqsiXqxWU5U8fCvSWrFccjhclI1Ok+zmO+zlBFhdN4ug8Q
 2aEIxKqeu1OM3XjoBtNHCdnrc9v4a/FlrSOvsL4ymrmbuct1c2FcNRDV4cfQ936NYxz4
 Ul4VSHJhko/IbTrl3u/2wZkG1RTMjQdxTPu688Drac6PsWuAnjGeELURRCHqPnlvHEwO
 p2CzXlhX4MftIWK6xpCVfExteFdi0yxtaS4djEzSKNR4SdMlHlnlB2Yh6nezTMl9gbax
 vzr66ZPIFl9VxqBKO2ZG2agSym6gWyT1V4dthVMDEuy+EmP1XlXBvPNwn2UXoWTz4Kv4
 8KWA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUJ8NZr3yfvrqy+mrxUSLKQSWOoSdrQbaHydzKCnF4M25BBZsTbQVCuZDcYGf0u5IGxBfaIjjZy3+rS@lists.freedesktop.org,
 AJvYcCW6R7r+wWaK38P5/1IsdG/k6cDvmaqZvzRtJG600POQ/B+co1De85KG4pjj+yQh4sJq+DHNWRczXfk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz+SerVKklKTPG8p8Y6OjuCTTw5JwC+2SFOrmRSxGgCA0p3TpsN
 VAkRx7bZ/g/twES4mR69sMxP72bkcKSjqxt+wjuGl/RfAiE5pGAh7QVjxMK4mVP4TwJQ05UG7Km
 Rc4btCXSIViGbdj7BW0gmi4htJC0=
X-Google-Smtp-Source: AGHT+IFrRCmM5UI/i4vWXN89LDnPdv0s59wDFaKy0zznINVO0gSqZ6AVSs5aHioOicfupSSEZfWlnPph7E8/q+jTABQ=
X-Received: by 2002:a17:903:10c:b0:202:2f0:3bb2 with SMTP id
 d9443c01a7336-20204067d8fmr93491475ad.60.1724087032002; Mon, 19 Aug 2024
 10:03:52 -0700 (PDT)
MIME-Version: 1.0
References: <20240819165341.799848-1-alexander.deucher@amd.com>
In-Reply-To: <20240819165341.799848-1-alexander.deucher@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 19 Aug 2024 13:03:37 -0400
Message-ID: <CADnq5_M5GnsS5dcfrQU7c-B7j3yp=Gq70eZ4XB5Ri1b4M4yO-w@mail.gmail.com>
Subject: Re: [PATCH V2] video/aperture: match the pci device when calling
 sysfb_disable()
To: Alex Deucher <alexander.deucher@amd.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 intel-gfx@lists.freedesktop.org, 
 Javier Martinez Canillas <javierm@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Helge Deller <deller@gmx.de>, 
 Sam Ravnborg <sam@ravnborg.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I forgot to update the patch title but it should probably be something like=
:

video/aperture: optionally match the device in sysfb_disable()

Alex

On Mon, Aug 19, 2024 at 1:00=E2=80=AFPM Alex Deucher <alexander.deucher@amd=
.com> wrote:
>
> In aperture_remove_conflicting_pci_devices(), we currently only
> call sysfb_disable() on vga class devices.  This leads to the
> following problem when the pimary device is not VGA compatible:
>
> 1. A PCI device with a non-VGA class is the boot display
> 2. That device is probed first and it is not a VGA device so
>    sysfb_disable() is not called, but the device resources
>    are freed by aperture_detach_platform_device()
> 3. Non-primary GPU has a VGA class and it ends up calling sysfb_disable()
> 4. NULL pointer dereference via sysfb_disable() since the resources
>    have already been freed by aperture_detach_platform_device() when
>    it was called by the other device.
>
> Fix this by passing a device pointer to sysfb_disable() and checking
> the device to determine if we should execute it or not.
>
> v2: Fix build when CONFIG_SCREEN_INFO is not set
>
> Fixes: 5ae3716cfdcd ("video/aperture: Only remove sysfb on the default vg=
a pci device")
> Cc: Javier Martinez Canillas <javierm@redhat.com>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Helge Deller <deller@gmx.de>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> Cc: stable@vger.kernel.org
> ---
>  drivers/firmware/sysfb.c | 11 +++++++++--
>  drivers/of/platform.c    |  2 +-
>  drivers/video/aperture.c |  5 ++---
>  include/linux/sysfb.h    |  4 ++--
>  4 files changed, 14 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/firmware/sysfb.c b/drivers/firmware/sysfb.c
> index 880ffcb500887..033a044af2646 100644
> --- a/drivers/firmware/sysfb.c
> +++ b/drivers/firmware/sysfb.c
> @@ -39,6 +39,8 @@ static struct platform_device *pd;
>  static DEFINE_MUTEX(disable_lock);
>  static bool disabled;
>
> +static struct device *sysfb_parent_dev(const struct screen_info *si);
> +
>  static bool sysfb_unregister(void)
>  {
>         if (IS_ERR_OR_NULL(pd))
> @@ -52,6 +54,7 @@ static bool sysfb_unregister(void)
>
>  /**
>   * sysfb_disable() - disable the Generic System Framebuffers support
> + * @dev:       the device to check if non-NULL
>   *
>   * This disables the registration of system framebuffer devices that mat=
ch the
>   * generic drivers that make use of the system framebuffer set up by fir=
mware.
> @@ -61,8 +64,12 @@ static bool sysfb_unregister(void)
>   * Context: The function can sleep. A @disable_lock mutex is acquired to=
 serialize
>   *          against sysfb_init(), that registers a system framebuffer de=
vice.
>   */
> -void sysfb_disable(void)
> +void sysfb_disable(struct device *dev)
>  {
> +       struct screen_info *si =3D &screen_info;
> +
> +       if (dev && dev !=3D sysfb_parent_dev(si))
> +               return;
>         mutex_lock(&disable_lock);
>         sysfb_unregister();
>         disabled =3D true;
> @@ -93,7 +100,7 @@ static __init bool sysfb_pci_dev_is_enabled(struct pci=
_dev *pdev)
>  }
>  #endif
>
> -static __init struct device *sysfb_parent_dev(const struct screen_info *=
si)
> +static struct device *sysfb_parent_dev(const struct screen_info *si)
>  {
>         struct pci_dev *pdev;
>
> diff --git a/drivers/of/platform.c b/drivers/of/platform.c
> index 389d4ea6bfc15..ef622d41eb5b2 100644
> --- a/drivers/of/platform.c
> +++ b/drivers/of/platform.c
> @@ -592,7 +592,7 @@ static int __init of_platform_default_populate_init(v=
oid)
>                          * This can happen for example on DT systems that=
 do EFI
>                          * booting and may provide a GOP handle to the EF=
I stub.
>                          */
> -                       sysfb_disable();
> +                       sysfb_disable(NULL);
>                         of_platform_device_create(node, NULL, NULL);
>                         of_node_put(node);
>                 }
> diff --git a/drivers/video/aperture.c b/drivers/video/aperture.c
> index 561be8feca96c..b23d85ceea104 100644
> --- a/drivers/video/aperture.c
> +++ b/drivers/video/aperture.c
> @@ -293,7 +293,7 @@ int aperture_remove_conflicting_devices(resource_size=
_t base, resource_size_t si
>          * ask for this, so let's assume that a real driver for the displ=
ay
>          * was already probed and prevent sysfb to register devices later=
.
>          */
> -       sysfb_disable();
> +       sysfb_disable(NULL);
>
>         aperture_detach_devices(base, size);
>
> @@ -353,8 +353,7 @@ int aperture_remove_conflicting_pci_devices(struct pc=
i_dev *pdev, const char *na
>         if (pdev =3D=3D vga_default_device())
>                 primary =3D true;
>
> -       if (primary)
> -               sysfb_disable();
> +       sysfb_disable(&pdev->dev);
>
>         for (bar =3D 0; bar < PCI_STD_NUM_BARS; ++bar) {
>                 if (!(pci_resource_flags(pdev, bar) & IORESOURCE_MEM))
> diff --git a/include/linux/sysfb.h b/include/linux/sysfb.h
> index c9cb657dad08a..bef5f06a91de6 100644
> --- a/include/linux/sysfb.h
> +++ b/include/linux/sysfb.h
> @@ -58,11 +58,11 @@ struct efifb_dmi_info {
>
>  #ifdef CONFIG_SYSFB
>
> -void sysfb_disable(void);
> +void sysfb_disable(struct device *dev);
>
>  #else /* CONFIG_SYSFB */
>
> -static inline void sysfb_disable(void)
> +static inline void sysfb_disable(struct device *dev)
>  {
>  }
>
> --
> 2.46.0
>
