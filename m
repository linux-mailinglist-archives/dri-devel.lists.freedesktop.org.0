Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 936A4146434
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jan 2020 10:13:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED9616FB65;
	Thu, 23 Jan 2020 09:13:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 055C86FB65
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2020 09:13:48 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 83CCEAE3A;
 Thu, 23 Jan 2020 09:13:46 +0000 (UTC)
Subject: Re: [PATCH RFC v2 2/6] drm/sprd: add Unisoc's drm kms master
To: Kevin Tang <kevin3.tang@gmail.com>, airlied@linux.ie, daniel@ffwll.ch,
 robh+dt@kernel.org, mark.rutland@arm.com
References: <1579596662-15466-1-git-send-email-kevin3.tang@gmail.com>
 <1579596662-15466-3-git-send-email-kevin3.tang@gmail.com>
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
Message-ID: <d9d614c6-607a-6889-318d-e64c3a2c8671@suse.de>
Date: Thu, 23 Jan 2020 10:13:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <1579596662-15466-3-git-send-email-kevin3.tang@gmail.com>
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
Cc: orsonzhai@gmail.com, baolin.wang@linaro.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, zhang.lyra@gmail.com
Content-Type: multipart/mixed; boundary="===============1701094545=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1701094545==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="2I432nAzAIM8r5mmxzfzpIXSgjs7labum"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--2I432nAzAIM8r5mmxzfzpIXSgjs7labum
Content-Type: multipart/mixed; boundary="Icy9oefLzBchjt3d3bTIrY5MM6ioIyCFw";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Kevin Tang <kevin3.tang@gmail.com>, airlied@linux.ie, daniel@ffwll.ch,
 robh+dt@kernel.org, mark.rutland@arm.com
Cc: orsonzhai@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, zhang.lyra@gmail.com, baolin.wang@linaro.org
Message-ID: <d9d614c6-607a-6889-318d-e64c3a2c8671@suse.de>
Subject: Re: [PATCH RFC v2 2/6] drm/sprd: add Unisoc's drm kms master
References: <1579596662-15466-1-git-send-email-kevin3.tang@gmail.com>
 <1579596662-15466-3-git-send-email-kevin3.tang@gmail.com>
In-Reply-To: <1579596662-15466-3-git-send-email-kevin3.tang@gmail.com>

--Icy9oefLzBchjt3d3bTIrY5MM6ioIyCFw
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi,

thank you for replacing for GEM code with the generic CMA
implementation. Once it's needed, we can add specialized memory
management to you driver.

I've looked throught your submission and think you may want to
reconsider the current design. AFAICT, you have some a driver with
generic code and the individual hardware as sub-devices. That's not
strictly wrong or a roadblocker for merging the driver, but it is likely
to become a problem in long-term maintainence.

Please read below for some details and let me know what you think.

Am 21.01.20 um 09:50 schrieb Kevin Tang:
> From: Kevin Tang <kevin.tang@unisoc.com>
>=20
> Adds drm support for the Unisoc's display subsystem.
>=20
> This is drm device and gem driver. This driver provides support for the=

