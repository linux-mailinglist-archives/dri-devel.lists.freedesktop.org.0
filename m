Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E4EA46AB5E8
	for <lists+dri-devel@lfdr.de>; Mon,  6 Mar 2023 06:24:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F52810E06F;
	Mon,  6 Mar 2023 05:24:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBB3610E06F
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Mar 2023 05:24:38 +0000 (UTC)
Received: from epcas1p1.samsung.com (unknown [182.195.41.45])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20230306052436epoutp02018783160a01e626466f6778c8bda5ab~JvR7a-BWi3209632096epoutp02b
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Mar 2023 05:24:36 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20230306052436epoutp02018783160a01e626466f6778c8bda5ab~JvR7a-BWi3209632096epoutp02b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1678080276;
 bh=m6kM4yfhNqiXwMZ3lifNXAvgLcS9B6oCJ1XE4/FMfAw=;
 h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
 b=fewhgHxHQFyNkEJ+3gnJyLoQxhTWNYjdcYcpY0rE4H8VWV7cIaodpXTA71RdMGrxN
 8rqIHyL+ZI7h4UrIuFe09K6Pk01DFVSjP7orpzR3s/Kg8LJIJ4ICNfoU6JLNpuar39
 02s9Kn6qplN5CZ9zxKBRXl26ceU5KbzHzucOavIk=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTP id
 20230306052435epcas1p4e94b6691e6a0894ba3b1abc19797790d~JvR6reLKD0752607526epcas1p42;
 Mon,  6 Mar 2023 05:24:35 +0000 (GMT)
Received: from epsmges1p2.samsung.com (unknown [182.195.38.231]) by
 epsnrtp4.localdomain (Postfix) with ESMTP id 4PVRpV28ZDz4x9Q2; Mon,  6 Mar
 2023 05:24:34 +0000 (GMT)
Received: from epcas1p3.samsung.com ( [182.195.41.47]) by
 epsmges1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 10.30.12562.21975046; Mon,  6 Mar 2023 14:24:34 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20230306052433epcas1p1c42bc79f38536cf80650c94263e55618~JvR5C0oS62522825228epcas1p1l;
 Mon,  6 Mar 2023 05:24:33 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20230306052433epsmtrp124e4c8107c99657f14fca09d127c371c~JvR5B4js31002510025epsmtrp1L;
 Mon,  6 Mar 2023 05:24:33 +0000 (GMT)
X-AuditID: b6c32a36-e59fa70000023112-5b-640579129629
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 59.7D.18071.11975046; Mon,  6 Mar 2023 14:24:33 +0900 (KST)
Received: from inkidae002 (unknown [10.113.221.213]) by epsmtip2.samsung.com
 (KnoxPortal) with ESMTPA id
 20230306052433epsmtip21af0fd75d01631bde3a1b2a4989fc527~JvR4wIbIx3245332453epsmtip25;
 Mon,  6 Mar 2023 05:24:33 +0000 (GMT)
From: =?ks_c_5601-1987?B?tOvAzrHiL1RpemVuIFBsYXRmb3JtIExhYihTUikvu++8usD8wNo=?=
 <inki.dae@samsung.com>
To: "'Jagan Teki'" <jagan@amarulasolutions.com>, "'Andrzej Hajda'"
 <andrzej.hajda@intel.com>, "'Marek Szyprowski'" <m.szyprowski@samsung.com>,
 "'Neil	Armstrong'" <neil.armstrong@linaro.org>, "'Marek Vasut'"
 <marex@denx.de>, "'Maxime	Ripard'" <mripard@kernel.org>
