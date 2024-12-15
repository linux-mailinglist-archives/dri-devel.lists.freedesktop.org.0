Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EB2C9F23EC
	for <lists+dri-devel@lfdr.de>; Sun, 15 Dec 2024 13:54:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C77BD10E12F;
	Sun, 15 Dec 2024 12:54:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="IF3QKZH5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 510D910E12F
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Dec 2024 12:54:00 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-aab925654d9so315406966b.2
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Dec 2024 04:54:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734267239; x=1734872039; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=iFvxqbbRTWoZ+TGL4KkSwITrWYOc2TJu0vqqiXJT5zA=;
 b=IF3QKZH5bMdRud09AlSFDm4R2zrKXzHJ2rPVzVDHFmL6XpBvpxgdO8YUZMclq+1tTB
 N5wh7s8TVTFDmPkQBSx+ThBppEGGtvZf7zqUGxnyAvgNLAUm1SGAwNYO8DxnQuUlvXc7
 GO+QpNy/exW9jo56YXlBnS6ViO5slhNvNSbvwtKd/PII6B/daqQAojeT6iGrEbQe6Dq5
 tie+Y6r6ijw6kuV76zamwL9RUnBVt0CmuCseWqREVrDTFnm8W8HcCLIQDYAUDYGRhptH
 EbEtVwAeUfGj9P1vXD8C3KdQ9yMx9TD2OBZ7pZcPJ7MR/fj1h3dbsSGyAbky0guVb2yC
 rd9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734267239; x=1734872039;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iFvxqbbRTWoZ+TGL4KkSwITrWYOc2TJu0vqqiXJT5zA=;
 b=b3CMLfh7zxgHo1ayaIjt9W/aMJO85Ey16GLACs2SMrcdjZ34pOrr7PWN6f2dQvB1w5
 IbocM8ww2SCNboQJYgB6ljKPM9P2Bz8beekueDoM2ObaA7SKwGBDwEwzDdpKeiW/rUke
 gZr9+BmZdDH2mYnhM1bYWHsa5iL/xrl4nwtevnWkEIhcgY/2sf5vEtyEB9VBBV1dmPby
 8Yz8SYnGqtpktxujJYCXEhFkwYHeTPpyH/EZ1WKWYIozxKx8yUt5qeE9m5koUsb9wamW
 3bUHa7IYwpzD+kVmaFYgX7RkHt3T6TfH+ZQOhOLiiz2ucv/Ug9lHSe/BhqlrSthtGj4w
 Hw1w==
X-Gm-Message-State: AOJu0YziNEIMbO+LH/7pvfLmxyMfmmmw5tKPv21YF/U7reYCwscwWDeg
 XoCEF4RWbUyJftmsGuyUWhlQD720fZpS7z2eyu6wH8umKDzDz39SzLXXPrEB
X-Gm-Gg: ASbGncsQUaz/Ixi3Gf4CYgUkBEjaPOgDyhOToVvT8JrhgHJZi7FPvzZ4d5KK+Km9XFp
 URX2t8sIHMqMKmf1zzLverFdGcpXd01QPCsRGsKabMHuA8wAd5UJM+0haGCIcJAnVWwkw8qjlNp
 vKoLrpDAu+d+3SeydGMWGAKXydL78cEAEDQivgtt9LGY3yILEDd1rgazfRXaeHWbggWWvARpCDi
 GPqrCs+HzQLU7kHfl6roor/f5rcTLlwgqy4RHSvk01L8yVbjT9VZ8Au7AnIKy4jPpQ=
X-Google-Smtp-Source: AGHT+IGzsljMyjy3J7dXhJasGjwSWHymnukngwVrGT5+zoVtlmSyNURrevS5QQnQ9x8fAdVpqXhemg==
X-Received: by 2002:a17:907:3f97:b0:aab:736c:5a7 with SMTP id
 a640c23a62f3a-aab779b4b90mr941982466b.25.1734267238510; 
 Sun, 15 Dec 2024 04:53:58 -0800 (PST)
Received: from localhost.localdomain ([83.168.79.145])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aab963910f7sm204578366b.166.2024.12.15.04.53.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Dec 2024 04:53:58 -0800 (PST)
From: Karol Przybylski <karprzy7@gmail.com>
To: karprzy7@gmail.com, laurent.pinchart@ideasonboard.com,
 tomi.valkeinen@ideasonboard.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, michal.simek@amd.com
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: [PATCHv3] drm: zynqmp_dp: Fix integer overflow in zynqmp_dp_rate_get()
Date: Sun, 15 Dec 2024 13:53:55 +0100
Message-Id: <20241215125355.938953-1-karprzy7@gmail.com>
X-Mailer: git-send-email 2.34.1
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

This patch fixes a potential integer overflow in the zynqmp_dp_rate_get()

The issue comes up when the expression
drm_dp_bw_code_to_link_rate(dp->test.bw_code) * 10000 is evaluated using 32-bit
Now the constant is a compatible 64-bit type.

Resolves coverity issues: CID 1636340 and CID 1635811

Cc: stable@vger.kernel.org
Fixes: 28edaacb821c6 ("drm: zynqmp_dp: Add debugfs interface for compliance testing")
Signed-off-by: Karol Przybylski <karprzy7@gmail.com>
---
Changes from previous versions:
Added Fixes tag
Added Cc for stable kernel version
Fixed formatting

 drivers/gpu/drm/xlnx/zynqmp_dp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
index 25c5dc61ee88..56a261a40ea3 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
@@ -2190,7 +2190,7 @@ static int zynqmp_dp_rate_get(void *data, u64 *val)
 	struct zynqmp_dp *dp = data;
 
 	mutex_lock(&dp->lock);
-	*val = drm_dp_bw_code_to_link_rate(dp->test.bw_code) * 10000;
+	*val = drm_dp_bw_code_to_link_rate(dp->test.bw_code) * 10000ULL;
 	mutex_unlock(&dp->lock);
 	return 0;
 }
-- 
2.34.1

