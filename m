Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A4BF3A043D
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jun 2021 21:55:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E31F6EC3F;
	Tue,  8 Jun 2021 19:55:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com
 [IPv6:2607:f8b0:4864:20::72b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E41416EC3E
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Jun 2021 19:55:36 +0000 (UTC)
Received: by mail-qk1-x72b.google.com with SMTP id c138so8585846qkg.5
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Jun 2021 12:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FRQbUUCJlhW9ygh9vvAmC6+FxFn5VHFTqyQsJoOuIsw=;
 b=Ca/6Ad6FX+g+Vqk4WnMo2PAkqaNvB1HEXCYUDPKBU8/t7N0r6otFmQg71xm8AXQeDa
 UJBRVWbsjTPmOvoMYOC3gjZYaQeKp/8PBxj4S99oFGkAgqcC0AqV92zp3YOFnsTQktGs
 NtCNZl7mmbPUQ05Wpp1lE4rkbFHroRLkKCMNO9xF3gSpadAcePhwsoAHlPl6wzummC88
 g4vS7utFFbr8PPp9VFSH+WgM0obA06qjCTzzAXo2rB/jva+DTa0She9+4Ob7jFliRZp2
 wSCbeV8vrrrJkOXWN5A3OqXeQJeGvL1r6TVDpGZZsjbf+k0X+mRbgzYUVyjXfQU8PMv1
 kPZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FRQbUUCJlhW9ygh9vvAmC6+FxFn5VHFTqyQsJoOuIsw=;
 b=p3SFQuOmVOyinK1DGlS5QCo2bKnUrqj0ncRlRRVH8/4vBcAIoRakDzf+sd3tlyRqWG
 P9HUHZvv9dP2BDmecOyfKAgtY40O8SSp1TzVbgkkGa4+P43QDSaZoJEzVLTfbfp/vcnc
 qPFKaHAJmhJL6rH7k8Dmp6w5HTHMXe5YAnU6Lev6ZbKmqxVnTVh5f7WoXIy9fRBwqiDX
 ZKGMy/0uwptA//+pnetRbkyS9FqQGoGPfwqnOkqN2BbyFa2IWpFWkXtugIBY3Dcgd+Cc
 1LiLv52neFtRX0PQMryt8shyW9ed6rlq0lrp2H7eHRhkuXK4Wutqc1m+Xwblh82pz0ft
 Q40Q==
X-Gm-Message-State: AOAM530XpDsvVLz0D6bSs3qaho1yin+bWJ1qWi7iC6+PZHNPRYOL7R3e
 GMDe8hQjo8nklC/5xuQ9sTVnnQ==
X-Google-Smtp-Source: ABdhPJz5fLjQW8AxvyM5NR001PVs62aqLYDy8D6ESFST46GKsM4Pdfn29/ZZkv02E9ikOnZhhzqr4g==
X-Received: by 2002:a37:444a:: with SMTP id r71mr23015575qka.381.1623182136135; 
 Tue, 08 Jun 2021 12:55:36 -0700 (PDT)
Received: from localhost.localdomain
 (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
 by smtp.gmail.com with ESMTPSA id l141sm643687qke.48.2021.06.08.12.55.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 12:55:35 -0700 (PDT)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org
Subject: [PATCH v3 2/3] dt-bindings: msm: dsi: document phy-type property for
 7nm dsi phy
Date: Tue,  8 Jun 2021 15:53:28 -0400
Message-Id: <20210608195342.18269-3-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20210608195342.18269-1-jonathan@marek.ca>
References: <20210608195342.18269-1-jonathan@marek.ca>
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
 open list <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Swapnil Jakhade <sjakhade@cadence.com>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Document a new phy-type property which will be used to determine whether
the phy should operate in D-PHY or C-PHY mode.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 .../devicetree/bindings/display/msm/dsi-phy-7nm.yaml          | 4 ++++
 include/dt-bindings/phy/phy.h                                 | 2 ++
 2 files changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
index bf16b1c65e10..d447b517ea19 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
@@ -34,6 +34,10 @@ properties:
     description: |
       Connected to VDD_A_DSI_PLL_0P9 pin (or VDDA_DSI{0,1}_PLL_0P9 for sm8150)
 
+  phy-type:
+    description: |
+      D-PHY (default) or C-PHY mode: PHY_TYPE_DSI_DPHY or PHY_TYPE_DSI_CPHY
+
 required:
   - compatible
   - reg
diff --git a/include/dt-bindings/phy/phy.h b/include/dt-bindings/phy/phy.h
index 887a31b250a8..b978dac16bb8 100644
--- a/include/dt-bindings/phy/phy.h
+++ b/include/dt-bindings/phy/phy.h
@@ -20,5 +20,7 @@
 #define PHY_TYPE_XPCS		7
 #define PHY_TYPE_SGMII		8
 #define PHY_TYPE_QSGMII		9
+#define PHY_TYPE_DSI_DPHY	10
+#define PHY_TYPE_DSI_CPHY	11
 
 #endif /* _DT_BINDINGS_PHY */
-- 
2.26.1

