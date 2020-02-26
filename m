Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A008416FBB5
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2020 11:11:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBB176E438;
	Wed, 26 Feb 2020 10:11:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 268CD6E438
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2020 10:11:34 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200226101132euoutp024891b862bae2699b14d85e27375a51b7~27BSqVU2a1664416644euoutp02m
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2020 10:11:32 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200226101132euoutp024891b862bae2699b14d85e27375a51b7~27BSqVU2a1664416644euoutp02m
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1582711892;
 bh=UBpofmB7cyohqn9qMM/gg+/dCQW29TJalq8BZ/tUlhk=;
 h=From:To:Cc:Subject:Date:References:From;
 b=IWGHFdaEjyasRs8IfZThChuaii6PxqZh9Rx/SAeYMkYcK+NQAFkLtPa3TQQmKYEgT
 z3Ezb5uXWDR/kzDPjJ3LpKLQ/osdvVA0gLQPbPanWN/81nJn8sWBp3SKqjok8JG47y
 q8arzFKz9gYU3UEZK9ndnnbPadGtms3hsquzLKT4=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200226101132eucas1p257542d8d426e1cac48279d64a5677610~27BSU0A7D0356403564eucas1p2p;
 Wed, 26 Feb 2020 10:11:32 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 4A.64.60679.454465E5; Wed, 26
 Feb 2020 10:11:32 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200226101131eucas1p2a30aae3cfb0df9aa36c4ddc34f513874~27BSEo10Q0356403564eucas1p2o;
 Wed, 26 Feb 2020 10:11:31 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200226101131eusmtrp17239bd7fdbb0c2fe15e4c6b1f5b74ab6~27BSD-9WJ1551515515eusmtrp1t;
 Wed, 26 Feb 2020 10:11:31 +0000 (GMT)
X-AuditID: cbfec7f4-0e5ff7000001ed07-28-5e5644547e9c
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 30.2C.07950.354465E5; Wed, 26
 Feb 2020 10:11:31 +0000 (GMT)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200226101131eusmtip2203f261bed56d1a1752c0747e7d3c445~27BRogrl30717107171eusmtip2x;
 Wed, 26 Feb 2020 10:11:31 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Subject: [PATCH] drm/exynos: dsi: silence warning about regulators during
 deferred probe
Date: Wed, 26 Feb 2020 11:11:19 +0100
Message-Id: <20200226101119.16578-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrMIsWRmVeSWpSXmKPExsWy7djP87ohLmFxBteeclncWneO1WLjjPWs
 Fle+vmezmHR/AovFjPP7mCzWHrnLbjFj8ks2B3aP+93HmTz6tqxi9Pi8SS6AOYrLJiU1J7Ms
 tUjfLoEr4+KEi4wFG9grWlYeYWlgnM7WxcjBISFgIvGhoaaLkYtDSGAFo0TjzF/MXYycQM4X
 RolrV5Ig7M+MEucXpIPYIPVHWidC1SxnlGheogbRDFS/d9EeFpAEm4ChRNfbLjYQW0TATaLp
 8ExWkCJmgeuMEt9+LGIHSQgLREk0v1oLNolFQFVi1rI7TCA2r4CtxPxNzcwQ2+QlVm84wAzS
 LCFwhE1i/58/7BAJF4m2h3PZIGxhiVfHt0DFZSROT+5hgWhoZpR4eG4tO4TTwyhxuWkGI0SV
 tcSdc7/AAcAsoCmxfpc+RNhR4tjru6yQcOGTuPFWECTMDGRO2jadGSLMK9HRJgRRrSYx6/g6
 uLUHL1yCutlDYkvXSzZICMVKzDjxn3kCo9wshF0LGBlXMYqnlhbnpqcWG+WllusVJ+YWl+al
 6yXn525iBEb96X/Hv+xg3PUn6RCjAAejEg/vC87QOCHWxLLiytxDjBIczEoivBu/AoV4UxIr
 q1KL8uOLSnNSiw8xSnOwKInzGi96GSskkJ5YkpqdmlqQWgSTZeLglGpglCoq529rYdz6ZM+1
 PCszf8X3eR0C/izRi8v2PnjZYV785Trj1eyPu6/snDO3sUpy0pI7Wh+bqnf+KBSb/lVY4P7u
 6xv7g2ac+hEZ2LPpHv/WgJ/vlerc5ihsTeVq6tE+0qUuMvnc8iw15RIJO7075VV9HLaGYZ4r
 /WaYvSliDL3yaUbTnMx3SizFGYmGWsxFxYkAAzt/rPYCAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrDLMWRmVeSWpSXmKPExsVy+t/xe7rBLmFxBp9/GlvcWneO1WLjjPWs
 Fle+vmezmHR/AovFjPP7mCzWHrnLbjFj8ks2B3aP+93HmTz6tqxi9Pi8SS6AOUrPpii/tCRV
 ISO/uMRWKdrQwkjP0NJCz8jEUs/Q2DzWyshUSd/OJiU1J7MstUjfLkEv4+KEi4wFG9grWlYe
 YWlgnM7WxcjJISFgInGkdSJzFyMXh5DAUkaJZavvsEMkZCROTmtghbCFJf5c62KDKPrEKLH2
 6CqwbjYBQ4mut11gtoiAh0Tzt+PsIEXMArcZJZZ+mMcCkhAWiJBY97cfrIhFQFVi1rI7TCA2
 r4CtxPxNzcwQG+QlVm84wDyBkWcBI8MqRpHU0uLc9NxiI73ixNzi0rx0veT83E2MwJDbduzn
 lh2MXe+CDzEKcDAq8fC+4AyNE2JNLCuuzD3EKMHBrCTCu/ErUIg3JbGyKrUoP76oNCe1+BCj
 KdDyicxSosn5wHjIK4k3NDU0t7A0NDc2NzazUBLn7RA4GCMkkJ5YkpqdmlqQWgTTx8TBKdXA
 uNpJ7WX0sbeWT0tYG6OFoqzuzbULWPj7fZv40bWVwY7qGVO9vU8+bZt8LMPCsu+8W3+NL2/Z
 rg8qveraf9Y9PzKjPJHj1qkzondmOzc9uulvn6cnWJT2vuGe3b/Plrt+XDhuLbkk+vuqu3xX
 hTu5RWdERDaJrgo0Ozf9XfWvTZIrD3guk6psUWIpzkg01GIuKk4EANYU1BVPAgAA
X-CMS-MailID: 20200226101131eucas1p2a30aae3cfb0df9aa36c4ddc34f513874
X-Msg-Generator: CA
X-RootMTR: 20200226101131eucas1p2a30aae3cfb0df9aa36c4ddc34f513874
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200226101131eucas1p2a30aae3cfb0df9aa36c4ddc34f513874
References: <CGME20200226101131eucas1p2a30aae3cfb0df9aa36c4ddc34f513874@eucas1p2.samsung.com>
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

Don't confuse user with meaningless warning about failure in getting
regulators in case of deferred probe.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index 08a8ce3f499c..a85365c56d4d 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -1773,8 +1773,9 @@ static int exynos_dsi_probe(struct platform_device *pdev)
 	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(dsi->supplies),
 				      dsi->supplies);
 	if (ret) {
-		dev_info(dev, "failed to get regulators: %d\n", ret);
-		return -EPROBE_DEFER;
+		if (ret != -EPROBE_DEFER)
+			dev_info(dev, "failed to get regulators: %d\n", ret);
+		return ret;
 	}
 
 	dsi->clks = devm_kcalloc(dev,
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
