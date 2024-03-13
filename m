Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D072487A486
	for <lists+dri-devel@lfdr.de>; Wed, 13 Mar 2024 10:04:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5823210F710;
	Wed, 13 Mar 2024 09:04:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com
 [209.85.128.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 743A710E013
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Mar 2024 09:04:08 +0000 (UTC)
Received: by mail-yw1-f176.google.com with SMTP id
 00721157ae682-60a0a54869bso5993987b3.1
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Mar 2024 02:04:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710320646; x=1710925446;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SQj89R8jw/U+vRlJLTZpgpmmLjQKmUru9APcRiqZ1z8=;
 b=pCjszCM635Fkv3EBVnRjZR104ear9PfCCNWz2294kFd5sY0u0WDDt9o9yJHoWjhnra
 MYJc1rbXIrc3jMmcfhlnt6pU2wwNLLvKAEI3nhGZZpJyt2GgScRF07+ij48jTd3XGcPT
 OFQTKbEyL1A/XU+ZmqFQNxUImsne43pUkkz2NGgYnyXnYstBZaf3iRXOc5Lc7FPERoYR
 AkIN22PrBoG4h+j4qxqDeSSegvdqgfHlupV5uZzjt5bh2B1tKu6vyzPGRNk5VHWvlhQw
 u9AzYHMOGVVc89D7RCH7JXlYCuNSA66pw5FOJJsXJuLQc5UPVzjMpBamcXeYn2PMaoQ/
 DZUw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUo073qAtflcUTzYyHJJIPqZw4xiKbtfDiZb3QsdYgq9Pg4WTth4pLbl19sK5mQX1S8MLvAmPtq9MZLd/UzxE7B21pkC699ABNtQliBoiN0
X-Gm-Message-State: AOJu0YwCYob0u0Pmj2Y01z3IwoC28Y3W+cyMV5ZONf0BvysXoigb5zH+
 97Q11fy4XnmDsuG/rda0v7GrDfRPa6lO0qmskMvmwq1zt/V3I4+VXa1UtTDjlWE=
X-Google-Smtp-Source: AGHT+IGgdbUXWaXUyPpMhlP6ZmjZN/+vVDjnu5/DuvDI768rYaoPadum/Vgvr8sd6DeCFQFjI5O1Zg==
X-Received: by 2002:a81:6c88:0:b0:60a:6b1a:d8bf with SMTP id
 h130-20020a816c88000000b0060a6b1ad8bfmr801266ywc.15.1710320645575; 
 Wed, 13 Mar 2024 02:04:05 -0700 (PDT)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com.
 [209.85.128.173]) by smtp.gmail.com with ESMTPSA id
 j13-20020a81fe0d000000b00609fc2bd948sm2320428ywn.79.2024.03.13.02.04.04
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Mar 2024 02:04:05 -0700 (PDT)
Received: by mail-yw1-f173.google.com with SMTP id
 00721157ae682-60a0a54869bso5993697b3.1
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Mar 2024 02:04:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUQQqm1hC+lfW7mV0NAqwPL/M1o3d9DhpF3HDmEQg9efGf2VmS33u+MUN/MUO7MNdyhOZY8HEoMviu1YYHBkg3XqPxGMNImZHosGS+IHVdD
X-Received: by 2002:a81:4987:0:b0:609:ecdf:7c9c with SMTP id
 w129-20020a814987000000b00609ecdf7c9cmr1202609ywa.19.1710320644604; Wed, 13
 Mar 2024 02:04:04 -0700 (PDT)
MIME-Version: 1.0
References: <20240312154834.26178-1-tzimmermann@suse.de>
 <20240312154834.26178-9-tzimmermann@suse.de>
 <CAMuHMdVqWF=M=6aPRxZ0MBqPVM_wk2x+Oike6za754riHWusSA@mail.gmail.com>
 <ebea6554-835a-42d6-a226-f4f3480a8846@suse.de>
In-Reply-To: <ebea6554-835a-42d6-a226-f4f3480a8846@suse.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 13 Mar 2024 10:03:52 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU1wXhhhfaz9ew5xx2AVoKDdjUxqOGVVXwp4FSDmYFUYw@mail.gmail.com>
Message-ID: <CAMuHMdU1wXhhhfaz9ew5xx2AVoKDdjUxqOGVVXwp4FSDmYFUYw@mail.gmail.com>
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

