Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3DE820BC12
	for <lists+dri-devel@lfdr.de>; Sat, 27 Jun 2020 00:01:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9F0A6E33D;
	Fri, 26 Jun 2020 22:01:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A9336E33D
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jun 2020 22:01:43 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id t74so5962031lff.2
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jun 2020 15:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eNqLC6BTqUfTzBnlYnxi6sjWdzTsAlghT2ouulEqSWM=;
 b=tvKKfPugeM/JJQE4b4A8jiFD+7g2oK3iA5foYoN8kjkNpZE+vy/Fpqj/ZtF6syG6sg
 I2NtQGFPx3B7Tnuplg6WJtphlxHNbnGepZKw6VK8LoPLe6ZnjlAUsme+FLBW/b9hdFAH
 OSmC/0oXckzg4LzMhb/qAuVtTRKV6E9Y89OTq67s6fpLgIiUlohPdtTx+b+4FE9lNxb+
 9W/PIFPZKWqeWL9JYRN20zvfq2GG2bHhOf9R3soWlaUDnYw7yy3qJbUmFrH3xRlvTnRf
 2ymHKqqGXtUdyAlJXVVwfTQORapXhe+e2ynuIO5q9oUJfbtZfSRI4iRAh3yTyRFR1BP+
 LDZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eNqLC6BTqUfTzBnlYnxi6sjWdzTsAlghT2ouulEqSWM=;
 b=WcUjclg0W9g7uydcanmWm4vnfEZCBaTTnagUVH25S4qGlI5y1VKNptgUeK+vg5zq6T
 3HhU5iRraS7/tSgtn1dXpHqvkfVs3TpXIDkiv1ArSs1hn3UWZweiR/AW/vaUIui+5Zu4
 5p7tu87HWyZ3mMJS8yYMshHlK+uaMzFNi3MrjzG484bWO3TQzFJlC8EWcty1FD1dcBqY
 1SG1ElKojaZd8eaBVKj4bhxIHcqwK88f07KVsJBLd3Tj05ZuA6Rpk52GNykdgN1FMy83
 bSDiHt4/AXs+rZCM4tKi/tmYaXAoHOMtdS7ycYHwj2vs9sXKHiBm+XDnh9naqI6yW/KX
 tLdw==
X-Gm-Message-State: AOAM531gAljFs59xhh/ZNM9meOhqC9Oc8wN4fRMjamQSj5vpp1gD3oU4
 ROG7rVolyDsGid+N9Ltj4G2wEIbj1C8=
X-Google-Smtp-Source: ABdhPJyJNsjojTnTw11jyH8Arti95yjRHSTwroFwu/rX2J872aSBHmiNMjkaai3ikWMVmqz89LQgmA==
X-Received: by 2002:a19:ccc5:: with SMTP id c188mr2962661lfg.163.1593208901205; 
 Fri, 26 Jun 2020 15:01:41 -0700 (PDT)
Received: from genomnajs.lan
 (c-d63ee155.152980-0-69706f6e6c79.bbcust.telenor.se. [85.225.62.214])
 by smtp.gmail.com with ESMTPSA id 22sm5704991ljv.26.2020.06.26.15.01.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2020 15:01:40 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH] drm: gma500: Drop surplus include
Date: Sat, 27 Jun 2020 00:01:34 +0200
Message-Id: <20200626220134.340209-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.25.4
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This file includes <linux/gpio.h> but does not use any
symbols from it, drop the include.

Cc: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpu/drm/gma500/psb_intel_drv.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/gma500/psb_intel_drv.h b/drivers/gpu/drm/gma500/psb_intel_drv.h
index fb601983cef0..9221d1f545b0 100644
--- a/drivers/gpu/drm/gma500/psb_intel_drv.h
+++ b/drivers/gpu/drm/gma500/psb_intel_drv.h
@@ -13,7 +13,6 @@
 #include <drm/drm_encoder.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_vblank.h>
-#include <linux/gpio.h>
 #include "gma_display.h"
 
 /*
-- 
2.25.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
