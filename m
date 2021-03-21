Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3DAD343765
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 04:27:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC84F6E2E6;
	Mon, 22 Mar 2021 03:27:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 629D96E2E6
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Mar 2021 03:27:02 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id 15so19327437ljj.0
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Mar 2021 20:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cwuwhKojjZwzFUDQpI8GQLhYdBXrvCpD6Al2zjmlo6k=;
 b=R5gbc8rvcBtK+/0TwHrIHwza6rkm2/cXmMflUOfdj45rfGKn+KlVEf7URxy0Jmsd09
 hOdPsh2q9W1KDJjUTLIrdvviPk6+g1CQxm176RO2jrJmIqEvjHuXCz2Jnb5AXkyfltz5
 Q9gbqtZruInxolwR/fA2pJeXfkiXhT9aVOf+OibbVmFDEDTXRrZ4iEX2OXNK6noRf/1w
 OetFliuMTNUVdMAm3kOOqN7H/Y7acMKNUvPWiyOSMMGheE2vl/EVto29gN3yBsGlXYuN
 2+qXizGIx+TPkw2jlWwAAKoLH+GHTHGm6P93R01ICbWcyUU8jZPK+S3iFcHyKAghiKuc
 XNxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cwuwhKojjZwzFUDQpI8GQLhYdBXrvCpD6Al2zjmlo6k=;
 b=OIIuWGL0a57L7w/VzqsFQzacgcqwUwfMiY328QEt0QnMEamFwA3zbINR46oNVt1xCl
 MBe9EJNF5XVxpzhMjsVSCLQfdqhjB8gGwfaLtjKL5y6JNfcYrMKZDtVKVUhG3xRf3cWd
 URW5di9wAPnHnnDeGkikZfbTrKexZDM/p4//e8L4abXXiJ8Ad2IaZZC16OdZqkiMyEsw
 4O+lfbRMhz0KyoIrrZ2wgttMBWVolS2wMxD20C+REAMPPSEjHGqsUx2o2hTyd0EkO71V
 0Pk+mAzIFAhjbIZ5l66g0QQDTvwnO9pGHjvHyyB3lWjZ5dxqdvNZU9jWgTe9L3ZB4J7b
 YQTA==
X-Gm-Message-State: AOAM533+shl7CsSbfjDKQ8CXoJ6sbIiZfPzfN+RNFY3JAyXZL7LE49Dw
 ha+askPWY7m3aZpqP24v4BjDU0U4z4fMHfCJeKo=
X-Google-Smtp-Source: ABdhPJyovvKLWOkC3nP4AuAnJTw65XDkOeEMwaTzQrFOC/2r3schFT2iBx37fK9+O9ZX9ipHV9BvJdf8LNuIFXHRf/0=
X-Received: by 2002:a2e:8114:: with SMTP id d20mr8324184ljg.83.1616383620887; 
 Sun, 21 Mar 2021 20:27:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210222132822.7830-1-kevin3.tang@gmail.com>
 <20210222132822.7830-3-kevin3.tang@gmail.com>
In-Reply-To: <20210222132822.7830-3-kevin3.tang@gmail.com>
From: Kevin Tang <kevin3.tang@gmail.com>
Date: Mon, 22 Mar 2021 03:26:34 +0800
Message-ID: <CAFPSGXaRzEqnnsssp3AU75U4nfAC0dfz0qFg=gNYmVWtK=GgQA@mail.gmail.com>
Subject: Re: [PATCH v4 2/6] drm/sprd: add Unisoc's drm kms master
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Sam Ravnborg <sam@ravnborg.org>
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
Cc: Orson Zhai <orsonzhai@gmail.com>, devicetree@vger.kernel.org,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Chunyan Zhang <zhang.lyra@gmail.com>
Content-Type: multipart/mixed; boundary="===============2031116070=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============2031116070==
Content-Type: multipart/alternative; boundary="0000000000008b375205be17a36a"

