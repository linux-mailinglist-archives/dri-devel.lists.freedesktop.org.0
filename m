Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 14BFF5E74E7
	for <lists+dri-devel@lfdr.de>; Fri, 23 Sep 2022 09:34:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DFA210E45F;
	Fri, 23 Sep 2022 07:34:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29E6E10E45F
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Sep 2022 07:34:15 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20220923073413euoutp02d5dd28d0664644505496de519dce02a8~XbQRvzXPR2726527265euoutp02X
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Sep 2022 07:34:13 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20220923073413euoutp02d5dd28d0664644505496de519dce02a8~XbQRvzXPR2726527265euoutp02X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1663918453;
 bh=SJJBZdYqHjHv9S2nEezkhKpdVUKSTwbwE38u4F85bT4=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=A36pIYCO5E+iUCQ1K6ZvIZ8fVZMVKdcIEhNEWGBfoy5R+ry/KHvqyLrP8AN7wDB+D
 O9+mMQVZ2elth8rSJQp4eohPrOAnKYBs/yO3tkXggtuFWxZrGg/kIGgjhu9N/zf3w8
 mSrZuycdzrW6IZRcQTWkoYSb7Nb49Xf5kRLfGh2I=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20220923073412eucas1p1c2ebe0b5314221a33ff4616f1643227f~XbQRapF4-1574015740eucas1p15;
 Fri, 23 Sep 2022 07:34:12 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id FF.A4.07817.4716D236; Fri, 23
 Sep 2022 08:34:12 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20220923073412eucas1p29ed96daeb8846edcadaf68ffdd66ea33~XbQQ15kdV2670126701eucas1p2U;
 Fri, 23 Sep 2022 07:34:12 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20220923073412eusmtrp2aad383b23c33a9e4132cd509ddcf85bb~XbQQ0yiIk1333913339eusmtrp2M;
 Fri, 23 Sep 2022 07:34:12 +0000 (GMT)
X-AuditID: cbfec7f4-8abff70000011e89-8d-632d617470f8
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id F3.88.07473.3716D236; Fri, 23
 Sep 2022 08:34:12 +0100 (BST)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20220923073411eusmtip1b6b892b6da378fdd4519aab1e63de267~XbQPvcAY40765307653eusmtip1V;
 Fri, 23 Sep 2022 07:34:10 +0000 (GMT)
