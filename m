Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A65E2132617
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2020 13:23:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97A1489E1B;
	Tue,  7 Jan 2020 12:22:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE23889E1B
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2020 12:22:58 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 528E3B137;
 Tue,  7 Jan 2020 12:22:57 +0000 (UTC)
Subject: Re: [PATCH RFC v1 2/6] drm/sprd: add Unisoc's drm kms master
To: tang pengchuan <kevin3.tang@gmail.com>
References: <1576496419-12409-1-git-send-email-kevin3.tang@gmail.com>
 <1576496419-12409-3-git-send-email-kevin3.tang@gmail.com>
 <f540df4e-5869-8a7d-612a-49b57dc44efc@suse.de>
 <CAFPSGXbNqZ+GmSdfDnzobxYAx8yQaw+S1N3R3wAQF+GFNTcjZg@mail.gmail.com>
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
Message-ID: <208ae136-e0f9-20d6-f92a-03639ee4d380@suse.de>
Date: Tue, 7 Jan 2020 13:22:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <CAFPSGXbNqZ+GmSdfDnzobxYAx8yQaw+S1N3R3wAQF+GFNTcjZg@mail.gmail.com>
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
Cc: mark.rutland@arm.com, Baolin Wang <baolin.wang@linaro.org>,
 David Airlie <airlied@linux.ie>, Chunyan Zhang <zhang.lyra@gmail.com>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>, robh+dt@kernel.org,
 Orson Zhai <orsonzhai@gmail.com>
Content-Type: multipart/mixed; boundary="===============1591285621=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1591285621==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="TBzYoV7aIZqwlnfP0Q6EER3fBq5KIP5GV"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--TBzYoV7aIZqwlnfP0Q6EER3fBq5KIP5GV
Content-Type: multipart/mixed; boundary="EyUU3eN6Bc0s2E8OfD2Vc5fqvgH4jCl8C";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: tang pengchuan <kevin3.tang@gmail.com>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 robh+dt@kernel.org, mark.rutland@arm.com, Orson Zhai <orsonzhai@gmail.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Baolin Wang <baolin.wang@linaro.org>
Message-ID: <208ae136-e0f9-20d6-f92a-03639ee4d380@suse.de>
Subject: Re: [PATCH RFC v1 2/6] drm/sprd: add Unisoc's drm kms master
References: <1576496419-12409-1-git-send-email-kevin3.tang@gmail.com>
 <1576496419-12409-3-git-send-email-kevin3.tang@gmail.com>
 <f540df4e-5869-8a7d-612a-49b57dc44efc@suse.de>
 <CAFPSGXbNqZ+GmSdfDnzobxYAx8yQaw+S1N3R3wAQF+GFNTcjZg@mail.gmail.com>
In-Reply-To: <CAFPSGXbNqZ+GmSdfDnzobxYAx8yQaw+S1N3R3wAQF+GFNTcjZg@mail.gmail.com>

--EyUU3eN6Bc0s2E8OfD2Vc5fqvgH4jCl8C
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 07.01.20 um 12:36 schrieb tang pengchuan:
> Hi Thomas,
> Our soc needs to support both cma and iommu, but our iommu is not ready=

> for upload, so i remove it from sprd_gem.c
> So=C2=A0can i upload the cma code first=EF=BC=9F and add iommu support =
later

This might be possible, but I cannot make the decision. I'd suggest a
different strategy.

 1) Convert to generic CMA handlers and submit. You'd want the least
amount of code in your patches, so they go in quickly and easily.

 2) Duplicate CMA handlers into your driver and add IOMMU support.
Submit this patchset at a later point when it's ready.

Just an untested idea: Is it a generic IOMMU or a GART? With a generic
IOMMU it could be possible to implement dma_map_ops for your platform.
CMA helpers will use the IOMMU in their call to dma_alloc_wc(). [1] If
this works, you would not have to maintain you own GEM code and can
merge IOMMU support at any time.

Best regards
Thomas

[1] https://elixir.bootlin.com/linux/latest/source/kernel/dma/mapping.c#L=
298


