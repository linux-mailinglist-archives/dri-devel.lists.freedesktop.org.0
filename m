Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7220AC3CB4
	for <lists+dri-devel@lfdr.de>; Mon, 26 May 2025 11:28:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56EDB10E304;
	Mon, 26 May 2025 09:28:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="NlpuAYtw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F55910E304
 for <dri-devel@lists.freedesktop.org>; Mon, 26 May 2025 09:28:38 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id
 d2e1a72fcca58-7399838db7fso1519450b3a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 26 May 2025 02:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1748251718; x=1748856518; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=1t7c3igEg2x4olSUhClV/gNMpW/HqELZn2hx26e4MFw=;
 b=NlpuAYtwqWT/alOmHfR0EMXrPxZjLy27W8hZhK3ZqvT4IiXz/RaczIDefNhDVRgZ/r
 4c4XF47ix7JtHaRrCUFsDLIoVb6/rpgGvOghs7FvVtOI3+EZLXg8Lzj7wjmPRFaDanTv
 rh3ayuEucC8ev71//f7UkJxHVXB+ou0PKMK7D+6FSpvq5L8Sv13MGZONvziAvUFuRZ5G
 tWGiUdZQlhBSYZoUqpXGbv3znaTWOfZZEaJIcQeKFEDuZzux09g9RiPclc2hNR6IZiyB
 rwq6gDuqfIN26vISBjVFlboemtuewo5vrf+1N7xrzYnb1UeWN9aH7/cdHiX26Zduy8be
 dSoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748251718; x=1748856518;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1t7c3igEg2x4olSUhClV/gNMpW/HqELZn2hx26e4MFw=;
 b=tpHj7z665kkXuK5jtGsGdNZapP652ElPB3OU992njaXs7S0QUE7jaX9J3H4HBM63tJ
 7GzFY2dXPgYzmuIsUA8UUHB58qaf7ZY7mDTjMnkPEGDhJ6oChIBc2abvRv7FIbyTzSBh
 wJ/854FEW3IiJ3HIWB+z33HebyLcsodGDk+WJQF2EsFhdrRgL9mo6lUSHzPMrnFWz6aI
 0SH9LvrnCFendQrSqlHGVrS11lf8v8ciaypn+BWTTkkAeIEefEm6mrUgbFet+UDzYDZx
 czYfZRDdqJfHNznxI5xkGLiEGjadawiUAYcpuyeBtbLPil7db/ZAUqi3H0uo7G+2KZLe
 3Vlg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWW8OGOzaLQIgy8oKhJR70hT8nKUU1lAdR29vMg7lAcg3voR56MgDQugpSKiUgx8pdE+By2UkOCNX8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwgOKuamnARWVlT3oVvWFs4E2L40rkIJNCkS36weH8mPDRwgp6s
 osIbBNzSiSFdkuAjl3zc385Z81Va29YzfwcU7sJXW/qvx12uZzqA8A9PkLUFovLcp6c=
X-Gm-Gg: ASbGncu43Knj8bc6MGUuk+v8AOCIXpvhON4pV54YK6CaMtCTb4Xl3NSbbdrycCC6URR
 X3tTP0VTEaGlQF+Gga2K4Bf+EmoIqkPf5Z8S3A1aUhoMP4ZGasom8HnC+gC3FYms7C3it+Xzwrv
 u7VkO5h7SiPJQoUqD7Z7b1mgktM8fQcQkd9cW3V5rkWoMn6I7jLMQFU/l/kp0b5yyhjoax+pNoM
 HKD5HNWKeNImRAOEWRTvL1w5APwJn2nzYuhrxOHLsQuRCP8Fi4u7DqmL98VZbmWqwNerzTk6PjR
 FeelVSbjR9uGUb8LiRTx50ZXoFI6/0Knd01klyllbTFyeBO55w==