In-Reply-To: <20230303145138.29233-1-jagan@amarulasolutions.com>
Subject: RE: [PATCH v15 00/16] drm: Add Samsung MIPI DSIM bridge
Date: Mon, 6 Mar 2023 14:24:28 +0900
Message-ID: <000001d94feb$ef651bb0$ce2f5310$@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="ks_c_5601-1987"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQFxvWyvR1Df7oSTO+mlUYubibb3UgKtlO8ar6bqNoA=
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA02Te0xTVxzHc+6rhVG9liJHNAyvLkE2Hq08LkgXBEbuoltwEKP8U6/0rmWU
 tuuDjLkMBqYVhAnCDHSI8hYGQzrk4QQMMoH5QucG20ASFQMoAxXI2Fhcy2UL/31+5/f9nnO+
 5yFExY8JL2GK1sQZtKyGIlyx9mu7Av3FGbgy6PIPbvTY7zdQeqL6JUbfX5wj6ILa2zi9YC8k
 6FvZzwR0fWEPQZfe6UHo5v5xAf3M8gWgbzxsQWlLbh1Oz3X9BujS4mmCvjv4Ao3ayDQ/n8CZ
 CtsgxpQM9uPM7fxxgumyjQuY6ivTCGNvzCWY/p+rcWbslysEM3FyAGG+bGsEzEu7d7xbUmqk
 mmOVnMGH0ybrlClalZzal6CIUYSEBkn9peF0GOWjZdM4ORW7P94/LkXjSET5pLMas2MonjUa
 qcC3Iw06s4nzUeuMJjnF6ZUafYg+wMimGc1aVYCWM0VIg4JkIQ7hkVR13UIrpm8L/aRhMTML
 LPjlARchJIPhr/MFaB5wFYrJTgCnRrIxvngB4J9VZxC+WAKwd/imoxCuWhrLKKdbTHYDOPF0
 H6+ZBvD4dw3A2SBINRy3VuPOhoTMR2DXPYvA2UDJEhTeafdwsgsZBUez72FOdnfwkmVp1YyR
 O2HFCj8uIsNhVm8rwfMmOFT2GOPnkcGab84hPL8OO2bLUT6PD1yerMOdLCEj4PEn13FeI4Ff
 51rWNFYX+LCJ4DkWrjzqRHh2hzMDbQKeveD0KeeeXR1cDODYyAWML0oBvLY8AnjVbthbW7zm
 3g67/j4L+NU2wD8W83H+uETwhEXMSyh4/e7omhXC4ZoiohBQtnXZbOuy2dZls63LcB5gjWAz
 pzemqTijVC/7/7qTdWl2sPrc/UI7wenZ+YA+gAhBH4BClJKI3MyYUixSshmfcgadwmDWcMY+
 EOI47iLUyyNZ5/gvWpNCGhweFBwq2x1MS0OllKfIUz6ULCZVrIlL5Tg9Z/jPhwhdvLKQIsHA
 ti0PJkvwlPqs6eiZzJ883yuNkQ1XJYissgDbNlS1dFDX+ihnx964DVd95xYvXnrSDacuDFl9
 m4rLt+5A5B2vbU1MOloQ0TF/ICm/Fu4pvUock2QJ/8phsfpK7yNF79hisMmPdkpC4vY/P5Sa
 XzRcdqspEE7dP7Sp4rCmo7zu1NMHGc17PVpUe6wHPmj/vpI5+ZV1V0NeSuLm7BPEseLom5fT
 Wyob3P3eOBP7yjvQ/iYys30xw9c/2nwRvK/pOVxytnr4oOStMu7dzz+OUofVzHV/FrtiFynS
 df2ZuT1h//hNJmbKcz6cXz46/2Pet5Fdr7ZIgy8pwhpnEV1NwsbyqlEKM6pZqR9qMLL/Aowb
 bKN3BAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrLIsWRmVeSWpSXmKPExsWy7bCSvK5gJWuKwcU2HYs7t08zW9xf/JnF
 4srX92wWvUvPsVp82TSBzeJs0xt2i+UT9rFZzDi/j8li7ZG77BZv2hoZLU4/Ws9s0da5jNXi
 /c5bjBYzJr9ks7h44hOzA7/H2o/3WT3mzTrB4jHlxBFWj3M9d9k8ds66y+6xeM9LJo9NqzrZ
 PI5cXczqcefaHjaP+93HmTz6tqxi9Pi8SS6AJ4rLJiU1J7MstUjfLoErY9mXjSwFW8wqVn6t
 b2D8otXFyMEhIWAisWqmUhcjF4eQwG5GiSefHzFCxCUktmzlgDCFJQ4fLoYoec4oMfX0O7Yu
 Rk4ONoE0iUlz97OCJEQEJjBJbL+zEMxhFpjBLHHmzTpmiJaJjBK3rk5lBGnhFHCQuNF0iQXE
 Fgayv7V9A4uzCKhIzPsDEecVsJRo2L+RDcIWlDg58wlYnBno0sbD3VC2vMT2t3OYQWwJAQWJ
 n0+XsYLYIgJWEi3PjrFC1IhIzO5sY57AKDwLyahZSEbNQjJqFpKWBYwsqxglUwuKc9Nziw0L
 DPNSy/WKE3OLS/PS9ZLzczcxgmNcS3MH4/ZVH/QOMTJxMB5ilOBgVhLh5SllSRHiTUmsrEot
 yo8vKs1JLT7EKM3BoiTOe6HrZLyQQHpiSWp2ampBahFMlomDU6qBSZFj6Zbvn7N7TigvYxT0
 mWwjc95f+btcMCffbe/i1Nnqv/8dT/1wYvocn0qtjP3nH2t/y7+z/6ei7ESVplU9oT89+4P2
 L3jf1eTqoexkbCxs2nDoze1KzoJN59zWKCdaJ7paL/m84mF3wYKXepev3Sh6qxvhZ6vr0ml9
 csZBe1OLVpUdOzdLOFkvWfnt/bNpB8rP/U88PHmGcUHz/ifuDybb5KvtX29Tq5QtFZPzbuGq
 iKNyVzR2LX6zgje8fm1T7vt1ijLTVydwP2Na9nz7391C0o56V76Yp1guf2yiNLvh6ePoDS0T
 9381kJ7wzWjzMh+L1ieRh4ymMxnzn1z9/VjAnHR3wZpIhw23ir6ImSqxFGckGmoxFxUnAgBr
 NPM7YAMAAA==
