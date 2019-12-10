Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F304C1188C8
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 13:47:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E6306E0BF;
	Tue, 10 Dec 2019 12:47:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EF476E0BF
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 12:47:21 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D1F2DAC23;
 Tue, 10 Dec 2019 12:47:19 +0000 (UTC)
Subject: Re: [PATCH RFC 2/8] drm/sprd: add Unisoc's drm kms master
To: tang pengchuan <kevin3.tang@gmail.com>
References: <1575966995-13757-1-git-send-email-kevin3.tang@gmail.com>
 <1575966995-13757-3-git-send-email-kevin3.tang@gmail.com>
 <62c61dea-6297-1df2-0037-8c00fa36812b@suse.de>
 <CAFPSGXb-pbmXFXrN7adK1TO+09T8qtJjwk+dK-TidZSsfPqHFg@mail.gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 mQENBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAG0J1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPokBVAQTAQgAPhYh
 BHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJbOdLgAhsDBQkDwmcABQsJCAcCBhUKCQgLAgQWAgMB
 Ah4BAheAAAoJEGgNwR1TC3ojR80H/jH+vYavwQ+TvO8ksXL9JQWc3IFSiGpuSVXLCdg62AmR
 irxW+qCwNncNQyb9rd30gzdectSkPWL3KSqEResBe24IbA5/jSkPweJasgXtfhuyoeCJ6PXo
 clQQGKIoFIAEv1s8l0ggPZswvCinegl1diyJXUXmdEJRTWYAtxn/atut1o6Giv6D2qmYbXN7
 mneMC5MzlLaJKUtoH7U/IjVw1sx2qtxAZGKVm4RZxPnMCp9E1MAr5t4dP5gJCIiqsdrVqI6i
 KupZstMxstPU//azmz7ZWWxT0JzgJqZSvPYx/SATeexTYBP47YFyri4jnsty2ErS91E6H8os
 Bv6pnSn7eAq5AQ0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRH
 UE9eosYbT6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgT
 RjP+qbU63Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+R
 dhgATnWWGKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zb
 ehDda8lvhFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r
 12+lqdsAEQEAAYkBPAQYAQgAJhYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJbOdLgAhsMBQkD
 wmcAAAoJEGgNwR1TC3ojpfcIAInwP5OlcEKokTnHCiDTz4Ony4GnHRP2fXATQZCKxmu4AJY2
 h9ifw9Nf2TjCZ6AMvC3thAN0rFDj55N9l4s1CpaDo4J+0fkrHuyNacnT206CeJV1E7NYntxU
 n+LSiRrOdywn6erjxRi9EYTVLCHcDhBEjKmFZfg4AM4GZMWX1lg0+eHbd5oL1as28WvvI/uI
 aMyV8RbyXot1r/8QLlWldU3NrTF5p7TMU2y3ZH2mf5suSKHAMtbE4jKJ8ZHFOo3GhLgjVrBW
 HE9JXO08xKkgD+w6v83+nomsEuf6C6LYrqY/tsZvyEX6zN8CtirPdPWu/VXNRYAl/lat7lSI
 3H26qrE=
Message-ID: <14abba97-2932-da13-982f-11adea52ded0@suse.de>
Date: Tue, 10 Dec 2019 13:47:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <CAFPSGXb-pbmXFXrN7adK1TO+09T8qtJjwk+dK-TidZSsfPqHFg@mail.gmail.com>
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
Cc: Baolin Wang <baolin.wang@linaro.org>, airlied@linux.ie,
 Chunyan Zhang <zhang.lyra@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Orson Zhai <orsonzhai@gmail.com>
Content-Type: multipart/mixed; boundary="===============2013247584=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============2013247584==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="Fr5L8OfDs03gvhmKlnnq0wN0hvsk4eHxL"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Fr5L8OfDs03gvhmKlnnq0wN0hvsk4eHxL
Content-Type: multipart/mixed; boundary="CbgaDvJZF5KQzvTHUiVvCHtqt27jwuMW6";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: tang pengchuan <kevin3.tang@gmail.com>
Cc: airlied@linux.ie, Daniel Vetter <daniel@ffwll.ch>,
 Orson Zhai <orsonzhai@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Chunyan Zhang <zhang.lyra@gmail.com>,
 Baolin Wang <baolin.wang@linaro.org>
Message-ID: <14abba97-2932-da13-982f-11adea52ded0@suse.de>
Subject: Re: [PATCH RFC 2/8] drm/sprd: add Unisoc's drm kms master
References: <1575966995-13757-1-git-send-email-kevin3.tang@gmail.com>
 <1575966995-13757-3-git-send-email-kevin3.tang@gmail.com>
 <62c61dea-6297-1df2-0037-8c00fa36812b@suse.de>
 <CAFPSGXb-pbmXFXrN7adK1TO+09T8qtJjwk+dK-TidZSsfPqHFg@mail.gmail.com>
In-Reply-To: <CAFPSGXb-pbmXFXrN7adK1TO+09T8qtJjwk+dK-TidZSsfPqHFg@mail.gmail.com>

--CbgaDvJZF5KQzvTHUiVvCHtqt27jwuMW6
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 10.12.19 um 13:38 schrieb tang pengchuan:
> Hi
>=20
> Thomas Zimmermann <tzimmermann@suse.de <mailto:tzimmermann@suse.de>> =E4=
=BA=8E
> 2019=E5=B9=B412=E6=9C=8810=E6=97=A5=E5=91=A8=E4=BA=8C =E4=B8=8B=E5=8D=88=
6:33=E5=86=99=E9=81=93=EF=BC=9A
>=20
>     Hi
>=20
>     Am 10.12.19 um 09:36 schrieb Kevin Tang:
>     > From: Kevin Tang <kevin.tang@unisoc.com
>     <mailto:kevin.tang@unisoc.com>>
>     >
>     > Adds drm support for the Unisoc's display subsystem.
>     >
>     > This is drm device and gem driver. This driver provides support
>     for the
>     > Direct Rendering Infrastructure (DRI) in XFree86 4.1.0 and higher=
=2E
>     >
>     > Cc: Orson Zhai <orsonzhai@gmail.com <mailto:orsonzhai@gmail.com>>=

