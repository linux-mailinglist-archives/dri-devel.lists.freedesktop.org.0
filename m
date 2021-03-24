Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B7C1F34768C
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 11:53:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2DE56E9B4;
	Wed, 24 Mar 2021 10:53:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1C6D6E200
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 10:53:38 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 35FA25807EA;
 Wed, 24 Mar 2021 06:53:38 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Wed, 24 Mar 2021 06:53:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=DpRYPTD3c8t6jYcONOZGiPhG6z4
 y9nL8RToSQvqSsLk=; b=Fx6kzGygKtFMQeufnGJxkhIKymrBkWNWT1pj2PTKhNQ
 TRx6AO8zNrwzDQZ41oGzFUdpUJEggfz6cIi500hwqsW3TvIssubzFNnp7FZSqpCT
 Ueo3Ui5M95pe1CqfQc+0AL/WFYriEdiCWWM5Q3WhzWHCNf1LHdRd/Z6MZWfRNm39
 hVYTB30/NnQV5oBx9FhvSrSPfKFwhYQHuulPweZ2Zo3cILCCjkkBYETE5qXnEjZR
 n4LcCbyqyaY9XpDF5sF0TGIgIVGWVUmDIeaynMf9dKl1N/W9ostwmwubGio/Y7bX
 qviXEDWmaH8qTcoGFF7j7nIoDAx43SXTV7VgR/ZsXqw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=DpRYPT
 D3c8t6jYcONOZGiPhG6z4y9nL8RToSQvqSsLk=; b=MWyxFZfZeXarq9qRKc31xS
 yq/4zzWeugzLn9L/HN4Zd60MLt9/KZWRL20wHwKFbFcjpDOncFcwsiu8MelJ/vW6
 IdnojhiYsIMaMZd+1uLpUZXJmLRy2iNPOHDshRdj4JJIcg5RsV6BIqaHNyUSD+Mc
 Jh8XGss7sFzBxWCari9IPZCwzd2eKBGkaGfyZB3HUjcaNF789E8MmLpJvmFe1J8h
 uu+BPzq0XBSTjObgs5amYzW4h0N8fEsLZBZ2bj3Gj4ofwmervLH4C8avOXnrOBa9
 pMwg/qfLU1vBiLBDJJUNTVmTVilNSG4A0/XNkVna8wkSDH1XBkEiVU66hG8iFPoA
 ==
X-ME-Sender: <xms:MBpbYLauGIDwJeuEeUuiiniSxYcjSbvSFOK5cO4o8YPketqqumz1lw>
 <xme:MBpbYKYDOONRksMA-_Gil-Tjw31rkDyyk5MSjYBxdD9NLDEHyQmQgyVBnngWg7q8l
 kt-pIZhyu2-YMNQJFc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudegkedgudelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:MBpbYN8JiVpiZ5TynLgND0MPmdvMxagjliQmu4u5e1sqG7IJOpnXPw>
 <xmx:MBpbYBr6rmuG9XgoDKZznpHzSsof3kf8_7FYEnDpZYBCuHmeZVtJ4g>
 <xmx:MBpbYGqdb2aWSntrOJ0M84Em1EwfmOvyAFJTtQmxPl4IY4iSDLtLAw>
 <xmx:MhpbYF3VPuYn9RVuUA6s-oypxEoDC9ufHoJ6YbKpTDfDkC_i_6EzpQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 909F2240356;
 Wed, 24 Mar 2021 06:53:36 -0400 (EDT)
Date: Wed, 24 Mar 2021 11:53:34 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Kevin Tang <kevin3.tang@gmail.com>
Subject: Re: [PATCH v4 2/6] drm/sprd: add Unisoc's drm kms master
Message-ID: <20210324105334.7pnrco53akhzjjjw@gilmour>
References: <20210222132822.7830-1-kevin3.tang@gmail.com>
 <20210222132822.7830-3-kevin3.tang@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210222132822.7830-3-kevin3.tang@gmail.com>
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, airlied@linux.ie,
 zhang.lyra@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org, orsonzhai@gmail.com,
 sean@poorly.run
Content-Type: multipart/mixed; boundary="===============0681682633=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0681682633==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ow6bp7k2ggmztavn"
Content-Disposition: inline


--ow6bp7k2ggmztavn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi

