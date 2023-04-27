Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A98F6F05AB
	for <lists+dri-devel@lfdr.de>; Thu, 27 Apr 2023 14:22:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F4C510E34D;
	Thu, 27 Apr 2023 12:22:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7F0D10E1BD;
 Thu, 27 Apr 2023 12:22:29 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-63d2ba63dddso6567807b3a.2; 
 Thu, 27 Apr 2023 05:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682598149; x=1685190149;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Je9dOfRheV0xbkP5D8rz4YMFOXvOjexxPPlhbTAEfPg=;
 b=GQkHqLCx9QOiCVqkmdxf0PEzuwjMhhQn140pliLqoJPgOQ5nb4HFSUeFmKRAUUFL65
 ygD+kZbwE/NQVPdP2oeBIAXKvHhkanPAeWnkIkz9JlAxYph7Rh+fF2hJqEUFSCO4jOO+
 mie45R/RwxKV4XqV301GJksXsUh+PpMsyvjT0T/yMpZnEIFbHNI+2ADNuPmvtxQRjbL7
 qfeqLmsNO6dxA/XznhGoOIvDCAtl/J/xBFWbEIidS5y/piZ8gfH5Z9VHGjUJbqhhVvBi
 v4zdblaFMnGtRS50BUFUUv4E95KhJbOxxNclkMMex9+fV9mdbVYdz8xAFlZyNEYqgqnt
 DRrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682598149; x=1685190149;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Je9dOfRheV0xbkP5D8rz4YMFOXvOjexxPPlhbTAEfPg=;
 b=NxmGckA839zMau655B3GJxIiVFsPcBFKgwWuYQFOPfjvgISkVcZGtBxfjx3hvidgaa
 ojXxwCTi8xvV9rAHJrAl/tHs1s1+rCl3DL3Sx6WUXL+kK1+Bz+HiEthTTJnoybmcEKrI
 z9WpBR8OJw4TsF7Ay8ffSR5KCXmMmEV00bJMeLZjKGUWMvt0nWe5o85xDHE4vOcWmq2q
 7hooBZCWy/wwQIpMgXgR7IP4A8UnMY/CFBzbbvAjCUG9JOX+v+tblOJ08P9Si5GdAeR9
 2uPLA77gbx40zn53EZRBPs9/Zklx8jTjtVVa9mko2pP2VLr8PgOUYIeIGUcwHM8Cq+U/
 /A4g==
X-Gm-Message-State: AC+VfDw7qItKMzuNRaHwIVaj2i/VoCoW7HJV97ql7s2ZJn/EHsuNU5o7
 sh37I7n3av/yFZz33GtjNDM=
X-Google-Smtp-Source: ACHHUZ60LSwIT0w8lkNEvMzM0Y0TrOpiNVgl24TggeN+M+JPyg2fFsrpOK3fdBeW4lKJvNEje1Dz8w==
X-Received: by 2002:a17:90a:f312:b0:24c:1cc:e15 with SMTP id
 ca18-20020a17090af31200b0024c01cc0e15mr1813547pjb.12.1682598148867; 
 Thu, 27 Apr 2023 05:22:28 -0700 (PDT)
Received: from localhost.localdomain (n220246252240.netvigator.com.
 [220.246.252.240]) by smtp.gmail.com with ESMTPSA id
 ot2-20020a17090b3b4200b0023cfdbb6496sm13443011pjb.1.2023.04.27.05.22.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Apr 2023 05:22:28 -0700 (PDT)
From: Jianhua Lu <lujianhua000@gmail.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>
Subject: [PATCH v2] dt-bindings: display/msm: dsi-controller-main: Document
 qcom, master-dsi and qcom, sync-dual-dsi
Date: Thu, 27 Apr 2023 20:21:32 +0800
Message-Id: <20230427122132.24840-1-lujianhua000@gmail.com>
X-Mailer: git-send-email 2.39.2
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jianhua Lu <lujianhua000@gmail.com>, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This fixes warning:
  sm8250-xiaomi-elish-csot.dtb: dsi@ae94000: Unevaluated properties are not allowed ('qcom,master-dsi', 'qcom,sync-dual-dsi' were unexpected)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Jianhua Lu <lujianhua000@gmail.com>
---
Changes in v2:
  - pick up tags
  - fix typo (need -> needs)

 .../bindings/display/msm/dsi-controller-main.yaml    | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index e6c1ebfe8a32..130e16d025bc 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -82,6 +82,18 @@ properties:
       Indicates if the DSI controller is driving a panel which needs
       2 DSI links.
 
+  qcom,master-dsi:
+    type: boolean
+    description: |
+      Indicates if the DSI controller is the master DSI controller when
+      qcom,dual-dsi-mode enabled.
+
+  qcom,sync-dual-dsi:
+    type: boolean
+    description: |
+      Indicates if the DSI controller needs to sync the other DSI controller
+      with MIPI DCS commands when qcom,dual-dsi-mode enabled.
+
   assigned-clocks:
     minItems: 2
     maxItems: 4
-- 
2.39.2