>     > Cc: Baolin Wang <baolin.wang@linaro.org
>     <mailto:baolin.wang@linaro.org>>
>     > Cc: Chunyan Zhang <zhang.lyra@gmail.com <mailto:zhang.lyra@gmail.=
com>>
>     > Signed-off-by: Kevin Tang <kevin.tang@unisoc.com
>     <mailto:kevin.tang@unisoc.com>>
>     > ---
>     >=C2=A0 drivers/gpu/drm/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 =C2=A02 +
>     >=C2=A0 drivers/gpu/drm/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0=
 =C2=A01 +
>     >=C2=A0 drivers/gpu/drm/sprd/Kconfig=C2=A0 =C2=A0 |=C2=A0 14 ++
>     >=C2=A0 drivers/gpu/drm/sprd/Makefile=C2=A0 =C2=A0|=C2=A0 =C2=A08 +=
+
>     >=C2=A0 drivers/gpu/drm/sprd/sprd_drm.c | 287
>     ++++++++++++++++++++++++++++++++++++++++
>     >=C2=A0 drivers/gpu/drm/sprd/sprd_drm.h |=C2=A0 19 +++
>     >=C2=A0 drivers/gpu/drm/sprd/sprd_gem.c | 178 +++++++++++++++++++++=
++++
>     >=C2=A0 drivers/gpu/drm/sprd/sprd_gem.h |=C2=A0 30 +++++
>=20
>     The GEM implementation looks like DRM's CMA helpers. Can you not us=
e CMA
>     helpers instead?
>=20
> Ok, i will remove cma keywords from the GEM implementatio.

I'm not quite sure what you mean. Why can you not use the existing CMA
helpers instead of writing your own?

Best regards
Thomas

