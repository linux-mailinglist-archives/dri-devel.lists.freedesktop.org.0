Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B00F59E3332
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2024 06:36:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE1D410EBE3;
	Wed,  4 Dec 2024 05:36:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="ck+VD9x+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15C4410EBE3
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2024 05:36:49 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-215cc7b0c56so12041655ad.3
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Dec 2024 21:36:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1733290608; x=1733895408;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=aUTj5oOCJlKe/qGpHEm0TOrt8PkT5YpNK1Ubf0EJxrk=;
 b=ck+VD9x+oKa0oY0GHG4iU81APtv775sJrenS7+V4/HS60Ow76G/CfKHkiiu797oDgj
 IYimaOvm8hiHmlwk4u87+89qZlMo/O31Ga4O6Pjm/V4j9a5LrTCHoXSMVLyr+b+aauvq
 jEszB56Y5GB02ccnPi7xbNzo+q6VQkwxQPdpU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733290608; x=1733895408;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aUTj5oOCJlKe/qGpHEm0TOrt8PkT5YpNK1Ubf0EJxrk=;
 b=JDwA8aHB8b3zrGnj3NZXDF75AyFT2s8dCnULNnLTiKLUsCjbaApr4Vx1iZ/Q9pzN48
 o7F2gk4TiK/mi7V/CzulVWAmIe0iSss+tvsdJh7t6tJIjQPdJS0mGW345OXXbvonrrNn
 EZG4ubh8psqGXb2or6rqXIbEoPAe9sSOuEhfmNijnJ3GYnlI3/N811u24CELrrtegjlV
 GV0dHAbpnYBNa5crnO9Ts3gW7PKyzOPivdxBaVdeuBeafoO7H98ZMFQ6WrzFvtndZBKt
 6pStlGrv1XOXJMrahaoJDvwLCqdIwkma5srOBV+WVR6OIXLso8wYw2ngQvKWMYncnLcY
 VubA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVL2+9AUF9ClWjldt8xyaeajYD6XSTDINYBC4PsbIXuKUhJtqeMi4M9N6TLRBD1R83zvSb5xEHf7Ms=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yym90LnHS5ctl0E54GD0WeDs+iMg7JyUj6xs041B2PyWjVXxcoh
 fdx/zkRL0d9RL31HdNSaOX2Np+k3oVIuM2uDf+1fMgX9DSNpVzrfwabPg7oVFw==
X-Gm-Gg: ASbGncvlSIDGvJaYAGDEoxclovL9a0WR61j+Bhb4E3lfrKXWzAix/2NZqfL4kz8YPbO
 HentEn00o78tOBq8W9WmE+7ttNMJOuAjbqF/D/BUwNKuDk8i04TfrdUw6ql0bJW4xfiOY12WHMe
 kGLUh/+AKS8v4o+NfONNd61wc5KRXhp73ZhvCmqoFB8ylepIl0JmzmqTCLDtmIi2FoM7DKyghdZ
 uzmyXDdIUAH+FRg/LM35oNiADB5GD4w6E3oHmUVPNBQ24Sihlg91mgzckZHzBZFo4g=
X-Google-Smtp-Source: AGHT+IHCZpXeN9MLrmdZcAAHOnTGeoLcKfIjSMDNfOqrrypRTuT3gt40Zogb0oCb0B1u/35wvFZQbA==
X-Received: by 2002:a17:903:4094:b0:215:bc30:c961 with SMTP id
 d9443c01a7336-215bd161bbemr52091865ad.35.1733290608504; 
 Tue, 03 Dec 2024 21:36:48 -0800 (PST)
Received: from fshao-p620.tpe.corp.google.com
 ([2401:fa00:1:10:b764:8a78:a02:6e0])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-215219672d1sm104304235ad.164.2024.12.03.21.36.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Dec 2024 21:36:47 -0800 (PST)
From: Fei Shao <fshao@chromium.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Fei Shao <fshao@chromium.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH] drm/mediatek: dp: Support flexible length of DP calibration
 data
Date: Wed,  4 Dec 2024 13:32:33 +0800
Message-ID: <20241204053634.1365491-1-fshao@chromium.org>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
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

The DP calibration data is stored in nvmem cells, and the data layout is
described in the `mtk_dp_efuse_fmt` arrays for each platform.

There is no guarantee that the data is always a 4-length u32 buffer.
For example, MT8188 has a data length of 3, preventing it from passing
the preliminary check and undergoing calibration.

Update the logic to support flexible data lengths. Specifically, we
validate the length returned from `nvmem_cell_read()` against the
platform-specific efuse format. If out-of-bound access is detected, fall
back to the default calibration values. This likely indicates an error
in either the efuse data length described in DT or the efuse format
within the driver.

Signed-off-by: Fei Shao <fshao@chromium.org>
---

 drivers/gpu/drm/mediatek/mtk_dp.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index 1cc916b16471..e9ff6fdfd6ee 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -1165,17 +1165,25 @@ static void mtk_dp_get_calibration_data(struct mtk_dp *mtk_dp)
 	buf = (u32 *)nvmem_cell_read(cell, &len);
 	nvmem_cell_put(cell);
 
-	if (IS_ERR(buf) || ((len / sizeof(u32)) != 4)) {
+	if (IS_ERR(buf)) {
 		dev_warn(dev, "Failed to read nvmem_cell_read\n");
-
-		if (!IS_ERR(buf))
-			kfree(buf);
-
 		goto use_default_val;
 	}
 
+	/* The cell length is in bytes. Convert it to be compatible with u32 buffer. */
+	len /= sizeof(u32);
+
 	for (i = 0; i < MTK_DP_CAL_MAX; i++) {
 		fmt = &mtk_dp->data->efuse_fmt[i];
+
+		if (fmt->idx >= len) {
+			dev_warn(mtk_dp->dev,
+				 "Out-of-bound efuse data access, fmt idx = %d, buf len = %lu\n",
+				 fmt->idx, len);
+			kfree(buf);
+			goto use_default_val;
+		}
+
 		cal_data[i] = (buf[fmt->idx] >> fmt->shift) & fmt->mask;
 
 		if (cal_data[i] < fmt->min_val || cal_data[i] > fmt->max_val) {
-- 
2.47.0.338.g60cca15819-goog

