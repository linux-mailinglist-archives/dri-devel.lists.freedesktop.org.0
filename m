Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B13C43778A
	for <lists+dri-devel@lfdr.de>; Fri, 22 Oct 2021 14:55:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C0D96E7D7;
	Fri, 22 Oct 2021 12:55:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDBE86E7D7
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Oct 2021 12:55:26 +0000 (UTC)
Received: from mail-wm1-f54.google.com ([209.85.128.54]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1N8oKc-1mijL01B7W-015oIe for <dri-devel@lists.freedesktop.org>; Fri, 22 Oct
 2021 14:55:24 +0200
Received: by mail-wm1-f54.google.com with SMTP id
 b189-20020a1c1bc6000000b0030da052dd4fso2404171wmb.3
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Oct 2021 05:55:22 -0700 (PDT)
X-Gm-Message-State: AOAM53108fPiyt2gaTBe0fNuNZUV0HEImvdHlhRQsaHz8SycKRWtfccI
 A1cbEkBQYRKYJERU+DX8gN0LpMvWU+PWXOMYacA=
X-Google-Smtp-Source: ABdhPJwEV2iQRiHu7tHOq0Tg/KosKEEcZfnAwGAH+h0A8YgsCOoy22Q0e8f0BPRtJ3aJbJ48oOqjszYkIVxvZfE1mWI=
X-Received: by 2002:a1c:2358:: with SMTP id j85mr28965908wmj.1.1634907321785; 
 Fri, 22 Oct 2021 05:55:21 -0700 (PDT)
MIME-Version: 1.0
References: <488e87e6-00af-d514-dc95-25bce5160eda@gmx.com>
In-Reply-To: <488e87e6-00af-d514-dc95-25bce5160eda@gmx.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 22 Oct 2021 14:55:05 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2jKg-8WgsrBb5orOj3LZHPEa8J=MZhRFaQzxHV4JEnDg@mail.gmail.com>
Message-ID: <CAK8P3a2jKg-8WgsrBb5orOj3LZHPEa8J=MZhRFaQzxHV4JEnDg@mail.gmail.com>
Subject: Re: Linux >= 5.14.12 and 5.15-rc5 fail to show anything on the screen
 with CONFIG_DRM_SIMPLEDRM=y
To: "Artem S. Tashkinov" <aros@gmx.com>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 Joshua Strobl <joshua@stroblindustries.com>, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:94dEjx6Aac5YMsLtuedskFWZhKgHVrAqhqcYaNm/jvxblitJCzh
 MpO3TolbKpl2bnMMhPmwuP7M0+ThbsZzNZ4Af0qat70DPcaSP36gkbl3y8I7w8WmeWPC8hM
 CeVhkF6LLI4uotssesuPnp10pIV/QlG/9trXHCtw+19/13LTI6ZTnaHrzQ9403MYtb7rwS4
 nh1zUbIE8A8gU8IhsjC6g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:w+chp9I3MEw=:opBZ0fo2DGum/8ld4PE9eQ
 gmDKUL2uQVsD7xna/SLc43ycRPBj4j/CD9beQUbOUKGjLwdpMtY5zHigSCLjgCgMojMuemLn8
 FVCiXOSge/8tBs7Z67Hv+v4MIaRvDvQNWVtEGypgg2V4FrwePgsKtMmwAwJqbzPZXPWTTAn5c
 1ukQq+hwP9tejoMmEe3n2qpphIk0soNSDVbKhj3MHhV4mmoA5DZAlw8jaEtEwCYpr0lrSlcP8
 JpjYU3oaWmGmQma2V6idwrd7I6zb25Y/wTrFdJ+F1y8iGaL6RTvKuwjCPyFvCOUz5Iy11OEKh
 eHkULtGvpERlywRJmkfvvGG8bP9xuxZJ5E0zn9820+V0cKDyMQjcaLC9VpMhRUWDa87P25rRa
 I9ZRlrJoPVmxdW+Lgc2JCm8c3J4iivbB23uxK2dw3THhHZMbOTgrYZ0EmCC0F53GgUwVf6LnS
 89sc2f4+lOmFtzWMLWdIJrE10weL888nBRr6WHe6PF05aWakqY768wwAIUs9lRxrADkMDC8OU
 unwHG3tNKAR4Uzqra/c6s3MnDIsCoahK7ATERNrUoA/AixAePG8+lACGtU+pLG8T0SkLXQx2W
 cnV7+C/i/5gz7P02d+eF3TKAl/d87Fj1rFFhcmd9q/6V8pIZ1+DM8thGBFjiZJFxZjGV9FUb6
 06iJZstbi+fy4Ue32/ZtksvlYkHquCeK9o60j+P1qSTh17ZJQKSijl13WTXhOKn1sorI=
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

On Fri, Oct 22, 2021 at 2:15 PM Artem S. Tashkinov <aros@gmx.com> wrote:
> Kernel 5.14.12 introduced this change, git commit
> ec7cc3f74b4236860ce612656aa5be7936d1c594:
>
> --- a/linux-5.14.11/drivers/video/fbdev/Kconfig
> +++ b/linux-5.14.12/drivers/video/fbdev/Kconfig
> @@ -2191,8 +2191,9 @@ config FB_HYPERV
>        This framebuffer driver supports Microsoft Hyper-V Synthetic Video.
>
>   config FB_SIMPLE
> -   bool "Simple framebuffer support"
> -   depends on (FB = y) && !DRM_SIMPLEDRM
> +   tristate "Simple framebuffer support"
> +   depends on FB
> +   depends on !DRM_SIMPLEDRM
>      select FB_CFB_FILLRECT
>      select FB_CFB_COPYAREA
>      select FB_CFB_IMAGEBLIT
>
>
> However if you enable CONFIG_DRM_SIMPLEDRM=y along with it, the system
> will show a black screen on boot while logging these messages:
>
> [drm] Initialized simpledrm 1.0.0 20200625 for simple-framebuffer.0 on
> minor 0
> simple-framebuffer simple-framebuffer.0: [drm] *ERROR* fbdev: Failed to
> setup generic emulation (ret=-22)
> fbcon: Taking over console

If you want to help debug this, you can try adding a few printk
statements around this code that could run into -EINVAL (22):

drm_file_alloc()
...
        if (dev->driver->open) {
                ret = dev->driver->open(dev, file);
                if (ret < 0)
                        goto out_prime_destroy;
        }

or
static int drm_fb_helper_single_fb_probe(struct drm_fb_helper *fb_helper,
                                         int preferred_bpp)
...
        ret = (*fb_helper->funcs->fb_probe)(fb_helper, &sizes);
or
static int do_fbcon_takeover(int show_logo)
...
        if (!num_registered_fb)
                return -ENODEV;

and then go from there.

> When CONFIG_DRM_SIMPLEDRM is disabled it proceeds to boot normally:
> simple-framebuffer simple-framebuffer.0: framebuffer at 0xe1000000,
> 0x300000 bytes
> simple-framebuffer simple-framebuffer.0: format=a8r8g8b8,
> mode=1024x768x32, linelength=4096
> fbcon: Deferring console take-over
> simple-framebuffer simple-framebuffer.0: fb0: simplefb registered!

Ok, good, so FB_SIMPLE continues to work as expected if it's built-in.

When the driver is a loadable module, it should work once you load
the module, but that is only after the system is fully booted. It's
possible that there is a bug with the module loading.

In the meantime I would suggest to keep using FB_SIMPLE=y if that
works for you.

       Arnd
