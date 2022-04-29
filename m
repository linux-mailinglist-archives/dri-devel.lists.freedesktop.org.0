Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D4DBD5141F7
	for <lists+dri-devel@lfdr.de>; Fri, 29 Apr 2022 07:51:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D470810FB79;
	Fri, 29 Apr 2022 05:51:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [IPv6:2607:f8b0:4864:20::72d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D638710FB79
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 05:51:52 +0000 (UTC)
Received: by mail-qk1-x72d.google.com with SMTP id b189so5172107qkf.11
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Apr 2022 22:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wSVXGhpX7+3tqTsq9MsK0eHVkHax9CnVVMbIrKRPdDw=;
 b=fmuuBxFPSBAuf+kR6aW1QBSGWJabwOZqrtp+tpz8nO9W07mEM7T5UqX7YlGIDU52uA
 r410eXWTSmmOVPL3oT5WdLurXJUG+4WpD6TOgFXT99mnpN3c1CzrIODqw3etBrD9tG4M
 71ZSSkIUnhgoAP0D8l7lucky9atri3irfM3+q5ROXnCL9t1EX/jdeDV8y0KbLnBvFtfm
 yXXGTTG4ZtFRqauo88uIdVYM60Fwhy8f9u3kNs6yT0YrZCnNg38lighR/t2Ao1LjPK07
 NZGGkpkUhEEa7VoEcAGWkBN4Pni6oCucvOH/HbTieiw+RaS2DUNeDmMQ3VQ4+jMeuVN+
 JdLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wSVXGhpX7+3tqTsq9MsK0eHVkHax9CnVVMbIrKRPdDw=;
 b=QuaUaragFyT3uTm6glgss4Gjy9+YOqBd1lGMuB8qiV7ITyI3Z+Vt3wjdUfGXvEDelR
 m7Fv19engeHIaH9E+RivXuURNdtex6+9pRIL2cTPmuv85y7P0nIt8y2J0PYY3YEcpMFA
 dZITuRjLG3dDLH3dHSCrFJIMZvZz9kIr8tivgt+z30zthGO3m5v4HISUWi0+ObvpbXL6
 0rnUyehcxz8uUTvNjiCfRedKG1R9RMZZm2/o1a/oQk2OhcGp/19S8bDH0S/sSu0zBozz
 IhQHhg3oYkm+2OvahiHceBCVzVA979OnS8mWgFHxPUuUYIKXbmnrv8yfeiAr7Bg3hnH4
 d5vw==
X-Gm-Message-State: AOAM532hNxbbS/ZsgWGrBrRibFgBlglPWRrYnJjPUd+vXi9wdPMRGLp+
 ovtak8fvYVrXnimQP3z8n3I=
X-Google-Smtp-Source: ABdhPJw1gCc2UXxhJhiT71GwoRlCH57dMMt23E72MDXt2Kf+ewwW3RM2u1ZV1h3f73kB1kw5bbJHHQ==
X-Received: by 2002:a05:620a:4114:b0:69f:9b84:82a0 with SMTP id
 j20-20020a05620a411400b0069f9b8482a0mr5857387qko.675.1651211511982; 
 Thu, 28 Apr 2022 22:51:51 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id
 w3-20020ac87e83000000b002f33b2cfe62sm1277312qtj.66.2022.04.28.22.51.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Apr 2022 22:51:51 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: chi.minghao@zte.com.cn
To: dianders@chromium.org
Subject: [PATCH] drm/bridge: simplify the return expression of
 ps8640_bridge_host_attach
Date: Fri, 29 Apr 2022 05:51:45 +0000
Message-Id: <20220429055145.3852271-1-chi.minghao@zte.com.cn>
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
Cc: narmstrong@baylibre.com, Zeal Robot <zealci@zte.com.cn>,
 linux-kernel@vger.kernel.org, Minghao Chi <chi.minghao@zte.com.cn>,
 dri-devel@lists.freedesktop.org, andrzej.hajda@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Minghao Chi <chi.minghao@zte.com.cn>

Simplify the return expression.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Minghao Chi <chi.minghao@zte.com.cn>
---
 drivers/gpu/drm/bridge/parade-ps8640.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/drm/bridge/parade-ps8640.c
index edb939b14c04..e2467e58b5b7 100644
--- a/drivers/gpu/drm/bridge/parade-ps8640.c
+++ b/drivers/gpu/drm/bridge/parade-ps8640.c
@@ -542,7 +542,6 @@ static int ps8640_bridge_host_attach(struct device *dev, struct ps8640 *ps_bridg
 	struct device_node *in_ep, *dsi_node;
 	struct mipi_dsi_device *dsi;
 	struct mipi_dsi_host *host;
-	int ret;
 	const struct mipi_dsi_device_info info = { .type = "ps8640",
 						   .channel = 0,
 						   .node = NULL,
@@ -577,11 +576,7 @@ static int ps8640_bridge_host_attach(struct device *dev, struct ps8640 *ps_bridg
 	dsi->format = MIPI_DSI_FMT_RGB888;
 	dsi->lanes = NUM_MIPI_LANES;
 
-	ret = devm_mipi_dsi_attach(dev, dsi);
-	if (ret)
-		return ret;
-
-	return 0;
+	return devm_mipi_dsi_attach(dev, dsi);
 }
 
 static int ps8640_probe(struct i2c_client *client)
-- 
2.25.1

