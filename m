Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D9A2474B61B
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jul 2023 20:09:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A01F10E5D2;
	Fri,  7 Jul 2023 18:09:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x934.google.com (mail-ua1-x934.google.com
 [IPv6:2607:f8b0:4864:20::934])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEECC10E5D2
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jul 2023 18:09:53 +0000 (UTC)
Received: by mail-ua1-x934.google.com with SMTP id
 a1e0cc1a2514c-786e637f06dso819501241.2
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jul 2023 11:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ndufresne-ca.20221208.gappssmtp.com; s=20221208; t=1688753392; x=1691345392; 
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=0Sf1bysh72GpXmNP1LxuCvznADp5G81+oaOERZx/MaA=;
 b=29sI9HMlLgPBvkUWZ2YZSKA3Ku76SjSpVQF87PtuQUgJm2y2IzVdxadomSq/aBNCJ6
 zu8bRasz/sDjvUirJRDU3pTnWZ0ovImv8kuwEs6bHuyezhTR11k/sP/orpTTxMIlPhJn
 ro9rCCoz1edJxp/8jgqsWSXbZunqnSogLRAL2KOyEW7jkNAmEUCr7zqjJhRFgwenNa+8
 SIi7KvlIfPDWnmr1BPbOzQU3Oj5f5FdzbbUC7FfNl/FS6si1CgUcnNwxxLPHRitrMd6W
 dhtSQsSmg4pwCEgRHRG/NKvVVuvRtSM47vQUEdccs7QC0oEc9PZlJcZUrL09vu64n7cn
 LYMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688753392; x=1691345392;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0Sf1bysh72GpXmNP1LxuCvznADp5G81+oaOERZx/MaA=;
 b=c3ujvL+rENgszcFf30wTa9utHqveGp32etSyY42aSAABE9MAAUuAJtLwBXAiRrPkYC
 DmDUKHEqbGpxNU29DUJWJVsNz3IKaIyY5sJPSOYQPHtCwbYXMttbGnqDhCBbxcDI3gMs
 ApVc1vaBjDi5qwnEOYlZvyBR+zqVM5CKQvboShbaPdB2ZMPXamZmrRfcIDs8yuQwGyEa
 AEhqxBwqxd9lR5MS3/M6r6F1nVYHeKv8Y9xIJtgsfo7fjvioprpRD3fSfmoIn9M2qFcP
 y4oDkGyFucdKk+345bGhRPFv8ju5Iy7EZyhvZ16sPsQrDItlQS29CAjSADLVFYFBkMwI
 OMgw==
X-Gm-Message-State: ABy/qLbzBc5B4huaLaVlB1uuzFVV9h1V8GEEGmYPvxrB5M/g38yZbcXa
 ydl7ix38oup1iplIsTyi8+pV5A==
X-Google-Smtp-Source: APBJJlE173k+VvJu4lfxvxFKMjBl0n6GKjh3vfTVOgozhm4wr36giaoF+5dw+GdqRSZpYYDJ3wFXlg==
X-Received: by 2002:a05:6102:458:b0:445:1ede:4e7d with SMTP id
 e24-20020a056102045800b004451ede4e7dmr4426074vsq.21.1688753392186; 
 Fri, 07 Jul 2023 11:09:52 -0700 (PDT)
Received: from nicolas-tpx395.localdomain (mtl.collabora.ca. [66.171.169.34])
 by smtp.gmail.com with ESMTPSA id
 x19-20020a0ce0d3000000b0062626bd3683sm2334348qvk.59.2023.07.07.11.09.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jul 2023 11:09:51 -0700 (PDT)
Message-ID: <724640bed4ed5774751d2c1dba61680cc85c0b20.camel@ndufresne.ca>
Subject: Re: [PATCH 3/9] drm/verisilicon: Add basic drm driver
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Thomas Zimmermann <tzimmermann@suse.de>, Keith Zhao
 <keith.zhao@starfivetech.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org
Date: Fri, 07 Jul 2023 14:09:50 -0400
In-Reply-To: <ab470eee-1b0c-ff8b-bcab-60de1ea04e39@suse.de>
References: <20230602074043.33872-1-keith.zhao@starfivetech.com>
 <20230602074043.33872-4-keith.zhao@starfivetech.com>
 <ab470eee-1b0c-ff8b-bcab-60de1ea04e39@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.3 (3.48.3-1.fc38) 
