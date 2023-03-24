Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 303556C865F
	for <lists+dri-devel@lfdr.de>; Fri, 24 Mar 2023 20:56:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F3BE10EC95;
	Fri, 24 Mar 2023 19:56:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com
 [IPv6:2607:f8b0:4864:20::112d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DF5D10EC99
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Mar 2023 19:56:27 +0000 (UTC)
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-541a05e4124so52847707b3.1
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Mar 2023 12:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1679687787;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lJ8XMXUhDPNrl814nUboxXrW9LkyTici68uktBtSFp8=;
 b=P2zFpErnEFQsp7uPKvsd3TV5DcP5rEYW4cUIR/DZg2F7Bjo6Fuo7TB81xa4HUve9mN
 f83wkGhGCLXt8pH/1NA9mpjGLxNwwWWLuHuVctnuEOdYIwAA+YedxbsIijurA1cI4QmS
 6AA07fYrVRdkiyJ5UKRqq7ba8hcI44Krtm/Ys=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679687787;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lJ8XMXUhDPNrl814nUboxXrW9LkyTici68uktBtSFp8=;
 b=FT4ngU7J1w4CvX9SKTYnMO4O2yF+pCoCJIMz9X3Y1XBKkCa6/hsq87n1VbS8EpLkQB
 awcarb4YBlpRRok9sfKZuLM5oJOBk5wGn/E78JlTe5c3C6awsDwafq4b4ix2TWIr6JEi
 jSVoywZoDePBsEZAJv5L9ImTgaBeN8YmPfqmwolkn4JedKjF9VzOwHCKOCLnQFtlGd3C
 YM+dGKr/PNZKTLiUoiPLa5NAGpM8biivqMQsTuiya5RDqfSQpjFpzXgYEuwNPJd3OBwQ
 ObQPUbVOF8tupz6pbJgbk1UwLat38tfHnfUARyJKio6OYjy9NQiR1r3R2xi6xg2ssJsT
 4zEQ==
X-Gm-Message-State: AAQBX9dgb5CLnnc5aPzLt1Ed78zExMa05pd+gfPL/p0/LNTI7E4qfFNA
 +hjliu6rz3DS0p/m4ZHQ2fc1Uw==
X-Google-Smtp-Source: AKy350btG7JZAXhOS+MiHIcxvyNWthfjiPWQRq04uR4hey+5zvIW3E5kjhsx4yNIl9eMj7A92K+cIQ==
X-Received: by 2002:a0d:e80d:0:b0:541:a219:2b61 with SMTP id
 r13-20020a0de80d000000b00541a2192b61mr3298134ywe.35.1679687787185; 
 Fri, 24 Mar 2023 12:56:27 -0700 (PDT)
Received: from localhost ([2620:0:1035:15:5509:ec45:2b32:b39f])
 by smtp.gmail.com with UTF8SMTPSA id
 o19-20020a81ef13000000b00545a0818500sm579522ywm.144.2023.03.24.12.56.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Mar 2023 12:56:26 -0700 (PDT)
From: Mark Yacoub <markyacoub@chromium.org>
X-Google-Original-From: Mark Yacoub <markyacoub@google.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>
Subject: [PATCH v7 08/10] dt-bindings: msm/dp: Add bindings for HDCP registers
Date: Fri, 24 Mar 2023 15:55:52 -0400
Message-Id: <20230324195555.3921170-9-markyacoub@google.com>
X-Mailer: git-send-email 2.40.0.348.gf938b09366-goog
In-Reply-To: <20230324195555.3921170-1-markyacoub@google.com>
References: <20230324195555.3921170-1-markyacoub@google.com>
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
Cc: suraj.kandpal@intel.com, devicetree@vger.kernel.org,
 Mark Yacoub <markyacoub@chromium.org>, intel-gfx@lists.freedesktop.org,
 dianders@chromium.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, seanpaul@chromium.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sean Paul <seanpaul@chromium.org>

Add the bindings for the MSM DisplayPort HDCP registers
which are required to write the HDCP key into the display controller as
well as the registers to enable HDCP authentication/key
exchange/encryption.

Cc: Rob Herring <robh@kernel.org>
Cc: Stephen Boyd <swboyd@chromium.org>
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Sean Paul <seanpaul@chromium.org>
Signed-off-by: Mark Yacoub <markyacoub@chromium.org>

---
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
Changes in v4.5:
-Remove maxItems from reg (Rob)
-Remove leading zeros in example (Rob)
Changes in v5:
-None
Changes in v6:
-Rebased: modify minItems instead of adding it as new line.
Changes in v7:
-Revert the change to minItems
-Added the maxItems to Reg

 .../devicetree/bindings/display/msm/dp-controller.yaml     | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index 774ccb5184b88..c47ade3a4ae17 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -31,6 +31,8 @@ properties:
       - description: link register block
       - description: p0 register block
       - description: p1 register block
+      - description: (Optional) Registers for HDCP device key injection
+      - description: (Optional) Registers for HDCP TrustZone interaction
 
   interrupts:
     maxItems: 1
@@ -158,6 +160,7 @@ allOf:
         aux-bus: false
         reg:
           minItems: 5
+          maxItems: 7
       required:
         - "#sound-dai-cells"
 
@@ -175,7 +178,9 @@ examples:
               <0xae90200 0x200>,
               <0xae90400 0xc00>,
               <0xae91000 0x400>,
-              <0xae91400 0x400>;
+              <0xae91400 0x400>,
+              <0xaed1000 0x174>,
+              <0xaee1000 0x2c>;
         interrupt-parent = <&mdss>;
         interrupts = <12>;
         clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
-- 
2.40.0.348.gf938b09366-goog

