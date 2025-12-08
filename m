Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C698DCAF3FE
	for <lists+dri-devel@lfdr.de>; Tue, 09 Dec 2025 09:11:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F0A010E498;
	Tue,  9 Dec 2025 08:11:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="NgexSlOI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A60210E096
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Dec 2025 16:17:15 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-37d056f5703so40898321fa.0
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Dec 2025 08:17:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765210633; x=1765815433; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=z7nJjXMSCH3O7i7wnN70ip0JHlJNLYigJVTNMrHiOuQ=;
 b=NgexSlOI71jiy+/+FWRyWbsBwb5illY1Z/vG9V5TGIzRo7EPxw8FYCAmXuGcq5ONOG
 J9WqpORXZ10loBVlVKEQQss2gsAWedUh1jYMQFKqBK+M7v/OVi1PvlpJAEEt51mIWNmk
 DB7KZCzicM0GDtifPkmXlxvLfoK64xeoasHXkVLVk1Ya1HUDl/MaaLvIu1OhTkKY0Z2f
 5T+0KXgwIcjIwuQRwPwJ3ai7dGf5HAV8S+PzIXcfqE3jge6A4TnwoCDGf9mSn349KNJj
 r2EFofmL8TEaw5VEcnn4nRzuwtlwfr17JcAPHfRtvCTmN00kQprG2eKG1RMWj/lhdE9A
 KyGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765210633; x=1765815433;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=z7nJjXMSCH3O7i7wnN70ip0JHlJNLYigJVTNMrHiOuQ=;
 b=D4Ogy6WQACGjqvR2qrRiAQLbVhDY/puLsMrJeGg92xUENNghS7l/J2nCgbf7bVfZKD
 85KyAswYldkiLxYQ99Xeis3WVFroSQPyU0lu76oA4/awLKhNox5W596xrZliNEurI7TQ
 a0B0s4cwARD0sp2pExnhserZAGwNB7oUfzyJd/OLc6lotRyGkr7LhYH9j4KkURmQEPqn
 QCGNHBDKPsCRNu65V2MHIYpfMZ03cgwoMzYcKlsAziWlZ7DNUmnYyhrqPuGzKX4llph8
 Ecc76S8FnqzQtnNHe8H+ooBIURwLBjzGAwrPzVFiOG98leM3zhaIYDN3IONYkRQWNjTj
 a4jA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVNlUbNLXYhp6DU+OQMM2QyAKfF3XnWrDddNDPyG5KQQGN2NgpiQYEcMYEf8nAe/qtic27vSEEyG5k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzeIL70Gediyp2o/UDeWSM4CsSwlerJem6METePXA+3osmEEaM6
 6d626p7hSnJA6z9TmIp7PN7FC0qn30duF6MGZGonibmJ6W1URMV2M8Wh
X-Gm-Gg: ASbGncsqhvvh2rO69davtcAsCAhFDP/02j7hiWKeYnaazU0HOFJnh+uqU9JkU9WFjCD
 qJ91U7MXDZr6XtzcKg78X4rlzra4u09vdRfbuDwdwmX7yfclGaA3yASg0slgDkEZFl0QrRPl5Kv
 8hQfeI+DXivCnWU2ly3EN7RCo6Hnk7WZMApHNKaJ3jyiYWxMbbM0k/KNZyhuwIJGPKutcjX3Mc/
 JJgZOQ3mrNCK4/JVhYPquel/8JFLMVDjomHyo4yzXhgN89wlhywC57hnug0LLkVWtAiW5/Q9lsX
 al99fYLGdAq/KSfXHTgRyptMKHBvTuC09x724jIr4t5bO5Ly91X1oHXHKovmZV65O1tBwCwFZpm
 OTn+Z51p/liu+2kbol7A2S0bFfmuQHwIliYG7ujTnX7K53Vgq9ct2HfuRTgLXWUllP1SeUcvjrk
 u2L+JKNX+LxXGRdU70lUM=
