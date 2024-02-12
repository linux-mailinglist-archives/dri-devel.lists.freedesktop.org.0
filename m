Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F044851D44
	for <lists+dri-devel@lfdr.de>; Mon, 12 Feb 2024 19:50:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85C5410E80D;
	Mon, 12 Feb 2024 18:50:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="d5CrfH35";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com
 [209.85.161.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA39910E7BD
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Feb 2024 18:50:01 +0000 (UTC)
Received: by mail-oo1-f52.google.com with SMTP id
 006d021491bc7-5957ede4deaso2216048eaf.1
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Feb 2024 10:50:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707763801; x=1708368601; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vMsXKmpw6dLT65KkRINMdKyXBzxk9IKeYWz+mH4JfHk=;
 b=d5CrfH35DW0uPKlicq3BzqmHxFZ8XKFrLpkXN3z5cGGFn5MBk3fRC6NrFWzSOoltM7
 e76/cbjgU0GTmjfOZamvzhzx4hYfmoyt1H8ynDJdYYiEJxefBncEoLSaD+FNPRJ5yxRb
 XMKqICpiLuI09+pEEtr1ZOEtkt5mcmc83FFCNENfGfzWtZD8OT7SgGA319bTYOk0PGnO
 iDPEqt/KTqdeWTxf6syS4bI3CuAi6U23rOVFTM5ppRqZhIL30RvzjHzTTU1oAbwxk95+
 KbPLQoXCu4yLpSt1JGRlvoXOAAnyQu01W2gk44omXOahwWlRbc/9c7g+CvvjM4yuE6GY
 bDnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707763801; x=1708368601;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vMsXKmpw6dLT65KkRINMdKyXBzxk9IKeYWz+mH4JfHk=;
 b=lGQ+qqMq5XknbKO8Z/0n2zGEurlD50k+rF2v6bJaQSW7eCfkNHDfQHD2AvSlEg/7VV
 BFdRiu6krgoXTsUsIoSb8hIbX9Ld862ucJCNVSd6cMnLEDpetuSQHubi6jRPKM8OsoWD
 uXbxdm+cTuWM8EtHi8W5H2QRAjM0SzMSIGBVNFLlouJeRSjK0Wi4tgQ/CXeG0WOlwtWR
 edl6gEQaUmLbZ2scweN59k1AfP39Bi+gRdlp5wUwADUzH1LZ6I72mmU3fAS8cS0nhZsA
 fULS4ZoHmE5zOxhfdUP94MAYWls+PEPJgHIXtlzQ7N38ESnFgMJst5LxBLGVLqkECBbf
 TtUA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/YjxjxEUh5gtdTSSeqmrgH0f5FC3m/AUvWCboGQ/pMMpMeD5MJNFurlRf8HBaoakZ5Et2pRUaa5/x0g/KpGWoFQWZ3EY4imkKc4ooyRKE
X-Gm-Message-State: AOJu0YwITY/BZaDlCy8/oFfvyQ+arItLycJ600iTfJkhkEHLkGnJSVpl
 O6hiOQO2EY7Xkjy2RB4ugHU662/F6Pw3IPUrQjWVwrB8mNq1VSjs
X-Google-Smtp-Source: AGHT+IH21rnnnVfgZxMZxLUtwT8WNw2n6SGokaZ3Z2BAo9BcO1XqzYus1bbwbxmJwBapyjsetWPvxQ==
X-Received: by 2002:a4a:6c4b:0:b0:59c:8dea:ad3 with SMTP id
 u11-20020a4a6c4b000000b0059c8dea0ad3mr5149094oof.9.1707763800850; 
 Mon, 12 Feb 2024 10:50:00 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVeJe5sdeCNV8dOxqKNJ9p5ZaVFhlpVYq2mMRB0iQCgeCAmy4SV/fbbtMK7Gv3j6SSGe4sJ7VuAF1+TJbw/86y94Eng46FiRZUGjaGIuPMN6IEjjHBTUQNA6dOgerspmMSEvhynLEv0Aasw1sCwXDvrTCAnKyQJIxUOE263WYCGTjAyObHHtwWdsJhRNqI+4yJJrDGZ5TaEbsdRRTMHaTyI7Rq9OtAF9n8spX4CUBU1mHJoVHOVEqLbH8RzSkVlbfGGPy7JZl5YDXYR10FlFS/7IaNHH4D063iejoOIDBiOS3HYqpn2abyQ+m7FyEDd6bqhV7ElNtkkkRkzBbu9YVyQtjDgd1Az/OprBux2PDozS9C5JsI4fRcqdY22gJVQP9n7UT5mnF8mi2yqUSycVtu6kccC+LRThhEQw2zHHEit/yK121dpMaJAIElU0fvKIM9T75f+S8imX/IfWrnJczKtehNeZyVlR9K/OGDNdMs3WMjApO+Y1I2qihS9rKKMPIVQ1vadUKwVbLq8tJz87XBQ93vKeSe6l2yNSwWg15RB+woEo0fnEv0+e5qh
Received: from localhost.localdomain ([75.28.21.198])
 by smtp.gmail.com with ESMTPSA id
 b7-20020a4a3407000000b0059d5360c62esm171939ooa.11.2024.02.12.10.50.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Feb 2024 10:50:00 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 daniel@ffwll.ch, airlied@gmail.com, sam@ravnborg.org,
 quic_jesszhan@quicinc.com, neil.armstrong@linaro.org, megi@xff.cz,
 kernel@puri.sm, agx@sigxcpu.org, heiko@sntech.de, conor+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
 Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH 4/7] drm/panel: st7703: Add Panel Rotation Support
