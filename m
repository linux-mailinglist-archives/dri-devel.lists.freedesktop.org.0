Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72A821B672C
	for <lists+dri-devel@lfdr.de>; Fri, 24 Apr 2020 00:52:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 957C06EA54;
	Thu, 23 Apr 2020 22:52:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 880C66E9F0
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Apr 2020 21:10:34 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id h26so5898228qtu.8
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Apr 2020 14:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6fgzUf6QnEDfHIVtySZxqTUXmeQhARHBty1JtsylcjU=;
 b=zZ8HZ1o55FpeMGGyoBbzrJ6jsc46dJca7Y7OPJRR6q7LBX3Ddruoahhj+KrB3CoOEY
 zJ54PKGO7etEpI+2iMG8IImtDMcVBGu3V+g0DgARo6t1nKu99AolQfRCvggHNnN5ZORv
 c74L9fZYhz89QPicXr6GBW8bg2QETU6LHPT4Bux38DrgLu9rijv5p4npfCOFOh5rnjtQ
 G30b5buCERwZKDmJLR6yjassqlHcnEyteMkIMlJjJtjyUN2kiChCKPuGKO88T8kD3c+u
 WtJraenW5D55nRoputCxW1DNPT3BmBMdoEQrnyIakv2SOCAJLv6QiyTGYkkXKd3u7r5v
 JAxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6fgzUf6QnEDfHIVtySZxqTUXmeQhARHBty1JtsylcjU=;
 b=ByBuGDsg4j9Z5ns+g1+18V20sqAQ4Nfhvpz04JYI2JyhH2bNVW0uk4w0vrTufJ4bU+
 nJLTLr5MS1AEwI+0RRu6nRmnQAymVee/9Iyn9IxeXkL2K1jNBIkkn3X9bsS3IqHKS0SG
 hhtKznigx46qD6HPB/KIkK/Hvzwj3lOnOWWn6+5mKYumbDLPHa9A85clMIW0Nb+W4Zos
 f0PRm2VgChywjGS88tFl1CPEtIKAjyYiBREQxWPyJF3/UH/Tr8Cx/06HIe8Xw8vesgAE
 zFad7x5hs9Uqpj7kDbPHk7gy0UXRACWMjEjnXzQwm3fImu/qSYdR4cmWeZ8zDdm0awK+
 x9sw==
X-Gm-Message-State: AGi0PuYfM1kEtKxzzQh0WJW4/HVYX2wyBSxUeM1nfVjePOQNrmjly+8Q
 vXQU3LZuazN02nefeFa/KcMhgQ==
X-Google-Smtp-Source: APiQypJiwnh2DBra0mtACSdPDanbkps3648UFV+b28FZCOUOJKb8fwtUv495WOpqSapSrnO01vNLTQ==
X-Received: by 2002:ac8:46d1:: with SMTP id h17mr6208939qto.72.1587676233542; 
 Thu, 23 Apr 2020 14:10:33 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
 by smtp.gmail.com with ESMTPSA id n4sm2341495qkh.38.2020.04.23.14.10.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Apr 2020 14:10:33 -0700 (PDT)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org
Subject: [PATCH v3 4/9] drm/msm/a6xx: add A640/A650 to gpulist
Date: Thu, 23 Apr 2020 17:09:16 -0400
Message-Id: <20200423210946.28867-5-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200423210946.28867-1-jonathan@marek.ca>
References: <20200423210946.28867-1-jonathan@marek.ca>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 23 Apr 2020 22:50:35 +0000
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
Cc: Enrico Weigelt <info@metux.net>, Wambui Karuga <wambui.karugax@gmail.com>,
 Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, David Airlie <airlied@linux.ie>,
 Sharat Masetty <smasetty@codeaurora.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Alexios Zavras <alexios.zavras@intel.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 AngeloGioacchino Del Regno <kholk11@gmail.com>, Sean Paul <sean@poorly.run>,
 open list <linux-kernel@vger.kernel.org>, Brian Masney <masneyb@onstation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add Adreno 640 and 650 GPU info to the gpulist.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
Reviewed-by: Jordan Crouse <jcrouse@codeaurora.org>
---
 drivers/gpu/drm/msm/adreno/adreno_device.c | 24 ++++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.c    |  2 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h    | 10 +++++++++
 3 files changed, 35 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index cb3a6e597d76..1156f72532a4 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -189,6 +189,30 @@ static const struct adreno_info gpulist[] = {
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
 		.init = a6xx_gpu_init,
 		.zapfw = "a630_zap.mdt",
+	}, {
+		.rev = ADRENO_REV(6, 4, 0, ANY_ID),
+		.revn = 640,
+		.name = "A640",
+		.fw = {
+			[ADRENO_FW_SQE] = "a630_sqe.fw",
+			[ADRENO_FW_GMU] = "a640_gmu.bin",
+		},
+		.gmem = SZ_1M,
+		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
+		.init = a6xx_gpu_init,
+		.zapfw = "a640_zap.mdt",
+	}, {
+		.rev = ADRENO_REV(6, 5, 0, ANY_ID),
+		.revn = 650,
+		.name = "A650",
+		.fw = {
+			[ADRENO_FW_SQE] = "a650_sqe.fw",
+			[ADRENO_FW_GMU] = "a650_gmu.bin",
+		},
+		.gmem = SZ_1M + SZ_128K,
+		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
+		.init = a6xx_gpu_init,
+		.zapfw = "a650_zap.mdt",
 	},
 };
 
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 1d5c43c22269..a7647eaacc7a 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -197,7 +197,7 @@ int adreno_get_param(struct msm_gpu *gpu, uint32_t param, uint64_t *value)
 		*value = adreno_gpu->gmem;
 		return 0;
 	case MSM_PARAM_GMEM_BASE:
-		*value = 0x100000;
+		*value = !adreno_is_a650(adreno_gpu) ? 0x100000 : 0;
 		return 0;
 	case MSM_PARAM_CHIP_ID:
 		*value = adreno_gpu->rev.patchid |
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 9ff4e550e7bd..88ae1b2813ef 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -237,6 +237,16 @@ static inline int adreno_is_a630(struct adreno_gpu *gpu)
        return gpu->revn == 630;
 }
 
+static inline int adreno_is_a640(struct adreno_gpu *gpu)
+{
+       return gpu->revn == 640;
+}
+
+static inline int adreno_is_a650(struct adreno_gpu *gpu)
+{
+       return gpu->revn == 650;
+}
+
 int adreno_get_param(struct msm_gpu *gpu, uint32_t param, uint64_t *value);
 const struct firmware *adreno_request_fw(struct adreno_gpu *adreno_gpu,
 		const char *fwname);
-- 
2.26.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
