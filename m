Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 931A021D8D3
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jul 2020 16:43:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EA1D6E13D;
	Mon, 13 Jul 2020 14:43:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C40D089FC5
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jul 2020 14:43:35 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200713144334euoutp02ff83ec39c6b07b3a014e172ae1c9b3c8~hVwM-5meM2797527975euoutp02D
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jul 2020 14:43:34 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200713144334euoutp02ff83ec39c6b07b3a014e172ae1c9b3c8~hVwM-5meM2797527975euoutp02D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1594651414;
 bh=B440VBDLdLWidVVzamEgT8cxdzc8DwUiqZOX84CTZVs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gWjASbmbzzb+8uuz9RTlTZQcDi0fhhyVDMZjKdKi8ug5c5H41YeN4+baOD8bEaITp
 jN6NXnKCX+xGKfkBvywaUqCug2WDiokHY/HLjkLKWMZAgZAVEqR8MWJMZIwtd/Qmu8
 hjx8xis0wpMsEZjgHD71J166gg88itkA3/ihSkWw=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200713144334eucas1p27b8c28229a62306997a8cb3666d284a2~hVwMqhWLH0713507135eucas1p2p;
 Mon, 13 Jul 2020 14:43:34 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 9E.E5.06456.6137C0F5; Mon, 13
 Jul 2020 15:43:34 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200713144333eucas1p1f393b280cda5eead4e7ca0a005c8a4db~hVwMVP1Mg0193801938eucas1p1I;
 Mon, 13 Jul 2020 14:43:33 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200713144333eusmtrp11e6d448603f5183dfba243d4ffaf27d4~hVwMUj-y90993409934eusmtrp1a;
 Mon, 13 Jul 2020 14:43:33 +0000 (GMT)
X-AuditID: cbfec7f2-7efff70000001938-ba-5f0c73169e88
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 56.5A.06017.5137C0F5; Mon, 13
 Jul 2020 15:43:33 +0100 (BST)
Received: from AMDC3748.digital.local (unknown [106.120.51.74]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200713144333eusmtip13cba26d8ef88fbfed56cb041248967a4~hVwLmbChd1900919009eusmtip1u;
 Mon, 13 Jul 2020 14:43:32 +0000 (GMT)
From: Andrzej Hajda <a.hajda@samsung.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v9 4/4] drm/bridge: lvds-codec: simplify error handling
Date: Mon, 13 Jul 2020 16:43:24 +0200
Message-Id: <20200713144324.23654-5-a.hajda@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200713144324.23654-1-a.hajda@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA0WSe0gUURTGuTuzM+PiyrRKHiwyNyINzKT+uJJERdFUkIKlmJRtNVjkmuxo
 5RplL3XNbEskn2TrmmbmY9estpdtsRa2Wr7QyDSKYDOTfFRr9HAaq/+++53fOd+5l8sQKqfc
 j9mXlMLrkjSJakpBNjvcHcGzBc/4pWMmEr+sa5djl/ERwo2F9XJc8OYdhX81nydw9+QohU9W
 1FO456uLwE8/9pDYcN5MY8vbXjnuspVS2F5wD+HrjwdobM+Lw2UTBcQqluvqfUFwo32nae7e
 l3KSu108QHMl2UVyzlJjoLgnxk4Z96CsluYGz7TKOKv5GJfXVIO4lrP5JDdumRep3KYI38Mn
 7jvI60JW7lTsLbS+liWXKQ4bv7yWZaBeJgd5MMAuhy5zkSwHKRgVW43AVO2eOUwg+G58T4uU
 ih1HcPxEyN+OZ19bkARVITAPmql/HaXuKlKkKDYIflj7KVH7sMvgnLOYFiGCnSKhJytTLha8
 2fVQfNPxR5PsQpi6WzE9lmGULIYrQ4elNH+41tBCiLYHGwaX8mLEMcCO0FAxeZOUmLVQZCpF
 kvaGD61NtKTnQlt+7gxzDAarTxFSczaCGw23CamwAl61T1FiADG9dL1t5parYaq8RCbawHpB
 38gs0Sam5YXmi4RkKyE7UyXRATDovDEz0Bcqn09SkubAMdxBSM+Ti8BmcsqNyL/4f1g5QjXI
 l08VtAm8EJrEH1oiaLRCalLCkt0HtBY0/cnafraO3UKTnbvsiGWQ2lMJEZ7xKrnmoJCmtSNg
 CLWPco2zbYdKuUeTpud1B+J1qYm8YEdzGFLtq1xmcm1XsQmaFH4/zyfzur9VGePhl4E2z6t8
 mKEPLKpp9B7QG8LfbDJn2tbpvw0Fe230dXyKOho8XutY4RcbJ1AbDFsT/INc433D+T9icn82
 pAZmvVVYIrvnL7oaZv8MZaFu7RFrkz5q4vKFdH9tdIDVkNPh8skaSo+K3hKzoe5uSP8dd93S
 8Agq7aktGseu3jLr2ckF99WksFcTupjQCZrfsgv4t2ADAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrDIsWRmVeSWpSXmKPExsVy+t/xu7qixTzxBi3ftS1urTvHavFywmFG
 i40z1rNaTH34hM3i/7aJzBZXvr5ns2hevJ7N4ur3l8wWJ99cZbHonLiE3WLT42usFpd3zWGz
 ODR1L6PF2iN32S0O9UVbzP0yldlBwOPytYvMHu9vtLJ77P22gMVj56y77B6zO2ayemxa1cnm
 cWLCJSaP/XPXsHvc7z7O5LF5Sb1H35ZVjB4HeiezeHzeJBfAG6VnU5RfWpKqkJFfXGKrFG1o
 YaRnaGmhZ2RiqWdobB5rZWSqpG9nk5Kak1mWWqRvl6CXMWPzPaaCuVwVE77dY2pgvMbRxcjJ
 ISFgInHm+wFGEFtIYCmjxJ6WUoi4uMTu+W+ZIWxhiT/Xutggaj4xSnxeJwxiswloSvzdfBMs
 LiJgLNF/dhZ7FyMXB7NAG6vE3PNP2EESwgLuErO2H2MFsVkEVCV+7VkMtIyDg1fAQmLZgwqI
 +fISqzccYAYJcwpYSszvCwcxhYAqTrz1nMDIt4CRYRWjSGppcW56brGRXnFibnFpXrpecn7u
 JkZgTG079nPLDsaud8GHGAU4GJV4eCX8eeKFWBPLiitzDzFKcDArifA6nT0dJ8SbklhZlVqU
 H19UmpNafIjRFOiiicxSosn5wHjPK4k3NDU0t7A0NDc2NzazUBLn7RA4GCMkkJ5YkpqdmlqQ
 WgTTx8TBKdXAmFkYWFG89Hq5hO2Mp1vPnVk56efMrDd7482rWXR3J8ROP/p1zqnQY+v3ej1O
 id92TVfI4dlSzeeWErIL80I3+XvOzPj3ZJ+b8yXtJ0sOvsxmd24LdzfN+bYwbDNH3uH3usJ/
 H7knNUXolx7dN2fWSr17ExdxLtefd3ThNl1+SbWfMsdvfVH5fkuJpTgj0VCLuag4EQCVaDmR
 vwIAAA==
