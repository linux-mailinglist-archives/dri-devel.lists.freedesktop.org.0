Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8258939FDA2
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jun 2021 19:30:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 467626E55E;
	Tue,  8 Jun 2021 17:30:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf30.google.com (mail-qv1-xf30.google.com
 [IPv6:2607:f8b0:4864:20::f30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE9CA6E558
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Jun 2021 17:30:01 +0000 (UTC)
Received: by mail-qv1-xf30.google.com with SMTP id im10so10362561qvb.3
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Jun 2021 10:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cw/T67Raxlwp2J/xqRY1bIakrTpt8tOc7nmYdzBT6xs=;
 b=1T31TM63QiG2dKOFLdxurQr/m4Jmu5IwlHOD35wSveX6hm7+yCwgqyYw4UCKmYnBra
 XsSY4CZA+kc/UHkyzOTr4jFaB1xQRBcUJFpppcq85vuGfL8yN42svxL6IvzlEO0DYMC9
 qudTb9KNNaXpopN/T/MiY7NCPyZC1M/5+jR2RWEqHoKfT+H3+L/jsjTbIo69Ic194UPm
 motbyKq9g//QQaFnXILWb6bl8i9EJukaHvgaGkdWK5bs3/OrGnsRkqOiLJALl/7A7iNE
 hIReNAt5rWTFND601Yn8TT2tEHWuM56boRjYz/SFlXwCzFWK9E+Qpn9meiyYgs0n9QOx
 nYcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cw/T67Raxlwp2J/xqRY1bIakrTpt8tOc7nmYdzBT6xs=;
 b=TNAWKsrbfxuktt5QUU+hYHhdrtyDH5FrRrWUyBD1qjoF7fbFlb1aAgw6UGNmEY3UcR
 a9QgC+iC6EmLuIr6j7/GtF8XfZNrxLQrMmq71fo3MPlPmx0pBgy0653Xn01WEasy7N/i
 /ciUkF8ayFCmaJ94i9byrRsHzAh+nlqXUk/AHxgSyKOuL+kCT96Ze8fsAPThoSEE3yoX
 E8IzHWO5b2rFoYvGdt52LscDk2zPKNs8u4biYl2eYmBTPF5Yzrm3sKcxArAP9r50hpqR
 gUeLnDlEZq3BE9HPZipUPe+67MW3uuJYXQ8hLxX6w4XC36jhzBkpuSCUdt7DcKOJcIx7
 VoYw==
X-Gm-Message-State: AOAM531+EZyaPNRbHIL3hEz11R7OYu0+4QcyGWmqlFxiv5ti6jPoA6uX
 GBV4Be9SRFnEtkWr30KWcf1X6j+T/Hw81FkhNRmdng==
X-Google-Smtp-Source: ABdhPJy3w3HKrVCLTroG4bo1kOv1Rypz99JMObgdkPPBnC36pyGLQe2FP3KEN4BIeSxcP+h24xA/HA==
X-Received: by 2002:a0c:f650:: with SMTP id s16mr1269451qvm.0.1623173400924;
 Tue, 08 Jun 2021 10:30:00 -0700 (PDT)
Received: from localhost.localdomain
 (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
 by smtp.gmail.com with ESMTPSA id d10sm9482983qke.47.2021.06.08.10.29.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 10:30:00 -0700 (PDT)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org
Subject: [PATCH v3 1/5] drm/msm: remove unused icc_path/ocmem_icc_path
Date: Tue,  8 Jun 2021 13:27:44 -0400
Message-Id: <20210608172808.11803-2-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20210608172808.11803-1-jonathan@marek.ca>
References: <20210608172808.11803-1-jonathan@marek.ca>
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
Cc: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Dave Airlie <airlied@redhat.com>,
 Sean Paul <sean@poorly.run>, open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

These aren't used by anything anymore.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
Reviewed-by: Akhil P Oommen <akhilpo@codeaurora.org>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 3 ---
 drivers/gpu/drm/msm/msm_gpu.h           | 9 ---------
 2 files changed, 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 8fd0777f2dc9..009f4c560f16 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -946,7 +946,4 @@ void adreno_gpu_cleanup(struct adreno_gpu *adreno_gpu)
 	pm_runtime_disable(&priv->gpu_pdev->dev);
 
 	msm_gpu_cleanup(&adreno_gpu->base);
-
-	icc_put(gpu->icc_path);
-	icc_put(gpu->ocmem_icc_path);
 }
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 18baf935e143..c302ab7ffb06 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -118,15 +118,6 @@ struct msm_gpu {
 	struct clk *ebi1_clk, *core_clk, *rbbmtimer_clk;
 	uint32_t fast_rate;
 
-	/* The gfx-mem interconnect path that's used by all GPU types. */
-	struct icc_path *icc_path;
-
-	/*
-	 * Second interconnect path for some A3xx and all A4xx GPUs to the
-	 * On Chip MEMory (OCMEM).
-	 */
-	struct icc_path *ocmem_icc_path;
-
 	/* Hang and Inactivity Detection:
 	 */
 #define DRM_MSM_INACTIVE_PERIOD   66 /* in ms (roughly four frames) */
-- 
2.26.1

