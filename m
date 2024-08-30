Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A19896658F
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2024 17:33:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9061910E326;
	Fri, 30 Aug 2024 15:33:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="beXXF+kK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75A7310E326;
 Fri, 30 Aug 2024 15:33:20 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-5334adf7249so2673431e87.3; 
 Fri, 30 Aug 2024 08:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725031998; x=1725636798; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=OJMYlnyS1LZRaHdNncK1wWBqiV76KGsJGAYtBN7J5io=;
 b=beXXF+kKU5jf5XDlJWJyd2/mEfIOWkrIAKbQiJMLgUG5G+10Il5HerO9HJn1Q2SeQ4
 50NFL1gNWC53oKBQSlVCxYT4jrRDZOae5Y9/C9bMfFgLZpF5olYijjmEnkRXKpP+UXGZ
 OdXx7T/FUFGiEqATILgVCD1gIX1fPv16JC4IZTGEaLztsksP+ns+Prfq4mfrCfYoiCC5
 j5DueCmjh30FfafwjSOGIqgwyR634irI8aFN8ccSLv/bfLV1+mlVkfhT8IjK1qLie9vw
 lDaUauw4QinbeIilVr0rZyYngI1Ejwszo3I6j5E0G8Lmu/BX04xnPd31HYPqK2LjCWCa
 8OTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725031998; x=1725636798;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OJMYlnyS1LZRaHdNncK1wWBqiV76KGsJGAYtBN7J5io=;
 b=kc7I2HzL2SRmUXQb/YEX9rTIRjR9Y2JG9yZXON3AJJL9A602tRaVCy/kthlfqHcnmW
 44xykHPG80yvg8VkaBDVqOUlcLnoayGvalFW8cccfDtOG4H1TL5dJgUrJZbINNk1Iuti
 knnOYwL5owStk8kzoqetW0k1/Jw8SpP2tN0IpzzmWonVs4geeqLBszSe9Rg9MOYOyqmO
 Fb4te7LWO+fd0yQTs9wt++mtrsWMBDXJXrlu1rExAYcmLg+INMiAbxcbcyM1/IrX9YgU
 ZY4rEQHIW8oIgpHnK1EP2sNOGlZQCcvJ0IYpI5IQ+p4W+gPRSarkQIZM/SG/1kPEG8k5
 DqZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW+bG+EFyoHEljgQysMnWwyLSKUzt0ECv+z+O82HfOLJDycnhfaBs0M3yEDNuUNf3QiheCD2xWPvX48@lists.freedesktop.org,
 AJvYcCWrTG52tgp8X7C6kmBdltGRSSnHaqzZR+iCXB//EcFatCw5M0l8yld86y2mVCpGfQLZ35lrnWdbASg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzyGdUvifPg0KD9WPbMKI3hoTIgtedOZngpfHO/Na9v/2jaoOVM
 yttkscfEDSly0uq7m1+nBgzBRAKdr2unU/tlVGroi7Gxq6rVU3CR
X-Google-Smtp-Source: AGHT+IHVzKJjjau1YX5D/R6NXoVqmoPHNrdgnb5Vhew/1ITeQsHilR11Y6xO5cENXrrOHtQV72ZwWw==
X-Received: by 2002:a05:6512:acc:b0:52c:d819:517e with SMTP id
 2adb3069b0e04-53546b3f189mr1978180e87.30.1725031997872; 
 Fri, 30 Aug 2024 08:33:17 -0700 (PDT)
Received: from [192.168.1.14] (host-95-234-170-37.retail.telecomitalia.it.
 [95.234.170.37]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8988ff4233sm227157866b.25.2024.08.30.08.33.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Aug 2024 08:33:17 -0700 (PDT)
From: Antonino Maniscalco <antomani103@gmail.com>
Date: Fri, 30 Aug 2024 17:32:45 +0200
Subject: [PATCH v2 3/9] drm/msm: Add a `preempt_record_size` field
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240830-preemption-a750-t-v2-3-86aeead2cd80@gmail.com>
References: <20240830-preemption-a750-t-v2-0-86aeead2cd80@gmail.com>
In-Reply-To: <20240830-preemption-a750-t-v2-0-86aeead2cd80@gmail.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Antonino Maniscalco <antomani103@gmail.com>, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1725031992; l=2182;
 i=antomani103@gmail.com; s=20240815; h=from:subject:message-id;
 bh=xA2R7+V+qAfyd3M9fHuSXLIyku8IvZQlPct7Zfu1oEw=;
 b=NmZj50l6q+AKolTIQ2/tsKBba9mU/Fvfpwq9OAhRDPxjkjz1HgKdOVNVb2bJTb3kPlclLI+Db
 09kPMNPosk8AQ5nkWYpJj/jmcH65v/556+kD+4oWOmoVCYYPITldU9e
X-Developer-Key: i=antomani103@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=
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

Adds a field to `adreno_info` to store the GPU specific preempt record
size.

Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 4 ++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.h   | 1 +
 2 files changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 68ba9aed5506..316f23ca9167 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -1190,6 +1190,7 @@ static const struct adreno_info a7xx_gpus[] = {
 			.protect = &a730_protect,
 		},
 		.address_space_size = SZ_16G,
+		.preempt_record_size = 2860 * SZ_1K,
 	}, {
 		.chip_ids = ADRENO_CHIP_IDS(0x43050a01), /* "C510v2" */
 		.family = ADRENO_7XX_GEN2,
@@ -1209,6 +1210,7 @@ static const struct adreno_info a7xx_gpus[] = {
 			.gmu_chipid = 0x7020100,
 		},
 		.address_space_size = SZ_16G,
+		.preempt_record_size = 4192 * SZ_1K,
 	}, {
 		.chip_ids = ADRENO_CHIP_IDS(0x43050c01), /* "C512v2" */
 		.family = ADRENO_7XX_GEN2,
@@ -1227,6 +1229,7 @@ static const struct adreno_info a7xx_gpus[] = {
 			.gmu_chipid = 0x7050001,
 		},
 		.address_space_size = SZ_256G,
+		.preempt_record_size = 4192 * SZ_1K,
 	}, {
 		.chip_ids = ADRENO_CHIP_IDS(0x43051401), /* "C520v2" */
 		.family = ADRENO_7XX_GEN3,
@@ -1245,6 +1248,7 @@ static const struct adreno_info a7xx_gpus[] = {
 			.gmu_chipid = 0x7090100,
 		},
 		.address_space_size = SZ_16G,
+		.preempt_record_size = 3572 * SZ_1K,
 	}
 };
 DECLARE_ADRENO_GPULIST(a7xx);
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 1ab523a163a0..6b1888280a83 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -111,6 +111,7 @@ struct adreno_info {
 	 * {SHRT_MAX, 0} sentinal.
 	 */
 	struct adreno_speedbin *speedbins;
+	u64 preempt_record_size;
 };
 
 #define ADRENO_CHIP_IDS(tbl...) (uint32_t[]) { tbl, 0 }

-- 
2.46.0

