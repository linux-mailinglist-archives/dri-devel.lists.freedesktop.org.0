Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ACD748E670
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jan 2022 09:27:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C43210EA31;
	Fri, 14 Jan 2022 08:27:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D28AD10F28D
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jan 2022 12:52:16 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id o3so10621872pjs.1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jan 2022 04:52:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=swVaXzBx+PrfXmAvvghZ6HgBvKOJ7/EddkA4pJ4xeEI=;
 b=TuiWl8Oz+foIhj0GKYCXsYw7/LOB74AzRk0AVyxvHDwjucLVBvmxatrq9l5GOniEHu
 D1NRALEoW8UGcqLlffH0hW3xTegREfsqqwBMMTC3Clh4Ue7l0yhzkFZ+EcswgGgSVH4J
 ri4Q6Vlsr5Ww7S6jCz1q1L+sU66m4+Wg0ZkhIT6D3PMuAbRrmkI0gqtmu54GhpirQp8j
 N52ujwYK4q6VnoC0TrauHF3sNxhS2M/SbeLXAtrxfKolM7CFOZJavgBSsIHs064ISdtY
 lTXQFZwc92PJEuIMEPdGOiiWouK5fod0HnsOkQDc/UINixC5N0WdmEC2ScxPAj/f5Lzl
 Rd3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=swVaXzBx+PrfXmAvvghZ6HgBvKOJ7/EddkA4pJ4xeEI=;
 b=7E+uuxrQYjS3f7ukTuSVdKU4c87/ih6qtY2IINCcynCyX/YGNhicnx7zBbAWzPPVMq
 zGWYXKxACRacAR5NUwq6tFz+BBt+xTHiEaMu2KK3Mc7EgFk3e45ibO1VThGQNemT+sXX
 0KuvEjNyR7gOCeF429ygET00Y473DdebkDk4rLDL0bgJk/wN5IO1nGo/Yn38tXQ3+/k4
 tsz3r0C+wIwRrA39t71dHZWY4Tz9HTZhs8ujEie8Pvh5DcnQkxOxV46IFQDspPpBWp/x
 iRLD7mvmE5B075yPYCR74E9jZlVJ2ZJRjZuibuA3Zw/v9tqyZ3o8fmLpGkfZ4sNgq/ab
 Mskg==
X-Gm-Message-State: AOAM5337z3OXTpOVSdVsTeL2vcWB26Od9yXEIsMhwdjEAKePb3Hsdzjd
 4QuqmcCHlIED+BGym6xq6VE=
X-Google-Smtp-Source: ABdhPJzaqVUc5iwgSTLDxoA1+5ZByWOicwSgsG6MgN2setHwniTm0Jy8BKkS+NCGatVoAAyt2otLbw==
X-Received: by 2002:a63:700c:: with SMTP id l12mr3682836pgc.559.1642078336413; 
 Thu, 13 Jan 2022 04:52:16 -0800 (PST)
Received: from localhost.localdomain ([103.144.149.199])
 by smtp.gmail.com with ESMTPSA id g6sm2311406pgk.37.2022.01.13.04.52.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jan 2022 04:52:15 -0800 (PST)
From: Zhiming Liu <lzmlzmhh@gmail.com>
To: narmstrong@baylibre.com,
	robert.foss@linaro.org
Subject: [PATCH v2] Remove extra device acquisition method of i2c client in
 lt9611 driver
Date: Thu, 13 Jan 2022 20:52:01 +0800
Message-Id: <20220113125201.22544-1-lzmlzmhh@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 14 Jan 2022 08:27:12 +0000
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
Cc: jernej.skrabec@gmail.com, jonas@kwiboo.se, Zhiming Liu <lzmlzmhh@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Signed-off-by: Zhiming Liu <lzmlzmhh@gmail.com>

bridge : drm : Remove extra device acquisition method of i2c client in lt9611 driver.

We have get the device of i2c client in probe function.So we should
remove extra device acquisition method of i2c client.
---
 drivers/gpu/drm/bridge/lontium-lt9611.c    | 4 ++--
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
index dafb1b47c15f..feb128a4557d 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
@@ -1090,7 +1090,7 @@ static int lt9611_probe(struct i2c_client *client,
 	if (!lt9611)
 		return -ENOMEM;
 
-	lt9611->dev = &client->dev;
+	lt9611->dev = dev;
 	lt9611->client = client;
 	lt9611->sleep = false;
 
@@ -1100,7 +1100,7 @@ static int lt9611_probe(struct i2c_client *client,
 		return PTR_ERR(lt9611->regmap);
 	}
 
-	ret = lt9611_parse_dt(&client->dev, lt9611);
+	ret = lt9611_parse_dt(dev, lt9611);
 	if (ret) {
 		dev_err(dev, "failed to parse device tree\n");
 		return ret;
diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
index 33f9716da0ee..3d62e6bf6892 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
@@ -860,7 +860,7 @@ static int lt9611uxc_probe(struct i2c_client *client,
 	if (!lt9611uxc)
 		return -ENOMEM;
 
-	lt9611uxc->dev = &client->dev;
+	lt9611uxc->dev = dev;
 	lt9611uxc->client = client;
 	mutex_init(&lt9611uxc->ocm_lock);
 
@@ -870,7 +870,7 @@ static int lt9611uxc_probe(struct i2c_client *client,
 		return PTR_ERR(lt9611uxc->regmap);
 	}
 
-	ret = lt9611uxc_parse_dt(&client->dev, lt9611uxc);
+	ret = lt9611uxc_parse_dt(dev, lt9611uxc);
 	if (ret) {
 		dev_err(dev, "failed to parse device tree\n");
 		return ret;
-- 
2.25.1