Date: Mon, 12 Feb 2024 12:49:47 -0600
Message-Id: <20240212184950.52210-5-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240212184950.52210-1-macroalpha82@gmail.com>
References: <20240212184950.52210-1-macroalpha82@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Morgan <macromorgan@hotmail.com>

Add support for panel rotation to ST7703 based devices.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 drivers/gpu/drm/panel/panel-sitronix-st7703.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7703.c b/drivers/gpu/drm/panel/panel-sitronix-st7703.c
index 939ba05c9b58..a3e142f156d5 100644
--- a/drivers/gpu/drm/panel/panel-sitronix-st7703.c
+++ b/drivers/gpu/drm/panel/panel-sitronix-st7703.c
@@ -62,6 +62,7 @@ struct st7703 {
 
 	struct dentry *debugfs;
 	const struct st7703_panel_desc *desc;
+	enum drm_panel_orientation orientation;
 };
 
 struct st7703_panel_desc {
@@ -743,12 +744,20 @@ static int st7703_get_modes(struct drm_panel *panel,
 	return 1;
 }
 
+static enum drm_panel_orientation st7703_get_orientation(struct drm_panel *panel)
+{
+	struct st7703 *st7703 = panel_to_st7703(panel);
+
+	return st7703->orientation;
+}
+
 static const struct drm_panel_funcs st7703_drm_funcs = {
 	.disable   = st7703_disable,
 	.unprepare = st7703_unprepare,
 	.prepare   = st7703_prepare,
 	.enable	   = st7703_enable,
 	.get_modes = st7703_get_modes,
+	.get_orientation = st7703_get_orientation,
 };
 
 static int allpixelson_set(void *data, u64 val)
@@ -817,6 +826,10 @@ static int st7703_probe(struct mipi_dsi_device *dsi)
 		return dev_err_probe(dev, PTR_ERR(ctx->iovcc),
 				     "Failed to request iovcc regulator\n");
 
+	ret = of_drm_get_panel_orientation(dsi->dev.of_node, &ctx->orientation);
+	if (ret < 0)
+		return dev_err_probe(&dsi->dev, ret, "Failed to get orientation\n");
+
 	drm_panel_init(&ctx->panel, dev, &st7703_drm_funcs,
 		       DRM_MODE_CONNECTOR_DSI);
 
-- 
2.34.1

