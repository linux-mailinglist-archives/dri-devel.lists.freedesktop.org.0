Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FF2957CD27
	for <lists+dri-devel@lfdr.de>; Thu, 21 Jul 2022 16:17:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A32C390DE4;
	Thu, 21 Jul 2022 14:17:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com
 [209.85.160.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F12D890DEE
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jul 2022 14:17:13 +0000 (UTC)
Received: by mail-qt1-f178.google.com with SMTP id b21so1308095qte.12
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jul 2022 07:17:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IlgcF/GK95Rjt3bgvSjXlIF1TgHRln+uJln/ZYG0UwI=;
 b=WQeb2q0+uidu04NNoCJNf2F8uZHLVkkqCs5PZzXXnQIChF34hhk/WXpHziKt0DUB15
 TtQP4c7AOkee3cH5HwIWRL5xP2CFkaN0WA3w72f61TN3NIyRRvQph1yu5I8t3Ur3bbHS
 cKDaUurgbtQKbs4iiXKosQNmlOVH3hF9DhuA1vD5RvBMLzSgUbjeNgiK/wes4L+bOlCa
 UwDJKK+zRCB3TgDXI0/7QYxPg9TuFvnj1ME9DL6Jwzn5fT2f9prdE2Sbf/8leVFjnXbq
 c9HbXMkV8M6Hb8ltK3I3JtCPZEousKHcBM98OM/t0gQYHOxxxVPelEtmPrTDTwaDP8nl
 se6w==
X-Gm-Message-State: AJIora+XybGjksxpCyNRJmJfOQ3L+3HmTM51j0WjbTsAc+LdWM+Lhbr/
 hRwutSusVP0oiUbIcAErYJlUirw0ISHYKg==
X-Google-Smtp-Source: AGRyM1vvjW2kX+E0I1J40+dOsLNN4WKt8rHlw9S/gUq6Jwtvi1hL1sww3QigKgfEtGLyOaEd/MJmIQ==
X-Received: by 2002:ac8:5c4d:0:b0:31e:f794:1b18 with SMTP id
 j13-20020ac85c4d000000b0031ef7941b18mr12757166qtj.282.1658413032773; 
 Thu, 21 Jul 2022 07:17:12 -0700 (PDT)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com.
 [209.85.128.172]) by smtp.gmail.com with ESMTPSA id
 bl24-20020a05620a1a9800b006a6bb044740sm1490442qkb.66.2022.07.21.07.17.11
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Jul 2022 07:17:12 -0700 (PDT)
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-31e64ca5161so18816027b3.1
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jul 2022 07:17:11 -0700 (PDT)
X-Received: by 2002:a81:6088:0:b0:31e:79fd:3dfa with SMTP id
 u130-20020a816088000000b0031e79fd3dfamr4529972ywb.47.1658413031348; Thu, 21
 Jul 2022 07:17:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220718072322.8927-1-tzimmermann@suse.de>
 <20220718072322.8927-7-tzimmermann@suse.de>
In-Reply-To: <20220718072322.8927-7-tzimmermann@suse.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 21 Jul 2022 16:17:00 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVnZDu2jZyUsuCG_Z+NRUoJ_0bK2zxezo92V2XTuRgzdQ@mail.gmail.com>
Message-ID: <CAMuHMdVnZDu2jZyUsuCG_Z+NRUoJ_0bK2zxezo92V2XTuRgzdQ@mail.gmail.com>
Subject: Re: [PATCH v2 06/11] fbdev: Remove conflicting devices on PCI bus
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Helge Deller <deller@gmx.de>, linux-staging@lists.linux.dev,
 Javier Martinez Canillas <javierm@redhat.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Maxime Ripard <maxime@cerno.tech>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

On Mon, Jul 18, 2022 at 9:24 AM Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Remove firmware devices on the PCI bus, by calling
> aperture_remove_conflicting_pci_devices() in the probe function of
> each related fbdev driver. iSo far, most of these drivers did not
> remove conflicting VESA or EFI devices, or outride failed for
> resource conflicts (i.e., matroxfb.) This must have been broken
> for quite some time.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

Thanks for your patch!

> --- a/drivers/video/fbdev/tgafb.c
> +++ b/drivers/video/fbdev/tgafb.c
> @@ -12,6 +12,7 @@
>   *  more details.
>   */
>
> +#include <linux/aperture.h>
>  #include <linux/bitrev.h>
>  #include <linux/compiler.h>
>  #include <linux/delay.h>
> @@ -106,6 +107,12 @@ static struct pci_driver tgafb_pci_driver = {
>  static int tgafb_pci_register(struct pci_dev *pdev,
>                               const struct pci_device_id *ent)
>  {
> +       int ret;
> +
> +       ret = aperture_remove_conflicting_pci_devices(pdev, "tgafb");
> +       if (ret)
> +               return ret;
> +
>         return tgafb_register(&pdev->dev);
>  }

I am wondering which driver could possibly conflict with TGA?

Probably there are a few other drivers in the same category (tdfxfb?).

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
