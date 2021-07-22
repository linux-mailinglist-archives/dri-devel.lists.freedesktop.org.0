Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75B483D1BE4
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jul 2021 04:44:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE9516EE9A;
	Thu, 22 Jul 2021 02:44:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [IPv6:2607:f8b0:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AC7F6EE94
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 02:44:12 +0000 (UTC)
Received: by mail-ot1-x332.google.com with SMTP id
 f93-20020a9d03e60000b02904b1f1d7c5f4so451344otf.9
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 19:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MS6mraKNigkKOXB/hgjulPSCM2yRlqN2uoBBxxKVwTA=;
 b=z5cEQ5HwZy9cTyIhfxc5PZgxuUQae88VaPXcolle0LA4mxwW5kYraR3GpN/EW8J8Eh
 IOBlIeS4wRe3w+fTRbu14xlJ38Jo9YmjMYy+tZgMisWvQ/PfPsJjCwBaxTL+aaq3xUou
 h5680hBeio40Oms+w7uNvWOmD7RaNtBVnRMfdlp/tWgjsmEUDDTafy9bytnngOF+Yxja
 gjw6vax6X2GZqox1hP0bffCa6tt2FTU/2ZvG+nYhrjpIdUGL2HKfUdmZoAl9gI7fOXiu
 fbXgs6WyE8lr+COg/7PCUV7ZMYKJtrlnWdPYm+ygMbBzGyXQwicPRjzNHeoKODRLNJWw
 MyDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MS6mraKNigkKOXB/hgjulPSCM2yRlqN2uoBBxxKVwTA=;
 b=aIm3ZFA9+SpEOdPyowIElVXijX7lfX/2dHQsYgjfOcqwhRc7Zb2pKuGM1ETJKfJ0up
 y5V4f1AUT5XIJVlGfnzW1wcwjcy3nehpMC15jz8V3BxGf8ZqLtRF8wP1ehX+FOWfpk+S
 5edu92HbtM136Yj5WYIGiawZBXtdEiMuIph0xLJEmkLKajlzipNhC3g9TtgubHHC9FgE
 Bc5weG/Fui7t/9VF1nDQCCx7MswdM4/jr0lEko3+lFGh2tb3xkLN9CSKfjoxkd8/0328
 1lyBup6VuRXbV9IFzF9osqFJsJobXMzqssdJjjcbQk2f+LQTQu/tuTPARw1ud4ju3aBk
 d0pQ==
X-Gm-Message-State: AOAM530uL83KNK7gEi/qR1kFbmE8S++l373GjRvuNICGQQxriL0WUgoN
 ADi7LZ8ntmS1G3GuvjxVZR8vCw==
X-Google-Smtp-Source: ABdhPJwxJKJoRHACBlCRhC1wTHOjaagQ66oQDTdk/KvD7hHQHiuM5LOfacjgqpVgp2acBRiGESoHAQ==
X-Received: by 2002:a9d:7dcf:: with SMTP id k15mr21901596otn.201.1626921851922; 
 Wed, 21 Jul 2021 19:44:11 -0700 (PDT)
Received: from localhost.localdomain
 (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id u18sm5346519oif.9.2021.07.21.19.44.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jul 2021 19:44:11 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Stephen Boyd <swboyd@chromium.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Subject: [PATCH 1/5] dt-bindings: msm/dp: Change reg definition
Date: Wed, 21 Jul 2021 19:42:23 -0700
Message-Id: <20210722024227.3313096-2-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210722024227.3313096-1-bjorn.andersson@linaro.org>
References: <20210722024227.3313096-1-bjorn.andersson@linaro.org>
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Kuogee Hsieh <khsieh@codeaurora.org>, Tanmay Shah <tanmay@codeaurora.org>,
 freedreno@lists.freedesktop.org, Chandan Uddaraju <chandanu@codeaurora.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

reg was defined as one region covering the entire DP block, but the
memory map is actually split in 4 regions and obviously the size of
these regions differs between platforms.

Switch the reg to require that all four regions are specified instead.
It is expected that the implementation will handle existing DTBs, even
though the schema defines the new layout.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 .../bindings/display/msm/dp-controller.yaml           | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index 64d8d9e5e47a..a6e41be038fc 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -19,7 +19,11 @@ properties:
       - qcom,sc7180-dp
 
   reg:
-    maxItems: 1
+    items:
+      - description: ahb register block
+      - description: aux register block
+      - description: link register block
+      - description: p0 register block
 
   interrupts:
     maxItems: 1
@@ -100,7 +104,10 @@ examples:
 
     displayport-controller@ae90000 {
         compatible = "qcom,sc7180-dp";
-        reg = <0xae90000 0x1400>;
+        reg = <0xae90000 0x200>,
+              <0xae90200 0x200>,
+              <0xae90400 0xc00>,
+              <0xae91000 0x400>;
         interrupt-parent = <&mdss>;
         interrupts = <12>;
         clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
-- 
2.29.2