On Wed, Mar 13, 2024 at 9:19=E2=80=AFAM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
> Am 12.03.24 um 17:14 schrieb Geert Uytterhoeven:
> > On Tue, Mar 12, 2024 at 4:48=E2=80=AFPM Thomas Zimmermann <tzimmermann@=
suse.de> wrote:
> >> Add an fbdev emulation for SHMEM-based memory managers. The code is
> >> similar to fbdev-generic, but does not require an addition shadow
> >> buffer for mmap(). Fbdev-shmem operates directly on the buffer object'=
s
> >> SHMEM pages. Fbdev's deferred-I/O mechanism updates the hardware state
> >> on write operations.
> >>
> >> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> > Thanks for your patch!
> >
> >> --- /dev/null
> >> +++ b/drivers/gpu/drm/drm_fbdev_shmem.c
> >> +static int drm_fbdev_shmem_helper_fb_probe(struct drm_fb_helper *fb_h=
elper,
> >> +                                          struct drm_fb_helper_surfac=
e_size *sizes)
> >> +{
> >> +       struct drm_client_dev *client =3D &fb_helper->client;
> >> +       struct drm_device *dev =3D fb_helper->dev;
> >> +       struct drm_client_buffer *buffer;
> >> +       struct drm_gem_shmem_object *shmem;
> >> +       struct drm_framebuffer *fb;
> >> +       struct fb_info *info;
> >> +       u32 format;
> >> +       struct iosys_map map;
> >> +       int ret;
> >> +
> >> +       drm_dbg_kms(dev, "surface width(%d), height(%d) and bpp(%d)\n"=
,
> >> +                   sizes->surface_width, sizes->surface_height,
> >> +                   sizes->surface_bpp);
> >> +
> >> +       format =3D drm_mode_legacy_fb_format(sizes->surface_bpp, sizes=
->surface_depth);
> > Oops, one more caller of the imprecise
> > let's-guess-the-format-from-bpp-and-depth machinery to get rid of...
>
> Right, that has been discussed in another thread. I'll change this call
> to the drm_driver_() function.

You mean drm_driver_legacy_fb_format()? That has the same issues.

> >> +       buffer =3D drm_client_framebuffer_create(client, sizes->surfac=
e_width,
> >> +                                              sizes->surface_height, =
format);
> > [...]
> >
> >> +}
> >> +/**
> >> + * drm_fbdev_shmem_setup() - Setup fbdev emulation for GEM SHMEM help=
ers
> >> + * @dev: DRM device
> >> + * @preferred_bpp: Preferred bits per pixel for the device.
> >> + *                 32 is used if this is zero.
> >> + *
> >> + * This function sets up fbdev emulation for GEM DMA drivers that sup=
port
> >> + * dumb buffers with a virtual address and that can be mmap'ed.
> >> + * drm_fbdev_shmem_setup() shall be called after the DRM driver regis=
tered
> >> + * the new DRM device with drm_dev_register().
> >> + *
> >> + * Restore, hotplug events and teardown are all taken care of. Driver=
s that do
> >> + * suspend/resume need to call drm_fb_helper_set_suspend_unlocked() t=
hemselves.
> >> + * Simple drivers might use drm_mode_config_helper_suspend().
> >> + *
> >> + * This function is safe to call even when there are no connectors pr=
esent.
> >> + * Setup will be retried on the next hotplug event.
> >> + *
> >> + * The fbdev is destroyed by drm_dev_unregister().
> >> + */
> >> +void drm_fbdev_shmem_setup(struct drm_device *dev, unsigned int prefe=
rred_bpp)
> > As this is a completely new function, can we please get a
> > preferred_format parameter instead?
>
> An understandable question. But as it is, the patchset has a trivial
> change in each driver. And the preferred_bpp parameter has the same
> meaning as the bpp value in the video=3D parameter. So it's ok-ish for no=
w.

OK.

> Using a format parameter here is really a much larger update and touches
> the internals of the fbdev emulation. I'm not even sure that we should
> have a parameter at all. Since in-kernel clients should behave like
> userspace clients, we could try to figure out the format from the
> driver's primary planes. That's a patchset of its own.

How do you figure out "the" format from the driver's primary plane?
Isn't that a list of formats (always including XR24) , so the driver
still needs to specify a preferred format?

A while ago, I had a look into replacing preferred_{depth,bpp} by
preferred_format, but I was held back by the inconsistencies in some
drivers (e.g. depth 24 vs. 32).  Perhaps an incremental approach
(use preferred_format if available, else fall back to legacy
preferred_{depth,bpp} handling) would be more suitable?

FTR, my main use-case is letting fbdev emulation distinguish between
DRM_FORMAT_Rx and DRM_FORMAT_Cx, which share the values of depth
and bpp.

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
