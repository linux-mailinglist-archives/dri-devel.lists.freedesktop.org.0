Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 601FE6D017C
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 12:42:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3376910E1CE;
	Thu, 30 Mar 2023 10:42:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1645010E1CE
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 10:42:42 +0000 (UTC)
Received: by mail-ot1-x330.google.com with SMTP id
 46e09a7af769-6a11f365f87so484710a34.1
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 03:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680172961; x=1682764961;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2Uok0Hmd0al/CPOCQ4MNNIKk7OYiNzcT2cb9TQrUjBQ=;
 b=SlPySRm9vRJk6SxCOX0HQ00GpXSJrjXuDg4lkH3y6M5bw+95PoFZ9DSXQIYvi9czed
 klrAq9Z0VIXBsrYst17c/DZGHl52ilPXGn2zSb/HBzmLPlT/Wjv5AXL9fVN0jR5+2hVK
 X0j8ogSCU6tG89hp4oaOqJSqRE4NyKouEMdWVD3hEvIDFjnNr1JQhko4QNWEVpY5fJOh
 fBUvEThMkkCgbwrtfqGyYfRtC0b3qxnr6vcJvOC2s/xwQzKp7lXzVBijOrl4i4CT50Gt
 jfJSa2n5J0COEruuD8UgsBCJQ0/uFep2AZI/vFPbgs8MLzmOXHWIWxSRbsf5ltuXcmsu
 sRGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680172961; x=1682764961;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2Uok0Hmd0al/CPOCQ4MNNIKk7OYiNzcT2cb9TQrUjBQ=;
 b=cePdlK8wmoLA3Nc2hrah3la5lPY1xfx4/g0ahrt0HMZPTTmwrVRVp6DIBKThGuLRzK
 0iZcsPO1TV6rXXgYS7r44MKDRbs74Jz4TelHZyMFJdJGBwzQ28Znp4gkRxBcPG8+3a6p
 fN9ViU5N8eX7Hyj9D09YUkuLaRrUi+tHZfOB1ExU4mHuZmQpH+B1gDPeSQTQaYXyxe0T
 ZaF/EQXab3k811tXINPfUNGV/YgBGIL9Fe4M4DJ2sgiI/DqoWoziSd313C8JgbH9rU9h
 MA3uz/+ig9iBLhCN9+KHSttXQ3h/XZGaBBWHkdmBXQ9x/9Se3e4Jzq4bGeB6swFpL3Os
 wjWA==
X-Gm-Message-State: AAQBX9cPAQ4z0ZspN+xneQdomSybk4jZGf6+7fF7GseUrys8br5425fL
 XGtfDc718pKlzD+EJID3cuw=
X-Google-Smtp-Source: AKy350YHZUhisACUe5VWR1JQ10GCarrQ8GGTo8J5CY11WD8ixQ5uU2qGNjsCa3TIvNhtyG801M++qA==
X-Received: by 2002:aca:3442:0:b0:37f:9335:7f96 with SMTP id
 b63-20020aca3442000000b0037f93357f96mr741642oia.0.1680172960960; 
 Thu, 30 Mar 2023 03:42:40 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b69:bb2:6db6:1a29:3df5])
 by smtp.gmail.com with ESMTPSA id
 s4-20020a0568080b0400b0038755008179sm8414071oij.26.2023.03.30.03.42.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Mar 2023 03:42:40 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: neil.armstrong@linaro.org
Subject: [PATCH v2 1/2] dt-bindings: display: bridge: ldb: Add i.MX6SX support
Date: Thu, 30 Mar 2023 07:42:32 -0300
Message-Id: <20230330104233.785097-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
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
Cc: marex@denx.de, devicetree@vger.kernel.org, Fabio Estevam <festevam@denx.de>,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Fabio Estevam <festevam@denx.de>

i.MX6SX has a single LVDS port and share a similar LDB_CTRL register
layout with i.MX8MP and i.MX93.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
Changes since v1:
- Do not duplicate the entire if. (Krzysztof)

 .../devicetree/bindings/display/bridge/fsl,ldb.yaml          | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml b/Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml
index 6e0e3ba9b49e..07388bf2b90d 100644
--- a/Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml
@@ -17,6 +17,7 @@ description: |
 properties:
   compatible:
     enum:
+      - fsl,imx6sx-ldb
       - fsl,imx8mp-ldb
       - fsl,imx93-ldb
 
@@ -64,7 +65,9 @@ allOf:
       properties:
         compatible:
           contains:
-            const: fsl,imx93-ldb
+            enum:
+              - fsl,imx6sx-ldb
+              - fsl,imx93-ldb
     then:
       properties:
         ports:
-- 
2.34.1

