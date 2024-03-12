Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E588798BC
	for <lists+dri-devel@lfdr.de>; Tue, 12 Mar 2024 17:15:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0BE210E0E3;
	Tue, 12 Mar 2024 16:15:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com
 [209.85.128.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6231510E0E3
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Mar 2024 16:15:01 +0000 (UTC)
Received: by mail-yw1-f181.google.com with SMTP id
 00721157ae682-609f1f97864so56857887b3.0
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Mar 2024 09:15:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710260099; x=1710864899;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5zhIqrp+JPMaViw5gjMSbfJFkQ4tb5ZNwsMB/45s1rM=;
 b=cocQeK9vxvlpyD1fJtjzjBLj7VYWpsxqTFu3U2A50te3R9dIV+DvroEKJO/qLyw4dd
 6jZ0iobtcJAot/HAPYcDCnosr0xtRPfZJV9Tthd9C2A0A/3P3Qna5/wXb2WyUBdfpUkj
 ZOwC22JTCVk0S8Gs0ej2qhWVqiRnt1DazoJ/LhvrU232XdY4E9KhrlrwZ34DsF0GZIzl
 R4xfBxByIT1Oueei9wxFhICwyhSvfuDvdJ3l/WE7962O8skSM18mHZx2tnnicwYuVqGx
 Bn50M+u7vuAsBJZxLPBgqGK3bnFtcQ121xA2xyAFlr8a3g7OGhDxFuXTgy2I8IhlYaIB
 5qpA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUzhs+Uk2DdzwCV37VJpvx0vm8ZJM1NOTIPwBEcJ3GljZCStsA0I3+KYL0WDZq/wqPGHj+Rk/solcIPpLD8V3yPjhW4pNI3S+nhDGHwiXnm
X-Gm-Message-State: AOJu0YySaD0hhyuEG+EKfQ+P5gMZQSlzqT4wRrxtqF8xWURZCxOk1QFw
 gsPQuH1hC1wAR2BNk32Z9TAoFJRcqV3nc3GGNCWmyBc5wLbDK0ymht3EkTyV37M=
X-Google-Smtp-Source: AGHT+IGE3UmjrTK39uwhsvb5hAOn1LIvehg2s5/H9JedVVSOG3NrTcbwmlCUhIPpPYWfy5bT/nCwKw==
X-Received: by 2002:a0d:eb53:0:b0:609:fef9:77b0 with SMTP id
 u80-20020a0deb53000000b00609fef977b0mr9532361ywe.37.1710260098823; 
 Tue, 12 Mar 2024 09:14:58 -0700 (PDT)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com.
 [209.85.219.174]) by smtp.gmail.com with ESMTPSA id
 g78-20020a815251000000b006098431a49dsm1974408ywb.124.2024.03.12.09.14.57
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Mar 2024 09:14:58 -0700 (PDT)
Received: by mail-yb1-f174.google.com with SMTP id
 3f1490d57ef6-db3a09e96daso4887986276.3
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Mar 2024 09:14:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVx8r7c3l3iNJsL+FKe5Pyv33FwBilwyz85wugV/MqoWSncjr09iVakF/MCHNEO1GO+OWocL1aD4NxP6LQjT/NFIxSLsg528ZsdRjvUMquV
X-Received: by 2002:a25:2b01:0:b0:dcf:fc74:358a with SMTP id
 r1-20020a252b01000000b00dcffc74358amr6857356ybr.10.1710260097591; Tue, 12 Mar
 2024 09:14:57 -0700 (PDT)
MIME-Version: 1.0
References: <20240312154834.26178-1-tzimmermann@suse.de>
 <20240312154834.26178-9-tzimmermann@suse.de>
In-Reply-To: <20240312154834.26178-9-tzimmermann@suse.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 12 Mar 2024 17:14:46 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVqWF=M=6aPRxZ0MBqPVM_wk2x+Oike6za754riHWusSA@mail.gmail.com>
Message-ID: <CAMuHMdVqWF=M=6aPRxZ0MBqPVM_wk2x+Oike6za754riHWusSA@mail.gmail.com>
Subject: Re: [PATCH 08/43] drm/fbdev: Add fbdev-shmem
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: daniel@ffwll.ch, airlied@gmail.com, deller@gmx.de, javierm@redhat.com, 
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
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

