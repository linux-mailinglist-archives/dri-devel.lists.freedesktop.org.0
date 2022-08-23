Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DAE959EE26
	for <lists+dri-devel@lfdr.de>; Tue, 23 Aug 2022 23:23:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F34010FC13;
	Tue, 23 Aug 2022 21:23:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DCE510FC12
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Aug 2022 21:23:04 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id e19so13947398pju.1
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Aug 2022 14:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=tuz1493y5LHiNwEe6XwII/bIcU4nWijq2K6QDL5tITs=;
 b=PChKyPfKBGLrWsDb3RQw8hHWPW6P36wY6RVrVp3cyccjsLkcv15Yd3SHixUb2vTkbu
 eNhUbCACRrkfRDBpDRNYQUjwod7L/nG1Slt82LDV1lTM+TCPjxEGwI001CFCrdgz7puz
 BUXvO3pbe490/hfyoWviGBhaL5Qj0YdJM3gxM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=tuz1493y5LHiNwEe6XwII/bIcU4nWijq2K6QDL5tITs=;
 b=iQrw7mz1Ydvdsgiz3upGi9UX0oG960wC3Nuqkxo2mllUTraBlpdmbIkzO+TR83pQMd
 49U5OphLM0ihtlLSkKx1pxhoVONHTMkmN5nVeGF4ls+Bso7+5QztK5QDdxPMZbJvlS7H
 w2oAMlo8Dcvg7TMW3GVOHKNmB5Pdrp7A8ePn9gI993iMC50j+Qpp9Bmno5EFldI+pSh5
 //xRM3cAo+l6UTfwJpB3dYUZCFnsj36mmQOpocz/NsrnzkMDlHdVj6+WYUkdSnb8FUZJ
 p8jr1WwN8TbBM+OM4A1/9+QKvWkuzt5Zz/BRrjADT4XtI4QQhCyGD+x2ekNgYGiWXqvD
 5zpA==
X-Gm-Message-State: ACgBeo1foVf76huwPDJeAE6xJgtsvkNaUAA3Rw1eG+hDz2cNaEDcxE2s
 3PpiZgyLxlsEKboXcuMdMrbgZg==
X-Google-Smtp-Source: AA6agR61U3W1D49veW7t3wdUmwP8XfdySJz1qFxuH+VdrROwQk4UomkZ9pJJz3k8edQqVlH2jNY7fA==
X-Received: by 2002:a17:902:e552:b0:16d:d3c0:85fb with SMTP id
 n18-20020a170902e55200b0016dd3c085fbmr25427017plf.38.1661289783919; 
 Tue, 23 Aug 2022 14:23:03 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:653f:9151:f544:1470])
 by smtp.gmail.com with ESMTPSA id
 a1-20020aa795a1000000b005366696b735sm6544811pfk.77.2022.08.23.14.23.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Aug 2022 14:23:03 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>
Subject: [PATCH v2] drm/msm/dp: Silence inconsistent indent warning
Date: Tue, 23 Aug 2022 14:23:02 -0700
Message-Id: <20220823212302.1744145-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.37.1.595.g718a3a8f04-goog
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
Cc: kernel test robot <lkp@intel.com>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, patches@lists.linux.dev,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Build robots complain

 smatch warnings:
 drivers/gpu/drm/msm/dp/dp_link.c:969 dp_link_process_link_status_update() warn: inconsistent indenting

Fix it along with a trailing space from the same commit.

Cc: Kuogee Hsieh <quic_khsieh@quicinc.com>
Fixes: ea530388e64b ("drm/msm/dp: skip checking LINK_STATUS_UPDATED bit")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---

Changes from v1 (https://lore.kernel.org/r/20220823024356.783318-1-swboyd@chromium.org)
 * Roll in extra whitespace fix

 drivers/gpu/drm/msm/dp/dp_link.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_link.c b/drivers/gpu/drm/msm/dp/dp_link.c
index 36f0af02749f..36bb6191d2f0 100644
--- a/drivers/gpu/drm/msm/dp/dp_link.c
+++ b/drivers/gpu/drm/msm/dp/dp_link.c
@@ -786,7 +786,7 @@ static int dp_link_process_link_training_request(struct dp_link_private *link)
 			link->request.test_lane_count);
 
 	link->dp_link.link_params.num_lanes = link->request.test_lane_count;
-	link->dp_link.link_params.rate = 
+	link->dp_link.link_params.rate =
 		drm_dp_bw_code_to_link_rate(link->request.test_link_rate);
 
 	return 0;
@@ -965,8 +965,7 @@ static int dp_link_process_link_status_update(struct dp_link_private *link)
 	if (channel_eq_done && clock_recovery_done)
 		return -EINVAL;
 
-
-       return 0;
+	return 0;
 }
 
 /**

base-commit: 568035b01cfb107af8d2e4bd2fb9aea22cf5b868
-- 
https://chromeos.dev