X-Google-Smtp-Source: AGHT+IFr7FhRxhcTqn7kcvbJ5tpva+b++9boYdL4/5/yGrtNZJDW6W18YZ4mLRoP6TNs6AH6QeklVg==
X-Received: by 2002:a05:651c:4212:b0:37f:a216:e450 with SMTP id
 38308e7fff4ca-37fa216e503mr2482261fa.13.1765210633270; 
 Mon, 08 Dec 2025 08:17:13 -0800 (PST)
Received: from vovchkir.localdomain ([95.161.223.42])
 by smtp.googlemail.com with ESMTPSA id
 38308e7fff4ca-37e706634cdsm39921711fa.48.2025.12.08.08.17.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Dec 2025 08:17:12 -0800 (PST)
From: Vladimir Yakovlev <vovchkir@gmail.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vladimir Yakovlev <vovchkir@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/bridge: lontium-lt9611uxc: use irq as optional parameter
Date: Mon,  8 Dec 2025 19:17:08 +0300
Message-Id: <20251208161708.3763458-1-vovchkir@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 09 Dec 2025 08:11:41 +0000
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

On some systems the interrupt pin may not be used.
In this case we exclude DRM_BRIDGE_OP_HPD from supported operations,
after which a polling thread is started to detect the connection.
(the default polling period for DRM is 10 seconds)

Signed-off-by: Vladimir Yakovlev <vovchkir@gmail.com>
---
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 26 ++++++++++++++--------
 1 file changed, 17 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
index 3868ad05e011..4d550cd1a9a1 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
@@ -851,19 +851,25 @@ static int lt9611uxc_probe(struct i2c_client *client)
 	init_waitqueue_head(&lt9611uxc->wq);
 	INIT_WORK(&lt9611uxc->work, lt9611uxc_hpd_work);
 
-	ret = request_threaded_irq(client->irq, NULL,
-				   lt9611uxc_irq_thread_handler,
-				   IRQF_ONESHOT, "lt9611uxc", lt9611uxc);
-	if (ret) {
-		dev_err(dev, "failed to request irq\n");
-		goto err_disable_regulators;
+	if (client->irq) {
+		ret = request_threaded_irq(client->irq, NULL,
+					   lt9611uxc_irq_thread_handler,
+					   IRQF_ONESHOT, "lt9611uxc", lt9611uxc);
+		if (ret) {
+			dev_err(dev, "failed to request irq\n");
+			goto err_disable_regulators;
+		}
+		dev_dbg(dev, "Uses IRQ\n");
+	} else {
+		dev_warn(dev, "The interrupt (IRQ) is not specified in the DTS.\n");
+		dev_warn(dev, "Check the interrupt (IRQ) or polling will be used!!!\n");
 	}
 
 	i2c_set_clientdata(client, lt9611uxc);
 
 	lt9611uxc->bridge.of_node = client->dev.of_node;
 	lt9611uxc->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID;
-	if (lt9611uxc->hpd_supported)
+	if (lt9611uxc->hpd_supported && client->irq)
 		lt9611uxc->bridge.ops |= DRM_BRIDGE_OP_HPD;
 	lt9611uxc->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
 
@@ -892,7 +898,8 @@ static int lt9611uxc_probe(struct i2c_client *client)
 	return 0;
 
 err_remove_bridge:
-	free_irq(client->irq, lt9611uxc);
+	if (client->irq)
+		free_irq(client->irq, lt9611uxc);
 	cancel_work_sync(&lt9611uxc->work);
 	drm_bridge_remove(&lt9611uxc->bridge);
 
@@ -910,7 +917,8 @@ static void lt9611uxc_remove(struct i2c_client *client)
 {
 	struct lt9611uxc *lt9611uxc = i2c_get_clientdata(client);
 
-	free_irq(client->irq, lt9611uxc);
+	if (client->irq)
+		free_irq(client->irq, lt9611uxc);
 	cancel_work_sync(&lt9611uxc->work);
 	lt9611uxc_audio_exit(lt9611uxc);
 	drm_bridge_remove(&lt9611uxc->bridge);
-- 
2.34.1