Message-ID: <9cf6b220-ac9c-3267-bdb2-29fc2f157f71@samsung.com>
Date: Fri, 23 Sep 2022 09:34:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH v5 00/11] drm: bridge: Add Samsung MIPI DSIM bridge
Content-Language: en-US
To: Jagan Teki <jagan@amarulasolutions.com>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim
 <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin
 Park <kyungmin.park@samsung.com>, Frieder Schrempf
 <frieder.schrempf@kontron.de>, Fancy Fang <chen.fang@nxp.com>, Tim Harvey
 <tharvey@gateworks.com>, Michael Nazzareno Trimarchi
 <michael@amarulasolutions.com>, Adam Ford <aford173@gmail.com>, Neil
 Armstrong <narmstrong@linaro.org>, Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Tommaso Merciai
 <tommaso.merciai@amarulasolutions.com>, Marek Vasut <marex@denx.de>
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20220916181731.89764-1-jagan@amarulasolutions.com>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprKJsWRmVeSWpSXmKPExsWy7djPc7olibrJBkf+alvcuX2a2eL+4s8s
 Fq9vr2CzuPL1PZtF79JzrBaT7k9gsfiyaQKbxYt7F1kszja9YbfonLiE3WL5hH1sFpseX2O1
 6Pq1ktlixvl9TBZv2hoZLU4/Ws9scaqxlcXi0pTDbBafZj0Eyk5+yWZx8cQnZovvv88yO4h5
 rP14n9Vj3qwTLB5TThxh9TjXc5fNY+esu+wesztmsnos3vOSyePI1cWsHneu7WHzuN99nMlj
 85J6j43vdjB59G1ZxejxeZNcAF8Ul01Kak5mWWqRvl0CV8aS3fuYC3bLVzS+XcfYwDhHsouR
 k0NCwERiS9Me1i5GLg4hgRWMEu2T77JAOF8YJc4tnwOV+cwosXfbe1aYltePpzNBJJYzSrw9
 OI8NJCEk8JFR4utybhCbV8BOYt/Xh+wgNouAqsTVddPZIOKCEidnPmEBsUUFkiVmHTvGCGIL
 C7hLzH/zDayGWUBc4taT+WALRATWskr0LethA3GYQRb0/HjIDFLFJmAo0fW2C6yDU8BBYs7s
 yywQ3fIS29/OYYY4tYtL4uT2MgjbReLzv9VQcWGJV8e3sEPYMhL/d0JskxBoZ5RY8Ps+lDOB
 UaLh+S1GiCpriTvnfgFt4wDaoCmxfpc+iCkh4CjRckIYwuSTuPFWEOIEPolJ26YzQ4R5JTra
 hCBmqEnMOr4ObuvBC5eYJzAqzUIKlllI3p+F5JlZCGsXMLKsYhRPLS3OTU8tNspLLdcrTswt
 Ls1L10vOz93ECEy5p/8d/7KDcfmrj3qHGJk4GA8xSnAwK4nwzr6jmSzEm5JYWZValB9fVJqT
 WnyIUZqDRUmcl22GVrKQQHpiSWp2ampBahFMlomDU6qBaeX0D5HbP8yeuObvVumn2zzjfGRP
 R50RO7lNuU9j28GlK99MiGQO+Mxi9iLqzj8Ll7o+Z6nkq6/O9Jy2PbbVZrV8dXme8snHqX4f
 PJIqdD6ZXzV5XnnDedMr3VW8a/dyVcqISplUvc/6Us5wSCvA6caS7drl6lMsw/TtbecXtPyq
 CtzM8mipWWLgTjaTCy1+b9TcldL/6hvtFPnTqXG4Ke3ny2eH7njdP8BdLPv8aoThVNNTO0uV
 ZvIGOc7mmbKOv+LhKgb1R+/znZyqi023qsn+qc2cwLU0LJi5wunR8sTKzQ0bQ1c57tjIbpJ8
 5oPC94MmiXt2nkv0vWl84scqoUs7v7/Qm//H7eO8/tZVVUosxRmJhlrMRcWJAPWrL7goBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrFKsWRmVeSWpSXmKPExsVy+t/xu7olibrJBptbGC3u3D7NbHF/8WcW
 i9e3V7BZXPn6ns2id+k5VotJ9yewWHzZNIHN4sW9iywWZ5vesFt0TlzCbrF8wj42i02Pr7Fa
 dP1ayWwx4/w+Jos3bY2MFqcfrWe2ONXYymJxacphNotPsx4CZSe/ZLO4eOITs8X332eZHcQ8
 1n68z+oxb9YJFo8pJ46wepzrucvmsXPWXXaP2R0zWT0W73nJ5HHk6mJWjzvX9rB53O8+zuSx
 eUm9x8Z3O5g8+rasYvT4vEkugC9Kz6Yov7QkVSEjv7jEVina0MJIz9DSQs/IxFLP0Ng81srI
 VEnfziYlNSezLLVI3y5BL2PJ7n3MBbvlKxrfrmNsYJwj2cXIySEhYCLx+vF0pi5GLg4hgaWM
 Ehe7vrFCJGQkTk5rgLKFJf5c62KDKHrPKNF9ayIbSIJXwE5i39eH7CA2i4CqxNV106HighIn
 Zz5hAbFFBZIlljTcBxskLOAuMf/NN7AaZgFxiVtP5oNtFhHYzCqx990EMIdZ4COjxKXJW9gh
 1k1mlHhyeT0jSAubgKFE19susHZOAQeJObMvs0CMMpPo2trFCGHLS2x/O4d5AqPQLCSXzEKy
 cRaSlllIWhYwsqxiFEktLc5Nzy021CtOzC0uzUvXS87P3cQITDTbjv3cvINx3quPeocYmTgY
 DzFKcDArifDOvqOZLMSbklhZlVqUH19UmpNafIjRFBgcE5mlRJPzgakuryTe0MzA1NDEzNLA
 1NLMWEmc17OgI1FIID2xJDU7NbUgtQimj4mDU6qBadKHr4dYFn7k8r97Z83DBU5LytifWYqs
 92Pg1qwudv7eEH8/rFFEy9x9R1vA20Tds2bHJ6+efMVgemH3CZkd01Sfy3cJfbn5ePXMj1e+
 1bQpv/RR25MfGFB1+lOTdKDzkifFx1QZGVqv3y7TPr/0u++sGLWyNVz8F5zFRQqvneh8Gv5d
 tFX68UGOsiZepsc2z62OdHtqz8nKU8v4v6X+xKk1er+2R+aIvL5//4hY5rxLP3ZeOZUx02LV
 7NjzqicK4z/7yzQlb8i8skunO8rsBENOl35n+F0vjfLfi/ft5V+mO8lKKLtdan973kueA6uW
 b56tJvOt8eMT71vZzbcNTwmw9127fV7Dc/3PQ6/685RYijMSDbWYi4oTAY9H1KO9AwAA
