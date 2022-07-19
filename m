Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 020A35796B6
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jul 2022 11:53:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B65A414AA11;
	Tue, 19 Jul 2022 09:53:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2a.google.com (mail-oa1-x2a.google.com
 [IPv6:2001:4860:4864:20::2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 031CD14AAD6
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Jul 2022 09:53:07 +0000 (UTC)
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-10d6ddda695so2736241fac.0
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Jul 2022 02:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=jEfjsMwCCVJdn0fWBT7TAUB/HYD/SQv5tlG2WePOa94=;
 b=AH/kE93UhTaqsslQtjR8i7Hp+anqSLWZuJPBVnlY17r3rUMchsP9amSo+08RIbrjqj
 l/hyKDWibSClLhODKGTqhWaIJkQlvIZFh94imkuXAiHaQota23Lx+SgsU33mQMngkEAf
 uiDNck+oPAfn7d0D9+vNJYY2ctFR1/PVE67G8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=jEfjsMwCCVJdn0fWBT7TAUB/HYD/SQv5tlG2WePOa94=;
 b=WjZv+k7DVG2Fk8fGNH/g6YM19PyPRi9PUDc8UN1j7nc1soQOiqCuxAfWot6f4rQggn
 kzgPBxaZ8gC+Ty+CLyqSptYwLahK9/g0wCjPkkZhhRRmnT4R4yDFDZ40Fb5O754Gmo97
 IszC5ZSComwmTF3ug24KJOWsSbEhq/pGJZ7MJwKD4mzPAcrb8luYCEwRvtfbQO5cEkNa
 TUTO1trfXD3mT+sWHOZ0SwUrbmaDcSFCywZ4bnIhc+n6DIv/rOcOKjd7xaqMyAaG4gsq
 YEbv/xu7uUvtvM8XdAQzIq9C2G2HjWnkQTKodVDCHKzAuU2MQ9bbHZMfNrrYiXAPLyOI
 blaw==
X-Gm-Message-State: AJIora8ChhaOWNAnO3DMV1LCW5qfxVKVNzYF2ef9Bzg0Dol/2RjYeDwb
 jqoUTh1flRH762wrdJa1DLRwipYA1qAUlkb5scuR9A==
X-Google-Smtp-Source: AGRyM1vtIz866FMruuxNDyMmOczuT9M7s/0rJ0OK+yGH+W5u2RLz5sCG6WIKz/7GfUxIOX+CP+0jDOCkr4Xt7rWNzjo=
X-Received: by 2002:a05:6808:1489:b0:33a:861c:838e with SMTP id
 e9-20020a056808148900b0033a861c838emr2873495oiw.228.1658224386232; Tue, 19
 Jul 2022 02:53:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220716181750.3874838-1-sam@ravnborg.org>
 <9ded7088-cb15-fe5d-5a4d-001d3d9bb195@suse.de>
In-Reply-To: <9ded7088-cb15-fe5d-5a4d-001d3d9bb195@suse.de>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 19 Jul 2022 11:52:54 +0200
Message-ID: <CAKMK7uHZSpVDBkZVMoNvWt-RLjd3Lsdj+hMQf9_xskGdGsdZjw@mail.gmail.com>
Subject: Re: [PATCH v1 0/11] drm: move dri1 drivers to drm/dri1/
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: Sam Ravnborg <sam@ravnborg.org>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 18 Jul 2022 at 08:56, Thomas Zimmermann <tzimmermann@suse.de> wrote=
:
>
> Hi
>
> Am 16.07.22 um 20:17 schrieb Sam Ravnborg:
> > While discussing the way forward for the via driver
> > Javier came up with the proposal to move all DRI1 drivers
> > to their own folder.
> >
> > The idea is to move the old DRI1 drivers so one do not
> > accidentally consider them modern drivers.
> >
> > This set of patches implements this idea.
> >
> > To prepare the move, DRIVER_LEGACY and CONFIG_DRM_LEGACY
> > are both renamed to *_DRI1. This makes it more obvious
> > that we are dealing with DRI1 drivers, as we have
> > a lot of other legacy support.
> >
> > The drivers continue to have their own sub-directory
> > so the driver files are not mixed with the core files
> > which are copied in the last commit.
> >
> > The DRI1 specific part of drm/Kconfig is likewise pulled
> > out and located in the dri1/ folder.
> >
> > Feedback welcome!
>
> To be honest, I still don't like this rename. Especially in the case of
> via, which has a KMS driver coming up. It will now have an include
> statement that crosses several levels in the directory hierarchy. And
> what about the other DRI1 drivers? If we ever get KMS drivers for those,
> do we want to move some header files back into their original locations?
> Patches 1 and 2 look reasonable to me. The other driver patches have
> basically zero upside IMHO.

Imo transitional drivers with both legacy dri1 and kms+gem support
made some sense 10+ years ago when all this infrastructure was still
being built. Now I really don't see much point.

For via imo make it a clean new driver, and copypaste anything from
the old one (like register headers) it needs. That will also make
review a ton easier I think. There has not been any actual via work,
just general refactoring, in that driver for 10+ years, so "bugfix
sharing" is really not an argument.

> In the case of moving the core files into dri1/, the resulting Makefile
> rule looks really ugly. I'd suggest to move all code into a separate
> file drm_dri1.c and be done with it.  For something more elaborate,
> there could by drm_dri1.c and drm_dri1_helper.c, where the latter
> contains all DRI1 code that is only used by the drivers.

Ugly Makefile for dri1 might be a feature :-) But personally no stake
on this bikeshed.
-Daniel

>
> Best regards
> Thomsa
>
> >
> >       Sam
> >
> > Sam Ravnborg (11):
> >        drm: rename DRIVER_LEGACY to DRIVER_DRI1
> >        drm: Rename CONFIG_DRM_LEGACY to CONFIG_DRM_DRI1
> >        drm/tdfx: Move the tdfx driver to drm/dri1/
> >        drm/r128: Move the r128 driver to drm/dri1/
> >        drm/i810: Move the i810 driver to drm/dri1/
> >        drm/mga: Move the mga driver to drm/dri1/
> >        drm/sis: Move the sis driver to drm/dri1/
> >        drm/via: Move the via driver to drm/dri1/
> >        drm/savage: Move the savage driver to drm/dri1/
> >        drm/dri1: Move Kconfig logic to drm/dri1
> >        drm: Move dri1 core files to drm/dri1
> >
> >   arch/powerpc/configs/pmac32_defconfig              |  2 +-
> >   arch/powerpc/configs/ppc6xx_defconfig              |  2 +-
> >   drivers/char/agp/Makefile                          |  2 +-
> >   drivers/char/agp/agp.h                             |  2 +-
> >   drivers/gpu/drm/Kconfig                            | 79 +------------=
---------
> >   drivers/gpu/drm/Makefile                           | 18 +++--
> >   drivers/gpu/drm/dri1/Kconfig                       | 79 +++++++++++++=
+++++++++
> >   drivers/gpu/drm/dri1/Makefile                      | 11 +++
> >   drivers/gpu/drm/{ =3D> dri1}/drm_agpsupport.c        |  4 +-
> >   drivers/gpu/drm/{ =3D> dri1}/drm_bufs.c              | 22 +++---
> >   drivers/gpu/drm/{ =3D> dri1}/drm_context.c           | 24 +++----
> >   drivers/gpu/drm/{ =3D> dri1}/drm_dma.c               |  4 +-
> >   drivers/gpu/drm/{ =3D> dri1}/drm_hashtab.c           |  0
> >   drivers/gpu/drm/{ =3D> dri1}/drm_irq.c               |  6 +-
> >   drivers/gpu/drm/{ =3D> dri1}/drm_legacy_misc.c       |  2 +-
> >   drivers/gpu/drm/{ =3D> dri1}/drm_lock.c              |  6 +-
> >   drivers/gpu/drm/{ =3D> dri1}/drm_memory.c            |  0
> >   drivers/gpu/drm/{ =3D> dri1}/drm_scatter.c           |  6 +-
> >   drivers/gpu/drm/{ =3D> dri1}/drm_vm.c                |  2 +-
> >   drivers/gpu/drm/{ =3D> dri1}/i810/Makefile           |  0
> >   drivers/gpu/drm/{ =3D> dri1}/i810/i810_dma.c         |  0
> >   drivers/gpu/drm/{ =3D> dri1}/i810/i810_drv.c         |  2 +-
> >   drivers/gpu/drm/{ =3D> dri1}/i810/i810_drv.h         |  0
> >   drivers/gpu/drm/{ =3D> dri1}/mga/Makefile            |  0
> >   drivers/gpu/drm/{ =3D> dri1}/mga/mga_dma.c           |  0
> >   drivers/gpu/drm/{ =3D> dri1}/mga/mga_drv.c           |  2 +-
> >   drivers/gpu/drm/{ =3D> dri1}/mga/mga_drv.h           |  0
> >   drivers/gpu/drm/{ =3D> dri1}/mga/mga_ioc32.c         |  0
> >   drivers/gpu/drm/{ =3D> dri1}/mga/mga_irq.c           |  0
> >   drivers/gpu/drm/{ =3D> dri1}/mga/mga_state.c         |  0
> >   drivers/gpu/drm/{ =3D> dri1}/mga/mga_warp.c          |  0
> >   drivers/gpu/drm/{ =3D> dri1}/r128/Makefile           |  0
> >   drivers/gpu/drm/{ =3D> dri1}/r128/ati_pcigart.c      |  0
> >   drivers/gpu/drm/{ =3D> dri1}/r128/ati_pcigart.h      |  0
> >   drivers/gpu/drm/{ =3D> dri1}/r128/r128_cce.c         |  0
> >   drivers/gpu/drm/{ =3D> dri1}/r128/r128_drv.c         |  2 +-
> >   drivers/gpu/drm/{ =3D> dri1}/r128/r128_drv.h         |  0
> >   drivers/gpu/drm/{ =3D> dri1}/r128/r128_ioc32.c       |  0
> >   drivers/gpu/drm/{ =3D> dri1}/r128/r128_irq.c         |  0
> >   drivers/gpu/drm/{ =3D> dri1}/r128/r128_state.c       |  0
> >   drivers/gpu/drm/{ =3D> dri1}/savage/Makefile         |  0
> >   drivers/gpu/drm/{ =3D> dri1}/savage/savage_bci.c     |  0
> >   drivers/gpu/drm/{ =3D> dri1}/savage/savage_drv.c     |  2 +-
> >   drivers/gpu/drm/{ =3D> dri1}/savage/savage_drv.h     |  0
> >   drivers/gpu/drm/{ =3D> dri1}/savage/savage_state.c   |  0
> >   drivers/gpu/drm/{ =3D> dri1}/sis/Makefile            |  0
> >   drivers/gpu/drm/{ =3D> dri1}/sis/sis_drv.c           |  2 +-
> >   drivers/gpu/drm/{ =3D> dri1}/sis/sis_drv.h           |  0
> >   drivers/gpu/drm/{ =3D> dri1}/sis/sis_mm.c            |  0
> >   drivers/gpu/drm/{ =3D> dri1}/tdfx/Makefile           |  0
> >   drivers/gpu/drm/{ =3D> dri1}/tdfx/tdfx_drv.c         |  2 +-
> >   drivers/gpu/drm/{ =3D> dri1}/tdfx/tdfx_drv.h         |  0
> >   drivers/gpu/drm/{ =3D> dri1}/via/Makefile            |  4 +-
> >   drivers/gpu/drm/{via/via_dri1.c =3D> dri1/via/via.c} |  4 +-
> >   drivers/gpu/drm/drm_drv.c                          |  2 +-
> >   drivers/gpu/drm/drm_file.c                         | 12 ++--
> >   drivers/gpu/drm/drm_internal.h                     |  2 +-
> >   drivers/gpu/drm/drm_ioc32.c                        | 12 ++--
> >   drivers/gpu/drm/drm_ioctl.c                        |  4 +-
> >   drivers/gpu/drm/drm_legacy.h                       | 32 ++++-----
> >   drivers/gpu/drm/drm_pci.c                          | 12 ++--
> >   drivers/gpu/drm/drm_vblank.c                       | 12 ++--
> >   include/drm/drm_auth.h                             |  2 +-
> >   include/drm/drm_device.h                           |  4 +-
> >   include/drm/drm_drv.h                              | 10 +--
> >   include/drm/drm_file.h                             |  2 +-
> >   include/drm/drm_legacy.h                           |  2 +-
> >   67 files changed, 205 insertions(+), 194 deletions(-)
> >
> >
>
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
> (HRB 36809, AG N=C3=BCrnberg)
> Gesch=C3=A4ftsf=C3=BChrer: Ivo Totev



--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
