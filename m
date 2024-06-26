Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1296F9199F6
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2024 23:46:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13ED410E9CC;
	Wed, 26 Jun 2024 21:46:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Em/noWH2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B084D10E9C3
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 21:46:09 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-2ec1ac1aed2so86387921fa.3
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 14:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719438368; x=1720043168; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=RdQo5fWG8sEs0OxWIdnSfQFTLoUpNo6OhNW+S7b3XN8=;
 b=Em/noWH23PfVbt6WSJ5lJ/lrN8SU3ajIRNcXQJBQ3GKAslirz5UWFIeC2j/VOKYhjc
 +AquhWkDzXP2v5P+eYLfE/54Tt1BE7sRsiXKqnR3fbFo7v1FF1O+afuzjSI3+6e+ZmVN
 jqu74gVm+0j198vKnlXnPERShaNwG4O2oaT3/pbJg86q0rGNU8ubJr9XYtjSUgmcmxPv
 UZd3HDfjBtSpOh3M+X66E4GLfpp0ioTBA9mZkQZV2FZbAXxXkZ6Wfu0eInwSyTcTtepK
 GHIuQm6JN7OMoPZVRs/28hya7i6kHMzXEXUojFUixRWl2ablKTLt0/A9IPeLFgnHPyMx
 j55w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719438368; x=1720043168;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RdQo5fWG8sEs0OxWIdnSfQFTLoUpNo6OhNW+S7b3XN8=;
 b=jXufPo6ihdxjdvQFPcjuuZc0zH1qe6Kf8k9viljlz83Dx1WyYx+8t6WG4sjfY9BT8Q
 NQczYy3jngrAsSHu/Jdiov1u6NWyLC8NjyuEHH1OTl6zRog9IiAeI6bGjR7x5cJhbG7A
 XxVnJhZKXwJq1jfezhJVrrS/qw8TSpUzhkRFfb/oVeu5ltxiE/scBfIPmrjTX85zyw1X
 vBl9+sYCK8RPvyOQEbPYfWLX7xpqOpHJbTTvE4UPCNZ+ZjqYMX0R7BEtrcIbeJ3yUJrr
 SqAqXJScTneZed4OqD7MV5iXMMiqtNdUNDaS4yj6YXjQ2a3E7pO9VuNX1Yy8/HR1CeGV
 0tYw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX+rJTLsj9Euse/YuPs9nSKKbIY7DDZuf6uHjPy28cyBu5Smp6LJEFOFbVtPevCDPSU555JLB0iDEwpzlT6PUb90+zvUzpr9vkrGvM5f0w0
X-Gm-Message-State: AOJu0YzY6xDW9ZcVZmi5Yqt+YzF0NwoOVsB53yYvv3QOqRe8k5MmPxT8
 DZEpk5O6uYoBN+fcesEhIeOldRMuuCvlYOHlSsL0S9DOJ68zcVBUPHSu8RZy0X0=
X-Google-Smtp-Source: AGHT+IFUl+VFc79I89/FDHkGL4KCoMOtJiejNvWq3P5itbcnexAaYWN7/2NPdgZN7XHgJ0BHl7Igog==
X-Received: by 2002:a2e:321a:0:b0:2eb:f472:e7d3 with SMTP id
 38308e7fff4ca-2ec5b2840fdmr67893571fa.6.1719438368002; 
 Wed, 26 Jun 2024 14:46:08 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ee4a350d96sm23201fa.49.2024.06.26.14.46.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jun 2024 14:46:07 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 27 Jun 2024 00:46:00 +0300
Subject: [PATCH v5 06/12] drm/msm/dpu: drop virt_formats from SSPP subblock
 configuration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240627-dpu-virtual-wide-v5-6-5efb90cbb8be@linaro.org>
