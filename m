Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEAD743685B
	for <lists+dri-devel@lfdr.de>; Thu, 21 Oct 2021 18:51:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 254F16ECD2;
	Thu, 21 Oct 2021 16:51:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2c.google.com (mail-oo1-xc2c.google.com
 [IPv6:2607:f8b0:4864:20::c2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D4296ECD2
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Oct 2021 16:51:52 +0000 (UTC)
Received: by mail-oo1-xc2c.google.com with SMTP id
 o26-20020a4abe9a000000b002b74bffdef0so301687oop.12
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Oct 2021 09:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ob5PLxDR2eB9FDkXitaNSYrf2mgKeu2sUJGtm5GFDys=;
 b=Hv4wX6WevG7UsonZZJW2ZqkwMUyb+bULZcgM+QXqj9+1e6u1LG4+WNK+4YSD+7FaVv
 e8PRTScwd/gnxzNvUKoBd7dbrpfmTIM3kMNjKx7fPnn85afFuKNgWGTyjWFB+V5EQgHt
 ntrw6DLoVXWiTjq1uZb910fuBPnwbMwVhnNZ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ob5PLxDR2eB9FDkXitaNSYrf2mgKeu2sUJGtm5GFDys=;
 b=cf5CML2Sx0QO2KLUJp84ZRHT1UrZtFlFoYdh68OOTqe+FtpkN1TcELIf+Ld1ajOb1l
 d+FXMiGCm3oOkTBE+35KI4xPHGyCLyw8ZLPEe+WDfCTL9yEolBUh1xID5m2ycs9mL11p
 QLMZ5GPtzmU4cUeGsk5HU24tXFHrceF+l3/TQEHLjYOQwK8I6vZZI+quCT14RkneXBsF
 3eCn0kFkHxHn3cUF/v+sfO4pJkdLTBIkuOebDjvMlM4PggilV1pK95JscJVbOMVJPOyZ
 gYK3vpINCwTlYkB5ikpHA/oZPf8Ktlp4OnD7KcJ3IKpNwmD+/n3Yt+rrzoGmhCMqWaqT
 IwDw==
X-Gm-Message-State: AOAM533bDMzGoFr61ASnJZma5GWyfBzfiex7itvlG9vWlVwr0sMed2eO
 koZ1kVvJOpJmXxKH12SPIK70bW/GicpfxZrPSHBcPl/sc1ItCA==
X-Google-Smtp-Source: ABdhPJwEHR465YIoZ6TJOoOIizjb7N0gbdEIYqO5hNxKjv8Tm/lyLFj8BD9p1dqilhW/PGRdXPrX8/lD8gtuq6arXvU=
X-Received: by 2002:a4a:b90d:: with SMTP id x13mr5269753ooo.25.1634835111714; 
 Thu, 21 Oct 2021 09:51:51 -0700 (PDT)
MIME-Version: 1.0
References: <20211020131941.15367-1-tzimmermann@suse.de>
 <877de6mu1x.fsf@intel.com>
In-Reply-To: <877de6mu1x.fsf@intel.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 21 Oct 2021 18:51:40 +0200
Message-ID: <CAKMK7uEFDEvTuca52K5U4A24k3J-Hjnv8=aGBF-jCmW6Wq=XqA@mail.gmail.com>
Subject: Re: [PATCH 0/3] drm: Move several files from DRM core into modules
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Dave Airlie <airlied@linux.ie>, dri-devel <dri-devel@lists.freedesktop.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 21, 2021 at 2:38 PM Jani Nikula <jani.nikula@linux.intel.com> wrote:
>
> On Wed, 20 Oct 2021, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> > Move a number of files into modules and behind config options.
> >
> > So far, early boot graphics was provided by fbdev. With simpledrm, and
> > possibly other generic DRM drivers, it's now possible to have general
> > early-boot output with DRM. This requires the DRM core to be linked into
> > the kernel binary image.
> >
> > The reduction in size here is only ~1%, but the patchset is part of a
> > larger effort to reduce the size of the DRM core module.
>
> I think the main problem is really that of organization. You have all of
> the files under drivers/gpu/drm/ and the only way to know which module
> the files belong to is to look at the Makefile and the Kconfig. It's not
> obvious based on the file names or directory, at all. And there are
> nearly a hundred drm_*.c files there!
>
> We also seem to have stuff depend on DRM alone, while functionally they
> should really depend on DRM_KMS_HELPER too.
>
> The subdirectories under drm/ also don't have any distinction between
> being part of drm core and helpers or drivers. We have lib, scheduler,
> selftests, and ttm next to the drivers.
>
> We should start adding drm_* subdirectories, and moving the modules
> separate from drm core there. We should rename the current non-driver
> directories drm_*. We need better structure.

Yeah it might be time for drm/core and drm/helpers or maybe even
split-up helpers, dunno. drm/core probably needs to contain also all
the legacy cruft since Kbuild doesn't support source files for the
same module spread across directories (I think at least, or was that
only meson?). Selftests might need to go with respective modules, not
sure.
-Daniel


>
>
> BR,
> Jani.
>
>
>
>
> >
> > Thomas Zimmermann (3):
> >   drm: Build drm_irq.o only if CONFIG_DRM_LEGACY has been set
> >   drm: Link several object files into drm_kms_helper.ko
> >   drm: Move GEM memory managers into modules
> >
> >  drivers/gpu/drm/Kconfig                |  4 ++--
> >  drivers/gpu/drm/Makefile               | 26 +++++++++++++++-----------
> >  drivers/gpu/drm/drm_gem_cma_helper.c   |  4 ++++
> >  drivers/gpu/drm/drm_gem_shmem_helper.c |  4 ++++
> >  drivers/gpu/drm/drm_irq.c              |  2 --
> >  5 files changed, 25 insertions(+), 15 deletions(-)
> >
> > --
> > 2.33.0
> >
>
> --
> Jani Nikula, Intel Open Source Graphics Center



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
