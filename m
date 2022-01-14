Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2206E48E44E
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jan 2022 07:41:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7AFC10E170;
	Fri, 14 Jan 2022 06:41:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com
 [IPv6:2607:f8b0:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01F0F10E170
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jan 2022 06:41:11 +0000 (UTC)
Received: by mail-il1-x133.google.com with SMTP id u5so3340834ilq.9
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jan 2022 22:41:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NBbp5E1JmkcFNQqkFa6J2rIzcIhIU713VnGqiU+cJwU=;
 b=kcCBDlhpfZ51Gk+7ATdD2Wj6Si5ielRmWhElK8o8weZ/GtFLsJkx1JXGsBBLmBtj8l
 8XGrDC7U6VfQLckPzqPAA80eMThA1YQFl1hVCEsIjg96yhBq8MS9x/whN97YfRlNc38y
 vNsA41hFMm9Jqu4b4e8PWF3T9DhSg9r3ovSZg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NBbp5E1JmkcFNQqkFa6J2rIzcIhIU713VnGqiU+cJwU=;
 b=pb4nXK2o/bf44tqno191Zhf1JILonVr7oVcvxnQ18hxgt3n8zKYzIDp34CfOaCG0pB
 IAJrFYq00a41ZoG5Zg1yaDqnQqyOHimAnLghmI+FKq+Hgzxx7TMtkY2/B3SfqTNgx5Fh
 8R6EvUm+eLMeJGyeVM3lytPtqgECq+1C3rqS9gE1U6fQrgrawJqNNtBkPXLVKeV/tuB/
 QORmdsmDLvyhD8QIDDFE6kbQgYzEotCCJgP7FJ5l3MV/fa0yYKKfqS7N1reLblReTGdD
 5MO8CJsMxP/2ANGizOoaMH8Zc0ALEfM/ONzOqVrBdZDq8TnM7ajxilFl+ikHYdOnRloM
 QEaA==
X-Gm-Message-State: AOAM532Q2uAr0TYLkwHdjV2Quwh15vNGCIMiK21EAqKQmOnikZyFORG7
 /nsSzJp5UMr8V8LHFxkL0ASx9A==
X-Google-Smtp-Source: ABdhPJy+XPW6NhU5hhsaMSGMqhh4ww3gLJxhJwOwVy9kTNEvfWnZGUUeMB3uX/26KDaNqR3lfHhGHg==
X-Received: by 2002:a05:6e02:1c88:: with SMTP id
 w8mr4224902ill.95.1642142471225; 
 Thu, 13 Jan 2022 22:41:11 -0800 (PST)
Received: from ddavenport4.bld.corp.google.com
 ([2620:15c:183:200:666f:a9f8:5c99:aa9e])
 by smtp.gmail.com with ESMTPSA id r10sm3667497ila.32.2022.01.13.22.41.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jan 2022 22:41:10 -0800 (PST)
From: Drew Davenport <ddavenport@chromium.org>
To: ple@baylibre.com,
	narmstrong@baylibre.com
Subject: [PATCH] drm: bridge: it66121: Remove redundant check
Date: Thu, 13 Jan 2022 23:40:12 -0700
Message-Id: <20220114064012.1670612-1-ddavenport@chromium.org>
X-Mailer: git-send-email 2.34.1.703.g22d0c6ccf7-goog
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
Cc: jonas@kwiboo.se, airlied@linux.ie, robert.foss@linaro.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 jernej.skrabec@gmail.com, a.hajda@samsung.com,
 Laurent.pinchart@ideasonboard.com, Drew Davenport <ddavenport@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ctx->next_bridge is checked for NULL twice in a row. The second
conditional is redundant, so remove it.

Signed-off-by: Drew Davenport <ddavenport@chromium.org>
---
 drivers/gpu/drm/bridge/ite-it66121.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it66121.c b/drivers/gpu/drm/bridge/ite-it66121.c
index 06b59b422c69..69288cf894b9 100644
--- a/drivers/gpu/drm/bridge/ite-it66121.c
+++ b/drivers/gpu/drm/bridge/ite-it66121.c
@@ -936,9 +936,6 @@ static int it66121_probe(struct i2c_client *client,
 		return -EPROBE_DEFER;
 	}
 
-	if (!ctx->next_bridge)
-		return -EPROBE_DEFER;
-
 	i2c_set_clientdata(client, ctx);
 	mutex_init(&ctx->lock);
 
-- 
2.34.1.703.g22d0c6ccf7-goog

