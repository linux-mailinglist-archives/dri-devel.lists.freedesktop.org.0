Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C5C74DC20F
	for <lists+dri-devel@lfdr.de>; Thu, 17 Mar 2022 09:58:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4C2F10E084;
	Thu, 17 Mar 2022 08:58:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E72710E5D9
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Mar 2022 13:58:35 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id d7so3097442wrb.7
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Mar 2022 06:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6IV7qFOLD4q3zq20RHPOYsu9T3drVDXzjg20JRDwUX8=;
 b=pEAx9CwFmoct9hr2tNPZV5DjiQG683/4ff5MH5nYiUC3ICJaYosdn7AcrDQzHNINnd
 WeipW/S/hYMxTaUJ7N4d3H0O970yhfJ0zNjE8JhoB3eqaB6Ftky0SKD1Ug/hTiHMyUyl
 OdYOBodYG0lkPW0fUj8cPxNiPfIv4g5QN0/ITVJ+zoNxMdX+/nktU7m/RQjy/C4d3jYE
 K6UPCqhMAdJYVXs10wKqrpB8Mc555n4F+HzoF8wzWFTjQ+fK+ORilsew/YWNPiODy+Av
 n3RT498m8xwBvBeu3GUy7hYpK1/dTdnMN6lbJk2kfkn05mwZ9ADrf6zJE3+MGZ5wR1qy
 MauQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6IV7qFOLD4q3zq20RHPOYsu9T3drVDXzjg20JRDwUX8=;
 b=KwPOGE85CMu2RDNTdCzkUJna9M5CFRM4IXNwvOjb7q7IDtHpFi2DwDAZK8Rg0e4Och
 LWwgLdJiBPT+3ooauOOVYDkvIC+bvB9Z8VQPiSMabA94BCP2fxrzJYhgeSc16gbhpV5N
 QvbxaL4wJyUQw0Wc32eh/tqeDWRXONlJCgROTHcDIrkmMBw6hgrrxEKNl6O889OfVKC8
 lHyjo5SNwDuhEOGYGHgGSQbOZuAjb3rr2W6svVdm3awK9EsTEIT8oT2Pq4N/Lg1LyyWH
 J9rCAt9DCvaywEohmA3RotRN5StW2UZSti2dWJXN3mWb45GUfLG/oBzjxfKMPE0ZlqCK
 Xtjw==
X-Gm-Message-State: AOAM532VfMtK0eYclG8wruz+e4J5xNyCtc7gPMpbLtNlOT5etLj8WcA3
 H2gJcY/Oe4o7CgwQTkRjVz3H+w==
X-Google-Smtp-Source: ABdhPJxkbNIncjvhV76u+CQgFORpjOgr7BLWcjNg6G2wuLjeNG9y5sMlA2spnK1hfKCW4rvpjDz5yw==
X-Received: by 2002:a05:6000:10d2:b0:1f1:e648:5ed3 with SMTP id
 b18-20020a05600010d200b001f1e6485ed3mr65695wrx.243.1647439113831; 
 Wed, 16 Mar 2022 06:58:33 -0700 (PDT)
Received: from localhost.localdomain ([37.173.241.155])
 by smtp.gmail.com with ESMTPSA id
 ay24-20020a05600c1e1800b00389a420e1ecsm1790563wmb.37.2022.03.16.06.58.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Mar 2022 06:58:33 -0700 (PDT)
From: Nicolas Belin <nbelin@baylibre.com>
To: narmstrong@baylibre.com, andrzej.hajda@intel.com, robert.foss@linaro.org
Subject: [PATCH 1/3] dt-bindings: display: bridge: it66121: Add audio support
Date: Wed, 16 Mar 2022 14:57:31 +0100
Message-Id: <20220316135733.173950-2-nbelin@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220316135733.173950-1-nbelin@baylibre.com>
References: <20220316135733.173950-1-nbelin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 17 Mar 2022 08:58:23 +0000
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
Cc: devicetree@vger.kernel.org, jonas@kwiboo.se, linux-kernel@vger.kernel.org,
 jernej.skrabec@gmail.com, dri-devel@lists.freedesktop.org,
 Nicolas Belin <nbelin@baylibre.com>, Laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Update the ITE bridge HDMI it66121 bindings in order to
support audio.

Signed-off-by: Nicolas Belin <nbelin@baylibre.com>
---
 .../devicetree/bindings/display/bridge/ite,it66121.yaml        | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/ite,it66121.yaml b/Documentation/devicetree/bindings/display/bridge/ite,it66121.yaml
index 6ec1d5fbb8bc..c6e81f532215 100644
--- a/Documentation/devicetree/bindings/display/bridge/ite,it66121.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/ite,it66121.yaml
@@ -38,6 +38,9 @@ properties:
   interrupts:
     maxItems: 1
 
+  "#sound-dai-cells":
+    const: 0
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
-- 
2.25.1

