Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 56D7C5AB566
	for <lists+dri-devel@lfdr.de>; Fri,  2 Sep 2022 17:39:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48C2110E88B;
	Fri,  2 Sep 2022 15:39:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com
 [IPv6:2001:4860:4864:20::2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AEBB10E88B
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Sep 2022 15:39:14 +0000 (UTC)
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-12566bc8e52so2355739fac.12
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Sep 2022 08:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=wVT/+hzYG59qverNNvdNMIl01LfKKg4Ig0L4UOrZzME=;
 b=D7QBqv86PXV7VpG/63WMFicdLKvBrf/n+sAZMQ84rnaoD8LgpM0affVBlZhdrVX61Z
 bPK8VrQmQr5sTHtw+JmpeJBn6rO7LT5lxKFQAoWOBXxVZXzMGqdEfSH89mQlkFEblb05
 2cwrjIfIdZw3wFvtgNnwIhVy1iIsgyW2Y+2D98pJ8WhTEweRCUpzEyqRfuSdIT/HAuns
 AhXDFSBDHBGPe2GYXS+4Ucw9S5OhFm9CSb457OZAMLEGcOzvcpQs1Nm8+BzEABMoCJhS
 hatLVuGH43qFTa+PY0x4NGXP/Ojy0ySmblyBUG5Zr/fbJLDJGyN1t1LVxBtPcbXAFbac
 X7QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=wVT/+hzYG59qverNNvdNMIl01LfKKg4Ig0L4UOrZzME=;
 b=nGqo/glgbebtidynslPLwoNncKYrD524vlhwM9/7V1f2MDQeB7CmYKfZW40mOyvSQP
 8u9pFEnHuUn53pG03rsdNqWvkEPeVFveLhdk5fdB3hisBeWXBiW9BJ45R443SwY/uUlD
 TgQH+q8GxU7p+8+Va6DXI8mpJggGDmQVUhzEEWEWnNMx7pUoq4ADguecXtmbc7mR9lqA
 vFwhOZcZI/Y8qLLty/xU7mCAjriuTK0S4kMGrkY4CL5RRPr/AIRyDOLJ/PKiY2APgm4x
 TZblqpw/bUUDgiz4wFMa4rtE0nilHl5PI3IesLJfoy6oYRE7bEPvSqiw6M/Bm9blxG37
 9tIQ==
X-Gm-Message-State: ACgBeo1EUA4MP8x79YkOgoVkDLqWYLvpLfcTaDW1ZA4V8fkk6FyzB2b6
 VRId64zvNm96buiP326WR0rzqY82lts=
X-Google-Smtp-Source: AA6agR7VCgdDPcg1rddqKq2S93+KC28187R3vGAK8Rcta2L+vutPL4d75+JID7CG6RCzZdaQ68fiSQ==
X-Received: by 2002:a05:6870:e308:b0:123:2825:84da with SMTP id
 z8-20020a056870e30800b00123282584damr2289466oad.254.1662133153297; 
 Fri, 02 Sep 2022 08:39:13 -0700 (PDT)
Received: from wintermute.localdomain (cpe-76-183-134-35.tx.res.rr.com.
 [76.183.134.35]) by smtp.gmail.com with ESMTPSA id
 e28-20020a544f1c000000b003436fa2c23bsm1087209oiy.7.2022.09.02.08.39.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Sep 2022 08:39:12 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH V2 1/2] dt-bindings: Add byteswap order to chrontel ch7033
Date: Fri,  2 Sep 2022 10:39:05 -0500
Message-Id: <20220902153906.31000-2-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220902153906.31000-1-macroalpha82@gmail.com>
References: <20220902153906.31000-1-macroalpha82@gmail.com>
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
Cc: krzysztof.kozlowski+dt@linaro.org, jonas@kwiboo.se, airlied@linux.ie,
 robert.foss@linaro.org, narmstrong@baylibre.com,
 Chris Morgan <macromorgan@hotmail.com>, jernej.skrabec@gmail.com,
 lkundrak@v3.sk, andrzej.hajda@intel.com, robh+dt@kernel.org,
 Laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Morgan <macromorgan@hotmail.com>

Update dt-binding documentation to add support for setting byteswap of
chrontel ch7033.

New property name of chrontel,byteswap added to set the byteswap order.
This property is optional.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
Reviewed-by: Robert Foss <robert.foss@linaro.org>
---
 .../bindings/display/bridge/chrontel,ch7033.yaml    | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/chrontel,ch7033.yaml b/Documentation/devicetree/bindings/display/bridge/chrontel,ch7033.yaml
index bb6289c7d375..984b90893583 100644
--- a/Documentation/devicetree/bindings/display/bridge/chrontel,ch7033.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/chrontel,ch7033.yaml
@@ -14,6 +14,19 @@ properties:
   compatible:
     const: chrontel,ch7033
 
+  chrontel,byteswap:
+    $ref: /schemas/types.yaml#/definitions/uint8
+    enum:
+      - 0  # BYTE_SWAP_RGB
+      - 1  # BYTE_SWAP_RBG
+      - 2  # BYTE_SWAP_GRB
+      - 3  # BYTE_SWAP_GBR
+      - 4  # BYTE_SWAP_BRG
+      - 5  # BYTE_SWAP_BGR
+    description: |
+      Set the byteswap value of the bridge. This is optional and if not
+      set value of BYTE_SWAP_BGR is used.
+
   reg:
     maxItems: 1
     description: I2C address of the device
-- 
2.25.1

