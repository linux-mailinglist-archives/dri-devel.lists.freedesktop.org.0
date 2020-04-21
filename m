Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4D231B3850
	for <lists+dri-devel@lfdr.de>; Wed, 22 Apr 2020 08:56:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66E2B6E9DB;
	Wed, 22 Apr 2020 06:55:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf43.google.com (mail-qv1-xf43.google.com
 [IPv6:2607:f8b0:4864:20::f43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C7F489ECD
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Apr 2020 23:41:59 +0000 (UTC)
Received: by mail-qv1-xf43.google.com with SMTP id v10so72887qvr.2
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Apr 2020 16:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=N0qMqsfd+U3x3umnEz9gWFlapgYEaMzaOatX0iyiLjQ=;
 b=wETBWMhkVgcg7KhuDYVbS6eKVSqzlLKWyzKrwZYUEZCLbbu2wBW2N00Q3PL/OBKkEg
 dWl3Loy9lmMuuQ5f698BeKX7bg83kW1oL2Ypr9VZr1Qpui5xlYYehRapCUUikrdiHMOS
 6y33rXG5AIgD/sTqxIFJUiI2iCRPWcDNvA9KCHJkMNRQ4s10j6tTG6j+60oZQfhnT00z
 7GfAmX8ZyQwp21+0ulK7V8MGrhYulJrEgSfKk2ca9y1su+uuixcwvfDUP61vvl16qj7k
 WQbBh4l0tdo1b59rbE1xhmrL93Pvq5NZvLYfTw0lsKDGdr7p9v/3auw1k7Y14orua+fl
 Si0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=N0qMqsfd+U3x3umnEz9gWFlapgYEaMzaOatX0iyiLjQ=;
 b=ab19cmdmjFu56CJ8NKv7a+NMQzkAx9iGqKsaXeTnQaxa0+ZUhPZWRIjFS6vIsKRfLF
 rVGM7V7WGLPmoVKKuhMlTeJZHk4KKza5f/5VuaGmGKD3neIohym9/w65W7bnWFeX2Zni
 /fcb0foFM+2KH+FjUgvS8/vS1qDk4MCGuZx2uVxmGSYZZEyqT/8beCzZR4Pzy8Fof0oq
 Nzp6Z2PksaxFXDvHdP9rmCDZAN55x2GZYFdv6FiJlkEeXlxRPkxqtu+aE3bVGmave4Hg
 xYFoE1DmkZhtCAF8Fey+mzOXFNz669XMoYohk3bHTaC19jLLkEolKL3OStkAkr+xZ6eP
 NLvw==
X-Gm-Message-State: AGi0PuZdCFa98ND7bkE0u76nDVjniNopSQ8Cshgz6Fx2nvORVAkqFfBj
 W8YGTkCB36TEDZgP1UBDU5UonA==
X-Google-Smtp-Source: APiQypL9mjkJqNq2tL4wer0SLTVGnD143TuAN14x4v4HG6zDlC2l/NTO9IMH2VaLb5ewxsG6AquYJQ==
X-Received: by 2002:a05:6214:1702:: with SMTP id
 db2mr22865710qvb.201.1587512518329; 
 Tue, 21 Apr 2020 16:41:58 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
 by smtp.gmail.com with ESMTPSA id y17sm2664010qky.33.2020.04.21.16.41.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Apr 2020 16:41:57 -0700 (PDT)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org
Subject: [PATCH v2 4/9] drm/msm/a6xx: add A640/A650 to gpulist
Date: Tue, 21 Apr 2020 19:41:22 -0400
Message-Id: <20200421234127.27965-5-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200421234127.27965-1-jonathan@marek.ca>
References: <20200421234127.27965-1-jonathan@marek.ca>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 22 Apr 2020 06:54:41 +0000
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
Cc: "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Enrico Weigelt <info@metux.net>, Douglas Anderson <dianders@chromium.org>,
 Wambui Karuga <wambui.karugax@gmail.com>,
 Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, David Airlie <airlied@linux.ie>,
 Sharat Masetty <smasetty@codeaurora.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 AngeloGioacchino Del Regno <kholk11@gmail.com>, Sean Paul <sean@poorly.run>,
 Allison Randal <allison@lohutok.net>, Brian Masney <masneyb@onstation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add Adreno 640 and 650 GPU info to the gpulist.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
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
