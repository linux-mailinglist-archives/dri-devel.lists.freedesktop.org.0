Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBEB8498175
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jan 2022 14:53:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5D4E10E990;
	Mon, 24 Jan 2022 13:53:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF8D510E990
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 13:53:01 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20220124135300euoutp024b24ada413cad36d6de738e64316557b~NOT6XDDd-1645716457euoutp02E
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 13:53:00 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20220124135300euoutp024b24ada413cad36d6de738e64316557b~NOT6XDDd-1645716457euoutp02E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1643032380;
 bh=0YQoKMTIRPHxjEEi8hAXo/s/AqCaIXQ1AcDjdTdMG5w=;
 h=From:To:Cc:Subject:Date:References:From;
 b=V07aYeTSbQdAP5335O/BtMfTszDDVWBpakxKrbgbtaoJ1Qx3WEobKY8BKGdtwBQSh
 mkcmBbEqqmlRqDj0pE3errBuVcGID9japBeNu4n8MVurE4EmCidq3Yr1NGsTIDK2r8
 H4FlsN5I0S9cFTA6I8Eo1CqmwIU1M7VqE4ib6h+0=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20220124135259eucas1p10978704fdcbbecf21eabd3b7610174e0~NOT5_NJcd1133911339eucas1p1Z;
 Mon, 24 Jan 2022 13:52:59 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 6F.60.10260.B3FAEE16; Mon, 24
 Jan 2022 13:52:59 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20220124135259eucas1p1ed3c76ef23d30afe620e06a419540c9e~NOT5k-JUx1356113561eucas1p1B;
 Mon, 24 Jan 2022 13:52:59 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20220124135259eusmtrp27dcaf37956b42441147c7d94055af2f2~NOT5b7U4J2196721967eusmtrp2M;
 Mon, 24 Jan 2022 13:52:59 +0000 (GMT)
X-AuditID: cbfec7f5-bf3ff70000002814-55-61eeaf3baa73
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id AA.FC.09404.A3FAEE16; Mon, 24
 Jan 2022 13:52:58 +0000 (GMT)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20220124135258eusmtip1a45bdecf6d8eddeb1ff66f723a610f20~NOT4-rEXF1821618216eusmtip1b;
 Mon, 24 Jan 2022 13:52:58 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Subject: [PATCH] drm/exynos: Search for TE-gpio in DSI panel's node
