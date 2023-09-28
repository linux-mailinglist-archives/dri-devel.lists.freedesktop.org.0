Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F717B1A62
	for <lists+dri-devel@lfdr.de>; Thu, 28 Sep 2023 13:17:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E06410E619;
	Thu, 28 Sep 2023 11:16:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A0A110E613
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Sep 2023 11:16:41 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-5042bfb4fe9so20122952e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Sep 2023 04:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695899799; x=1696504599; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HlnLygFYYtSxoKEaC5DFXDBhNuXumh16hVtzEXEvSec=;
 b=ZmjcVzIdVYrtgNFmnQ3GLGOE7nCsJdQep6p0vUbn0hDLa6DDA0LcvR/r3OsQ0Nqq4h
 OgTbzuiY25fNsE71NGCfv2UdZEvZ+2/RrDJQhj2e+MaI9OQBjwXQMxGixfdRpNoegSM1
 0S7WFxerBLOjnLOmI1pep1D0HmzimI4FTl2gZuaCMk23p4lRs1NJelQN4fIsqL4vlHo2
 o6v/MZgXeRqeEYkNan8OqHH8bB++sCQUNqOUbJuXKg3vCRczsVT7sgLApi1xDABPlAdl
 1qhiW6R0x7G2XjDrZJMxwCYBFYmV58DGpOZHn4+AikJvWWh9KUixPn1KcJSzFMqxh7ub
 ojSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695899799; x=1696504599;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HlnLygFYYtSxoKEaC5DFXDBhNuXumh16hVtzEXEvSec=;
 b=DBwtXzhac5cPV76r6LVW+H45EzP1DIl4717EuHt5o5CcJtsG8NNuRfpWi5zVfOQRd7
 guzefiILGDVnVqG8iRptQwck3HYGgDvq0flnnsGjQMsg+0PSYp9RaSE/rKDw1OeFpV/p
 Rd4hiHsMklzfheltldl89ik9HYp8V5e8CNLSUgT1PA52RXpDvbjwBzDYJOA/hC81r8lF
 1NqOmC0o/V5d4qeKhYNxfJk1DaYPKCgGvsLg9adBCLRYWi4IQWrE0myOIt3lwbi7Q2KA
 Y2RzK7INvewi8mW4zUcSs7Yd5T/+lM0XkKBej5qFLApMSL9bsceKJ98rIP6dl7PjPVT3
 2CdQ==
X-Gm-Message-State: AOJu0YwLSwGHlmPu6zWdCeS+OwQKp16gsw23XCuIrG8KuW0zIDxi6Hr8
 HOWWAKOrpfoImbrsioCBVg65bA==
X-Google-Smtp-Source: AGHT+IHs4BEIb3K6wYvwHxL4p5CqDe1+YQl/dXfmh3TBE8urT/HY3ABoF5hl90DcpvKbMm8Y9pmZ2Q==
X-Received: by 2002:a19:790c:0:b0:500:8fcd:c3b5 with SMTP id
 u12-20020a19790c000000b005008fcdc3b5mr772169lfc.12.1695899799367; 
 Thu, 28 Sep 2023 04:16:39 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 j18-20020ac253b2000000b004fb738796casm3086623lfh.40.2023.09.28.04.16.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Sep 2023 04:16:38 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>
Subject: [PATCH v3 10/15] drm/msm/hdmi: correct indentation of HDMI bridge
 functions
Date: Thu, 28 Sep 2023 14:16:24 +0300
Message-Id: <20230928111630.1217419-11-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230928111630.1217419-1-dmitry.baryshkov@linaro.org>
References: <20230928111630.1217419-1-dmitry.baryshkov@linaro.org>
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
 Stephen Boyd <swboyd@chromium.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 linux-phy@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index 62ce1455f974..fbcf4dd91cd9 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -291,12 +291,12 @@ static enum drm_mode_status msm_hdmi_bridge_mode_valid(struct drm_bridge *bridge
 }
 
 static const struct drm_bridge_funcs msm_hdmi_bridge_funcs = {
-		.pre_enable = msm_hdmi_bridge_pre_enable,
-		.post_disable = msm_hdmi_bridge_post_disable,
-		.mode_set = msm_hdmi_bridge_mode_set,
-		.mode_valid = msm_hdmi_bridge_mode_valid,
-		.get_edid = msm_hdmi_bridge_get_edid,
-		.detect = msm_hdmi_bridge_detect,
+	.pre_enable = msm_hdmi_bridge_pre_enable,
+	.post_disable = msm_hdmi_bridge_post_disable,
+	.mode_set = msm_hdmi_bridge_mode_set,
+	.mode_valid = msm_hdmi_bridge_mode_valid,
+	.get_edid = msm_hdmi_bridge_get_edid,
+	.detect = msm_hdmi_bridge_detect,
 };
 
 static void
-- 
2.39.2

