Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 27528189637
	for <lists+dri-devel@lfdr.de>; Wed, 18 Mar 2020 08:31:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1CCF6E1F6;
	Wed, 18 Mar 2020 07:31:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 861476E1F6
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Mar 2020 07:31:43 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id z13so2007566wml.0
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Mar 2020 00:31:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9LR3jTw01hA+J6RgNPOdky7iaFs1yHmLXGEAx3jHiBU=;
 b=hmk7hqHwJVIwneHgGLhDE+CBJ0XKU524ZBz0tDqMeYFH1+QT2KatZotiqB7UYzyv+t
 y/UMVrPw+fofu5msqodkKbPzs77S68m614JtZKpIpD+af1ua1vTKMcj5pVNNYPlAyGxa
 1SK2N11MQXjTdCQ6Tuk8gY8J1PrsswxfZ8N+A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9LR3jTw01hA+J6RgNPOdky7iaFs1yHmLXGEAx3jHiBU=;
 b=ZoPYLo8PDm7yYd4FEXfS48LAWMaI+vhE4tJ+c32SVuwGidOGkm7NWrvJW8yQuPwjyC
 q9XrWxkTmuJmKWbhjEXfrkz0fkoZJGOJKDHAh7Iu0gpWqKcI/kKKLTPfxi4287VwmryP
 g3xZ1EmJ8WJjK3/9iJ1Ivc90UnfwrTyGV+PM0/7WyixbD6iBR+MpZG6wAQoxfNdn6VGr
 si+lc4lrVh/wWrTpjRASeXfUX3rAgMTCBXh77WuaBgClO16lP9BvEKAH9oE8em8zCJ4M
 F14qVs9EYodwrKnFzOZ2PrG8n/hs48GgbFoUU8Yqchl7KQ3J96jj2zHqxXkqtt/5cBdM
 V08A==
X-Gm-Message-State: ANhLgQ2hHP1og18l9wAaLtj1Yh5hZXgk02tpzdieP8aK0CoZ9vf2wgP2
 luDQRCev9j3lT9nZNqWUWI6PjAtxeR1DNGZA
X-Google-Smtp-Source: ADFU+vtFnlo7vyFXW8atCEfNLBkqQi3AuLcmoeHFNyxY8S9o9P00vsSn47ruUMz+Wix6wxWKtoEntA==
X-Received: by 2002:a1c:7711:: with SMTP id t17mr3505686wmi.108.1584516701793; 
 Wed, 18 Mar 2020 00:31:41 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id k133sm2858545wma.11.2020.03.18.00.31.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Mar 2020 00:31:41 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/hisilicon: Drop unused #include
Date: Wed, 18 Mar 2020 08:31:22 +0100
Message-Id: <20200318073122.1032945-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Thomas Gleixner <tglx@linutronix.de>, Sam Ravnborg <sam@ravnborg.org>,
 Allison Randal <allison@lohutok.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm_encoder_slave is really not something anyone should be using,
the last real user is only nouveau.

Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc: Allison Randal <allison@lohutok.net>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c b/drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c
index f31068d74b18..d399c1077242 100644
--- a/drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c
+++ b/drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c
@@ -20,7 +20,6 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_device.h>
-#include <drm/drm_encoder_slave.h>
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_of.h>
 #include <drm/drm_print.h>
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
