Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A6EC80D41B
	for <lists+dri-devel@lfdr.de>; Mon, 11 Dec 2023 18:38:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3FE589B33;
	Mon, 11 Dec 2023 17:38:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0667189B33
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Dec 2023 17:38:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id B1B37CE126B
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Dec 2023 17:38:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3D80C433CA
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Dec 2023 17:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702316280;
 bh=RM8J1fRi5eccOG6cdSuf5vFHLYEKAAR1q1WmQ5fdUhY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=fELCK3KFxdx7lldkj0syY4n+7+IDCHwjtiPgP5xMXa2bHBSTKY7CadJq201kwooIR
 Z2NW07VXANkVno35IBshrqMGzavOdfd2Tw8Fl9v9jWh7Sdp1Ox1Qo4mtBa8QJUeicy
 o+s+e7ws1pUuChnQmHWFifemr+GWEyKOgFDtK9505wPwIYiGTSjSHfIzgz5tKF4emt
 xjVPIpifsqPgRq7rjoEin8t9Ce90DY2EC/n3aT3ny65UlbuvlmU10uWk0z8uOVYkBm
 xJuHibsxMSZtlvEZ72m+jQeB3zoHCZgRlFsagl6TADc55/zbwIy9sE4QXFZFy2MiAU
 EiObRtnLwmlVg==
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-50bf26b677dso4500253e87.2
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Dec 2023 09:38:00 -0800 (PST)
X-Gm-Message-State: AOJu0YxjTO+tCSovP2zv9hldXMYoZS6kj8DbhabjTBkSci96JV5KdEp4
 OxSIWuNv6SjtDp5yJEh2qe+iMxxL6ml9wxWriA==
X-Google-Smtp-Source: AGHT+IGU6zc/IkMGLCnjAcu3MrW8oETYAeR1jpLpwg1PYbcbe672FORhlQSw1Oenjd6QCwC10tnJtiMkcqHDuwRnSog=
X-Received: by 2002:a05:6512:3441:b0:50b:c977:106a with SMTP id
 j1-20020a056512344100b0050bc977106amr1180039lfr.51.1702316279139; Mon, 11 Dec
 2023 09:37:59 -0800 (PST)
MIME-Version: 1.0
References: <20230920171009.3193296-1-l.stach@pengutronix.de>
 <20230920171009.3193296-2-l.stach@pengutronix.de>
In-Reply-To: <20230920171009.3193296-2-l.stach@pengutronix.de>
From: Rob Herring <robh+dt@kernel.org>
Date: Mon, 11 Dec 2023 11:37:46 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJmyeFNpRt9bkjzXJ+w3WED4eLokmzdfP4fR=9dZGr1QA@mail.gmail.com>
Message-ID: <CAL_JsqJmyeFNpRt9bkjzXJ+w3WED4eLokmzdfP4fR=9dZGr1QA@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] drm/bridge: imx: add driver for HDMI TX Parallel
 Video Interface
To: Lucas Stach <l.stach@pengutronix.de>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>, Liu Ying <victor.liu@nxp.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, dri-devel@lists.freedesktop.org,
 NXP Linux Team <linux-imx@nxp.com>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>, devicetree@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Sandor Yu <sandor.yu@nxp.com>,
 patchwork-lst@pengutronix.de, Adam Ford <aford173@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org,
 Richard Leitner <richard.leitner@skidata.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 20, 2023 at 12:10=E2=80=AFPM Lucas Stach <l.stach@pengutronix.d=
e> wrote:
>
> This IP block is found in the HDMI subsystem of the i.MX8MP SoC. It has a
> full timing generator and can switch between different video sources. On
> the i.MX8MP however the only supported source is the LCDIF. The block
> just needs to be powered up and told about the polarity of the video
> sync signals to act in bypass mode.
>
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com> (v2)
> Tested-by: Marek Vasut <marex@denx.de> (v1)
> Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com> (v2)
> Tested-by: Richard Leitner <richard.leitner@skidata.com> (v2)
> Tested-by: Frieder Schrempf <frieder.schrempf@kontron.de> (v2)
> ---
>  drivers/gpu/drm/bridge/imx/Kconfig           |   7 +
>  drivers/gpu/drm/bridge/imx/Makefile          |   1 +
>  drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c | 206 +++++++++++++++++++
>  3 files changed, 214 insertions(+)
>  create mode 100644 drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c
>
> diff --git a/drivers/gpu/drm/bridge/imx/Kconfig b/drivers/gpu/drm/bridge/=
imx/Kconfig
> index 9fae28db6aa7..3a4e663d922a 100644
> --- a/drivers/gpu/drm/bridge/imx/Kconfig
> +++ b/drivers/gpu/drm/bridge/imx/Kconfig
> @@ -3,6 +3,13 @@ if ARCH_MXC || COMPILE_TEST
>  config DRM_IMX_LDB_HELPER
>         tristate
>
> +config DRM_IMX8MP_HDMI_PVI
> +       tristate "Freescale i.MX8MP HDMI PVI bridge support"
> +       depends on OF
> +       help
> +         Choose this to enable support for the internal HDMI TX Parallel
> +         Video Interface found on the Freescale i.MX8MP SoC.
> +
>  config DRM_IMX8QM_LDB
>         tristate "Freescale i.MX8QM LVDS display bridge"
>         depends on OF
> diff --git a/drivers/gpu/drm/bridge/imx/Makefile b/drivers/gpu/drm/bridge=
/imx/Makefile
> index 8e2ebf3399a1..be9b4f9adb50 100644
> --- a/drivers/gpu/drm/bridge/imx/Makefile
> +++ b/drivers/gpu/drm/bridge/imx/Makefile
> @@ -1,4 +1,5 @@
>  obj-$(CONFIG_DRM_IMX_LDB_HELPER) +=3D imx-ldb-helper.o
> +obj-$(CONFIG_DRM_IMX8MP_HDMI_PVI) +=3D imx8mp-hdmi-pvi.o
>  obj-$(CONFIG_DRM_IMX8QM_LDB) +=3D imx8qm-ldb.o
>  obj-$(CONFIG_DRM_IMX8QXP_LDB) +=3D imx8qxp-ldb.o
>  obj-$(CONFIG_DRM_IMX8QXP_PIXEL_COMBINER) +=3D imx8qxp-pixel-combiner.o
> diff --git a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c b/drivers/gpu/d=
rm/bridge/imx/imx8mp-hdmi-pvi.c
> new file mode 100644
> index 000000000000..5ccd70c98187
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c
> @@ -0,0 +1,206 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +
> +/*
> + * Copyright (C) 2022 Pengutronix, Lucas Stach <kernel@pengutronix.de>
> + */
> +
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_bridge.h>
> +#include <drm/drm_crtc.h>
> +#include <linux/bitfield.h>
> +#include <linux/io.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>

You probably don't need this header and the implicit includes it makes
are dropped now in linux-next. Please check what you actually need and
make them explicit.

Rob
