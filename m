Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A2C569F7617
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2024 08:49:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29BD310ECA2;
	Thu, 19 Dec 2024 07:49:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="eTYSwJby";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95A9E10E33B
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2024 07:49:51 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id
 98e67ed59e1d1-2f43d17b0e3so467154a91.0
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2024 23:49:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734594591; x=1735199391; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ntwyeNHAM8vdoBllqLbul3GM7LuDoqcfQURQf8f/iyY=;
 b=eTYSwJbyvRo0nog0nT3nRA+b3JXOLvsyxHLt/IlzsR4XW+v5RxaPiF9/DO6R/JvF8T
 ZebREiNb27IUVZ5Xp/rBIQOuBCZ1WOSJao5tuuAdL56sunuQ/q63CzD6wn5XuMDyNiZG
 Z4HvNuykVzvs9mLOff5yDfM/qHCvrAExAa0zNzlEIA8JHnC6zqihbBjfciagMAfTDeCw
 ZYAo84Bqjz3ArAILhgldGd6/TMRTxjhVZFgS+Veg/8ysNekiY2KRtRueR9Qp1rMjMdxb
 b8C09YKjaiv/O63cUSI5FgF86tnWKTUOsD19lXwJ0cngLzykIJngWDLt5NyJAMhM+B2T
 E3sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734594591; x=1735199391;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ntwyeNHAM8vdoBllqLbul3GM7LuDoqcfQURQf8f/iyY=;
 b=rbxiHX+mUhS2w0WwjhDtkhDot+C19HAx1ZDPFF/5MQ6Kfv0Qd3WAV7E8BkdVW/zecy
 am9zUSQzobrqgZdsoJXxTUGwMSXvvHpRPSnr+w/9PYY6Ww3BU9QfEVlgNapRHJ7dCWKU
 9C3KFQhp2JVJR9xstw6+OsoPcWcICCtlWCN8P9UEmYOFUbDw6fOBwjDibGW8sgFEI1dU
 4L/bvqRB4+QrAsxj5XtyxMZEzcd8+wiCzbnR9r3RUYpd1u2XQVyRhkELPEL5BK0dgSlb
 PXPB4yYRMiUfDlooXoSbexuP/qkEbpSPoyU0QY2Y4MREfe7zgiPu+TencxcNzUwhufHw
 8C0g==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5qJhtOnseC1Dj1pWOFsKld7hyy7T6o82krXiHmgMt5hRneRBNvvv74bL5XiHVoXWi0qv6mqibuas=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YygguaIf/1Nw8v8VgsirgPlznTP6BmRlxnjqj+FTUDvhLmCBC85
 glGTLvauFyyNWt/Wlppsqamm11tyrvslz+ZC+M8XyTRbRFV8nQj4ySdFfJutVyw=
X-Gm-Gg: ASbGncvndx87yUuKRx36uSYTTUKeF2i+YJRY1yySoXk6qnIv2AkGIuYtRM7Y0TzVm7W
 9dkfpOAYOjazXDoAtZIwNa1sB4awvd2yiBsUdV2ibHtnQgl4LrQnFBVFnRiKEMKTxQ+6UsAN8uc
 595D1MkREkmJB4uMPVWtMFMNzgY7ZCZa1/XGM7CJ6l7u69T26gwvpj+DO/uqvy2UkjLYCQ93mjY
 X/wJJxmVYjYLT7n3Hn2Hmd4kwJPuDN2JOMn8jkA9VHFlSDgbd2q8A==
X-Google-Smtp-Source: AGHT+IHylhqGksguRWryHJqU/y1cSrvMKT7OODzv6gUo595Vy99rw8bFUAq9w5knvwhJEVvpdpUdWg==
X-Received: by 2002:a17:90b:2c84:b0:2f2:a664:df20 with SMTP id
 98e67ed59e1d1-2f443cd2db1mr3408286a91.7.1734594591238; 
 Wed, 18 Dec 2024 23:49:51 -0800 (PST)
Received: from [127.0.1.1] ([112.65.12.217]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-219dc97432dsm6784445ad.110.2024.12.18.23.49.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2024 23:49:50 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 19 Dec 2024 15:49:21 +0800
Subject: [PATCH v3 03/15] drm/msm/dpu: polish log for resource allocation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-3-92c7c0a228e3@linaro.org>
References: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-0-92c7c0a228e3@linaro.org>
In-Reply-To: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-0-92c7c0a228e3@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734594567; l=1781;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=OspW4wNM9FswzvS293zm/N/Rth99PB/cv63qlI1/JXU=;
 b=6gxzO2YImydOFCnp2SlOv3X4bZtMMSqMY8E3b6yJztQzfBRFpLy3nUYay6jc7K4FHaZ/VOBRb
 b9X2Qi8xVxgCxd/pUAJxWOnuN4H81YbCeer+5H49yOhoSYQvDF3bI0A
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

Add resource type info on allocation failure.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index 6dc3fa79e6425..cde3c5616f9bc 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -814,6 +814,21 @@ void dpu_rm_release_all_sspp(struct dpu_global_state *global_state,
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
+	[DPU_HW_BLK_MAX] = "none",
+};
+
 /**
  * dpu_rm_get_assigned_resources - Get hw resources of the given type that are
  *     assigned to this encoder
@@ -874,13 +889,13 @@ int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
 			continue;
 
 		if (num_blks == blks_size) {
-			DPU_ERROR("More than %d resources assigned to enc %d\n",
-				  blks_size, enc_id);
+			DPU_ERROR("More than %d %s assigned to enc %d\n",
+				  blks_size, dpu_hw_blk_type_name[type], enc_id);
 			break;
 		}
 		if (!hw_blks[i]) {
-			DPU_ERROR("Allocated resource %d unavailable to assign to enc %d\n",
-				  type, enc_id);
+			DPU_ERROR("%s unavailable to assign to enc %d\n",
+				  dpu_hw_blk_type_name[type], enc_id);
 			break;
 		}
 		blks[num_blks++] = hw_blks[i];

-- 
2.34.1

