Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4BDFA4B2AF
	for <lists+dri-devel@lfdr.de>; Sun,  2 Mar 2025 16:47:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3996A10E0CC;
	Sun,  2 Mar 2025 15:47:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ajNfyG48";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E3B110E0CC;
 Sun,  2 Mar 2025 15:47:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 39DAA5C5622;
 Sun,  2 Mar 2025 15:44:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4799C4AF09;
 Sun,  2 Mar 2025 15:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740930422;
 bh=JeERg6pghrewSane6wSrI4cABMnbqfWKyQVd1SUA9u4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ajNfyG48LQIYpuK/uaMthjYIegmCwpdtP72iBjmkS6txGbmNoKBFLelgDjUT5Pw27
 /VqYoBg+JUyKk8+U/EuqjkafZPqcxj6v/Kh/lL+Wvrqqbmpm4acCUwuuGqJOxlAWFW
 PS0RQ57mrd5AGOsumdhnrNrr3Wd314yg6l6csb/ZJggpNH3O3mpuI4DTD8/XIRsPN7
 bj/k//jSFNuESxOr2/mCnVxEjdOWnfHERWuYdL48CHE5E/QiPlZsILNVAy5VI/iW0Y
 iQfXOEYf81jN60a7j91X1nITcTTaxJSDxEuaWX2flMgLIcEjb/+L5VdPyOvocl4g4Z
 WlkL0TlqiEaNg==
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-30930b0b420so30595021fa.2; 
 Sun, 02 Mar 2025 07:47:02 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWMyT6LjtG4PCmZfjPdJLNv1iH16wsM+ncINN/gXB8/uu5rcD3MHM1xiEb9o/YAwd1VfWeeOpNCpOM=@lists.freedesktop.org,
 AJvYcCWnmfJnOO+CNFZ8VlVBzj79xNHPNBu8kfJcEJoSzy4ZYdoVklSx2qGvXI+5VPQLLqW0/UAidiaBWb4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzEmzMS/PhcSck0EEF0idDU1UCQumdXd6xjoIcQXNatKEYRFpj8
 vILj3q1wjeCi2gq7DIpoPw3E8P2nNclQmuimr5MHosJoDDI8eFDW7wDFdTatfLHhGejXpsS/yev
 /mC6pUAN+hhLpxktq5qREbZMAxV4=
X-Google-Smtp-Source: AGHT+IFXZJ33Ndhqo2D9PRupJ3mjUUcijXCXcJ2Sv3uNumoaRT3prKO0AuJuiV1KXthw0iy6fYTl+ZRl6kEmlPvv4Ec=
X-Received: by 2002:a2e:96c2:0:b0:308:e0bd:a091 with SMTP id
 38308e7fff4ca-30b934623e4mr27574691fa.36.1740930421332; Sun, 02 Mar 2025
 07:47:01 -0800 (PST)
MIME-Version: 1.0
References: <cover.1709898638.git.jani.nikula@intel.com>
 <ba6527a126daeae8e66e1cd64053580645106612.1709898638.git.jani.nikula@intel.com>
 <877ci9t0b7.fsf@intel.com>
In-Reply-To: <877ci9t0b7.fsf@intel.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 3 Mar 2025 00:46:24 +0900
X-Gmail-Original-Message-ID: <CAK7LNARJgqADxnOXAX49XzDFD4zT=7i8yTB0o=EmNtxmScq8jA@mail.gmail.com>
X-Gm-Features: AQ5f1JoAuA4egTQRUYzVSYCTrf3nLieJ9VwUE6V8N0o0E9jqvzeT7Yc3AJF8nGU
Message-ID: <CAK7LNARJgqADxnOXAX49XzDFD4zT=7i8yTB0o=EmNtxmScq8jA@mail.gmail.com>
Subject: Re: [PATCH v2 16/16] drm: ensure drm headers are self-contained and
 pass kernel-doc
To: Jani Nikula <jani.nikula@intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 lucas.demarchi@intel.com
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

On Mon, Mar 11, 2024 at 9:33=E2=80=AFPM Jani Nikula <jani.nikula@intel.com>=
 wrote:
>
> On Fri, 08 Mar 2024, Jani Nikula <jani.nikula@intel.com> wrote:
> > Ensure drm headers build, are self-contained, have header guards, and
> > have no kernel-doc warnings, when CONFIG_DRM_HEADER_TEST=3Dy.
> >
> > The mechanism follows similar patters used in i915, xe, and usr/include=
.
> >
> > To cover include/drm, we need to recurse there using the top level
> > Kbuild and the new include/Kbuild files.
> >
> > Suggested-by: Daniel Vetter <daniel@ffwll.ch>
> > Cc: David Airlie <airlied@gmail.com>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Cc: Maxime Ripard <mripard@kernel.org>
> > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > Cc: Masahiro Yamada <masahiroy@kernel.org>
> > Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> > Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>
> Masahiro, ack for merging this?


Sorry, I did not notice that I was pinged so long ago.

I just realized this because I saw it in linux-next.

No, NACK.

This was already reverted by
  fcbb8461fd2376ba3782b5b8bd440c929b8e4980

Please do not re-add it.

The reason is explained in the discussion
linked in that commit description.

I do not believe all headers in include/drm/
must be self-contained.

If we know that <drm/drm-foo.h> is included only
when CONFIG_DRM_FOO is enabled, it does not
need to be self-contained when CONFIG_DRM_FOO=3Dn.

