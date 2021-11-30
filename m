Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF064636FF
	for <lists+dri-devel@lfdr.de>; Tue, 30 Nov 2021 15:45:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA2616EA24;
	Tue, 30 Nov 2021 14:45:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mta-p5.oit.umn.edu (mta-p5.oit.umn.edu [134.84.196.205])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 000AD6E84F
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 14:45:28 +0000 (UTC)
Received: from localhost (unknown [127.0.0.1])
 by mta-p5.oit.umn.edu (Postfix) with ESMTP id 4J3Q4S4wSZz9vpQT
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 14:45:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p5.oit.umn.edu ([127.0.0.1])
 by localhost (mta-p5.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uLYKw58udA-q for <dri-devel@lists.freedesktop.org>;
 Tue, 30 Nov 2021 08:45:28 -0600 (CST)
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mta-p5.oit.umn.edu (Postfix) with ESMTPS id 4J3Q4S2rrhz9vpQS
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 08:45:28 -0600 (CST)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p5.oit.umn.edu 4J3Q4S2rrhz9vpQS
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p5.oit.umn.edu 4J3Q4S2rrhz9vpQS
Received: by mail-pl1-f198.google.com with SMTP id
 s16-20020a170902ea1000b00142728c2ccaso8314241plg.23
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 06:45:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=umn.edu; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=B6LNCzubAvM1UAFro6OAu5q4vc79ycy1gcnZHWEZqRg=;
 b=QGu9G8DNB3JtXxMeVuLaeVUC5ZHalORVRodgIEuZm54ot4jgPTStUETLOOnXnDbjAz
 Uf1CRBp7h6uB323QQZ2vX/yExi7zKEvrxc22B/BxTYRT/5I2EHBwuPhLnYVt+gAm5bHB
 Uoz07+wDNQ1picLCT1XnAhRXDgWRO6Jzq0N124hRRFGg+LCmxOJCV54Cn7FeIPGM8S8C
 nMpEKI6d7i4Vk448HiLsQl9ZWhwZmhzQT56bNRRZARPwjdw9TgXEr2FrxqeF7I3q2TW6
 qRG4FLZ2xqDfpeoZ5Ov9BX992rw5KQWWsGGQ12FxZknX0Jrgk9Ru8YmSQ+i7OSZSXOnH
 ia5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=B6LNCzubAvM1UAFro6OAu5q4vc79ycy1gcnZHWEZqRg=;
 b=GxQ+p707m8Mqe+ZcxT293gw3q30bHEmtELyi8za/xUjKjATV8MvZOATRZJH8pafZqC
 mgAWcwCm1G/qnRsMCTuSxWSIarxYDBX+9IUj868NA62C2R17jdKLbkQO6d+kPw4Yjw1I
 r60/uMxkbAjT6OTvhJyswilLdqzk/bGFIrF5+EjzkjyaXD0tcI//6F5kiFkqA2ELpVBL
 nJr7mrhF7/gzJrezTrTxlMF0y5qSVLC6uz3l51C83sFmqLCmAm26lL5bFvDPQNBMAmi6
 tXQU1nZrSAT/KSCUszGBNlVuoAA9kjJEnwW2LM0SJzFCuaB2qAqWPrZdT4Q/NP1hvbj8
 fCaQ==
X-Gm-Message-State: AOAM532ugJm1qDbTt+V8lT6da1qoZHgK01WrqV0IhwYHUYr50/C3PX9K
 VrW/Eg/70MRQkOBmFL/LzhBrLuaFTKt78m3UUOOAnFV3eunosyQzLEf9nQmnbFqJTuWB8BvzGo4
 M0ztDu7yNVbuxotrjMJ7a/JevYaHNpNxv
X-Received: by 2002:a63:81c1:: with SMTP id t184mr40045782pgd.26.1638283527475; 
 Tue, 30 Nov 2021 06:45:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx8+3UCv1VwdzMjRJfnSg9Zq7bxFF6U71MKKHXfNkC6U9FcxX7fm3QSgTG6F27ZPHGtBA2QTw==
X-Received: by 2002:a63:81c1:: with SMTP id t184mr40045755pgd.26.1638283527262; 
 Tue, 30 Nov 2021 06:45:27 -0800 (PST)
Received: from zqy787-GE5S.lan ([36.7.42.137])
 by smtp.gmail.com with ESMTPSA id u32sm23701235pfg.220.2021.11.30.06.45.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Nov 2021 06:45:27 -0800 (PST)
From: Zhou Qingyang <zhou1615@umn.edu>
To: zhou1615@umn.edu
Subject: [PATCH] drm/panel/panel-tpo-tpg110: Fix a NULL pointer dereference in
 tpg110_get_modes()
Date: Tue, 30 Nov 2021 22:45:22 +0800
Message-Id: <20211130144522.162262-1-zhou1615@umn.edu>
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
Cc: David Airlie <airlied@linux.ie>, kjlu@umn.edu, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In tpg110_get_modes(), the return value of drm_mode_duplicate() is
assigned to mode and there is a dereference of it in tpg110_get_modes(),
which could lead to a NULL pointer dereference on failure of
drm_mode_duplicate().

Fix this bug by adding a check of mode.

This bug was found by a static analyzer. The analysis employs
differential checking to identify inconsistent security operations
(e.g., checks or kfrees) between two code paths and confirms that the
inconsistent operations are not recovered in the current function or
the callers, so they constitute bugs.

Note that, as a bug found by static analysis, it can be a false
positive or hard to trigger. Multiple researchers have cross-reviewed
the bug.

Builds with CONFIG_DRM_PANEL_TPO_TPG110=m show no new warnings,
and our static analyzer no longer warns about this code.

Fixes: aa6c43644bc5 ("drm/panel: drop drm_device from drm_panel")
Signed-off-by: Zhou Qingyang <zhou1615@umn.edu>
---
 drivers/gpu/drm/panel/panel-tpo-tpg110.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-tpo-tpg110.c b/drivers/gpu/drm/panel/panel-tpo-tpg110.c
index e3791dad6830..ab4b84c1e243 100644
--- a/drivers/gpu/drm/panel/panel-tpo-tpg110.c
+++ b/drivers/gpu/drm/panel/panel-tpo-tpg110.c
@@ -379,6 +379,9 @@ static int tpg110_get_modes(struct drm_panel *panel,
 	connector->display_info.bus_flags = tpg->panel_mode->bus_flags;
 
 	mode = drm_mode_duplicate(connector->dev, &tpg->panel_mode->mode);
+	if (!mode)
+		return -ENOMEM;
+
 	drm_mode_set_name(mode);
 	mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
 
-- 
2.25.1