--0000000000008b375205be17a36a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sam Ravnborg,
Do you have more comments about my patch?

Looking forward to your reply, thank you.

Kevin Tang <kevin3.tang@gmail.com> =E4=BA=8E2021=E5=B9=B42=E6=9C=8822=E6=97=
=A5=E5=91=A8=E4=B8=80 =E4=B8=8B=E5=8D=889:28=E5=86=99=E9=81=93=EF=BC=9A

> Adds drm support for the Unisoc's display subsystem.
>
> This is drm kms driver, this driver provides support for the
> application framework in Android, Yocto and more.
>
> Application framework can access Unisoc's display internel
> peripherals through libdrm or libkms, it's test ok by modetest
> (DRM/KMS test tool) and Android HWComposer.
>
> Cc: Orson Zhai <orsonzhai@gmail.com>
> Cc: Chunyan Zhang <zhang.lyra@gmail.com>
> Signed-off-by: Kevin Tang <kevin.tang@unisoc.com>
>
> v4:
>   - Move the devm_drm_dev_alloc to master_ops->bind function.
>   - The managed drmm_mode_config_init() it is no longer necessary for
> drivers to explicitly call drm_mode_config_cleanup, so delete it.
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
>
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index 8bf103de1..9d6ce2867 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -382,6 +382,8 @@ source "drivers/gpu/drm/tidss/Kconfig"
>
>  source "drivers/gpu/drm/xlnx/Kconfig"
>
> +source "drivers/gpu/drm/sprd/Kconfig"
> +
>  # Keep legacy drivers last
>
>  menuconfig DRM_LEGACY
> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> index 02c229392..42d211d9c 100644
> --- a/drivers/gpu/drm/Makefile
> +++ b/drivers/gpu/drm/Makefile
> @@ -126,3 +126,4 @@ obj-$(CONFIG_DRM_ASPEED_GFX) +=3D aspeed/
>  obj-$(CONFIG_DRM_MCDE) +=3D mcde/
>  obj-$(CONFIG_DRM_TIDSS) +=3D tidss/
>  obj-y                  +=3D xlnx/
> +obj-$(CONFIG_DRM_SPRD) +=3D sprd/
> diff --git a/drivers/gpu/drm/sprd/Kconfig b/drivers/gpu/drm/sprd/Kconfig
> new file mode 100644
> index 000000000..6e80cc9f3
> --- /dev/null
> +++ b/drivers/gpu/drm/sprd/Kconfig
> @@ -0,0 +1,12 @@
> +config DRM_SPRD
> +       tristate "DRM Support for Unisoc SoCs Platform"
> +       depends on ARCH_SPRD || COMPILE_TEST
> +       depends on DRM && OF
> +       select DRM_KMS_HELPER
> +       select DRM_GEM_CMA_HELPER
> +       select DRM_KMS_CMA_HELPER
> +       select DRM_MIPI_DSI
> +       help
> +         Choose this option if you have a Unisoc chipset.
> +         If M is selected the module will be called sprd_drm.
> +
> diff --git a/drivers/gpu/drm/sprd/Makefile b/drivers/gpu/drm/sprd/Makefil=
e
> new file mode 100644
> index 000000000..86d95d93a
> --- /dev/null
> +++ b/drivers/gpu/drm/sprd/Makefile
> @@ -0,0 +1,5 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +subdir-ccflags-y +=3D -I$(srctree)/$(src)
> +
> +obj-y :=3D sprd_drm.o
> diff --git a/drivers/gpu/drm/sprd/sprd_drm.c
> b/drivers/gpu/drm/sprd/sprd_drm.c
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
> +#define DRIVER_NAME    "sprd"
> +#define DRIVER_DESC    "Spreadtrum SoCs' DRM Driver"
> +#define DRIVER_DATE    "20200201"
> +#define DRIVER_MAJOR   1
> +#define DRIVER_MINOR   0
> +
> +static const struct drm_mode_config_helper_funcs
> sprd_drm_mode_config_helper =3D {
> +       .atomic_commit_tail =3D drm_atomic_helper_commit_tail_rpm,
> +};
> +
> +static const struct drm_mode_config_funcs sprd_drm_mode_config_funcs =3D=
 {
> +       .fb_create =3D drm_gem_fb_create,
> +       .atomic_check =3D drm_atomic_helper_check,
> +       .atomic_commit =3D drm_atomic_helper_commit,
> +};
> +
> +static void sprd_drm_mode_config_init(struct drm_device *drm)
> +{
> +       drm->mode_config.min_width =3D 0;
> +       drm->mode_config.min_height =3D 0;
> +       drm->mode_config.max_width =3D 8192;
> +       drm->mode_config.max_height =3D 8192;
> +       drm->mode_config.allow_fb_modifiers =3D true;
> +
> +       drm->mode_config.funcs =3D &sprd_drm_mode_config_funcs;
> +       drm->mode_config.helper_private =3D &sprd_drm_mode_config_helper;
> +}
> +
> +DEFINE_DRM_GEM_CMA_FOPS(sprd_drm_fops);
> +
> +static struct drm_driver sprd_drm_drv =3D {
> +       .driver_features        =3D DRIVER_GEM | DRIVER_MODESET |
> DRIVER_ATOMIC,
> +       .fops                   =3D &sprd_drm_fops,
> +
> +       /* GEM Operations */
> +       DRM_GEM_CMA_DRIVER_OPS,
> +
> +       .name                   =3D DRIVER_NAME,
> +       .desc                   =3D DRIVER_DESC,
> +       .date                   =3D DRIVER_DATE,
> +       .major                  =3D DRIVER_MAJOR,
> +       .minor                  =3D DRIVER_MINOR,
> +};
> +
> +static int sprd_drm_bind(struct device *dev)
> +{
> +       struct platform_device *pdev =3D to_platform_device(dev);
> +       struct drm_device *drm;
> +       struct sprd_drm *sprd;
> +       int ret;
> +
> +       sprd =3D devm_drm_dev_alloc(dev, &sprd_drm_drv, struct sprd_drm,
> drm);
> +       if (IS_ERR(sprd))
> +               return PTR_ERR(sprd);
> +
> +       drm =3D &sprd->drm;
> +       platform_set_drvdata(pdev, drm);
> +
> +       ret =3D drmm_mode_config_init(drm);
> +       if (ret)
> +               return ret;
> +
> +       sprd_drm_mode_config_init(drm);
> +
> +       /* bind and init sub drivers */
> +       ret =3D component_bind_all(drm->dev, drm);
> +       if (ret) {
> +               drm_err(drm, "failed to bind all component.\n");
> +               return ret;
> +       }
> +
> +       /* vblank init */
> +       ret =3D drm_vblank_init(drm, drm->mode_config.num_crtc);
> +       if (ret) {
> +               drm_err(drm, "failed to initialize vblank.\n");
> +               goto err_unbind_all;
> +       }
> +       /* with irq_enabled =3D true, we can use the vblank feature. */
> +       drm->irq_enabled =3D true;
> +
> +       /* reset all the states of crtc/plane/encoder/connector */
> +       drm_mode_config_reset(drm);
> +
> +       /* init kms poll for handling hpd */
> +       drm_kms_helper_poll_init(drm);
> +
> +       ret =3D drm_dev_register(drm, 0);
> +       if (ret < 0)
> +               goto err_kms_helper_poll_fini;
> +
> +       return 0;
> +
> +err_kms_helper_poll_fini:
> +       drm_kms_helper_poll_fini(drm);
> +err_unbind_all:
> +       component_unbind_all(drm->dev, drm);
> +       return ret;
> +}
> +
> +static void sprd_drm_unbind(struct device *dev)
> +{
> +       struct drm_device *drm =3D dev_get_drvdata(dev);
> +
> +       drm_dev_unregister(drm);
> +
> +       drm_kms_helper_poll_fini(drm);
> +
> +       component_unbind_all(drm->dev, drm);
> +}
> +
> +static const struct component_master_ops drm_component_ops =3D {
> +       .bind =3D sprd_drm_bind,
> +       .unbind =3D sprd_drm_unbind,
> +};
> +
> +static int compare_of(struct device *dev, void *data)
> +{
> +       return dev->of_node =3D=3D data;
> +}
> +
> +static int sprd_drm_probe(struct platform_device *pdev)
> +{
> +       struct device *dev =3D &pdev->dev;
> +       int ret;
> +
> +       ret =3D dma_set_mask_and_coherent(dev, ~0UL);
> +       if (ret) {
> +               dev_err(dev, "dma_set_mask_and_coherent failed (%d)\n",
> ret);
> +               return ret;
> +       }
> +
> +       return drm_of_component_probe(dev, compare_of, &drm_component_ops=
);
> +}
> +
> +static int sprd_drm_remove(struct platform_device *pdev)
> +{
> +       component_master_del(&pdev->dev, &drm_component_ops);
> +       return 0;
> +}
> +
> +static void sprd_drm_shutdown(struct platform_device *pdev)
> +{
> +       struct drm_device *drm =3D platform_get_drvdata(pdev);
> +
> +       if (!drm) {
> +               drm_warn(drm, "drm device is not available, no
> shutdown\n");
> +               return;
> +       }
> +
> +       drm_atomic_helper_shutdown(drm);
> +}
> +
> +static const struct of_device_id drm_match_table[] =3D {
> +       { .compatible =3D "sprd,display-subsystem", },
> +       { /* sentinel */ },
> +};
> +MODULE_DEVICE_TABLE(of, drm_match_table);
> +
> +static struct platform_driver sprd_drm_driver =3D {
> +       .probe =3D sprd_drm_probe,
> +       .remove =3D sprd_drm_remove,
> +       .shutdown =3D sprd_drm_shutdown,
> +       .driver =3D {
> +               .name =3D "sprd-drm-drv",
> +               .of_match_table =3D drm_match_table,
> +       },
> +};
> +
> +static struct platform_driver *sprd_drm_drivers[]  =3D {
> +       &sprd_drm_driver,
> +};
> +
> +static int __init sprd_drm_init(void)
> +{
> +       int ret;
> +
> +       ret =3D platform_register_drivers(sprd_drm_drivers,
> +                                       ARRAY_SIZE(sprd_drm_drivers));
> +       return ret;
> +}
> +
> +static void __exit sprd_drm_exit(void)
> +{
> +       platform_unregister_drivers(sprd_drm_drivers,
> +                                   ARRAY_SIZE(sprd_drm_drivers));
> +}
> +
> +module_init(sprd_drm_init);
> +module_exit(sprd_drm_exit);
> +
> +MODULE_AUTHOR("Leon He <leon.he@unisoc.com>");
> +MODULE_AUTHOR("Kevin Tang <kevin.tang@unisoc.com>");
> +MODULE_DESCRIPTION("Unisoc DRM KMS Master Driver");
> +MODULE_LICENSE("GPL v2");
> diff --git a/drivers/gpu/drm/sprd/sprd_drm.h
> b/drivers/gpu/drm/sprd/sprd_drm.h
> new file mode 100644
> index 000000000..9781fd591
> --- /dev/null
> +++ b/drivers/gpu/drm/sprd/sprd_drm.h
> @@ -0,0 +1,16 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2020 Unisoc Inc.
> + */
> +
> +#ifndef _SPRD_DRM_H_
> +#define _SPRD_DRM_H_
> +
> +#include <drm/drm_atomic.h>
> +#include <drm/drm_print.h>
> +
> +struct sprd_drm {
> +       struct drm_device drm;
> +};
> +
> +#endif /* _SPRD_DRM_H_ */
> --
> 2.29.0
>
>

--0000000000008b375205be17a36a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Sam Ravnborg,</div><div>Do you have more comments =
about my patch?</div><div><br></div><div>Looking forward to your reply, tha=
nk you.</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">Kevin Tang &lt;<a href=3D"mailto:kevin3.tang@gmail.com" target=3D"_b=
lank">kevin3.tang@gmail.com</a>&gt; =E4=BA=8E2021=E5=B9=B42=E6=9C=8822=E6=
=97=A5=E5=91=A8=E4=B8=80 =E4=B8=8B=E5=8D=889:28=E5=86=99=E9=81=93=EF=BC=9A<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">Adds drm support=
 for the Unisoc&#39;s display subsystem.<br>
<br>
This is drm kms driver, this driver provides support for the<br>
application framework in Android, Yocto and more.<br>
<br>
Application framework can access Unisoc&#39;s display internel<br>
peripherals through libdrm or libkms, it&#39;s test ok by modetest<br>
(DRM/KMS test tool) and Android HWComposer.<br>
<br>
Cc: Orson Zhai &lt;<a href=3D"mailto:orsonzhai@gmail.com" target=3D"_blank"=
>orsonzhai@gmail.com</a>&gt;<br>
Cc: Chunyan Zhang &lt;<a href=3D"mailto:zhang.lyra@gmail.com" target=3D"_bl=
ank">zhang.lyra@gmail.com</a>&gt;<br>
Signed-off-by: Kevin Tang &lt;<a href=3D"mailto:kevin.tang@unisoc.com" targ=
et=3D"_blank">kevin.tang@unisoc.com</a>&gt;<br>
<br>
v4:<br>
=C2=A0 - Move the devm_drm_dev_alloc to master_ops-&gt;bind function.<br>
=C2=A0 - The managed drmm_mode_config_init() it is no longer necessary for =
drivers to explicitly call drm_mode_config_cleanup, so delete it.<br>
---<br>
=C2=A0drivers/gpu/drm/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=
=A02 +<br>
=C2=A0drivers/gpu/drm/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +=
<br>
=C2=A0drivers/gpu/drm/sprd/Kconfig=C2=A0 =C2=A0 |=C2=A0 12 ++<br>
=C2=A0drivers/gpu/drm/sprd/Makefile=C2=A0 =C2=A0|=C2=A0 =C2=A05 +<br>
=C2=A0drivers/gpu/drm/sprd/sprd_drm.c | 217 +++++++++++++++++++++++++++++++=
+<br>
=C2=A0drivers/gpu/drm/sprd/sprd_drm.h |=C2=A0 16 +++<br>
=C2=A06 files changed, 253 insertions(+)<br>
=C2=A0create mode 100644 drivers/gpu/drm/sprd/Kconfig<br>
=C2=A0create mode 100644 drivers/gpu/drm/sprd/Makefile<br>
=C2=A0create mode 100644 drivers/gpu/drm/sprd/sprd_drm.c<br>
=C2=A0create mode 100644 drivers/gpu/drm/sprd/sprd_drm.h<br>
<br>
diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig<br>
index 8bf103de1..9d6ce2867 100644<br>
--- a/drivers/gpu/drm/Kconfig<br>
+++ b/drivers/gpu/drm/Kconfig<br>
@@ -382,6 +382,8 @@ source &quot;drivers/gpu/drm/tidss/Kconfig&quot;<br>
<br>
=C2=A0source &quot;drivers/gpu/drm/xlnx/Kconfig&quot;<br>
<br>
+source &quot;drivers/gpu/drm/sprd/Kconfig&quot;<br>
+<br>
=C2=A0# Keep legacy drivers last<br>
<br>
=C2=A0menuconfig DRM_LEGACY<br>
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile<br>
index 02c229392..42d211d9c 100644<br>
--- a/drivers/gpu/drm/Makefile<br>
+++ b/drivers/gpu/drm/Makefile<br>
@@ -126,3 +126,4 @@ obj-$(CONFIG_DRM_ASPEED_GFX) +=3D aspeed/<br>
=C2=A0obj-$(CONFIG_DRM_MCDE) +=3D mcde/<br>
=C2=A0obj-$(CONFIG_DRM_TIDSS) +=3D tidss/<br>
=C2=A0obj-y=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 +=
=3D xlnx/<br>
+obj-$(CONFIG_DRM_SPRD) +=3D sprd/<br>
diff --git a/drivers/gpu/drm/sprd/Kconfig b/drivers/gpu/drm/sprd/Kconfig<br=
>
new file mode 100644<br>
index 000000000..6e80cc9f3<br>
--- /dev/null<br>
+++ b/drivers/gpu/drm/sprd/Kconfig<br>
@@ -0,0 +1,12 @@<br>
+config DRM_SPRD<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0tristate &quot;DRM Support for Unisoc SoCs Plat=
form&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on ARCH_SPRD || COMPILE_TEST<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on DRM &amp;&amp; OF<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select DRM_KMS_HELPER<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select DRM_GEM_CMA_HELPER<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select DRM_KMS_CMA_HELPER<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select DRM_MIPI_DSI<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Choose this option if you have a Unisoc =
chipset.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0If M is selected the module will be call=
ed sprd_drm.<br>
+<br>
diff --git a/drivers/gpu/drm/sprd/Makefile b/drivers/gpu/drm/sprd/Makefile<=
br>
new file mode 100644<br>
index 000000000..86d95d93a<br>
--- /dev/null<br>
+++ b/drivers/gpu/drm/sprd/Makefile<br>
@@ -0,0 +1,5 @@<br>
+# SPDX-License-Identifier: GPL-2.0<br>
+<br>
+subdir-ccflags-y +=3D -I$(srctree)/$(src)<br>
+<br>
+obj-y :=3D sprd_drm.o<br>
diff --git a/drivers/gpu/drm/sprd/sprd_drm.c b/drivers/gpu/drm/sprd/sprd_dr=
m.c<br>
new file mode 100644<br>
index 000000000..a1d3ed655<br>
--- /dev/null<br>
+++ b/drivers/gpu/drm/sprd/sprd_drm.c<br>
@@ -0,0 +1,217 @@<br>
+// SPDX-License-Identifier: GPL-2.0<br>
+/*<br>
+ * Copyright (C) 2020 Unisoc Inc.<br>
+ */<br>
+<br>
+#include &lt;linux/component.h&gt;<br>
+#include &lt;linux/dma-mapping.h&gt;<br>
+#include &lt;linux/module.h&gt;<br>
+#include &lt;linux/mutex.h&gt;<br>
+#include &lt;linux/of_graph.h&gt;<br>
+#include &lt;linux/of_platform.h&gt;<br>
+<br>
+#include &lt;drm/drm_atomic_helper.h&gt;<br>
+#include &lt;drm/drm_crtc_helper.h&gt;<br>
+#include &lt;drm/drm_drv.h&gt;<br>
+#include &lt;drm/drm_gem_cma_helper.h&gt;<br>
+#include &lt;drm/drm_gem_framebuffer_helper.h&gt;<br>
+#include &lt;drm/drm_of.h&gt;<br>
+#include &lt;drm/drm_probe_helper.h&gt;<br>
+#include &lt;drm/drm_vblank.h&gt;<br>
+<br>
+#include &quot;sprd_drm.h&quot;<br>
+<br>
+#define DRIVER_NAME=C2=A0 =C2=A0 &quot;sprd&quot;<br>
+#define DRIVER_DESC=C2=A0 =C2=A0 &quot;Spreadtrum SoCs&#39; DRM Driver&quo=
t;<br>
+#define DRIVER_DATE=C2=A0 =C2=A0 &quot;20200201&quot;<br>
+#define DRIVER_MAJOR=C2=A0 =C2=A01<br>
+#define DRIVER_MINOR=C2=A0 =C2=A00<br>
+<br>
+static const struct drm_mode_config_helper_funcs sprd_drm_mode_config_help=
er =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.atomic_commit_tail =3D drm_atomic_helper_commi=
t_tail_rpm,<br>
+};<br>
+<br>
+static const struct drm_mode_config_funcs sprd_drm_mode_config_funcs =3D {=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.fb_create =3D drm_gem_fb_create,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.atomic_check =3D drm_atomic_helper_check,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.atomic_commit =3D drm_atomic_helper_commit,<br=
>
+};<br>
+<br>
+static void sprd_drm_mode_config_init(struct drm_device *drm)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0drm-&gt;mode_config.min_width =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0drm-&gt;mode_config.min_height =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0drm-&gt;mode_config.max_width =3D 8192;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0drm-&gt;mode_config.max_height =3D 8192;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0drm-&gt;mode_config.allow_fb_modifiers =3D true=
;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0drm-&gt;mode_config.funcs =3D &amp;sprd_drm_mod=
e_config_funcs;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0drm-&gt;mode_config.helper_private =3D &amp;spr=
d_drm_mode_config_helper;<br>
+}<br>
+<br>
+DEFINE_DRM_GEM_CMA_FOPS(sprd_drm_fops);<br>
+<br>
+static struct drm_driver sprd_drm_drv =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.driver_features=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D=
 DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.fops=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &amp;sprd_drm_fops,<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* GEM Operations */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_GEM_CMA_DRIVER_OPS,<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D DRIVER_NAME,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.desc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D DRIVER_DESC,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.date=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D DRIVER_DATE,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.major=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =3D DRIVER_MAJOR,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.minor=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =3D DRIVER_MINOR,<br>