On Mon, Feb 22, 2021 at 09:28:18PM +0800, Kevin Tang wrote:
> Adds drm support for the Unisoc's display subsystem.
>=20
> This is drm kms driver, this driver provides support for the
> application framework in Android, Yocto and more.
>=20
> Application framework can access Unisoc's display internel

                                                    ^ internal

> peripherals through libdrm or libkms, it's test ok by modetest
> (DRM/KMS test tool) and Android HWComposer.
>=20
> Cc: Orson Zhai <orsonzhai@gmail.com>
> Cc: Chunyan Zhang <zhang.lyra@gmail.com>
> Signed-off-by: Kevin Tang <kevin.tang@unisoc.com>
>=20
> v4:
>   - Move the devm_drm_dev_alloc to master_ops->bind function.
>   - The managed drmm_mode_config_init() it is no longer necessary for dri=
vers to explicitly call drm_mode_config_cleanup, so delete it.
> ---
>  drivers/gpu/drm/Kconfig         |   2 +
>  drivers/gpu/drm/Makefile        |   1 +
>  drivers/gpu/drm/sprd/Kconfig    |  12 ++
>  drivers/gpu/drm/sprd/Makefile   |   5 +
>  drivers/gpu/drm/sprd/sprd_drm.c | 217 ++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/sprd/sprd_drm.h |  16 +++
>  6 files changed, 253 insertions(+)
>  create mode 100644 drivers/gpu/drm/sprd/Kconfig
>  create mode 100644 drivers/gpu/drm/sprd/Makefile
>  create mode 100644 drivers/gpu/drm/sprd/sprd_drm.c
>  create mode 100644 drivers/gpu/drm/sprd/sprd_drm.h
>=20
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index 8bf103de1..9d6ce2867 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -382,6 +382,8 @@ source "drivers/gpu/drm/tidss/Kconfig"
> =20
>  source "drivers/gpu/drm/xlnx/Kconfig"
> =20
> +source "drivers/gpu/drm/sprd/Kconfig"
> +
>  # Keep legacy drivers last
> =20
>  menuconfig DRM_LEGACY
> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> index 02c229392..42d211d9c 100644
> --- a/drivers/gpu/drm/Makefile
> +++ b/drivers/gpu/drm/Makefile
> @@ -126,3 +126,4 @@ obj-$(CONFIG_DRM_ASPEED_GFX) +=3D aspeed/
>  obj-$(CONFIG_DRM_MCDE) +=3D mcde/
>  obj-$(CONFIG_DRM_TIDSS) +=3D tidss/
>  obj-y			+=3D xlnx/
> +obj-$(CONFIG_DRM_SPRD) +=3D sprd/
> diff --git a/drivers/gpu/drm/sprd/Kconfig b/drivers/gpu/drm/sprd/Kconfig
> new file mode 100644
> index 000000000..6e80cc9f3
> --- /dev/null
> +++ b/drivers/gpu/drm/sprd/Kconfig
> @@ -0,0 +1,12 @@
> +config DRM_SPRD
> +	tristate "DRM Support for Unisoc SoCs Platform"
> +	depends on ARCH_SPRD || COMPILE_TEST
> +	depends on DRM && OF
> +	select DRM_KMS_HELPER
> +	select DRM_GEM_CMA_HELPER
> +	select DRM_KMS_CMA_HELPER
> +	select DRM_MIPI_DSI

I guess this should rather be moved to your DSI introduction patch?

> +	help
> +	  Choose this option if you have a Unisoc chipset.
> +	  If M is selected the module will be called sprd_drm.
> +
> diff --git a/drivers/gpu/drm/sprd/Makefile b/drivers/gpu/drm/sprd/Makefile
> new file mode 100644
> index 000000000..86d95d93a
> --- /dev/null
> +++ b/drivers/gpu/drm/sprd/Makefile
> @@ -0,0 +1,5 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +subdir-ccflags-y +=3D -I$(srctree)/$(src)

Is it really needed? I'm not seeing any header that aren't in the
include path already.

