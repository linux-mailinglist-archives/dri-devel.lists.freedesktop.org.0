Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 259AB2446B8
	for <lists+dri-devel@lfdr.de>; Fri, 14 Aug 2020 11:05:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 039516E3B0;
	Fri, 14 Aug 2020 09:05:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE95D6E2E4;
 Fri, 14 Aug 2020 09:05:27 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id g8so6872049wmk.3;
 Fri, 14 Aug 2020 02:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VWo7qfLl0wE2i8zg/BhTlkJQXxIbQK+FJtPUS8AfL7g=;
 b=CKD0gHxkwv1aBbvAQxLbB0lfmGaTIXlyHM3IqNHHj4IZZ0xUW1gTSf/qil/iLu4/Y2
 fnToPx6+QVVz0M7gnOS8X9qGFkd4xjV2/T1w0JFywwO3CmgFLWMKtKPOzK8oZF55+/ZP
 cc0xM5H5yppRMbmyfOXY+D0d020uRVnMpV2j/zHRwWGSkxDlCvnUxSRFTC0jt6EeQQmj
 26TVykKdPLJoPSKzutdZqNASsJpsOx6/UtQ86UjMr1TsbTLok+nJGvOjSMv4o/ld56Dq
 sd4vCcAKuWfGPE2AtY+T6BnOjUN+K0eoNYLIW4PSYFEo5q6tzCvD8FNFaievhUStX/Gd
 0lDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VWo7qfLl0wE2i8zg/BhTlkJQXxIbQK+FJtPUS8AfL7g=;
 b=B2W3QrTYpBp00LUqIrvemmoFYmKNPqaUIbJECIGf6N4oj6yfBrulQcZuwUgE7rVD3r
 qzCDqJqsmhcrtIlNopCcpdqwGwlp3ZwRvn7Dp5dkRpQuuhkWe6h5YigbT5dKqeR+cHxe
 NfGpwFxN246rIylT7iX7u1yyyLxaSG3+YTY3CekhMKqqWc1ALrxmGR7CVsW8nUE+V1pl
 YN6sZCYoSI83tYyW8up8haFi8mfnhZw+3sXGBz/dhv9Kmrg9nDIrm0AXbhI+evK7UrD8
 uN92AOKyASfkPIXkv2zma3RYtHBZQ/El0LjE1Avquam8uOZPGYOOEtvWcqHKhIHaMuZm
 GGiA==
X-Gm-Message-State: AOAM533TW020RRHJdN+GfT3jzS+XQfE9TbqQtsRLa4TgoyMd2o97tRTl
 ao/urMf+ToDDhMOo5R2UPB4=
X-Google-Smtp-Source: ABdhPJw2g4VEAD+4yHIaD8SWwebBs3rsYJIxKje6Ym86s4qaoAkLOx0vC+saak3csaS+5g51xCGDwA==
X-Received: by 2002:a1c:2854:: with SMTP id o81mr1572302wmo.61.1597395926454; 
 Fri, 14 Aug 2020 02:05:26 -0700 (PDT)
Received: from localhost.localdomain (62-178-82-229.cable.dynamic.surfer.at.
 [62.178.82.229])
 by smtp.gmail.com with ESMTPSA id m14sm14046745wrx.76.2020.08.14.02.05.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Aug 2020 02:05:24 -0700 (PDT)
From: Christian Gmeiner <christian.gmeiner@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] drm/etnaviv: rename pipe_reg_read(..)
Date: Fri, 14 Aug 2020 11:05:01 +0200
Message-Id: <20200814090512.151416-2-christian.gmeiner@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200814090512.151416-1-christian.gmeiner@gmail.com>
References: <20200814090512.151416-1-christian.gmeiner@gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Russell King <linux+etnaviv@armlinux.org.uk>,
 cphealy@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

pipe_reg_read(..) iterates over all pixel pipes, selects a perf counter
register and sums the actual perf counter value. Rename the function
to reflect more what it is actual doing.

Signed-off-by: Christian Gmeiner <christian.gmeiner@gmail.com>
---
 drivers/gpu/drm/etnaviv/etnaviv_perfmon.c | 30 +++++++++++------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_perfmon.c b/drivers/gpu/drm/etnaviv/etnaviv_perfmon.c
index 75f9db8f7bec..1f0402f7a7de 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_perfmon.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_perfmon.c
@@ -46,7 +46,7 @@ static u32 perf_reg_read(struct etnaviv_gpu *gpu,
 	return gpu_read(gpu, domain->profile_read);
 }
 