+};<br>
+<br>
+static int sprd_drm_bind(struct device *dev)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct platform_device *pdev =3D to_platform_de=
vice(dev);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_device *drm;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct sprd_drm *sprd;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sprd =3D devm_drm_dev_alloc(dev, &amp;sprd_drm_=
drv, struct sprd_drm, drm);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(sprd))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return PTR_ERR(sprd=
);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0drm =3D &amp;sprd-&gt;drm;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0platform_set_drvdata(pdev, drm);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D drmm_mode_config_init(drm);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sprd_drm_mode_config_init(drm);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* bind and init sub drivers */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D component_bind_all(drm-&gt;dev, drm);<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_err(drm, &quot;=
failed to bind all component.\n&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* vblank init */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D drm_vblank_init(drm, drm-&gt;mode_confi=
g.num_crtc);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_err(drm, &quot;=
failed to initialize vblank.\n&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto err_unbind_all=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* with irq_enabled =3D true, we can use the vb=
lank feature. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0drm-&gt;irq_enabled =3D true;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* reset all the states of crtc/plane/encoder/c=
onnector */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0drm_mode_config_reset(drm);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* init kms poll for handling hpd */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0drm_kms_helper_poll_init(drm);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D drm_dev_register(drm, 0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto err_kms_helper=
_poll_fini;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+<br>
+err_kms_helper_poll_fini:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0drm_kms_helper_poll_fini(drm);<br>
+err_unbind_all:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0component_unbind_all(drm-&gt;dev, drm);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
+}<br>
+<br>
+static void sprd_drm_unbind(struct device *dev)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_device *drm =3D dev_get_drvdata(dev)=
;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0drm_dev_unregister(drm);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0drm_kms_helper_poll_fini(drm);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0component_unbind_all(drm-&gt;dev, drm);<br>
+}<br>
+<br>
+static const struct component_master_ops drm_component_ops =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.bind =3D sprd_drm_bind,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.unbind =3D sprd_drm_unbind,<br>
+};<br>
+<br>
+static int compare_of(struct device *dev, void *data)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return dev-&gt;of_node =3D=3D data;<br>
+}<br>
+<br>
+static int sprd_drm_probe(struct platform_device *pdev)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct device *dev =3D &amp;pdev-&gt;dev;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D dma_set_mask_and_coherent(dev, ~0UL);<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(dev, &quot;=
dma_set_mask_and_coherent failed (%d)\n&quot;, ret);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return drm_of_component_probe(dev, compare_of, =
&amp;drm_component_ops);<br>
+}<br>
+<br>
+static int sprd_drm_remove(struct platform_device *pdev)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0component_master_del(&amp;pdev-&gt;dev, &amp;dr=
m_component_ops);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+}<br>
+<br>
+static void sprd_drm_shutdown(struct platform_device *pdev)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_device *drm =3D platform_get_drvdata=
(pdev);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!drm) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_warn(drm, &quot=
;drm device is not available, no shutdown\n&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0drm_atomic_helper_shutdown(drm);<br>
+}<br>
+<br>
+static const struct of_device_id drm_match_table[] =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ .compatible =3D &quot;sprd,display-subsystem&=
quot;, },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ /* sentinel */ },<br>
+};<br>
+MODULE_DEVICE_TABLE(of, drm_match_table);<br>
+<br>
+static struct platform_driver sprd_drm_driver =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.probe =3D sprd_drm_probe,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.remove =3D sprd_drm_remove,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.shutdown =3D sprd_drm_shutdown,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.driver =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.name =3D &quot;spr=
d-drm-drv&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.of_match_table =3D=
 drm_match_table,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
