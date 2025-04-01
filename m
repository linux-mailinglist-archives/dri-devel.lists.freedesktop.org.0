Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C72D1A77761
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 11:17:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18C6910E2C9;
	Tue,  1 Apr 2025 09:17:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KrE4GqkF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
 [209.85.214.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC76510E2C9
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Apr 2025 09:17:02 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id
 d9443c01a7336-2241053582dso83370945ad.1
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Apr 2025 02:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743499022; x=1744103822; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+GLEyWRUn87tdAHFpsIgdK3yHHnhiGzWNhKJ4cVG5iU=;
 b=KrE4GqkFMhdthQ0BnJpsVS2wUYWWDo89KfUfTWkTy9GAR2cSYPcYwJcL5eaE5FJeYI
 tZ11kq0vLCq0ew/vdc+ILsLILG9jE6w6zhAeZ2GAE40gt8F6CrFVvpPaoOfNrDUJKGKd
 YLDrA+tjZTpG83LV/o/A5j3zC4j9N1/Uh6aGmoFZ4ZjvmvX90h10CRfhD6fipJBb6t3e
 iHnD/vZhZC22wt1UVFdNqfDw9luITlz7rD0X2dC//oZ/gR3DAc7XZSYmuyZM2RAwy6R5
 PSYQxtZyOh7JE/yqcA9K+qcBENtBzR0ifE/hEqoy7G17cB5Wq8A9zkBqbAMzNZkrF3Az
 6Ezg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743499022; x=1744103822;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+GLEyWRUn87tdAHFpsIgdK3yHHnhiGzWNhKJ4cVG5iU=;
 b=tL1rzpgm+vdM78IS5IPJPXb0iwK3xNBSko5w7X2b33L/SMDs6lUGVbXBo58nlNGmm3
 /iVZ1F2fc5sfFhlyj51stAaKaNpyGeQ2bRjgSs5xVtfzf8bvpenaXQEuloBcTQVaBd+q
 SIkKPGldINjHDLyy8TulMBS7UTkfDeGAH4rTEiA2imB6ZzWpS2yYOjIRR3PVcAbaQ9ma
 d/WnqLd+70/H7BYtM31LC4H06VtZZlk9XTa4w2KivQjxCuS/vCYoSm65qid9C1qVLy/t
 BJc9Fn+JUoVTmZh7NVIVts7FAJGhjcxGV3tg3LhiyhyNv1oCgGWwrnIpsYOBQec+jtsA
 Z3lA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUwkxl5X7voGPm32gSqPMG2kP70pWoUMegCuswcc7m92SsfdllOl00tVvt3c9VAb3PGxYRD/bBiQMY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzzvS20FGoczBboB2urhLHtyGh0vMxgLDVGx0K/GgDBw+18+/OH
 iOd0hFN2hFjQSHVsmJVHm61mQIQlpRUPZmazubV3YgiX+L0LGvaO
X-Gm-Gg: ASbGncsw34g/FWANLUIzKV2cPN9WrHswQWEbDJyGXKgvdH81/IKh2PwskhnFXYUKH/e
 TO0uOvYr8FC51ZhhNyW2puHaY9VwJZmHMY/NBMBl5YMeMvQTHqKEQWD0xZQoR6dLrCgddImm73I
 Dg6vR+vX7Sr5q7bvYk6tp96QniH+H5bzE/3E1b8ofWumj+oL7mysex8rfqiAHIOvWwUzYKktlsa
 V3pE0QwK+ytuHdzU/WTJYWeLe68JAbv6R88zSHxlVmdYDqkfHF2TXZoEyNE4wzkfu1Kjrks0WMN
 RP3AXMB0WucMpZ0V7aDEe4IfaFs87SZ4KJaeXLL2WXKOpmSTk7AeWhnA+bmQLztsl8tGHggkGsg
 bw9jGIw==
X-Google-Smtp-Source: AGHT+IHunF5jyUL3TmPXi3AK47epCDZ22lyUsYqq4UiVJYVJRr74B+C/7SC7nQxjxJzTz0Tx+kvJng==
X-Received: by 2002:a17:903:1cb:b0:223:f928:4553 with SMTP id
 d9443c01a7336-2292f9f7646mr232149915ad.44.1743499022271; 
 Tue, 01 Apr 2025 02:17:02 -0700 (PDT)
Received: from henry.localdomain ([111.202.148.167])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2291eedf9b4sm83492285ad.84.2025.04.01.02.16.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Apr 2025 02:17:01 -0700 (PDT)
From: Henry Martin <bsdhenrymartin@gmail.com>
To: danielt@kernel.org
Cc: lee@kernel.org, jingoohan1@gmail.com, deller@gmx.de,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Henry Martin <bsdhenrymartin@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v4] backlight: pm8941: Add NULL check in wled_configure()
Date: Tue,  1 Apr 2025 17:16:47 +0800
Message-Id: <20250401091647.22784-1-bsdhenrymartin@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <Z-uqpxcge0J99IPI@aspen.lan>
References: <Z-uqpxcge0J99IPI@aspen.lan>
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

devm_kasprintf() returns NULL when memory allocation fails. Currently,
wled_configure() does not check for this case, which results in a NULL
pointer dereference.

Add NULL check after devm_kasprintf() to prevent this issue.

Fixes: f86b77583d88 ("backlight: pm8941: Convert to using %pOFn instead of device_node.name")
Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org>
---
V3 -> V4: No functional changes, just correcting the version number
V2 -> V3: Correct commit meessage and confirm this patch has considered
resource cleanup to avoid any subsequent issues, ensuring that errors
are handled properly and no resources are left in an inconsistent
state.
V1 -> V2: Fix commit message to use imperative mood and wrap lines to 75
characters.

 drivers/video/backlight/qcom-wled.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/video/backlight/qcom-wled.c b/drivers/video/backlight/qcom-wled.c
index 9afe701b2a1b..a63bb42c8f8b 100644
--- a/drivers/video/backlight/qcom-wled.c
+++ b/drivers/video/backlight/qcom-wled.c
@@ -1406,9 +1406,11 @@ static int wled_configure(struct wled *wled)
 	wled->ctrl_addr = be32_to_cpu(*prop_addr);
 
 	rc = of_property_read_string(dev->of_node, "label", &wled->name);
-	if (rc)
+	if (rc) {
 		wled->name = devm_kasprintf(dev, GFP_KERNEL, "%pOFn", dev->of_node);
-
+		if (!wled->name)
+			return -ENOMEM;
+	}
 	switch (wled->version) {
 	case 3:
 		u32_opts = wled3_opts;
-- 
2.34.1

