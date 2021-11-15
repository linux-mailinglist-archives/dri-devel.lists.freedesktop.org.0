Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 720594511AF
	for <lists+dri-devel@lfdr.de>; Mon, 15 Nov 2021 20:10:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2C7F6E1B6;
	Mon, 15 Nov 2021 19:10:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B84F6E196;
 Mon, 15 Nov 2021 19:10:08 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id b13so15331160plg.2;
 Mon, 15 Nov 2021 11:10:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wDPmToaijo7T8aT7P3r6ZMwp5FJI2KCyBAGlYq2w7rM=;
 b=GIj9RXpkj2vA7zWzxBfBHgX2mUUcT2tHWP7cd9ldly7w/kWE3EVuQTmR4sPppk8hvr
 ZA0yMGzW6BMQXiTqouLTjq3xDhBjBeUOeSh35Y9wWL3gNA762y6FFDg9u//0W0btd4oj
 P9jk347dxLqAsPPpt1LAuBg7wevVo0BcGLDcoTU6ZNrwUphgopDtLcdusTp1j8wUB2z0
 YYsbIinNv+fNrmtFfALxooXQTac7w+LFpzZs8j3wAq0jjODamZ6Qq/2G9aULQ6ol8NWY
 CnmvF5GfqljRTjPOstArmUL22CEq4o5HS5RT4YSCDCzQlWx6PZRVKsr1BHMHUjIZYTbp
 okyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wDPmToaijo7T8aT7P3r6ZMwp5FJI2KCyBAGlYq2w7rM=;
 b=lPXnS4syiWdJ7WA9EJcoMXrs+LaCVd0ntz0Kef9jvffFuQ8BEBwmQeZ25vdQIQIFMK
 RWz1a724ZN7glcAcidvmzWpdFu8Cfz96sALKldc2HgY/XMSlyYqRJSs/wf/V7J0lWlvI
 0ScwCF12vVTl6mWQSP/GOdBSR8uo4gyf2nRXqVCNsWwAcMVpNa+mKTabtM46OmtEP1no
 srTF1O4rk0cL9eTbUu7+VJ2VN5GSmxeeZEuRcr58Agt5/Gdt/QWJROnZZz1VwrJ9r6Zu
 0iEVaNlZjdUPHS4g8UDYUNfZw6QvwXvsLKFxOCdmS2bQ8JLodqN8BzXiVrLgY7ckSP/J
 q1yQ==
X-Gm-Message-State: AOAM532WESAU+9XSa0eHepm4BIDKqIE4ieTQliz05bJhaYOVYyPgoxgS
 b2cF6PIvkZjuBJ03GFQvLrwq4+35wZ8=
X-Google-Smtp-Source: ABdhPJxkm0vEo2QPlPHnBhYa9RjtVtcJzMkuQtas1V0GtkWxUBLy59cyWKkt8W1adHeYtcjmRyK4ww==
X-Received: by 2002:a17:90b:17cc:: with SMTP id
 me12mr52788431pjb.141.1637003407408; 
 Mon, 15 Nov 2021 11:10:07 -0800 (PST)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 i19sm15550492pfu.119.2021.11.15.11.10.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Nov 2021 11:10:06 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/msm/adreno: Name the shadow buffer
Date: Mon, 15 Nov 2021 11:15:10 -0800
Message-Id: <20211115191514.310472-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.33.1
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
Cc: Rob Clark <robdclark@chromium.org>,
 Douglas Anderson <dianders@chromium.org>, Jonathan Marek <jonathan@marek.ca>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Yangtao Li <tiny.windzz@gmail.com>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Sean Paul <sean@poorly.run>,
 Sharat Masetty <smasetty@codeaurora.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

This was the one GPU related kernel buffer which was not given a debug
name.  Let's fix that.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c | 2 ++
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index ec8e043c9d38..a95977e8ad98 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -925,6 +925,8 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
 
 			if (IS_ERR(a5xx_gpu->shadow))
 				return PTR_ERR(a5xx_gpu->shadow);
+
+			msm_gem_object_set_name(a5xx_gpu->shadow_bo, "shadow");
 		}
 
 		gpu_write64(gpu, REG_A5XX_CP_RB_RPTR_ADDR,
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index dcde5eff931d..c6e7e7ca0482 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1068,6 +1068,8 @@ static int hw_init(struct msm_gpu *gpu)
 
 			if (IS_ERR(a6xx_gpu->shadow))
 				return PTR_ERR(a6xx_gpu->shadow);
+
+			msm_gem_object_set_name(a6xx_gpu->shadow_bo, "shadow");
 		}
 
 		gpu_write64(gpu, REG_A6XX_CP_RB_RPTR_ADDR_LO,
-- 
2.33.1