MIME-Version: 1.0
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
Cc: Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Emil Renner Berthing <kernel@esmil.dk>, christian.koenig@amd.com,
 Bjorn Andersson <andersson@kernel.org>, Chris Morgan <macromorgan@hotmail.com>,
 Changhuang Liang <changhuang.liang@starfivetech.com>,
 Jagan Teki <jagan@edgeble.ai>, Jack Zhu <jack.zhu@starfivetech.com>,
 Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Shengyang Chen <shengyang.chen@starfivetech.com>,
 Shawn Guo <shawnguo@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

Le lundi 19 juin 2023 =C3=A0 14:59 +0200, Thomas Zimmermann a =C3=A9crit=C2=
=A0:
> Hi,
>=20
> I appreciate that you split the driver into small patches. Please find=
=20
> some comments below.
>=20
> Am 02.06.23 um 09:40 schrieb Keith Zhao:
> > Add a basic platform driver of the DRM driver for JH7110 SoC.
> >=20
> > Signed-off-by: Keith Zhao <keith.zhao@starfivetech.com>
> > ---
> >   MAINTAINERS                          |   2 +
> >   drivers/gpu/drm/Kconfig              |   2 +
> >   drivers/gpu/drm/Makefile             |   1 +
> >   drivers/gpu/drm/verisilicon/Kconfig  |  13 ++
> >   drivers/gpu/drm/verisilicon/Makefile |   6 +
> >   drivers/gpu/drm/verisilicon/vs_drv.c | 284 ++++++++++++++++++++++++++=
+
> >   drivers/gpu/drm/verisilicon/vs_drv.h |  48 +++++
> >   include/uapi/drm/drm_fourcc.h        |  83 ++++++++
> >   include/uapi/drm/vs_drm.h            |  50 +++++
> >   9 files changed, 489 insertions(+)
> >   create mode 100644 drivers/gpu/drm/verisilicon/Kconfig
> >   create mode 100644 drivers/gpu/drm/verisilicon/Makefile
> >   create mode 100644 drivers/gpu/drm/verisilicon/vs_drv.c
> >   create mode 100644 drivers/gpu/drm/verisilicon/vs_drv.h
> >   create mode 100644 include/uapi/drm/vs_drm.h
> >=20
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 293aa13d484c..da5b6766a7bb 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -7055,6 +7055,8 @@ L:	dri-devel@lists.freedesktop.org
> >   S:	Maintained
> >   T:	git git://anongit.freedesktop.org/drm/drm-misc
> >   F:	Documentation/devicetree/bindings/display/verisilicon/
> > +F:	drivers/gpu/drm/verisilicon/
> > +F:	include/uapi/drm/vs_drm.h
> >  =20
> >   DRM DRIVERS FOR VIVANTE GPU IP
> >   M:	Lucas Stach <l.stach@pengutronix.de>
> > diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> > index ba3fb04bb691..f7e461fa4656 100644
> > --- a/drivers/gpu/drm/Kconfig
> > +++ b/drivers/gpu/drm/Kconfig
> > @@ -371,6 +371,8 @@ source "drivers/gpu/drm/solomon/Kconfig"
> >  =20
> >   source "drivers/gpu/drm/sprd/Kconfig"
> >  =20
> > +source "drivers/gpu/drm/verisilicon/Kconfig"
> > +
> >   config DRM_HYPERV
> >   	tristate "DRM Support for Hyper-V synthetic video device"
> >   	depends on DRM && PCI && MMU && HYPERV
> > diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> > index a33257d2bc7f..e50622ee4e46 100644
> > --- a/drivers/gpu/drm/Makefile
> > +++ b/drivers/gpu/drm/Makefile
> > @@ -194,3 +194,4 @@ obj-y			+=3D gud/
> >   obj-$(CONFIG_DRM_HYPERV) +=3D hyperv/
> >   obj-y			+=3D solomon/
> >   obj-$(CONFIG_DRM_SPRD) +=3D sprd/
> > +obj-$(CONFIG_DRM_VERISILICON) +=3D verisilicon/
> > diff --git a/drivers/gpu/drm/verisilicon/Kconfig b/drivers/gpu/drm/veri=
silicon/Kconfig
> > new file mode 100644
> > index 000000000000..89d12185f73b
> > --- /dev/null
> > +++ b/drivers/gpu/drm/verisilicon/Kconfig
> > @@ -0,0 +1,13 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +
> > +config DRM_VERISILICON
> > +	tristate "DRM Support for VeriSilicon"
>=20
> Can you rename the driver and files? 'VeriSilicon' seems=20
> unpronounceable. Simply 'StarFive' and starfive/ would be fine.

