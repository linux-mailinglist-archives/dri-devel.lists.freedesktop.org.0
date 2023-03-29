Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 740E56CD672
	for <lists+dri-devel@lfdr.de>; Wed, 29 Mar 2023 11:30:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 260A510EA43;
	Wed, 29 Mar 2023 09:30:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4F1D10E52B;
 Wed, 29 Mar 2023 09:30:29 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id p34so8477868wms.3;
 Wed, 29 Mar 2023 02:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680082228;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1lEaDc8be8FkWi1HX0iSofPQaKiEa8pAZUfrsxxjcSw=;
 b=FCR79EhyW0vJpHBYVKlPW8vXWhRAihkRSI0u4tf7VDEIDF7RSF3B2bJXqAywT69v72
 meKdvUnF+HCW5+Bqf/2fqch6RTAdmaRS8grsaLPzlZ/RbhskfugKDh7RtxikBZmCQQGF
 Z6DaRvzRiaDxk3OSWzx/ArjH9MqFrNhMiiIeOiEgQ7XI7VmML6U5HqK6/F4ZPg43Q2fD
 gSMO+OWlcHYoGlBwUpXakZ/yUVg1C1SJWkSt0Txi+jHvcAEGMXsT2BJwybKYUAbqHlXN
 EAh+UxqQCU1/CzGu1fGjNRBu7r0QGULKp/iDtEtAAVkPqDmVe9tA9rNEeypYzinW8MJk
 Bi/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680082228;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1lEaDc8be8FkWi1HX0iSofPQaKiEa8pAZUfrsxxjcSw=;
 b=C2+/8raGvwsCQm2ndPspD0iMvHWEfhCAwu3o9UGX9gb9Dvjb2aJRpwzmxdt6v5y+Ek
 rGC9MHbYClVGjt9cwhO472TY02SesFxwuXiDv0fAGPqn7/+6fZhMkeM8TYuD6gjnHlFO
 Kp+v07TPh8g7/ZSNFMW33byXBprRPtv/rjIY3+xW+RKz4KeamgCqt7AAk8w7mIvLG1zK
 FhA7VYk8aitrXwHR1z2zosZjdEAqa06DcgLi3c1zuOvc2t/a1UqXVM91Yjo3bN9Cvkn/
 TBvD+ycUxU5JKvAtuadQrYBWGmb0oDiRvwkhAnDG8mA96KOjHYfdEEVIj/5ESMNEHWMP
 v2IA==
X-Gm-Message-State: AO0yUKVtPTCVvU7u0G+PTdiPYjhsaOEw8y4hUgY0QtZrM/csXMHRtc9W
 bb0gM/92HSdaIX6MLBM7q5Q=
X-Google-Smtp-Source: AK7set8icXlaIt2CvY3lleghHnnb5TGOj1bkw4TJVx7xOyJ8D/nA/R6NaqroGfmG6xJJgjVkcL3yJg==
X-Received: by 2002:a1c:4c0d:0:b0:3eb:2e32:72c3 with SMTP id
 z13-20020a1c4c0d000000b003eb2e3272c3mr15711230wmf.22.1680082227927; 
 Wed, 29 Mar 2023 02:30:27 -0700 (PDT)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net.
 [80.193.200.194]) by smtp.gmail.com with ESMTPSA id
 a13-20020a05600c224d00b003edef091b17sm1573356wmm.37.2023.03.29.02.30.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Mar 2023 02:30:27 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH][next] drm/msm/mdss: Fix spelling mistake "Unuspported" ->
 "Unsupported"
Date: Wed, 29 Mar 2023 10:30:26 +0100
Message-Id: <20230329093026.418847-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There is a spelling mistake in a dev_error message. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpu/drm/msm/msm_mdss.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index c15d1e2dc718..7cb301854e64 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -274,7 +274,7 @@ static int msm_mdss_enable(struct msm_mdss *msm_mdss)
 		msm_mdss_setup_ubwc_dec_40(msm_mdss);
 		break;
 	default:
-		dev_err(msm_mdss->dev, "Unuspported UBWC decoder version %x\n",
+		dev_err(msm_mdss->dev, "Unsupported UBWC decoder version %x\n",
 			msm_mdss->mdss_data->ubwc_dec_version);
 		dev_err(msm_mdss->dev, "HW_REV: 0x%x\n",
 			readl_relaxed(msm_mdss->mmio + HW_REV));
-- 
2.30.2