-static u32 pipe_reg_read(struct etnaviv_gpu *gpu,
+static u32 pipe_perf_reg_read(struct etnaviv_gpu *gpu,
 	const struct etnaviv_pm_domain *domain,
 	const struct etnaviv_pm_signal *signal)
 {
@@ -141,22 +141,22 @@ static const struct etnaviv_pm_domain doms_3d[] = {
 			{
 				"PIXEL_COUNT_KILLED_BY_COLOR_PIPE",
 				VIVS_MC_PROFILE_CONFIG0_PE_PIXEL_COUNT_KILLED_BY_COLOR_PIPE,
-				&pipe_reg_read
+				&pipe_perf_reg_read
 			},
 			{
 				"PIXEL_COUNT_KILLED_BY_DEPTH_PIPE",
 				VIVS_MC_PROFILE_CONFIG0_PE_PIXEL_COUNT_KILLED_BY_DEPTH_PIPE,
-				&pipe_reg_read
+				&pipe_perf_reg_read
 			},
 			{
 				"PIXEL_COUNT_DRAWN_BY_COLOR_PIPE",
 				VIVS_MC_PROFILE_CONFIG0_PE_PIXEL_COUNT_DRAWN_BY_COLOR_PIPE,
-				&pipe_reg_read
+				&pipe_perf_reg_read
 			},
 			{
 				"PIXEL_COUNT_DRAWN_BY_DEPTH_PIPE",
 				VIVS_MC_PROFILE_CONFIG0_PE_PIXEL_COUNT_DRAWN_BY_DEPTH_PIPE,
-				&pipe_reg_read
+				&pipe_perf_reg_read
 			}
 		}
 	},
@@ -184,32 +184,32 @@ static const struct etnaviv_pm_domain doms_3d[] = {
 			{
 				"VS_INST_COUNTER",
 				VIVS_MC_PROFILE_CONFIG0_SH_VS_INST_COUNTER,
-				&pipe_reg_read
+				&pipe_perf_reg_read
 			},
 			{
 				"RENDERED_VERTICE_COUNTER",
 				VIVS_MC_PROFILE_CONFIG0_SH_RENDERED_VERTICE_COUNTER,
-				&pipe_reg_read
+				&pipe_perf_reg_read
 			},
 			{
 				"VTX_BRANCH_INST_COUNTER",
 				VIVS_MC_PROFILE_CONFIG0_SH_VTX_BRANCH_INST_COUNTER,
-				&pipe_reg_read
+				&pipe_perf_reg_read
 			},
 			{
 				"VTX_TEXLD_INST_COUNTER",
 				VIVS_MC_PROFILE_CONFIG0_SH_VTX_TEXLD_INST_COUNTER,
-				&pipe_reg_read
+				&pipe_perf_reg_read
 			},
 			{
 				"PXL_BRANCH_INST_COUNTER",
 				VIVS_MC_PROFILE_CONFIG0_SH_PXL_BRANCH_INST_COUNTER,
-				&pipe_reg_read
+				&pipe_perf_reg_read
 			},
 			{
 				"PXL_TEXLD_INST_COUNTER",
 				VIVS_MC_PROFILE_CONFIG0_SH_PXL_TEXLD_INST_COUNTER,
-				&pipe_reg_read
+				&pipe_perf_reg_read
 			}
 		}
 	},
@@ -237,17 +237,17 @@ static const struct etnaviv_pm_domain doms_3d[] = {
 			{
 				"DEPTH_CLIPPED_COUNTER",
 				VIVS_MC_PROFILE_CONFIG1_PA_DEPTH_CLIPPED_COUNTER,
-				&pipe_reg_read
+				&pipe_perf_reg_read
 			},
 			{
 				"TRIVIAL_REJECTED_COUNTER",
 				VIVS_MC_PROFILE_CONFIG1_PA_TRIVIAL_REJECTED_COUNTER,
-				&pipe_reg_read
+				&pipe_perf_reg_read
 			},
 			{
 				"CULLED_COUNTER",
 				VIVS_MC_PROFILE_CONFIG1_PA_CULLED_COUNTER,
-				&pipe_reg_read
+				&pipe_perf_reg_read
 			}
 		}
 	},
@@ -400,7 +400,7 @@ static const struct etnaviv_pm_domain doms_2d[] = {
 			{
 				"PIXELS_RENDERED_2D",
 				VIVS_MC_PROFILE_CONFIG0_PE_PIXELS_RENDERED_2D,
-				&pipe_reg_read
+				&pipe_perf_reg_read
 			}
 		}
 	}
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
