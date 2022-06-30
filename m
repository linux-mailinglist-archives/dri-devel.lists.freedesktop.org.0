Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 530B8562CB7
	for <lists+dri-devel@lfdr.de>; Fri,  1 Jul 2022 09:33:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9C2810FAAE;
	Fri,  1 Jul 2022 07:33:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8481F11A2A5
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 12:08:54 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 o16-20020a05600c379000b003a02eaea815so2538872wmr.0
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 05:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QmOHcW4dfoBP/OvF4P53/J8bPrjDpx4wlFz+sssEF1I=;
 b=eUHz07M69XsX41EIdlsP6DW5+h2PJQ2QMgl5OYcPczLU1myyKBoOauaFSW69ZaUJj+
 JDgUCIX+LiWCnbSDRl75ZFRuIDJVvU9FixAE+DFAujVKv4VABC34QWxqJ83yNQL3BSIv
 5gDC8JILomeiFpSG0xQOuGjPLQ/xgVf/UfojGmgq4su8DKjreyYBBycLqUjS5EDXupv8
 0RzAQhSoCMQi4ERVQnsAXb3xSiHqiRVc5BKs9EH/MBNobf74DZjQZdwKDkgAfBYPQS6Z
 8EU1VM7T1UI1ENvPyeRwQ4M9OThqD1MzsDcnXWWLfZholLuz6ET16UGgOdDWRvNYL3ny
 DX9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QmOHcW4dfoBP/OvF4P53/J8bPrjDpx4wlFz+sssEF1I=;
 b=JEffFCn/ZHpvqfsVO8CxxePQzSHdI+Biy1d+FjgfZINRdehAACCirczQ536bggeq3U
 HW3bfvhPZGWjsIjWNXf7VrgQKTHiG5EMJtgJwPx6pLsuIFdGEcCGQ1VHOu9f4sb1PBqT
 0zsNg1tYT1l8Vo68ZqA6bjnUlSPpAwu7xlm7JAdhXyXhVAmOBwgmw+3Y4QXPSlgg9uCV
 tDU8BwkK/gqPmI9dMB6KbB1JApNCQG+wKxYSPvA7TZnLyZxFbqhubDAn+B55g7Yn4amr
 coT2xzS1jBwdXMja0CSBSHYELg1/XwG0aqFGV3ogsnOqLkJUN1W8q6UsfGR6dMVTGamx
 4e/w==
X-Gm-Message-State: AJIora85qxD1KZRPqbNtZHoYy6OxgG5/bjxDNVpRqnPbESBgtxTgVcwA
 QhEo7KL5Hq+8k0RNvu/AuyecZg==
X-Google-Smtp-Source: AGRyM1s/BaoaFvloTFuVhjoHqSnlJ1Tb0W1qU2Sw/rXvQG/8eapTt6yLmWXi4C2u/YWzGCf4fHt6DQ==
X-Received: by 2002:a05:600c:a02:b0:39d:bdf8:a4f4 with SMTP id
 z2-20020a05600c0a0200b0039dbdf8a4f4mr9528858wmp.201.1656590932987; 
 Thu, 30 Jun 2022 05:08:52 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie.
 [188.141.3.169]) by smtp.gmail.com with ESMTPSA id
 m1-20020a7bcb81000000b003a05621dc53sm6286532wmi.29.2022.06.30.05.08.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jun 2022 05:08:52 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: robdclark@gmail.com, quic_abhinavk@quicinc.com,
 dmitry.baryshkov@linaro.org, sean@poorly.run, airlied@linux.ie,
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Subject: [PATCH 4/7] dt-bindings: msm: dsi: Add vdd* descriptions back in
Date: Thu, 30 Jun 2022 13:08:42 +0100
Message-Id: <20220630120845.3356144-5-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220630120845.3356144-1-bryan.odonoghue@linaro.org>
References: <20220630120845.3356144-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 01 Jul 2022 07:33:24 +0000
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
 dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org,
 quic_mkrishn@quicinc.com, bryan.odonoghue@linaro.org, swboyd@chromium.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When converting from .txt to .yaml we didn't include descriptions for the
existing regulator supplies.

- vdd
- vdda
- vddio

Add those descriptions into the yaml now as they were prior to the
conversion.

Fixes: 4dbe55c97741 ("dt-bindings: msm: dsi: add yaml schemas for DSI bindings")
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../bindings/display/msm/dsi-controller-main.yaml    | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index 91324f0828448..fd9d472437853 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -125,6 +125,18 @@ properties:
       - port@0
       - port@1
 
+  vdd-supply:
+    description:
+      Phandle to vdd regulator device node
+
+  vddio-supply:
+    description:
+      Phandle to vdd regulator device node
+
+  vdda-supply:
+    description:
+      Phandle to vdd regulator device node
+
 required:
   - compatible
   - reg
-- 
2.36.1