References: <20240627-dpu-virtual-wide-v5-0-5efb90cbb8be@linaro.org>
In-Reply-To: <20240627-dpu-virtual-wide-v5-0-5efb90cbb8be@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2982;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=jgWuBeSN44PBrqEAYaDRIleuDcOo2Otlba4SXVg5nDY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmfIwYPPR/q9+rC0FZwfZgjVpsP2ug/iOukLRbH
 8ryN9IAB6WJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZnyMGAAKCRCLPIo+Aiko
 1bEkB/0Zq5FZQ9G7cDENIhIzcY7jzbwKqrEAkB1df2lSb7hN/vF33F8Z8F7WLFA5fgMwAM3a/XK
 CIp2fDAbXFvCe5VZRU+OFX1toI+tmrADh50/H+yNXC2XYIDEZMWJOmvRNbZuI6FZ5Qd1ZkFqJ7n
 ysMv/1Sq+XHOdp8x85RK0himr6i8djJswGLE/ssLC6npqdG2vuy6+N0oIBjCjnkjsG41u/WhN+K
 AT4hXMLXt77XOYR3nFMjS5+dXudBFsKkhcgcNrdMvnwK3qOQhBQPTx25sTMo9j5J6GLwWA7ayCg
 pRF8ln8E9lRiDeGs+EKnZsflDIyBxwkv7PEen18bBr7UFYS4
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

The virt_formats / virt_num_formats are not used by the current driver
and are not going to be used in future since formats for virtual planes
are handled in a different way, by forbidding unsupported combinations
during atomic_check. Drop those fields now.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 8 --------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 4 ----
 2 files changed, 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 648c8d0a4c36..a3d29c69bda4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -283,8 +283,6 @@ static const u32 wb2_formats_rgb_yuv[] = {
 		.base = 0x1a00, .len = 0x100,}, \
 	.format_list = plane_formats_yuv, \
 	.num_formats = ARRAY_SIZE(plane_formats_yuv), \
-	.virt_format_list = plane_formats, \
-	.virt_num_formats = ARRAY_SIZE(plane_formats), \
 	.rotation_cfg = NULL, \
 	}
 
@@ -299,8 +297,6 @@ static const u32 wb2_formats_rgb_yuv[] = {
 		.base = 0x1a00, .len = 0x100,}, \
 	.format_list = plane_formats_yuv, \
 	.num_formats = ARRAY_SIZE(plane_formats_yuv), \
-	.virt_format_list = plane_formats, \
-	.virt_num_formats = ARRAY_SIZE(plane_formats), \
 	.rotation_cfg = rot_cfg, \
 	}
 
@@ -310,8 +306,6 @@ static const u32 wb2_formats_rgb_yuv[] = {
 	.maxupscale = SSPP_UNITY_SCALE, \
 	.format_list = plane_formats, \
 	.num_formats = ARRAY_SIZE(plane_formats), \
-	.virt_format_list = plane_formats, \
-	.virt_num_formats = ARRAY_SIZE(plane_formats), \
 	}
 
 #define _DMA_SBLK() \
@@ -320,8 +314,6 @@ static const u32 wb2_formats_rgb_yuv[] = {
 	.maxupscale = SSPP_UNITY_SCALE, \
 	.format_list = plane_formats, \
 	.num_formats = ARRAY_SIZE(plane_formats), \
-	.virt_format_list = plane_formats, \
-	.virt_num_formats = ARRAY_SIZE(plane_formats), \
 	}
 
 static const struct dpu_rotation_cfg dpu_rot_sc7280_cfg_v2 = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 37e18e820a20..3f2646955ae0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -372,8 +372,6 @@ struct dpu_caps {
  * @csc_blk:
  * @format_list: Pointer to list of supported formats
  * @num_formats: Number of supported formats
- * @virt_format_list: Pointer to list of supported formats for virtual planes
- * @virt_num_formats: Number of supported formats for virtual planes
  * @dpu_rotation_cfg: inline rotation configuration
  */
 struct dpu_sspp_sub_blks {
@@ -386,8 +384,6 @@ struct dpu_sspp_sub_blks {
 
 	const u32 *format_list;
 	u32 num_formats;
-	const u32 *virt_format_list;
-	u32 virt_num_formats;
 	const struct dpu_rotation_cfg *rotation_cfg;
 };
 

-- 
2.39.2

