Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B9E3C16FBCB
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2020 11:13:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2ED36E46C;
	Wed, 26 Feb 2020 10:13:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C38A06E46C
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2020 10:13:18 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200226101317euoutp014270f9776d12db148e97220910532009~27C0Jtytz1842018420euoutp01K
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2020 10:13:17 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200226101317euoutp014270f9776d12db148e97220910532009~27C0Jtytz1842018420euoutp01K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1582711997;
 bh=O1BFWpWbTwDLNXm1FRjAmKAXsPmqCPdSm166rZilS7M=;
 h=From:To:Cc:Subject:Date:References:From;
 b=kjqJ1obC5+Eqt3peK4GRJ0bvxzrFjacg6qSQEqJ2uPUxMh7w7qdFmX8wbA2lVCxLF
 pMBkBbhQ6/T3xymuuGbdts4JimI3439Tl5M7Cu6bRT4dfF6Z0/FfceT6PeOYzuKBlD
 CU5vjdjP7Va0+2Zk00B0d9ihpUqp/w7MtpceNZy8=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200226101316eucas1p2b49f1eabcdac4bdec01ec4c81787feb7~27Czv8x_e3143731437eucas1p2v;
 Wed, 26 Feb 2020 10:13:16 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 46.C4.60679.CB4465E5; Wed, 26
 Feb 2020 10:13:16 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200226101316eucas1p2fd16a7c821632084710167216b78f6c5~27CzP-Ebd3147831478eucas1p21;
 Wed, 26 Feb 2020 10:13:16 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200226101316eusmtrp1d4ff0a08dba91cad28178c4c6029d5d9~27CzPWneG1656116561eusmtrp1C;
 Wed, 26 Feb 2020 10:13:16 +0000 (GMT)
X-AuditID: cbfec7f4-0e5ff7000001ed07-88-5e5644bcdf68
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 26.6C.07950.CB4465E5; Wed, 26
 Feb 2020 10:13:16 +0000 (GMT)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200226101315eusmtip2c4bb9e06902a9feeef244aeed2d0bee2~27CysNvBc0087800878eusmtip25;
 Wed, 26 Feb 2020 10:13:15 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Subject: [PATCH] drm/bridge: sii9234: silence warning about regulators
 during deferred probe
