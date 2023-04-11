Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9726C6DDDFF
	for <lists+dri-devel@lfdr.de>; Tue, 11 Apr 2023 16:32:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA61010E249;
	Tue, 11 Apr 2023 14:32:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93B8510E249;
 Tue, 11 Apr 2023 14:32:05 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id e13so7704128plc.12;
 Tue, 11 Apr 2023 07:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1681223525; x=1683815525;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=PXgLo5OVfNAMT7/smDiYjz0MFkV0iyCkx0eeELk7SYQ=;
 b=nWRgNU6YMWDga7MwAbjU/V74AQGnljhjJKMzMvS5+zZe+eZkOWLvU0j0Kj2gkVbslF
 JbJNdl6F3f4bhb7ulZcZ7RWGJMGc8jaBuEiPKZvhTbERDDQAp3gygl20Xuy9NntBgtab
 CTzVb4XHhPYunKKJ6RDg+blRZY8agaSnfX9ZNLnVpbCyzzdGxi2aL3k3yrAoqxlxiWQF
 +jm5uA5h3wLbKPyN0iM7oh0R/yPlC+O5PptXtwm5fvPK65cpjo0c8NMoTu7+CJWQtW0I
 HDa4eqjUl6+tHKrogQqOms+cjKPdTF3c6dVBeFc/8iyo1ZJpDUegBw8XdYm3Aw+S3Lb+
 hV8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681223525; x=1683815525;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PXgLo5OVfNAMT7/smDiYjz0MFkV0iyCkx0eeELk7SYQ=;
 b=jCLHwJ9jhmoxhJB54KasMK6EFbtYfa4O0gAKd1MnsVc0sq8PIDipvfFu29v3D80/BZ
 epyni8/BowusnYUCeyPZJHcxF0z5KWyiSXpeQCmjp/kRzoKS8eP5yPSJ71PMqIWs9p6l
 4OpRl0S3I5M9UCIfk6M/smmrBfWHzQJWPtzzw4MzQjt93945yjf2veEl0tRlXMLvubqo
 TGCa5dN10bnHAad1eVlg+GgkXXfU7BI4Jxfj/Hqnps571LuQWigIxh8C/oFB7C7jpIrF
 1U6vcjXkT2J6faxA8VGvK4b5fmM6/lJXQS3IslfNgjRWWXYS6kzVa1TXu7jwpiOQdsrl
 FRcQ==
X-Gm-Message-State: AAQBX9fQDiCiC9p9esIhHQZ1YJS9KEnyyj6kgE4TVdl55tWPkWUORT3b
 zYEEpxR2meVhgchtiTAqRPY=
X-Google-Smtp-Source: AKy350ZvBkJkHrK+EOEBnmvu2iSV8npZ2azOJz2Iz/9s7a8goU5uQtXMWfijuKHhwAIu8hkJ7Kn6KA==
X-Received: by 2002:a17:902:ecca:b0:1a1:ab85:1e1e with SMTP id
 a10-20020a170902ecca00b001a1ab851e1emr15137887plh.22.1681223524440; 
 Tue, 11 Apr 2023 07:32:04 -0700 (PDT)
Received: from localhost.localdomain (n220246252240.netvigator.com.
 [220.246.252.240]) by smtp.gmail.com with ESMTPSA id
 jk1-20020a170903330100b0019ea9e5815bsm9829721plb.45.2023.04.11.07.31.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Apr 2023 07:32:04 -0700 (PDT)
From: Jianhua Lu <lujianhua000@gmail.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>
Subject: [PATCH] dt-bindings: display/msm: dsi-controller-main: Document qcom,
 master-dsi and qcom, sync-dual-dsi
Date: Tue, 11 Apr 2023 22:31:49 +0800
Message-Id: <20230411143149.16742-1-lujianhua000@gmail.com>
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

Signed-off-by: Jianhua Lu <lujianhua000@gmail.com>
---
 .../bindings/display/msm/dsi-controller-main.yaml    | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index e6c1ebfe8a32..940a506a289d 100644
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
+      Indicates if the DSI controller need to sync the other DSI controller
+      with MIPI DCS commands when qcom,dual-dsi-mode enabled.
+
   assigned-clocks:
     minItems: 2
     maxItems: 4
-- 
2.39.2

