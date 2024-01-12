Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0454F82C142
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jan 2024 15:01:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DC6D10EB0F;
	Fri, 12 Jan 2024 14:01:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A00A10EB0F
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jan 2024 14:00:58 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id
 98e67ed59e1d1-28c467446f0so5259760a91.0
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jan 2024 06:00:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705068058; x=1705672858; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=XS8Rep9Va+/PRgkDzjJYb2S8kbvY9z/pUUqJQoFIFy4=;
 b=BM7mMTVOge5OQ6wOVHmaUboqfqqk020/SbiLSKkgC7a1Q+megG7uyYynYs0Giq5PZT
 XLVqRNPtoCPVGHUPmTl/t8mt/iJfsaZ1atn5wKULnRrYTYYDtxC0ouy3+gGqP7+edls+
 phwJ354mg3ePqTE0NqOWUoFQvUwfjfw6/uxMDAzC13UeHibnBZ+Dvefhbgb3MUp3NoZR
 eypBCn933cKrgPvL3x4SHd9+bVY6IM6Kfci00tkCtCR36sOh1vemIkTBW/7I7KYGGrTJ
 08jMv1USuXM4wsOQIP/iHlQvQbEoseWPu4k90H3JgfnsfvLoiXU+XYh6nVJMt3jPANE3
 Qnsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705068058; x=1705672858;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XS8Rep9Va+/PRgkDzjJYb2S8kbvY9z/pUUqJQoFIFy4=;
 b=iFJl0cp7VMJsrTtSPPkMqJzKKVclOvenrZDjrzvHHtQ7yyaWDqDEYMpgZIeOev4e6R
 6f7/uTAT51gXjM88qHwdfIKGoh+o+z0akK+Cwc18+n+6+kYVJslVJmsvhM2JdmWrBPRZ
 ozDQ+gClayA84GVfIqwCHwrjzpV0kbNhPkqHcceoTnr1KxdW52q1cY8cL1V6PpB32fER
 3i9KADwei0T4SdBrcqHGsj0vOpY4y5o8wVyKIyHdDBP9obDTRfTapC3ir7hPrdwwbXK7
 VV6XSpO6gTobOoIXs2y2NDm0/lCO84vrpYxKzrCUMptBWU4SnqJSWLLH6fv1yhfTT1Xo
 Yptw==
X-Gm-Message-State: AOJu0YysFmE7YMPhzPmDsizgSGMC1pujZWhHs9iZsNcb7M77U6E2+51S
 lbosqcIai9r10rFH5O+w7FE=
X-Google-Smtp-Source: AGHT+IHazKNfF5Sl/dHs/3CsbUVKYhtaDsFQhN7NUmoATtPYwXCEzL3gzslDnXKJTBDOtMuhXd5PuQ==
X-Received: by 2002:a17:90a:d254:b0:28d:95c6:abb7 with SMTP id
 o20-20020a17090ad25400b0028d95c6abb7mr3392604pjw.14.1705068057893; 
 Fri, 12 Jan 2024 06:00:57 -0800 (PST)
Received: from localhost.localdomain
 ([2409:8a6a:5422:1e81:f0d5:a137:e742:acec])
 by smtp.gmail.com with ESMTPSA id
 sj4-20020a17090b2d8400b0028d9b5d41edsm4065564pjb.38.2024.01.12.06.00.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jan 2024 06:00:57 -0800 (PST)
From: Jianhua Lu <lujianhua000@gmail.com>
To: Jianhua Lu <lujianhua000@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/panel: nt36523: Set 120Hz fps for xiaomi,elish panels
Date: Fri, 12 Jan 2024 22:00:47 +0800
Message-ID: <20240112140047.18123-1-lujianhua000@gmail.com>
X-Mailer: git-send-email 2.41.0
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

After commit e6c0de5f4450 ("drm/msm/dpu: try multirect based on mdp clock limits")
merged, 120Hz is working on xiaomi,elish panels, so feature it.

Signed-off-by: Jianhua Lu <lujianhua000@gmail.com>
---
 drivers/gpu/drm/panel/panel-novatek-nt36523.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-novatek-nt36523.c b/drivers/gpu/drm/panel/panel-novatek-nt36523.c
index a189ce236328..d6fa76dbf948 100644
--- a/drivers/gpu/drm/panel/panel-novatek-nt36523.c
+++ b/drivers/gpu/drm/panel/panel-novatek-nt36523.c
@@ -933,8 +933,7 @@ static int j606f_boe_init_sequence(struct panel_info *pinfo)
 
 static const struct drm_display_mode elish_boe_modes[] = {
 	{
-		/* There is only one 120 Hz timing, but it doesn't work perfectly, 104 Hz preferred */
-		.clock = (1600 + 60 + 8 + 60) * (2560 + 26 + 4 + 168) * 104 / 1000,
+		.clock = (1600 + 60 + 8 + 60) * (2560 + 26 + 4 + 168) * 120 / 1000,
 		.hdisplay = 1600,
 		.hsync_start = 1600 + 60,
 		.hsync_end = 1600 + 60 + 8,
@@ -948,8 +947,7 @@ static const struct drm_display_mode elish_boe_modes[] = {
 
 static const struct drm_display_mode elish_csot_modes[] = {
 	{
-		/* There is only one 120 Hz timing, but it doesn't work perfectly, 104 Hz preferred */
-		.clock = (1600 + 200 + 40 + 52) * (2560 + 26 + 4 + 168) * 104 / 1000,
+		.clock = (1600 + 200 + 40 + 52) * (2560 + 26 + 4 + 168) * 120 / 1000,
 		.hdisplay = 1600,
 		.hsync_start = 1600 + 200,
 		.hsync_end = 1600 + 200 + 40,
-- 
2.41.0

