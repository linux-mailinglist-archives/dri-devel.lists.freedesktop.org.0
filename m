Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F18BD1B1F1A
	for <lists+dri-devel@lfdr.de>; Tue, 21 Apr 2020 08:49:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 312966E8BF;
	Tue, 21 Apr 2020 06:48:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf41.google.com (mail-qv1-xf41.google.com
 [IPv6:2607:f8b0:4864:20::f41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 505A86E58E
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Apr 2020 14:03:38 +0000 (UTC)
Received: by mail-qv1-xf41.google.com with SMTP id v10so610752qvr.2
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Apr 2020 07:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cJfMJ0JOsQMoUoObG+N7En7+tPmqx5/7YNi8g5sRW1M=;
 b=o98qigsHifTZi9QVUmXstCulmu2eeGSZgUxM+GXjXYCoKqxUEb3Oj2GhiISIpGeMD2
 GlQ6wDNLReVTfEKMbd7kJdLF/SMGky5oixcjAVM5h8YfJz0oqlvTulh4HTDwhOorieOk
 HXIXzBD9ZnIl3Uy2BzmdtL8i9AX/8oob+wPQGGaqrf35MbbCuVvsT7XYq2OXddSAeyhd
 CLEhpxgzWW5DMpcPT3XpOl5t07DAAn0ZqIkOQHItzfLI0ClOneh/PS9IluyDHRFYgNOe
 RG+j8jFNuUKeuig2f+8bSTmHHDzJADFVpA5T6FXBx0lU+3I2dMWJBaRFxK9CX9VFdSXw
 Sy9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cJfMJ0JOsQMoUoObG+N7En7+tPmqx5/7YNi8g5sRW1M=;
 b=COR7LWjaasdfT9y74bHhocuwC/G9ES/dFFfFyjj2J0UozUajuQee7vVUOPnK17bNwQ
 /y3zzs6QfkWYdxCCypNmP8ZfkvqnpWCX3AZZw+QCuaRERWWh/cPLdW0i/lhN9jJnjnMp
 xdGCs3OJdvE8w8FikRYFw7xGDvkmtmbOahxgo8NQoc7lVpnSd8dJFAUZDBCxKSnlgc1N
 FcME0V7lHPGLh0yf+V+BTMpFwLelR1s4Sq+PFJR7gWAyrcojzvFF7YhCEcZ4ooxogChz
 WdGqo8vZeqVXLR78GnVOlWH0OgfiJNiHFpOP/uYQ60IhOxnOroFuNrDAyUKdGxgJfhEM
 9kHw==
X-Gm-Message-State: AGi0PuZu74gMxmlvGvgP2RZPjjGutwQWohhmjU0JR/DVzB2LL5ZZcqDK
 dCUdtUGdlKGzMZNmc9MAaiD3EQ==
X-Google-Smtp-Source: APiQypLWHxFBPJUBteJVBC4MK+dBGuG33zqFEpvj6UGd6hXj1OGUpUNRQDna8XXGH/s6AP8VQpGR0g==
X-Received: by 2002:a0c:d652:: with SMTP id e18mr9646044qvj.58.1587391417418; 
 Mon, 20 Apr 2020 07:03:37 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
 by smtp.gmail.com with ESMTPSA id t75sm609424qke.127.2020.04.20.07.03.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Apr 2020 07:03:36 -0700 (PDT)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org
Subject: [PATCH 1/9] drm/msm/adreno: add A640/A650 to gpulist
Date: Mon, 20 Apr 2020 10:03:05 -0400
Message-Id: <20200420140313.7263-2-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200420140313.7263-1-jonathan@marek.ca>
References: <20200420140313.7263-1-jonathan@marek.ca>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 21 Apr 2020 06:48:39 +0000
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
Cc: Wambui Karuga <wambui.karugax@gmail.com>,
 Douglas Anderson <dianders@chromium.org>,
 open list <linux-kernel@vger.kernel.org>,
 Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 AngeloGioacchino Del Regno <kholk11@gmail.com>, Sean Paul <sean@poorly.run>,
 Allison Randal <allison@lohutok.net>, Brian Masney <masneyb@onstation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

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
