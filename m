Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FFA721B989
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jul 2020 17:30:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 713A06EC7A;
	Fri, 10 Jul 2020 15:30:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61E756EC77
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 15:30:28 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200710153027euoutp015d3e7c4fb6b7ddb0b1f7f9514eee18fe~gbdRnTfZv1966219662euoutp01g
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 15:30:27 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200710153027euoutp015d3e7c4fb6b7ddb0b1f7f9514eee18fe~gbdRnTfZv1966219662euoutp01g
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1594395027;
 bh=B440VBDLdLWidVVzamEgT8cxdzc8DwUiqZOX84CTZVs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=i5f0uUoQ7ZR/lmT8DV8Ur5GoXgnkpZxKkpWkonx8e+aSgdxKiOtGPM6ysC2fgP5CV
 uxyfrzxK7XDW2SsjZ9vk65SJPE9RG0XBj0yZLwbL3jdtaDRliQIZiY32TVa+XC+uOi
 YZctEST0sMeQoXccz45vFkUOw66gzn8a32I/7V/I=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200710153026eucas1p1d277077a856967448ceb2c8ef06d4307~gbdRMgux-2715527155eucas1p1d;
 Fri, 10 Jul 2020 15:30:26 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 40.26.06318.299880F5; Fri, 10
 Jul 2020 16:30:26 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200710153026eucas1p208e5850ddd9e7f376c4d56f892b05233~gbdQ1mvuI2493924939eucas1p2s;
 Fri, 10 Jul 2020 15:30:26 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200710153026eusmtrp11fbd8efa90c6d8b454a6933eebba61e3~gbdQ072S22243522435eusmtrp1u;
 Fri, 10 Jul 2020 15:30:26 +0000 (GMT)
X-AuditID: cbfec7f5-371ff700000018ae-d5-5f088992fc78
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 10.48.06017.299880F5; Fri, 10
 Jul 2020 16:30:26 +0100 (BST)