X-Google-Smtp-Source: AGHT+IHIEUE39p3pm7fqUEWZFokJNuqhMaFWrAokjMrQkAg+U8O9ypjRt4CVJfbRtZXjQzdHd5A0iw==
X-Received: by 2002:a05:6a20:9f4b:b0:1e1:9e9f:ae4 with SMTP id
 adf61e73a8af0-2188b6edb7fmr12343504637.13.1748251718059; 
 Mon, 26 May 2025 02:28:38 -0700 (PDT)
Received: from [127.0.1.1] ([104.234.225.11]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-742a9876e62sm17162393b3a.147.2025.05.26.02.28.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 May 2025 02:28:37 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Mon, 26 May 2025 17:28:19 +0800
Subject: [PATCH v10 01/12] drm/msm/dpu: polish log for resource allocation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250526-v6-15-quad-pipe-upstream-v10-1-5fed4f8897c4@linaro.org>
References: <20250526-v6-15-quad-pipe-upstream-v10-0-5fed4f8897c4@linaro.org>
In-Reply-To: <20250526-v6-15-quad-pipe-upstream-v10-0-5fed4f8897c4@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>, Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748251705; l=2319;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=2tgdYLNBOLqvrFN89J2Z5WKCnyYFo8/7L7F+T0zCRyk=;
 b=+odY2eolbWW7KoKHW7wobHwAydvxpsitBhiFd1Xk9f2Swfkbjhr6zFt75/SJEkdUrTE7JTSrT
 +051B395rueB/f33ao+NIt5UbEvnIhNYQjxVznYtMEC1uOXAG0DBH7E
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=
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

It is more likely that resource allocation may fail in complex usage
case, such as quad-pipe case, than existing usage cases.
A resource type ID is printed on failure in the current implementation,
but the raw ID number is not explicit enough to help easily understand
which resource caused the failure, so add a table to match the type ID
to an human readable resource name and use it in the error print.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index 2e296f79cba1437470eeb30900a650f6f4e334b6..2d8ff4b524715c658188fe56bc337e3ffa831c0a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -865,6 +865,21 @@ void dpu_rm_release_all_sspp(struct dpu_global_state *global_state,
 		ARRAY_SIZE(global_state->sspp_to_crtc_id), crtc_id);
 }
 
+static char *dpu_hw_blk_type_name[] = {
+	[DPU_HW_BLK_TOP] = "TOP",
+	[DPU_HW_BLK_SSPP] = "SSPP",
+	[DPU_HW_BLK_LM] = "LM",
+	[DPU_HW_BLK_CTL] = "CTL",
+	[DPU_HW_BLK_PINGPONG] = "pingpong",
+	[DPU_HW_BLK_INTF] = "INTF",
+	[DPU_HW_BLK_WB] = "WB",
+	[DPU_HW_BLK_DSPP] = "DSPP",
+	[DPU_HW_BLK_MERGE_3D] = "merge_3d",
+	[DPU_HW_BLK_DSC] = "DSC",
+	[DPU_HW_BLK_CDM] = "CDM",
+	[DPU_HW_BLK_MAX] = "unknown",
+};
+
 /**
  * dpu_rm_get_assigned_resources - Get hw resources of the given type that are
  *     assigned to this encoder
@@ -946,13 +961,13 @@ int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
 		}
 
 		if (num_blks == blks_size) {
-			DPU_ERROR("More than %d resources assigned to crtc %d\n",
-				  blks_size, crtc_id);
+			DPU_ERROR("More than %d %s assigned to crtc %d\n",
+				  blks_size, dpu_hw_blk_type_name[type], crtc_id);
 			break;
 		}
 		if (!hw_blks[i]) {
-			DPU_ERROR("Allocated resource %d unavailable to assign to crtc %d\n",
-				  type, crtc_id);
+			DPU_ERROR("%s unavailable to assign to crtc %d\n",
+				  dpu_hw_blk_type_name[type], crtc_id);
 			break;
 		}
 		blks[num_blks++] = hw_blks[i];

-- 
2.34.1

