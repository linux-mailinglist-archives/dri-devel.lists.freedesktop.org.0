Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 284654F5A6A
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 12:06:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7526510EA33;
	Wed,  6 Apr 2022 10:06:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3766810EA33
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Apr 2022 10:05:59 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id q14so2464129ljc.12
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Apr 2022 03:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XCWdbxiqhWgKkOF44rX/3oEnHasSzOiNrgOg0mVvfWM=;
 b=PErHMAJDRW5HOTkUwC6NoEhEvAPvYrAD/LaDrxIyWhah+z9mq5MK+fuAFD2lMhLrfF
 tDMQt9g2z8EmrIzdo/qeETvptgCaWLkdu5b3apyDNgZi69oQYqpPq1HuBvwacPCjfKWJ
 ESO4rQCVg918mWxT56GrSel1r1PFm7MsGnWgl9f2jBQGJbUdSqwQUcwfAK74qA2YZWQe
 POXvSGQtsGJ7twkWvr+SDZpGWgxOh7blKHXXDN8O4/54gNuFYPSjA4adwOIUyBlzxC9C
 RlWt9CI7d0hDyp5/+TwtJpaozT6BfTFL0RQy2fmwqGi7kineBZ5UVhUulMDCSJf44ED0
 5I4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XCWdbxiqhWgKkOF44rX/3oEnHasSzOiNrgOg0mVvfWM=;
 b=PbT3YL1axBf+9dLB5kWsKFqJWrrsKZBhj6Za9TMfZn/aCew3IptiQRpsJDLgx/VypD
 xjhhBwkTYHJy9k0BEhqb93fqSV8hTT2wJ1gKO5jmH/sget+UJpq5IjGwJk7O70yrDDwc
 uFCPhlDqpBI9Q04Ov4Tdrhcwk0TZcZulVP8YrIBBOGzTkXzqAZzC8Ez0cXB6ayt+E5ns
 YrIpDr1oAQ0updJqoZnaE8MKOqH2gbFqVXA8n9W9rMq5rNfr2OkSTmfKhaPRvR7j9wK7
 yudl+OI+o8QWhFh4RX5AXdfh3HSgsvaXxDRjvbeAX6FpTAaT8Zc6xfiLm6XlcYH5Jq9q
 DwMw==
X-Gm-Message-State: AOAM531WQ8uZvISmyK9e9mOXh8uG8sZBiNz72x2VeLcf60YcpfL71Yb9
 K/EWj3RMWjw2+GHgVovQ7/Q2Rw==
X-Google-Smtp-Source: ABdhPJzOjExWlVixKSZzVytPS7T3PEAEBrY0I2KinkWqM7gyqg5XvIgjZWTSDopUr9ujNzagA8HVyg==
X-Received: by 2002:a2e:96d1:0:b0:24a:c2b6:734 with SMTP id
 d17-20020a2e96d1000000b0024ac2b60734mr4781083ljj.144.1649239557469; 
 Wed, 06 Apr 2022 03:05:57 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 d17-20020a194f11000000b0044a30825a6fsm1788375lfb.42.2022.04.06.03.05.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Apr 2022 03:05:57 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v2] drm/msm: remove unused plane_property field from
 msm_drm_private
Date: Wed,  6 Apr 2022 13:05:56 +0300
Message-Id: <20220406100556.479706-1-dmitry.baryshkov@linaro.org>
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
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove unused field plane_property from struct msm_drm_private. Also
drop the enum msm_mdp_plane_property which also becomes unused.

Fixes: 7d36db0be3b9 ("drm/msm/mdp5: switch to standard zpos property")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---

Changes since v1: also drop enum msm_mdp_plane_property

---
 drivers/gpu/drm/msm/msm_drv.h | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index ee3093890d97..a34e44968558 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -53,13 +53,6 @@ struct msm_disp_state;
 
 #define FRAC_16_16(mult, div)    (((mult) << 16) / (div))
 
-enum msm_mdp_plane_property {
-	PLANE_PROP_ZPOS,
-	PLANE_PROP_ALPHA,
-	PLANE_PROP_PREMULTIPLIED,
-	PLANE_PROP_MAX_NUM
-};
-
 enum msm_dp_controller {
 	MSM_DP_CONTROLLER_0,
 	MSM_DP_CONTROLLER_1,
@@ -192,9 +185,6 @@ struct msm_drm_private {
 	unsigned int num_bridges;
 	struct drm_bridge *bridges[MAX_BRIDGES];
 
-	/* Properties */
-	struct drm_property *plane_property[PLANE_PROP_MAX_NUM];
-
 	/* VRAM carveout, used when no IOMMU: */
 	struct {
 		unsigned long size;
-- 
2.35.1

