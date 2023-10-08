Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DDD57BCE92
	for <lists+dri-devel@lfdr.de>; Sun,  8 Oct 2023 15:23:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB2D810E0DA;
	Sun,  8 Oct 2023 13:23:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C47B510E0CF
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Oct 2023 13:23:26 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-503397ee920so4631117e87.1
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Oct 2023 06:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696771405; x=1697376205; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ws+BeoAofrb1fd3S6dPoIhO1T8QAsaqdvZDhz+j1aGM=;
 b=ebk3OZrOl5j1HZWBjeL6/o25TWYJG4N7ezO9iZZwhbmL5clh597NBC4tl7UJuTIaVf
 heZPF+vNB6FfXRWm+8d/WlTS000boRPvC5SEOYQ+LrggHozivPqpD3LJkpFrTHf8NHdd
 jDH46pXeX2hh6NnJmTIFIexxmuHJh6rbuSYcJbhQx9QdcKjrj1Ehcjx2LFEzpdJ4Np56
 vv3lZjyIEudYUmQ6VxWn3Q3kYMKldf1ECk8AmyottDnV0SALUZrGCRF2AR7B2yHzN7Xu
 aSdIq6mH4YVY1wFDVgMJ0qKrITOz2FBS6BUCmZ3xFnMAOX8qKUCseIG/YAl+OwLx1BXA
 gizg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696771405; x=1697376205;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ws+BeoAofrb1fd3S6dPoIhO1T8QAsaqdvZDhz+j1aGM=;
 b=cpvV8Wja+eTPko8WMQ6on3BmWY/wUqauoaT+Gmwfv4AC66l2UL+MkUyj5fgIdSbzGR
 6O9Y6DLnaL3QX59mQcW7IX1vzuDYgji93oUK/4wxZryLup0QwgI3EMIcKI2AhFf+lvNc
 hKCjXSCvWT59HwcyH8AhO/qigsnYq+EtAzqYqn1buNBmTN57JGTX7Xbnit55pqt3nE8J
 S2XTbB8qbpFRJgp17hURMJWJ3cvsbU3MeaF2h89HnT5vWSimwXPx74lxqiqYlj5k2LL2
 b3xElJZKw7ZbI0Ks0HqtCD2VRw9C0NX7pECvsI7yk7ABiRH+hjnUDylShIBjg4XCBVd1
 bV0A==
X-Gm-Message-State: AOJu0Yzlz+oBs5bvbrtXn6fUvtWhAB18yr0a4wdhzu34kmhXzTOlPbV5
 qKliC2pcgmP0L6xK2ZnUEvQRYQ==
X-Google-Smtp-Source: AGHT+IHnhandwGXzx8Ood+cxwN4KlSrHrc7gTvLxTHyVDXlge8YIbuzN827mRZBFbSmQ6qN3Li+XFw==
X-Received: by 2002:a19:644a:0:b0:502:9a2c:f766 with SMTP id
 b10-20020a19644a000000b005029a2cf766mr10356743lfj.30.1696771404911; 
 Sun, 08 Oct 2023 06:23:24 -0700 (PDT)
Received: from eriador.lumag.spb.ru ([188.170.82.148])
 by smtp.gmail.com with ESMTPSA id
 c28-20020ac244bc000000b005046bf37bebsm1083219lfm.57.2023.10.08.06.23.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Oct 2023 06:23:24 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 2/2] drm/ci: force-enable CONFIG_MSM_MMCC_8996 as built-in
Date: Sun,  8 Oct 2023 16:23:20 +0300
Message-Id: <20231008132320.762542-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231008132320.762542-1-dmitry.baryshkov@linaro.org>
References: <20231008132320.762542-1-dmitry.baryshkov@linaro.org>
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Enable CONFIG_MSM_MMCC_8996, the multimedia clock controller on Qualcomm
MSM8996 to prevent the the board from hitting the probe deferral
timeouts in CI run.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/ci/arm64.config | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/ci/arm64.config b/drivers/gpu/drm/ci/arm64.config
index 45f9deb7c4f6..b4f653417883 100644
--- a/drivers/gpu/drm/ci/arm64.config
+++ b/drivers/gpu/drm/ci/arm64.config
@@ -62,6 +62,7 @@ CONFIG_PHY_QCOM_QUSB2=y
 CONFIG_PHY_QCOM_QMP=y
 CONFIG_MSM_GCC_8996=y
 CONFIG_QCOM_CLK_APCC_MSM8996=y
+CONFIG_MSM_MMCC_8996=y
 CONFIG_QCOM_LLCC=y
 CONFIG_QCOM_LMH=y
 CONFIG_QCOM_SPMI_TEMP_ALARM=y
-- 
2.40.1

