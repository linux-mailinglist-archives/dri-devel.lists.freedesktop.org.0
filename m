Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E2FDF38AD6A
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 14:03:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1DCE6F411;
	Thu, 20 May 2021 12:03:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28A506F41C
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 12:03:34 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id 62so7997980wmb.3
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 05:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zlibc4LyGipvg4obFAlhywPDGkR/RwOwB7qJgTWpEQk=;
 b=UA59QABmfviBFeZfpaAPoiLqz5qey6xTmF0t9hqA5QLsmKpXnUkVTCnx0qvs0zKJ8C
 z2bJ3m2Fw2kqMgDcGlAR5byvIHNNEz6vSBKq7OD8aL/kH5wFAaL7lQv3F/Ofen/BzpNu
 m6x/RTaH8fT5BM81ukjIZ2TODrhhdl9y6fuVJ/wf5dhUZwmo0v4gSn3cxh0XIOpdG59f
 aFYlwPkIfxVZZWi3DL/vzZCK0Y9G2Xn50Yecd7IskuY7X8P33ypXjiNExPQGdnISLlAS
 3j+DHnslT2hE+iZiS305JG439KEM8SnpG0/Mzb4KMi3RNvyxItyN73kDYJJBFipMjXhc
 BEbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zlibc4LyGipvg4obFAlhywPDGkR/RwOwB7qJgTWpEQk=;
 b=b8FYzvT4AZhFGFQphUNh0w4inI41/w+isgIk/4azj64nwH0zwQdoeQi0l76391y6eb
 uBIn9OdC94qA5B6kswiXPuUEITZAXZxF/KRTzw8gtSIPnrI+wcHTTZU6F3ZS2kQi7+rI
 ex7p0UeC8HDERRvcj2Cn1kxCvsE7SQNUgpA26F4HU9a41LG+OESjE29HOg79uMDsWVk1
 dbIrQvvfp3sV8pbWc+NR/0KycRrzhk9xPMLYYb1tv9pTwB3Prv0po3rkwTXUjLMuFyKO
 bcgqBKm7CwneitakPom0VRCay2Ye14/CvamvIy8V2DEc3hcgAcXPIr/zGEmqFFj0f/om
 w1wA==
X-Gm-Message-State: AOAM530HcE/AjCcPTAul5lMiyk8Xuj/3xsdxiMnbBsJuTQpSYruk552P
 4TbSsaw5xYGGKSQGlN8tspvDYA==
X-Google-Smtp-Source: ABdhPJxZvMmhAPb64IZvUSM2V4g4sPvzwvUnAl0rdZIN85Pd0pFiszmlO95w7yWHvYH/+prqI7Rtkg==
X-Received: by 2002:a1c:5582:: with SMTP id j124mr3405666wmb.0.1621512202682; 
 Thu, 20 May 2021 05:03:22 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
 by smtp.gmail.com with ESMTPSA id j10sm2886332wrt.32.2021.05.20.05.03.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 05:03:22 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 30/38] drm/amd/amdgpu/gfx_v9_4_2: Mark functions called by
 reference as static
Date: Thu, 20 May 2021 13:02:40 +0100
Message-Id: <20210520120248.3464013-31-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210520120248.3464013-1-lee.jones@linaro.org>
References: <20210520120248.3464013-1-lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_2.c:1008:5: warning: no previous prototype for ‘gfx_v9_4_2_query_ras_error_count’ [-Wmissing-prototypes]
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_2.c:1054:6: warning: no previous prototype for ‘gfx_v9_4_2_reset_ras_error_count’ [-Wmissing-prototypes]
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_2.c:1063:5: warning: no previous prototype for ‘gfx_v9_4_2_ras_error_inject’ [-Wmissing-prototypes]
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_2.c:1133:6: warning: no previous prototype for ‘gfx_v9_4_2_query_ras_error_status’ [-Wmissing-prototypes]
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_2.c:1143:6: warning: no previous prototype for ‘gfx_v9_4_2_reset_ras_error_status’ [-Wmissing-prototypes]
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_2.c:1153:6: warning: no previous prototype for ‘gfx_v9_4_2_enable_watchdog_timer’ [-Wmissing-prototypes]

Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_2.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_2.c b/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_2.c
index dbad9ef002d59..87ec96a18a5dd 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_2.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_2.c
@@ -1641,8 +1641,8 @@ static int gfx_v9_4_2_query_utc_edc_count(struct amdgpu_device *adev,
 	return 0;
 }
 
-int gfx_v9_4_2_query_ras_error_count(struct amdgpu_device *adev,
-				   void *ras_error_status)
+static int gfx_v9_4_2_query_ras_error_count(struct amdgpu_device *adev,
+					    void *ras_error_status)
 {
 	struct ras_err_data *err_data = (struct ras_err_data *)ras_error_status;
 	uint32_t sec_count = 0, ded_count = 0;
@@ -1690,7 +1690,7 @@ static void gfx_v9_4_2_reset_ea_err_status(struct amdgpu_device *adev)
 	mutex_unlock(&adev->grbm_idx_mutex);
 }
 
-void gfx_v9_4_2_reset_ras_error_count(struct amdgpu_device *adev)
+static void gfx_v9_4_2_reset_ras_error_count(struct amdgpu_device *adev)
 {
 	if (!amdgpu_ras_is_supported(adev, AMDGPU_RAS_BLOCK__GFX))
 		return;
@@ -1699,7 +1699,7 @@ void gfx_v9_4_2_reset_ras_error_count(struct amdgpu_device *adev)
 	gfx_v9_4_2_query_utc_edc_count(adev, NULL, NULL);
 }
 
-int gfx_v9_4_2_ras_error_inject(struct amdgpu_device *adev, void *inject_if)
+static int gfx_v9_4_2_ras_error_inject(struct amdgpu_device *adev, void *inject_if)
 {
 	struct ras_inject_if *info = (struct ras_inject_if *)inject_if;
 	int ret;
@@ -1772,7 +1772,7 @@ static void gfx_v9_4_2_query_utc_err_status(struct amdgpu_device *adev)
 	}
 }
 
-void gfx_v9_4_2_query_ras_error_status(struct amdgpu_device *adev)
+static void gfx_v9_4_2_query_ras_error_status(struct amdgpu_device *adev)
 {
 	if (!amdgpu_ras_is_supported(adev, AMDGPU_RAS_BLOCK__GFX))
 		return;
@@ -1782,7 +1782,7 @@ void gfx_v9_4_2_query_ras_error_status(struct amdgpu_device *adev)
 	gfx_v9_4_2_query_sq_timeout_status(adev);
 }
 
-void gfx_v9_4_2_reset_ras_error_status(struct amdgpu_device *adev)
+static void gfx_v9_4_2_reset_ras_error_status(struct amdgpu_device *adev)
 {
 	if (!amdgpu_ras_is_supported(adev, AMDGPU_RAS_BLOCK__GFX))
 		return;
@@ -1792,7 +1792,7 @@ void gfx_v9_4_2_reset_ras_error_status(struct amdgpu_device *adev)
 	gfx_v9_4_2_reset_sq_timeout_status(adev);
 }
 
-void gfx_v9_4_2_enable_watchdog_timer(struct amdgpu_device *adev)
+static void gfx_v9_4_2_enable_watchdog_timer(struct amdgpu_device *adev)
 {
 	uint32_t i;
 	uint32_t data;
-- 
2.31.1