X-CMS-MailID: 20230306052433epcas1p1c42bc79f38536cf80650c94263e55618
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20230303145218epcas1p2e77bc610f57337830924e3c6c02ca291
References: <CGME20230303145218epcas1p2e77bc610f57337830924e3c6c02ca291@epcas1p2.samsung.com>
 <20230303145138.29233-1-jagan@amarulasolutions.com>
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
Cc: linux-samsung-soc@vger.kernel.org, 'Matteo	Lisi' <matteo.lisi@engicam.com>,
 'linux-amarula' <linux-amarula@amarulasolutions.com>,
 'Seung-Woo Kim' <sw0312.kim@samsung.com>,
 'Frieder Schrempf' <frieder.schrempf@kontron.de>,
 'Kyungmin Park' <kyungmin.park@samsung.com>, dri-devel@lists.freedesktop.org,
 'Adam Ford' <aford173@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jagan,

> -----Original Message-----
> From: Jagan Teki <jagan@amarulasolutions.com>
> Sent: Friday, March 3, 2023 11:51 PM
> To: Andrzej Hajda <andrzej.hajda@intel.com>; Inki Dae <inki.dae@samsung.com>;
> Marek Szyprowski <m.szyprowski@samsung.com>; Neil Armstrong
> <neil.armstrong@linaro.org>; Marek Vasut <marex@denx.de>; Maxime Ripard
> <mripard@kernel.org>
> Cc: Seung-Woo Kim <sw0312.kim@samsung.com>; Kyungmin Park
> <kyungmin.park@samsung.com>; Frieder Schrempf <frieder.schrempf@kontron.de>;
> Tim Harvey <tharvey@gateworks.com>; Adam Ford <aford173@gmail.com>; Matteo
> Lisi <matteo.lisi@engicam.com>; dri-devel@lists.freedesktop.org; linux-
> samsung-soc@vger.kernel.org; linux-amarula <linux-
> amarula@amarulasolutions.com>; Jagan Teki <jagan@amarulasolutions.com>
> Subject: [PATCH v15 00/16] drm: Add Samsung MIPI DSIM bridge
> 
> This series supports common bridge support for Samsung MIPI DSIM
> which is used in Exynos and i.MX8MM SoC's.
> 
> The final bridge supports both the Exynos and i.MX8M Mini/Nano/Plus.
> 
> Inki Dae: please note that this series added on top of exynos-drm-next
> since few exynos dsi changes are not been part of drm-misc-next.
> Request you to pick these via exynos-drm-next, or let me know if you
> have any comments?

Seems some issue Marek found on testing. If fixed then I will try to pick this
patch series up.

To Andrzej, Neil, Robert and Laurent.
Could you give me any comment to below patch,
[drm: bridge: Generalize Exynos-DSI driver into a Samsung DSIM bridge]  :
https://www.spinics.net/lists/dri-devel/msg385731.html

If you could kindly provide me with an Acked-by or Signed-off-by after review,
it would greatly assist me in picking up this patch series for upstream.

Thanks,
Inki Dae