Date: Mon, 24 Jan 2022 14:52:46 +0100
Message-Id: <20220124135246.6998-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrPIsWRmVeSWpSXmKPExsWy7djP87rW698lGtz8Jmtx5et7NotJ9yew
 WGx8+4PJYsb5fUwWa4/cZbdoa7nObjFj8ks2B3aPWQ29bB73u48zefRtWcXo8eBjqcfnTXIB
 rFFcNimpOZllqUX6dglcGT+PLWcs+MtRcW2SXAPjRfYuRk4OCQETib2/mxm7GLk4hARWMEo8
 P/qVFcL5wijxcP0SJgjnM6NE44LLTDAts/f/ZIFILGeU+P50FgtIAqzl/xOwuWwChhJdb7vY
 QGwRATeJpsMzwcYyC7xhlPi5aDZQEQeHsICzxMSJfiA1LAKqEg1fVjOD2LwCNhLnLz6Buk9e
 YvWGA8wgvRICf9klLh3qYYFIuEisfT+BEcIWlnh1fAtUg4zE/53zmSAamoF+OLeWHcLpYZS4
 3DQDqsNa4s65X2wgVzALaEqs36UPYkoIOEo8e6ULYfJJ3HgrCFLMDGRO2jadGSLMK9HRJgQx
 Q01i1vF1cFsPXrjEDGF7SHz+1cQICZJYidbphxgnMMrNQli1gJFxFaN4amlxbnpqsXFearle
 cWJucWleul5yfu4mRmAaOP3v+NcdjCtefdQ7xMjEwXiIUYKDWUmEtyrlXaIQb0piZVVqUX58
 UWlOavEhRmkOFiVx3uTMDYlCAumJJanZqakFqUUwWSYOTqkGptXdEdfXSRwT1g3wjbrA2nlp
 u/aP/f8UPU5/Krn++VtJSe+GKdMqZ7n9nmlTPNfT2cL1Z05Ztd3BI753bnOsriiQ+dq34NjW
 2y8+1l2vE998/5TP39Rr+wx+v7vcWnrl/f0VBr+WmXU7f+jiz1ttaKgonXDRen+NiPRWXv1H
 eazin1dF2C7vsYnu40ySsH6U9P7tLb2DkrtElr3IK391r5Wzsu05/8uFq2Ydjms2DGf2+JV3
 z3gGl8zLgldHtv9aqSgz4/P+czeWRi59cEGa62yMgePnpccPXDPcPy13w94VdkFMuU4BK8rT
 zkR77qq4x7L2cubUol9LQ+OWvy+POadXy6JT8DlB08O1vKJVepMSS3FGoqEWc1FxIgDvVoiw
 cgMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrKLMWRmVeSWpSXmKPExsVy+t/xu7pW698lGpyZa2Zx5et7NotJ9yew
 WGx8+4PJYsb5fUwWa4/cZbdoa7nObjFj8ks2B3aPWQ29bB73u48zefRtWcXo8eBjqcfnTXIB
 rFF6NkX5pSWpChn5xSW2StGGFkZ6hpYWekYmlnqGxuaxVkamSvp2NimpOZllqUX6dgl6GT+P
 LWcs+MtRcW2SXAPjRfYuRk4OCQETidn7f7J0MXJxCAksZZQ43jMLKiEjcXJaAyuELSzx51oX
 G0TRJ0aJRdM+M4Mk2AQMJbregiQ4OUQEPCSavx0Ha2YWeMcocW6ZbBcjB4ewgLPExIl+IGEW
 AVWJhi+rwVp5BWwkzl98ArVLXmL1hgPMExh5FjAyrGIUSS0tzk3PLTbSK07MLS7NS9dLzs/d
 xAgMv23Hfm7Zwbjy1Ue9Q4xMHIyHGCU4mJVEeKtS3iUK8aYkVlalFuXHF5XmpBYfYjQF2jeR
 WUo0OR8YAXkl8YZmBqaGJmaWBqaWZsZK4ryeBR2JQgLpiSWp2ampBalFMH1MHJxSDUxsNbuk
 zwf+El2+ikFiS11O68L598WzG8+ZxT/RspydcsXOzusyA0OSbXVvhtM+lRfvmRZ9fJXPZfc2
 1n3Wd/mJ31bqWrn3LZTe8nyN4PXlJZ9Kprt88btVL6dxuHgFR3gEz7zt3tm/ivvsQjlWCSbU
 Lrpdu1C4zFueZeuO0keX0u7ftNA0X3j2esP3Scu1vukUnL6QV//E+Lro3dZ4PcHpqcwav4KS
 XS/t9cwOijii9XbZdV+FT7VtzAVKze1iL9Sjs8LO7yg8vXR7hiwnx+7/x0s0N0uvqT72i2fj
 mU+nGUw/u8VvfOr5dKfyzuV/09crhxx9+eHa2+iZKiud7lksXqnVb8C8euovoUf23xcrsRRn
 JBpqMRcVJwIAwde8nMgCAAA=
X-CMS-MailID: 20220124135259eucas1p1ed3c76ef23d30afe620e06a419540c9e
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20220124135259eucas1p1ed3c76ef23d30afe620e06a419540c9e
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20220124135259eucas1p1ed3c76ef23d30afe620e06a419540c9e
References: <CGME20220124135259eucas1p1ed3c76ef23d30afe620e06a419540c9e@eucas1p1.samsung.com>
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
Cc: =?UTF-8?q?Ma=C3=ADra=20Canal?= <maira.canal@usp.br>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TE-gpio, if defined, is placed in the panel's node, not the parent DSI
node. Change the devm_gpiod_get_optional() to gpiod_get_optional() and
pass proper device node to it. The code already has a proper cleanup
path, so it looks that the devm_* variant has been applied assidentally
during the conversion to gpiod API.

Fixes: ee6c8b5afa62 ("drm/exynos: Replace legacy gpio interface for gpiod interface")
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index 14ebbb124852..d13f5e3a030d 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -1334,7 +1334,7 @@ static int exynos_dsi_register_te_irq(struct exynos_dsi *dsi,
 	int ret;
 	int te_gpio_irq;
 
-	dsi->te_gpio = devm_gpiod_get_optional(dsi->dev, "te", GPIOD_IN);
+	dsi->te_gpio = gpiod_get_optional(panel, "te", GPIOD_IN);
 	if (!dsi->te_gpio) {
 		return 0;
 	} else if (IS_ERR(dsi->te_gpio)) {
-- 
2.17.1