Date: Wed, 26 Feb 2020 11:13:07 +0100
Message-Id: <20200226101307.16708-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpileLIzCtJLcpLzFFi42LZduzned09LmFxBs9f6VrcWneO1WLjjPWs
 Fle+vmezuPr9JbPFyTdXWSw6Jy5ht5hxfh+Txdojd9ktDvVFO3B6vL/Ryu4xu2Mmq8eJCZeY
 PO53H2fy6NuyitHjQO9kFo/Pm+QC2KO4bFJSczLLUov07RK4Mr7u+s5ecIit4u6PAywNjAdZ
 uxg5OSQETCS27nvE1MXIxSEksIJR4uSTs1DOF0aJVdMmsINUCQl8ZpQ4uCiyi5EDrGPGJieI
 muWMEtsP3kRouHR5GthYNgFDia63XWwgtoiAm0TT4ZmsIEXMAnuZJHYcbAJLCAvESZx9eQxs
 A4uAqsSnBf2MIDavgK3Ei2W3GCHuk5dYveEAM0izhMBnNomWbS+YIRIuEi9uP2KDsIUlXh3f
 wg5hy0icntzDAtHQzCjx8Nxadginh1HictMMqLHWEnfO/WIDeYhZQFNi/S59iLCjxI3ePawQ
 f/JJ3HgrCBJmBjInbZvODBHmlehoE4KoVpOYdXwd3NqDFy5BneYhcfraS1ZIyMVKdN68zTqB
 UW4Wwq4FjIyrGMVTS4tz01OLjfJSy/WKE3OLS/PS9ZLzczcxAlPG6X/Hv+xg3PUn6RCjAAej
 Eg/vC87QOCHWxLLiytxDjBIczEoivBu/AoV4UxIrq1KL8uOLSnNSiw8xSnOwKInzGi96GSsk
 kJ5YkpqdmlqQWgSTZeLglGpg7MpxXBT28KTa4z9H9H679S+Z+jRvwqeid12hrC9qzI4GWrU7
 10XNDL8bN+3l++6AhNeS6wxF3s+OYJKp+ZVxyWf7I+vvMy4de5OgMDcsI/zunaPaPTq2MqLJ
 i7ojnqj6bPIpyNwvcHK9moHXIesdEl18C+6lp69LTrumdXRLceWkPz+7fC86KLEUZyQaajEX
 FScCAAPw3mYVAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrBLMWRmVeSWpSXmKPExsVy+t/xe7p7XMLiDM6v57G4te4cq8XGGetZ
 La58fc9mcfX7S2aLk2+uslh0TlzCbjHj/D4mi7VH7rJbHOqLduD0eH+jld1jdsdMVo8TEy4x
 edzvPs7k0bdlFaPHgd7JLB6fN8kFsEfp2RTll5akKmTkF5fYKkUbWhjpGVpa6BmZWOoZGpvH
 WhmZKunb2aSk5mSWpRbp2yXoZXzd9Z294BBbxd0fB1gaGA+ydjFycEgImEjM2OTUxcjFISSw
 lFFi//aFbF2MnEBxGYmT0xpYIWxhiT/Xutggij4xSsx63gSWYBMwlOh62wXWICLgIdH87Tg7
 SBGzwEEmiZOzzjOBJIQFYiRuLF0HZrMIqEp8WtDPCGLzCthKvFh2ixFig7zE6g0HmCcw8ixg
 ZFjFKJJaWpybnltspFecmFtcmpeul5yfu4kRGKrbjv3csoOx613wIUYBDkYlHt4XnKFxQqyJ
 ZcWVuYcYJTiYlUR4N34FCvGmJFZWpRblxxeV5qQWH2I0BVo+kVlKNDkfGEd5JfGGpobmFpaG
 5sbmxmYWSuK8HQIHY4QE0hNLUrNTUwtSi2D6mDg4pRoYQ/Vje9uCfvKVvuZ/Ocv/0Nwvcj0T
 mKd8d5jud3/lDOfV9xirr5ra7/FwPxKt5fxUvuVBcYpu+xlplvCp52dbSOnNtg3ff9bgQKmZ
 282YPJdrV5YEbXrIHruivWvKL541KdsMdK4/81sfNrkzpyh49x27d4eufAievOUDZ/WC1uYN
 UxfvfMI1X4mlOCPRUIu5qDgRAKg7fHNrAgAA
X-CMS-MailID: 20200226101316eucas1p2fd16a7c821632084710167216b78f6c5
X-Msg-Generator: CA
X-RootMTR: 20200226101316eucas1p2fd16a7c821632084710167216b78f6c5
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200226101316eucas1p2fd16a7c821632084710167216b78f6c5
References: <CGME20200226101316eucas1p2fd16a7c821632084710167216b78f6c5@eucas1p2.samsung.com>
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
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
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
 drivers/gpu/drm/bridge/sii9234.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/sii9234.c b/drivers/gpu/drm/bridge/sii9234.c
index f81f81b7051f..b1258f0ed205 100644
--- a/drivers/gpu/drm/bridge/sii9234.c
+++ b/drivers/gpu/drm/bridge/sii9234.c
@@ -836,7 +836,8 @@ static int sii9234_init_resources(struct sii9234 *ctx,
 	ctx->supplies[3].supply = "cvcc12";
 	ret = devm_regulator_bulk_get(ctx->dev, 4, ctx->supplies);
 	if (ret) {
-		dev_err(ctx->dev, "regulator_bulk failed\n");
+		if (ret != -EPROBE_DEFER)
+			dev_err(ctx->dev, "regulator_bulk failed\n");
 		return ret;
 	}
 
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
