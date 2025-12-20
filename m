Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0335BCD3971
	for <lists+dri-devel@lfdr.de>; Sun, 21 Dec 2025 02:26:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C931010E1EC;
	Sun, 21 Dec 2025 01:26:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PfHyICgh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
 [209.85.215.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE53C10E080
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Dec 2025 08:02:13 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id
 41be03b00d2f7-c1cf2f0523eso1708233a12.3
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Dec 2025 00:02:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766217733; x=1766822533; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=t0yjTU9k4zkkVGpLyzkoTzrEOACK8nCEpapOdu6BBUw=;
 b=PfHyICghgYjqdPFmK6VUhMyK7L/a6AQHnAWTS/mdzUproj50WdjSV1jAFxBmKoDZig
 bUGD4cyYmogiEOsTc4FTH8Wc2GvNE/3TSEx7EVDLRh6zh2CeLaAmaziJoPyeuue7wPKN
 hFkO8NgYIUA+wCte8UHuflggPwmeJznGnePE92lKR9NuuoCzobB0pkew5SxNWKZKtO+I
 PpLooL6L9U/sYxQerd40JB6wOfnp6ShdWJ0s0noMrbc2nL5lb+RCsHrxPH8ydbzIfGF8
 D5lvbZWtbZc70e0fsI4nVw03G9Wf1KxoCi8+eHGO6pocCTA43r/wlTANNTIFbjXL3OyZ
 AyOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766217733; x=1766822533;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t0yjTU9k4zkkVGpLyzkoTzrEOACK8nCEpapOdu6BBUw=;
 b=EDhMgar8VBfhXCa2OEfop2udFm9lzKvRg2ZJX2k/HpSOKE1f4xxBidnO9M7oSdB5KF
 F4MmeJdbX6M8FUQX2akJBqiGR4joGOVI1U58cgt5yYlEl46II2cJudqp+WXuLPePb/ng
 5Sy35beuzEGCC6aPnpcM7JM67s5kLT6N7tohX6jYhsTdFwrOgMck0wtQZJH9Eq2spQsP
 bvISOUssCoK4OsdqKq0txrLSTzs1QS4yfrGfBvaABZ70bEtTNFNJ/cdgs5OG82cOR57Y
 0kdKsTDwHIp0h4Onfhq58rgRFy2BhScrN10FOJkVO+EkpEkI38ExiAicK70v3LKYgTsM
 uvjQ==
X-Gm-Message-State: AOJu0YzppVZ3iDgnrozeltGRomma7KXmEBUeAno5D2p3U7UG9qmBh6nZ
 DuLbn+7vsH9cXUcQFKjdX+H0UbmL5oGCzf/QeoIdgVO9zLrd+lv11QtY
X-Gm-Gg: AY/fxX7dwx/UJcOGbyaAEH0YfM+qqTVzb9b9Nsyht4eoJ6VZXokIBi0IeBONOpa0/Ds
 7Int0U77jsGeb68/pNPZHVKVd3/gXvgJNqwK3B9mChwgVAyBRxg6vV251maOal6RFLEpxtDOHwI
 VqOg3xRtTnS/YiP2BfQUiAPUo5RIIgHvkBXOF9Dg4oiXh2hWQkKbNxjhAo33UjLGGrxN+2W8x7p
 cPI1C4hXTZcdFP9dJUnJe4yCvV0gm5eUdlEAaAZep9Ugm8PXuy7AARwTsVMTq/eeGDvO1zfIN8E
 klDuLsfN30Xtm2z8sW2iSn3EjarYifTaUui6Q13t02WHU1RTKmqSsgooKPHFNh+pb1Xtr6FfPL4
 EzSjcm6zZdxwbH+in2eUGJzV+1tWjRQL2XuBW/js6JhSpYlRwqwGFKUPE91Vjc91AeogJ7CNlQA
 nGLPlF+PQLls/ifaAl2xJLkdtvdnoUZE10LiZlPfotWpCD/mN4SViqpWHrjoQ4yw==
X-Google-Smtp-Source: AGHT+IH29IOy31k2BtNarCe+9zp7xxMuT1IvtqtIgzk/XemAzrpP1YIyNNAYRCxAUgVPzsRp52n+wA==
X-Received: by 2002:a05:7022:e98b:b0:11c:b3ae:c9e9 with SMTP id
 a92af1059eb24-12172311f8fmr5580780c88.43.1766217733259; 
 Sat, 20 Dec 2025 00:02:13 -0800 (PST)
Received: from titanite-d300.amd.com ([165.204.154.57])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-121724cfc0esm17426947c88.2.2025.12.20.00.02.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Dec 2025 00:02:12 -0800 (PST)
From: Mukesh Ogare <mukeshogare871@gmail.com>
To: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com,
 simona@ffwll.ch, amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Mukesh Ogare <mukeshogare871@gmail.com>
Subject: [PATCH v2] drm/radeon: convert VCE logging to drm_* helpers
Date: Sat, 20 Dec 2025 16:01:56 +0800
Message-ID: <20251220080156.1961026-1-mukeshogare871@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 21 Dec 2025 01:26:28 +0000
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

Replace legacy DRM_ERROR() and DRM_INFO() logging in the VCE code
with drm_err() and drm_info() helpers that take a struct drm_device.

Using drm_* logging provides proper device context in dmesg, which is
important for systems with multiple DRM devices, and aligns the radeon
driver with current DRM logging practices.

No functional change intended.

Signed-off-by: Mukesh Ogare <mukeshogare871@gmail.com>
---
 drivers/gpu/drm/radeon/radeon_vce.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/radeon/radeon_vce.c b/drivers/gpu/drm/radeon/radeon_vce.c
index a203992cb932..fd176034b251 100644
--- a/drivers/gpu/drm/radeon/radeon_vce.c
+++ b/drivers/gpu/drm/radeon/radeon_vce.c
@@ -121,7 +121,7 @@ int radeon_vce_init(struct radeon_device *rdev)
 	if (sscanf(c, "%2u]", &rdev->vce.fb_version) != 1)
 		return -EINVAL;
 
-	drm_err(&rdev->ddev, "Found VCE firmware/feedback version %d.%d.%d / %d!\n",
+	drm_info(&rdev->ddev, "Found VCE firmware/feedback version %d.%d.%d / %d!\n",
 		 start, mid, end, rdev->vce.fb_version);
 
 	rdev->vce.fw_version = (start << 24) | (mid << 16) | (end << 8);
-- 
2.43.0

