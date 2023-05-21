Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D36770AF27
	for <lists+dri-devel@lfdr.de>; Sun, 21 May 2023 19:10:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D63010E1E8;
	Sun, 21 May 2023 17:10:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA01B10E1E2
 for <dri-devel@lists.freedesktop.org>; Sun, 21 May 2023 17:10:32 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-4f3b9c88af8so1179898e87.2
 for <dri-devel@lists.freedesktop.org>; Sun, 21 May 2023 10:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684689031; x=1687281031;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mAIsFbOG0cWfqLFKEW28r27UV7QviA8Nux8MIb+QAb4=;
 b=xf8rbrv/gLJG33QMg02v3u3cFH+ZzzW30wjLc+i4sOhJSfw5gCfXPXBPYrU58t/JVI
 hsy6pgNEoa7tElz9QMir2neZe1wSZdKdRucW5aTsMVSz7yU742VBRyI5jjFL2mpIUfxz
 cE08NJ0JqicTKUOyq7UMsuf7uMTeITEaJVn5Ha1OHwd/A6cQD8dJbfpILrnZJFrJEv2q
 w/keiw4b8TI3GypTaq6wsY2GCIZS8T3v0540SzE7v647VW2gPw3uL7YMB8IYWvycyx6t
 rsmlYhcm81wzTQfPbyHkwdarnvW2J9M3zWYMSq2Ll6ffmyEWt9GE2uUXIHBxDnTVow+/
 /y1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684689031; x=1687281031;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mAIsFbOG0cWfqLFKEW28r27UV7QviA8Nux8MIb+QAb4=;
 b=g56jlzGWf9RAA9BIQQVTVltQ7o00AZA0eB62JW2QVFqlTWibrin7ee/xSCqO49atHe
 VVGPjUFlM2HGVD9ccBqZPVarc7vRTQqDrQZ4C6Ihm+9WwjHT3nJOIAL6pY7E/NHoOwZF
 XPHz5TwCMLutCjfvOjhP/z18XF2Q3Nd+NMFOwQQFlSzI8jDWDJ0mcBKisoXoFcd4weLM
 37IoAVEIeMtJKPreDYhvFHqv7apaFMqVlzw2x7XFYmS0QT9XjdD1HRwCBiiVC90SFVnw
 YzJRyDOO7AzSfjnw0pLrj8GIjnA61W0JVr2EId40RzUnXqXk5sQqNaS7p1hN1F3T8XIM
 6eKg==
X-Gm-Message-State: AC+VfDzosisdz4JQLkdLvBJJYzpIhow8P3AcDWdDoDzUeQXIzgDMn/Z0
 5KKrrrgNL/cq8ht6mry58m4n2w==
X-Google-Smtp-Source: ACHHUZ5VjMhUPjs6qeL+58pIgAAVNpavj0upmBx+2nawTbad1Sy8jW5RuhmiCbEW/M30+MDcGAU1uA==
X-Received: by 2002:a19:f60e:0:b0:4f3:baf9:8f93 with SMTP id
 x14-20020a19f60e000000b004f3baf98f93mr1031381lfe.3.1684689030888; 
 Sun, 21 May 2023 10:10:30 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 k19-20020ac24573000000b004f00189e1dasm680493lfm.143.2023.05.21.10.10.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 May 2023 10:10:30 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH 3/6] drm/msm/mdss: export UBWC data
Date: Sun, 21 May 2023 20:10:23 +0300
Message-Id: <20230521171026.4159495-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230521171026.4159495-1-dmitry.baryshkov@linaro.org>
References: <20230521171026.4159495-1-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>,
 Marijn Suijten <marijn.suijten@somainline.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DPU programming requires knowledge of some of UBWC parameters. This
results in duplication of UBWC data between MDSS and DPU drivers. Export
the required data from MDSS driver.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_mdss.c | 30 +++++++++++++-----------------
 drivers/gpu/drm/msm/msm_mdss.h | 27 +++++++++++++++++++++++++++
 2 files changed, 40 insertions(+), 17 deletions(-)
 create mode 100644 drivers/gpu/drm/msm/msm_mdss.h

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index d1e57099b517..ed836c659688 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -13,7 +13,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/reset.h>
 
-#include "msm_drv.h"
+#include "msm_mdss.h"
 #include "msm_kms.h"
 
 #define HW_REV				0x0
@@ -26,16 +26,6 @@
 
 #define MIN_IB_BW	400000000UL /* Min ib vote 400MB */
 
-struct msm_mdss_data {
-	u32 ubwc_enc_version;
-	/* can be read from register 0x58 */
-	u32 ubwc_dec_version;
-	u32 ubwc_swizzle;
-	u32 ubwc_static;
-	u32 highest_bank_bit;
-	u32 macrotile_mode;
-};
-
 struct msm_mdss {
 	struct device *dev;
 
@@ -185,12 +175,6 @@ static int _msm_mdss_irq_domain_add(struct msm_mdss *msm_mdss)
 	return 0;
 }
 
-#define UBWC_1_0 0x10000000
-#define UBWC_2_0 0x20000000
-#define UBWC_3_0 0x30000000
-#define UBWC_4_0 0x40000000
-#define UBWC_4_3 0x40030000
-
 static void msm_mdss_setup_ubwc_dec_20(struct msm_mdss *msm_mdss)
 {
 	const struct msm_mdss_data *data = msm_mdss->mdss_data;
@@ -236,6 +220,18 @@ static void msm_mdss_setup_ubwc_dec_40(struct msm_mdss *msm_mdss)
 	}
 }
 
+const struct msm_mdss_data *msm_mdss_get_mdss_data(struct device *dev)
+{
+	struct msm_mdss *mdss;
+
+	if (!dev)
+		return ERR_PTR(-EINVAL);
+
+	mdss = dev_get_drvdata(dev);
+
+	return mdss->mdss_data;
+}
+
 static int msm_mdss_enable(struct msm_mdss *msm_mdss)
 {
 	int ret;
diff --git a/drivers/gpu/drm/msm/msm_mdss.h b/drivers/gpu/drm/msm/msm_mdss.h
new file mode 100644
index 000000000000..02bbab42adbc
--- /dev/null
+++ b/drivers/gpu/drm/msm/msm_mdss.h
@@ -0,0 +1,27 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2018, The Linux Foundation
+ */
+
+#ifndef __MSM_MDSS_H__
+#define __MSM_MDSS_H__
+
+struct msm_mdss_data {
+	u32 ubwc_enc_version;
+	/* can be read from register 0x58 */
+	u32 ubwc_dec_version;
+	u32 ubwc_swizzle;
+	u32 ubwc_static;
+	u32 highest_bank_bit;
+	u32 macrotile_mode;
+};
+
+#define UBWC_1_0 0x10000000
+#define UBWC_2_0 0x20000000
+#define UBWC_3_0 0x30000000
+#define UBWC_4_0 0x40000000
+#define UBWC_4_3 0x40030000
+
+const struct msm_mdss_data *msm_mdss_get_mdss_data(struct device *dev);
+
+#endif /* __MSM_MDSS_H__ */
-- 
2.39.2