> +obj-y :=3D sprd_drm.o
> diff --git a/drivers/gpu/drm/sprd/sprd_drm.c b/drivers/gpu/drm/sprd/sprd_=
drm.c
> new file mode 100644
> index 000000000..a1d3ed655
> --- /dev/null
> +++ b/drivers/gpu/drm/sprd/sprd_drm.c
> @@ -0,0 +1,217 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2020 Unisoc Inc.
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
> +#include <drm/drm_of.h>
> +#include <drm/drm_probe_helper.h>
> +#include <drm/drm_vblank.h>
> +
> +#include "sprd_drm.h"
> +
> +#define DRIVER_NAME	"sprd"
> +#define DRIVER_DESC	"Spreadtrum SoCs' DRM Driver"
> +#define DRIVER_DATE	"20200201"
> +#define DRIVER_MAJOR	1
> +#define DRIVER_MINOR	0
> +
> +static const struct drm_mode_config_helper_funcs sprd_drm_mode_config_he=
lper =3D {
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
> +DEFINE_DRM_GEM_CMA_FOPS(sprd_drm_fops);
> +
> +static struct drm_driver sprd_drm_drv =3D {
> +	.driver_features	=3D DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
> +	.fops			=3D &sprd_drm_fops,
> +
> +	/* GEM Operations */
> +	DRM_GEM_CMA_DRIVER_OPS,
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
> +	struct platform_device *pdev =3D to_platform_device(dev);
> +	struct drm_device *drm;
> +	struct sprd_drm *sprd;
> +	int ret;
> +
> +	sprd =3D devm_drm_dev_alloc(dev, &sprd_drm_drv, struct sprd_drm, drm);
> +	if (IS_ERR(sprd))
> +		return PTR_ERR(sprd);
> +
> +	drm =3D &sprd->drm;
> +	platform_set_drvdata(pdev, drm);
> +
> +	ret =3D drmm_mode_config_init(drm);
> +	if (ret)
> +		return ret;
> +
> +	sprd_drm_mode_config_init(drm);
> +
> +	/* bind and init sub drivers */
> +	ret =3D component_bind_all(drm->dev, drm);
> +	if (ret) {
> +		drm_err(drm, "failed to bind all component.\n");
> +		return ret;
> +	}
> +
> +	/* vblank init */
> +	ret =3D drm_vblank_init(drm, drm->mode_config.num_crtc);
> +	if (ret) {
> +		drm_err(drm, "failed to initialize vblank.\n");
> +		goto err_unbind_all;
> +	}
> +	/* with irq_enabled =3D true, we can use the vblank feature. */
> +	drm->irq_enabled =3D true;
> +
> +	/* reset all the states of crtc/plane/encoder/connector */
> +	drm_mode_config_reset(drm);
> +
> +	/* init kms poll for handling hpd */
> +	drm_kms_helper_poll_init(drm);
> +
> +	ret =3D drm_dev_register(drm, 0);
> +	if (ret < 0)
> +		goto err_kms_helper_poll_fini;
> +
> +	return 0;
> +
> +err_kms_helper_poll_fini:
> +	drm_kms_helper_poll_fini(drm);
> +err_unbind_all:
> +	component_unbind_all(drm->dev, drm);
> +	return ret;
> +}
> +
> +static void sprd_drm_unbind(struct device *dev)
> +{
> +	struct drm_device *drm =3D dev_get_drvdata(dev);
> +
> +	drm_dev_unregister(drm);
> +
> +	drm_kms_helper_poll_fini(drm);
> +
> +	component_unbind_all(drm->dev, drm);
> +}
> +
> +static const struct component_master_ops drm_component_ops =3D {
> +	.bind =3D sprd_drm_bind,
> +	.unbind =3D sprd_drm_unbind,
> +};
> +
> +static int compare_of(struct device *dev, void *data)
> +{
> +	return dev->of_node =3D=3D data;
> +}
> +
> +static int sprd_drm_probe(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	int ret;
> +
> +	ret =3D dma_set_mask_and_coherent(dev, ~0UL);
> +	if (ret) {
> +		dev_err(dev, "dma_set_mask_and_coherent failed (%d)\n", ret);
> +		return ret;
> +	}

It's not really clear to me what it's here for. Could you explain with a
comment here?

Thanks
Maxime

--ow6bp7k2ggmztavn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYFsaLgAKCRDj7w1vZxhR
xX3FAQD4Vr82N4oxgj2UMF7Y4POztMtN44kZqA8THsxP35Z+ngEA+zQVm42JoYMv
QQezkDq1ABXOCjfC81ukdFVphGzOPg8=
=AjIW
-----END PGP SIGNATURE-----

--ow6bp7k2ggmztavn--

--===============0681682633==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0681682633==--