X-CMS-MailID: 20200713144333eucas1p1f393b280cda5eead4e7ca0a005c8a4db
X-Msg-Generator: CA
X-RootMTR: 20200713144333eucas1p1f393b280cda5eead4e7ca0a005c8a4db
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200713144333eucas1p1f393b280cda5eead4e7ca0a005c8a4db
References: <20200713144324.23654-1-a.hajda@samsung.com>
 <CGME20200713144333eucas1p1f393b280cda5eead4e7ca0a005c8a4db@eucas1p1.samsung.com>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 linux-kernel@vger.kernel.org,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Neil Armstrong <narmstrong@baylibre.com>, Andrzej Hajda <a.hajda@samsung.com>,
 andy.shevchenko@gmail.com, Mark Brown <broonie@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Using dev_err_probe code has following advantages:
- shorter code,
- recorded defer probe reason for debugging,
- uniform error code logging.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/bridge/lvds-codec.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lvds-codec.c b/drivers/gpu/drm/bridge/lvds-codec.c
index 24fb1befdfa2..f19d9f7a5db2 100644
--- a/drivers/gpu/drm/bridge/lvds-codec.c
+++ b/drivers/gpu/drm/bridge/lvds-codec.c
@@ -71,13 +71,9 @@ static int lvds_codec_probe(struct platform_device *pdev)
 	lvds_codec->connector_type = (uintptr_t)of_device_get_match_data(dev);
 	lvds_codec->powerdown_gpio = devm_gpiod_get_optional(dev, "powerdown",
 							     GPIOD_OUT_HIGH);
-	if (IS_ERR(lvds_codec->powerdown_gpio)) {
-		int err = PTR_ERR(lvds_codec->powerdown_gpio);
-
-		if (err != -EPROBE_DEFER)
-			dev_err(dev, "powerdown GPIO failure: %d\n", err);
-		return err;
-	}
+	if (IS_ERR(lvds_codec->powerdown_gpio))
+		return dev_err_probe(dev, PTR_ERR(lvds_codec->powerdown_gpio),
+				     "powerdown GPIO failure\n");
 
 	/* Locate the panel DT node. */
 	panel_node = of_graph_get_remote_node(dev->of_node, 1, 0);
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