Hi Thomas,

On Tue, Mar 12, 2024 at 4:48=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
> Add an fbdev emulation for SHMEM-based memory managers. The code is
> similar to fbdev-generic, but does not require an addition shadow
> buffer for mmap(). Fbdev-shmem operates directly on the buffer object's
> SHMEM pages. Fbdev's deferred-I/O mechanism updates the hardware state
> on write operations.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Thanks for your patch!

> --- /dev/null
> +++ b/drivers/gpu/drm/drm_fbdev_shmem.c

> +static int drm_fbdev_shmem_helper_fb_probe(struct drm_fb_helper *fb_help=
er,
> +                                          struct drm_fb_helper_surface_s=
ize *sizes)
> +{
> +       struct drm_client_dev *client =3D &fb_helper->client;
> +       struct drm_device *dev =3D fb_helper->dev;
> +       struct drm_client_buffer *buffer;
> +       struct drm_gem_shmem_object *shmem;
> +       struct drm_framebuffer *fb;
> +       struct fb_info *info;
> +       u32 format;
> +       struct iosys_map map;
> +       int ret;
> +
> +       drm_dbg_kms(dev, "surface width(%d), height(%d) and bpp(%d)\n",
> +                   sizes->surface_width, sizes->surface_height,
> +                   sizes->surface_bpp);
> +
> +       format =3D drm_mode_legacy_fb_format(sizes->surface_bpp, sizes->s=
urface_depth);

Oops, one more caller of the imprecise
let's-guess-the-format-from-bpp-and-depth machinery to get rid of...

> +       buffer =3D drm_client_framebuffer_create(client, sizes->surface_w=
idth,
> +                                              sizes->surface_height, for=
mat);

[...]

> +}

> +/**
> + * drm_fbdev_shmem_setup() - Setup fbdev emulation for GEM SHMEM helpers
> + * @dev: DRM device
> + * @preferred_bpp: Preferred bits per pixel for the device.
> + *                 32 is used if this is zero.
> + *
> + * This function sets up fbdev emulation for GEM DMA drivers that suppor=
t
> + * dumb buffers with a virtual address and that can be mmap'ed.
> + * drm_fbdev_shmem_setup() shall be called after the DRM driver register=
ed
> + * the new DRM device with drm_dev_register().
> + *
> + * Restore, hotplug events and teardown are all taken care of. Drivers t=
hat do
> + * suspend/resume need to call drm_fb_helper_set_suspend_unlocked() them=
selves.
> + * Simple drivers might use drm_mode_config_helper_suspend().
> + *
> + * This function is safe to call even when there are no connectors prese=
nt.
> + * Setup will be retried on the next hotplug event.
> + *
> + * The fbdev is destroyed by drm_dev_unregister().
> + */
> +void drm_fbdev_shmem_setup(struct drm_device *dev, unsigned int preferre=
d_bpp)

As this is a completely new function, can we please get a
preferred_format parameter instead?

> +{
> +       struct drm_fb_helper *fb_helper;
> +       int ret;
> +
> +       drm_WARN(dev, !dev->registered, "Device has not been registered.\=
n");
> +       drm_WARN(dev, dev->fb_helper, "fb_helper is already set!\n");
> +
> +       fb_helper =3D kzalloc(sizeof(*fb_helper), GFP_KERNEL);
> +       if (!fb_helper)
> +               return;
> +       drm_fb_helper_prepare(dev, fb_helper, preferred_bpp, &drm_fbdev_s=
hmem_helper_funcs);
> +
> +       ret =3D drm_client_init(dev, &fb_helper->client, "fbdev", &drm_fb=
dev_shmem_client_funcs);
> +       if (ret) {
> +               drm_err(dev, "Failed to register client: %d\n", ret);
> +               goto err_drm_client_init;
> +       }
> +
> +       drm_client_register(&fb_helper->client);
> +
> +       return;
> +
> +err_drm_client_init:
> +       drm_fb_helper_unprepare(fb_helper);
> +       kfree(fb_helper);
> +}
> +EXPORT_SYMBOL(drm_fbdev_shmem_setup);


Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
