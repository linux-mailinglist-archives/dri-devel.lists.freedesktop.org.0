Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA75EB2F802
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 14:30:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 354BF10E968;
	Thu, 21 Aug 2025 12:30:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="TeAp6uf7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5535510E968
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 12:30:36 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-3c4368ab352so494503f8f.1
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 05:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755779435; x=1756384235; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Bt/Zd5DPOzcwiv9QP5TYavZsENkthIU6GtnKmDspSLI=;
 b=TeAp6uf7aD25n5H1c93YfDlZoc3bSKUHlPJm3eWwfxgIQmPd5JHdlW9lSBP0XTK/87
 aqjJfZkGgq7vhmXblszUFIg/w+grLJfYddjki/Ivf/Vz4saurZ5KEcNn+SjSXPTpCyki
 KrJ/Qi8I7UBVgMQUBVRn7xlUQVyGu6XzoY5Hhc+42GPX2ai8zvF9fWQ1dz5wSx+PxE3Z
 2sJ/O2avX77LCPC26vySep0jr2FC2tiPhFo4vNRzp/eYxBCtWSpvb19e84V7P09AAP0x
 iOFWDJJVQxiq560iN5UJ7eA17jQuzgxn5UhDekA7q9I1jBoayxEbyqxA7pJBr4jp8RHX
 QJqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755779435; x=1756384235;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Bt/Zd5DPOzcwiv9QP5TYavZsENkthIU6GtnKmDspSLI=;
 b=laMd1NceSzxHgnqqEYI+a/t3E4VA3AlGsUaQf80MbqBgIQPJNPeMv9E3YPFKmtBcTB
 XkGXb4ICtG5GC0+BD/csDYgC6eey1tTRYzw+9b1KtnEBAA9Imt8w2yBMxCQm+BKlumM8
 V5gKwK7Ev5sO2c4u2dOwcTl7Qw8N0p1NvDS8Ty3ez7+kD4x7ioXc4nFfLy7JFoWzJ/KA
 9aSuCOMmjeF9o54xequNR6xWcdHHfdnaPDA019W9ALqyGENtEW+AYY+OOFbe76aatNCS
 RPDOkpMoLlZhEey/Zje689nvIw+V3m9fU4ZLY644bg2PFUxauboMcTHkrgRBW3raMufC
 jRCA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUEmHum03Iwh+POU4wppsYAUdgyYSWuICPs1RIoXFguyE9sqfhjX8d8EC7e1tLx5w2QAKzhu4AK3HE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxQvrUqWdjc2FIGiZUrXXiajNeDMnjeG696adQq5Dp8AUa/cbcT
 Lec3w0Ld6i3fLDRwIixY6syy5RQ2Bbl2PnGnEGEpR3gBEZAtzw2KVbp1KJGTophEUwk=
X-Gm-Gg: ASbGnctrX5h0KefKf9LNpjVczxTVOKcErUcBMb9xEpHgstVmBPzVdrI70S933FOO10N
 XolVfJqTcQHQNhRT9sA98tex8fJ2WoejycKRjoKx+F1iXsB7o4NSJuj/iAlJaJ3nMhYljLCrn2g
 WFmZREvZqNPMhx/EatWnpIa5AeW3nuL/atl/0XPs2wKEOhYHYL6E0Da0qXP2v0mx7rL6wHW22F8
 xPSR8mpvOXHQhFnoHhFuIU6qoztwSB9g57/qIbTGYBpHg0TNLjuMk6U8CXFa8qn2ohr3XIvCENz
 Tem/00aojuVXaS5Xkq5xQLO5XgxNBeasS/ModxDs8quOJEvnqtuL5aL81MU16RvZM9NckvyBWz1
 gYCR9rvoYYRu1Nnbq1xCf1jsr9HM=
X-Google-Smtp-Source: AGHT+IHczsI0rrLUONRdJrdFfmVYfViMf6wrSC9S1N+ePao3CEYpjrXgB6Zm5NwMz2CppJHb6eEdYQ==
X-Received: by 2002:a5d:5f4b:0:b0:3a0:b84d:60cc with SMTP id
 ffacd0b85a97d-3c494fc6fcemr1981289f8f.2.1755779434797; 
 Thu, 21 Aug 2025 05:30:34 -0700 (PDT)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-45b4db6855bsm26892795e9.17.2025.08.21.05.30.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Aug 2025 05:30:34 -0700 (PDT)
Date: Thu, 21 Aug 2025 15:30:30 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Joseph Guo <qijian.guo@nxp.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Subject: [PATCH next] drm: bridge: waveshare-dsi: Fix NULL vs IS_ERR() check
 in probe()
Message-ID: <aKcRZo7BkfH1fD2c@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
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

The devm_drm_bridge_alloc() function returns error pointers, it never
returns NULL.  Fix the checking to match.

Fixes: dbdea37add13 ("drm: bridge: Add waveshare DSI2DPI unit driver")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/bridge/waveshare-dsi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/waveshare-dsi.c b/drivers/gpu/drm/bridge/waveshare-dsi.c
index 01c70e7d3d3b..43f4e7412d72 100644
--- a/drivers/gpu/drm/bridge/waveshare-dsi.c
+++ b/drivers/gpu/drm/bridge/waveshare-dsi.c
@@ -147,8 +147,8 @@ static int ws_bridge_probe(struct i2c_client *i2c)
 	int ret;
 
 	ws = devm_drm_bridge_alloc(dev, struct ws_bridge, bridge, &ws_bridge_bridge_funcs);
-	if (!ws)
-		return -ENOMEM;
+	if (IS_ERR(ws))
+		return PTR_ERR(ws);
 
 	ws->dev = dev;
 
-- 
2.47.2

