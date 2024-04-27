Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AC4D8B4424
	for <lists+dri-devel@lfdr.de>; Sat, 27 Apr 2024 06:50:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 862A210EF2C;
	Sat, 27 Apr 2024 04:50:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Et5O43FF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1C7C10EF2C
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Apr 2024 04:50:31 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id
 d2e1a72fcca58-6ed20fb620fso2590688b3a.2
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Apr 2024 21:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714193431; x=1714798231; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=eTTqh4tVK7J4k/2+rdaNwgcyYffbEPxsziKQodGk2xA=;
 b=Et5O43FFPmqs5T3exCP56SO0u/lq08A+QqTg4PSkUEWdGT9rSYYH6z5XZg1FP4AyE4
 s8lM5ZSOXqOVNhYN7akkv9SJdzulQUl4T6FAlA/8+HxTr2fCT58HXP2OP6VrkeAveS43
 AYJzQZbCip9sx43FolLVCgjRFsNtQZumP6LPDs7lIq9C1RIjMr9P7H1KWPQiO2ONroD0
 VSL4sapCjOkwcD8bjUH87LXtkD/xfnrr93sRivxFZ0tq9QyaDKD11R9/ud44s8GXZz2/
 IswYeGB9mlQZDxn6SrwQ/VNMLIEQVdhL0EwhIXCJS4/4epvRP9Lt7t4SJjJtkQIJyHUI
 O+lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714193431; x=1714798231;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eTTqh4tVK7J4k/2+rdaNwgcyYffbEPxsziKQodGk2xA=;
 b=WHV4LUydCzF3tLLuuxbq8RZNwBnHn/F/51xxzX5wilov/pQW1lOvnxg6RF1bQ02Od0
 AYweCyEBOqDO4734p+Y3bswM2XyDCqQyNFrFI2wiKVmcOOhgg2ewqMkFVIbT8WGEvuDx
 lcLDaa+F1CB2YZZVZIr9CR3nNgEO4s6f0fTCPNns6HFRttRjv75/8ckU8DNWXgpysmEO
 fjQEpTGT5s779DJhzM1vyVzNw/54aW4nuKRwmPSGlR15/C+hcphLzu4d8qQJSsycpn0c
 QH9+W4uvGTa2YxOZx7tPtJPKGXquxtWw31MtkF/7Pw3TzlGZ6p8SOG20+WPN62QZfl5L
 CdPg==
X-Gm-Message-State: AOJu0YwTDgMllsaNaIfctoV0FyWRpv4wpwIUFDUuAY9kGKu7RXThsiPT
 3kh9avBKRLEjuoRfjaE5uYQgPkS7jK7WYrkDikoEGha2AyZnoDSIDBTMPgYH
X-Google-Smtp-Source: AGHT+IGRzOBwYBTkwB3GLPM/O5/vOt1JZivbu5JwYnjc5fI0/FJvzIH5Gqb/07IY7GZt3+GyL3NGZg==
X-Received: by 2002:a05:6a20:1050:b0:1ad:7c58:6a74 with SMTP id
 gt16-20020a056a20105000b001ad7c586a74mr5122050pzc.23.1714193431154; 
 Fri, 26 Apr 2024 21:50:31 -0700 (PDT)
Received: from dev.. ([2402:e280:214c:86:d75f:35bf:3e3a:ae80])
 by smtp.gmail.com with ESMTPSA id
 s12-20020a17090a5d0c00b002a005778f51sm9611928pji.50.2024.04.26.21.50.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Apr 2024 21:50:30 -0700 (PDT)
From: R Sundar <prosunofficial@gmail.com>
To: p.zabel@pengutronix.de,
	airlied@gmail.com,
	daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org, javier.carrasco.cruz@gmail.com,
 R Sundar <prosunofficial@gmail.com>, Julia Lawall <julia.lawall@inria.fr>
Subject: [PATCH linux-next] gpu:ipu-v3:pre: replace of_node_put() with __free
Date: Sat, 27 Apr 2024 10:20:24 +0530
Message-Id: <20240427045024.7083-1-prosunofficial@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

use the new cleanup magic to replace of_node_put() with
__free(device_node) marking to auto release when they get out of scope.

Suggested-by: Julia Lawall <julia.lawall@inria.fr>
Signed-off-by: R Sundar <prosunofficial@gmail.com>
---
 drivers/gpu/ipu-v3/ipu-pre.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/ipu-v3/ipu-pre.c b/drivers/gpu/ipu-v3/ipu-pre.c
index aef984a43190..95830cf8fa3e 100644
--- a/drivers/gpu/ipu-v3/ipu-pre.c
+++ b/drivers/gpu/ipu-v3/ipu-pre.c
@@ -113,8 +113,8 @@ int ipu_pre_get_available_count(void)
 struct ipu_pre *
 ipu_pre_lookup_by_phandle(struct device *dev, const char *name, int index)
 {
-	struct device_node *pre_node = of_parse_phandle(dev->of_node,
-							name, index);
+	struct device_node *pre_node __free(device_node) =
+		of_parse_phandle(dev->of_node, name, index);
 	struct ipu_pre *pre;
 
 	mutex_lock(&ipu_pre_list_mutex);
@@ -123,14 +123,11 @@ ipu_pre_lookup_by_phandle(struct device *dev, const char *name, int index)
 			mutex_unlock(&ipu_pre_list_mutex);
 			device_link_add(dev, pre->dev,
 					DL_FLAG_AUTOREMOVE_CONSUMER);
-			of_node_put(pre_node);
 			return pre;
 		}
 	}
 	mutex_unlock(&ipu_pre_list_mutex);
 
-	of_node_put(pre_node);
-
 	return NULL;
 }
 
-- 
2.34.1

