Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 457862129B8
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jul 2020 18:38:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB8486EB29;
	Thu,  2 Jul 2020 16:37:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F386B6EB26
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jul 2020 16:37:56 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200702163755euoutp021bd5636a09a8df2342796094a447d3be~d-N55EneJ0927409274euoutp02b
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jul 2020 16:37:55 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200702163755euoutp021bd5636a09a8df2342796094a447d3be~d-N55EneJ0927409274euoutp02b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1593707875;
 bh=9eFGasFpZoy1m8W9WjbUKwjzKIaHVFdGF6mv6LPz2lg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VkevyPzG5KWzdoUmE+adTpuh+J9+okxn6C4JUMx2pRhO5XIFKUDcswr7FVRWAsq7X
 HLmhgTLB0udP2SY1HeRVBqqOw9gdQcULo8cA9eB1249v78mPGHAN7uiW9bV7dyp+qO
 JsTYr1IZ1El6ig9yczw2brGC5f7l5LxPx7uvaFxg=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200702163755eucas1p1d0750e603bcba8b479c48338850a4aa9~d-N5sBVj80768407684eucas1p1q;
 Thu,  2 Jul 2020 16:37:55 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id D2.6A.06318.36D0EFE5; Thu,  2
 Jul 2020 17:37:55 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200702163754eucas1p2bbe44897234a3e39dcd10b23e536a927~d-N5N8tQJ2216322163eucas1p2w;
 Thu,  2 Jul 2020 16:37:54 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200702163754eusmtrp1d8379de6f74a2638f404d0d323ce65be~d-N5NSKEs1333013330eusmtrp12;
 Thu,  2 Jul 2020 16:37:54 +0000 (GMT)
X-AuditID: cbfec7f5-371ff700000018ae-54-5efe0d633873
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id EF.9B.06314.26D0EFE5; Thu,  2
 Jul 2020 17:37:54 +0100 (BST)