Are you sure you want to request this ? If the display controller is a
Verisilicon design, it will be super odd to use on other SoC that aren't fr=
om
StarFive. Think about STM network driver, which is DesignWare.

Nicolas

>=20
> > +	depends on DRM
> > +	select DRM_KMS_HELPER
> > +	select CMA
> > +	select DMA_CMA
> > +	help
> > +	  Choose this option if you have a VeriSilicon soc chipset.
> > +	  This driver provides VeriSilicon kernel mode
> > +	  setting and buffer management. It does not
> > +	  provide 2D or 3D acceleration.
> > diff --git a/drivers/gpu/drm/verisilicon/Makefile b/drivers/gpu/drm/ver=
isilicon/Makefile
> > new file mode 100644
> > index 000000000000..64ce1b26546c
> > --- /dev/null
> > +++ b/drivers/gpu/drm/verisilicon/Makefile
> > @@ -0,0 +1,6 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +
> > +vs_drm-objs :=3D vs_drv.o
> > +
> > +obj-$(CONFIG_DRM_VERISILICON) +=3D vs_drm.o
> > +
> > diff --git a/drivers/gpu/drm/verisilicon/vs_drv.c b/drivers/gpu/drm/ver=
isilicon/vs_drv.c
> > new file mode 100644
> > index 000000000000..24d333598477
> > --- /dev/null
> > +++ b/drivers/gpu/drm/verisilicon/vs_drv.c
> > @@ -0,0 +1,284 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (C) 2023 VeriSilicon Holdings Co., Ltd.
> > + */
> > +
> > +#include <linux/clk.h>
> > +#include <linux/component.h>
> > +#include <linux/delay.h>
> > +#include <linux/dma-mapping.h>
> > +#include <linux/iommu.h>
> > +#include <linux/of_graph.h>
> > +#include <linux/of_reserved_mem.h>
> > +#include <linux/pm_runtime.h>
> > +#include <linux/reset.h>
> > +#include <linux/version.h>
> > +
> > +#include <drm/drm_aperture.h>
> > +#include <drm/drm_crtc.h>
> > +#include <drm/drm_crtc_helper.h>
> > +#include <drm/drm_debugfs.h>
> > +#include <drm/drm_drv.h>
> > +#include <drm/drm_fb_helper.h>
> > +#include <drm/drm_fbdev_generic.h>
> > +#include <drm/drm_file.h>
> > +#include <drm/drm_fourcc.h>
> > +#include <drm/drm_ioctl.h>
> > +#include <drm/drm_of.h>
> > +#include <drm/drm_prime.h>
> > +#include <drm/drm_probe_helper.h>
> > +#include <drm/drm_vblank.h>
> > +
> > +#include "vs_drv.h"
> > +
> > +#define DRV_NAME	"starfive"
> > +#define DRV_DESC	"Starfive DRM driver"
> > +#define DRV_DATE	"202305161"
> > +#define DRV_MAJOR	1
> > +#define DRV_MINOR	0
> > +
> > +static struct platform_driver vs_drm_platform_driver;
> > +
> > +static const struct file_operations fops =3D {
> > +	.owner			=3D THIS_MODULE,
> > +	.open			=3D drm_open,
> > +	.release		=3D drm_release,
> > +	.unlocked_ioctl	=3D drm_ioctl,
> > +	.compat_ioctl	=3D drm_compat_ioctl,
> > +	.poll			=3D drm_poll,
> > +	.read			=3D drm_read,
> > +};
> > +
> > +static struct drm_driver vs_drm_driver =3D {
> > +	.driver_features	=3D DRIVER_MODESET | DRIVER_ATOMIC | DRIVER_GEM,
> > +	.lastclose		=3D drm_fb_helper_lastclose,
> > +	.prime_handle_to_fd =3D drm_gem_prime_handle_to_fd,
> > +	.prime_fd_to_handle =3D drm_gem_prime_fd_to_handle,
> > +	.fops			=3D &fops,
> > +	.name			=3D DRV_NAME,
> > +	.desc			=3D DRV_DESC,
> > +	.date			=3D DRV_DATE,
> > +	.major			=3D DRV_MAJOR,
> > +	.minor			=3D DRV_MINOR,
> > +};
> > +
> > +void vs_drm_update_pitch_alignment(struct drm_device *drm_dev,
> > +				   unsigned int alignment)
> > +{
> > +	struct vs_drm_private *priv =3D drm_dev->dev_private;
> > +
> > +	if (alignment > priv->pitch_alignment)
> > +		priv->pitch_alignment =3D alignment;
> > +}
> > +
> > +static int vs_drm_bind(struct device *dev)
> > +{
> > +	struct drm_device *drm_dev;
> > +	struct vs_drm_private *priv;
> > +	int ret;
> > +	static u64 dma_mask =3D DMA_BIT_MASK(40);
> > +
> > +	/* Remove existing drivers that may own the framebuffer memory. */
> > +	ret =3D drm_aperture_remove_framebuffers(false, &vs_drm_driver);
> > +	if (ret) {
> > +		DRM_DEV_ERROR(dev,
>=20
> drm_err(), drm_info(), drm_warn(), etc.  Here and everwhere else. The=20
> DRM_DEV_*() print macros are obsolete.
>=20
> > +			      "Failed to remove existing framebuffers - %d.\n",
> > +			      ret);
> > +		return ret;
> > +	}
> > +
> > +	drm_dev =3D drm_dev_alloc(&vs_drm_driver, dev);
> > +	if (IS_ERR(drm_dev))
> > +		return PTR_ERR(drm_dev);
> > +
> > +	dev_set_drvdata(dev, drm_dev);
> > +
> > +	priv =3D devm_kzalloc(drm_dev->dev, sizeof(struct vs_drm_private),
> > +			    GFP_KERNEL);
> > +	if (!priv) {
> > +		ret =3D -ENOMEM;
> > +		goto err_put_dev;
> > +	}
> > +
> > +	priv->pitch_alignment =3D 64;
> > +	priv->dma_dev =3D drm_dev->dev;
> > +	priv->dma_dev->coherent_dma_mask =3D dma_mask;
> > +	drm_dev->dev_private =3D priv;
>=20
> dev_private is obsolete and about to go away at some point.
>=20
> Please embed drm_device in vs_drm_private and allocate the memory with=
=20
> devm_drm_dev_alloc().
>=20
> > +
> > +	drm_mode_config_init(drm_dev);
>=20
> drmm_mode_config_init() please.
>=20
> > +
> > +	/* Now try and bind all our sub-components */
> > +	ret =3D component_bind_all(dev, drm_dev);
> > +	if (ret)
> > +		goto err_mode;
> > +
> > +	ret =3D drm_vblank_init(drm_dev, drm_dev->mode_config.num_crtc);
> > +	if (ret)
> > +		goto err_bind;
> > +
> > +	drm_mode_config_reset(drm_dev);
> > +
> > +	drm_kms_helper_poll_init(drm_dev);
> > +
> > +	ret =3D drm_dev_register(drm_dev, 0);
> > +	if (ret)
> > +		goto err_helper;
> > +
> > +	drm_fbdev_generic_setup(drm_dev, 32);
> > +
> > +	return 0;
> > +
> > +err_helper:
> > +	drm_kms_helper_poll_fini(drm_dev);
> > +err_bind:
> > +	component_unbind_all(drm_dev->dev, drm_dev);
> > +err_mode:
> > +	drm_mode_config_cleanup(drm_dev);
> > +	if (priv->domain)
> > +		iommu_domain_free(priv->domain);
> > +err_put_dev:
> > +	drm_dev->dev_private =3D NULL;
> > +	dev_set_drvdata(dev, NULL);
> > +	drm_dev_put(drm_dev);
> > +	return ret;
> > +}
> > +
> > +static void vs_drm_unbind(struct device *dev)
> > +{
> > +	struct drm_device *drm_dev =3D dev_get_drvdata(dev);
> > +	struct vs_drm_private *priv =3D drm_dev->dev_private;
> > +
> > +	drm_dev_unregister(drm_dev);
> > +
> > +	drm_kms_helper_poll_fini(drm_dev);
> > +
> > +	component_unbind_all(drm_dev->dev, drm_dev);
> > +
> > +	drm_mode_config_cleanup(drm_dev);
> > +
> > +	if (priv->domain) {
> > +		iommu_domain_free(priv->domain);
> > +		priv->domain =3D NULL;
> > +	}
> > +
> > +	drm_dev->dev_private =3D NULL;
> > +	dev_set_drvdata(dev, NULL);
> > +	drm_dev_put(drm_dev);
>=20
> You rather want to convert the individual steps of this cleanup to=20
> managed functions (drmm_ and devm_) to automate the cleanup when as part=
=20
> of drm_dev_put().
>=20
> > +}
> > +
> > +static const struct component_master_ops vs_drm_ops =3D {
> > +	.bind =3D vs_drm_bind,
> > +	.unbind =3D vs_drm_unbind,
> > +};
> > +
> > +static struct platform_driver *drm_sub_drivers[] =3D {
> > +};
> > +
> > +#define NUM_DRM_DRIVERS \
> > +	(sizeof(drm_sub_drivers) / sizeof(struct platform_driver *))
>=20
> Does this really work? sizeof(drm_sub_drivers) isn't know at compile=20
> time. It is always assumed to be 0 AFAICT. Or do you fill this array in=
=20
> later patches?
>=20
>=20
> > +
> > +static int compare_dev(struct device *dev, void *data)
> > +{
> > +	return dev =3D=3D (struct device *)data;
> > +}
> > +
> > +static struct component_match *vs_drm_match_add(struct device *dev)
> > +{
> > +	struct component_match *match =3D NULL;
> > +	int i;
> > +
> > +	for (i =3D 0; i < NUM_DRM_DRIVERS; ++i) {
> > +		struct platform_driver *drv =3D drm_sub_drivers[i];
> > +		struct device *p =3D NULL, *d;
> > +
> > +		while ((d =3D platform_find_device_by_driver(p, &drv->driver))) {
> > +			put_device(p);
> > +
> > +			component_match_add(dev, &match, compare_dev, d);
> > +			p =3D d;
> > +		}
> > +		put_device(p);
> > +	}
> > +
> > +	return match ?: ERR_PTR(-ENODEV);
> > +}
> > +
> > +static int vs_drm_platform_probe(struct platform_device *pdev)
> > +{
> > +	struct device *dev =3D &pdev->dev;
> > +	struct component_match *match;
> > +
> > +	match =3D vs_drm_match_add(dev);
> > +	if (IS_ERR(match))
> > +		return PTR_ERR(match);
> > +
> > +	return component_master_add_with_match(dev, &vs_drm_ops, match);
> > +}
> > +
> > +static int vs_drm_platform_remove(struct platform_device *pdev)
> > +{
> > +	component_master_del(&pdev->dev, &vs_drm_ops);
> > +	return 0;
> > +}
> > +
> > +#ifdef CONFIG_PM_SLEEP
> > +static int vs_drm_suspend(struct device *dev)
> > +{
> > +	struct drm_device *drm =3D dev_get_drvdata(dev);
> > +
> > +	return drm_mode_config_helper_suspend(drm);
> > +}
> > +
> > +static int vs_drm_resume(struct device *dev)
> > +{
> > +	struct drm_device *drm =3D dev_get_drvdata(dev);
> > +
> > +	return drm_mode_config_helper_resume(drm);
> > +}
> > +#endif
> > +
> > +static SIMPLE_DEV_PM_OPS(vs_drm_pm_ops, vs_drm_suspend, vs_drm_resume)=
;
> > +
> > +static const struct of_device_id vs_drm_dt_ids[] =3D {
> > +	{ .compatible =3D "verisilicon,display-subsystem", },
> > +};
> > +
> > +MODULE_DEVICE_TABLE(of, vs_drm_dt_ids);
> > +
> > +static struct platform_driver vs_drm_platform_driver =3D {
> > +	.probe =3D vs_drm_platform_probe,
> > +	.remove =3D vs_drm_platform_remove,
> > +
> > +	.driver =3D {
> > +		.name =3D DRV_NAME,
> > +		.of_match_table =3D vs_drm_dt_ids,
> > +		.pm =3D &vs_drm_pm_ops,
> > +	},
> > +};
> > +
> > +static int __init vs_drm_init(void)
> > +{
> > +	int ret;
> > +
> > +	ret =3D platform_register_drivers(drm_sub_drivers, NUM_DRM_DRIVERS);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret =3D platform_driver_register(&vs_drm_platform_driver);
> > +	if (ret)
> > +		platform_unregister_drivers(drm_sub_drivers, NUM_DRM_DRIVERS);
> > +
> > +	return ret;
> > +}
> > +
> > +static void __exit vs_drm_fini(void)
> > +{
> > +	platform_driver_unregister(&vs_drm_platform_driver);
> > +	platform_unregister_drivers(drm_sub_drivers, NUM_DRM_DRIVERS);
> > +}
> > +
> > +module_init(vs_drm_init);
> > +module_exit(vs_drm_fini);
> > +
> > +MODULE_DESCRIPTION("VeriSilicon DRM Driver");
> > +MODULE_LICENSE("GPL");
> > diff --git a/drivers/gpu/drm/verisilicon/vs_drv.h b/drivers/gpu/drm/ver=
isilicon/vs_drv.h
> > new file mode 100644
> > index 000000000000..0382b44e3bf0
> > --- /dev/null
> > +++ b/drivers/gpu/drm/verisilicon/vs_drv.h
> > @@ -0,0 +1,48 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * Copyright (C) 2023 VeriSilicon Holdings Co., Ltd.
> > + */
> > +
> > +#ifndef __VS_DRV_H__
> > +#define __VS_DRV_H__
> > +
> > +#include <linux/module.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/version.h>
> > +#include <drm/drm_drv.h>
> > +#include <drm/drm_gem.h>
> > +
> > +/*
> > + *
> > + * @dma_dev: device for DMA API.
> > + *	- use the first attached device if support iommu
> > +	else use drm device (only contiguous buffer support)
> > + * @domain: iommu domain for DRM.
> > + *	- all DC IOMMU share same domain to reduce mapping
> > + * @pitch_alignment: buffer pitch alignment required by sub-devices.
> > + *
> > + */
> > +struct vs_drm_private {
> > +	struct device *dma_dev;
> > +	struct iommu_domain *domain;
> > +	unsigned int pitch_alignment;
> > +};
>=20
> As mentioned, this struct needs to embed struct drm_device.
>=20
> > +
> > +void vs_drm_update_pitch_alignment(struct drm_device *drm_dev,
> > +				   unsigned int alignment);
> > +
> > +static inline struct device *to_dma_dev(struct drm_device *dev)
> > +{
> > +	struct vs_drm_private *priv =3D dev->dev_private;
> > +
> > +	return priv->dma_dev;
>=20
> And this needs to be an upcast via container_of().
>=20
> > +}
> > +
> > +static inline bool is_iommu_enabled(struct drm_device *dev)
> > +{
> > +	struct vs_drm_private *priv =3D dev->dev_private;
> > +
> > +	return priv->domain ? true : false;
> > +}
> > +
> > +#endif /* __VS_DRV_H__ */
> > diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourc=
c.h
> > index de703c6be969..af4fb50f9207 100644
> > --- a/include/uapi/drm/drm_fourcc.h
> > +++ b/include/uapi/drm/drm_fourcc.h
>=20
> The UAPI changes shouldn't be needed in this patch?
>=20
> > @@ -419,6 +419,7 @@ extern "C" {
> >   #define DRM_FORMAT_MOD_VENDOR_ARM     0x08
> >   #define DRM_FORMAT_MOD_VENDOR_ALLWINNER 0x09
> >   #define DRM_FORMAT_MOD_VENDOR_AMLOGIC 0x0a
> > +#define DRM_FORMAT_MOD_VENDOR_VS      0x0b
> >  =20
> >   /* add more to the end as needed */
> >  =20
> > @@ -1519,6 +1520,88 @@ drm_fourcc_canonicalize_nvidia_format_mod(__u64 =
modifier)
> >   #define AMD_FMT_MOD_CLEAR(field) \
> >   	(~((__u64)AMD_FMT_MOD_##field##_MASK << AMD_FMT_MOD_##field##_SHIFT)=
)
> >  =20
> > +#define DRM_FORMAT_MOD_VS_TYPE_NORMAL        0x00
> > +#define DRM_FORMAT_MOD_VS_TYPE_COMPRESSED    0x01
> > +#define DRM_FORMAT_MOD_VS_TYPE_CUSTOM_10BIT  0x02
> > +#define DRM_FORMAT_MOD_VS_TYPE_MASK     ((__u64)0x3 << 54)
> > +
> > +#define fourcc_mod_vs_code(type, val) \
> > +	fourcc_mod_code(VS, ((((__u64)type) << 54) | (val)))
> > +
> > +#define DRM_FORMAT_MOD_VS_DEC_TILE_MODE_MASK    0x3F
> > +#define DRM_FORMAT_MOD_VS_DEC_TILE_8X8_XMAJOR   0x00
> > +#define DRM_FORMAT_MOD_VS_DEC_TILE_8X8_YMAJOR   0x01
> > +#define DRM_FORMAT_MOD_VS_DEC_TILE_16X4     0x02
> > +#define DRM_FORMAT_MOD_VS_DEC_TILE_8X4      0x03
> > +#define DRM_FORMAT_MOD_VS_DEC_TILE_4X8      0x04
> > +#define DRM_FORMAT_MOD_VS_DEC_RASTER_16X4   0x06
> > +#define DRM_FORMAT_MOD_VS_DEC_TILE_64X4     0x07
> > +#define DRM_FORMAT_MOD_VS_DEC_TILE_32X4     0x08
> > +#define DRM_FORMAT_MOD_VS_DEC_RASTER_256X1  0x09
> > +#define DRM_FORMAT_MOD_VS_DEC_RASTER_128X1  0x0A
> > +#define DRM_FORMAT_MOD_VS_DEC_RASTER_64X4   0x0B
> > +#define DRM_FORMAT_MOD_VS_DEC_RASTER_256X2  0x0C
> > +#define DRM_FORMAT_MOD_VS_DEC_RASTER_128X2  0x0D
> > +#define DRM_FORMAT_MOD_VS_DEC_RASTER_128X4  0x0E
> > +#define DRM_FORMAT_MOD_VS_DEC_RASTER_64X1   0x0F
> > +#define DRM_FORMAT_MOD_VS_DEC_TILE_16X8     0x10
> > +#define DRM_FORMAT_MOD_VS_DEC_TILE_8X16     0x11
> > +#define DRM_FORMAT_MOD_VS_DEC_RASTER_512X1  0x12
> > +#define DRM_FORMAT_MOD_VS_DEC_RASTER_32X4   0x13
> > +#define DRM_FORMAT_MOD_VS_DEC_RASTER_64X2   0x14
> > +#define DRM_FORMAT_MOD_VS_DEC_RASTER_32X2   0x15
> > +#define DRM_FORMAT_MOD_VS_DEC_RASTER_32X1   0x16
> > +#define DRM_FORMAT_MOD_VS_DEC_RASTER_16X1   0x17
> > +#define DRM_FORMAT_MOD_VS_DEC_TILE_128X4    0x18
> > +#define DRM_FORMAT_MOD_VS_DEC_TILE_256X4    0x19
> > +#define DRM_FORMAT_MOD_VS_DEC_TILE_512X4    0x1A
> > +#define DRM_FORMAT_MOD_VS_DEC_TILE_16X16    0x1B
> > +#define DRM_FORMAT_MOD_VS_DEC_TILE_32X16    0x1C
> > +#define DRM_FORMAT_MOD_VS_DEC_TILE_64X16    0x1D
> > +#define DRM_FORMAT_MOD_VS_DEC_TILE_128X8    0x1E
> > +#define DRM_FORMAT_MOD_VS_DEC_TILE_8X4_S    0x1F
> > +#define DRM_FORMAT_MOD_VS_DEC_TILE_16X4_S   0x20
> > +#define DRM_FORMAT_MOD_VS_DEC_TILE_32X4_S   0x21
> > +#define DRM_FORMAT_MOD_VS_DEC_TILE_16X4_LSB 0x22
> > +#define DRM_FORMAT_MOD_VS_DEC_TILE_32X4_LSB 0x23
> > +#define DRM_FORMAT_MOD_VS_DEC_TILE_32X8     0x24
> > +
> > +#define DRM_FORMAT_MOD_VS_DEC_ALIGN_32      (0x01 << 6)
> > +#define DRM_FORMAT_MOD_VS_DEC_ALIGN_64      (0x01 << 7)
> > +
> > +#define fourcc_mod_vs_dec_code(tile, align) \
> > +	fourcc_mod_vs_code(DRM_FORMAT_MOD_VS_TYPE_COMPRESSED, \
> > +				((tile) | (align)))
> > +
> > +#define DRM_FORMAT_MOD_VS_NORM_MODE_MASK        0x1F
> > +#define DRM_FORMAT_MOD_VS_LINEAR                0x00
> > +#define DRM_FORMAT_MOD_VS_TILED4x4              0x01
> > +#define DRM_FORMAT_MOD_VS_SUPER_TILED_XMAJOR    0x02
> > +#define DRM_FORMAT_MOD_VS_SUPER_TILED_YMAJOR    0x03
> > +#define DRM_FORMAT_MOD_VS_TILE_8X8              0x04
> > +#define DRM_FORMAT_MOD_VS_TILE_MODE1            0x05
> > +#define DRM_FORMAT_MOD_VS_TILE_MODE2            0x06
> > +#define DRM_FORMAT_MOD_VS_TILE_8X4              0x07
> > +#define DRM_FORMAT_MOD_VS_TILE_MODE4            0x08
> > +#define DRM_FORMAT_MOD_VS_TILE_MODE5            0x09
> > +#define DRM_FORMAT_MOD_VS_TILE_MODE6            0x0A
> > +#define DRM_FORMAT_MOD_VS_SUPER_TILED_XMAJOR_8X4    0x0B
> > +#define DRM_FORMAT_MOD_VS_SUPER_TILED_YMAJOR_4X8    0x0C
> > +#define DRM_FORMAT_MOD_VS_TILE_Y                0x0D
> > +#define DRM_FORMAT_MOD_VS_TILE_128X1            0x0F
> > +#define DRM_FORMAT_MOD_VS_TILE_256X1            0x10
> > +#define DRM_FORMAT_MOD_VS_TILE_32X1             0x11
> > +#define DRM_FORMAT_MOD_VS_TILE_64X1             0x12
> > +#define DRM_FORMAT_MOD_VS_TILE_MODE4X4          0x15
> > +
> > +#define fourcc_mod_vs_norm_code(tile) \
> > +	fourcc_mod_vs_code(DRM_FORMAT_MOD_VS_TYPE_NORMAL, \
> > +				(tile))
> > +
> > +#define fourcc_mod_vs_custom_code(tile) \
> > +	fourcc_mod_vs_code(DRM_FORMAT_MOD_VS_TYPE_CUSTOM_10BIT, \
> > +				(tile))
> > +
> >   #if defined(__cplusplus)
> >   }
> >   #endif
> > diff --git a/include/uapi/drm/vs_drm.h b/include/uapi/drm/vs_drm.h
> > new file mode 100644
> > index 000000000000..96b7fc95d658
> > --- /dev/null
> > +++ b/include/uapi/drm/vs_drm.h
>=20
> Another UAPI addition that appears to be unused. Please only add things=
=20
> that you're using.
>=20
> Best regards
> Thomas
>=20
> > @@ -0,0 +1,50 @@
> > +/* SPDX-License-Identifier: GPL-2.0+ WITH Linux-syscall-note */
> > +/*
> > + * Copyright (C) 2020 VeriSilicon Holdings Co., Ltd.
> > + */
> > +
> > +#ifndef __VS_DRM_H__
> > +#define __VS_DRM_H__
> > +
> > +#include "drm.h"
> > +
> > +enum drm_vs_degamma_mode {
> > +	VS_DEGAMMA_DISABLE =3D 0,
> > +	VS_DEGAMMA_BT709 =3D 1,
> > +	VS_DEGAMMA_BT2020 =3D 2,
> > +};
> > +
> > +enum drm_vs_sync_dc_mode {
> > +	VS_SINGLE_DC =3D 0,
> > +	VS_MULTI_DC_PRIMARY =3D 1,
> > +	VS_MULTI_DC_SECONDARY =3D 2,
> > +};
> > +
> > +enum drm_vs_mmu_prefetch_mode {
> > +	VS_MMU_PREFETCH_DISABLE =3D 0,
> > +	VS_MMU_PREFETCH_ENABLE =3D 1,
> > +};
> > +
> > +struct drm_vs_watermark {
> > +	__u32 watermark;
> > +	__u8 qos_low;
> > +	__u8 qos_high;
> > +};
> > +
> > +struct drm_vs_color_mgmt {
> > +	__u32 colorkey;
> > +	__u32 colorkey_high;
> > +	__u32 clear_value;
> > +	bool  clear_enable;
> > +	bool  transparency;
> > +};
> > +
> > +struct drm_vs_roi {
> > +	bool enable;
> > +	__u16 roi_x;
> > +	__u16 roi_y;
> > +	__u16 roi_w;
> > +	__u16 roi_h;
> > +};
> > +
> > +#endif /* __VS_DRM_H__ */
>=20
> --=20
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Frankenstrasse 146, 90461 Nuernberg, Germany
> GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
> HRB 36809 (AG Nuernberg)

