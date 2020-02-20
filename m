Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F05B8165D9D
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2020 13:30:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ED7C6ED57;
	Thu, 20 Feb 2020 12:30:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0319E6ED57
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2020 12:30:24 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200220123023euoutp0192092178c3d111a68ac56c82f60398c9~1HCzqafu91369713697euoutp01p
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2020 12:30:23 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200220123023euoutp0192092178c3d111a68ac56c82f60398c9~1HCzqafu91369713697euoutp01p
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1582201823;
 bh=p5CpTRZbsYtK0QYL0iltTMJJUAAyPjK8ae5FCrxPunI=;
 h=From:To:Cc:Subject:Date:References:From;
 b=SrMwNnlsIJoZyXQfNu8LgEOHF+lcLe1OIHDR7zm3uOlJ/gFFyI7RiyT8gfJZ2TtSg
 8UEd1cFly0PN+6C3/dTl0xyTWuUGUaS5+dVygBquIjtBHkE8DRdO/bUjXJJtEGZq4D
 ZOpAuhtjSqvXQYOxMECBylLfvo+el6Y8fESL0X7M=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200220123023eucas1p2f100ff0bbda584a91c58756d7be9bd29~1HCzcMg3f1885918859eucas1p2O;
 Thu, 20 Feb 2020 12:30:23 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id F4.A3.61286.EDB7E4E5; Thu, 20
 Feb 2020 12:30:23 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200220123022eucas1p21d015e2880680ae1c16e4b2a1d0ebb18~1HCzFR1jy0175401754eucas1p2l;
 Thu, 20 Feb 2020 12:30:22 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200220123022eusmtrp1e2bd3573e6b7837c03c3d570b76627d9~1HCzEsiyG2842728427eusmtrp1H;
 Thu, 20 Feb 2020 12:30:22 +0000 (GMT)
X-AuditID: cbfec7f2-ef1ff7000001ef66-80-5e4e7bde8f07
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id BD.D3.07950.EDB7E4E5; Thu, 20
 Feb 2020 12:30:22 +0000 (GMT)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200220123022eusmtip155bf8d78f81beb88588fc75f1eb07143~1HCyphCju2555725557eusmtip1B;
 Thu, 20 Feb 2020 12:30:22 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Subject: [PATCH] drm/exynos: dsi: fix workaround for the legacy clock name
Date: Thu, 20 Feb 2020 13:30:12 +0100
Message-Id: <20200220123012.19179-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrKIsWRmVeSWpSXmKPExsWy7djPc7r3q/3iDJ4cY7K4te4cq8XGGetZ
 La58fc9mMen+BBaLGef3MVmsPXKX3WLG5JdsDuwe97uPM3n0bVnF6PF5k1wAcxSXTUpqTmZZ
 apG+XQJXRs/uC2wFj8Urnlz+y9bAuEuki5GTQ0LARGLhrvNsXYxcHEICKxgl7k5/ygjhfGGU
 uPS9AyrzmVHiyKJjbDAti1+sYoZILAdK/N6N0PLw20YmkCo2AUOJrrddYB0iAm4STYdnsoIU
 MQtcZ5T49mMRO0hCWMBL4sqiq0AJDg4WAVWJdZfjQUxeAVuJ/7f0IZbJS6zecABsmYTACTaJ
 t+evs0MkXCSWHvoKdZGwxKvjW6DiMhKnJ/ewQDQ0Ax10bi07hNPDKHG5aQYjRJW1xJ1zv9hA
 tjELaEqs3wW1zVHi5cHrLCBhCQE+iRtvBUHCzEDmpG3TmSHCvBIdbUIQ1WoSs46vg1t78MIl
 ZgjbQ6KndRY4GIQEYiWefnrHNoFRbhbCrgWMjKsYxVNLi3PTU4sN81LL9YoTc4tL89L1kvNz
 NzECI//0v+OfdjB+vZR0iFGAg1GJh/eDum+cEGtiWXFl7iFGCQ5mJRFeNR6/OCHelMTKqtSi
 /Pii0pzU4kOM0hwsSuK8xotexgoJpCeWpGanphakFsFkmTg4pRoYJ2Qv/9Zz6aBEd+T3DTYu
 4iICl+9u2PJAt9h77e7GdZonbqXn/HtrLXz4fcy5RId2lePOqsvOf16Wenubu+H3rotc+vP8
 C70jfvA9/Ptmzo/cl6En40W38ywpsD950GrHg0yvTrWtJ489mloa+Gn20k97Vm35XrAsWei5
 g9IMr3eL2pv7NqZ3BSqxFGckGmoxFxUnAgDDZjXk+AIAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrFLMWRmVeSWpSXmKPExsVy+t/xu7r3qv3iDA7PVbe4te4cq8XGGetZ
 La58fc9mMen+BBaLGef3MVmsPXKX3WLG5JdsDuwe97uPM3n0bVnF6PF5k1wAc5SeTVF+aUmq
 QkZ+cYmtUrShhZGeoaWFnpGJpZ6hsXmslZGpkr6dTUpqTmZZapG+XYJeRs/uC2wFj8Urnlz+
 y9bAuEuki5GTQ0LARGLxi1XMXYxcHEICSxklZtzeywSRkJE4Oa2BFcIWlvhzrYsNougTo8Sb
 Gb1sIAk2AUOJrrddYLaIgIdE87fj7CBFzAK3GSWWfpjHApIQFvCSuLLoKtAkDg4WAVWJdZfj
 QUxeAVuJ/7f0IebLS6zecIB5AiPPAkaGVYwiqaXFuem5xUZ6xYm5xaV56XrJ+bmbGIHhtu3Y
 zy07GLveBR9iFOBgVOLhnaHqGyfEmlhWXJl7iFGCg1lJhFeNxy9OiDclsbIqtSg/vqg0J7X4
 EKMp0OqJzFKiyfnAWMgriTc0NTS3sDQ0NzY3NrNQEuftEDgYIySQnliSmp2aWpBaBNPHxMEp
 1cBoXr+7Vsb2t+Oyxf+Wb+IrN1jQODuAy8nZ8MCc1s5OduVHBj/lnu498OnZEqnJh/03Jjbf
 /PDmF+es45Jm0+QX9cb8f3Q4tvmVgcbTRbMMGwXYjzL4nuDP29Pi+pJhhkCgfODTKk7Z9Y+m
 x/6a+Spi+xYLheKCD+LecjkiNQuir7hu15PmTNuuxFKckWioxVxUnAgAAzj1gE0CAAA=
