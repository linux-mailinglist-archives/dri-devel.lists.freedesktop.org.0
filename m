Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A62CE5AA8C0
	for <lists+dri-devel@lfdr.de>; Fri,  2 Sep 2022 09:32:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8B9310E78C;
	Fri,  2 Sep 2022 07:32:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B57810E78C;
 Fri,  2 Sep 2022 07:31:53 +0000 (UTC)
Received: by mail-pf1-x436.google.com with SMTP id q15so1073471pfn.11;
 Fri, 02 Sep 2022 00:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=P0R9Y+4dB3fRcttMdLXdxOe5yLYU2jvdRFUhiOX93Zg=;
 b=k5q1QbmCXfOYOV8VpYKWG61L3L9sU/bLkPdBZgWYlNidsibXAya40hV9tS883X2ZZN
 3kA0r8itsawEx8lVa1Yiq+AF03dd8RXpnVKL+OJMnGX/67GF0t2vrbMc4NDTU9LsIe3K
 7KV+hHa58XkhAOveOujHuYCOW2xIuToJkIWYY01/e9e/cFNsHRbz+GwDRcBVwKM49oA5
 k0Gt9mkOplHQyvGc3Syua+gD3nu0tb1xo8D4g73HuOTigBgdCnoVHCPQ5hKaDQk57Wjq
 vzrlDO4b6bIH5qSFT+SvcY6HasUNeGeiGxhYOxo5eYIYS0kyMjt+3JwhbBBPGjdxtRQe
 ShZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=P0R9Y+4dB3fRcttMdLXdxOe5yLYU2jvdRFUhiOX93Zg=;
 b=EmiM/Ls9kVFbIaV0laW4HpYf0jG+50w0rP9BZM3RylM1iYGoHI/K4WpEq7zchMv667
 vmprOHytsJsDMjVJQTXeRWHqcH9ETCbGh/xKNi1OnhOr+FymUOcpKKcW9Tv/99HicYup
 nAPJjh1CxOLysQ27TPvv+MWx3PbBHBWYOZdGDPMgUCA7G28fqbj920xuAlUFR/kpKC9J
 8wL32ewlhYy6wYkibkTezPfKpQmIr46n7oXdNuX7Yxe5837Jcp3iQeRKGYFfP9ey1B9Q
 YU+wVta0R2gDYg1RP5VxUtxsraCOKz0MPX08B7lE6Tkd/ByHIM7hDFx5xgmjyVC+cP4f
 f4fQ==
X-Gm-Message-State: ACgBeo2/JFUCY8X77nNCFCB9Kde/ztg/w9QrEk9dlZZYWZMfIXtFSgCx
 y6XMUITZOARc5k+5+84mNEM=
X-Google-Smtp-Source: AA6agR4kjmE6UsN8xdYrbeqJT8QfxOodjebOdNs9GfnxcZXzmeDl2dIJ56PNgzA65XAn+2GX2uuwcg==
X-Received: by 2002:a05:6a00:3406:b0:535:f76f:c971 with SMTP id
 cn6-20020a056a00340600b00535f76fc971mr35291353pfb.5.1662103913057; 
 Fri, 02 Sep 2022 00:31:53 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id
 e18-20020a656892000000b0041d6cda2d60sm738183pgt.66.2022.09.02.00.31.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Sep 2022 00:31:52 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: ye.xingchen@zte.com.cn
To: alexander.deucher@amd.com
Subject: [PATCH linux-next] drm/radeon/ci_dpm: Remove the unneeded result
 variable
Date: Fri,  2 Sep 2022 07:31:48 +0000
Message-Id: <20220902073148.319536-1-ye.xingchen@zte.com.cn>
X-Mailer: git-send-email 2.25.1
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
Cc: airlied@linux.ie, ye xingchen <ye.xingchen@zte.com.cn>,
 Zeal Robot <zealci@zte.com.cn>, Xinhui.Pan@amd.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: ye xingchen <ye.xingchen@zte.com.cn>

Return the value ci_load_smc_ucode() directly instead of storing it in
another redundant variable.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: ye xingchen <ye.xingchen@zte.com.cn>
---
 drivers/gpu/drm/radeon/ci_dpm.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/radeon/ci_dpm.c b/drivers/gpu/drm/radeon/ci_dpm.c
index ac006bed4743..8ef25ab305ae 100644
--- a/drivers/gpu/drm/radeon/ci_dpm.c
+++ b/drivers/gpu/drm/radeon/ci_dpm.c
@@ -2056,7 +2056,7 @@ static void ci_clear_vc(struct radeon_device *rdev)
 static int ci_upload_firmware(struct radeon_device *rdev)
 {
 	struct ci_power_info *pi = ci_get_pi(rdev);
-	int i, ret;
+	int i;
 
 	for (i = 0; i < rdev->usec_timeout; i++) {
 		if (RREG32_SMC(RCU_UC_EVENTS) & BOOT_SEQ_DONE)
@@ -2067,9 +2067,7 @@ static int ci_upload_firmware(struct radeon_device *rdev)
 	ci_stop_smc_clock(rdev);
 	ci_reset_smc(rdev);
 
-	ret = ci_load_smc_ucode(rdev, pi->sram_end);
-
-	return ret;
+	return ci_load_smc_ucode(rdev, pi->sram_end);
 
 }
 
-- 
2.25.1
