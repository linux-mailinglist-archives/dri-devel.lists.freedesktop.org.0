Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED150C7A13D
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 15:16:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84FFD10E010;
	Fri, 21 Nov 2025 14:16:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WxFf1fr5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
 [209.85.215.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7627210E023
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 14:15:59 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id
 41be03b00d2f7-b63e5da0fdeso175687a12.0
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 06:15:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763734559; x=1764339359; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5MWxC2YhPO2+lW4WlCwywZFk2iw3f1gK24sM/ejKzwM=;
 b=WxFf1fr58z6GW8/+Ya/5C3LrHJCk9RSC/hAo737SGS+3Z5HPZcwLxLR+R/vxNsX0Ci
 NS5A+Sm8cnFW7ftO8acXq1RAVAnp9eYZfvfOFEcOJod0xnXDOfx5eL+pg7tXSz6iRJ/A
 SaIq6NrFc32diVFY4MYgVPB0a4Ur0xXUeqz5VFqtl74TCqJd+9SV4aXUdOre9CUOCv7s
 54Js91b5hEhgk/Rj+jSJostzqglEXBCxF1gvzYdFpOfUVoGA3xiKszcd4m2hZ7F+yzfs
 CzTo2ERYhOF3cbY9hcDzj8+vUeu2LrDmqTaoj6h7KCvzBMhiw890JaY35fjsIC9YCO62
 aJfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763734559; x=1764339359;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=5MWxC2YhPO2+lW4WlCwywZFk2iw3f1gK24sM/ejKzwM=;
 b=KR+KyPY4QIi4ufWZrBWVVrpzPGjS+74iAGTuGAOwRh7Rpp/CeiDeydnExL2DeZcClj
 BcPdGB2ZkFre2YSwXr/8Szb9+BBfdlDhfgBsSaI3jiWbvnzZPyYDMJ8yn/tFjuH1P7pP
 QBmWcyk3yGHQqANOgilb7QtjUUoRkEu4qQFJhr5JrPqFQh/vdHpu612vp0xdYIXvZe27
 tuHwB3hszGgDYdCSTShLUyaVUmAtBmzVAvn8koZWXBmxZXSYje4hX2GutxRXKnFJWAyi
 K/V+fi8pa8M0AOJPkGFDz5mD0k8eCrSRWP3vllOYSnry3D03j6CLHN8ecfSF1MVvKyWZ
 BFKg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV3i99uskVfz2OsaULEymro9O4L4YeQmRmLeBp7zfIuezhsLpVFeLRYOo81OwrgyXSyz6vzhzbM5Lw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwKdQfMdWUBLIPsgEiXUmcpjajuimwgNgL4/uoY+4oc0l3Dprh5
 h+8MOY1uquR/lRPAo1g8J2ebnu3o76Ju/N6juwb7gEYpcEvFxaGK7S1GJXfXvQQY3bfyhrb3mhW
 XtTiVnivQbXgnczp50w35edzZ2/P/hzI=
X-Gm-Gg: ASbGncsp9qqCEObT/pAKmncNDAStteSaa8ESaBZ97CIST0ZSlCKcCplo8WBQWpsFVQv
 6Bh2XphxjImTvVxUTvAzHEwlTx1S44lPHcp6GTyEAJgOP9nqkpamC+f1oMbtRS4cupz6uGrsoTt
 XxC/X5dJgNeoe+i4WbXjBGuMB79nvUGH5bCs4mE0ts8pdjfThnJt+pZz/8vAlaBW+Mtj29qHNkA
 MVa7UaSzCzKoTxk1WAuF2bc+PeA/PSEnrlNlCAjraWV7vGE9NTm7dcu9ZhBaNRFlO0JWic=
X-Google-Smtp-Source: AGHT+IENNBsMiPMhPy3lT/U29kCAz8EhETos7u4tDbMZpsFNaH7g8mAAzjnWnak60cGVE1du7ZLcOXG2yYUr36WWFOI=
X-Received: by 2002:a05:7022:ea46:10b0:119:e55a:95a1 with SMTP id
 a92af1059eb24-11c9d8678famr562401c88.3.1763734558436; Fri, 21 Nov 2025
 06:15:58 -0800 (PST)
MIME-Version: 1.0
References: <20251105161549.98836-1-tzimmermann@suse.de>
In-Reply-To: <20251105161549.98836-1-tzimmermann@suse.de>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 21 Nov 2025 09:15:46 -0500
X-Gm-Features: AWmQ_bkmPcz6UOA5gnGN71prOwzhOn3ELTZMpuodtRV8RF55H-zW-7y7h8dHDxI
Message-ID: <CADnq5_OUBpnwM09QrRae=4SoJZuoVE=rfJZwpGrg1XDq84uRxw@mail.gmail.com>
Subject: Re: [PATCH] drm, fbcon,
 vga_switcheroo: Avoid race condition in fbcon setup
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com, 
 simona@ffwll.ch, deller@gmx.de, lukas@wunner.de, 
 ville.syrjala@linux.intel.com, sam@ravnborg.org, javierm@redhat.com, 
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
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

On Wed, Nov 5, 2025 at 12:11=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
>
> Protect vga_switcheroo_client_fb_set() with console lock. Avoids OOB
> access in fbcon_remap_all(). Without holding the console lock the call
> races with switching outputs.
>
> VGA switcheroo calls fbcon_remap_all() when switching clients. The fbcon
> function uses struct fb_info.node, which is set by register_framebuffer()=
.
> As the fb-helper code currently sets up VGA switcheroo before registering
> the framebuffer, the value of node is -1 and therefore not a legal value.
> For example, fbcon uses the value within set_con2fb_map() [1] as an index
> into an array.
>
> Moving vga_switcheroo_client_fb_set() after register_framebuffer() can
> result in VGA switching that does not switch fbcon correctly.
>
> Therefore move vga_switcheroo_client_fb_set() under fbcon_fb_registered()=
,
> which already holds the console lock. Fbdev calls fbcon_fb_registered()
> from within register_framebuffer(). Serializes the helper with VGA
> switcheroo's call to fbcon_remap_all().
>
> Although vga_switcheroo_client_fb_set() takes an instance of struct fb_in=
fo
> as parameter, it really only needs the contained fbcon state. Moving the
> call to fbcon initialization is therefore cleaner than before. Only amdgp=
u,
> i915, nouveau and radeon support vga_switcheroo. For all other drivers,
> this change does nothing.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Link: https://elixir.bootlin.com/linux/v6.17/source/drivers/video/fbdev/c=
ore/fbcon.c#L2942 # [1]

I haven't paged switcheroo into my head in a while, but this seems to
make sense so:
Acked-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  drivers/gpu/drm/drm_fb_helper.c  | 14 --------------
>  drivers/video/fbdev/core/fbcon.c |  9 +++++++++
>  2 files changed, 9 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_hel=
per.c
> index 53e9dc0543de..c0343ec16a57 100644
> --- a/drivers/gpu/drm/drm_fb_helper.c
> +++ b/drivers/gpu/drm/drm_fb_helper.c
> @@ -31,9 +31,7 @@
>
>  #include <linux/console.h>
>  #include <linux/export.h>
> -#include <linux/pci.h>
>  #include <linux/sysrq.h>
> -#include <linux/vga_switcheroo.h>
>
>  #include <drm/drm_atomic.h>
>  #include <drm/drm_drv.h>
> @@ -570,11 +568,6 @@ EXPORT_SYMBOL(drm_fb_helper_release_info);
>   */
>  void drm_fb_helper_unregister_info(struct drm_fb_helper *fb_helper)
>  {
> -       struct fb_info *info =3D fb_helper->info;
> -       struct device *dev =3D info->device;
> -
> -       if (dev_is_pci(dev))
> -               vga_switcheroo_client_fb_set(to_pci_dev(dev), NULL);
>         unregister_framebuffer(fb_helper->info);
>  }
>  EXPORT_SYMBOL(drm_fb_helper_unregister_info);
> @@ -1614,7 +1607,6 @@ static int drm_fb_helper_single_fb_probe(struct drm=
_fb_helper *fb_helper)
>         struct drm_client_dev *client =3D &fb_helper->client;
>         struct drm_device *dev =3D fb_helper->dev;
>         struct drm_fb_helper_surface_size sizes;
> -       struct fb_info *info;
>         int ret;
>
>         if (drm_WARN_ON(dev, !dev->driver->fbdev_probe))
> @@ -1635,12 +1627,6 @@ static int drm_fb_helper_single_fb_probe(struct dr=
m_fb_helper *fb_helper)
>
>         strcpy(fb_helper->fb->comm, "[fbcon]");
>
> -       info =3D fb_helper->info;
> -
> -       /* Set the fb info for vgaswitcheroo clients. Does nothing otherw=
ise. */
> -       if (dev_is_pci(info->device))
> -               vga_switcheroo_client_fb_set(to_pci_dev(info->device), in=
fo);
> -
>         return 0;
>  }
>
> diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/=
fbcon.c
> index 7f35ad66b462..863944530c8e 100644
> --- a/drivers/video/fbdev/core/fbcon.c
> +++ b/drivers/video/fbdev/core/fbcon.c
> @@ -66,6 +66,7 @@
>  #include <linux/string.h>
>  #include <linux/kd.h>
>  #include <linux/panic.h>
> +#include <linux/pci.h>
>  #include <linux/printk.h>
>  #include <linux/slab.h>
>  #include <linux/fb.h>
> @@ -78,6 +79,7 @@
>  #include <linux/interrupt.h>
>  #include <linux/crc32.h> /* For counting font checksums */
>  #include <linux/uaccess.h>
> +#include <linux/vga_switcheroo.h>
>  #include <asm/irq.h>
>
>  #include "fbcon.h"
> @@ -2894,6 +2896,9 @@ void fbcon_fb_unregistered(struct fb_info *info)
>
>         console_lock();
>
> +       if (info->device && dev_is_pci(info->device))
> +               vga_switcheroo_client_fb_set(to_pci_dev(info->device), NU=
LL);
> +
>         fbcon_registered_fb[info->node] =3D NULL;
>         fbcon_num_registered_fb--;
>
> @@ -3027,6 +3032,10 @@ static int do_fb_registered(struct fb_info *info)
>                 }
>         }
>
> +       /* Set the fb info for vga_switcheroo clients. Does nothing other=
wise. */
> +       if (info->device && dev_is_pci(info->device))
> +               vga_switcheroo_client_fb_set(to_pci_dev(info->device), in=
fo);
> +
>         return ret;
>  }
>
> --
> 2.51.1
>