So, I am skeptical with this approach, where
the 'find' command detects all headers and they must
be self-contained regardless.

The only case I think makes sense is UAPI headers
(implemented in usr/include/Makefile)


Masahiro



> BR,
> Jani.
>
> > ---
> >  Kbuild                   |  1 +
> >  drivers/gpu/drm/Kconfig  | 11 +++++++++++
> >  drivers/gpu/drm/Makefile | 18 ++++++++++++++++++
> >  include/Kbuild           |  1 +
> >  include/drm/Makefile     | 18 ++++++++++++++++++
> >  5 files changed, 49 insertions(+)
> >  create mode 100644 include/Kbuild
> >  create mode 100644 include/drm/Makefile
> >
> > diff --git a/Kbuild b/Kbuild
> > index 464b34a08f51..f327ca86990c 100644
> > --- a/Kbuild
> > +++ b/Kbuild
> > @@ -97,3 +97,4 @@ obj-$(CONFIG_SAMPLES)       +=3D samples/
> >  obj-$(CONFIG_NET)    +=3D net/
> >  obj-y                        +=3D virt/
> >  obj-y                        +=3D $(ARCH_DRIVERS)
> > +obj-$(CONFIG_DRM_HEADER_TEST)        +=3D include/
> > diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> > index c08e18108c2a..dd17685ef6e7 100644
> > --- a/drivers/gpu/drm/Kconfig
> > +++ b/drivers/gpu/drm/Kconfig
> > @@ -429,3 +429,14 @@ config DRM_WERROR
> >         this config option is disabled by default.
> >
> >         If in doubt, say N.
> > +
> > +config DRM_HEADER_TEST
> > +     bool "Ensure DRM headers are self-contained and pass kernel-doc"
> > +     depends on EXPERT
> > +     default n
> > +     help
> > +       Ensure the DRM subsystem headers both under drivers/gpu/drm and
> > +       include/drm compile, are self-contained, have header guards, an=
d have
> > +       no kernel-doc warnings.
> > +
> > +       If in doubt, say N.
> > diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> > index a73c04d2d7a3..6605d5686d01 100644
> > --- a/drivers/gpu/drm/Makefile
> > +++ b/drivers/gpu/drm/Makefile
> > @@ -218,3 +218,21 @@ obj-y                    +=3D solomon/
> >  obj-$(CONFIG_DRM_SPRD) +=3D sprd/
> >  obj-$(CONFIG_DRM_LOONGSON) +=3D loongson/
> >  obj-$(CONFIG_DRM_POWERVR) +=3D imagination/
> > +
> > +# Ensure drm headers are self-contained and pass kernel-doc
> > +hdrtest-files :=3D \
> > +     $(shell cd $(srctree)/$(src) && find . -maxdepth 1 -name 'drm_*.h=
') \
> > +     $(shell cd $(srctree)/$(src) && find display lib -name '*.h')
> > +
> > +always-$(CONFIG_DRM_HEADER_TEST) +=3D \
> > +     $(patsubst %.h,%.hdrtest, $(hdrtest-files))
> > +
> > +# Include the header twice to detect missing include guard.
> > +quiet_cmd_hdrtest =3D HDRTEST $(patsubst %.hdrtest,%.h,$@)
> > +      cmd_hdrtest =3D \
> > +             $(CC) $(c_flags) -fsyntax-only -x c /dev/null -include $<=
 -include $<; \
> > +             $(srctree)/scripts/kernel-doc -none $(if $(CONFIG_DRM_WER=
ROR),-Werror) $<; \
> > +             touch $@
> > +
> > +$(obj)/%.hdrtest: $(src)/%.h FORCE
> > +     $(call if_changed_dep,hdrtest)
> > diff --git a/include/Kbuild b/include/Kbuild
> > new file mode 100644
> > index 000000000000..5e76a599e2dd
> > --- /dev/null
> > +++ b/include/Kbuild
> > @@ -0,0 +1 @@
> > +obj-$(CONFIG_DRM_HEADER_TEST)        +=3D drm/
> > diff --git a/include/drm/Makefile b/include/drm/Makefile
> > new file mode 100644
> > index 000000000000..b9f391d7aadd
> > --- /dev/null
> > +++ b/include/drm/Makefile
> > @@ -0,0 +1,18 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +
> > +# Ensure drm headers are self-contained and pass kernel-doc
> > +hdrtest-files :=3D \
> > +     $(shell cd $(srctree)/$(src) && find * -name '*.h' 2>/dev/null)
> > +
> > +always-$(CONFIG_DRM_HEADER_TEST) +=3D \
> > +     $(patsubst %.h,%.hdrtest, $(hdrtest-files))
> > +
> > +# Include the header twice to detect missing include guard.
> > +quiet_cmd_hdrtest =3D HDRTEST $(patsubst %.hdrtest,%.h,$@)
> > +      cmd_hdrtest =3D \
> > +             $(CC) $(c_flags) -fsyntax-only -x c /dev/null -include $<=
 -include $<; \
> > +             $(srctree)/scripts/kernel-doc -none $(if $(CONFIG_DRM_WER=
ROR),-Werror) $<; \
> > +             touch $@
> > +
> > +$(obj)/%.hdrtest: $(src)/%.h FORCE
> > +     $(call if_changed_dep,hdrtest)
>
> --
> Jani Nikula, Intel



--
Best Regards
Masahiro Yamada