> Direct Rendering Infrastructure (DRI) in XFree86 4.1.0 and higher.
>=20
> Cc: Orson Zhai <orsonzhai@gmail.com>
> Cc: Baolin Wang <baolin.wang@linaro.org>
> Cc: Chunyan Zhang <zhang.lyra@gmail.com>
> Signed-off-by: Kevin Tang <kevin.tang@unisoc.com>
> ---
>  drivers/gpu/drm/Kconfig           |   2 +
>  drivers/gpu/drm/Makefile          |   1 +
>  drivers/gpu/drm/sprd/Kconfig      |  14 ++
>  drivers/gpu/drm/sprd/Makefile     |   9 +
>  drivers/gpu/drm/sprd/sprd_crtc.c  | 212 ++++++++++++++++++++
>  drivers/gpu/drm/sprd/sprd_crtc.h  |  98 ++++++++++
>  drivers/gpu/drm/sprd/sprd_drm.c   | 305 +++++++++++++++++++++++++++++
>  drivers/gpu/drm/sprd/sprd_drm.h   |  16 ++
>  drivers/gpu/drm/sprd/sprd_plane.c | 393 ++++++++++++++++++++++++++++++=
++++++++
>  drivers/gpu/drm/sprd/sprd_plane.h |  36 ++++
>  10 files changed, 1086 insertions(+)
>  create mode 100644 drivers/gpu/drm/sprd/Kconfig
>  create mode 100644 drivers/gpu/drm/sprd/Makefile
>  create mode 100644 drivers/gpu/drm/sprd/sprd_crtc.c
>  create mode 100644 drivers/gpu/drm/sprd/sprd_crtc.h
>  create mode 100644 drivers/gpu/drm/sprd/sprd_drm.c
>  create mode 100644 drivers/gpu/drm/sprd/sprd_drm.h
>  create mode 100644 drivers/gpu/drm/sprd/sprd_plane.c
>  create mode 100644 drivers/gpu/drm/sprd/sprd_plane.h
>=20
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index bfdadc3..cead12c 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -387,6 +387,8 @@ source "drivers/gpu/drm/aspeed/Kconfig"
> =20
>  source "drivers/gpu/drm/mcde/Kconfig"
> =20
> +source "drivers/gpu/drm/sprd/Kconfig"
> +
>  # Keep legacy drivers last
> =20
>  menuconfig DRM_LEGACY
> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> index 9f1c7c4..85ca211 100644
> --- a/drivers/gpu/drm/Makefile
> +++ b/drivers/gpu/drm/Makefile
> @@ -122,3 +122,4 @@ obj-$(CONFIG_DRM_LIMA)  +=3D lima/
>  obj-$(CONFIG_DRM_PANFROST) +=3D panfrost/
>  obj-$(CONFIG_DRM_ASPEED_GFX) +=3D aspeed/
>  obj-$(CONFIG_DRM_MCDE) +=3D mcde/
> +obj-$(CONFIG_DRM_SPRD) +=3D sprd/
> diff --git a/drivers/gpu/drm/sprd/Kconfig b/drivers/gpu/drm/sprd/Kconfi=
g
> new file mode 100644
> index 0000000..79f286b
> --- /dev/null
> +++ b/drivers/gpu/drm/sprd/Kconfig
> @@ -0,0 +1,14 @@
> +config DRM_SPRD
> +	tristate "DRM Support for Unisoc SoCs Platform"
> +	depends on ARCH_SPRD
> +	depends on DRM && OF
> +	select DRM_KMS_HELPER
> +	select DRM_GEM_CMA_HELPER
> +	select DRM_KMS_CMA_HELPER
> +	select DRM_MIPI_DSI
> +	select DRM_PANEL
> +	select VIDEOMODE_HELPERS
> +	select BACKLIGHT_CLASS_DEVICE
> +	help
> +	  Choose this option if you have a Unisoc chipsets.
> +	  If M is selected the module will be called sprd-drm.
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/sprd/Makefile b/drivers/gpu/drm/sprd/Makef=
ile
> new file mode 100644
> index 0000000..8a21c23
> --- /dev/null
> +++ b/drivers/gpu/drm/sprd/Makefile
> @@ -0,0 +1,9 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +ccflags-y +=3D -Iinclude/drm
> +
> +subdir-ccflags-y +=3D -I$(src)
> +
> +obj-y :=3D sprd_drm.o \
> +	sprd_crtc.o \
> +	sprd_plane.o
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/sprd/sprd_crtc.c b/drivers/gpu/drm/sprd/sp=
rd_crtc.c
> new file mode 100644
> index 0000000..4a35281
> --- /dev/null
> +++ b/drivers/gpu/drm/sprd/sprd_crtc.c
> @@ -0,0 +1,212 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2019 Unisoc Inc.
> + */
> +
> +#include <linux/dma-buf.h>
> +
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_crtc_helper.h>
> +#include <drm/drm_gem_framebuffer_helper.h>
> +#include <drm/drm_plane_helper.h>
> +#include <drm/drm_vblank.h>
> +
> +#include "sprd_drm.h"
> +#include "sprd_crtc.h"
> +
> +static void sprd_crtc_mode_set_nofb(struct drm_crtc *crtc)
> +{
> +	struct sprd_crtc *sprd_crtc =3D to_sprd_crtc(crtc);
> +
> +	if (sprd_crtc->ops->mode_set_nofb)
> +		return sprd_crtc->ops->mode_set_nofb(sprd_crtc);
> +}
> +
> +static enum drm_mode_status sprd_crtc_mode_valid(struct drm_crtc *crtc=
,
> +	const struct drm_display_mode *mode)
> +{
> +	struct sprd_crtc *sprd_crtc =3D to_sprd_crtc(crtc);
> +
> +	if (sprd_crtc->ops->mode_valid)
> +		return sprd_crtc->ops->mode_valid(sprd_crtc, mode);
> +
> +	return MODE_OK;
> +}
> +
> +static int sprd_crtc_atomic_check(struct drm_crtc *crtc,
> +				     struct drm_crtc_state *state)
> +{
> +	struct sprd_crtc *sprd_crtc =3D to_sprd_crtc(crtc);
> +
> +	if (!state->enable)
> +		return 0;
> +
> +	if (sprd_crtc->ops->atomic_check)
> +		return sprd_crtc->ops->atomic_check(sprd_crtc, state);
> +
> +	return 0;
> +}
> +
> +static void sprd_crtc_atomic_begin(struct drm_crtc *crtc,
> +				     struct drm_crtc_state *old_crtc_state)
> +{
> +	struct sprd_crtc *sprd_crtc =3D to_sprd_crtc(crtc);
> +
> +	if (sprd_crtc->ops->atomic_begin)
> +		sprd_crtc->ops->atomic_begin(sprd_crtc);
> +}
> +
> +static void sprd_crtc_atomic_enable(struct drm_crtc *crtc,
> +					  struct drm_crtc_state *old_state)
> +{
> +	struct sprd_crtc *sprd_crtc =3D to_sprd_crtc(crtc);
> +
> +	if (sprd_crtc->ops->atomic_enable)
> +		sprd_crtc->ops->atomic_enable(sprd_crtc);
> +
> +	drm_crtc_vblank_on(crtc);
> +}
> +
> +static void sprd_crtc_atomic_disable(struct drm_crtc *crtc,
> +					   struct drm_crtc_state *old_state)
> +{
> +	struct sprd_crtc *sprd_crtc =3D to_sprd_crtc(crtc);
> +
> +	drm_crtc_vblank_off(crtc);
> +
> +	if (sprd_crtc->ops->atomic_disable)
> +		sprd_crtc->ops->atomic_disable(sprd_crtc);
> +
> +	if (crtc->state->event && !crtc->state->active) {
> +		spin_lock_irq(&crtc->dev->event_lock);
> +		drm_crtc_send_vblank_event(crtc, crtc->state->event);
> +		spin_unlock_irq(&crtc->dev->event_lock);
> +
> +		crtc->state->event =3D NULL;
> +	}
> +}
> +
> +static void sprd_crtc_atomic_flush(struct drm_crtc *crtc,
> +				     struct drm_crtc_state *old_crtc_state)
> +{
> +	struct sprd_crtc *sprd_crtc =3D to_sprd_crtc(crtc);
> +
> +	if (sprd_crtc->ops->atomic_flush)
> +		sprd_crtc->ops->atomic_flush(sprd_crtc);
> +
> +	spin_lock_irq(&crtc->dev->event_lock);
> +	if (crtc->state->event) {
> +		drm_crtc_send_vblank_event(crtc, crtc->state->event);
> +		crtc->state->event =3D NULL;
> +	}
> +	spin_unlock_irq(&crtc->dev->event_lock);
> +}
> +
> +static const struct drm_crtc_helper_funcs sprd_crtc_helper_funcs =3D {=

> +	.mode_set_nofb	=3D sprd_crtc_mode_set_nofb,
> +	.mode_valid	=3D sprd_crtc_mode_valid,
> +	.atomic_check	=3D sprd_crtc_atomic_check,
> +	.atomic_begin	=3D sprd_crtc_atomic_begin,
> +	.atomic_enable	=3D sprd_crtc_atomic_enable,
> +	.atomic_disable	=3D sprd_crtc_atomic_disable,
> +	.atomic_flush	=3D sprd_crtc_atomic_flush,
> +};

This is just boilerplate resulting from the current design. Instead of
having struct sprd_crtc_ops and these mid-layer functions, simply give
each hardware device its own instance of drm_crtc_helper_funcs. If
hardware can share some of the implementation, put it into a common
helper function.

