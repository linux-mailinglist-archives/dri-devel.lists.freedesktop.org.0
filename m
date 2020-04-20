Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 895351B1F23
	for <lists+dri-devel@lfdr.de>; Tue, 21 Apr 2020 08:49:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 250A36E8C7;
	Tue, 21 Apr 2020 06:48:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 947E76E85F
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Apr 2020 21:57:04 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id e6so454241pjt.4
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Apr 2020 14:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=R4+EbnUpWVTDbrBufnwy+Hvvb+k6edJjvvRt1FVHk0c=;
 b=Z3v7c90P0TKJBPhDH5LmSWpfdwv+AJV0m3lmcFBmurUJLZyIg4YN2waqagTtSfyQei
 FdYSA2cHL85bVumKXSqa1ySMIEHcOkKgAQ03+LvySYJQSVH63dvsKoRlFDbUjGkvb94T
 LuFzsGiziHdoE9d5GVNwJoEiyoLDMxVoGHTxVrNY1t6Jx4Ub2B0Ra1013+JZ7hMfBsI4
 qOIcERrgMuTldTVeTT/RU78wL/+GCREkENJkn7IDL852x0LDa0oNkLTHyTVLdCudZ7Fb
 1ERT6rk/ChA5sM4OQIuYso/ke3RplSXodXhS16sgNb/NGTc7Vahu1+BDJ8FDLSqk6Af6
 lH7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=R4+EbnUpWVTDbrBufnwy+Hvvb+k6edJjvvRt1FVHk0c=;
 b=a/A5QNC50MwXKzsejr+jgw/jzGr0uql0BJL21qPitrnm3GXTRyHuTHzwhqwl6NjwtO
 q37Octw3gY353ceRdRJwBYPt4OcaKbsZkL5ZPyCVXEoorUajAlsAfic1DhWB5zVt+GPG
 xZm4vKDa0Tofez1X0n43a4R/kTxZ5WAY5eHhY6H0Cuz4vFnV+zek7kXg38hFE0+6wdnB
 rKcMydVCiLYnkPWw6P/sUGuPxClbFLBWMUZGQmMxzAI+PQ/zeTcvF30PDfPtQ+mVz+Vx
 R9nWlqW1rDbuzePoRgLCejVeIx029MzWpoD4PWVbB3rbPIfN8VyAZem3RNbG5e+zpVkb
 d8WA==
X-Gm-Message-State: AGi0PuYNsapOTvDTJO1ke6ipC3P8mB8ZoZ+rcqFEGQZtfn9FemYYKlyX
 jQ5aubUXkudJs0jJ2saSj8eMmQ==
X-Google-Smtp-Source: APiQypJ9sXQtm/WXyZjNaKBp6mUw3NoNwG9zgqVLc8aFsJgWGDzvGnKwVH6djyUVhYPZ28FgJsSKRw==
X-Received: by 2002:a17:90a:ea07:: with SMTP id
 w7mr1771579pjy.172.1587419824119; 
 Mon, 20 Apr 2020 14:57:04 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net.
 [104.188.17.28])
 by smtp.gmail.com with ESMTPSA id f30sm365863pje.29.2020.04.20.14.57.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Apr 2020 14:57:03 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 1/2] dt-bindings: display: simple: Add IVO M133NWF4 R0
Date: Mon, 20 Apr 2020 14:57:27 -0700
Message-Id: <20200420215728.1927434-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 21 Apr 2020 06:48:39 +0000
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Define the vendor prefix for InfoVision Optoelectronics and add their
M133NWF4 R0 13.3" FHD (1920x1080) TFT LCD panel to the compatible list
of panel-simple.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v1:
- Added this patch

 .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
 Documentation/devicetree/bindings/vendor-prefixes.yaml          | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index daf86ba18f47..31dc88f5b2a9 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -129,6 +129,8 @@ properties:
       - hannstar,hsd100pxn1
         # Hitachi Ltd. Corporation 9" WVGA (800x480) TFT LCD panel
       - hit,tx23d38vm0caa
+        # InfoVision Optoelectronics M133NWF4 R0 13.3" FHD (1920x1080) TFT LCD panel
+      - ivo,m133nwf4-r0
         # Innolux AT043TN24 4.3" WQVGA TFT LCD panel
       - innolux,at043tn24
         # Innolux AT070TN92 7.0" WQVGA TFT LCD panel
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index d3891386d671..31012f91fb9a 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -463,6 +463,8 @@ patternProperties:
     description: Infineon Technologies
   "^inforce,.*":
     description: Inforce Computing
+  "^ivo,.*":
+    description: InfoVision Optoelectronics Kunshan Co. Ltd.
   "^ingenic,.*":
     description: Ingenic Semiconductor
   "^innolux,.*":
-- 
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
