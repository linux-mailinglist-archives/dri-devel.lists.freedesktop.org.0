Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CFFC66D565A
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 04:01:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BCCF10E2C8;
	Tue,  4 Apr 2023 02:01:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F243810E2BE
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Apr 2023 02:01:36 +0000 (UTC)
Received: by mail-ot1-x32c.google.com with SMTP id
 46e09a7af769-69f00c18059so983736a34.0
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Apr 2023 19:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680573696; x=1683165696;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=XZbNozN2utHiE0VKfdEzbsRFpw71XnblNKQNnSFjBl4=;
 b=R9nqQAeAdQkACL3jM/QhABXIdjloVpwbEXqEQjRDX/i5ZhCzDLBo6l+O+8fAq5WzHa
 FqrwesNfw4rMup7d4zws4iB4/WItbrcqG4LaL+JE1DgQXW94k3xR1SpizQ0uxfDBsoIW
 /8vx4d6sB+Xw2fm0M0WOE/OXe1dE2n3gaQDmQLv0nk1J8eiVUd6KOMPJaRBlV+x/WHCt
 e4PE1xCV2IJDRjE45Rc1Rrz+eXdrg3V5UB6ZncT++gg8eicTJy4Q2wew0Wwch+hWkdNN
 H5gpLvyNRQJ7SVbrsQqCiDwk01JJxG2bc+sALBEvLW5ekjiJY7n9MnHlDR1zGd9jaIrf
 VwJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680573696; x=1683165696;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XZbNozN2utHiE0VKfdEzbsRFpw71XnblNKQNnSFjBl4=;
 b=AQwMXjOrRzdrgQAarnwoiZBjKEcWjAFUctfBGTsqHqwnGM4gRovdXEjzwPcGyaoLWH
 D2wF0MecpGTbCGFSo0Ov8HPxSlI5QpXo1D+L7f8e6PegYAmUoS0g4bfiMNLZYe7YOsPC
 YKod/muBB1yJF4pVDETGN+RzineGi7p2SH0bdct8lkfqlyNFCImjVt0A8+qb1U/lVTua
 rR1RLu5hR+KklDShFuHGW7prRAMn7Nzirl+GpvDxAO/i8+3n9dVGw0FPdacMZnjA8UyI
 WbdZCx7cRKuh+VzMeIv106Ij4ZGA/f3PYTsucFMTjuREzeyMVwc4G5jQ4xJeZhaAeTC/
 0/Bg==
X-Gm-Message-State: AAQBX9drHoXuFzafmlwS0PBp6pymSxkF0HzdXipjFZNSINiuzVnCxufz
 6/I7EfTr6OQIJPJ+SnNLIL0=
X-Google-Smtp-Source: AKy350YxZkywimTf3uIg8Z7XnRTDyfX8FtLWae/PVQD/+4j8YwUC3GzGveod9g1LUhCdDD8yIbqTWw==
X-Received: by 2002:a05:6830:3099:b0:69f:793a:5779 with SMTP id
 g25-20020a056830309900b0069f793a5779mr572061ots.2.1680573695860; 
 Mon, 03 Apr 2023 19:01:35 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b69:b774:9c46:6b8:3f2])
 by smtp.gmail.com with ESMTPSA id
 g3-20020a9d6c43000000b0069f509ad088sm4927955otq.65.2023.04.03.19.01.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Apr 2023 19:01:35 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: neil.armstrong@linaro.org
Subject: [PATCH v3 1/2] dt-bindings: display: bridge: ldb: Add an i.MX6SX entry
Date: Mon,  3 Apr 2023 23:01:28 -0300
Message-Id: <20230404020129.509356-1-festevam@gmail.com>
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
 dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Fabio Estevam <festevam@denx.de>

i.MX6SX has a single LVDS port and share a similar LDB_CTRL register
layout with i.MX8MP and i.MX93.

Signed-off-by: Fabio Estevam <festevam@denx.de>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Marek Vasut <marex@denx.de>
---
Changes since v2:
- Collected Reviewed-by tags.
- Improved the Subject by not stating support. (Marek).

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

