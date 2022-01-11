Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2722748C051
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jan 2022 09:52:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42E30112E4A;
	Wed, 12 Jan 2022 08:51:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A97DC112BC3
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jan 2022 03:41:08 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id
 i8-20020a17090a138800b001b3936fb375so2588187pja.1
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jan 2022 19:41:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hwEPMvp3DjRSN3d2/dcUVuC6b+oG9XWyIp1x6JZBMCU=;
 b=qJhKfppSoaHQ9x0M8JS4CHsfoRvskXcYBqGE4k4UL6E+OoAQKy2x7Otjnmm8kZQNw+
 /UvnyzUkKPNrLviF+AolXpjg0PyWfhBMbFKnmU1EJ7chVluv25O9Kd6ejQQAzooFq6Xy
 UghEqYyYCePb/o/FymIosocn9kD64P+dQxZFPbGKNYbPsP4zRgvOtjqPORktn40TrZD8
 5llCBJ/kJ1NFJW/8uLAUuVxPOJp6u03URdM/aJ/nNVy0SmMuOPQHrADGB8lVPAaRt4Gb
 zgTiu2xVGWzlfPUHYXX8fS5UOxOnIJH6afERIGngrRzb0y6bMSOmf4P0sXg2cvY97raU
 ZbKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hwEPMvp3DjRSN3d2/dcUVuC6b+oG9XWyIp1x6JZBMCU=;
 b=hKbT6rJKeM/YUmk9UOhBo8Mg6Jr3PO2PDv/AmuwVb1Tox4kPNH+CX1m1JOfkkxIliT
 t5a0zAyCtUk8JdQWhD053Dzy1dmzZoUStnHWiGS1HKoBxUdqC5SigxVuOweb0o1X/NFR
 l6nXLR/Mhk6F5liBFDbb9xPA3Lh1fJLmVK7CyNuLROka4+K5kelfe8XCIml1ukMAU3mD
 H9lh13erz3S7qHa2ctQsxkz8EGbU2GxhD+i+4/k5KHD5DmR7Qg8m05x6fxvS/S5Vc7rs
 CmsgTHWNZfNEvz/bOVBEeTN4L8w9X5VkGJKMRcK6EbN+ApMt/hs5FpWSDAj5eWr1Lvr3
 Xrrw==
X-Gm-Message-State: AOAM533KbjYbnta3WpIy8ejP8rKFExo0QB2g+Vo1sZwsNRGEd/n0lQ0b
 gfz8UuDJ5PBhQIpWQZIgunU=
X-Google-Smtp-Source: ABdhPJxYXhrJc/EjC0Np8wZ+dKkfFxXVsLMmeCHIPTToDcc2z7QjHEg9hxy20KkyS4ABVthGKzR+tg==
X-Received: by 2002:a17:902:6b03:b0:149:7cf7:a17f with SMTP id
 o3-20020a1709026b0300b001497cf7a17fmr2664825plk.173.1641872468280; 
 Mon, 10 Jan 2022 19:41:08 -0800 (PST)
Received: from localhost.localdomain ([103.144.149.199])
 by smtp.gmail.com with ESMTPSA id y14sm6871315pgo.87.2022.01.10.19.41.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jan 2022 19:41:07 -0800 (PST)
From: lzmlzm <lzmlzmhh@gmail.com>
To: a.hajda@samsung.com,
	narmstrong@baylibre.com,
	robert.foss@linaro.org
Subject: [PATCH] Remove extra device acquisition method of i2c client in
 lt9611 driver
Date: Tue, 11 Jan 2022 11:40:51 +0800
Message-Id: <20220111034051.28913-1-lzmlzmhh@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 12 Jan 2022 08:51:42 +0000
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
Cc: jernej.skrabec@gmail.com, jonas@kwiboo.se, airlied@linux.ie,
 lzmlzm <lzmlzmhh@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Signed-off-by: lzmlzm <lzmlzmhh@gmail.com>
---
 drivers/gpu/drm/bridge/lontium-lt9611.c    | 2 +-
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
index dafb1b47c15f..e0feb4fd9780 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
@@ -1090,7 +1090,7 @@ static int lt9611_probe(struct i2c_client *client,
 	if (!lt9611)
 		return -ENOMEM;
 
-	lt9611->dev = &client->dev;
+	lt9611->dev = dev;
 	lt9611->client = client;
 	lt9611->sleep = false;
 
diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
index 33f9716da0ee..e50e42312e82 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
@@ -860,7 +860,7 @@ static int lt9611uxc_probe(struct i2c_client *client,
 	if (!lt9611uxc)
 		return -ENOMEM;
 
-	lt9611uxc->dev = &client->dev;
+	lt9611uxc->dev = dev;
 	lt9611uxc->client = client;
 	mutex_init(&lt9611uxc->ocm_lock);
 
-- 
2.25.1

