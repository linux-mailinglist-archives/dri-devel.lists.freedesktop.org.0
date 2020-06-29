Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0083320CE2B
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jun 2020 13:23:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 344896E15B;
	Mon, 29 Jun 2020 11:22:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 939786E15B
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jun 2020 11:22:52 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200629112251euoutp02fc51988d16e1c50b6814605521a7e928~c-_9HR1hU1987519875euoutp02Y
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jun 2020 11:22:51 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200629112251euoutp02fc51988d16e1c50b6814605521a7e928~c-_9HR1hU1987519875euoutp02Y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1593429771;
 bh=B440VBDLdLWidVVzamEgT8cxdzc8DwUiqZOX84CTZVs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=n8C0XkJJUibVAhAvnSkzGmbewZuChMGVQjfjeMcWkOpx3an4KqCe64AcdUhwSLoO8
 DIILivtoUTmEZ9F7iAyL75dgWa/IVRm5gSiDSy5VpzHAW1ZBRKuu/c1KmHnT6Ecwmd
 +4ILMSV5O7jl+WSa6Y0v6MHDdn4B5i2VL3w653tk=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200629112250eucas1p2c61b6686a340a5f63cf3fc732e77ed4c~c-_8y6McG0721607216eucas1p2l;
 Mon, 29 Jun 2020 11:22:50 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 3C.68.06318.A0FC9FE5; Mon, 29
 Jun 2020 12:22:50 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200629112250eucas1p162ce47eab8946c45357a7e2c03a6da9a~c-_8bV1tt1693516935eucas1p1m;
 Mon, 29 Jun 2020 11:22:50 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200629112250eusmtrp2c127127c787ab37d16fb4aea0a2cc84c~c-_8au3BK1960419604eusmtrp2s;
 Mon, 29 Jun 2020 11:22:50 +0000 (GMT)
X-AuditID: cbfec7f5-38bff700000018ae-d8-5ef9cf0a647f
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 9D.EC.06017.A0FC9FE5; Mon, 29
 Jun 2020 12:22:50 +0100 (BST)
