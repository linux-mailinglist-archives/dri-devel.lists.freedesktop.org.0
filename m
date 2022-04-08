Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B8C84F9280
	for <lists+dri-devel@lfdr.de>; Fri,  8 Apr 2022 12:04:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3380810F0EB;
	Fri,  8 Apr 2022 10:04:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com
 [IPv6:2607:f8b0:4864:20::f2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20B1B10F0EB
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Apr 2022 10:04:11 +0000 (UTC)
Received: by mail-qv1-xf2a.google.com with SMTP id p8so7098146qvv.5
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Apr 2022 03:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uDYIyqRKa4ljv3bdWbjMFdUVSWTyxOVGEtnHDdVjPis=;
 b=Kv7OjmJfTmHInHTCBgArEwZ05WO0BHqMZbTJ16WdCcgLTs8sNa71jRfD3FNs5gf84f
 IjU9LT7x3tsnc1sRz9WpGb7WrZtGHXEePmkxNnbK/zAIohoeTWZVN0dBH5zohot6CCde
 jTy3asZu1tIavz9LbzJxMjfB1gGqYoU9TDaKWFtSHD+Ox/sM6iL0cGU6aDHVcTGFKTr4
 /gciXK589BI6L2cajYsDEHSBhsiGf1tIqGVkoJRRxxnrnTP+QTYK+zm4jN0ASnocq9kP
 62V/7didh05neKxyyfxiFiWTVcOVqTrYvzw+huWvWGa/MQTETHxAJ0xCc+dVRhOrp7C1
 xBMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uDYIyqRKa4ljv3bdWbjMFdUVSWTyxOVGEtnHDdVjPis=;
 b=x4aqWNtQQnhEBwAmVxuka8DYmKAp26Pyitoxwq7MDWRWp8acjiDI8J0fBlDf03nwS2
 OXKZdV5kCLPeoS1nrv5BQmRcj+EyrVQjsH1LCPWcd7M4FHGZgUaKStPYmUQgSrD9Cl+Z
 ijtpB/zsIQojEplrrSgWGG/zRagvjT/gtLwVRgOUfZMiNV3/eo1rY+4MMGMwGJyJEA+f
 wK1msiVXa4HZcHAY73BxdWAPnuCkm6nHfMNn5eCSuI4tS/do1TrLNiLu1+3Lv7/BWaTR
 AT3X332I0OUqEYCo6QYxwam+DJp35A4yzS+i8+0TG+Vu7CndDPQ7aRPaa3L8Nm7vr2QC
 dPnA==
X-Gm-Message-State: AOAM531MwtEHqkwZ1vnY3Ky0seZXlK0UASSy4tukfC+UCW0AIhMnPgxI
 FL9pzLnOmVNzDI5fqRgj6bI=
X-Google-Smtp-Source: ABdhPJypq+E+nDV6hH6cRkMj7BSxYRwSwDfj38mgPVU5agSVzunZiQfgbqQYq/YmTbKwuKiQD3NkAg==
X-Received: by 2002:a05:6214:d41:b0:442:19b7:62e6 with SMTP id
 1-20020a0562140d4100b0044219b762e6mr14990676qvr.17.1649412250156; 
 Fri, 08 Apr 2022 03:04:10 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id
 d3-20020a05622a15c300b002eb9af4c945sm19621632qty.3.2022.04.08.03.04.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 03:04:09 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: lv.ruyi@zte.com.cn
To: andrzej.hajda@intel.com, narmstrong@baylibre.com, robert.foss@linaro.org
Subject: [PATCH] drm/bridge: anx7625: remove unnecessary flush_workqueue()
Date: Fri,  8 Apr 2022 10:04:00 +0000
Message-Id: <20220408100401.2495529-1-lv.ruyi@zte.com.cn>
X-Mailer: git-send-email 2.25.1
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
Cc: pihsun@chromium.org, jonas@kwiboo.se, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, Zeal Robot <zealci@zte.com.cn>,
 linux-kernel@vger.kernel.org, jernej.skrabec@gmail.com, tzungbi@google.com,
 Lv Ruyi <lv.ruyi@zte.com.cn>, Laurent.pinchart@ideasonboard.com,
 hsinyi@chromium.org, sam@ravnborg.org, xji@analogixsemi.com, maxime@cerno.tech
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Lv Ruyi <lv.ruyi@zte.com.cn>

All work currently pending will be done by calling destroy_workqueue,
so there is unnecessary to flush it explicitly.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Lv Ruyi <lv.ruyi@zte.com.cn>
---
 drivers/gpu/drm/bridge/analogix/anx7625.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index 6516f9570b86..65632f584179 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -2744,7 +2744,6 @@ static int anx7625_i2c_remove(struct i2c_client *client)
 
 	if (platform->hdcp_workqueue) {
 		cancel_delayed_work(&platform->hdcp_work);
-		flush_workqueue(platform->hdcp_workqueue);
 		destroy_workqueue(platform->hdcp_workqueue);
 	}
 
-- 
2.25.1

