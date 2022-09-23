Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C72735E74A3
	for <lists+dri-devel@lfdr.de>; Fri, 23 Sep 2022 09:14:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C4FF10E44F;
	Fri, 23 Sep 2022 07:14:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com
 [209.85.222.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5852210E44F
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Sep 2022 07:14:39 +0000 (UTC)
Received: by mail-qk1-f171.google.com with SMTP id s9so7740687qkg.4
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Sep 2022 00:14:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=S3UyUtioqiLswQVfydApgd1DWgeD5a9i4NJMAx10xfU=;
 b=2gzg0s7wTKBkQDDvhrb2+j4zvpqFwuMwHkV2zErg4IeGzWb4+wuY7Z+8tf9CFLqntF
 kXLMeLGAYXto90IiPU9zPeLfZXXGEQprq/I/+w/v60t401C55G8r7TxwHrH4doBYpYvV
 9yQ5zt9DSahAtvyuSEXhbYl969qspLo/ReuqdGVODXEQP/vjGgKzkc0u3876uS8HWInl
 GAl4YLrCdGiDmIPU8B/6faObrw7QTQ9hsXO4mCrFAcGLnle4nS4yHuJNv2Zt/de6eFjM
 DxB0oJDkPyurYtj388JB6uTBoereRhoMo44oKO6Os7Zp2qJym+YexWHQKMbGymXdsI4+
 Ju3A==
X-Gm-Message-State: ACrzQf17KgidbvJY5WYeksby3kjY0cOigaH990tS9fHUj4hBqE2dBaNb
 6/E86PC/si8JAn5Ep3acmVOSnPoqiRG7pg==
X-Google-Smtp-Source: AMsMyM6V4oB7fKaWJlDB/j4VFQ6aHuig1fgFJ4nAkwHJNTdoTJ27hTWZW7Urm4a/XbQBAkt7GXkvMg==
X-Received: by 2002:a37:b981:0:b0:6ce:6113:3dcd with SMTP id
 j123-20020a37b981000000b006ce61133dcdmr4795092qkf.731.1663917277918; 
 Fri, 23 Sep 2022 00:14:37 -0700 (PDT)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com.
 [209.85.128.177]) by smtp.gmail.com with ESMTPSA id
 t6-20020a05622a01c600b0035bb84a4150sm5216963qtw.71.2022.09.23.00.14.36
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Sep 2022 00:14:36 -0700 (PDT)
Received: by mail-yw1-f177.google.com with SMTP id
 00721157ae682-3378303138bso122944707b3.9
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Sep 2022 00:14:36 -0700 (PDT)
X-Received: by 2002:a0d:de43:0:b0:349:31bd:e8d5 with SMTP id
 h64-20020a0dde43000000b0034931bde8d5mr6762932ywe.283.1663917276015; Fri, 23
 Sep 2022 00:14:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220922113306.11251-1-tzimmermann@suse.de>
 <20220922113306.11251-2-tzimmermann@suse.de>
In-Reply-To: <20220922113306.11251-2-tzimmermann@suse.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 23 Sep 2022 09:14:24 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW1echz6wc6Y2cfjrkPa2vZW+X4s83rXo7VebJ0E+qaqg@mail.gmail.com>
Message-ID: <CAMuHMdW1echz6wc6Y2cfjrkPa2vZW+X4s83rXo7VebJ0E+qaqg@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] drm/ofdrm: Add ofdrm for Open Firmware framebuffers
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
> Open Firmware provides basic display output via the 'display' node.
> DT platform code already provides a device that represents the node's
> framebuffer. Add a DRM driver for the device. The display mode and
> color format is pre-initialized by the system's firmware. Runtime
> modesetting via DRM is not possible. The display is useful during
> early boot stages or as error fallback.
>
> Similar functionality is already provided by fbdev's offb driver,
> which is insufficient for modern userspace. The old driver includes
> support for BootX device tree, which can be found on old 32-bit
> PowerPC Macintosh systems. If these are still in use, the
> functionality can be added to ofdrm or implemented in a new
> driver. As with simpledrm, the fbdev driver cannot be selected if
> ofdrm is already enabled.

Thanks for your patch!

> The driver has been tested on qemu's ppc64le emulation. The device
> hand-over has been tested with bochs.

Oh, tested on little-endian only ;-)

> --- /dev/null
> +++ b/drivers/gpu/drm/tiny/ofdrm.c
> +static const struct drm_format_info *display_get_validated_format(struct drm_device *dev,
> +                                                                 u32 depth)
> +{
> +       const struct drm_format_info *info;
> +       u32 format;
> +
> +       switch (depth) {
> +       case 8:
> +               format = drm_mode_legacy_fb_format(8, 8);
> +               break;
> +       case 15:
> +       case 16:
> +               format = drm_mode_legacy_fb_format(16, depth);
> +               break;
> +       case 32:
> +               format = drm_mode_legacy_fb_format(32, 24);

Shouldn't all of these use drm_driver_legacy_fb_format() (and the
driver set drm_mode_config.quirk_addfb_prefer_host_byte_order) to have
a chance of working on traditional big-endian PPC?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
