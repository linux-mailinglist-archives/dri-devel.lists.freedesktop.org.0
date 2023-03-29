Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F6B66CD9E3
	for <lists+dri-devel@lfdr.de>; Wed, 29 Mar 2023 15:04:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 399C610EAA6;
	Wed, 29 Mar 2023 13:04:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com
 [IPv6:2001:4860:4864:20::2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81DDB10EAA2
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Mar 2023 13:04:26 +0000 (UTC)
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-17aaa51a911so16114001fac.5
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Mar 2023 06:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680095065; x=1682687065;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ruA4RM4hHwK5/3naD/sja9/lwOJ8mtV77wdWda/c6wY=;
 b=NTK3ldykso7B72PreBcP92SQ8c9Tc1DuQG7Un+/WeuzvxZijPnGiEHphAcn40hmBqT
 GIwMv7ORE8rdKqJBK5ETeLmdLh/m8GMNGOqphvuvJkXxKTDYYuta9Z4hSPzN3ViEcd7j
 1La7Qnj8+ahpJ+Vl8LAo06IIq0Cj1dFPCyuIInod044dkT7ISwH9qz0XJMaIhCGF4lGZ
 QWHwx/s1CUsIrTlzllTAVaYRGcuXNETGJukll4bifJBB9qt08+3tWvhr4xBjAVlVumHL
 IJY3Wk2Djk/YccKy9sxt26O5FAEF8R9aZXlhugiOJKYWo+12Hy8+bttZEhrllzVqV/z8
 TwEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680095065; x=1682687065;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ruA4RM4hHwK5/3naD/sja9/lwOJ8mtV77wdWda/c6wY=;
 b=4MLPYVyDMSxezs4g0Q8I+30ba4ds6Vr/65gTJKze7YKOgsFHBbqT64RK2PkWCO57GG
 FmbiQk7nzA/YwJ6W97YmkaEqZrO6Esdm0prEeeNf11l5sNtoOzgEz1hEWnpTe6+/sNHc
 yjZFF8MpY0F7prJ9kZXhp9Heo7pd02c9dCpx3GpMyfZUgBNVTlpeCsLgTT6po0E5ATNc
 nCkLn9JF6iDE3MkEJKMahREQdagEh2/wkTW+8IhU1nxwG6oonnhYguyKsEeo5WsPRH2i
 mx3wIXP+K7RZUeNif/lOaYtahMw9jQPSduVy6IiH2x4mcdE1fLp2ZxOs2n+M5dLOqU29
 Oy0w==
X-Gm-Message-State: AAQBX9e21vX4s1s9c5AGgEnj59nws3A3EE56L33xTdXNetCqPLXuIBuH
 xDf5OPNSMZyz6iS7IPJDpFs=
X-Google-Smtp-Source: AKy350Yw05MiS/wqizw5O54Ri+I9y0JW1pKsuowoI4g7KOGB2eLbMlq0kAgam4wxBVIwM9JGB4hbIA==
X-Received: by 2002:a05:6870:a2d0:b0:176:3c73:2ef1 with SMTP id
 w16-20020a056870a2d000b001763c732ef1mr11400890oak.4.1680095065591; 
 Wed, 29 Mar 2023 06:04:25 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b69:1c2d:271:d34:84ea])
 by smtp.gmail.com with ESMTPSA id
 vh22-20020a0568710d1600b00177c21c3ae1sm11756738oab.54.2023.03.29.06.04.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Mar 2023 06:04:25 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: neil.armstrong@linaro.org
Subject: [PATCH 1/2] dt-bindings: display: bridge: ldb: Add i.MX6SX support
Date: Wed, 29 Mar 2023 10:04:12 -0300
Message-Id: <20230329130413.683636-1-festevam@gmail.com>
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
 .../devicetree/bindings/display/bridge/fsl,ldb.yaml   | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml b/Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml
index 6e0e3ba9b49e..4f842bcfba1a 100644
--- a/Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml
@@ -17,6 +17,7 @@ description: |
 properties:
   compatible:
     enum:
+      - fsl,imx6sx-ldb
       - fsl,imx8mp-ldb
       - fsl,imx93-ldb
 
@@ -60,6 +61,16 @@ required:
   - ports
 
 allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: fsl,imx6sx-ldb
+    then:
+      properties:
+        ports:
+          properties:
+            port@2: false
   - if:
       properties:
         compatible:
-- 
2.34.1

