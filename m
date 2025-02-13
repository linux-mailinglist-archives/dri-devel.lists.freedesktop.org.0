Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E37FA34A70
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 17:45:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6811E10EB1F;
	Thu, 13 Feb 2025 16:45:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="gzuUXITn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F180D10EB1F;
 Thu, 13 Feb 2025 16:45:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 82E315C53FA;
 Thu, 13 Feb 2025 16:44:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2D3EC4CED1;
 Thu, 13 Feb 2025 16:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739465102;
 bh=wS6QvXcMhwE4DWtt5Jqf+sbLLz2q6PyWoErAL8pV51Q=;
 h=From:Date:Subject:To:Cc:From;
 b=gzuUXITncKYYEdOxAs/G1DWbhDBn8K0kJWkWUxKB9xPygLVOJmWldv/6l+4qGtv88
 xxdv/uYYU8jHOFmd2S4ZF3hdqJEDNaWBl2CSNN6njyQMDioocYHD/f8UMImSK53L3Q
 kQ7LLqy24xvUd//Y6E3pH4ue32SrznhBjdr3jc+WOQ8zzLOOKPtQkfsvSBh/01hJyt
 KB3fbuT4rggpc/tIbfcw4l6eJfR/hHqGqAsDs/geMXmD4K7m19xmSZkrltKyzgr7gF
 fqZluUt4Z00lRhc9a3oVryJeqdf7mFZVsxXaYwkMNSCTq/a/9VlJGwr8GIHjuYxL3r
 /rw7mhLmwn8bA==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Thu, 13 Feb 2025 17:44:43 +0100
Subject: [PATCH] drm/msm/a6xx: Only print the GMU firmware version once
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250213-topic-gmu_no_spam-v1-1-1e4afdd898b6@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAHohrmcC/x3MQQqAIBBA0avErBPKlKirREjoaLNIRSuC8O5Jy
 7f4/4WMiTDD3LyQ8KZMwVf0bQN637xDRqYaeMdlx/uBnSGSZu64lA8qx+1gwmqhhZxGKQ3ULia
 09PzPZS3lAxDyuWBjAAAA
X-Change-ID: 20250213-topic-gmu_no_spam-4fc4c459755d
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>, 
 Abel Vesa <abel.vesa@linaro.org>, Rob Clark <robdclark@chromium.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739465097; l=1615;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=rviqRqqnKwEysjKAw+EBRbtmuL1NqJ2+/UqeC8Tajzg=;
 b=UsgAMcHRTZSaBEBYLKKtu4FbqbYob0qDF9JDQfaySiUiCius4FDEb3ZnBpefhpdxw+YbegUIP
 XbZhoE2tGW+AxqEo35/fegDk7OUpXW+Dh9r7OHzFV4sTFLlsJidsF2L
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
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

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

We only fetch it once from userland, so let's also only notify the
user once and not on every runtime resume.

As you can notice by the tags chain, more than one user found this
annoying.

Reported-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Suggested-by: Abel Vesa <abel.vesa@linaro.org>
Suggested-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 65d38b25c0707a3c7fff08d110b4ac2b9d410473..699b0dd34b18f0ec811e975779ba95991d485098 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -813,10 +813,10 @@ static int a6xx_gmu_fw_load(struct a6xx_gmu *gmu)
 	}
 
 	ver = gmu_read(gmu, REG_A6XX_GMU_CORE_FW_VERSION);
-	DRM_INFO("Loaded GMU firmware v%u.%u.%u\n",
-		 FIELD_GET(A6XX_GMU_CORE_FW_VERSION_MAJOR__MASK, ver),
-		 FIELD_GET(A6XX_GMU_CORE_FW_VERSION_MINOR__MASK, ver),
-		 FIELD_GET(A6XX_GMU_CORE_FW_VERSION_STEP__MASK, ver));
+	DRM_INFO_ONCE("Loaded GMU firmware v%u.%u.%u\n",
+		      FIELD_GET(A6XX_GMU_CORE_FW_VERSION_MAJOR__MASK, ver),
+		      FIELD_GET(A6XX_GMU_CORE_FW_VERSION_MINOR__MASK, ver),
+		      FIELD_GET(A6XX_GMU_CORE_FW_VERSION_STEP__MASK, ver));
 
 	return 0;
 }

---
base-commit: df5d6180169ae06a2eac57e33b077ad6f6252440
change-id: 20250213-topic-gmu_no_spam-4fc4c459755d

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