>=20
> On Mon, Jan 6, 2020 at 6:11 PM Thomas Zimmermann <tzimmermann@suse.de
> <mailto:tzimmermann@suse.de>> wrote:
>=20
>     Hi Kevin
>=20
>     Am 16.12.19 um 12:40 schrieb Kevin Tang:
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
>     >=C2=A0 drivers/gpu/drm/sprd/sprd_drm.c | 286
>     ++++++++++++++++++++++++++++++++++++++++
>     >=C2=A0 drivers/gpu/drm/sprd/sprd_drm.h |=C2=A0 16 +++
>     >=C2=A0 drivers/gpu/drm/sprd/sprd_gem.c | 178 +++++++++++++++++++++=
++++
>     >=C2=A0 drivers/gpu/drm/sprd/sprd_gem.h |=C2=A0 30 +++++
>     >=C2=A0 8 files changed, 535 insertions(+)
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
>     > index 0000000..4aee25fa4
>     > --- /dev/null
>     > +++ b/drivers/gpu/drm/sprd/sprd_drm.c
>     > @@ -0,0 +1,286 @@
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
>     > +#define DRIVER_DATE=C2=A0 "20191101"
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
=3D sprd_gem_mmap,
>     > +};
>     > +
>     > +static struct drm_driver sprd_drm_drv =3D {
>     > +=C2=A0 =C2=A0 =C2=A0.driver_features=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=3D DRIVER_GEM | DRIVER_ATOMIC,
>     > +=C2=A0 =C2=A0 =C2=A0.fops=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &sprd_drm_fops,
>     > +=C2=A0 =C2=A0 =C2=A0.gem_vm_ops=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0=3D &drm_gem_cma_vm_ops,
>     > +=C2=A0 =C2=A0 =C2=A0.gem_free_object_unlocked=C2=A0 =C2=A0 =C2=A0=
 =C2=A0=3D sprd_gem_free_object,
>     > +=C2=A0 =C2=A0 =C2=A0.dumb_create=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =3D sprd_gem_dumb_create,
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
>     > +=C2=A0 =C2=A0 =C2=A0if (ret) {
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_ERROR("dma_s=
et_mask_and_coherent failed (%d)\n",
>     ret);
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;
>     > +=C2=A0 =C2=A0 =C2=A0}
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
>     > index 0000000..137cb27
>     > --- /dev/null
>     > +++ b/drivers/gpu/drm/sprd/sprd_drm.h
>     > @@ -0,0 +1,16 @@
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
>     > +};
>     > +
>     > +#endif /* _SPRD_DRM_H_ */
>     > diff --git a/drivers/gpu/drm/sprd/sprd_gem.c
>     b/drivers/gpu/drm/sprd/sprd_gem.c
>     > new file mode 100644
>     > index 0000000..9aec78e
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
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dma_free_wc(obj-=
>dev->dev, obj->size,
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0sprd_gem->vaddr, sprd_gem->dma_addr);
>     > +=C2=A0 =C2=A0 =C2=A0else if (sprd_gem->sgtb)
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_prime_gem_de=
stroy(obj, sprd_gem->sgtb);
>     > +
>     > +=C2=A0 =C2=A0 =C2=A0drm_gem_object_release(obj);
>     > +
>     > +=C2=A0 =C2=A0 =C2=A0kfree(sprd_gem);
>     > +}
>     > +
>     > +int sprd_gem_dumb_create(struct drm_file *file_priv, struct
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
>=20
>     I might be missing something, but I still don't understand why all =
this
>     GEM code is necessary. I quickly compared with the CMA helpers and =
the
>     only meaningful difference is the use of the GFP_DMA flag.
>=20
>     Rather than duplicating the CMA code, it's better to change the CMA=

>     helpers to provide a way of setting this flag.
>=20
>     Best regards
>     Thomas
>=20
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
>     > +static int sprd_gem_object_mmap(struct drm_gem_object *obj,
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
>     > +int sprd_gem_mmap(struct file *filp, struct vm_area_struct *vma)=

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
>     > +=C2=A0 =C2=A0 =C2=A0return sprd_gem_object_mmap(obj, vma);
>     > +}
>     > +
>     > +int sprd_gem_prime_mmap(struct drm_gem_object *obj,
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
>     > +=C2=A0 =C2=A0 =C2=A0return sprd_gem_object_mmap(obj, vma);
>     > +}
>     > +
>     > +struct sg_table *sprd_gem_prime_get_sg_table(struct
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
>     > index 0000000..b6740bd
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
>     > +int sprd_gem_dumb_create(struct drm_file *file_priv, struct
>     drm_device *dev,
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0struct drm_mode_create_dumb *args);
>     > +int sprd_gem_mmap(struct file *filp, struct vm_area_struct *vma)=
;
>     > +int sprd_gem_prime_mmap(struct drm_gem_object *obj,
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 struct vm_area_struct *vma);
>     > +struct sg_table *sprd_gem_prime_get_sg_table(struct
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


--EyUU3eN6Bc0s2E8OfD2Vc5fqvgH4jCl8C--

--TBzYoV7aIZqwlnfP0Q6EER3fBq5KIP5GV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl4UeB8ACgkQaA3BHVML
eiOOLAgAv3YjCWjyMPV8oZW7GoFN1frlz3A1oOzSqqZpXkaZEu1bu36umKGc7C+l
63cGlkJqp/ojl7LwqnDf1kn/QcV/lWelCC6F40+1HuOK15lUXUsqdvICXexOiq/I
iR3KgyrKqBwqvzV5dPmT1gv6OV0rv0M0xweafb1dTXmrQcmbQU5J4QcN9+zI+tWC
xPox8PrwIVvGRPq/aJHOucZgM4TVIss5u1uRoK/RNWtumCWtjoVS4tEMbPz0UdL1
cbTh3AXt42BbfmL21TKf/D2JRPiLkTUNUlg5vMj/JAODCOE7IR1WGfF/z9DKSB0J
VE5pu1sipuMewL5QrpY2PLfNbhlyOw==
=DcKV
-----END PGP SIGNATURE-----

--TBzYoV7aIZqwlnfP0Q6EER3fBq5KIP5GV--

--===============1591285621==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1591285621==--