>=20
>=20
>     >=C2=A0 8 files changed, 539 insertions(+)
>     >=C2=A0 create mode 100644 drivers/gpu/drm/sprd/Kconfig
>     >=C2=A0 create mode 100644 drivers/gpu/drm/sprd/Makefile
>     >=C2=A0 create mode 100644 drivers/gpu/drm/sprd/sprd_drm.c
>     >=C2=A0 create mode 100644 drivers/gpu/drm/sprd/sprd_drm.h
>     >=C2=A0 create mode 100644 drivers/gpu/drm/sprd/sprd_gem.c
>     >=C2=A0 create mode 100644 drivers/gpu/drm/sprd/sprd_gem.h
>     >
>     > diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
>     > index bfdadc3..cead12c 100644
>     > --- a/drivers/gpu/drm/Kconfig
>     > +++ b/drivers/gpu/drm/Kconfig
>     > @@ -387,6 +387,8 @@ source "drivers/gpu/drm/aspeed/Kconfig"
>     >=C2=A0
>     >=C2=A0 source "drivers/gpu/drm/mcde/Kconfig"
>     >=C2=A0
>     > +source "drivers/gpu/drm/sprd/Kconfig"
>     > +
>     >=C2=A0 # Keep legacy drivers last
>     >=C2=A0
>     >=C2=A0 menuconfig DRM_LEGACY
>     > diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
>     > index 9f1c7c4..85ca211 100644
>     > --- a/drivers/gpu/drm/Makefile
>     > +++ b/drivers/gpu/drm/Makefile
>     > @@ -122,3 +122,4 @@ obj-$(CONFIG_DRM_LIMA)=C2=A0 +=3D lima/
>     >=C2=A0 obj-$(CONFIG_DRM_PANFROST) +=3D panfrost/
>     >=C2=A0 obj-$(CONFIG_DRM_ASPEED_GFX) +=3D aspeed/
>     >=C2=A0 obj-$(CONFIG_DRM_MCDE) +=3D mcde/
>     > +obj-$(CONFIG_DRM_SPRD) +=3D sprd/
>     > diff --git a/drivers/gpu/drm/sprd/Kconfig
>     b/drivers/gpu/drm/sprd/Kconfig
>     > new file mode 100644
>     > index 0000000..79f286b
>     > --- /dev/null
>     > +++ b/drivers/gpu/drm/sprd/Kconfig
>     > @@ -0,0 +1,14 @@
>     > +config DRM_SPRD
>     > +=C2=A0 =C2=A0 =C2=A0tristate "DRM Support for Unisoc SoCs Platfo=
rm"
>     > +=C2=A0 =C2=A0 =C2=A0depends on ARCH_SPRD
>     > +=C2=A0 =C2=A0 =C2=A0depends on DRM && OF
>     > +=C2=A0 =C2=A0 =C2=A0select DRM_KMS_HELPER
>     > +=C2=A0 =C2=A0 =C2=A0select DRM_GEM_CMA_HELPER
>     > +=C2=A0 =C2=A0 =C2=A0select DRM_KMS_CMA_HELPER
>     > +=C2=A0 =C2=A0 =C2=A0select DRM_MIPI_DSI
>     > +=C2=A0 =C2=A0 =C2=A0select DRM_PANEL
>     > +=C2=A0 =C2=A0 =C2=A0select VIDEOMODE_HELPERS
>     > +=C2=A0 =C2=A0 =C2=A0select BACKLIGHT_CLASS_DEVICE
>     > +=C2=A0 =C2=A0 =C2=A0help
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0Choose this option if you have a Unis=
oc chipsets.
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0If M is selected the module will be c=
alled sprd-drm.
>     > \ No newline at end of file
>     > diff --git a/drivers/gpu/drm/sprd/Makefile
>     b/drivers/gpu/drm/sprd/Makefile
>     > new file mode 100644
>     > index 0000000..df0b316
>     > --- /dev/null
>     > +++ b/drivers/gpu/drm/sprd/Makefile
>     > @@ -0,0 +1,8 @@
>     > +# SPDX-License-Identifier: GPL-2.0
>     > +
>     > +ccflags-y +=3D -Iinclude/drm
>     > +
>     > +subdir-ccflags-y +=3D -I$(src)
>     > +
>     > +obj-y :=3D sprd_drm.o \
>     > +=C2=A0 =C2=A0 =C2=A0sprd_gem.o
>     > \ No newline at end of file
>     > diff --git a/drivers/gpu/drm/sprd/sprd_drm.c
>     b/drivers/gpu/drm/sprd/sprd_drm.c
>     > new file mode 100644
>     > index 0000000..ec16fee
>     > --- /dev/null
>     > +++ b/drivers/gpu/drm/sprd/sprd_drm.c
>     > @@ -0,0 +1,287 @@
>     > +// SPDX-License-Identifier: GPL-2.0
>     > +/*
>     > + * Copyright (C) 2019 Unisoc Inc.
>     > + */
>     > +
>     > +#include <linux/component.h>
>     > +#include <linux/dma-mapping.h>
>     > +#include <linux/module.h>
>     > +#include <linux/mutex.h>
>     > +#include <linux/of_graph.h>
>     > +#include <linux/of_platform.h>
>     > +
>     > +#include <drm/drm_atomic_helper.h>
>     > +#include <drm/drm_crtc_helper.h>
>     > +#include <drm/drm_drv.h>
>     > +#include <drm/drm_gem_cma_helper.h>
>     > +#include <drm/drm_gem_framebuffer_helper.h>
>     > +#include <drm/drm_probe_helper.h>
>     > +#include <drm/drm_vblank.h>
>     > +
>     > +#include "sprd_drm.h"
>     > +#include "sprd_gem.h"
>     > +
>     > +#define DRIVER_NAME=C2=A0 "sprd"
>     > +#define DRIVER_DESC=C2=A0 "Spreadtrum SoCs' DRM Driver"
>     > +#define DRIVER_DATE=C2=A0 "20180501"
>     > +#define DRIVER_MAJOR 1
>     > +#define DRIVER_MINOR 0
>     > +
>     > +static const struct drm_mode_config_helper_funcs
>     sprd_drm_mode_config_helper =3D {
>     > +=C2=A0 =C2=A0 =C2=A0.atomic_commit_tail =3D drm_atomic_helper_co=
mmit_tail_rpm,
>     > +};
>     > +
>     > +static const struct drm_mode_config_funcs
>     sprd_drm_mode_config_funcs =3D {
>     > +=C2=A0 =C2=A0 =C2=A0.fb_create =3D drm_gem_fb_create,
>     > +=C2=A0 =C2=A0 =C2=A0.atomic_check =3D drm_atomic_helper_check,
>     > +=C2=A0 =C2=A0 =C2=A0.atomic_commit =3D drm_atomic_helper_commit,=

>     > +};
>     > +
>     > +static void sprd_drm_mode_config_init(struct drm_device *drm)
>     > +{
>     > +=C2=A0 =C2=A0 =C2=A0drm_mode_config_init(drm);
>     > +
>     > +=C2=A0 =C2=A0 =C2=A0drm->mode_config.min_width =3D 0;
>     > +=C2=A0 =C2=A0 =C2=A0drm->mode_config.min_height =3D 0;
>     > +=C2=A0 =C2=A0 =C2=A0drm->mode_config.max_width =3D 8192;
>     > +=C2=A0 =C2=A0 =C2=A0drm->mode_config.max_height =3D 8192;
>     > +=C2=A0 =C2=A0 =C2=A0drm->mode_config.allow_fb_modifiers =3D true=
;
>     > +
>     > +=C2=A0 =C2=A0 =C2=A0drm->mode_config.funcs =3D &sprd_drm_mode_co=
nfig_funcs;
>     > +=C2=A0 =C2=A0 =C2=A0drm->mode_config.helper_private =3D &sprd_dr=
m_mode_config_helper;
>     > +}
>     > +
>     > +static const struct file_operations sprd_drm_fops =3D {
>     > +=C2=A0 =C2=A0 =C2=A0.owner=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D=
 THIS_MODULE,
>     > +=C2=A0 =C2=A0 =C2=A0.open=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
=3D drm_open,
>     > +=C2=A0 =C2=A0 =C2=A0.release=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D drm_=
release,
>     > +=C2=A0 =C2=A0 =C2=A0.unlocked_ioctl =3D drm_ioctl,
>     > +=C2=A0 =C2=A0 =C2=A0.compat_ioctl=C2=A0 =C2=A0=3D drm_compat_ioc=
tl,
>     > +=C2=A0 =C2=A0 =C2=A0.poll=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
=3D drm_poll,
>     > +=C2=A0 =C2=A0 =C2=A0.read=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
=3D drm_read,
>     > +=C2=A0 =C2=A0 =C2=A0.llseek=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D=
 no_llseek,
>     > +=C2=A0 =C2=A0 =C2=A0.mmap=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
=3D sprd_gem_cma_mmap,
>     > +};
>     > +
>     > +static struct drm_driver sprd_drm_drv =3D {
>     > +=C2=A0 =C2=A0 =C2=A0.driver_features=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=3D DRIVER_GEM | DRIVER_MODESET |
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRIVER_ATOMIC | DRIVER_HAVE_=
IRQ,
>     > +=C2=A0 =C2=A0 =C2=A0.fops=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &sprd_drm_fops,
>     > +
>     > +=C2=A0 =C2=A0 =C2=A0.gem_vm_ops=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0=3D &drm_gem_cma_vm_ops,
>     > +=C2=A0 =C2=A0 =C2=A0.gem_free_object_unlocked=C2=A0 =C2=A0 =C2=A0=
 =C2=A0=3D sprd_gem_free_object,
>     > +=C2=A0 =C2=A0 =C2=A0.dumb_create=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =3D sprd_gem_cma_dumb_create,
>     > +
>     > +=C2=A0 =C2=A0 =C2=A0.prime_fd_to_handle=C2=A0 =C2=A0 =C2=A0=3D d=
rm_gem_prime_fd_to_handle,
>     > +=C2=A0 =C2=A0 =C2=A0.gem_prime_import=C2=A0 =C2=A0 =C2=A0 =C2=A0=
=3D drm_gem_prime_import,
>     > +=C2=A0 =C2=A0 =C2=A0.gem_prime_import_sg_table =3D sprd_gem_prim=
e_import_sg_table,
>     > +
>     > +=C2=A0 =C2=A0 =C2=A0.name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D DRIVER_NAME,
>     > +=C2=A0 =C2=A0 =C2=A0.desc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D DRIVER_DESC,
>     > +=C2=A0 =C2=A0 =C2=A0.date=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D DRIVER_DATE,
>     > +=C2=A0 =C2=A0 =C2=A0.major=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =3D DRIVER_MAJOR,
>     > +=C2=A0 =C2=A0 =C2=A0.minor=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =3D DRIVER_MINOR,
>     > +};
>     > +
>     > +static int sprd_drm_bind(struct device *dev)
>     > +{
>     > +=C2=A0 =C2=A0 =C2=A0struct drm_device *drm;
>     > +=C2=A0 =C2=A0 =C2=A0struct sprd_drm *sprd;
>     > +=C2=A0 =C2=A0 =C2=A0int err;
>     > +
>     > +=C2=A0 =C2=A0 =C2=A0drm =3D drm_dev_alloc(&sprd_drm_drv, dev);
>     > +=C2=A0 =C2=A0 =C2=A0if (IS_ERR(drm))
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return PTR_ERR(d=
rm);
>     > +
>     > +=C2=A0 =C2=A0 =C2=A0dev_set_drvdata(dev, drm);
>     > +
>     > +=C2=A0 =C2=A0 =C2=A0sprd =3D devm_kzalloc(drm->dev, sizeof(*sprd=
), GFP_KERNEL);
>     > +=C2=A0 =C2=A0 =C2=A0if (!sprd) {
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0err =3D -ENOMEM;=

>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto err_free_dr=
m;
>     > +=C2=A0 =C2=A0 =C2=A0}
>     > +=C2=A0 =C2=A0 =C2=A0drm->dev_private =3D sprd;
>     > +
>     > +=C2=A0 =C2=A0 =C2=A0sprd_drm_mode_config_init(drm);
>     > +
>     > +=C2=A0 =C2=A0 =C2=A0/* bind and init sub drivers */
>     > +=C2=A0 =C2=A0 =C2=A0err =3D component_bind_all(drm->dev, drm);
>     > +=C2=A0 =C2=A0 =C2=A0if (err) {
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_ERROR("faile=
d to bind all component.\n");
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto err_dc_clea=
nup;
>     > +=C2=A0 =C2=A0 =C2=A0}
>     > +
>     > +=C2=A0 =C2=A0 =C2=A0/* vblank init */
>     > +=C2=A0 =C2=A0 =C2=A0err =3D drm_vblank_init(drm, drm->mode_confi=
g.num_crtc);
>     > +=C2=A0 =C2=A0 =C2=A0if (err) {
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_ERROR("faile=
d to initialize vblank.\n");
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto err_unbind_=
all;
>     > +=C2=A0 =C2=A0 =C2=A0}
>     > +=C2=A0 =C2=A0 =C2=A0/* with irq_enabled =3D true, we can use the=
 vblank feature. */
>     > +=C2=A0 =C2=A0 =C2=A0drm->irq_enabled =3D true;
>     > +
>     > +=C2=A0 =C2=A0 =C2=A0/* reset all the states of crtc/plane/encode=
r/connector */
>     > +=C2=A0 =C2=A0 =C2=A0drm_mode_config_reset(drm);
>     > +
>     > +=C2=A0 =C2=A0 =C2=A0/* init kms poll for handling hpd */
>     > +=C2=A0 =C2=A0 =C2=A0drm_kms_helper_poll_init(drm);
>     > +
>     > +=C2=A0 =C2=A0 =C2=A0err =3D drm_dev_register(drm, 0);
>     > +=C2=A0 =C2=A0 =C2=A0if (err < 0)
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto err_kms_hel=
per_poll_fini;
>     > +
>     > +=C2=A0 =C2=A0 =C2=A0return 0;
>     > +
>     > +err_kms_helper_poll_fini:
>     > +=C2=A0 =C2=A0 =C2=A0drm_kms_helper_poll_fini(drm);
>     > +err_unbind_all:
>     > +=C2=A0 =C2=A0 =C2=A0component_unbind_all(drm->dev, drm);
>     > +err_dc_cleanup:
>     > +=C2=A0 =C2=A0 =C2=A0drm_mode_config_cleanup(drm);
>     > +err_free_drm:
>     > +=C2=A0 =C2=A0 =C2=A0drm_dev_put(drm);
>     > +=C2=A0 =C2=A0 =C2=A0return err;
>     > +}
>     > +
>     > +static void sprd_drm_unbind(struct device *dev)
>     > +{
>     > +=C2=A0 =C2=A0 =C2=A0drm_put_dev(dev_get_drvdata(dev));
>     > +}
>     > +
>     > +static const struct component_master_ops sprd_drm_component_ops =
=3D {
>     > +=C2=A0 =C2=A0 =C2=A0.bind =3D sprd_drm_bind,
>     > +=C2=A0 =C2=A0 =C2=A0.unbind =3D sprd_drm_unbind,
>     > +};
>     > +
>     > +static int compare_of(struct device *dev, void *data)
>     > +{
>     > +=C2=A0 =C2=A0 =C2=A0struct device_node *np =3D data;
>     > +
>     > +=C2=A0 =C2=A0 =C2=A0DRM_DEBUG("compare %s\n", np->full_name);
>     > +
>     > +=C2=A0 =C2=A0 =C2=A0return dev->of_node =3D=3D np;
>     > +}
>     > +
>     > +static int sprd_drm_component_probe(struct device *dev,
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 const struct component_master_ops *m_ops)
>     > +{
>     > +=C2=A0 =C2=A0 =C2=A0struct device_node *ep, *port, *remote;
>     > +=C2=A0 =C2=A0 =C2=A0struct component_match *match =3D NULL;
>     > +=C2=A0 =C2=A0 =C2=A0int i;
>     > +
>     > +=C2=A0 =C2=A0 =C2=A0if (!dev->of_node)
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;
>     > +
>     > +=C2=A0 =C2=A0 =C2=A0/*
>     > +=C2=A0 =C2=A0 =C2=A0 * Bind the crtc's ports first, so that
>     drm_of_find_possible_crtcs()
>     > +=C2=A0 =C2=A0 =C2=A0 * called from encoder's .bind callbacks wor=
ks as expected
>     > +=C2=A0 =C2=A0 =C2=A0 */
>     > +=C2=A0 =C2=A0 =C2=A0for (i =3D 0; ; i++) {
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0port =3D of_pars=
e_phandle(dev->of_node, "ports", i);
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!port)
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0break;
>     > +
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!of_device_i=
s_available(port->parent)) {
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0of_node_put(port);
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0continue;
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}
>     > +
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0component_match_=
add(dev, &match, compare_of,
>     port->parent);
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0of_node_put(port=
);
>     > +=C2=A0 =C2=A0 =C2=A0}
>     > +
>     > +=C2=A0 =C2=A0 =C2=A0if (i =3D=3D 0) {
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(dev, "mi=
ssing 'ports' property\n");
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENODEV;
>     > +=C2=A0 =C2=A0 =C2=A0}
>     > +
>     > +=C2=A0 =C2=A0 =C2=A0if (!match) {
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(dev, "no=
 available port\n");
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENODEV;
>     > +=C2=A0 =C2=A0 =C2=A0}
>     > +
>     > +=C2=A0 =C2=A0 =C2=A0/*
>     > +=C2=A0 =C2=A0 =C2=A0 * For bound crtcs, bind the encoders attach=
ed to their
>     remote endpoint
>     > +=C2=A0 =C2=A0 =C2=A0 */
>     > +=C2=A0 =C2=A0 =C2=A0for (i =3D 0; ; i++) {
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0port =3D of_pars=
e_phandle(dev->of_node, "ports", i);
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!port)
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0break;
>     > +
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!of_device_i=
s_available(port->parent)) {
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0of_node_put(port);
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0continue;
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}
>     > +
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for_each_child_o=
f_node(port, ep) {
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0remote =3D of_graph_get_remote_port_parent(ep);
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if (!remote ||
>     !of_device_is_available(remote)) {
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0of_node_put(remote);
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue;
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0} else if
>     (!of_device_is_available(remote->parent)) {
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_warn(dev, "parent device of %s
>     is not available\n",
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 remote=
->full_name);
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0of_node_put(remote);
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue;
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0}
>     > +
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0component_match_add(dev, &match, compare_of,
>     remote);
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0of_node_put(remote);
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0of_node_put(port=
);
>     > +=C2=A0 =C2=A0 =C2=A0}
>     > +
>     > +=C2=A0 =C2=A0 =C2=A0return component_master_add_with_match(dev, =
m_ops, match);
>     > +}
>     > +
>     > +static int sprd_drm_probe(struct platform_device *pdev)
>     > +{
>     > +=C2=A0 =C2=A0 =C2=A0int ret;
>     > +
>     > +=C2=A0 =C2=A0 =C2=A0ret =3D dma_set_mask_and_coherent(&pdev->dev=
, ~0);
>     > +=C2=A0 =C2=A0 =C2=A0if (ret)
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_ERROR("dma_s=
et_mask_and_coherent failed (%d)\n",
>     ret);
>     > +
>     > +=C2=A0 =C2=A0 =C2=A0return sprd_drm_component_probe(&pdev->dev,
>     &sprd_drm_component_ops);
>     > +}
>     > +
>     > +static int sprd_drm_remove(struct platform_device *pdev)
>     > +{
>     > +=C2=A0 =C2=A0 =C2=A0component_master_del(&pdev->dev, &sprd_drm_c=
omponent_ops);
>     > +=C2=A0 =C2=A0 =C2=A0return 0;
>     > +}
>     > +
>     > +static void sprd_drm_shutdown(struct platform_device *pdev)
>     > +{
>     > +=C2=A0 =C2=A0 =C2=A0struct drm_device *drm =3D platform_get_drvd=
ata(pdev);
>     > +
>     > +=C2=A0 =C2=A0 =C2=A0if (!drm) {
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_WARN("drm de=
vice is not available, no shutdown\n");
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;
>     > +=C2=A0 =C2=A0 =C2=A0}
>     > +
>     > +=C2=A0 =C2=A0 =C2=A0drm_atomic_helper_shutdown(drm);
>     > +}
>     > +
>     > +static const struct of_device_id sprd_drm_match_table[] =3D {
>     > +=C2=A0 =C2=A0 =C2=A0{ .compatible =3D "sprd,display-subsystem",}=
,
>     > +=C2=A0 =C2=A0 =C2=A0{},
>     > +};
>     > +MODULE_DEVICE_TABLE(of, sprd_drm_match_table);
>     > +
>     > +static struct platform_driver sprd_drm_driver =3D {
>     > +=C2=A0 =C2=A0 =C2=A0.probe =3D sprd_drm_probe,
>     > +=C2=A0 =C2=A0 =C2=A0.remove =3D sprd_drm_remove,
>     > +=C2=A0 =C2=A0 =C2=A0.shutdown =3D sprd_drm_shutdown,
>     > +=C2=A0 =C2=A0 =C2=A0.driver =3D {
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.name =3D "sprd-=
drm-drv",
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.of_match_table =
=3D sprd_drm_match_table,
>     > +=C2=A0 =C2=A0 =C2=A0},
>     > +};
>     > +
>     > +module_platform_driver(sprd_drm_driver);
>     > +
>     > +MODULE_AUTHOR("Leon He <leon.he@unisoc.com
>     <mailto:leon.he@unisoc.com>>");
>     > +MODULE_AUTHOR("Kevin Tang <kevin.tang@unisoc.com
>     <mailto:kevin.tang@unisoc.com>>");
>     > +MODULE_DESCRIPTION("Unisoc DRM KMS Master Driver");
>     > +MODULE_LICENSE("GPL v2");
>     > diff --git a/drivers/gpu/drm/sprd/sprd_drm.h
>     b/drivers/gpu/drm/sprd/sprd_drm.h
>     > new file mode 100644
>     > index 0000000..e840e65
>     > --- /dev/null
>     > +++ b/drivers/gpu/drm/sprd/sprd_drm.h
>     > @@ -0,0 +1,19 @@
>     > +/* SPDX-License-Identifier: GPL-2.0 */
>     > +/*
>     > + * Copyright (C) 2019 Unisoc Inc.
>     > + */
>     > +
>     > +#ifndef _SPRD_DRM_H_
>     > +#define _SPRD_DRM_H_
>     > +
>     > +#include <drm/drm_atomic.h>
>     > +#include <drm/drm_print.h>
>     > +
>     > +struct sprd_drm {
>     > +=C2=A0 =C2=A0 =C2=A0struct drm_device *drm;
>     > +=C2=A0 =C2=A0 =C2=A0struct drm_atomic_state *state;
>     > +=C2=A0 =C2=A0 =C2=A0struct device *dpu_dev;
>     > +=C2=A0 =C2=A0 =C2=A0struct device *gsp_dev;
>     > +};
>     > +
>     > +#endif /* _SPRD_DRM_H_ */
>     > diff --git a/drivers/gpu/drm/sprd/sprd_gem.c
>     b/drivers/gpu/drm/sprd/sprd_gem.c
>     > new file mode 100644
>     > index 0000000..c617c8b
>     > --- /dev/null
>     > +++ b/drivers/gpu/drm/sprd/sprd_gem.c
>     > @@ -0,0 +1,178 @@
>     > +// SPDX-License-Identifier: GPL-2.0
>     > +/*
>     > + * Copyright (C) 2019 Unisoc Inc.
>     > + */
>     > +
>     > +#include <linux/dma-buf.h>
>     > +#include <linux/pm_runtime.h>
>     > +
>     > +#include <drm/drm_prime.h>
>     > +
>     > +#include "sprd_drm.h"
>     > +#include "sprd_gem.h"
>     > +
>     > +static struct sprd_gem_obj *sprd_gem_obj_create(struct drm_devic=
e
>     *drm,
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0unsigned long size)
>     > +{
>     > +=C2=A0 =C2=A0 =C2=A0struct sprd_gem_obj *sprd_gem;
>     > +=C2=A0 =C2=A0 =C2=A0int ret;
>     > +
>     > +=C2=A0 =C2=A0 =C2=A0sprd_gem =3D kzalloc(sizeof(*sprd_gem), GFP_=
KERNEL);
>     > +=C2=A0 =C2=A0 =C2=A0if (!sprd_gem)
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ERR_PTR(-=
ENOMEM);
>     > +
>     > +=C2=A0 =C2=A0 =C2=A0ret =3D drm_gem_object_init(drm, &sprd_gem->=
base, size);
>     > +=C2=A0 =C2=A0 =C2=A0if (ret < 0) {
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_ERROR("faile=
d to initialize gem object\n");
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto error;
>     > +=C2=A0 =C2=A0 =C2=A0}
>     > +
>     > +=C2=A0 =C2=A0 =C2=A0ret =3D drm_gem_create_mmap_offset(&sprd_gem=
->base);
>     > +=C2=A0 =C2=A0 =C2=A0if (ret) {
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_gem_object_r=
elease(&sprd_gem->base);
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto error;
>     > +=C2=A0 =C2=A0 =C2=A0}
>     > +
>     > +=C2=A0 =C2=A0 =C2=A0return sprd_gem;
>     > +
>     > +error:
>     > +=C2=A0 =C2=A0 =C2=A0kfree(sprd_gem);
>     > +=C2=A0 =C2=A0 =C2=A0return ERR_PTR(ret);
>     > +}
>     > +
>     > +void sprd_gem_free_object(struct drm_gem_object *obj)
>     > +{
>     > +=C2=A0 =C2=A0 =C2=A0struct sprd_gem_obj *sprd_gem =3D to_sprd_ge=
m_obj(obj);
>     > +
>     > +=C2=A0 =C2=A0 =C2=A0DRM_DEBUG("gem =3D %p\n", obj);
>     > +
>     > +=C2=A0 =C2=A0 =C2=A0if (sprd_gem->vaddr)
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dma_alloc_wc(obj=
->dev->dev, obj->size,
>=20
>     dma_free_wc
>=20
> Thanks for reminding
>=20
>=20
>     Best regards
>     Thomas
>=20
>     [1]
>     https://cgit.freedesktop.org/drm/drm-tip/tree/drivers/gpu/drm/drm_g=
em_cma_helper.c
>=20
>=20
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sprd_gem->vadd=
r,
>     sprd_gem->dma_addr);
>     > +=C2=A0 =C2=A0 =C2=A0else if (sprd_gem->sgtb)
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_prime_gem_de=
stroy(obj, sprd_gem->sgtb);
>     > +
>     > +=C2=A0 =C2=A0 =C2=A0drm_gem_object_release(obj);
>     > +
>     > +=C2=A0 =C2=A0 =C2=A0kfree(sprd_gem);
>     > +}
>     > +
>     > +int sprd_gem_cma_dumb_create(struct drm_file *file_priv, struct
>     drm_device *drm,
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0struct drm_mode_create_dumb *args)
>     > +{
>     > +=C2=A0 =C2=A0 =C2=A0struct sprd_gem_obj *sprd_gem;
>     > +=C2=A0 =C2=A0 =C2=A0int ret;
>     > +
>     > +=C2=A0 =C2=A0 =C2=A0args->pitch =3D DIV_ROUND_UP(args->width * a=
rgs->bpp, 8);
>     > +=C2=A0 =C2=A0 =C2=A0args->size =3D round_up(args->pitch * args->=
height, PAGE_SIZE);
>     > +
>     > +=C2=A0 =C2=A0 =C2=A0sprd_gem =3D sprd_gem_obj_create(drm, args->=
size);
>     > +=C2=A0 =C2=A0 =C2=A0if (IS_ERR(sprd_gem))
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return PTR_ERR(s=
prd_gem);
>     > +
>     > +=C2=A0 =C2=A0 =C2=A0sprd_gem->vaddr =3D dma_alloc_wc(drm->dev, a=
rgs->size,
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&sprd_gem->dma_addr, GFP_KERNEL |
>     __GFP_NOWARN | GFP_DMA);
>     > +=C2=A0 =C2=A0 =C2=A0if (!sprd_gem->vaddr) {
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_ERROR("faile=
d to allocate buffer with size %llu\n",
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0args->size);
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D -ENOMEM;=

>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto error;
>     > +=C2=A0 =C2=A0 =C2=A0}
>     > +
>     > +=C2=A0 =C2=A0 =C2=A0ret =3D drm_gem_handle_create(file_priv, &sp=
rd_gem->base,
>     &args->handle);
>     > +=C2=A0 =C2=A0 =C2=A0if (ret)
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto error;
>     > +
>     > +=C2=A0 =C2=A0 =C2=A0drm_gem_object_put_unlocked(&sprd_gem->base)=
;
>     > +
>     > +=C2=A0 =C2=A0 =C2=A0return 0;
>     > +
>     > +error:
>     > +=C2=A0 =C2=A0 =C2=A0sprd_gem_free_object(&sprd_gem->base);
>     > +=C2=A0 =C2=A0 =C2=A0return ret;
>     > +}
>     > +
>     > +static int sprd_gem_cma_object_mmap(struct drm_gem_object *obj,
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct vm_area_struct *vma)=

>     > +
>     > +{
>     > +=C2=A0 =C2=A0 =C2=A0int ret;
>     > +=C2=A0 =C2=A0 =C2=A0struct sprd_gem_obj *sprd_gem =3D to_sprd_ge=
m_obj(obj);
>     > +
>     > +=C2=A0 =C2=A0 =C2=A0vma->vm_flags &=3D ~VM_PFNMAP;
>     > +=C2=A0 =C2=A0 =C2=A0vma->vm_pgoff =3D 0;
>     > +
>     > +=C2=A0 =C2=A0 =C2=A0ret =3D dma_mmap_wc(obj->dev->dev, vma,
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sprd_gem->vaddr, sprd=
_gem->dma_addr,
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vma->vm_end - vma->vm=
_start);
>     > +=C2=A0 =C2=A0 =C2=A0if (ret)
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_gem_vm_close=
(vma);
>     > +
>     > +=C2=A0 =C2=A0 =C2=A0return ret;
>     > +}
>     > +
>     > +int sprd_gem_cma_mmap(struct file *filp, struct vm_area_struct *=
vma)
>     > +{
>     > +=C2=A0 =C2=A0 =C2=A0struct drm_gem_object *obj;
>     > +=C2=A0 =C2=A0 =C2=A0int ret;
>     > +
>     > +=C2=A0 =C2=A0 =C2=A0ret =3D drm_gem_mmap(filp, vma);
>     > +=C2=A0 =C2=A0 =C2=A0if (ret)
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;
>     > +
>     > +=C2=A0 =C2=A0 =C2=A0obj =3D vma->vm_private_data;
>     > +
>     > +=C2=A0 =C2=A0 =C2=A0return sprd_gem_cma_object_mmap(obj, vma);
>     > +}
>     > +
>     > +int sprd_gem_cma_prime_mmap(struct drm_gem_object *obj,
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0struct vm_area_struct *vma)
>     > +{
>     > +=C2=A0 =C2=A0 =C2=A0int ret;
>     > +
>     > +=C2=A0 =C2=A0 =C2=A0ret =3D drm_gem_mmap_obj(obj, obj->size, vma=
);
>     > +=C2=A0 =C2=A0 =C2=A0if (ret)
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;
>     > +
>     > +=C2=A0 =C2=A0 =C2=A0return sprd_gem_cma_object_mmap(obj, vma);
>     > +}
>     > +
>     > +struct sg_table *sprd_gem_cma_prime_get_sg_table(struct
>     drm_gem_object *obj)
>     > +{
>     > +=C2=A0 =C2=A0 =C2=A0struct sprd_gem_obj *sprd_gem =3D to_sprd_ge=
m_obj(obj);
>     > +=C2=A0 =C2=A0 =C2=A0struct sg_table *sgtb;
>     > +=C2=A0 =C2=A0 =C2=A0int ret;
>     > +
>     > +=C2=A0 =C2=A0 =C2=A0sgtb =3D kzalloc(sizeof(*sgtb), GFP_KERNEL);=

>     > +=C2=A0 =C2=A0 =C2=A0if (!sgtb)
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ERR_PTR(-=
ENOMEM);
>     > +
>     > +=C2=A0 =C2=A0 =C2=A0ret =3D dma_get_sgtable(obj->dev->dev, sgtb,=
 sprd_gem->vaddr,
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sprd_gem->dma_addr, obj->size);
>     > +=C2=A0 =C2=A0 =C2=A0if (ret) {
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_ERROR("faile=
d to allocate sg_table, %d\n", ret);
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0kfree(sgtb);
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ERR_PTR(r=
et);
>     > +=C2=A0 =C2=A0 =C2=A0}
>     > +
>     > +=C2=A0 =C2=A0 =C2=A0return sgtb;
>     > +}
>     > +
>     > +struct drm_gem_object *sprd_gem_prime_import_sg_table(struct
>     drm_device *drm,
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct dma_buf_a=
ttachment *attach, struct sg_table
>     *sgtb)
>     > +{
>     > +=C2=A0 =C2=A0 =C2=A0struct sprd_gem_obj *sprd_gem;
>     > +
>     > +=C2=A0 =C2=A0 =C2=A0sprd_gem =3D sprd_gem_obj_create(drm, attach=
->dmabuf->size);
>     > +=C2=A0 =C2=A0 =C2=A0if (IS_ERR(sprd_gem))
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ERR_CAST(=
sprd_gem);
>     > +
>     > +=C2=A0 =C2=A0 =C2=A0DRM_DEBUG("gem =3D %p\n", &sprd_gem->base);
>     > +
>     > +=C2=A0 =C2=A0 =C2=A0if (sgtb->nents =3D=3D 1)
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sprd_gem->dma_ad=
dr =3D sg_dma_address(sgtb->sgl);
>     > +
>     > +=C2=A0 =C2=A0 =C2=A0sprd_gem->sgtb =3D sgtb;
>     > +
>     > +=C2=A0 =C2=A0 =C2=A0return &sprd_gem->base;
>     > +}
>     > diff --git a/drivers/gpu/drm/sprd/sprd_gem.h
>     b/drivers/gpu/drm/sprd/sprd_gem.h
>     > new file mode 100644
>     > index 0000000..4c10d8a
>     > --- /dev/null
>     > +++ b/drivers/gpu/drm/sprd/sprd_gem.h
>     > @@ -0,0 +1,30 @@
>     > +/* SPDX-License-Identifier: GPL-2.0 */
>     > +/*
>     > + * Copyright (C) 2019 Unisoc Inc.
>     > + */
>     > +
>     > +#ifndef _SPRD_GEM_H_
>     > +#define _SPRD_GEM_H_
>     > +
>     > +#include <drm/drm_gem.h>
>     > +
>     > +struct sprd_gem_obj {
>     > +=C2=A0 =C2=A0 =C2=A0struct drm_gem_object=C2=A0 =C2=A0base;
>     > +=C2=A0 =C2=A0 =C2=A0dma_addr_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 dma_addr;
>     > +=C2=A0 =C2=A0 =C2=A0struct sg_table=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0*sgtb;
>     > +=C2=A0 =C2=A0 =C2=A0void=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *vaddr;
>     > +};
>     > +
>     > +#define to_sprd_gem_obj(x)=C2=A0 =C2=A0container_of(x, struct sp=
rd_gem_obj,
>     base)
>     > +
>     > +void sprd_gem_free_object(struct drm_gem_object *gem);
>     > +int sprd_gem_cma_dumb_create(struct drm_file *file_priv, struct
>     drm_device *dev,
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0struct drm_mode_create_dumb *args);
>     > +int sprd_gem_cma_mmap(struct file *filp, struct vm_area_struct *=
vma);
>     > +int sprd_gem_cma_prime_mmap(struct drm_gem_object *obj,
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 struct vm_area_struct *vma);
>     > +struct sg_table *sprd_gem_cma_prime_get_sg_table(struct
>     drm_gem_object *obj);
>     > +struct drm_gem_object *sprd_gem_prime_import_sg_table(struct
>     drm_device *dev,
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct dma_buf_a=
ttachment *attach, struct sg_table
>     *sgtb);
>     > +
>     > +#endif
>     >
>=20
>     --=20
>     Thomas Zimmermann
>     Graphics Driver Developer
>     SUSE Software Solutions Germany GmbH
>     Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
>     (HRB 36809, AG N=C3=BCrnberg)
>     Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--CbgaDvJZF5KQzvTHUiVvCHtqt27jwuMW6--

--Fr5L8OfDs03gvhmKlnnq0wN0hvsk4eHxL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl3vk9MACgkQaA3BHVML
eiPhqwf/ZOUf8UqlfqLOMSCQbywCdw6bvFz5tJJKBcp3FxNEi2mlubwx8XF/ZEk9
rZh88Gwrga4cZgH2wSRICPuNwuMoY4obv23sRkxr0D28jH5E1lOMxnIlrU9muzCG
Z/nQvURim8wBWgxb+VLWhgN6DyGulXo1lScyhW2zRuQJsDR0ZIznMuDluwzlxMzk
B/VWd01CpBtI03fMq38Dar8OQJWMJdzyTl0wxjvxf2qD12fBTC6RW6M5/+haNVrS
CGP8bht4p5GR+rn5PVlZXJqlvJdMGXAudBe6XVAQPJ+R1VHlNSujHi2+yDWP7OCN
oQlHGnppb2/eNuWFBaf7GisJLPmnxQ==
=XpNl
-----END PGP SIGNATURE-----

--Fr5L8OfDs03gvhmKlnnq0wN0hvsk4eHxL--

--===============2013247584==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2013247584==--
