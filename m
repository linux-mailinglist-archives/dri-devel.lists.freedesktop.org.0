Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB7F1F47BC
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jun 2020 22:06:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BF506E33D;
	Tue,  9 Jun 2020 20:06:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBAF86E33D
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jun 2020 20:06:54 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id j12so92955lfh.0
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jun 2020 13:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eg1+Og5Uei5NIChsUtGSk/n0WjIN9TSO/8QjqJynoKo=;
 b=ykr0a5MhCD6A9I1XX5r3v38XunSuPjX9D4tAqP46ALinMTiQDSU+5JyDRFqCzPbdg6
 aW9xGyBxpsabwhHrLsldaWVGhfM7T+eby0twolnTLdF4dokJAdtnsUSeqLcO06gpuOQg
 Hmu1ZVfTLTwVWLggipPs5R6QPPIZhcLBSCVZHv2rhLgzyS1piM2AwpHE1ySb1sbltp+4
 +r1BfF3+UgV8XNHAf37SLGGdFRVdK+jw3f5zjIJ/6UcnUtPG64/PbbutIivRwxZzq7Ju
 9BGouzZwe8iSFfIQ3q4caGB46e2Qks8dcYTnwo97mGRuVlXNxTkTc7XVPLyrQL+WbwrV
 lHBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eg1+Og5Uei5NIChsUtGSk/n0WjIN9TSO/8QjqJynoKo=;
 b=b0qvhmUVO5BKwLSErshDkHq6Qyoo6JsYOv6Ua6GS6NKpXI2vcuap2m1fYZDBXaPYij
 AcoDcaHG+lp2qL+tSiTcmCx/OhjfYab/g2MBrGPb30OvkJfE7mUkh0q9p9HK+w7F2+/i
 BdU/H6t/2K9+vy2bXcj/p5ZjfUrLXLpg9j4NtAJBZqD4xzOQcapXCJhZpC/h0bpbmXXt
 adIeVdBVSQWSMVVFoVqm1cAkHiEwWHvPDO2ZKpASBb3AyoyTzrvnnjVzE6Jb5KR/SZlD
 0G1MDN0Ct/HNrY2RHZgJimp4SrhiMaJ0pdInnkgecP4YCXamLH1CiDOPe6hS9+THX1qe
 UP1Q==
X-Gm-Message-State: AOAM532etTVVS89GNAbX4wfh0Du49WuRnV+oQh5pDO2ogkaNls3Z36c9
 04yueGAH5cfdsc4og73FOJmn1x0YWTo=
X-Google-Smtp-Source: ABdhPJwOWWPmtqA1hPgLKcjlp9T413CcsSh90xifkPhy4RKHFr0XBF2HPh5YT8HOqmtXUlXD0zEZIA==
X-Received: by 2002:a05:6512:691:: with SMTP id
 t17mr16807617lfe.85.1591733213128; 
 Tue, 09 Jun 2020 13:06:53 -0700 (PDT)
Received: from localhost.localdomain
 (c-92d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.146])
 by smtp.gmail.com with ESMTPSA id 66sm6038579lfk.54.2020.06.09.13.06.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2020 13:06:52 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Sean Paul <sean@poorly.run>,
 Eric Anholt <eric@anholt.net>, Russell King <linux@armlinux.org.uk>
Subject: [PATCH 1/4] drm: pl111: Credit where credit is due
Date: Tue,  9 Jun 2020 22:04:43 +0200
Message-Id: <20200609200446.153209-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
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
Cc: linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This moves over some of the credit for the development of this
driver from the old fbdev driver that I used as reference when
getting this in place.

Cc: Russell King <linux@armlinux.org.uk>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpu/drm/pl111/pl111_versatile.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/pl111/pl111_versatile.c b/drivers/gpu/drm/pl111/pl111_versatile.c
index 64f01a4e6767..1127082e9a60 100644
--- a/drivers/gpu/drm/pl111/pl111_versatile.c
+++ b/drivers/gpu/drm/pl111/pl111_versatile.c
@@ -1,5 +1,14 @@
 // SPDX-License-Identifier: GPL-2.0-only
 
+/*
+ * Versatile family (ARM reference designs) handling for the PL11x.
+ * This is based on code and know-how in the previous frame buffer
+ * driver in drivers/video/fbdev/amba-clcd.c:
+ * Copyright (C) 2001 ARM Limited, by David A Rusling
+ * Updated to 2.5 by Deep Blue Solutions Ltd.
+ * Major contributions and discoveries by Russell King.
+ */
+
 #include <linux/amba/clcd-regs.h>
 #include <linux/bitops.h>
 #include <linux/device.h>
-- 
2.25.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
