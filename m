Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 048615F6A8F
	for <lists+dri-devel@lfdr.de>; Thu,  6 Oct 2022 17:26:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0059010E3F6;
	Thu,  6 Oct 2022 15:26:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com
 [IPv6:2001:4860:4864:20::29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 268CB10E3F6
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Oct 2022 15:26:35 +0000 (UTC)
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-13207a86076so2581370fac.3
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Oct 2022 08:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gateworks-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=qEgg6vU+1CShCyrvh11UlBgdaJjiNvI37fqYdKhnNwU=;
 b=pHuTH+IOzjjSQkyEAXbIYdJibMg2T/yHhNW5bdD+Zy7vO2BhlKqvuse1vTzTvXMGRC
 SF5ZvW6rOBwK7IR88numKnbolMnzdd81s/JUyI4BJQEXdboIt+9+PdsAUPplNr+9lEkI
 1F3PYFoEx0vuMK157xQFZJn/k1s+BBAONABw1ruoJsjnJf3LFcpaf79quXg8V/NGuSUS
 O+WQFwQScgrnwoIY4k9UXJNlM7ouOrxkEYjneqMblb4Seiye/7pOuTytLwX3OowTN7S2
 e8inlXPIfglqz/SYAcCHWkzf9gvUrUaZAWUP+qLEPoi3jJCXxM8lpdk7mc3dAGPuH50F
 fdYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qEgg6vU+1CShCyrvh11UlBgdaJjiNvI37fqYdKhnNwU=;
 b=iKvFdUtVsldWgBLeddBoR/+4C4SZcX1oyQi+lrNbtmdMYSX72Z2HZXN3bOqutWPzUq
 Z8p6T1iWHK29y8sdmTeArVs1NMXvAVa0hH17pHxAGNYaWFSfvEpVSyXR5TFCYFlyfd5u
 7qR7NTtAJnxFMjPIF4EzvDqqFzNmUgTFVjiIp4rEVX9UeiORuMoZNBAo6F2VMNQTVX4d
 pwNf3hYpB7qwMmYjw647sxTuHhd0go8NkNL//EPuFbgCiFeiHJUKpOZ76d+nj2myYAW6
 RmiMqAF4pbmMb6G9/ALXtgcq9YqXUAzuf2rLS1u5E1514QcuCkcRUKsgcQLoW0e5/dLM
 kMpg==
X-Gm-Message-State: ACrzQf3nkW0//8RSYUuclXIbZJdoVztE199mpJi4utpa7KsIwaIrGmzS
 I+b6qkS0Dw0r+QSx8SGf4VIPC8uu8RiH+n8DuPgxvg==
X-Google-Smtp-Source: AMsMyM7hTLBuIuqwNiVTXUWuH+V72A93pKxUMgju4zsOE/gKIpYqIL99d8dKTgGUpkiIKz3d+hdm7y6E6BtW4OfsIcY=
X-Received: by 2002:a05:6870:15c8:b0:133:16e6:5af8 with SMTP id
 k8-20020a05687015c800b0013316e65af8mr1653718oad.80.1665069994311; Thu, 06 Oct
 2022 08:26:34 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20221005151323eucas1p2c69fc9989b84a9d74d568469ccd81f35@eucas1p2.samsung.com>
 <20221005151309.7278-1-jagan@amarulasolutions.com>
 <df3abb7c-66ae-4495-4a73-c59880a6fdff@samsung.com>
In-Reply-To: <df3abb7c-66ae-4495-4a73-c59880a6fdff@samsung.com>
From: Tim Harvey <tharvey@gateworks.com>
Date: Thu, 6 Oct 2022 08:26:22 -0700
Message-ID: <CAJ+vNU0R95ZDkfwo6hz_fb1E8z7ZZRNd7XU2uArsE0WhxvaJDQ@mail.gmail.com>
Subject: Re: [PATCH v7 00/10] drm: bridge: Add Samsung MIPI DSIM bridge
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
Cc: Marek Vasut <marex@denx.de>, linux-samsung-soc@vger.kernel.org,
 Joonyoung Shim <jy0922.shim@samsung.com>, dri-devel@lists.freedesktop.org,
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 Matteo Lisi <matteo.lisi@engicam.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Neil Armstrong <narmstrong@linaro.org>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Robert Foss <robert.foss@linaro.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 NXP Linux Team <linux-imx@nxp.com>, Fancy Fang <chen.fang@nxp.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Adam Ford <aford173@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Oct 5, 2022 at 1:51 PM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
>
> Hi Jagan,
>
> On 05.10.2022 17:12, Jagan Teki wrote:
> > This series supports common bridge support for Samsung MIPI DSIM
> > which is used in Exynos and i.MX8MM SoC's.
> >
> > The final bridge supports both the Exynos and i.MX8MM DSI devices.
> >
> > Changes for v7:
> > * fix the drm bridge attach chain for exynos drm dsi driver
> > * fix the hw_type checking logic
> >
> > Changes for v6:
> > * handle previous bridge for exynos dsi while attaching bridge
> >
> > Changes for v5:
> > * bridge changes to support multi-arch
> > * updated and clear commit messages
> > * add hw_type via plat data
> > * removed unneeded quirk
> > * rebased on linux-next
> >
> > Changes for v4:
> > * include Inki Dae in MAINTAINERS
> > * remove dsi_driver probe in exynos_drm_drv to support multi-arch build
> > * update init handling to ensure host init done on first cmd transfer
> >
> > Changes for v3:
> > * fix the mult-arch build
> > * fix dsi host init
> > * updated commit messages
> >
> > Changes for v2:
> > * fix bridge handling
> > * fix dsi host init
> > * correct the commit messages
> >
> > Patch 0001:   Samsung DSIM bridge
> >
> > Patch 0002:   PHY optional
> >
> > Patch 0003:   OF-graph or Child node lookup
> >
> > Patch 0004:   DSI host initialization
> >
> > Patch 0005:   atomic check
> >
> > Patch 0006:   PMS_P offset via plat data
> >
> > Patch 0007:   atomic_get_input_bus_fmts
> >
> > Patch 0008:   input_bus_flags
> >
> > Patch 0009:   document fsl,imx8mm-mipi-dsim
> >
> > Patch 0010:   add i.MX8MM DSIM support
> >
> > Tested in Engicam i.Core MX8M Mini SoM.
>
> This finally doesn't break Exynos DSI. :) Feel free to add:
>
> Acked-by: Marek Szyprowski
>
> Tested-by: Marek Szyprowski
>
> The next step would be to merge Dave's patchset and remove the hacks
> added here and there. Otherwise we will end up adding even more hacks soon.

Jagan,

I've also tested this latest series with a Gateworks
imx8mm-venice-gw73xx-0x with a RaspberryPi MIPI DSI compatible DFR0550
display with the following dt overlay:

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

&dsi {
        #address-cells = <1>;
        #size-cells = <0>;
        status = "okay";

        bridge@0 {
                compatible = "toshiba,tc358762";
                reg = <0>;
                vddc-supply = <&attiny>;
                status = "okay";

                ports {
                        #address-cells = <1>;
                        #size-cells = <0>;

                        port@0 {
                                reg = <0>;
                                bridge_in_dsi: endpoint {
                                        remote-endpoint = <&dsi_out_bridge>;

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

&lcdif {
        status = "okay";
};


Tested-by: Tim Harvey <tharvey@gateworks.com> # imx8mm-venice-gw73xx-0x

Thanks for all your work on this!

Best Regards,

Tim



>
> > Repo:
> > https://gitlab.com/openedev/kernel/-/commits/imx8mm-dsi-v7
> >
> > Any inputs?
> > Jagan.
> >
> > Jagan Teki (10):
> >    drm: bridge: Add Samsung DSIM bridge driver
> >    drm: bridge: samsung-dsim: Lookup OF-graph or Child node devices
> >    drm: bridge: samsung-dsim: Mark PHY as optional
> >    drm: bridge: samsung-dsim: Handle proper DSI host initialization
> >    drm: bridge: samsung-dsim: Add atomic_check
> >    drm: bridge: samsung-dsim: Add platform PLL_P (PMS_P) offset
> >    drm: bridge: samsung-dsim: Add atomic_get_input_bus_fmts
> >    drm: bridge: samsung-dsim: Add input_bus_flags
> >    dt-bindings: display: exynos: dsim: Add NXP i.MX8MM support
> >    drm: bridge: samsung-dsim: Add i.MX8MM support
> >
> >   .../bindings/display/exynos/exynos_dsim.txt   |    1 +
> >   MAINTAINERS                                   |    9 +
> >   drivers/gpu/drm/bridge/Kconfig                |   12 +
> >   drivers/gpu/drm/bridge/Makefile               |    1 +
> >   drivers/gpu/drm/bridge/samsung-dsim.c         | 1856 +++++++++++++++++
> >   drivers/gpu/drm/exynos/Kconfig                |    1 +
> >   drivers/gpu/drm/exynos/exynos_drm_dsi.c       | 1766 +---------------
> >   include/drm/bridge/samsung-dsim.h             |  115 +
> >   8 files changed, 2108 insertions(+), 1653 deletions(-)
> >   create mode 100644 drivers/gpu/drm/bridge/samsung-dsim.c
> >   create mode 100644 include/drm/bridge/samsung-dsim.h
> >
> Best regards
> --
> Marek Szyprowski, PhD
> Samsung R&D Institute Poland
>
