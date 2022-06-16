Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB57054DD81
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jun 2022 10:51:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C336113B02;
	Thu, 16 Jun 2022 08:50:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6634113B04
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 08:50:56 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id 20so1174589lfz.8
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 01:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JCCzD7oRfJJDnx60RNCfCTBL5b1EzprlMae+XENmAMw=;
 b=nHq0xF0ZYp3tEAz+fksuTFTmTGEc0OFPXgW2/s+GNpAhBfmKPKdBYphT7TZavBVMtU
 oqp+Vd2l0loY/cKTWoVo5qJeAZeS86Ah39QqsE6KllgN6Kl2vI7xNazan1ZDoG3BHTYr
 hnwSeJDS20VsYcgtcJI3uZaj50UxyEVjj178GyfLNmn2VtTlestAKHaxMvSKYAcaY1Fc
 5x4+nNVQnFe8zgrsv/IOxDbZEPCf2Wn1q+D7xKGgLzmBvhpZHyKg4B0APZvhBQYc/gKV
 Xb1SCahD3iYTtLUWGFE40OycZeFbB3Es1UYMEO6L1CpM3clkCfoby9q2RDaqcubLSnPn
 Wckw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JCCzD7oRfJJDnx60RNCfCTBL5b1EzprlMae+XENmAMw=;
 b=qEg6TeCJOh7ARtbODQQKNwwAM6T8TscWx7WnPsQ2PJPPdDHbohm5fk83S2mUAY3qFi
 VsRQ+27ikotmMZBemzjCqI5xV5Mz6w1T+xIMOhIiePHLsYiOlfQWJlROoRrNy1WaBDET
 67DI+AaQCiTUXKunW+lZODJAyDFFPHCHK27QcbKqvvOxLYQGclo33rqPL7O2PaFjiNI2
 ex8nql+zFATtEgsNWOWLjJU4mFl/lYT6klpara1Orn15WDtSPSwudySmFTKvN1xbdRL3
 6ek70aE0q98NqcUlQRPOBmQUTRYWXZwm/zmU7F88fK5+I/CdkgDv+T6MoOz46/dIfITH
 y/wg==
X-Gm-Message-State: AJIora/hJ7cq0poiUhxgQZfofuzw+FUd/Qy/+xPzJ1FtIQUceNvhIDLz
 e4RqJ4TG6PNlypWfUfoZn+XqPQ==
X-Google-Smtp-Source: AGRyM1tpGaPfQUuy8/yW8c6Ns9ktOMIazvlJV8x2JhkS9lg7S7PSaaDBdKwrUpogNykTLJfE4MJtiQ==
X-Received: by 2002:a05:6512:2017:b0:478:f827:67ca with SMTP id
 a23-20020a056512201700b00478f82767camr2064877lfb.10.1655369455004; 
 Thu, 16 Jun 2022 01:50:55 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 a16-20020a2e8310000000b002557115af75sm167209ljh.118.2022.06.16.01.50.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jun 2022 01:50:54 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH] drm/msm/hdmi: drop empty bridge callbacks
Date: Thu, 16 Jun 2022 11:50:54 +0300
Message-Id: <20220616085054.432317-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Drop empty callbacks msm_hdmi_bridge_enable() and
msm_hdmi_bridge_disable().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index 97c24010c4d1..d569f0c6cab7 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -159,14 +159,6 @@ static void msm_hdmi_bridge_pre_enable(struct drm_bridge *bridge)
 		msm_hdmi_hdcp_on(hdmi->hdcp_ctrl);
 }
 
-static void msm_hdmi_bridge_enable(struct drm_bridge *bridge)
-{
-}
-
-static void msm_hdmi_bridge_disable(struct drm_bridge *bridge)
-{
-}
-
 static void msm_hdmi_bridge_post_disable(struct drm_bridge *bridge)
 {
 	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
@@ -306,8 +298,6 @@ static enum drm_mode_status msm_hdmi_bridge_mode_valid(struct drm_bridge *bridge
 
 static const struct drm_bridge_funcs msm_hdmi_bridge_funcs = {
 		.pre_enable = msm_hdmi_bridge_pre_enable,
-		.enable = msm_hdmi_bridge_enable,
-		.disable = msm_hdmi_bridge_disable,
 		.post_disable = msm_hdmi_bridge_post_disable,
 		.mode_set = msm_hdmi_bridge_mode_set,
 		.mode_valid = msm_hdmi_bridge_mode_valid,
-- 
2.35.1