> 
> Patch 0001 - 0002: find child DSI bridge and panel
> 
> Patch 0003 - 0004: optional PHY, PMS_P offset
> 
> Patch 0005       : introduce hw_type
> 
> Patch 0006	 : fixing host init
> 
> Patch 0007	 : atomic_check
> 
> Patch 0008	 : input_bus_flags
> 
> Patch 0009	 : atomic_get_input_bus_fmts
> 
> Patch 0010 - 0011: component vs bridge
> 
> Patch 0012	 : DSIM bridge
> 
> Patch 0013 - 0014: i.MX8M Mini/Nano
> 
> Patch 0015 - 0016: i.MX8M Plus
> 
> Changes for v15:
> - drop drm_of helpers
> - re-added find DSI bridge/Panel helper in dsim
> - collect RB from Marek V
> - fixed leading underscore in function names
> - commit messages updated
> - rebased on exynos-drm-next
> 
> Changes for v13:
> - remove devm call for DSI panel or bridge finding
> - rebased on drm-misc-next
> 
> Changes for v12:
> - collect RB from Marek V
> - add te_irq_handler hook
> - fix comments from Marek V
> - update atomic_get_input_bus_fmts logic
> 
> Changes for v11:
> - collect RB from Frieder Schrempf
> - collect ACK from Rob
> - collect ACK from Robert
> - fix BIT macro replacements
> - fix checkpatch --strict warnings
> - fix unneeded commit text
> - drop extra lines
> 
> Changes for v10:
> - rebase on drm-misc-next
> - add drm_of_dsi_find_panel_or_bridge
> - add devm_drm_of_dsi_get_bridge
> - fix host initialization (Thanks to Marek Szyprowski)
> - rearrange the tiny patches for easy to review
> - update simple names for enum hw_type
> - add is_hw_exynos macro
> - rework on commit messages
> 
> Changes for v9:
> - rebase on drm-misc-next
> - drop drm bridge attach fix for Exynos
> - added prepare_prev_first flag
> - added pre_enable_prev_first flag
> - fix bridge chain order for exynos
> - added fix for Exynos host init for first DSI transfer
> - added MEDIA_BUS_FMT_FIXED
> - return MEDIA_BUS_FMT_RGB888_1X24 output_fmt if supported output_fmt
>   list is unsupported.
> - added MEDIA_BUS_FMT_YUYV10_1X20
> - added MEDIA_BUS_FMT_YUYV12_1X24
> 
> Changes for v8:
> * fixed comment lines
> * fixed commit messages
> * fixed video mode bits
> * collect Marek Ack
> * fixed video mode bit names
> * update input formats logic
> * added imx8mplus support
> 
> Changes for v7:
> * fix the drm bridge attach chain for exynos drm dsi driver
> * fix the hw_type checking logic
> 
> Changes for v6:
> * handle previous bridge for exynos dsi while attaching bridge
> 
> Changes for v5:
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
> Tested in Engicam i.Core MX8M Mini SoM.
> 
> Repo:
> https://protect2.fireeye.com/v1/url?k=ba7a5cbf-dbf1498c-ba7bd7f0-000babff9bb7-
> 64eb01b9825d1cad&q=1&e=55e2423e-1b57-4c22-a4a8-
> 3dfcebdd3d9d&u=https%3A%2F%2Fgithub.com%2Fopenedev%2Fkernel%2Ftree%2Fimx8mm-
> dsi-v15
> 
> v13:
> https://lore.kernel.org/all/20230227113925.875425-1-
> jagan@amarulasolutions.com/
> 
> Any inputs?
> Jagan.
> 
> Jagan Teki (14):
>   drm: exynos: dsi: Drop explicit call to bridge detach
>   drm: exynos: dsi: Lookup OF-graph or Child node devices
>   drm: exynos: dsi: Mark PHY as optional
>   drm: exynos: dsi: Add platform PLL_P (PMS_P) offset
>   drm: exynos: dsi: Introduce hw_type platform data
>   drm: exynos: dsi: Add atomic check
>   drm: exynos: dsi: Add input_bus_flags
>   drm: exynos: dsi: Add atomic_get_input_bus_fmts
>   drm: exynos: dsi: Consolidate component and bridge
>   drm: exynos: dsi: Add host helper for te_irq_handler
>   drm: bridge: Generalize Exynos-DSI driver into a Samsung DSIM bridge
>   dt-bindings: display: exynos: dsim: Add NXP i.MX8M Mini/Nano support
>   drm: bridge: samsung-dsim: Add i.MX8M Mini/Nano support
>   dt-bindings: display: exynos: dsim: Add NXP i.MX8M Plus support
> 
> Marek Szyprowski (1):
>   drm: exynos: dsi: Handle proper host initialization
> 
> Marek Vasut (1):
>   drm: bridge: samsung-dsim: Add i.MX8M Plus support
> 
>  .../bindings/display/exynos/exynos_dsim.txt   |    2 +
>  MAINTAINERS                                   |    9 +
>  drivers/gpu/drm/bridge/Kconfig                |   12 +
>  drivers/gpu/drm/bridge/Makefile               |    1 +
>  drivers/gpu/drm/bridge/samsung-dsim.c         | 1965 +++++++++++++++++
>  drivers/gpu/drm/exynos/Kconfig                |    1 +
>  drivers/gpu/drm/exynos/exynos_drm_dsi.c       | 1817 +--------------
>  include/drm/bridge/samsung-dsim.h             |  115 +
>  8 files changed, 2190 insertions(+), 1732 deletions(-)
>  create mode 100644 drivers/gpu/drm/bridge/samsung-dsim.c
>  create mode 100644 include/drm/bridge/samsung-dsim.h
> 
> --
> 2.25.1


