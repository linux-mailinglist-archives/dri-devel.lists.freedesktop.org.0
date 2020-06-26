Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D948E20AF55
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jun 2020 12:01:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F8046EC5A;
	Fri, 26 Jun 2020 10:01:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD9216EC56
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jun 2020 10:01:13 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200626100112euoutp02d2ae1bd199e8201ad6e7e30e5bc16dc6~cD7z6ex6J2540925409euoutp02J
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jun 2020 10:01:12 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200626100112euoutp02d2ae1bd199e8201ad6e7e30e5bc16dc6~cD7z6ex6J2540925409euoutp02J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1593165672;
 bh=fQMNu6sWDptDAr6/vT/QHkEA8xvrKj4wgjHFZNOz7Ao=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lpVNe9omwXEPlO6h8p0Gi1Fhy/ZRFWHx+0LogdW4+hAdnNc/vlpXE/VYqdMlHJgYg
 CT5hH0mxb1cNsJGVNpZaSAffSLjt7Yx0xoXVDYM7TieryTOigyCpStcg+6Oa4v0T3u
 3LzT2gvGlC4Odf77k3D8jxtOEeAREXbQ03ZlPtzc=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200626100112eucas1p24ede723f8f1211f52807bcd5beef82ee~cD7zkzPvd1856218562eucas1p2O;
 Fri, 26 Jun 2020 10:01:12 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id FA.B3.05997.867C5FE5; Fri, 26
 Jun 2020 11:01:12 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200626100111eucas1p18e175e6c77af483bd80fb90c171b05db~cD7zP1nsi1585815858eucas1p1T;
 Fri, 26 Jun 2020 10:01:11 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200626100111eusmtrp2d0bae6ed7bc417a53d8edd19c0ea7f1c~cD7zOhJL61350013500eusmtrp2F;
 Fri, 26 Jun 2020 10:01:11 +0000 (GMT)
X-AuditID: cbfec7f4-677ff7000000176d-d0-5ef5c7685195
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 17.86.06017.767C5FE5; Fri, 26
 Jun 2020 11:01:11 +0100 (BST)
