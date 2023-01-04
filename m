Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60EEA65CF1F
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jan 2023 10:08:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F76610E500;
	Wed,  4 Jan 2023 09:08:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A13BA10E500
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Jan 2023 09:08:49 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 b24-20020a05600c4a9800b003d21efdd61dso25921544wmp.3
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Jan 2023 01:08:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ywhy8rwxYugaCOCt736qav9wiltG83VAN5edYIDMMK0=;
 b=gigiGe5rRb34aJVuvZjpbTHFslzpbK2INEVyJg46HZdizq9iJkHqeWLrcZY53ohhlh
 fikpvJ8gRcsyuZxgSLEmhcJG+kPGas5eE3ZOrkRn2EwYTkWHR/JmKRZ97lNGxQnLX4uG
 DlNIdZFuWWoWA6HrcISfJh9C7+LFbZQWXg9mJDhkhB7ieSb2K5yjS5fqaCWu8BAOgnhZ
 pnDS8UAX9fljmbMBwsSU8AjMrFd+EghtZhCJV44K8OSvCNnAubvO7sgsMk79uYsucp0C
 vwVR8lT3MF0MF8DlhgAlczYqfETFbVYvASaAFQKXxSmGdnETbNxvVGz+MZDrZF2RxfXd
 HJbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ywhy8rwxYugaCOCt736qav9wiltG83VAN5edYIDMMK0=;
 b=ZGTFPMqsVtpryg0NLcXA82aBY8kbSP6/27brJggcQkolRYDVCFGYBC6FObE7MR035Y
 1y2/DMhk/4jkPFwTxCELz0CM8fgPS1bEBvK7XkqTEfYlW/bLyb22ry07Bk2YJ39dhUaq
 c4Tg+Me+OIiu20hkltqbPgJIQG02laVzShi9IWjyMrLVJ82dbUG83ft/W9tIJ/NACeVM
 Kth1kNjaywE5rt911qL8xj5QCPDns7wYCFlHTtJFeNvgbsB/86odgGnirj4GfJ1W+I1D
 7bWHrjl3m6vhtNPG4hu8MMP3K7KRxpVd2sF2f38IHIX2hKin/0xJrdA5BNg/8RtVGGbS
 tj1Q==
X-Gm-Message-State: AFqh2kp6115lv4+ZvDDbYqfs9vfzdspugPmJQQ+nkzdMQ0aRa8wOsuis
 QJWjAq4sUD6TmN5ImQ4RaTuM3+Dgh3q3x8kM
X-Google-Smtp-Source: AMrXdXv6qX18TiGEiG+Y4uCV64Ch859OaM/nIrmW1EaY04J7vq8U2dgvbt0GY9jY+48Ed5nWeP9bkg==
X-Received: by 2002:a05:600c:254:b0:3d2:2c86:d2b2 with SMTP id
 20-20020a05600c025400b003d22c86d2b2mr41360582wmj.24.1672823328004; 
 Wed, 04 Jan 2023 01:08:48 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 j34-20020a05600c1c2200b003d98438a43asm36124622wms.34.2023.01.04.01.08.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Jan 2023 01:08:47 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 04 Jan 2023 10:08:43 +0100
Subject: [PATCH 1/6] dt-bindings: display/msm: document the SM8550 DSI PHY
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230103-topic-sm8550-upstream-mdss-dsi-v1-1-9ccd7e652fcd@linaro.org>
References: <20230103-topic-sm8550-upstream-mdss-dsi-v1-0-9ccd7e652fcd@linaro.org>
In-Reply-To: <20230103-topic-sm8550-upstream-mdss-dsi-v1-0-9ccd7e652fcd@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonathan Marek <jonathan@marek.ca>
X-Mailer: b4 0.11.1
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Document the SM8550 DSI PHY which is very close from the 7nm
and 5nm DSI PHYs found in earlier platforms.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
index bffd161fedfd..f72727f81076 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
@@ -15,6 +15,7 @@ allOf:
 properties:
   compatible:
     enum:
+      - qcom,dsi-phy-4nm-8550
       - qcom,dsi-phy-5nm-8350
       - qcom,dsi-phy-5nm-8450
       - qcom,dsi-phy-7nm

-- 
2.34.1