> +
> +static void sprd_crtc_cleanup(struct drm_crtc *crtc)
> +{
> +	struct sprd_crtc *sprd_crtc =3D to_sprd_crtc(crtc);
> +
> +	drm_crtc_cleanup(crtc);
> +	kfree(sprd_crtc);
> +}
> +
> +static int sprd_crtc_enable_vblank(struct drm_crtc *crtc)
> +{
> +	struct sprd_crtc *sprd_crtc =3D to_sprd_crtc(crtc);
> +
> +	if (sprd_crtc->ops->enable_vblank)
> +		return sprd_crtc->ops->enable_vblank(sprd_crtc);
> +
> +	return 0;
> +}
> +
> +static void sprd_crtc_disable_vblank(struct drm_crtc *crtc)
> +{
> +	struct sprd_crtc *sprd_crtc =3D to_sprd_crtc(crtc);
> +
> +	if (sprd_crtc->ops->disable_vblank)
> +		sprd_crtc->ops->disable_vblank(sprd_crtc);
> +}
> +
> +static const struct drm_crtc_funcs sprd_crtc_funcs =3D {
> +	.destroy	=3D sprd_crtc_cleanup,
> +	.set_config	=3D drm_atomic_helper_set_config,
> +	.page_flip	=3D drm_atomic_helper_page_flip,
> +	.reset		=3D drm_atomic_helper_crtc_reset,
> +	.atomic_duplicate_state	=3D drm_atomic_helper_crtc_duplicate_state,
> +	.atomic_destroy_state	=3D drm_atomic_helper_crtc_destroy_state,
> +	.enable_vblank	=3D sprd_crtc_enable_vblank,
> +	.disable_vblank	=3D sprd_crtc_disable_vblank,
> +};

Same as with the CRTC helper functions.