X-CMS-MailID: 20200220123022eucas1p21d015e2880680ae1c16e4b2a1d0ebb18
X-Msg-Generator: CA
X-RootMTR: 20200220123022eucas1p21d015e2880680ae1c16e4b2a1d0ebb18
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200220123022eucas1p21d015e2880680ae1c16e4b2a1d0ebb18
References: <CGME20200220123022eucas1p21d015e2880680ae1c16e4b2a1d0ebb18@eucas1p2.samsung.com>
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
Cc: Andrzej Hajda <a.hajda@samsung.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Writing to the built-in strings arrays doesn't work if driver is loaded
as kernel module. This is also considered as a bad pattern. Fix this by
adding a call to clk_get() with legacy clock name. This fixes following
kernel oops if driver is loaded as module:

Unable to handle kernel paging request at virtual address bf047978
 pgd = (ptrval)
 [bf047978] *pgd=59344811, *pte=5903c6df, *ppte=5903c65f
 Internal error: Oops: 80f [#1] SMP ARM
 Modules linked in: mc exynosdrm(+) analogix_dp rtc_s3c exynos_ppmu i2c_gpio
 CPU: 1 PID: 212 Comm: systemd-udevd Not tainted 5.6.0-rc2-next-20200219 #326
 videodev: Linux video capture interface: v2.00
 Hardware name: Samsung Exynos (Flattened Device Tree)
 PC is at exynos_dsi_probe+0x1f0/0x384 [exynosdrm]
 LR is at exynos_dsi_probe+0x1dc/0x384 [exynosdrm]
 ...
 Process systemd-udevd (pid: 212, stack limit = 0x(ptrval))
 ...
 [<bf03cf14>] (exynos_dsi_probe [exynosdrm]) from [<c09b1ca0>] (platform_drv_probe+0x6c/0xa4)
 [<c09b1ca0>] (platform_drv_probe) from [<c09afcb8>] (really_probe+0x210/0x350)
 [<c09afcb8>] (really_probe) from [<c09aff74>] (driver_probe_device+0x60/0x1a0)
 [<c09aff74>] (driver_probe_device) from [<c09b0254>] (device_driver_attach+0x58/0x60)
 [<c09b0254>] (device_driver_attach) from [<c09b02dc>] (__driver_attach+0x80/0xbc)
 [<c09b02dc>] (__driver_attach) from [<c09ade00>] (bus_for_each_dev+0x68/0xb4)
 [<c09ade00>] (bus_for_each_dev) from [<c09aefd8>] (bus_add_driver+0x130/0x1e8)
 [<c09aefd8>] (bus_add_driver) from [<c09b0d64>] (driver_register+0x78/0x110)
 [<c09b0d64>] (driver_register) from [<bf038558>] (exynos_drm_init+0xe8/0x11c [exynosdrm])
 [<bf038558>] (exynos_drm_init [exynosdrm]) from [<c0302fa8>] (do_one_initcall+0x50/0x220)
 [<c0302fa8>] (do_one_initcall) from [<c03dd02c>] (do_init_module+0x60/0x210)
 [<c03dd02c>] (do_init_module) from [<c03dbf44>] (load_module+0x1c0c/0x2310)
 [<c03dbf44>] (load_module) from [<c03dc85c>] (sys_finit_module+0xac/0xbc)
 [<c03dc85c>] (sys_finit_module) from [<c0301000>] (ret_fast_syscall+0x0/0x54)
 Exception stack(0xd979bfa8 to 0xd979bff0)
 ...
 ---[ end trace db16efe05faab470 ]---

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index 33628d85edad..08a8ce3f499c 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -1787,9 +1787,10 @@ static int exynos_dsi_probe(struct platform_device *pdev)
 		dsi->clks[i] = devm_clk_get(dev, clk_names[i]);
 		if (IS_ERR(dsi->clks[i])) {
 			if (strcmp(clk_names[i], "sclk_mipi") == 0) {
-				strcpy(clk_names[i], OLD_SCLK_MIPI_CLK_NAME);
-				i--;
-				continue;
+				dsi->clks[i] = devm_clk_get(dev,
+							OLD_SCLK_MIPI_CLK_NAME);
+				if (!IS_ERR(dsi->clks[i]))
+					continue;
 			}
 
 			dev_info(dev, "failed to get the clock: %s\n",
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
