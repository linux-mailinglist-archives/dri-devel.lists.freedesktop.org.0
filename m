Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56081445E60
	for <lists+dri-devel@lfdr.de>; Fri,  5 Nov 2021 04:05:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D5946E5D4;
	Fri,  5 Nov 2021 03:05:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [IPv6:2607:f8b0:4864:20::72d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D32C6E7E6
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Nov 2021 03:05:37 +0000 (UTC)
Received: by mail-qk1-x72d.google.com with SMTP id az8so7682776qkb.2
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Nov 2021 20:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fZeAoRaneXhhVmezN+qUzGu+KZMu777A5OLUtPhYX7Q=;
 b=TTN411gYGHkdkJEnoXv3HHeDrn4/Sh7cuo1/f4djeXUF0MbV0TQRlt5xXt6mg5u45I
 9nu5UHGjoho96iE2zePTM6WOVDDJDlmuE2qxCbUyRdzlXfFfqCyGbSdAvS18xTb/FJwU
 SFaIlmtVniR106Q1kFEHxdpqbnKfGcq7dJxfm0L6lfZJkEYfdFz5YGw8a0l2fIuFpiPM
 f0YpGxmST5HFZkyh+Ue9YG0WnwVUW7vZYSxJuXZEVA7XeSLtQGIPQK0iHxPRpBxfCkOQ
 tWwY58l5o38XSbjlnqmjA8pnIJePR9Gltxi8mZ+PbamJCb0p+5OmxXURY+J9nZXZu3ym
 vFJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fZeAoRaneXhhVmezN+qUzGu+KZMu777A5OLUtPhYX7Q=;
 b=OgMCL01W6PUpglGADyxz3SK9QP//oBoFD/nGUAxYCszFD6wBbL6HiOwQfBXuoeQ4dO
 i76BdKYoWhwKZ7wZ4fN1YeYFrfNiat4qDCi3Q2bc+IaD5fOtr37AOzq+E7jEUDk5ecTD
 vUiG2AIcJKT1BMVgTZIjNYXD1El0xJVPk1tEUL8+qq1+Qf0hdOXepzRWqW6BJ9jL/+Li
 ndjy0UGBmgtF3vkfIvyJcw8BWbboPMVp62lSQDAzjPAopvKoVt03cEmAXe1AL+xognN8
 sJ4xYXDngTAS74zijR7ipo2KHl7EEFKG9cPt7Di4TWebqZotBZvJttjMsc0phl13L0x9
 u4sQ==
X-Gm-Message-State: AOAM532ALIQ5wFOm+TSWxG16cGMeH6nEM0m92oVcmpmx2PhKBvOECtGF
 Q/cAbtGYO/CKZ1XavDksjFBDYIJLTAUP7w==
X-Google-Smtp-Source: ABdhPJyyzcNXoiq2HSJ+ib0DKPgEoUlfPpeHrr1NviCipx7CpPGcswMzYObcOQCBY0FZYF7jb3XdCQ==
X-Received: by 2002:a05:620a:414e:: with SMTP id
 k14mr44984285qko.400.1636081536205; 
 Thu, 04 Nov 2021 20:05:36 -0700 (PDT)
Received: from localhost ([167.100.64.199])
 by smtp.gmail.com with ESMTPSA id h66sm4710807qkc.5.2021.11.04.20.05.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 20:05:35 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Subject: [PATCH v4 12/14] dt-bindings: msm/dp: Add bindings for HDCP registers
Date: Thu,  4 Nov 2021 23:04:29 -0400
Message-Id: <20211105030434.2828845-13-sean@poorly.run>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211105030434.2828845-1-sean@poorly.run>
References: <20211105030434.2828845-1-sean@poorly.run>
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
Cc: devicetree@vger.kernel.org, jani.nikula@intel.com,
 linux-arm-msm@vger.kernel.org, abhinavk@codeaurora.org, swboyd@chromium.org,
 Kuogee Hsieh <khsieh@codeaurora.org>, David Airlie <airlied@linux.ie>,
 Rob Herring <robh+dt@kernel.org>, Sean Paul <seanpaul@chromium.org>,
 bjorn.andersson@linaro.org, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sean Paul <seanpaul@chromium.org>

This patch adds the bindings for the MSM DisplayPort HDCP registers
which are required to write the HDCP key into the display controller as
well as the registers to enable HDCP authentication/key
exchange/encryption.

We'll use a new compatible string for this since the fields are optional.

Cc: Rob Herring <robh@kernel.org>
Cc: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Sean Paul <seanpaul@chromium.org>
Link: https://patchwork.freedesktop.org/patch/msgid/20210913175747.47456-13-sean@poorly.run #v1
Link: https://patchwork.freedesktop.org/patch/msgid/20210915203834.1439-13-sean@poorly.run #v2
Link: https://patchwork.freedesktop.org/patch/msgid/20211001151145.55916-13-sean@poorly.run #v3

Changes in v2:
-Drop register range names (Stephen)
-Fix yaml errors (Rob)
Changes in v3:
-Add new compatible string for dp-hdcp
-Add descriptions to reg
-Add minItems/maxItems to reg
-Make reg depend on the new hdcp compatible string
Changes in v4:
-Rebase on Bjorn's multi-dp patchset
---
 .../devicetree/bindings/display/msm/dp-controller.yaml    | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index b36d74c1da7c..f6e4b102373a 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -21,12 +21,16 @@ properties:
       - qcom,sc8180x-edp
 
   reg:
+    minItems: 5
+    maxItems: 7
     items:
       - description: ahb register block
       - description: aux register block
       - description: link register block
       - description: p0 register block
       - description: p1 register block
+      - description: (Optional) Registers for HDCP device key injection
+      - description: (Optional) Registers for HDCP TrustZone interaction
 
   interrupts:
     maxItems: 1
@@ -111,7 +115,9 @@ examples:
               <0xae90200 0x200>,
               <0xae90400 0xc00>,
               <0xae91000 0x400>,
-              <0xae91400 0x400>;
+              <0xae91400 0x400>,
+              <0x0aed1000 0x174>,
+              <0x0aee1000 0x2c>;
         interrupt-parent = <&mdss>;
         interrupts = <12>;
         clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
-- 
Sean Paul, Software Engineer, Google / Chromium OS