Received: from AMDC3748.digital.local (unknown [106.120.51.74]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200629112249eusmtip19ca9d250ad2f68834f5b4750386400a9~c-_7sJRpH2177921779eusmtip14;
 Mon, 29 Jun 2020 11:22:49 +0000 (GMT)
From: Andrzej Hajda <a.hajda@samsung.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v7 4/4] drm/bridge: lvds-codec: simplify error handling
Date: Mon, 29 Jun 2020 13:22:42 +0200
Message-Id: <20200629112242.18380-5-a.hajda@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200629112242.18380-1-a.hajda@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA0WSf0yMcRzH973nued5ujw8rug7xJwfG5timX39nG5+PGM2s7bIOo6eEv1y
 10XGCqm7Ildp9AujaBXX3bnjmpRjHVJ39FMoTWMZE+7oIul6wn+vz/vz/vz67kthYrtwGhUd
 l8gp4uQxEkKEmxvc9kUiu1u2WPN+Beq62SxE/doHAOkv6IQov7ePQCPmHAy1uj4T6ORVHYHa
 fvRj6PHHNhxpckpJZHjbLkQtNcUEsubXAnTj4WsSWbN3ohJnPraWYVvan2Hs585TJFv7/TLO
 Wgpfk2yRukDIGio0BPtI+1zA1pVUkWxPlk3AGktT2OxbFYCtP5OHs98MM7fSYaJVEVxMdBKn
 CFyzW7TvgrFbkFAiOqz93i1IBe1UJvCiILMU6u8Xg0wgosRMOYBa5xucD5wA/qyswvjgG4Bp
 lpJRGzVWMjy8kdevA9hgHiD/VQwU9eGevgSzAA4bXxAe9mWC4NmmwjETxgzhsC0jXehJ+DAb
 YVrrO+BhnJkHX/alCzxMMwhmNGoxfsFZsLK6foy9mOWwxVEwtixkvpDQ8Kqe4E3r4KCuW8iz
 D/xgu0XyPAOOWC4JeE6BPeVpGF+sBtBUbRmfsBK+ah4iPLdho2vragJ5ORg661wkf/JE2Plp
 skfGRjHXfB7jZRqq08W8ezbsaTKNN/SDZQ7X+GYsvG0zjb/vaQAbP9kxLZhV+H/YZQAqgB+n
 UsZGccqgOO5QgFIeq1TFRQXsjY81gNFv1vjb5roD7v3aYwUMBSQT6N3NbplYKE9SJsdaAaQw
 iS8tbWqUiekIefIRThG/S6GK4ZRWMJ3CJX500JX+cDETJU/kDnBcAqf4mxVQXtNSgaY1ZHvC
 Ofdcn7KRNFrlrc7116umPLmjV1TN8We/9C7I2pLhmH3bN6erY5f+5nntYKi00uA+ml4wfGxR
 clhk6rVJJxyMqXjzfKd9x9XQyPUHy4Ifg/f0/fLyix2r7Xc3LUvp5/K+Pq32dh4hQsNDjh/b
 IJsirZtkXC41lE7d1jmwX4Ir98mXLMQUSvkfTyVhEWIDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrAIsWRmVeSWpSXmKPExsVy+t/xu7pc53/GGayfo2hxa905VouXEw4z
 WmycsZ7VYurDJ2wW/7dNZLa48vU9m0Xz4vVsFle/v2S2OPnmKotF58Ql7BabHl9jtbi8aw6b
 xaGpexkt1h65y25xqC/aYu6XqcwOAh6Xr11k9nh/o5XdY++3BSweO2fdZfeY3TGT1WPTqk42
 jxMTLjF57J+7ht3jfvdxJo/NS+o9+rasYvQ40DuZxePzJrkA3ig9m6L80pJUhYz84hJbpWhD
 CyM9Q0sLPSMTSz1DY/NYKyNTJX07m5TUnMyy1CJ9uwS9jBmb7zEVzOWqmPDtHlMD4zWOLkYO
 DgkBE4m/f927GLk4hASWMkpc7lzJ0sXICRQXl9g9/y0zhC0s8edaFxtE0SdGiVsfDzOCJNgE
 NCX+br7JBmKLCBhL9J+dxQ5SxCzQxiox9/wTdpCEsIC7RMuVZ2ANLAKqEreftDGB2LwCFhLt
 pydAbZCXWL3hAJjNKWApcfnCTLB6IaCaC0c72Scw8i1gZFjFKJJaWpybnltspFecmFtcmpeu
 l5yfu4kRGFvbjv3csoOx613wIUYBDkYlHt6Ecz/jhFgTy4orcw8xSnAwK4nwOp09HSfEm5JY
 WZValB9fVJqTWnyI0RToqInMUqLJ+cC4zyuJNzQ1NLewNDQ3Njc2s1AS5+0QOBgjJJCeWJKa
 nZpakFoE08fEwSnVwCgxY9fDTfd2Gez99WXz2rqmGVrxU4WfLM2edOOqjbiu3wevrVHT1j12
 dmTKyTry9/+MbxwVX3cf/JvOfWFS4m9ntUNBfluO/i03KT31/2GIgJvNZoVHMsfPa6jtul75
 8ZtO3+7SMO5bqj/y4yz+ie/9YxbV1ZDzYO2/suyT8Sc8imrE/sRxbM1QYinOSDTUYi4qTgQA
 oBEyssMCAAA=
X-CMS-MailID: 20200629112250eucas1p162ce47eab8946c45357a7e2c03a6da9a
X-Msg-Generator: CA
X-RootMTR: 20200629112250eucas1p162ce47eab8946c45357a7e2c03a6da9a
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200629112250eucas1p162ce47eab8946c45357a7e2c03a6da9a
References: <20200629112242.18380-1-a.hajda@samsung.com>
 <CGME20200629112250eucas1p162ce47eab8946c45357a7e2c03a6da9a@eucas1p1.samsung.com>
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
