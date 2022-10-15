Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 216875FFC12
	for <lists+dri-devel@lfdr.de>; Sat, 15 Oct 2022 23:46:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 825B610E591;
	Sat, 15 Oct 2022 21:46:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA05C10E591
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Oct 2022 21:46:11 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id A2E8084D45;
 Sat, 15 Oct 2022 23:46:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1665870369;
 bh=J3069uxITvLrTr5S4G3PQ3QISEKkiFc75za3DopuCZo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=RvQVC2/rfvfeDB7QDObPa0M1d4ZjTRTj/qOLT4INuzzaX1Dhp8ZZjPY3Yi2GTDNzp
 TElmRcixtQX7DAUsaAS9JJ99fD0HCQu2vp+gAd1XYBd5AS6uJ3hXNruv/cSv9oTlZ2
 CMul7P+CuKrlAwEYpzsovGXcvttUza6hgXdRuL5gbvyCGtzEY+FDWvb3VwRUXzoHeJ
 1TDmq68bxRK+RZJWn+O6kGw08nmNGIB38/Y0mi2EqkqlPBudUOxp8p4P4/dyz8Hp/Q
 3Jzx7S/pFtw5TWZE3JuN8wRQKnJD2lb7ieEb1fcoYGfJvoBQ2E0/Ow13F3MDTuti89
 2nsNNl3RYpSMA==
Message-ID: <d3012cac-6672-70cf-5cde-c3152cfd5a84@denx.de>
Date: Sat, 15 Oct 2022 23:46:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v7 01/10] drm: bridge: Add Samsung DSIM bridge driver
Content-Language: en-US
To: Jagan Teki <jagan@amarulasolutions.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Inki Dae <inki.dae@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Fancy Fang <chen.fang@nxp.com>, Tim Harvey <tharvey@gateworks.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Adam Ford <aford173@gmail.com>, Neil Armstrong <narmstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
References: <20221005151309.7278-1-jagan@amarulasolutions.com>
 <20221005151309.7278-2-jagan@amarulasolutions.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20221005151309.7278-2-jagan@amarulasolutions.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: linux-samsung-soc@vger.kernel.org, Matteo Lisi <matteo.lisi@engicam.com>,
 dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/5/22 17:13, Jagan Teki wrote:
> Samsung MIPI DSIM controller is common DSI IP that can be used in various
> SoCs like Exynos, i.MX8M Mini/Nano.
> 
> In order to access this DSI controller between various platform SoCs,
> the ideal way to incorporate this in the drm stack is via the drm bridge
> driver.
> 
> This patch is trying to differentiate platform-specific and bridge driver
> code by maintaining exynos platform glue code in exynos_drm_dsi.c driver
> and common bridge driver code in samsung-dsim.c providing that the new
> platform-specific glue should be supported in the bridge driver, unlike
> exynos platform drm drivers.
> 
> - Add samsung_dsim_plat_data for keeping platform-specific attributes like
>    host_ops, irq_ops, and hw_type.
> 
> - Initialize the plat_data hooks for exynos platform in exynos_drm_dsi.c.
> 
> - samsung_dsim_probe is the common probe call across exynos_drm_dsi.c and
>    samsung-dsim.c.
> 
> - plat_data hooks like host_ops and irq_ops are invoked during the
>    respective bridge call chains.

Maybe the Subject should say "Split ... driver" or "Move ... driver" , 
since it is not adding a new driver here ?
