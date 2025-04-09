Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7A70A8211D
	for <lists+dri-devel@lfdr.de>; Wed,  9 Apr 2025 11:38:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF37510E81D;
	Wed,  9 Apr 2025 09:38:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="aUIaGlUN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 790EF10E81D
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Apr 2025 09:38:21 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id
 98e67ed59e1d1-301c4850194so5236132a91.2
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Apr 2025 02:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1744191501; x=1744796301;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=SgTC8w9iL276TFi8uSLwBxbq6oM19eQgvWXN0fTHj+M=;
 b=aUIaGlUNCnnYiRH7PpNgEsy1N9z2u83de4d8uvQfJkBI+79Jz7WtO7WNpqHuYqtCXm
 U9EFkoDaMyyLCO3e8md09xmLWvD4uRTPRRfTmZfCJutps/KRhb+z3tvnFjadcRV9He18
 l38OFHwaQQizkXA1T+3vcbKW8zjze04IZ6B5g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744191501; x=1744796301;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SgTC8w9iL276TFi8uSLwBxbq6oM19eQgvWXN0fTHj+M=;
 b=UQ4+d0hKKlPuhEFkEtCg1D6vEcTzSJ8vej71mBjTAYHxlGVAhz/mHUA2sp2MQ9hP3O
 wA7NVZVAjbOddpiKNqPYm9dwIsiwIlWCx643S5t3tkrDhTgHoAnBM9RBGHspitcn0gIk
 /6dNy8Uf7dsQJEi5m05VYf0EHDasKmGx3ktpXbn/TfIagRYQu8Fs/y1vL6cRr5IeMhTY
 h2zhPdcTAMh4/vQF6/tcRbs+Dt+Mju3cQQpeOqvgdn1hTTrA2sVI0XoczmvM3sWHmP3i
 kCJ8TWISReYCm2UYj+Nqbfz2H8nAbE0ImJhN5FaShVZ3TsH/bxDG4Yhvbdao+ug0X/vv
 beuA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW/gHVjE6ymcDE8cjCfATILCbJ+WuEqT4JRi8wH38kqSCxFJmG+49RiwW5vCG7uDkdDvYvknKQOzfI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwR9vocwSMdtNUhnJrdrkrM1UgMV/S9uOR0zbOZq1oCOiYX42Tl
 GGbezOKdzzwtKIHZMvbSc/b+Josz4C9Act8LOUiTMWTwcR0Qnxm+uuuM9y9UuA==
X-Gm-Gg: ASbGnctrQE9uqyZKJCP3f1OIKjpT+WYWZxFCwO0w9E9KQSD277CPMWFeQrjwzTPW60/
 sxmwZj0+OVfJ8KFWMm91DG7iy5lkH11C57yx37rWgZn954CNIct2qMpzMa/5PhNZcxM+vTRt0sb
 iEk+LIKy18IPA0jFLByDAUG+5cvcgjCjLDPCmCvpP0HLm/S6n68JdBkiCjOYtnoxDGgE/mGetEW
 7ZElMa9Up9JYKMJeZqt2Ga+bjWd7Slo0Ds5+O2dSErEUMLq+3iDCkuEi3T16rjg6ICFSuib+3jf
 l/BkBuZpnr9LpHiZ0Y8zgwsQ21rXTcY+fdBKGW6LnH7csYc21Eazl0gRfs8=
X-Google-Smtp-Source: AGHT+IEFN4eKM3khV+a3oSUDISWcchGGNrkzq2zapiCD0nKURmKZ+1EdmsOfjDcNWMOTQ70G90l/XA==
X-Received: by 2002:a17:90b:5750:b0:2ff:7331:18bc with SMTP id
 98e67ed59e1d1-306dd56b1cemr2114604a91.26.1744191500989; 
 Wed, 09 Apr 2025 02:38:20 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:9ddd:3b40:5dbf:9350])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-306df2fb171sm940713a91.34.2025.04.09.02.38.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Apr 2025 02:38:20 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: Chen-Yu Tsai <wenst@chromium.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/bridge: anx7625: Use devm_pm_runtime_enable()
Date: Wed,  9 Apr 2025 17:38:13 +0800
Message-ID: <20250409093814.3977025-1-wenst@chromium.org>
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
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

The anx7625 driver is open coding what devm_pm_runtime_enable() does.

Switch to the common helper instead.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/gpu/drm/bridge/analogix/anx7625.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index 866806e908cd..8bfe477c476c 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -2569,12 +2569,6 @@ static const struct dev_pm_ops anx7625_pm_ops = {
 			   anx7625_runtime_pm_resume, NULL)
 };
 
-static void anx7625_runtime_disable(void *data)
-{
-	pm_runtime_dont_use_autosuspend(data);
-	pm_runtime_disable(data);
-}
-
 static int anx7625_link_bridge(struct drm_dp_aux *aux)
 {
 	struct anx7625_data *platform = container_of(aux, struct anx7625_data, aux);
@@ -2708,11 +2702,10 @@ static int anx7625_i2c_probe(struct i2c_client *client)
 		goto free_wq;
 	}
 
-	pm_runtime_enable(dev);
 	pm_runtime_set_autosuspend_delay(dev, 1000);
 	pm_runtime_use_autosuspend(dev);
 	pm_suspend_ignore_children(dev, true);
-	ret = devm_add_action_or_reset(dev, anx7625_runtime_disable, dev);
+	ret = devm_pm_runtime_enable(dev);
 	if (ret)
 		goto free_wq;
 
-- 
2.49.0.504.g3bcea36a83-goog