> +
> +struct sprd_crtc *sprd_crtc_init(struct drm_device *drm,
> +					struct drm_plane *plane,
> +					enum sprd_crtc_output_type type,
> +					const struct sprd_crtc_ops *ops,

Rather hand-in the hardware's crtc and crtc-helper instances.

> +					void *dpu)
> +{
> +	struct sprd_crtc *sprd_crtc;
> +	int ret;
> +
> +	sprd_crtc =3D kzalloc(sizeof(*sprd_crtc), GFP_KERNEL);
> +	if (!sprd_crtc)
> +		return ERR_PTR(-ENOMEM);
> +
> +	sprd_crtc->type =3D type;
> +	sprd_crtc->ops =3D ops;
> +	sprd_crtc->dpu =3D dpu;
> +
> +	ret =3D drm_crtc_init_with_planes(drm, &sprd_crtc->base, plane, NULL,=

> +					&sprd_crtc_funcs, NULL);
> +	if (ret < 0) {
> +		DRM_ERROR("failed to init crtc.\n");
> +		goto err_crtc;
> +	}
> +
> +	drm_mode_crtc_set_gamma_size(&sprd_crtc->base, 256);
> +
> +	drm_crtc_helper_add(&sprd_crtc->base, &sprd_crtc_helper_funcs);
> +
> +	return sprd_crtc;
> +
> +err_crtc:
> +	plane->funcs->destroy(plane);
> +	kfree(sprd_crtc);
> +	return ERR_PTR(ret);
> +}
> +
> +struct sprd_crtc *sprd_crtc_get_by_type(struct drm_device *drm,
> +				       enum sprd_crtc_output_type out_type)
> +{
> +	struct drm_crtc *crtc;
> +
> +	drm_for_each_crtc(crtc, drm)
> +		if (to_sprd_crtc(crtc)->type =3D=3D out_type)
> +			return to_sprd_crtc(crtc);
> +
> +	return ERR_PTR(-EPERM);
> +}
> +
> +int sprd_drm_set_possible_crtcs(struct drm_encoder *encoder,
> +		enum sprd_crtc_output_type out_type)
> +{
> +	struct sprd_crtc *crtc =3D sprd_crtc_get_by_type(encoder->dev,
> +						out_type);
> +
> +	if (IS_ERR(crtc))
> +		return PTR_ERR(crtc);
> +
> +	encoder->possible_crtcs =3D drm_crtc_mask(&crtc->base);
> +
> +	return 0;
> +}
> diff --git a/drivers/gpu/drm/sprd/sprd_crtc.h b/drivers/gpu/drm/sprd/sp=
rd_crtc.h
> new file mode 100644
> index 0000000..9dbb2eb
> --- /dev/null
> +++ b/drivers/gpu/drm/sprd/sprd_crtc.h
> @@ -0,0 +1,98 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2019 Unisoc Inc.
> + */
> +
> +#ifndef __SPRD_CRTC_H__
> +#define __SPRD_CRTC_H__
> +
> +#include <drm/drm_crtc.h>
> +#include <drm/drm_encoder.h>
> +#include <drm/drm_fourcc.h>
> +#include <drm/drm_plane.h>
> +#include <drm/drm_print.h>
> +
> +#define to_sprd_crtc(x)			container_of(x, struct sprd_crtc, base)
> +
> +enum sprd_crtc_output_type {
> +	SPRD_DISPLAY_TYPE_NONE,
> +	/* RGB or CPU Interface */
> +	SPRD_DISPLAY_TYPE_LCD,
> +	/* DisplayPort Interface */
> +	SPRD_DISPLAY_TYPE_DP,
> +	/* HDMI Interface */
> +	SPRD_DISPLAY_TYPE_HDMI,
> +};
> +
> +struct dpu_capability {
> +	u32 max_layers;
> +	const u32 *fmts_ptr;
> +	u32 fmts_cnt;
> +};
> +
> +struct sprd_dpu_layer {
> +	u8 index;
> +	u8 planes;
> +	u32 addr[4];
> +	u32 pitch[4];
> +	s16 src_x;
> +	s16 src_y;
> +	s16 src_w;
> +	s16 src_h;
> +	s16 dst_x;
> +	s16 dst_y;
> +	u16 dst_w;
> +	u16 dst_h;
> +	u32 format;
> +	u32 alpha;
> +	u32 blending;
> +	u32 rotation;
> +	u32 xfbc;
> +	u32 height;
> +	u32 header_size_r;
> +	u32 header_size_y;
> +	u32 header_size_uv;
> +	u32 y2r_coef;
> +	u8 pallete_en;
> +	u32 pallete_color;
> +};
> +
> +struct sprd_crtc {
> +	struct drm_crtc base;
> +	enum sprd_crtc_output_type type;
> +	const struct sprd_crtc_ops *ops;
> +	struct sprd_dpu_layer *layers;
> +	u8 pending_planes;
> +	void *dpu;
> +};
> +
> +struct sprd_crtc_ops {
> +	void (*atomic_enable)(struct sprd_crtc *crtc);
> +	void (*atomic_disable)(struct sprd_crtc *crtc);
> +	int (*enable_vblank)(struct sprd_crtc *crtc);
> +	void (*disable_vblank)(struct sprd_crtc *crtc);
> +	enum drm_mode_status (*mode_valid)(struct sprd_crtc *crtc,
> +		const struct drm_display_mode *mode);
> +	void (*mode_set_nofb)(struct sprd_crtc *crtc);
> +	int (*atomic_check)(struct sprd_crtc *crtc,
> +			    struct drm_crtc_state *state);
> +	void (*atomic_begin)(struct sprd_crtc *crtc);
> +	void (*atomic_flush)(struct sprd_crtc *crtc);
> +
> +	int (*prepare_fb)(struct sprd_crtc *crtc,
> +			  struct drm_plane_state *new_state);
> +	void (*cleanup_fb)(struct sprd_crtc *crtc,
> +			   struct drm_plane_state *old_state);
> +	void (*atomic_update)(struct sprd_crtc *crtc,
> +			     struct drm_plane *plane);
> +};
> +
> +struct sprd_crtc *sprd_crtc_init(struct drm_device *drm,
> +					struct drm_plane *plane,
> +					enum sprd_crtc_output_type type,
> +					const struct sprd_crtc_ops *ops,
> +					void *dpu);
> +int sprd_drm_set_possible_crtcs(struct drm_encoder *encoder,
> +		enum sprd_crtc_output_type out_type);
> +
> +#endif
> diff --git a/drivers/gpu/drm/sprd/sprd_drm.c b/drivers/gpu/drm/sprd/spr=
d_drm.c
> new file mode 100644
> index 0000000..d63b7e3
> --- /dev/null
> +++ b/drivers/gpu/drm/sprd/sprd_drm.c
> @@ -0,0 +1,305 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2019 Unisoc Inc.
> + */
> +
> +#include <linux/component.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/of_graph.h>
> +#include <linux/of_platform.h>
> +
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_crtc_helper.h>
> +#include <drm/drm_drv.h>
> +#include <drm/drm_gem_cma_helper.h>
> +#include <drm/drm_gem_framebuffer_helper.h>
> +#include <drm/drm_probe_helper.h>
> +#include <drm/drm_vblank.h>
> +
> +#include "sprd_drm.h"
> +
> +#define DRIVER_NAME	"sprd"
> +#define DRIVER_DESC	"Spreadtrum SoCs' DRM Driver"
> +#define DRIVER_DATE	"20191101"
> +#define DRIVER_MAJOR	1
> +#define DRIVER_MINOR	0
> +
> +static const struct drm_mode_config_helper_funcs sprd_drm_mode_config_=
helper =3D {
> +	.atomic_commit_tail =3D drm_atomic_helper_commit_tail_rpm,
> +};
> +
> +static const struct drm_mode_config_funcs sprd_drm_mode_config_funcs =3D=
 {
> +	.fb_create =3D drm_gem_fb_create,
> +	.atomic_check =3D drm_atomic_helper_check,
> +	.atomic_commit =3D drm_atomic_helper_commit,
> +};
> +
> +static void sprd_drm_mode_config_init(struct drm_device *drm)
> +{
> +	drm_mode_config_init(drm);
> +
> +	drm->mode_config.min_width =3D 0;
> +	drm->mode_config.min_height =3D 0;
> +	drm->mode_config.max_width =3D 8192;
> +	drm->mode_config.max_height =3D 8192;
> +	drm->mode_config.allow_fb_modifiers =3D true;
> +
> +	drm->mode_config.funcs =3D &sprd_drm_mode_config_funcs;
> +	drm->mode_config.helper_private =3D &sprd_drm_mode_config_helper;
> +}
> +
> +static const struct file_operations sprd_drm_fops =3D {
> +	.owner		=3D THIS_MODULE,
> +	.open		=3D drm_open,
> +	.release	=3D drm_release,
> +	.unlocked_ioctl	=3D drm_ioctl,
> +	.compat_ioctl	=3D drm_compat_ioctl,
> +	.poll		=3D drm_poll,
> +	.read		=3D drm_read,
> +	.llseek		=3D no_llseek,
> +	.mmap		=3D drm_gem_cma_mmap,
> +};
> +
> +static struct drm_driver sprd_drm_drv =3D {
> +	.driver_features	=3D DRIVER_GEM | DRIVER_ATOMIC,
> +	.fops			=3D &sprd_drm_fops,
> +	.gem_vm_ops		=3D &drm_gem_cma_vm_ops,
> +	.gem_free_object_unlocked	=3D drm_gem_cma_free_object,
> +	.dumb_create		=3D drm_gem_cma_dumb_create,
> +	.prime_fd_to_handle	=3D drm_gem_prime_fd_to_handle,
> +	.gem_prime_import	=3D drm_gem_prime_import,
> +	.gem_prime_import_sg_table =3D drm_gem_cma_prime_import_sg_table,

Rather set these pointers with DRM_GEM_CMA_VMAP_DRIVER_OPS.

> +
> +	.name			=3D DRIVER_NAME,
> +	.desc			=3D DRIVER_DESC,
> +	.date			=3D DRIVER_DATE,
> +	.major			=3D DRIVER_MAJOR,
> +	.minor			=3D DRIVER_MINOR,
> +};
> +
> +static int sprd_drm_bind(struct device *dev)
> +{
> +	struct drm_device *drm;
> +	struct sprd_drm *sprd;
> +	int err;
> +
> +	drm =3D drm_dev_alloc(&sprd_drm_drv, dev);
> +	if (IS_ERR(drm))
> +		return PTR_ERR(drm);
> +
> +	dev_set_drvdata(dev, drm);
> +
> +	sprd =3D devm_kzalloc(drm->dev, sizeof(*sprd), GFP_KERNEL);
> +	if (!sprd) {
> +		err =3D -ENOMEM;
> +		goto err_free_drm;
> +	}
> +	drm->dev_private =3D sprd;
> +
> +	sprd_drm_mode_config_init(drm);
> +
> +	/* bind and init sub drivers */
> +	err =3D component_bind_all(drm->dev, drm);
> +	if (err) {
> +		DRM_ERROR("failed to bind all component.\n");
> +		goto err_dc_cleanup;
> +	}
> +
> +	/* vblank init */
> +	err =3D drm_vblank_init(drm, drm->mode_config.num_crtc);
> +	if (err) {
> +		DRM_ERROR("failed to initialize vblank.\n");
> +		goto err_unbind_all;
> +	}
> +	/* with irq_enabled =3D true, we can use the vblank feature. */
> +	drm->irq_enabled =3D true;

This line indicates the problem's design. The irq is initialized in the
sub-device code, but the device state is set here. Instead both should
be set in the same place.

> +
> +	/* reset all the states of crtc/plane/encoder/connector */
> +	drm_mode_config_reset(drm);
> +
> +	/* init kms poll for handling hpd */
> +	drm_kms_helper_poll_init(drm);

Most of this function's code should be moved into the sub-device bind
function.

Here, maybe do:

 * allocate device structures
 * call component_bind_all()
 * on success, register device

The sub-device function should then do

 * init modesetting, crtc, planes, etc.
 * do drm_mode_config_reset()
 * init vblanking
 * init the irq
 * do drm_kms_helper_poll_init()

roughtly in that order. It makes sense to call drm_vblank_init() after
drm_mode_config_reset(), as vblanking uses some of the mode-config fields=
=2E

> +
> +	err =3D drm_dev_register(drm, 0);
> +	if (err < 0)
> +		goto err_kms_helper_poll_fini;

You don't need/want an fbdev console?

Best regards
Thomas

> +
> +	return 0;
> +
> +err_kms_helper_poll_fini:
> +	drm_kms_helper_poll_fini(drm);
> +err_unbind_all:
> +	component_unbind_all(drm->dev, drm);
> +err_dc_cleanup:
> +	drm_mode_config_cleanup(drm);
> +err_free_drm:
> +	drm_dev_put(drm);
> +	return err;
> +}
> +
> +static void sprd_drm_unbind(struct device *dev)
> +{
> +	drm_put_dev(dev_get_drvdata(dev));
> +}
> +
> +static const struct component_master_ops drm_component_ops =3D {
> +	.bind =3D sprd_drm_bind,
> +	.unbind =3D sprd_drm_unbind,
> +};
> +
> +static int compare_of(struct device *dev, void *data)
> +{
> +	struct device_node *np =3D data;
> +
> +	DRM_DEBUG("compare %s\n", np->full_name);
> +
> +	return dev->of_node =3D=3D np;
> +}
> +
> +static int sprd_drm_component_probe(struct device *dev,
> +			   const struct component_master_ops *m_ops)
> +{
> +	struct device_node *ep, *port, *remote;
> +	struct component_match *match =3D NULL;
> +	int i;
> +
> +	if (!dev->of_node)
> +		return -EINVAL;
> +
> +	/*
> +	 * Bind the crtc's ports first, so that drm_of_find_possible_crtcs()
> +	 * called from encoder's .bind callbacks works as expected
> +	 */
> +	for (i =3D 0; ; i++) {
> +		port =3D of_parse_phandle(dev->of_node, "ports", i);
> +		if (!port)
> +			break;
> +
> +		if (!of_device_is_available(port->parent)) {
> +			of_node_put(port);
> +			continue;
> +		}
> +
> +		component_match_add(dev, &match, compare_of, port->parent);
> +		of_node_put(port);
> +	}
> +
> +	if (i =3D=3D 0) {
> +		dev_err(dev, "missing 'ports' property\n");
> +		return -ENODEV;
> +	}
> +
> +	if (!match) {
> +		dev_err(dev, "no available port\n");
> +		return -ENODEV;
> +	}
> +
> +	/*
> +	 * For bound crtcs, bind the encoders attached to their remote endpoi=
nt
> +	 */
> +	for (i =3D 0; ; i++) {
> +		port =3D of_parse_phandle(dev->of_node, "ports", i);
> +		if (!port)
> +			break;
> +
> +		if (!of_device_is_available(port->parent)) {
> +			of_node_put(port);
> +			continue;
> +		}
> +
> +		for_each_child_of_node(port, ep) {
> +			remote =3D of_graph_get_remote_port_parent(ep);
> +			if (!remote || !of_device_is_available(remote)) {
> +				of_node_put(remote);
> +				continue;
> +			} else if (!of_device_is_available(remote->parent)) {
> +				dev_warn(dev, "parent device of %s is not available\n",
> +					 remote->full_name);
> +				of_node_put(remote);
> +				continue;
> +			}
> +
> +			component_match_add(dev, &match, compare_of, remote);
> +			of_node_put(remote);
> +		}
> +		of_node_put(port);
> +	}
> +
> +	return component_master_add_with_match(dev, m_ops, match);
> +}
> +
> +static int sprd_drm_probe(struct platform_device *pdev)
> +{
> +	int ret;
> +
> +	ret =3D dma_set_mask_and_coherent(&pdev->dev, ~0);
> +	if (ret) {
> +		DRM_ERROR("dma_set_mask_and_coherent failed (%d)\n", ret);
> +		return ret;
> +	}
> +
> +	return sprd_drm_component_probe(&pdev->dev, &drm_component_ops);
> +}
> +
> +static int sprd_drm_remove(struct platform_device *pdev)
> +{
> +	component_master_del(&pdev->dev, &drm_component_ops);
> +	return 0;
> +}
> +
> +static void sprd_drm_shutdown(struct platform_device *pdev)
> +{
> +	struct drm_device *drm =3D platform_get_drvdata(pdev);
> +
> +	if (!drm) {
> +		DRM_WARN("drm device is not available, no shutdown\n");
> +		return;
> +	}
> +
> +	drm_atomic_helper_shutdown(drm);
> +}
> +
> +static const struct of_device_id drm_match_table[] =3D {
> +	{ .compatible =3D "sprd,display-subsystem", },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, drm_match_table);
> +
> +static struct platform_driver sprd_drm_driver =3D {
> +	.probe =3D sprd_drm_probe,
> +	.remove =3D sprd_drm_remove,
> +	.shutdown =3D sprd_drm_shutdown,
> +	.driver =3D {
> +		.name =3D "sprd-drm-drv",
> +		.of_match_table =3D drm_match_table,
> +	},
> +};
> +
> +static struct platform_driver *sprd_drm_drivers[]  =3D {
> +	&sprd_drm_driver,
> +};
> +
> +static int __init sprd_drm_init(void)
> +{
> +	int ret;
> +
> +	ret =3D platform_register_drivers(sprd_drm_drivers,
> +					ARRAY_SIZE(sprd_drm_drivers));
> +	return ret;
> +}
> +
> +static void __exit sprd_drm_exit(void)
> +{
> +	platform_unregister_drivers(sprd_drm_drivers,
> +				    ARRAY_SIZE(sprd_drm_drivers));
> +}
> +
> +module_init(sprd_drm_init);
> +module_exit(sprd_drm_exit);
> +
> +MODULE_AUTHOR("Leon He <leon.he@unisoc.com>");
> +MODULE_AUTHOR("Kevin Tang <kevin.tang@unisoc.com>");
> +MODULE_DESCRIPTION("Unisoc DRM KMS Master Driver");
> +MODULE_LICENSE("GPL v2");
> diff --git a/drivers/gpu/drm/sprd/sprd_drm.h b/drivers/gpu/drm/sprd/spr=
d_drm.h
> new file mode 100644
> index 0000000..137cb27
> --- /dev/null
> +++ b/drivers/gpu/drm/sprd/sprd_drm.h
> @@ -0,0 +1,16 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2019 Unisoc Inc.
> + */
> +
> +#ifndef _SPRD_DRM_H_
> +#define _SPRD_DRM_H_
> +
> +#include <drm/drm_atomic.h>
> +#include <drm/drm_print.h>
> +
> +struct sprd_drm {
> +	struct drm_device *drm;
> +};
> +
> +#endif /* _SPRD_DRM_H_ */
> diff --git a/drivers/gpu/drm/sprd/sprd_plane.c b/drivers/gpu/drm/sprd/s=
prd_plane.c
> new file mode 100644
> index 0000000..15ebb97
> --- /dev/null
> +++ b/drivers/gpu/drm/sprd/sprd_plane.c
> @@ -0,0 +1,393 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2019 Unisoc Inc.
> + */
> +
> +#include <linux/dma-buf.h>
> +
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_fb_cma_helper.h>
> +#include <drm/drm_crtc_helper.h>
> +#include <drm/drm_fourcc.h>
> +#include <drm/drm_gem_cma_helper.h>
> +#include <drm/drm_gem_framebuffer_helper.h>
> +#include <drm/drm_plane_helper.h>
> +
> +#include "sprd_crtc.h"
> +#include "sprd_drm.h"
> +#include "sprd_plane.h"
> +
> +static int sprd_plane_prepare_fb(struct drm_plane *plane,
> +				struct drm_plane_state *new_state)
> +{
> +	struct drm_plane_state *curr_state =3D plane->state;
> +	struct sprd_crtc *crtc =3D to_sprd_crtc(new_state->crtc);
> +
> +	if ((curr_state->fb =3D=3D new_state->fb) || !new_state->fb)
> +		return 0;
> +
> +	if (crtc->ops->prepare_fb)
> +		crtc->ops->prepare_fb(crtc, new_state);
> +
> +	return 0;
> +}
> +
> +static void sprd_plane_cleanup_fb(struct drm_plane *plane,
> +				struct drm_plane_state *old_state)
> +{
> +	struct drm_plane_state *curr_state =3D plane->state;
> +	struct sprd_crtc *crtc =3D to_sprd_crtc(old_state->crtc);
> +
> +	if ((curr_state->fb =3D=3D old_state->fb) || !old_state->fb)
> +		return;
> +
> +	if (crtc->ops->cleanup_fb)
> +		crtc->ops->cleanup_fb(crtc, old_state);
> +}
> +
> +static void sprd_plane_atomic_update(struct drm_plane *plane,
> +				    struct drm_plane_state *old_state)
> +{
> +	struct drm_plane_state *state =3D plane->state;
> +	struct drm_framebuffer *fb =3D plane->state->fb;
> +	struct drm_gem_cma_object *cma_obj;
> +	struct sprd_crtc *crtc =3D to_sprd_crtc(plane->state->crtc);
> +	struct sprd_plane *p =3D to_sprd_plane(plane);
> +	struct sprd_plane_state *s =3D to_sprd_plane_state(state);
> +	struct sprd_dpu_layer *layer =3D &crtc->layers[p->index];
> +	int i;
> +
> +	if (plane->state->crtc->state->active_changed) {
> +		DRM_DEBUG("resume or suspend, no need to update plane\n");
> +		return;
> +	}
> +
> +	if (s->pallete_en) {
> +		layer->index =3D p->index;
> +		layer->dst_x =3D state->crtc_x;
> +		layer->dst_y =3D state->crtc_y;
> +		layer->dst_w =3D state->crtc_w;
> +		layer->dst_h =3D state->crtc_h;
> +		layer->alpha =3D state->alpha;
> +		layer->blending =3D state->pixel_blend_mode;
> +		layer->pallete_en =3D s->pallete_en;
> +		layer->pallete_color =3D s->pallete_color;
> +		crtc->pending_planes++;
> +		DRM_DEBUG("%s() pallete_color =3D %u, index =3D %u\n",
> +			__func__, layer->pallete_color, layer->index);
> +		return;
> +	}
> +
> +	layer->index =3D p->index;
> +	layer->src_x =3D state->src_x >> 16;
> +	layer->src_y =3D state->src_y >> 16;
> +	layer->src_w =3D state->src_w >> 16;
> +	layer->src_h =3D state->src_h >> 16;
> +	layer->dst_x =3D state->crtc_x;
> +	layer->dst_y =3D state->crtc_y;
> +	layer->dst_w =3D state->crtc_w;
> +	layer->dst_h =3D state->crtc_h;
> +	layer->rotation =3D state->rotation;
> +	layer->blending =3D state->pixel_blend_mode;
> +	layer->rotation =3D state->rotation;
> +	layer->planes =3D fb->format->num_planes;
> +	layer->format =3D fb->format->format;
> +	layer->xfbc =3D fb->modifier;
> +	layer->header_size_r =3D s->fbc_hsize_r;
> +	layer->header_size_y =3D s->fbc_hsize_y;
> +	layer->header_size_uv =3D s->fbc_hsize_uv;
> +	layer->y2r_coef =3D s->y2r_coef;
> +	layer->pallete_en =3D s->pallete_en;
> +	layer->pallete_color =3D s->pallete_color;
> +
> +	DRM_DEBUG("%s() alpha =3D %u, blending =3D %u, rotation =3D %u, y2r_c=
oef =3D %u\n",
> +		  __func__, layer->alpha, layer->blending, layer->rotation, s->y2r_c=
oef);
> +
> +	DRM_DEBUG("%s() xfbc =3D %u, hsize_r =3D %u, hsize_y =3D %u, hsize_uv=
 =3D %u\n",
> +		  __func__, layer->xfbc, layer->header_size_r,
> +		  layer->header_size_y, layer->header_size_uv);
> +
> +	for (i =3D 0; i < layer->planes; i++) {
> +		cma_obj =3D drm_fb_cma_get_gem_obj(fb, i);
> +		layer->addr[i] =3D cma_obj->paddr + fb->offsets[i];
> +		layer->pitch[i] =3D fb->pitches[i];
> +	}
> +
> +	crtc->pending_planes++;
> +}
> +
> +static int sprd_plane_atomic_check(struct drm_plane *plane,
> +				  struct drm_plane_state *state)
> +{
> +	DRM_DEBUG("%s()\n", __func__);
> +
> +	return 0;
> +}
> +
> +static void sprd_plane_atomic_disable(struct drm_plane *plane,
> +				     struct drm_plane_state *old_state)
> +{
> +	struct sprd_plane *p =3D to_sprd_plane(plane);
> +
> +	/*
> +	 * NOTE:
> +	 * The dpu->core->flip() will disable all the planes each time.
> +	 * So there is no need to impliment the atomic_disable() function.
> +	 * But this function can not be removed, because it will change
> +	 * to call atomic_update() callback instead. Which will cause
> +	 * kernel panic in sprd_plane_atomic_update().
> +	 *
> +	 * We do nothing here but just print a debug log.
> +	 */
> +	DRM_DEBUG("%s() layer_id =3D %u\n", __func__, p->index);
> +}
> +
> +static const struct drm_plane_helper_funcs sprd_plane_helper_funcs =3D=
 {
> +	.prepare_fb =3D sprd_plane_prepare_fb,
> +	.cleanup_fb =3D sprd_plane_cleanup_fb,
> +	.atomic_check =3D sprd_plane_atomic_check,
> +	.atomic_update =3D sprd_plane_atomic_update,
> +	.atomic_disable =3D sprd_plane_atomic_disable,
> +};
> +
> +static void sprd_plane_reset(struct drm_plane *plane)
> +{
> +	struct sprd_plane *p =3D to_sprd_plane(plane);
> +	struct sprd_plane_state *s;
> +
> +	DRM_INFO("%s()\n", __func__);
> +
> +	if (plane->state) {
> +		__drm_atomic_helper_plane_destroy_state(plane->state);
> +
> +		s =3D to_sprd_plane_state(plane->state);
> +		memset(s, 0, sizeof(*s));
> +	} else {
> +		s =3D kzalloc(sizeof(*s), GFP_KERNEL);
> +		if (!s)
> +			return;
> +		plane->state =3D &s->state;
> +	}
> +
> +	s->state.plane =3D plane;
> +	s->state.zpos =3D p->index;
> +	s->state.alpha =3D 255;
> +	s->state.pixel_blend_mode =3D DRM_MODE_BLEND_PIXEL_NONE;
> +}
> +
> +static struct drm_plane_state *
> +sprd_plane_atomic_duplicate_state(struct drm_plane *plane)
> +{
> +	struct sprd_plane_state *s;
> +	struct sprd_plane_state *old_state =3D to_sprd_plane_state(plane->sta=
te);
> +
> +	DRM_DEBUG("%s()\n", __func__);
> +
> +	s =3D kzalloc(sizeof(*s), GFP_KERNEL);
> +	if (!s)
> +		return NULL;
> +
> +	__drm_atomic_helper_plane_duplicate_state(plane, &s->state);
> +
> +	WARN_ON(s->state.plane !=3D plane);
> +
> +	s->fbc_hsize_r =3D old_state->fbc_hsize_r;
> +	s->fbc_hsize_y =3D old_state->fbc_hsize_y;
> +	s->fbc_hsize_uv =3D old_state->fbc_hsize_uv;
> +	s->y2r_coef =3D old_state->y2r_coef;
> +	s->pallete_en =3D old_state->pallete_en;
> +	s->pallete_color =3D old_state->pallete_color;
> +
> +	return &s->state;
> +}
> +
> +static void sprd_plane_atomic_destroy_state(struct drm_plane *plane,
> +					    struct drm_plane_state *state)
> +{
> +	DRM_DEBUG("%s()\n", __func__);
> +
> +	__drm_atomic_helper_plane_destroy_state(state);
> +	kfree(to_sprd_plane_state(state));
> +}
> +
> +static int sprd_plane_atomic_set_property(struct drm_plane *plane,
> +					  struct drm_plane_state *state,
> +					  struct drm_property *property,
> +					  u64 val)
> +{
> +	struct sprd_plane *p =3D to_sprd_plane(plane);
> +	struct sprd_plane_state *s =3D to_sprd_plane_state(state);
> +
> +	DRM_DEBUG("%s() name =3D %s, val =3D %llu\n",
> +		  __func__, property->name, val);
> +
> +	if (property =3D=3D p->fbc_hsize_r_property)
> +		s->fbc_hsize_r =3D val;
> +	else if (property =3D=3D p->fbc_hsize_y_property)
> +		s->fbc_hsize_y =3D val;
> +	else if (property =3D=3D p->fbc_hsize_uv_property)
> +		s->fbc_hsize_uv =3D val;
> +	else if (property =3D=3D p->y2r_coef_property)
> +		s->y2r_coef =3D val;
> +	else if (property =3D=3D p->pallete_en_property)
> +		s->pallete_en =3D val;
> +	else if (property =3D=3D p->pallete_color_property)
> +		s->pallete_color =3D val;
> +	else {
> +		DRM_ERROR("property %s is invalid\n", property->name);
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static int sprd_plane_atomic_get_property(struct drm_plane *plane,
> +					  const struct drm_plane_state *state,
> +					  struct drm_property *property,
> +					  u64 *val)
> +{
> +	struct sprd_plane *p =3D to_sprd_plane(plane);
> +	const struct sprd_plane_state *s =3D to_sprd_plane_state(state);
> +
> +	DRM_DEBUG("%s() name =3D %s\n", __func__, property->name);
> +
> +	if (property =3D=3D p->fbc_hsize_r_property)
> +		*val =3D s->fbc_hsize_r;
> +	else if (property =3D=3D p->fbc_hsize_y_property)
> +		*val =3D s->fbc_hsize_y;
> +	else if (property =3D=3D p->fbc_hsize_uv_property)
> +		*val =3D s->fbc_hsize_uv;
> +	else if (property =3D=3D p->y2r_coef_property)
> +		*val =3D s->y2r_coef;
> +	else if (property =3D=3D p->pallete_en_property)
> +		*val =3D s->pallete_en;
> +	else if (property =3D=3D p->pallete_color_property)
> +		*val =3D s->pallete_color;
> +	else {
> +		DRM_ERROR("property %s is invalid\n", property->name);
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct drm_plane_funcs sprd_plane_funcs =3D {
> +	.update_plane =3D drm_atomic_helper_update_plane,
> +	.disable_plane	=3D drm_atomic_helper_disable_plane,
> +	.destroy =3D drm_plane_cleanup,
> +	.reset =3D sprd_plane_reset,
> +	.atomic_duplicate_state =3D sprd_plane_atomic_duplicate_state,
> +	.atomic_destroy_state =3D sprd_plane_atomic_destroy_state,
> +	.atomic_set_property =3D sprd_plane_atomic_set_property,
> +	.atomic_get_property =3D sprd_plane_atomic_get_property,
> +};
> +
> +static int sprd_plane_create_properties(struct sprd_plane *p, int inde=
x)
> +{
> +	struct drm_property *prop;
> +	unsigned int supported_modes =3D BIT(DRM_MODE_BLEND_PIXEL_NONE) |
> +				       BIT(DRM_MODE_BLEND_PREMULTI) |
> +				       BIT(DRM_MODE_BLEND_COVERAGE);
> +
> +	/* create rotation property */
> +	drm_plane_create_rotation_property(&p->plane,
> +					   DRM_MODE_ROTATE_0,
> +					   DRM_MODE_ROTATE_MASK |
> +					   DRM_MODE_REFLECT_MASK);
> +
> +	/* create alpha property */
> +	drm_plane_create_alpha_property(&p->plane);
> +
> +	/* create blend mode property */
> +	drm_plane_create_blend_mode_property(&p->plane, supported_modes);
> +
> +	/* create zpos property */
> +	drm_plane_create_zpos_immutable_property(&p->plane, index);
> +
> +	/* create fbc header size property */
> +	prop =3D drm_property_create_range(p->plane.dev, 0,
> +			"FBC header size RGB", 0, UINT_MAX);
> +	if (!prop)
> +		return -ENOMEM;
> +	drm_object_attach_property(&p->plane.base, prop, 0);
> +	p->fbc_hsize_r_property =3D prop;
> +
> +	prop =3D drm_property_create_range(p->plane.dev, 0,
> +			"FBC header size Y", 0, UINT_MAX);
> +	if (!prop)
> +		return -ENOMEM;
> +	drm_object_attach_property(&p->plane.base, prop, 0);
> +	p->fbc_hsize_y_property =3D prop;
> +
> +	prop =3D drm_property_create_range(p->plane.dev, 0,
> +			"FBC header size UV", 0, UINT_MAX);
> +	if (!prop)
> +		return -ENOMEM;
> +	drm_object_attach_property(&p->plane.base, prop, 0);
> +	p->fbc_hsize_uv_property =3D prop;
> +
> +	/* create y2r coef property */
> +	prop =3D drm_property_create_range(p->plane.dev, 0,
> +			"YUV2RGB coef", 0, UINT_MAX);
> +	if (!prop)
> +		return -ENOMEM;
> +	drm_object_attach_property(&p->plane.base, prop, 0);
> +	p->y2r_coef_property =3D prop;
> +
> +	/* create pallete enable property */
> +	prop =3D drm_property_create_range(p->plane.dev, 0,
> +			"pallete enable", 0, UINT_MAX);
> +	if (!prop)
> +		return -ENOMEM;
> +	drm_object_attach_property(&p->plane.base, prop, 0);
> +	p->pallete_en_property =3D prop;
> +
> +	/* create pallete color property */
> +	prop =3D drm_property_create_range(p->plane.dev, 0,
> +			"pallete color", 0, UINT_MAX);
> +	if (!prop)
> +		return -ENOMEM;
> +	drm_object_attach_property(&p->plane.base, prop, 0);
> +	p->pallete_color_property =3D prop;
> +
> +	return 0;
> +}
> +
> +struct drm_plane *sprd_plane_init(struct drm_device *drm,
> +					struct dpu_capability *cap,
> +					enum drm_plane_type type)
> +{
> +	struct drm_plane *primary =3D NULL;
> +	struct sprd_plane *p =3D NULL;
> +	int err, i;
> +
> +	for (i =3D 0; i < cap->max_layers; i++) {
> +
> +		p =3D devm_kzalloc(drm->dev, sizeof(*p), GFP_KERNEL);
> +		if (!p)
> +			return ERR_PTR(-ENOMEM);
> +
> +		err =3D drm_universal_plane_init(drm, &p->plane,
> +					       1 << drm->mode_config.num_crtc,
> +					       &sprd_plane_funcs, cap->fmts_ptr,
> +					       cap->fmts_cnt, NULL,
> +					       type, NULL);
> +		if (err) {
> +			DRM_ERROR("fail to init primary plane\n");
> +			return ERR_PTR(err);
> +		}
> +
> +		drm_plane_helper_add(&p->plane, &sprd_plane_helper_funcs);
> +
> +		sprd_plane_create_properties(p, i);
> +
> +		p->index =3D i;
> +		if (i =3D=3D 0)
> +			primary =3D &p->plane;
> +	}
> +
> +	if (p)
> +		DRM_INFO("dpu plane init ok\n");
> +
> +	return primary;
> +}
> diff --git a/drivers/gpu/drm/sprd/sprd_plane.h b/drivers/gpu/drm/sprd/s=
prd_plane.h
> new file mode 100644
> index 0000000..f63776a8
> --- /dev/null
> +++ b/drivers/gpu/drm/sprd/sprd_plane.h
> @@ -0,0 +1,36 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2019 Unisoc Inc.
> + */
> +
> +#ifndef __SPRD_PLANE_H__
> +#define __SPRD_PLANE_H__
> +
> +#define to_sprd_plane(x)		container_of(x, struct sprd_plane, plane)
> +#define to_sprd_plane_state(x)	container_of(x, struct sprd_plane_state=
, state)
> +
> +struct sprd_plane_state {
> +	struct drm_plane_state state;
> +	u32 fbc_hsize_r;
> +	u32 fbc_hsize_y;
> +	u32 fbc_hsize_uv;
> +	u32 y2r_coef;
> +	u32 pallete_en;
> +	u32 pallete_color;
> +};
> +
> +struct sprd_plane {
> +	struct drm_plane plane;
> +	struct drm_property *fbc_hsize_r_property;
> +	struct drm_property *fbc_hsize_y_property;
> +	struct drm_property *fbc_hsize_uv_property;
> +	struct drm_property *y2r_coef_property;
> +	struct drm_property *pallete_en_property;
> +	struct drm_property *pallete_color_property;
> +	u32 index;
> +};
> +
> +struct drm_plane *sprd_plane_init(struct drm_device *dev,
> +					struct dpu_capability *cap,
> +					enum drm_plane_type type);
> +#endif
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--Icy9oefLzBchjt3d3bTIrY5MM6ioIyCFw--

--2I432nAzAIM8r5mmxzfzpIXSgjs7labum
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl4pY8YACgkQaA3BHVML
eiOdDAf+JAGrBX5CNLjYJNJJIdxbLSBqIhnNLWPU5m59VRBSpMOuEP6QPwrKX1lK
p9AsBELVAtG07m52RFeLBOVslNix/gR7SxYGdrZrCllXAk8xP3Abrb/p32AZ++ag
2pP4udl9FYrxtEcazCOBmObXgcgDHd31z5EE+Lys7ajdoQh6ZpT6JBinOLd1IJIb
kEpNdXlkzBzKVoc704HTNOxNmTfEsSH6o8KxF3EhjKSCJ7bBEM381JZIk++yqZ++
sh1J2eTfQ23lIvroItkaxGE+ZX5CyhyChWOwKEG7X68wIzA8ax49/+qP0qMPGXX+
sCOIyHUB8uTqIqdswITVW9wPhyPmXA==
=/ddS
-----END PGP SIGNATURE-----

--2I432nAzAIM8r5mmxzfzpIXSgjs7labum--

--===============1701094545==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1701094545==--
