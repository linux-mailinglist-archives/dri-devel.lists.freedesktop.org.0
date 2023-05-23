Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 30A1770DC2F
	for <lists+dri-devel@lfdr.de>; Tue, 23 May 2023 14:15:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69AF510E44D;
	Tue, 23 May 2023 12:15:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AA3D10E433
 for <dri-devel@lists.freedesktop.org>; Tue, 23 May 2023 12:15:07 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-4f4bdcde899so748647e87.0
 for <dri-devel@lists.freedesktop.org>; Tue, 23 May 2023 05:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684844105; x=1687436105;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HlnLygFYYtSxoKEaC5DFXDBhNuXumh16hVtzEXEvSec=;
 b=SL/WVHABS704+8O+JkeKaXTNIjTPa6bMNxe4CV7AGXBoUs/Jdt4ceFX7jQwNDAyN1+
 BJOdBVhocMwX+gbdjC8AlbYXA9mlNGWCdJM+iikUuY1fcz4I/dmwnnMiBgAXlV1S7tXL
 jfviyHrP2KDMfy76e8Lg1peoMrw1hq/5Ocuk0nQ3vXbGRwtzQf8YiTGt0icIpgU0fNWQ
 iRUecbmN3nbJywrZahJkGoXLhrzzXS8TR5ngxOFwOZcBG1P36g9r3irNgFshMUr9qw7x
 xL47QOII4bg1JQ5vU0zlR9msEyIZfYCj9nDGwfhp4y1OYpJtNIXrATNNec4qpF2HkvxP
 JrJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684844105; x=1687436105;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HlnLygFYYtSxoKEaC5DFXDBhNuXumh16hVtzEXEvSec=;
 b=c5qQPGMMdbQdK4sAcH9GDZqDPPQBECddX8bJDj2wrz88GCxQAjRG9rYXWt1S9JMd1J
 7Kv8LqouMN8VN3M2la2jY62z/RyFGTBIUzkMz/xNaBzx+UrHwpL0mDHoRsRoq4h6oJFg
 nWAFm/YXCQ5RLPQVh4+FzhTXBzeeG6Usxv0EeWtv5Rfqg3WMPI7Bd9w7Plyj3oyovvLe
 Tw6o6b+iUSrYPh5+cCfsaxLAHP9Vp+l35+PkKnMNc8C6QVs/1S2rHuUJ2OJRrC76lz4I
 KF12sN8VdSdEvJwE9+TW05zamAsxkwVh0LOW16Uhz68QAKGuSLLBxJ7rPo+7d8RC9Eb7
 Mnlw==
X-Gm-Message-State: AC+VfDwo6FzG5ZNNPubeMdfD6tVlXFQxEq/p7JbiqsXAC/LVvJz+KfTI
 0AGVoo4p4lFuoft0Kf1nwKSwSw==
X-Google-Smtp-Source: ACHHUZ7RIvGjdINojHjJ65ERgUVxZ9JLqK/cT+DIqTF6C4Xu/7dDxF+Uml9xZ924hzI/Ju9SUi5sYw==
X-Received: by 2002:a19:5213:0:b0:4f3:a0f5:92e5 with SMTP id
 m19-20020a195213000000b004f3a0f592e5mr3853326lfb.31.1684844105762; 
 Tue, 23 May 2023 05:15:05 -0700 (PDT)
Received: from eriador.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 c26-20020ac2531a000000b004f160559d4asm1319616lfh.183.2023.05.23.05.15.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 May 2023 05:15:05 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>
Subject: [PATCH 10/15] drm/msm/hdmi: correct indentation of HDMI bridge
 functions
Date: Tue, 23 May 2023 15:14:49 +0300
Message-Id: <20230523121454.3460634-11-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230523121454.3460634-1-dmitry.baryshkov@linaro.org>
References: <20230523121454.3460634-1-dmitry.baryshkov@linaro.org>
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

