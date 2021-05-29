Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC7539499A
	for <lists+dri-devel@lfdr.de>; Sat, 29 May 2021 02:30:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EFAE6EDBD;
	Sat, 29 May 2021 00:30:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C43C46EDBD
 for <dri-devel@lists.freedesktop.org>; Sat, 29 May 2021 00:30:04 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id e17so7795069lfb.2
 for <dri-devel@lists.freedesktop.org>; Fri, 28 May 2021 17:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yZIqsgA1Lh09RkYl8ksbBJIFXUrl05mu5vGFuwxMnW8=;
 b=RwAJcrrEdCTKU/GeYFPqXAX0uIvNV9wrmMCATzpls4XDa1rnEUPF5AwtzHTsDpPREv
 b6zebfYmGK9a7pH4JawxgV4YZ3BjGqWexgImARSSzS5lijgvM5ZIliQjksgyAdjZzOKn
 rxGBRviLoyXPX1yhtD9r84FaPVe0veu1af0XWWyTxGwNeofylkfvBOY4uba2tu+3RHk3
 bne+E56VvA/QNilIoofOnLBomiLCmhPVJkSaQNmA46yjOWgEPKy/aLkG0mL8tHvFWiga
 Hu7cY+lFy/5NANlsVGT0QwiCmgC+Vmt5hInW9btZEgtyrR5Bwgldy2RqWiOf4HQQ0Sqo
 B5rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yZIqsgA1Lh09RkYl8ksbBJIFXUrl05mu5vGFuwxMnW8=;
 b=jBzkP5Pv+cZy+MfuG/6BV9t6hKzgR4VXS2zo/RERbqr7lTzCxbijIzAUaWkgkvvAw5
 QwvCMOc1vBTjwymHMyvHgag1fjfJzasEvR4/3B5gg+dANZ0g581SJa69Fd3WeOsLF7FF
 A4Jc9k1hUQP8eRo3aOQdeL7jRq8uHRqzOYPX7HpT2RwUFKVBWSwvHdJMfN+OS1jr02J2
 0eZIR5dbZvCH3LslTS4uzzmKCc7dlSvMdNlFxPiLzt4GS1a5La9PQ60oZzpdP105nvtq
 2/aq5BRdtfWALauEAZErCnYi57AEkFAzXJ5ifnqzoeiDMvQympeO3oTg8XdrVtJ6v9is
 7BHQ==
X-Gm-Message-State: AOAM531RuGuku2UzWuWQ/Ur6xsHombdFl09tf1BPGp+eR8HE4+XyQd9Y
 y48dW6Yb9cbjLB61fNdLSYtckA==
X-Google-Smtp-Source: ABdhPJxZSbLMPOq9cw4iChTqfrSO8TGm74JKCgQc1YSMHM2vxM+bbGzcrb9u3OS6RZfss25yJbBBNw==
X-Received: by 2002:a05:6512:3d0f:: with SMTP id
 d15mr7539846lfv.639.1622248203251; 
 Fri, 28 May 2021 17:30:03 -0700 (PDT)
Received: from localhost.localdomain
 (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
 by smtp.gmail.com with ESMTPSA id z24sm590029lfg.179.2021.05.28.17.30.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 May 2021 17:30:02 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@siol.net>
Subject: [PATCH] drm/bridge: lt8912b: Drop unused includes
Date: Sat, 29 May 2021 02:27:59 +0200
Message-Id: <20210529002759.468964-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.31.1
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
Cc: Adrien Grassein <adrien.grassein@gmail.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Lontium bridge is including legacy header files for GPIO
but not using them. Delete the includes.

Cc: Adrien Grassein <adrien.grassein@gmail.com>
Cc: Robert Foss <robert.foss@linaro.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpu/drm/bridge/lontium-lt8912b.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt8912b.c b/drivers/gpu/drm/bridge/lontium-lt8912b.c
index 443f1b47e031..4ff091ecd8b4 100644
--- a/drivers/gpu/drm/bridge/lontium-lt8912b.c
+++ b/drivers/gpu/drm/bridge/lontium-lt8912b.c
@@ -7,8 +7,6 @@
 #include <linux/delay.h>
 #include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
-#include <linux/gpio.h>
-#include <linux/of_gpio.h>
 #include <linux/regmap.h>
 
 #include <drm/drm_probe_helper.h>
-- 
2.31.1