Received: from AMDC3748.digital.local (unknown [106.120.51.74]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200710153025eusmtip1c92b174adfcb32307df709cdaf7dd4b7~gbdQEhRTv0878108781eusmtip1t;
 Fri, 10 Jul 2020 15:30:25 +0000 (GMT)
From: Andrzej Hajda <a.hajda@samsung.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v8 4/5] drm/bridge: lvds-codec: simplify error handling
Date: Fri, 10 Jul 2020 17:30:17 +0200
Message-Id: <20200710153018.12226-5-a.hajda@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200710153018.12226-1-a.hajda@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA0WSaUhUURzFufNWBydeT8Gb1UhjggqlYeQNow3B96EwghYSl1c9zNRR5rn2
 JatxbZrUSXLJGktJbNFc07JiCicRrdwLdRRDmMqFUiNRy+ez+va795z//1wOl8bYTsKVjtIm
 CDotH6MhlXhj26+ubfnZdLjv6IA7+vS4i0D23NcAPSmsJlDB2GcS/W7Mw1Dv3DSJrtyrJlHf
 TzuG2r/14Sg7r5xCteP9BOppuUUiS0ErQI/eDFPIYgxBpbMF2H6G6+n/gHHTg+kU1zpvxrnm
 4mGKK8kqIrjaqmySe5vbreBelj6kONtVq4KrK7/IGeurAPfqmgnnftSqj6hOKfecFWKikgSd
 z94I5bnCuhFFfKkyJXd+RJEG+ukcQNOQ2QnNd47nAAeaZSoBLNN75QDlCs8C2DzVBOTDDwBv
 9FwCkksaaLPPkLJwH8DWrnbi30h2SQMuuUjGCy7VfSQldmb84PXOYkoyYcwCDvsyMwhJcGKC
 YIa+e5VxxgMuto8oJFYxCBoGvq7FucEHNa8wiR2Y3XCq4OpqNGQmKdjyrIKQTYFwLm1CIbMT
 /GKtp2TeBDtMBlzmi9BWqcfk4SwAG2qaMVkIgENdC6TUBrby7OoWH7mYA3C8KVjGdXBwcr1k
 xlYwv/EmJl+rYFYGK+/YAm2dDWv7XGDF+zlSZg7aesswuR8DgPduFeK5wK34f5YZgCrgIiSK
 sZGC6KcVkreLfKyYqI3cfiYuthasfLKOZevcU/Bi8bQFMDTQOKrMPB3OEnySmBprAZDGNM6q
 g50dYazqLJ96QdDFhesSYwTRAjbSuMZF5XfXHsoykXyCEC0I8YLur6qgHVzTQOI795kxj0zP
 KXbYEHbCc5fJI+ROU491M6g/bGwOfs4nL7e6QbPRI3S46JiLnXOs3qr+FU6cnLx9PqVEnQKP
 avwn6utGTd5ui2mHLo1fVn8PaQhyZJkIfUqjuMGg1/qme5cE7hua2WSj8iYWMzfm+5+YsEZH
 sAEWY5UgxC1pcPEcv8Mb04n8H5a0LihgAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrAIsWRmVeSWpSXmKPExsVy+t/xu7qTOjniDfp/81jcWneO1eLlhMOM
 FhtnrGe1mPrwCZvF/20TmS2ufH3PZtG8eD2bxdXvL5ktTr65ymLROXEJu8Wmx9dYLS7vmsNm
 cWjqXkaLtUfuslsc6ou2mPtlKrODgMflaxeZPd7faGX32PttAYvHzll32T1md8xk9di0qpPN
 48SES0we++euYfe4332cyWPzknqPvi2rGD0O9E5m8fi8SS6AN0rPpii/tCRVISO/uMRWKdrQ
 wkjP0NJCz8jEUs/Q2DzWyshUSd/OJiU1J7MstUjfLkEvY8bme0wFc7kqJny7x9TAeI2ji5GT
 Q0LAROLYyw9sXYxcHEICSxklZt9fwwSREJfYPf8tM4QtLPHnWhcbiC0k8IlRor2zAMRmE9CU
 +Lv5JlhcRMBYov/sLHaQQcwCbawSc88/YQdJCAu4S7S1XGIFsVkEVCX+nLwHtoBXwEKi5/pr
 RogF8hKrNxwAW8YpYCnxbmo31DILidvLvrNOYORbwMiwilEktbQ4Nz232EivODG3uDQvXS85
 P3cTIzC2th37uWUHY9e74EOMAhyMSjy8CxI54oVYE8uKK3MPMUpwMCuJ8DqdPR0nxJuSWFmV
 WpQfX1Sak1p8iNEU6KiJzFKiyfnAuM8riTc0NTS3sDQ0NzY3NrNQEuftEDgYIySQnliSmp2a
 WpBaBNPHxMEp1cC44fjrpRHTOo2UHLjUipeLTpf8PeuSj5fkAufop0LH+jxk5FOC6pamxaeZ
 f3Kcptyev+9T+B19CW3tN5yBUcu7o7YeO6KY//FAZNr7KZ+1d7n+rTklf3+vwQbr769NhaPO
 vnfQmNc1r4wp9u9p9rpjfzaF78i+UJa0fNKmC//KCzj3iTeemXpeiaU4I9FQi7moOBEAPT6F
 38MCAAA=
X-CMS-MailID: 20200710153026eucas1p208e5850ddd9e7f376c4d56f892b05233
X-Msg-Generator: CA
X-RootMTR: 20200710153026eucas1p208e5850ddd9e7f376c4d56f892b05233
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200710153026eucas1p208e5850ddd9e7f376c4d56f892b05233
References: <20200710153018.12226-1-a.hajda@samsung.com>
 <CGME20200710153026eucas1p208e5850ddd9e7f376c4d56f892b05233@eucas1p2.samsung.com>
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
