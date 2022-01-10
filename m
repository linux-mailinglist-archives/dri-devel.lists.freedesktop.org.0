Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED52489779
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jan 2022 12:31:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1697614A918;
	Mon, 10 Jan 2022 11:31:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D97014A914
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jan 2022 11:31:52 +0000 (UTC)
Received: by mail-pg1-x52e.google.com with SMTP id y9so10853058pgr.11
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jan 2022 03:31:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yaFj6yd5t+Lu5pWt+znS6FpfZLmcYMQjoQyc1QJ89Aw=;
 b=FTE4tRWuWsoVY5qVuiDckg5oqtLZBnPUadJ9rcpVMOmlT1dsJyqEomd/AvJmRwZ4ka
 PgdWUlzj4FB4g1aglsuVTNzjtanWSPPx7GHwWqeQpLXExHaBFBiNv5kp5f3wqYJlnZcE
 LlpppBFcy7F6eTgGgS1u1/sf+UMzAVxodpYfw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yaFj6yd5t+Lu5pWt+znS6FpfZLmcYMQjoQyc1QJ89Aw=;
 b=n+oIv0NBqnANdyNd/37WyGqNGVJqQFU7huLaYLUeYodF5n43NAmFMnFNlJqULoLqiP
 NYg0QzE60lapOUBFZImfRJ92+lze8e9mTZRI1eUXUJ/w13G9lILvlZUjUIR1L518fHYH
 7CRQH0pazdhBluyN1/5drE7FjpH9eHqMzh+sANuoHIdRZMrChVSzhW8yeKv+ceGvp5Wu
 hBq+pn3yL+Qs/+M1QS+jdFYp5y5Wa3VUICjTXU37fJPVmoO1pl6DZgoJS+Fokw7BymZA
 3g75VxZsuK+EKwsFSY65z5mi9EvH1eJv70MpFeMmYpqv83D6+Ik+5tT3labO1Mdv4wv5
 4/3A==
X-Gm-Message-State: AOAM5317VVv7vV0J6DrU71N61j+VsFpoV5tXU8dTheqbU6dvl+BHcwvO
 u6us6gOAqMs1xOp4lJs9MkoC9w==
X-Google-Smtp-Source: ABdhPJx3M0eaPH5Q9bpJR08khkUPnJt6aAJkLDyBpP/iRibG8z5PD5HHJJ2M/aqp5xsBTItrbxzTEw==
X-Received: by 2002:a63:3ecb:: with SMTP id l194mr6056715pga.447.1641814312112; 
 Mon, 10 Jan 2022 03:31:52 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a0a9:9b82:2968:cfb9:c6c6])
 by smtp.gmail.com with ESMTPSA id y10sm8790638pjy.24.2022.01.10.03.31.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jan 2022 03:31:51 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Subject: [PATCH] drm: bridge: chipone-icn6211: Drop unnecessary bridge type
Date: Mon, 10 Jan 2022 17:01:40 +0530
Message-Id: <20220110113140.27819-1-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: linux-amarula@amarulasolutions.com, Jagan Teki <jagan@amarulasolutions.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Explicit assignment of connector to bridge type during bridge
addition is optional.

Some of the bridges like ICN6211 has panel to be connected and
that panel driver has taken care of associated connector type
of it.

Drop it.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/gpu/drm/bridge/chipone-icn6211.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/chipone-icn6211.c b/drivers/gpu/drm/bridge/chipone-icn6211.c
index 23c34039ac48..c60170865b74 100644
--- a/drivers/gpu/drm/bridge/chipone-icn6211.c
+++ b/drivers/gpu/drm/bridge/chipone-icn6211.c
@@ -238,7 +238,6 @@ static int chipone_probe(struct mipi_dsi_device *dsi)
 		return ret;
 
 	icn->bridge.funcs = &chipone_bridge_funcs;
-	icn->bridge.type = DRM_MODE_CONNECTOR_DPI;
 	icn->bridge.of_node = dev->of_node;
 
 	drm_bridge_add(&icn->bridge);
-- 
2.25.1

