Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE3C4FA0A5
	for <lists+dri-devel@lfdr.de>; Sat,  9 Apr 2022 02:25:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7641110F286;
	Sat,  9 Apr 2022 00:25:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0F8E10F286
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Apr 2022 00:25:35 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id be5so3299506plb.13
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Apr 2022 17:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gateworks-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Kz7GnN0ueKLYQdjs167y4clP/UZTHlXJVCCTffQi9xc=;
 b=GbSXPP9jlr7EuTbmQKNyojNjyS2xBxseTteVGevqz+qfcK/PPF2FeFpT9R9MzHR1JA
 IE7Ns0+bJOS7d2vCCLRr79HwhAy0UK2jSVWQNlyGEFqoZ2r+wcGOnIY0xgOHbsTgjkxE
 2fozznD573gbVD3MYU8KqmzIIBmwN/oKFazjaI1+xSWflceXJgN2slJ90MNCOKf9CHKd
 qfRnsSp1lZo5i8zinwCbvEp9pbnQRarlzmTJj8dzKzKlKb0FkbzUpKi73yymTfwbjBRS
 W0b331WC97c0vehkPPyTJa1+rkVRdehQxQNtpe5QwNeuXjpXhG1niySyXj3SQw7HYi4A
 JGMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Kz7GnN0ueKLYQdjs167y4clP/UZTHlXJVCCTffQi9xc=;
 b=tewJV1adtu2s5N7MPbwMwTNYvsQKVv8Lz+PwmPRD5KdxyGzFv5aWXpyoTK3KvgeevU
 tklDq0f1grJbFVsRjB+SnwtX9zP215MyCmhF1/FVsO+0Je6Zc2vKMz4+wgH0oPVK7Zky
 LiyGkEmvlIFdlXbvZKcGkHhFdgDSzsAHfXRS8SUE3ulN0msWJd5rtPtZe+/dIRwdzk19
 fpiizaNi1ZA/jxwQO3zGPQqIUOdD95vdfZX92b04DbwEoOnHiWppvOy+bqcUk1lGog0G
 MI56Y2RMGGB8Iq1CxVjJ74Z7HAK3suc/tCWNri4NjboJZ3XEKtVqSifpKkJCut7ijvMW
 /J4g==
X-Gm-Message-State: AOAM531t3T+JY6i/1OZlpkqAVl3oTkKuj1bRS6RSK4lPVQDE9z4Xn8fG
 zKGOrz136C+UW/Lsk4IqX6PhPvikW56q2L3RuauIHQ==
X-Google-Smtp-Source: ABdhPJwpGliq5FMMKScQcNLr+H/KLqk+wpd25JkDEPoXoMlLVIoWSM1kMGeMPkISNh8SWxWkaTatpDWxxppN/3b/0zU=
X-Received: by 2002:a17:902:c401:b0:154:152a:7fb7 with SMTP id
 k1-20020a170902c40100b00154152a7fb7mr22053914plk.63.1649463935333; Fri, 08
 Apr 2022 17:25:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220408162108.184583-1-jagan@amarulasolutions.com>
In-Reply-To: <20220408162108.184583-1-jagan@amarulasolutions.com>
From: Tim Harvey <tharvey@gateworks.com>
Date: Fri, 8 Apr 2022 17:25:23 -0700
Message-ID: <CAJ+vNU2KMhMg2C2BRQCfqgM3jCrpMHznrPQhkq2L2GSRgX9ehg@mail.gmail.com>
Subject: Re: [PATCH 00/11] drm: bridge: Add Samsung MIPI DSIM bridge
To: Jagan Teki <jagan@amarulasolutions.com>
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
Cc: Device Tree Mailing List <devicetree@vger.kernel.org>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, NXP Linux Team <linux-imx@nxp.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Kyungmin Park <kyungmin.park@samsung.com>, Rob Herring <robh+dt@kernel.org>,
 Robert Foss <robert.foss@linaro.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Fancy Fang <chen.fang@nxp.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Adam Ford <aford173@gmail.com>,
 Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 8, 2022 at 9:22 AM Jagan Teki <jagan@amarulasolutions.com> wrote:
