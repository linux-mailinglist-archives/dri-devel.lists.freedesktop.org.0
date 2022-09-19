Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 543F25BD697
	for <lists+dri-devel@lfdr.de>; Mon, 19 Sep 2022 23:43:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E5E310E0B5;
	Mon, 19 Sep 2022 21:43:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [IPv6:2607:f8b0:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E03EF10E0B5
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Sep 2022 21:43:33 +0000 (UTC)
Received: by mail-ot1-x336.google.com with SMTP id
 u6-20020a056830118600b006595e8f9f3fso493765otq.1
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Sep 2022 14:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gateworks-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=sKtyENe86Q/OqlXN1O0gbexI0XpfGGGtAepGMCor+34=;
 b=IkGsimzJxr4hqy+Vfmjx30QA9nvDXkOEA8YDczvvQiAdYxDKkqy76p3hG+o+5R12tM
 IAlcyop9rO+MCRGVV4pgZNTqIu8EnCGdpHFW9aUHUYnSgIHdPmK2SXJL9WKgoS4mop7a
 PfCQ8xTqOviFdZz/LMEgdPN+H5SoaRFljnxPXv1eKl3S9cLdBlOqxZ5WX6gIVLtUETHi
 vC6y6UfRF/wycH6zu9n1hQEpm/J4qzRCg7afWGrzkMeOYXlqGg349LyHPu60rPnW2kP6
 kn4OnlidGxK+YdbMXs1H+/mAaCPpt9QzyXBObqrEka/JBGU2zM9Nm08dnPWA0YB2eP5L
 8mCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=sKtyENe86Q/OqlXN1O0gbexI0XpfGGGtAepGMCor+34=;
 b=j1etFgJW1sDyydy3LphnDdR2AAKnKWEQioCGrcztoPR+6+ZUqUhadSwt3UrzNwF52z
 MI76MHDCqyaEpK0c8B+Orw6yu8cUw2ydAVQlsjMvtNBac8DJsw2yIEAFo5jKCyK7Kfon
 pe+RFQGxeC6nwclewplfaT4PnxLUquaLl1aSTnIPBZFkmWrK72fzmoYucLyHFX/Sg2Cs
 GoQjvSF12K0RAM0ycRbXO43Y0WF+hmTWD+03n8D8wsD1443xL/MtnuwQamSKpn6RExG8
 nuNH+dMLEW2CRgCJTSH8qXwOM0prdx4hb0vprcDMVpGAgehvOtPUaXyTWFvuCJvfnNjl
 Z1nw==
X-Gm-Message-State: ACrzQf1S9Qf6JrUkZyoWi9r44R8zXpAa3wt3vitBYyJ1NuC+YqN/1M8R
 L/YuKloBCkaX0DjD2gzs/aLiHjFXKfEm7t23npoMBQ==
X-Google-Smtp-Source: AMsMyM43Dxu8MAFsKgpb6em8MHC2r9PEgty88ZEsoPBRfo9rrredHoNCUpBQ6LZibyYt9OJAAPG2bCDGDPDg8xqgDOQ=
X-Received: by 2002:a9d:684e:0:b0:659:6461:a8d9 with SMTP id
 c14-20020a9d684e000000b006596461a8d9mr8971091oto.42.1663623813024; Mon, 19
 Sep 2022 14:43:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220916181731.89764-1-jagan@amarulasolutions.com>
In-Reply-To: <20220916181731.89764-1-jagan@amarulasolutions.com>
From: Tim Harvey <tharvey@gateworks.com>
Date: Mon, 19 Sep 2022 14:43:21 -0700
Message-ID: <CAJ+vNU2gLKm_Si7xUsRJuzbJyEFHpC_TqsiorBAT5ADTZjsPZg@mail.gmail.com>
Subject: Re: [PATCH v5 00/11] drm: bridge: Add Samsung MIPI DSIM bridge
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
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>, dri-devel@lists.freedesktop.org,
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 Matteo Lisi <matteo.lisi@engicam.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Neil Armstrong <narmstrong@linaro.org>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Robert Foss <robert.foss@linaro.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 NXP Linux Team <linux-imx@nxp.com>, Fancy Fang <chen.fang@nxp.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Adam Ford <aford173@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Sep 16, 2022 at 11:18 AM Jagan Teki <jagan@amarulasolutions.com> wrote:
>
> This series supports common bridge support for Samsung MIPI DSIM
> which is used in Exynos and i.MX8MM SoC's.
>
> Previous v4 can be available here [1], repo on linux-next [2] and
> Engicam i.Core MX8M Mini SoM boot log [3].
>
> The final bridge supports both the Exynos and i.MX8MM DSI devices.
>
> Changes for v3:
> * bridge changes to support multi-arch
> * updated and clear commit messages
> * add hw_type via plat data
> * removed unneeded quirk
> * rebased on linux-next
>
> Changes for v4:
> * include Inki Dae in MAINTAINERS
> * remove dsi_driver probe in exynos_drm_drv to support multi-arch build
> * update init handling to ensure host init done on first cmd transfer
>
> Changes for v3:
> * fix the mult-arch build
> * fix dsi host init
> * updated commit messages
>
> Changes for v2:
> * fix bridge handling
> * fix dsi host init
> * correct the commit messages
>
> Patch 0001:     Restore proper bridge chain in exynos_dsi
>
> Patch 0002:     Samsung DSIM bridge
>
> Patch 0003:     PHY optional
>
> Patch 0004:     OF-graph or Child node lookup
>
> Patch 0005:     DSI host initialization
>
> Patch 0006:     atomic check
>
> Patch 0007:     PMS_P offset via plat data
>
> Patch 0008:     atomic_get_input_bus_fmts
>
> Patch 0009:     input_bus_flags
>
> Patch 0010:     document fsl,imx8mm-mipi-dsim
>
> Patch 0011:     add i.MX8MM DSIM support
>
> [3] https://gist.github.com/openedev/22b2d63b30ade0ba55ab414a2f47aaf0
> [2] https://github.com/openedev/kernel/tree/imx8mm-dsi-v5

Jagan,

I would like to try out this latest series a board I have here. It
looks like perhaps you did not push this imx8mm-dsi-v5 branch?

Best Regards,

Tim

> [1] https://patchwork.kernel.org/project/dri-devel/cover/20220829184031.1863663-1-jagan@amarulasolutions.com/
>