Received: from AMDC3748.digital.local (unknown [106.120.51.74]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200626100110eusmtip19acd13a6af9c0b1fd47584ae7feb08bf~cD7yenk9Q2495924959eusmtip1O;
 Fri, 26 Jun 2020 10:01:10 +0000 (GMT)
From: Andrzej Hajda <a.hajda@samsung.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v6 4/4] drm/bridge: lvds-codec: simplify error handling
Date: Fri, 26 Jun 2020 12:01:03 +0200
Message-Id: <20200626100103.18879-5-a.hajda@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200626100103.18879-1-a.hajda@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA0WSa0iTURjHOXuvjhZvM/Cg2WUllZBWFp0opLTLi4FlH/rQxXrLlyluSzat
 lCC7mfM2zbykRqOU2Uxnq0St0DZpiU68pKlkll3ITCrcCkdlm++sb7/zPP/n/3/O4dCY1E74
 0wmqZF6t4hQyUow3PJvuWhNvc8aufWym0HBdF4HG860A3Ss1Eajo7XsSzTQUYOiF8yuJLt42
 kaj/5ziG2r/040hbUEkh87sBAvU1V5DIUvQEoNq2EQpZ8g6hG44ibBvD9g30YOzXwcsU++SH
 HmebykYotjzzOsGajVqSfZ7fK2Jbbtyl2NFsm4i9X3mOzXtgBGxrbiHOTpkX75McFG+N4xUJ
 p3h1aPgxcfzN+jxR0kefM9+N34l0UElnAR8aMhtgqaMB87CUqQaw6kJiFhC72QFgobaYEA5T
 ADZ2j2BzE1m9Q96GAUCXXo/9G7n2KIfwqEhmNfx9f4j08EImDOrsZZRHhDEuHPZfyZgV+TK7
 YelEzawIZ4Lgqztv3E40LWEQPG/bJaQtgTX1rbPJPsxmWDKcO5sMmUkKOrN1Io8eMjug4dFh
 Qe8LP9seUAIvgjNNN0UCn4Oj1ZcwYTYTwIf1Td7rbIGvulykxwdzL21qDhXK22FuhstrPx8O
 Ti7wlDE3Xm0owYSyBGZmSAX1Mjhqf+g19INV3U5SYBbWF4x5nycHwPaJDFE+WFL2P0wPgBH4
 8SkapZzXrFfxp0M0nFKTopKHnDipNAP3J+v4Y3M0guZfxy2AoYFsnqS1wBErJbhTmlSlBUAa
 ky2URNg7YqWSOC41jVefPKpOUfAaCwigcZmfJOzW+BEpI+eS+USeT+LVc10R7eOfDojqp46N
 l3gTEV7LLd0UPq9mc/nbYmNFaKJNy2d/0uG9520rl0dF6qIjnMqpkOaoxZXW1/6BY1tdnHVn
 jLIuvcWQZgjrGaIj3nw4EFgavPfbpvQ7AVC+Z2b/WeunxhWq6Wj9WJ8soS0yJupwYKfrS0jk
 dCdTLv+Q1fFy1dj2IIUM18Rz64IxtYb7C5w2LdhgAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrPIsWRmVeSWpSXmKPExsVy+t/xu7rpx7/GGeycpGNxa905VouXEw4z
 WmycsZ7VYurDJ2wW/7dNZLa48vU9m0Xz4vVsFle/v2S2OPnmKotF58Ql7BabHl9jtbi8aw6b
 xaGpexkt1h65y25xqC/aYu6XqcwOAh6Xr11k9nh/o5XdY++3BSweO2fdZfeY3TGT1WPTqk42
 jxMTLjF57J+7ht3jfvdxJo/NS+o9+rasYvQ40DuZxePzJrkA3ig9m6L80pJUhYz84hJbpWhD
 CyM9Q0sLPSMTSz1DY/NYKyNTJX07m5TUnMyy1CJ9uwS9jPkb+pgKnnFWfFz1kbWBcQlHFyMn
 h4SAiUTXpZusXYxcHEICSxklGi/sZIdIiEvsnv+WGcIWlvhzrYsNougTo8SMK7sYQRJsApoS
 fzffZAOxRQSMJfrPzmIHKWIWaGOVmHv+CdgkYQF3iRmvV4MVsQioStxZ+QBoKgcHr4CFRONx
 N4gF8hKrNxwAW8YpYCkx/VYvK0iJEFBJ55LICYx8CxgZVjGKpJYW56bnFhvpFSfmFpfmpesl
 5+duYgRG1rZjP7fsYOx6F3yIUYCDUYmH98DEL3FCrIllxZW5hxglOJiVRHidzp6OE+JNSays
 Si3Kjy8qzUktPsRoCnTSRGYp0eR8YNTnlcQbmhqaW1gamhubG5tZKInzdggcjBESSE8sSc1O
 TS1ILYLpY+LglGpg3NjVe7L1+q32KTsdPoqGPlWym/J/9bmzl+VD5K9HfMzUkV6fy+OerlGS
 /LTkto9R4RGHh1l5P+/tCvN72PvgMHNjdMWClXa/2WclFZ+wDxYUeaP/9Vpv2sLA+p+Su5v9
 7V994hI0mTj/8JnYXR9/psT+73/9+cFnLe30vDiufXPFdXzzs0W2KbEUZyQaajEXFScCACoG
 v53CAgAA
X-CMS-MailID: 20200626100111eucas1p18e175e6c77af483bd80fb90c171b05db
X-Msg-Generator: CA
X-RootMTR: 20200626100111eucas1p18e175e6c77af483bd80fb90c171b05db
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200626100111eucas1p18e175e6c77af483bd80fb90c171b05db
References: <20200626100103.18879-1-a.hajda@samsung.com>
 <CGME20200626100111eucas1p18e175e6c77af483bd80fb90c171b05db@eucas1p1.samsung.com>
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
