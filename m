Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B07491B795
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2024 09:06:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A6C710E0BA;
	Fri, 28 Jun 2024 07:05:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com
 [209.85.219.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B45110E051
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 07:05:56 +0000 (UTC)
Received: by mail-yb1-f180.google.com with SMTP id
 3f1490d57ef6-df481bf6680so243133276.3
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 00:05:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719558354; x=1720163154;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=R+FYZpltnsI5f0dWtxLVpiN9qP/1Z2ifl8T1bH4bPTE=;
 b=sRU8g7PsdwSa4HseAXFkAbah+JRbFLxPPW3LDf6pmq/uO7U1aZxN+7JYz+ZLnrPLVT
 FhN2r+8Kec8sPMBFmB6Azysb9QX4AoBX0v4xkC9wa03aWOAoZtgEKMq99ofWv8fTuYyZ
 maRBaqCsOJiYrOrtS/eDPLcEzZNO0JJUkS65aUC7RRhZGQ6i+AIuT5qZ0MDsQMdAc5Jk
 5v18OYeCNE2du+UqktERLWpOuCt/uiScicfI5b7V+OR0/FKTE2DBA4//cds4UKo9KSzz
 PsD4WTU8fVCRNYnrP8pdPQ1UC7dW3LgEYikBHzHeElMsu4A4+bbc5qQUWwN9SiUoGD/B
 xIBQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUyXb5kMhNbdOHDIttwLDl7oZt1YH+r3CmNUYhWU7spdV6XRVTZqvY+RtnSdTJO9CE9yDHb25ZPnnhtaQAZOw71F214bRggZwjmtbIM9J8Q
X-Gm-Message-State: AOJu0YwIgytTL4OQj+3BfXawuTpYWlclGYFUiWeVfWDqrZXt1xL1kUSQ
 Zb46eAtRznYPk0u+pDow83nyybc1EsIktg20WFeW5hU47jRqYYLmpAhRoVqw
X-Google-Smtp-Source: AGHT+IH6HeNBiaJ+193qHEXGnN+AfybofokgFmx/5zie/CoGe4iXyQ+7l6LyrIWdoAXTs1bVR5WIAA==
X-Received: by 2002:a25:dc8e:0:b0:e03:5f92:686a with SMTP id
 3f1490d57ef6-e035f9271a5mr314214276.41.1719558353745; 
 Fri, 28 Jun 2024 00:05:53 -0700 (PDT)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com.
 [209.85.128.177]) by smtp.gmail.com with ESMTPSA id
 3f1490d57ef6-e036170080bsm11688276.18.2024.06.28.00.05.53
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Jun 2024 00:05:53 -0700 (PDT)
Received: by mail-yw1-f177.google.com with SMTP id
 00721157ae682-64b417e1511so929047b3.3
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 00:05:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUjiZttYUlOYSTDnZ/yBsl21mOSTklkwuKY2IWhkgwFpWLVetWwIUabeOD88+13RY4/MWAKulufL4xGEN90m+LdPO1IZopg0iGsjMkLGkjD
X-Received: by 2002:a81:b049:0:b0:64b:4a32:850a with SMTP id
 00721157ae682-64b4a328848mr1657517b3.29.1719558352976; Fri, 28 Jun 2024
 00:05:52 -0700 (PDT)
MIME-Version: 1.0
References: <20240627173530.460615-1-thuth@redhat.com>
 <571556ed-17d2-4bcc-bb1f-fd4f827829c6@suse.de>
In-Reply-To: <571556ed-17d2-4bcc-bb1f-fd4f827829c6@suse.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 28 Jun 2024 09:05:40 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW2tk76CZAR=xCJTuwiotO+=J=VaQaozSZ9fLU6eWeWZg@mail.gmail.com>
Message-ID: <CAMuHMdW2tk76CZAR=xCJTuwiotO+=J=VaQaozSZ9fLU6eWeWZg@mail.gmail.com>
Subject: Re: [PATCH] drm/fbdev-generic: Fix framebuffer on big endian devices
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Thomas Huth <thuth@redhat.com>, dri-devel@lists.freedesktop.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-kernel@vger.kernel.org, 
 Javier Martinez Canillas <javierm@redhat.com>,
 Hamza Mahfooz <hamza.mahfooz@amd.com>
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

On Fri, Jun 28, 2024 at 8:07=E2=80=AFAM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
> Am 27.06.24 um 19:35 schrieb Thomas Huth:
> > Starting with kernel 6.7, the framebuffer text console is not working
> > anymore with the virtio-gpu device on s390x hosts. Such big endian fb
> > devices are usinga different pixel ordering than little endian devices,
> > e.g. DRM_FORMAT_BGRX8888 instead of DRM_FORMAT_XRGB8888.
> >
> > This used to work fine as long as drm_client_buffer_addfb() was still
> > calling drm_mode_addfb() which called drm_driver_legacy_fb_format()
> > internally to get the right format. But drm_client_buffer_addfb() has
> > recently been reworked to call drm_mode_addfb2() instead with the
> > format value that has been passed to it as a parameter (see commit
> > 6ae2ff23aa43 ("drm/client: Convert drm_client_buffer_addfb() to drm_mod=
e_addfb2()").
> >
> > That format parameter is determined in drm_fbdev_generic_helper_fb_prob=
e()
> > via the drm_mode_legacy_fb_format() function - which only generates
> > formats suitable for little endian devices. So to fix this issue
> > switch to drm_driver_legacy_fb_format() here instead to take the
> > device endianness into consideration.
> >
> > Fixes: 6ae2ff23aa43 ("drm/client: Convert drm_client_buffer_addfb() to =
drm_mode_addfb2()")
> > Closes: https://issues.redhat.com/browse/RHEL-45158
> > Signed-off-by: Thomas Huth <thuth@redhat.com>
>
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
>
>
> > ---
> >   drivers/gpu/drm/drm_fbdev_generic.c | 3 ++-
>
> This file is now called drm_fbdev_ttm.c in drm-misc-next. And a similar
> patch might be necessary for drm_fbdev_dma.c. The code in
> drm_fbdev_shmem.c apparently has it already.

We are getting too many copies of this logic...
(yup, had to fix them all up in my WIP support for R1 ;-)

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
