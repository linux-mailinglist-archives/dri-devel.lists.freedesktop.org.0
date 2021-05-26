Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 094D23912B6
	for <lists+dri-devel@lfdr.de>; Wed, 26 May 2021 10:47:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1615B6EC32;
	Wed, 26 May 2021 08:47:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E94876EC33
 for <dri-devel@lists.freedesktop.org>; Wed, 26 May 2021 08:47:32 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id n4so222684wrw.3
 for <dri-devel@lists.freedesktop.org>; Wed, 26 May 2021 01:47:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6noTtcFdzAM4mRtKAmNKqowB17kNzJ46dcIfcnLdMB8=;
 b=RZRDWvzHNmKISbyL/y7tncGD6OlregtD8vbp5d/rmc0PNGq6sghfzAZpXIe2PuELFw
 Bl1gg68glEy2naNn9LnTRH2OEEqMjSt2RTKm/7jbmXscdFxuK8CWcUGb/vXCoQfWtJTk
 /aQCyRZ9whXV/5z0rECrM+Xhv7rb8OCYw5pWY7z9cnUp9F4RSx6QshjN30+bDnJ7f5/U
 FM45gqEUoo98DgxJer6yTzB/Razb2X3ch0zQNmp85X4rpnSrCDr8+ICEhSO3EPBjU5of
 GQMhOB5m59Zl9sLle9jZmHDPMyzPnptje0Xt7a9qjMhnYHHKm1eSSNeIPMNm2d2PrSMH
 boSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6noTtcFdzAM4mRtKAmNKqowB17kNzJ46dcIfcnLdMB8=;
 b=XEKqianPd84FcJkMaMr8ZfL04ecvndSni+wMs55TRAxtC+1g5G0K58m9gHf4XLdXVS
 U4i56lw6xwC2CdAHDyX+diOyzkSGdwFV1+tCRFw7aQeGGGxceDAsgH3pIF1TJzaslI8R
 T24JPe0IzhxQZHj9wLDKG53wkr2r61QAeoWO9njDE7GqszFikJQfVhgc5OxZFL9mCjst
 IGZskDP/D/8gTJdCQixBNah7my5zgkpc+bOoGivD9ZDmz+Uxf559xpNRnGl+BIq2xxkd
 FsDlJr9vcNHxxAHpioYIb4E1p/Q6EKV9/jfiZ2nH37bOFDy6xNgKH2G89tETPR/71vnN
 DdTQ==
X-Gm-Message-State: AOAM531AfUzE1nk9JsGwG30Ot3HJMjDipajZd0kvpbsVYLvZI6I1HGFK
 UpB9RnMLw9Jdn6Hj0XfBhHqfyQ==
X-Google-Smtp-Source: ABdhPJwiod43TqTsfuNXme67KiMrAR6fRFT9Vr9f58QWqFwUO+ulOBWEvlceFKoeCsGC21ORHtaxVw==
X-Received: by 2002:adf:eacf:: with SMTP id o15mr31088295wrn.219.1622018851572; 
 Wed, 26 May 2021 01:47:31 -0700 (PDT)
Received: from dell.default ([91.110.221.223])
 by smtp.gmail.com with ESMTPSA id l18sm18911918wrt.97.2021.05.26.01.47.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 01:47:31 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 01/34] drm/amd/pm/inc/smu_v13_0: Move table into the only
 source file that uses it
Date: Wed, 26 May 2021 09:46:53 +0100
Message-Id: <20210526084726.552052-2-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210526084726.552052-1-lee.jones@linaro.org>
References: <20210526084726.552052-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: David Airlie <airlied@linux.ie>, Kevin Wang <kevin1.wang@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/amd/amdgpu/../pm/inc/smu_v13_0.h:54:43: warning: ‘smu13_thermal_policy’ defined but not used [-Wunused-const-variable=]

Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Kevin Wang <kevin1.wang@amd.com>
Cc: amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/amd/pm/inc/smu_v13_0.h             | 6 ------
 drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c | 6 ++++++
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/inc/smu_v13_0.h b/drivers/gpu/drm/amd/pm/inc/smu_v13_0.h
index 1687709507b3d..6119a36b2cba0 100644
--- a/drivers/gpu/drm/amd/pm/inc/smu_v13_0.h
+++ b/drivers/gpu/drm/amd/pm/inc/smu_v13_0.h
@@ -51,12 +51,6 @@
 #define CTF_OFFSET_HOTSPOT		5
 #define CTF_OFFSET_MEM			5
 
-static const struct smu_temperature_range smu13_thermal_policy[] =
-{
-	{-273150,  99000, 99000, -273150, 99000, 99000, -273150, 99000, 99000},
-	{ 120000, 120000, 120000, 120000, 120000, 120000, 120000, 120000, 120000},
-};
-
 struct smu_13_0_max_sustainable_clocks {
 	uint32_t display_clock;
 	uint32_t phy_clock;
diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c
index d62cc6bb1a305..d6ce665baaf3b 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c
@@ -78,6 +78,12 @@
 
 #define smnPCIE_ESM_CTRL			0x111003D0
 
+static const struct smu_temperature_range smu13_thermal_policy[] =
+{
+	{-273150,  99000, 99000, -273150, 99000, 99000, -273150, 99000, 99000},
+	{ 120000, 120000, 120000, 120000, 120000, 120000, 120000, 120000, 120000},
+};
+
 static const struct cmn2asic_msg_mapping aldebaran_message_map[SMU_MSG_MAX_COUNT] = {
 	MSG_MAP(TestMessage,			     PPSMC_MSG_TestMessage,			0),
 	MSG_MAP(GetSmuVersion,			     PPSMC_MSG_GetSmuVersion,			1),
-- 
2.31.1

