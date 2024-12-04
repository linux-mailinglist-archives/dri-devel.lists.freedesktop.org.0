Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED0A69E3CA9
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2024 15:26:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5188310E24D;
	Wed,  4 Dec 2024 14:26:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="XYOPP67n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
 [209.85.215.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B63910E24D
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2024 14:26:51 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id
 41be03b00d2f7-7fc1f1748a3so4602706a12.1
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Dec 2024 06:26:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1733322411; x=1733927211;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Y6Zm/pDEZ2wWuq6CLhWp8fdFsf6yo2FBchkfiY2ICjk=;
 b=XYOPP67nSNc7XD6SgWqi5HSFIKrvG5yMq8yNt5+YGy4Hoi5odh/R2Nx7tG7E8/odoL
 E7KeIzZ//Zeb9VctAIdBgqUz41T84JM+oi4wzAAozD0EoRHibDawkkbynsP2uT1dz5EF
 +fw97Y12il/gqYq8g1+IriOVKf4FYq/F4mJRI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733322411; x=1733927211;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Y6Zm/pDEZ2wWuq6CLhWp8fdFsf6yo2FBchkfiY2ICjk=;
 b=cOV4/rYxcP9/O9bDpviSHuq69z6DYyX1TJOoJaXIxQX4LWDgMNAg1AkyfzXUTmntIA
 GOXo8Fk2xRW1nkWlwXVWOXRG7fTg63rQcOYT0AWlrWBtiU9IGRsihHoazAORmZCAlcDX
 CaRfGgmDpLwCFVXe3ed9ZTz/cwr8lSt7M6cKYlnZwm7Stu0VCALdG8NEmpIPJQ2wusGu
 YYfvxlG0xBYA+unm8XCiYgAkurlXDc2bLI2Bv80d17hQ5ke8XlzVJIhNz6xExqAUab1P
 4iex0lbG1NT5JF/OlMNHrijgIrlaZqnfuKnZpJPZp6axp470ScDyKJvpZjyJsLI3dj8j
 OeQQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXT2q64nyFJ4Ouc7+91qT8KSdLod3CAq4V5RuXBoAToHB1WUd/pUFjkvvvFprJvCbDfpIhzg0Axmeo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz2n1H92AxrEcVuauBmHgYcum5zzR9hHQngfFgPVRdMD4WbPwSM
 Otw0aeRFMTW3Dl9V5ydZoT2y+tHDIblSMjadY6a6bdDm/VNfzG+K3RN8lfHkvg==
X-Gm-Gg: ASbGncvyuNY4ay6vzMI2+bsJaJmysp6hQZyxtoV8oTVbC5FO7RF8R6jxL76c+cUdcb7
 0foaH9IiRRY1GRQQB+heeqK749TicS5wa8VBxdy6eiGYHktn84zdc/gVn3b9OKnqEktBLGgpIlZ
 WW3VFBX5K2HM0Y3ywkWs0c+IjF2Pr6Vm03OnCp6RkgA3DVDDXtfvYiv6vPZZcjr+0GjyLFEn4RB
 qy2VdZKB2x0NmqO5C38l2hgRJ+SY2RABCVk1CjgSqxKJCARfHBRQCkYr83sYSihrnU=
X-Google-Smtp-Source: AGHT+IF0dNNNk83kN4LRrd8AEGyz62WUomCygJPIZPBTF7uW7lrdAcSow02U1nyM8E/b/c2B1GaPog==
X-Received: by 2002:a05:6a20:cfa6:b0:1dc:bdbd:9017 with SMTP id
 adf61e73a8af0-1e165412f33mr9668165637.40.1733322410642; 
 Wed, 04 Dec 2024 06:26:50 -0800 (PST)
Received: from fshao-p620.tpe.corp.google.com
 ([2401:fa00:1:10:b764:8a78:a02:6e0])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7fc9c3a2a5asm11416510a12.80.2024.12.04.06.26.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Dec 2024 06:26:50 -0800 (PST)
From: Fei Shao <fshao@chromium.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Fei Shao <fshao@chromium.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH v2] drm/mediatek: dp: Support flexible length of DP
 calibration data
Date: Wed,  4 Dec 2024 22:25:38 +0800
Message-ID: <20241204142626.158395-1-fshao@chromium.org>
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

There is no guarantee that the data is always a 4-length u32 cell array.
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

Changes in v2:
- use %zu identifier for size_t in dev_warn()

 drivers/gpu/drm/mediatek/mtk_dp.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index 36713c176cfc..55671701459a 100644
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
+				 "Out-of-bound efuse data access, fmt idx = %d, buf len = %zu\n",
+				 fmt->idx, len);
+			kfree(buf);
+			goto use_default_val;
+		}
+
 		cal_data[i] = (buf[fmt->idx] >> fmt->shift) & fmt->mask;
 
 		if (cal_data[i] < fmt->min_val || cal_data[i] > fmt->max_val) {
-- 
2.47.0.338.g60cca15819-goog