+};<br>
+<br>
+static struct platform_driver *sprd_drm_drivers[]=C2=A0 =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;sprd_drm_driver,<br>
+};<br>
+<br>
+static int __init sprd_drm_init(void)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D platform_register_drivers(sprd_drm_driv=
ers,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ARRAY_SIZ=
E(sprd_drm_drivers));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
+}<br>
+<br>
+static void __exit sprd_drm_exit(void)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0platform_unregister_drivers(sprd_drm_drivers,<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ARRAY_SIZE(sprd_drm_dri=
vers));<br>
+}<br>
+<br>
+module_init(sprd_drm_init);<br>
+module_exit(sprd_drm_exit);<br>
+<br>
+MODULE_AUTHOR(&quot;Leon He &lt;<a href=3D"mailto:leon.he@unisoc.com" targ=
et=3D"_blank">leon.he@unisoc.com</a>&gt;&quot;);<br>
+MODULE_AUTHOR(&quot;Kevin Tang &lt;<a href=3D"mailto:kevin.tang@unisoc.com=
" target=3D"_blank">kevin.tang@unisoc.com</a>&gt;&quot;);<br>
+MODULE_DESCRIPTION(&quot;Unisoc DRM KMS Master Driver&quot;);<br>
+MODULE_LICENSE(&quot;GPL v2&quot;);<br>
diff --git a/drivers/gpu/drm/sprd/sprd_drm.h b/drivers/gpu/drm/sprd/sprd_dr=
m.h<br>
new file mode 100644<br>
index 000000000..9781fd591<br>
--- /dev/null<br>
+++ b/drivers/gpu/drm/sprd/sprd_drm.h<br>
@@ -0,0 +1,16 @@<br>
+/* SPDX-License-Identifier: GPL-2.0 */<br>
+/*<br>
+ * Copyright (C) 2020 Unisoc Inc.<br>
+ */<br>
+<br>
+#ifndef _SPRD_DRM_H_<br>
+#define _SPRD_DRM_H_<br>
+<br>
+#include &lt;drm/drm_atomic.h&gt;<br>
+#include &lt;drm/drm_print.h&gt;<br>
+<br>
+struct sprd_drm {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_device drm;<br>
+};<br>
+<br>
+#endif /* _SPRD_DRM_H_ */<br>
-- <br>
2.29.0<br>
<br>
</blockquote></div></div>

--0000000000008b375205be17a36a--

--===============2031116070==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2031116070==--
