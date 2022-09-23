Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE7DB5E74B6
	for <lists+dri-devel@lfdr.de>; Fri, 23 Sep 2022 09:18:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B83C10E457;
	Fri, 23 Sep 2022 07:18:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
 [209.85.160.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DCAA10E457
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Sep 2022 07:18:32 +0000 (UTC)
Received: by mail-qt1-f177.google.com with SMTP id h21so7900312qta.3
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Sep 2022 00:18:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=6vg6B8D/hQyHxlC2HaS8TXm7SR0b9itjbd+F1YgR9rg=;
 b=BAdg12tEboXqbdjTTBlk3GyzDzS1x8vriAkkD4b0cVxbvLW2Yo0OGqClU/gNYO6e05
 aEM+QtJwDHMFgNtWMvdeFWYiV9mJLM/2p99TBetB3vM2+83w5F8bYFMMYaKsg1hyVNpK
 jbISGeJRLOuG+VqlZlWCXIccWZ9Xmx56UeEX2LO28XxHdKLPCAfULFgj0Y4SZlY9hooG
 gRoCStq/xGyshRQrrNCTNd0453ORna73lzuub9MtVzS/o/XXAc1M43gqpOX7rfxNlTwO
 IymVp7oQPSdSF7drdawsfDQng3z5IV8lMiVV8Uhvfbcwbo0HsUfU60nmCKX8MUjQ/DNF
 qHQA==
X-Gm-Message-State: ACrzQf0/7F49lHU5QTWX0nG0nflPRnEbzTP+bf/6U3OEhznlTycOeoLV
 OVnRfvSg/iAFb3/tspR9VXji7dbazVsjUA==
X-Google-Smtp-Source: AMsMyM5lnh05A0pnT9TYQ+dCPFgobOFVQytXhoRCpDdgHS9DVpuXz/enBSSAnFutjTEef2CtVNtzZw==
X-Received: by 2002:ac8:7d14:0:b0:35c:bdbe:5b97 with SMTP id
 g20-20020ac87d14000000b0035cbdbe5b97mr6121464qtb.272.1663917511289; 
 Fri, 23 Sep 2022 00:18:31 -0700 (PDT)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com.
 [209.85.128.180]) by smtp.gmail.com with ESMTPSA id
 u15-20020a05620a0c4f00b006cf19068261sm5682944qki.116.2022.09.23.00.18.28
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Sep 2022 00:18:29 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id
 00721157ae682-3378303138bso123021157b3.9
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Sep 2022 00:18:28 -0700 (PDT)
X-Received: by 2002:a81:78f:0:b0:34d:74c0:1110 with SMTP id
 137-20020a81078f000000b0034d74c01110mr7049955ywh.383.1663917508700; Fri, 23
 Sep 2022 00:18:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220922113306.11251-1-tzimmermann@suse.de>
 <20220922113306.11251-5-tzimmermann@suse.de>
In-Reply-To: <20220922113306.11251-5-tzimmermann@suse.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 23 Sep 2022 09:18:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXM2JmnVAgCjSAAf2swX=2T7h5wtFcfWZ5uJEbs5GCvqg@mail.gmail.com>
Message-ID: <CAMuHMdXM2JmnVAgCjSAAf2swX=2T7h5wtFcfWZ5uJEbs5GCvqg@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] drm/ofdrm: Support color management
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
Cc: linux-fbdev@vger.kernel.org, airlied@linux.ie, mpe@ellerman.id.au,
 deller@gmx.de, linuxppc-dev@lists.ozlabs.org, mark.cave-ayland@ilande.co.uk,
 javierm@redhat.com, dri-devel@lists.freedesktop.org, paulus@samba.org,
 maxime@cerno.tech, msuchanek@suse.de, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

On Thu, Sep 22, 2022 at 1:33 PM Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Support the CRTC's color-management property and implement each model's
> palette support.
>
> The OF hardware has different methods of setting the palette. The
> respective code has been taken from fbdev's offb and refactored into
> per-model device functions. The device functions integrate this
> functionality into the overall modesetting.
>
> As palette handling is a CRTC property that depends on the primary
> plane's color format, the plane's atomic_check helper now updates the
> format field in ofdrm's custom CRTC state. The CRTC's atomic_flush
> helper updates the palette for the format as needed.
>
> v3:
>         * lookup CRTC state with drm_atomic_get_new_crtc_state()
>         * access HW palette with writeb(), writel(), and readl() (Ben)
>         * declare register values as u32
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

Thanks for your patch!


> --- a/drivers/gpu/drm/tiny/ofdrm.c
> +++ b/drivers/gpu/drm/tiny/ofdrm.c

> +static void __iomem *ofdrm_qemu_cmap_ioremap(struct ofdrm_device *odev,
> +                                            struct device_node *of_node,
> +                                            u64 fb_base)
> +{
> +#ifdef __BIG_ENDIAN
> +       static const __be32 io_of_addr[3] = { 0x01000000, 0x0, 0x0 };
> +#else
> +       static const __be32 io_of_addr[3] = { 0x00000001, 0x0, 0x0 };
> +#endif

You can easily get rid of the #ifdef:

    static const __be32 io_of_addr[3] = { cpu_to_be32(0x01000000), 0x0, 0x0 };

And probably sparse ("make C=2") will complain about the plain zeros,
so "cpu_to_be32(0x0)" as well.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