>
> This series supports common bridge support for Samsung MIPI DSIM
> which is used in Exynos and i.MX8MM SoC's.
>
> Previous RFC can be available here [1].
>
> The final bridge supports both the Exynos and i.MX8MM DSI devices.
>
> On, summary this patch-set break the entire DSIM driver into
> - platform specific glue code for platform ops, component_ops.
> - common bridge driver which handle platform glue init and invoke.
>
> Patch 0000:     Samsung DSIM bridge
>
> Patch 0001:     platform init flag via driver_data
>
> Patch 0002/9:   bridge fixes, atomic API's
>
> Patch 0010:     document fsl,imx8mm-mipi-dsim
>
> Patch 0011:     add i.MX8MM DSIM support
>
> Tested in Engicam i.Core MX8M Mini SoM.
>
> Anyone interested, please have a look on this repo [2]
>
> [2] https://github.com/openedev/kernel/tree/imx8mm-dsi-v1
> [1] https://lore.kernel.org/linux-arm-kernel/YP2j9k5SrZ2%2Fo2%2F5@ravnborg.org/T/
>
> Any inputs?
> Jagan.
>
> Jagan Teki (11):
>   drm: bridge: Add Samsung DSIM bridge driver
>   drm: bridge: samsung-dsim: Handle platform init via driver_data
>   drm: bridge: samsung-dsim: Mark PHY as optional
>   drm: bridge: samsung-dsim: Add DSI init in bridge pre_enable()
>   drm: bridge: samsung-dsim: Fix PLL_P (PMS_P) offset
>   drm: bridge: samsung-dsim: Add module init, exit
>   drm: bridge: samsung-dsim: Add atomic_check
>   drm: bridge: samsung-dsim: Add atomic_get_input_bus_fmts
>   drm: bridge: samsung-dsim: Add input_bus_flags
>   dt-bindings: display: exynos: dsim: Add NXP i.MX8MM support
>   drm: bridge: samsung-dsim: Add i.MX8MM support
>
>  .../bindings/display/exynos/exynos_dsim.txt   |    1 +
>  MAINTAINERS                                   |   12 +
>  drivers/gpu/drm/bridge/Kconfig                |   12 +
>  drivers/gpu/drm/bridge/Makefile               |    1 +
>  drivers/gpu/drm/bridge/samsung-dsim.c         | 1803 +++++++++++++++++
>  drivers/gpu/drm/exynos/Kconfig                |    1 +
>  drivers/gpu/drm/exynos/exynos_drm_dsi.c       | 1704 +---------------
>  include/drm/bridge/samsung-dsim.h             |   97 +
>  8 files changed, 1982 insertions(+), 1649 deletions(-)
>  create mode 100644 drivers/gpu/drm/bridge/samsung-dsim.c
>  create mode 100644 include/drm/bridge/samsung-dsim.h
>
> --
> 2.25.1
>

Jagan,

Thanks so much for continuing to work this through!

I've successfully tested this series on imx8mm-venice-gw73xx-0x using
the following:
- DFROBOT 7" raspberrypi touchscreen display (DFR0506) [1]
- the following defconfig:
CONFIG_REGULATOR_RASPBERRYPI_TOUCHSCREEN_ATTINY
CONFIG_DRM_PANEL_SIMPLE
CONFIG_DRM_PANEL_BRIDGE
CONFIG_DRM_PANEL_RASPBERRYPI_TOUCHSCREEN
CONFIG_DRM_TOSHIBA_TC358762
CONFIG_DRM_SAMSUNG_DSIM
CONFIG_DRM_MXSFB
- the following dt overlay:
// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
/*
 * Copyright 2022 Gateworks Corporation
 */

#include <dt-bindings/gpio/gpio.h>

#include "imx8mm-pinfunc.h"

/dts-v1/;
/plugin/;

&{/} {
        compatible = "gw,imx8mm-gw73xx-0x", "fsl,imx8mm";

        panel {
                compatible = "powertip,ph800480t013-idf02";
                power-supply = <&attiny>;
                backlight = <&attiny>;

                port {
                        panel_out_bridge: endpoint {
                                remote-endpoint = <&bridge_out_panel>;
                        };
                };
        };
};

&i2c3 {
        #address-cells = <1>;
        #size-cells = <0>;

        attiny: regulator@45 {
                compatible = "raspberrypi,7inch-touchscreen-panel-regulator";
                reg = <0x45>;
        };
};

&lcdif {
        status = "okay";
};

&dsi {
        #address-cells = <1>;
        #size-cells = <0>;
        status = "okay";

        bridge@0 {
                compatible = "toshiba,tc358762";
                reg = <0>;
                vddc-supply = <&attiny>;
                #address-cells = <1>;
                #size-cells = <0>;
                status = "okay";

                ports {
                        #address-cells = <1>;
                        #size-cells = <0>;

                        port@0 {
                                reg = <0>;
                                bridge_in_dsi: endpoint {
                                        remote-endpoint = <&dsi_out_bridge>;
                                        data-lanes = <0 1>;
                                };
                        };

                        port@1 {
                                reg = <1>;
                                bridge_out_panel: endpoint {
                                        remote-endpoint = <&panel_out_bridge>;
                                };
                        };
                };
        };

        ports {
                #address-cells = <1>;
                #size-cells = <0>;

                port@1 {
                        reg = <1>;

                        dsi_out_bridge: endpoint {
                                remote-endpoint = <&bridge_in_dsi>;
                        };
                };
        };
};

Tested-by: Tim Harvey <tharvey@gateworks.com> #imx8mm-venice-gw73xx with DFR0506

I'll be happy to test any follow-on series as needed.

Best Regards,

Tim
[1] https://www.dfrobot.com/product-1655.html