Received: from AMDC3061.digital.local (unknown [106.120.51.75]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200702163754eusmtip25bb47ebc4851df54f50e39f623e80be2~d-N4jic0w2767227672eusmtip2V;
 Thu,  2 Jul 2020 16:37:54 +0000 (GMT)
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
To: georgi.djakov@linaro.org, cw00.choi@samsung.com, krzk@kernel.org
Subject: [PATCH RFC v6 3/6] PM / devfreq: exynos-bus: Add registration of
 interconnect child device
Date: Thu,  2 Jul 2020 18:37:21 +0200
Message-Id: <20200702163724.2218-4-s.nawrocki@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200702163724.2218-1-s.nawrocki@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA0WSe0hTURzHObu7d9fVjeu0PExLGC3KyCkWHR+UhdggAiH6J9NaevHRnLKp
 pZkPQrP5RAnFd2XkA19TxNRpzuVIcxaKCVr7w0rtwShnoObM61X87/v7ns/39z0cDomJdLiY
 jFElMmqVQikhhPzukVXzqQjKHu61vuiILDXZAHWUt+Hoo20BR7VGM46mVqwEKtPrCFRiKeaj
 iYl2AdLNT+NosreKQMsFRoDKJwZ4qMX4SYBmsxoIlK03CtDwz0c4Ki9dIgId5bqmx4R8brqf
 kFvyTDx5Z32GvLCrCciXdUdCiOvCgEhGGZPMqGXnbgmjdRX/8IR1+l6JrR3PBH8oLXAgIX0a
 /v28AbRASIroBgB7fr8TcIMNwNr6aoylRPQygB1FQbuJSWvjTuIlgCZj8V5i2jqMsxRBe8OC
 N4WA1c50EMz5WsNnIYzOxWB3T8n2WieagVP6le0An5bCygUDwWqK9oP5Qz18rs4dNre/3uJJ
 0oH2h8PLFLsH0iMC2L+oxTgmCNrMjTu8E/xu6hJw2g2OlebzucBDAPP7ZgXcUAygxVQHOMof
 zpnXCLYBo0/Atl4ZZ1+AOd/sOGtD+gCc+eXI2tiWLOkuwzibgrk5Io4+CtebynicFsO8L5s7
 15HDVW0Nj3ugQgDn35eBYuBesVdWB0ATcGGSNHFRjMZHxdz11CjiNEmqKM+I+Dgd2PpJY3bT
 Sg8Y+HfbAGgSSPZTi283wkW4IlmTEmcAkMQkztTF8bFwERWpSEll1PE31UlKRmMAriRf4kL5
 PFsKE9FRikTmDsMkMOrdUx7pIM4El2whg4R9KP384GzKj6xXz8OkWR8OInvr4XSPzrQXrY0x
 N1oaU6q0M8fazB4WcavXqHNq4dwTa+d69abMT5Z8ZiAgNk0lvdKReKgi1BCa7H7/mlvk8QfN
 qYIiiVjroOu7qm85KRKu7Qseeqo/qxx1lUq144GV/ZeDfRdDrRm+sRK+Jlrh7YGpNYr/lTaK
 60UDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprIIsWRmVeSWpSXmKPExsVy+t/xe7pJvP/iDO7vMra4P6+V0WLjjPWs
 Fte/PGe1mH/kHKvFla/v2Sym793EZjHp/gQWi/PnN7BbbHp8jdXi8q45bBafe48wWsw4v4/J
 Yu2Ru+wWtxtXsFm07j3CbnH4TTurxYzJL9kcBD02repk87hzbQ+bx/3u40wem5fUe/RtWcXo
 8XmTXABblJ5NUX5pSapCRn5xia1StKGFkZ6hpYWekYmlnqGxeayVkamSvp1NSmpOZllqkb5d
 gl7Gpll/WAt+C1RM+rKBtYHxE28XIyeHhICJxOX3Kxm7GLk4hASWMkpcOTyBqYuRAyghJTG/
 RQmiRljiz7UuNoiaT4wSPx//YQdJsAkYSvQe7WMEsUUEPCROta5lBbGZBWYwS5yeZQpiCwsk
 S0x5vp4FxGYRUJWY/fwQG4jNK2Al0XNwBwvEAnmJ1RsOMIPs5RSwljj8Gew2IaCSY/0L2Ccw
 8i1gZFjFKJJaWpybnltsqFecmFtcmpeul5yfu4kRGB3bjv3cvIPx0sbgQ4wCHIxKPLwTjv+N
 E2JNLCuuzD3EKMHBrCTC63T2dJwQb0piZVVqUX58UWlOavEhRlOgmyYyS4km5wMjN68k3tDU
 0NzC0tDc2NzYzEJJnLdD4GCMkEB6YklqdmpqQWoRTB8TB6dUA2N3lklPkbbk7ndK+YZPngu1
 rdrAxHho9x+Hb1KGVVLh0R2atets/vdc50rL5WlZLX9xwhOpje+m7VE1dF7/8fLEBV22v7JK
 vrzVfOWW7sp4yfKr3W93nX69ZVsmFvOfvXq1PGZ/+4770Smrf0z/uH6TXca0s2EukrWnpj94
 rDiHL2fd/N1GN94osRRnJBpqMRcVJwIA5ng6eKQCAAA=
X-CMS-MailID: 20200702163754eucas1p2bbe44897234a3e39dcd10b23e536a927
X-Msg-Generator: CA
X-RootMTR: 20200702163754eucas1p2bbe44897234a3e39dcd10b23e536a927
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200702163754eucas1p2bbe44897234a3e39dcd10b23e536a927
References: <20200702163724.2218-1-s.nawrocki@samsung.com>
 <CGME20200702163754eucas1p2bbe44897234a3e39dcd10b23e536a927@eucas1p2.samsung.com>
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
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 b.zolnierkie@samsung.com, linux-pm@vger.kernel.org, sw0312.kim@samsung.com,
 a.swigon@samsung.com, robh+dt@kernel.org, linux-kernel@vger.kernel.org,
 myungjoo.ham@samsung.com, dri-devel@lists.freedesktop.org,
 s.nawrocki@samsung.com, linux-arm-kernel@lists.infradead.org,
 m.szyprowski@samsung.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch adds registration of a child platform device for the exynos
interconnect driver. It is assumed that the interconnect provider will
only be needed when #interconnect-cells property is present in the bus
DT node, hence the child device will be created only when such a property
is present.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Acked-by: Chanwoo Choi <cw00.choi@samsung.com>
---
Changes for v6:
 - none.

Changes for v5:
 - new patch.
---
 drivers/devfreq/exynos-bus.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/devfreq/exynos-bus.c b/drivers/devfreq/exynos-bus.c
index 8fa8eb5..856e37d 100644
--- a/drivers/devfreq/exynos-bus.c
+++ b/drivers/devfreq/exynos-bus.c
@@ -24,6 +24,7 @@

 struct exynos_bus {
 	struct device *dev;
+	struct platform_device *icc_pdev;

 	struct devfreq *devfreq;
 	struct devfreq_event_dev **edev;
@@ -156,6 +157,8 @@ static void exynos_bus_exit(struct device *dev)
 	if (ret < 0)
 		dev_warn(dev, "failed to disable the devfreq-event devices\n");

+	platform_device_unregister(bus->icc_pdev);
+
 	dev_pm_opp_of_remove_table(dev);
 	clk_disable_unprepare(bus->clk);
 	if (bus->opp_table) {
@@ -168,6 +171,8 @@ static void exynos_bus_passive_exit(struct device *dev)
 {
 	struct exynos_bus *bus = dev_get_drvdata(dev);

+	platform_device_unregister(bus->icc_pdev);
+
 	dev_pm_opp_of_remove_table(dev);
 	clk_disable_unprepare(bus->clk);
 }
@@ -431,6 +436,18 @@ static int exynos_bus_probe(struct platform_device *pdev)
 	if (ret < 0)
 		goto err;

+	/* Create child platform device for the interconnect provider */
+	if (of_get_property(dev->of_node, "#interconnect-cells", NULL)) {
+		    bus->icc_pdev = platform_device_register_data(
+						dev, "exynos-generic-icc",
+						PLATFORM_DEVID_AUTO, NULL, 0);
+
+		    if (IS_ERR(bus->icc_pdev)) {
+			    ret = PTR_ERR(bus->icc_pdev);
+			    goto err;
+		    }
+	}
+
 	max_state = bus->devfreq->profile->max_state;
 	min_freq = (bus->devfreq->profile->freq_table[0] / 1000);
 	max_freq = (bus->devfreq->profile->freq_table[max_state - 1] / 1000);
--
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