X-CMS-MailID: 20220923073412eucas1p29ed96daeb8846edcadaf68ffdd66ea33
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20220916181822eucas1p2bfdd1247b0297638620846586598f2a6
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20220916181822eucas1p2bfdd1247b0297638620846586598f2a6
References: <CGME20220916181822eucas1p2bfdd1247b0297638620846586598f2a6@eucas1p2.samsung.com>
 <20220916181731.89764-1-jagan@amarulasolutions.com>
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

On 16.09.2022 20:17, Jagan Teki wrote:
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
> Patch 0001:	Restore proper bridge chain in exynos_dsi
>
> Patch 0002: 	Samsung DSIM bridge
>
> Patch 0003:	PHY optional
>
> Patch 0004:	OF-graph or Child node lookup
>
> Patch 0005: 	DSI host initialization
>
> Patch 0006:	atomic check
>
> Patch 0007:	PMS_P offset via plat data
>
> Patch 0008:	atomic_get_input_bus_fmts
>
> Patch 0009:	input_bus_flags
>
> Patch 0010:	document fsl,imx8mm-mipi-dsim
>
> Patch 0011:	add i.MX8MM DSIM support
>
> [3] https://protect2.fireeye.com/v1/url?k=f5b98b61-94329e52-f5b8002e-000babff9bb7-1f9a3bf1da680bc2&q=1&e=efefced1-2052-43c5-834f-b50867c29e3c&u=https%3A%2F%2Fgist.github.com%2Fopenedev%2F22b2d63b30ade0ba55ab414a2f47aaf0
> [2] https://protect2.fireeye.com/v1/url?k=02c0a3da-634bb6e9-02c12895-000babff9bb7-8ed3eab856890e56&q=1&e=efefced1-2052-43c5-834f-b50867c29e3c&u=https%3A%2F%2Fgithub.com%2Fopenedev%2Fkernel%2Ftree%2Fimx8mm-dsi-v5
> [1] https://patchwork.kernel.org/project/dri-devel/cover/20220829184031.1863663-1-jagan@amarulasolutions.com/
>
> Any inputs?

Just to make it clear. Like I already pointed [1], this version breaks 
Exynos boards with DSI panels. Either the patch #1 has to be dropped to 
keep the current hack (the current code changes the bridge order to 
force proper pre_enable calls) or the Dave's patches have to be applied 
first [3].

[1] 
https://lore.kernel.org/all/5baf2a71-3d1e-0f25-9b0e-2af98684fce5@samsung.com/

[2] 
https://lore.kernel.org/all/cover.1646406653.git.dave.stevenson@raspberrypi.com/

[3] https://github.com/mszyprow/linux/tree/v6.0-dsi-v4-reworked


> Jagan.
>
> Jagan Teki (10):
>    drm: bridge: Add Samsung DSIM bridge driver
>    drm: bridge: samsung-dsim: Lookup OF-graph or Child node devices
>    drm: bridge: samsung-dsim: Mark PHY as optional
>    drm: bridge: samsung-dsim: Handle proper DSI host initialization
>    drm: bridge: samsung-dsim: Add atomic_check
>    drm: bridge: samsung-dsim: Add platform PLL_P (PMS_P) offset
>    drm: bridge: samsung-dsim: Add atomic_get_input_bus_fmts
>    drm: bridge: samsung-dsim: Add input_bus_flags
>    dt-bindings: display: exynos: dsim: Add NXP i.MX8MM support
>    drm: bridge: samsung-dsim: Add i.MX8MM support
>
> Marek Szyprowski (1):
>    drm: exynos: dsi: Restore proper bridge chain order
>
>   .../bindings/display/exynos/exynos_dsim.txt   |    1 +
>   MAINTAINERS                                   |    9 +
>   drivers/gpu/drm/bridge/Kconfig                |   12 +
>   drivers/gpu/drm/bridge/Makefile               |    1 +
>   drivers/gpu/drm/bridge/samsung-dsim.c         | 1840 +++++++++++++++++
>   drivers/gpu/drm/exynos/Kconfig                |    1 +
>   drivers/gpu/drm/exynos/exynos_drm_dsi.c       | 1766 +---------------
>   include/drm/bridge/samsung-dsim.h             |  115 ++
>   8 files changed, 2092 insertions(+), 1653 deletions(-)
>   create mode 100644 drivers/gpu/drm/bridge/samsung-dsim.c
>   create mode 100644 include/drm/bridge/samsung-dsim.h
>
Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

