Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 27608422C02
	for <lists+dri-devel@lfdr.de>; Tue,  5 Oct 2021 17:12:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8FF56EC0C;
	Tue,  5 Oct 2021 15:12:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C8876EC0C;
 Tue,  5 Oct 2021 15:12:04 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id
 oa12-20020a17090b1bcc00b0019f715462a8so2750644pjb.3; 
 Tue, 05 Oct 2021 08:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SPs/YU00jcqG3AvmdBwQDSbULCjfF0c6tzOeWHqJ2/g=;
 b=a7cvXNPXbG0P/xuJG6LtxY1YUObRQJXMgbnBzT22veeOKSozfJUftZyqdKKm3F5M7E
 4DkpXJvhSVRZohvC1D60+nsRaahKrFrVIOgXffrWRgBU8VOn4hcKlVXpe469yIfdk/Ic
 3+/XbYzF3cWuafVfcY5blNhPdsdVS2tQIm5uV8CDXGs1XM5TI6u//gzRH0bjxV149beB
 ie44vCp1yufq3j+lQn1RJkpwobJlf6lOzt7Fu1weJURfG+uZJ9NfJM5imEzgYddTgfNZ
 pbL5MjJUvaNjoJesRU82Hglg6MbRrYXNZi7/VKDtUXyIhF3eWc7m6rvTO/UInEk5hNgh
 xjug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SPs/YU00jcqG3AvmdBwQDSbULCjfF0c6tzOeWHqJ2/g=;
 b=Ie1rK+M7y02riLW9UgT4j8wapKh6lT93O6HgkUOL0pyOIRvAuQScgJ1vOJ9NYrMuBy
 4YXonX3gZEk23cA5JNgjYJ1juM1FPno/GYgbI/pbHxESJWo0h0QzyJgsJurDZxYHTAB8
 Y6ZzrPzY7yppvnju/+Vd/5+aRpNoRXRWPO3tj38KJOsjore3A7BTGmJViD+DJ1eV9RPn
 sHRXG6vn5Ayq3UoJ290mQu6oiGrHrLoPtoVNINIwpsiTvnJpDH1eWvma7p2SNlNagjv+
 Gmlhlei36nPD1IWlw8K8L/4JzvxpGr3J4YodelZiTlU7wzBHEKgmQOIa9kfTXth613cF
 rVXw==
X-Gm-Message-State: AOAM531bFyhqLNKeCXnhNeeANfFcaeVtawJpHrGRkSCBGvNq0U29S7T3
 R9bIlfAIIFdeJaxmyAwap9iTThEgedQ=
X-Google-Smtp-Source: ABdhPJyYPe3GWtsu0pADrVqdldHqgcDqJKKvF9EPgdV7/1w4n7Do4WsXaIRLQvFBUp6e7vSTJdjGNQ==
X-Received: by 2002:a17:90a:718c:: with SMTP id
 i12mr4498701pjk.182.1633446723043; 
 Tue, 05 Oct 2021 08:12:03 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 e1sm18677200pgi.43.2021.10.05.08.12.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 08:12:01 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-kernel@lists.infradead.org, freedreno@lists.freedesktop.org,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Robin Murphy <robin.murphy@arm.com>, Will Deacon <will@kernel.org>,
 Rob Clark <robdclark@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Akhil P Oommen <akhilpo@codeaurora.org>,
 Jonathan Marek <jonathan@marek.ca>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 Douglas Anderson <dianders@chromium.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Yangtao Li <tiny.windzz@gmail.com>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 2/3] drm/msm: Show all smmu info for iova fault devcore
 dumps
Date: Tue,  5 Oct 2021 08:16:26 -0700
Message-Id: <20211005151633.1738878-3-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211005151633.1738878-1-robdclark@gmail.com>
References: <20211005151633.1738878-1-robdclark@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   |  2 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 25 +++++++++++++++++--------
 drivers/gpu/drm/msm/msm_gpu.h           |  2 +-
 3 files changed, 19 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 34fede935ac0..96e0ca986c54 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1282,7 +1282,7 @@ static int a6xx_fault_handler(void *arg, unsigned long iova, int flags, void *da
 		/* Turn off the hangcheck timer to keep it from bothering us */
 		del_timer(&gpu->hangcheck_timer);
 
-		gpu->fault_info.ttbr0 = info->ttbr0;
+		gpu->fault_info.smmu_info = *info;
 		gpu->fault_info.iova  = iova;
 		gpu->fault_info.flags = flags;
 		gpu->fault_info.type  = type;
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 748665232d29..42e522a60623 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -685,19 +685,28 @@ void adreno_show(struct msm_gpu *gpu, struct msm_gpu_state *state,
 			adreno_gpu->rev.major, adreno_gpu->rev.minor,
 			adreno_gpu->rev.patchid);
 	/*
-	 * If this is state collected due to iova fault, so fault related info
+	 * If this is state collected due to iova fault, show fault related
+	 * info
 	 *
-	 * TTBR0 would not be zero, so this is a good way to distinguish
+	 * TTBR0 would not be zero in this case, so this is a good way to
+	 * distinguish
 	 */
-	if (state->fault_info.ttbr0) {
+	if (state->fault_info.smmu_info.ttbr0) {
 		const struct msm_gpu_fault_info *info = &state->fault_info;
+		const struct adreno_smmu_fault_info *smmu_info = &info->smmu_info;
 
 		drm_puts(p, "fault-info:\n");
-		drm_printf(p, "  - ttbr0=%.16llx\n", info->ttbr0);
-		drm_printf(p, "  - iova=%.16lx\n", info->iova);
-		drm_printf(p, "  - dir=%s\n", info->flags & IOMMU_FAULT_WRITE ? "WRITE" : "READ");
-		drm_printf(p, "  - type=%s\n", info->type);
-		drm_printf(p, "  - source=%s\n", info->block);
+		drm_printf(p, "  - far: %.16llx\n", smmu_info->far);
+		drm_printf(p, "  - ttbr0: %.16llx\n", smmu_info->ttbr0);
+		drm_printf(p, "  - contextidr: %.8x\n", smmu_info->contextidr);
+		drm_printf(p, "  - fsr: %.8x\n", smmu_info->fsr);
+		drm_printf(p, "  - fsynr0: %.8x\n", smmu_info->fsynr0);
+		drm_printf(p, "  - fsynr1: %.8x\n", smmu_info->fsynr1);
+		drm_printf(p, "  - cbfrsynra: %.8x\n", smmu_info->cbfrsynra);
+		drm_printf(p, "  - iova: %.16lx\n", info->iova);
+		drm_printf(p, "  - dir: %s\n", info->flags & IOMMU_FAULT_WRITE ? "WRITE" : "READ");
+		drm_printf(p, "  - type: %s\n", info->type);
+		drm_printf(p, "  - source: %s\n", info->block);
 	}
 
 	drm_printf(p, "rbbm-status: 0x%08x\n", state->rbbm_status);
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 9801a965816c..0e132795123f 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -73,7 +73,7 @@ struct msm_gpu_funcs {
 
 /* Additional state for iommu faults: */
 struct msm_gpu_fault_info {
-	u64 ttbr0;
+	struct adreno_smmu_fault_info smmu_info;
 	unsigned long iova;
 	int flags;
 	const char *type;
-- 
2.31.1

