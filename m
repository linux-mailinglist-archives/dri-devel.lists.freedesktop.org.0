Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A1B3F7E85
	for <lists+dri-devel@lfdr.de>; Thu, 26 Aug 2021 00:25:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8AD46E434;
	Wed, 25 Aug 2021 22:24:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 702D76E42E
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Aug 2021 22:24:46 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id q39so1481443oiw.12
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Aug 2021 15:24:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vXLLp5GIbOEgi1J75PRebsAuxo8nGrsWkSS0/ujVn1w=;
 b=lmAfSC2C4y4sGEBFjrDXuzJzhQOQyubDGp7PohABf7xAjOKBnEoY1LXs7EQtQ936LU
 K4gVPvR7wk3xiaRIbCF9TNFaSH7LOzwH37FtYfcNAEp5MbCcGtyJUQSoVXedi+y/xZQw
 EhIxcTEPMdcR6wYGjR/dhpUTZ/pC3+nkgIxwYRQNoOf45s17kbktLkIq0w24s0yYsJPv
 ZvusE/wXq7V0Y/ZGMOEUg94DN8e3Z+veiqQTJ2BHfGwHasOmkBiP0YZoOE9V7hCZhW5I
 DdMy8zGVug/mo3IfMj+L6vQi5eB9pGKvB+1ogeSDYXLSlytC03HEcr+UPZ4OvPOgNrMt
 DFHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vXLLp5GIbOEgi1J75PRebsAuxo8nGrsWkSS0/ujVn1w=;
 b=TLJAgn1lCjjarwdkhNHpR+nlboDfybHOLWdhiGGXmijade8qzBWeDJZvt8iPI3fMMc
 XyzXNaJqEBKCYNGRmJdTbvSrliEgyn49ab7VDOBIqmBb/m/+Qeew+KHeBlz4vpRBdBDw
 iB3SIxi7AogwuZbCY6l5OQ/B1CRRdhlVf6wEh2rPeA2HwPrDLh+wKSd+H6VzyYvuzbVv
 TueXOrHMP63aaOvzQE6e83itdNuJMrWwdmTgbgZlvCZh6B7HaRwrP+LYMb+pebKVOJn7
 lfNl5VgTq/HslD8WnI43om/jomcK/ZA77SsIMMp60gHwhMIPBKujygS5uaNNOTKQoDc1
 yvKw==
X-Gm-Message-State: AOAM531r+AT+42Zm6eXvcedebh5WFFTuUbP/5ZfTFPpimzetuwidu60f
 /xIekNFWUGyL/7PScuZzQZnMjA==
X-Google-Smtp-Source: ABdhPJwHRIt2gKLaM2qqqQhcQoev7y64yQvWWdsdrlXDJ/LIM9saCuxmamvlXDwtDy92YqCOvp+XPg==
X-Received: by 2002:a05:6808:1886:: with SMTP id
 bi6mr218519oib.138.1629930285445; 
 Wed, 25 Aug 2021 15:24:45 -0700 (PDT)
Received: from localhost.localdomain
 (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id u19sm263721oiv.28.2021.08.25.15.24.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 15:24:44 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Stephen Boyd <swboyd@chromium.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Cc: Kuogee Hsieh <khsieh@codeaurora.org>, Tanmay Shah <tanmay@codeaurora.org>,
 Chandan Uddaraju <chandanu@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh@kernel.org>
Subject: [PATCH v2 1/5] dt-bindings: msm/dp: Change reg definition
Date: Wed, 25 Aug 2021 15:25:53 -0700
Message-Id: <20210825222557.1499104-2-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210825222557.1499104-1-bjorn.andersson@linaro.org>
References: <20210825222557.1499104-1-bjorn.andersson@linaro.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

reg was defined as one region covering the entire DP block, but the
memory map is actually split in 4 regions and obviously the size of
these regions differs between platforms.

Switch the reg to require that all four regions are specified instead.
It is expected that the implementation will handle existing DTBs, even
though the schema defines the new layout.

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v1:
- Include the p1 region (although unused by the implementation for now)

 .../bindings/display/msm/dp-controller.yaml         | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index 64d8d9e5e47a..f915dc080cbc 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -19,7 +19,12 @@ properties:
       - qcom,sc7180-dp
 
   reg:
-    maxItems: 1
+    items:
+      - description: ahb register block
+      - description: aux register block
+      - description: link register block
+      - description: p0 register block
+      - description: p1 register block
 
   interrupts:
     maxItems: 1
@@ -100,7 +105,11 @@ examples:
 
     displayport-controller@ae90000 {
         compatible = "qcom,sc7180-dp";
-        reg = <0xae90000 0x1400>;
+        reg = <0xae90000 0x200>,
+              <0xae90200 0x200>,
+              <0xae90400 0xc00>,
+              <0xae91000 0x400>,
+              <0xae91400 0x400>;
         interrupt-parent = <&mdss>;
         interrupts = <12>;
         clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
-- 
2.29.2

