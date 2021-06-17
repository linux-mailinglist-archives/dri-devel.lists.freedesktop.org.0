Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 515B93AB703
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jun 2021 17:09:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47BAD6E90D;
	Thu, 17 Jun 2021 15:09:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com
 [IPv6:2607:f8b0:4864:20::f2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B22C56E8FC
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jun 2021 15:09:52 +0000 (UTC)
Received: by mail-qv1-xf2b.google.com with SMTP id l3so1857563qvl.0
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jun 2021 08:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cEGpwhG6p5ve4HkGton1AY3pWTWRxR5OFRUm+6IG0BM=;
 b=xOFHogCXEUwOHUdEDKDozRhp448e/RJv4gH5fgQt3uM+WNHVNeqW4RXEh0BjTOI9Z1
 /1Ih6xJ5hbonfI5R6h9/cm20h8UAaL1BjYocAjjxlUSiSV03t/D6d0tlUhqqz4R3F/hT
 qAOA3PEBj3JGArvQnGFFwbbmw1n1tNGwbZ5Gf6SsUqRZCm8vTHw6d+YJOucH9nmCmnwG
 0PW1zxFM4D+CfMI4VdX53JrWmDR4DNWkrGEEoz1CSt6Q3+LtQf9k5IppfQledl/Uvcbm
 lngUFfWQ6m/QCRY/rroLBMjXE1APF7TVGC33tAzfTyhVtfYV3gkw/y/KbRaCzTi7iqgQ
 rsrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cEGpwhG6p5ve4HkGton1AY3pWTWRxR5OFRUm+6IG0BM=;
 b=UInL3fiktB0PtX9XqhjEa6DRphYQ4cg/hDvTfw/Sl6SH4aLDPvoktS2evCCR+keVoK
 9hDZnCcnfXD6+w9WX5Bx4dhzfUMMTn736SXK9svqHT8KapSh/s2E8Yh+phjo6ghtDYaz
 vX0zoR316erbjPfCfmXt+OYJeHXw3RGTVBq1CrtYAUaD4V3vuMO94ugeHhJSWFcgvMm9
 ojR19Eu/B4C0istD6VvUmUW5VRowXYXgQLIcgY2os1o/pqI49i3CbmNm5FvNgk8ciEXO
 psFk/fK0xIQwW8rVC8oU7Y7J+YVL6fxQOoS57nnnjnMpLBAXk4E8nG+KNH5+B5g4/rIV
 P1tg==
X-Gm-Message-State: AOAM532fu8BAj4scDbmq6fb8B2iIjybzL2IXa8fx8/bdLB1Wmey56LEm
 cOu+IFCnuNHaye1AuyqdbEOnUA==
X-Google-Smtp-Source: ABdhPJwkwzkpMneGJhGYpV8v3Sy02fJEBm5RVWSNvS4VXlzOYBId9bl24tw7PJEscZEom7rxwflAWg==
X-Received: by 2002:a0c:e84b:: with SMTP id l11mr390498qvo.36.1623942592025;
 Thu, 17 Jun 2021 08:09:52 -0700 (PDT)
Received: from localhost.localdomain
 (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
 by smtp.gmail.com with ESMTPSA id g82sm1915427qke.119.2021.06.17.08.09.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 08:09:51 -0700 (PDT)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org
Subject: [PATCH v4 2/3] dt-bindings: msm: dsi: document phy-type property for
 7nm dsi phy
Date: Thu, 17 Jun 2021 10:43:34 -0400
Message-Id: <20210617144349.28448-3-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20210617144349.28448-1-jonathan@marek.ca>
References: <20210617144349.28448-1-jonathan@marek.ca>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 Anurag Kumar Vulisha <anurag.kumar.vulisha@xilinx.com>,
 David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Vinod Koul <vkoul@kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>, Rob Clark <robdclark@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Swapnil Jakhade <sjakhade@cadence.com>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Document a new phy-type property which will be used to determine whether
the phy should operate in D-PHY or C-PHY mode.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../devicetree/bindings/display/msm/dsi-phy-7nm.yaml         | 5 +++++
 include/dt-bindings/phy/phy.h                                | 2 ++
 2 files changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
index c0077ca7e9e7..70809d1cac54 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
@@ -34,6 +34,11 @@ properties:
     description: |
       Connected to VDD_A_DSI_PLL_0P9 pin (or VDDA_DSI{0,1}_PLL_0P9 for sm8150)
 
+  phy-type:
+    description: D-PHY (default) or C-PHY mode
+    enum: [ 10, 11 ]
+    default: 10
+
 required:
   - compatible
   - reg
diff --git a/include/dt-bindings/phy/phy.h b/include/dt-bindings/phy/phy.h
index 887a31b250a8..f48c9acf251e 100644
--- a/include/dt-bindings/phy/phy.h
+++ b/include/dt-bindings/phy/phy.h
@@ -20,5 +20,7 @@
 #define PHY_TYPE_XPCS		7
 #define PHY_TYPE_SGMII		8
 #define PHY_TYPE_QSGMII		9
+#define PHY_TYPE_DPHY		10
+#define PHY_TYPE_CPHY		11
 
 #endif /* _DT_BINDINGS_PHY */
-- 
2.26.1

