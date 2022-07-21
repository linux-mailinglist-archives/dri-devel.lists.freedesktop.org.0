Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B23E157C526
	for <lists+dri-devel@lfdr.de>; Thu, 21 Jul 2022 09:19:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C88B14BC57;
	Thu, 21 Jul 2022 07:19:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F9D814BC57
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jul 2022 07:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1658387961; x=1689923961;
 h=subject:from:to:cc:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YesWfDoB09rlru1yg9XVWrqQi6CAgpKuiyUgxeX+fRM=;
 b=ap7GuRZ/epJW/nyn7H7SItGJa5jMHG59Zl5H+dA4xiIoD+2d8BvKjiq2
 FY6uEGSHeefViZ5TDd1zK9/NmGhhINPd8JnPMiIewtZR61qoJAIfO8RWz
 x5kuDDafhNWpk27mv5UwFNOkwOIcGV3XsU/6c61B0fWcLzb1KicfvqS19
 9KdsZ/KaZMhZ8P8oGHtXhOTJZdspZ9at0BcTELpjA8ywibQe4jgOYegb9
 vq4zdWAuDfcubjowFnLD3BF2QPwB8f7Be7DZcPD5a9ZkavwBb3k9jUZqm
 3nNSgN9MxS/KlAmHwsYnlxRoUSZLOQ6De4erEk6kXQd32CRKqiVQ23Qyg A==;
X-IronPort-AV: E=Sophos;i="5.92,288,1650924000"; d="scan'208";a="25174755"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 21 Jul 2022 09:19:19 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Thu, 21 Jul 2022 09:19:19 +0200
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Thu, 21 Jul 2022 09:19:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1658387959; x=1689923959;
 h=from:to:cc:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding:subject;
 bh=YesWfDoB09rlru1yg9XVWrqQi6CAgpKuiyUgxeX+fRM=;
 b=kw54iJZtc+tF6sc8VIFhmbJjiR8VlB6yKWRQ+oT25RONVW7O50NtbdrT
 dQtXKl8vELVvZGWB25/NCeFowXUdEpjfu/H8B+rSCp2EfbCB/tD2xQB8f
 2b2vWUdPnMRjCcrDoNEfbx3nXx6hlYE1UpMIbG5Hudcr2Dq4KK2rH2eJM
 6ixdcNFDdJEewYM6x5KhSxppz9HxxqedKu/KQxkEVSk6KmbCZTHBuNJwt
 LvkzKkdnwBu2a6W6QkOUkaoqcudAvyOBiy5A8Hl4JzASsZqhfn8YcvktY
 j63iOPDuB3di/h0hvqNmPHSrjZqldLIzZFW+df0WcyE+EHKX37phk+3xT A==;
X-IronPort-AV: E=Sophos;i="5.92,288,1650924000"; d="scan'208";a="25174754"
Subject: Re: [PATCH v3 00/13] drm: bridge: Add Samsung MIPI DSIM bridge
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 21 Jul 2022 09:19:19 +0200
Received: from steina-w.localnet (unknown [10.123.49.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id B6101280056;
 Thu, 21 Jul 2022 09:19:18 +0200 (CEST)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Jagan Teki <jagan@amarulasolutions.com>
Date: Thu, 21 Jul 2022 09:19:16 +0200
Message-ID: <7188447.DvuYhMxLoT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20220720155210.365977-1-jagan@amarulasolutions.com>
References: <20220720155210.365977-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Fancy Fang <chen.fang@nxp.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Marek Vasut <marex@denx.de>,
 linux-samsung-soc@vger.kernel.org, Joonyoung Shim <jy0922.shim@samsung.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
 NXP Linux Team <linux-imx@nxp.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Matteo Lisi <matteo.lisi@engicam.com>,
 Adam Ford <aford173@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Robert Foss <robert.foss@linaro.org>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jagan,

thanks for the update.

Am Mittwoch, 20. Juli 2022, 17:51:57 CEST schrieb Jagan Teki:
> This series supports common bridge support for Samsung MIPI DSIM
> which is used in Exynos and i.MX8MM SoC's.
> 
> Previous v2 can be available here [1].
> 
> The final bridge supports both the Exynos and i.MX8MM DSI devices.
> 
> On, summary this patch-set break the entire DSIM driver into
> - platform specific glue code for platform ops, component_ops.
> - common bridge driver which handle platform glue init and invoke.
> 
> Patch 0001:	Restore proper bridge chain in exynos_dsi
> 
> Patch 0002: 	Samsung DSIM bridge
> 
> Patch 0003:	Common lookup code for OF-graph or child
> 
> Patch 0004: 	plat_data quirk flag via driver_data
> 
> Patch 0005/11:  bridge fixes, atomic API's
> 
> Patch 0012:	document fsl,imx8mm-mipi-dsim
> 
> Patch 0013:	add i.MX8MM DSIM support
> 
> Tested in Engicam i.Core MX8M Mini SoM.
> 
> Anyone interested, please have a look on this repo [2]
> 
> [2] https://github.com/openedev/kernel/tree/imx8mm-dsi-v2

I suspect you meant https://github.com/openedev/kernel/tree/imx8mm-dsi-v3

Using this v3:
Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com>
on TQMa8MxML + MBa8Mx.

> [1]
> https://patchwork.kernel.org/project/dri-devel/cover/20220504114021.33265-1
> -jagan@amarulasolutions.com/
> 
> Any inputs?
> Jagan.
> 
> Jagan Teki (12):
>   drm: bridge: Add Samsung DSIM bridge driver
>   drm: bridge: samsung-dsim: Lookup OF-graph or Child node devices
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
> Marek Szyprowski (1):
>   drm: exynos: dsi: Restore proper bridge chain order
> 
>  .../bindings/display/exynos/exynos_dsim.txt   |    1 +
>  MAINTAINERS                                   |    8 +
>  drivers/gpu/drm/bridge/Kconfig                |   12 +
>  drivers/gpu/drm/bridge/Makefile               |    1 +
>  drivers/gpu/drm/bridge/samsung-dsim.c         | 1850 +++++++++++++++++
>  drivers/gpu/drm/exynos/Kconfig                |    1 +
>  drivers/gpu/drm/exynos/exynos_drm_dsi.c       | 1717 +--------------
>  include/drm/bridge/samsung-dsim.h             |  106 +
>  8 files changed, 2042 insertions(+), 1654 deletions(-)
>  create mode 100644 drivers/gpu/drm/bridge/samsung-dsim.c
>  create mode 100644 include/drm/bridge/samsung-dsim.h




