Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B156661E0B
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 05:55:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91A5C10E271;
	Mon,  9 Jan 2023 04:55:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CE8D10E271
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jan 2023 04:55:01 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id v25so11197564lfe.12
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Jan 2023 20:55:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=DID9COo2nYdAarXKNZ2YWNnEFoeCTLjj4eRpr+otzXU=;
 b=JFKOXyrqCGKt1n2jdk/oQP95R+pLTHiofilXEf0zrvpIGm7uA1dtD+GpX0QXXo9nUl
 M4teUQplHS8NRAPPzBKuDcajxXiJg0GiqMea5bSsjayajdF7n3gMYtaJRCkYkhGjj7zX
 XvGad7N7+dHCcWlN9GYsP/gueVHZXykURyVxeQF+9lnk0Cw2kll44jP0zdDKZq/nq0Mr
 Etoql/Dv/JLWatxCffL/uPivB7I/Wb26MBF66fUTSv+0AqRf5jF+f9090271KyyNsfDz
 mY1EIx13sJc/CGrc6QcXJWEeEcmCVUHJl2Yqpz0ZDnuoEp1bvjEUQa6pj0aWEypvw5rJ
 CdMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DID9COo2nYdAarXKNZ2YWNnEFoeCTLjj4eRpr+otzXU=;
 b=xaj3RZ1P1c2TgiyEDmwcQ1Nl1ON7VOkpQOSzkkD8THXznTZiJlV0Tyyfu5P7taXMTk
 khU0bOgLo1m2e+e1GBuE4R4H+SoVLjRzjCJDHQa/DqhAGzrWI8JQX6XY0fQtOPTyvL/I
 uoIkd8C1IGk5xjdYYVAO63imCCYU1EudnVpIevT0MTDY1iMfYsokYL2jt7O9b84vLIOz
 vA8EjXGKFIx7qk/q5RrlXlBfbMQfTzOAtWSDZu3xyJteW8tZlNJ2s4EGlsVaWrHj9VKn
 a6DoWBth+AVpuG1A7IpwR60db9MfRLxzhjwgKYL+59WX6DfblOuAlF3q6w2o5HS7dUlx
 TkBg==
X-Gm-Message-State: AFqh2kqt7dQ0mmIc4KYrVVCaxhpfB4HE/4k4XHx1QOEvX0xDxDT0bt0s
 UcNXvYJVY10VRf5UCrERbW3MDQ==
X-Google-Smtp-Source: AMrXdXsF163H4fyf+LIUaMixbRv3n5SksxhxqwQ2uZfZkoazcmt9VWBTcLHEZ+STMU/9PNXpVPlEhw==
X-Received: by 2002:a05:6512:3b87:b0:4a4:68b7:d623 with SMTP id
 g7-20020a0565123b8700b004a468b7d623mr21040244lfv.10.1673240099760; 
 Sun, 08 Jan 2023 20:54:59 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 f21-20020ac25335000000b004b57a810e09sm1417235lfh.288.2023.01.08.20.54.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jan 2023 20:54:59 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH] dt-bindings: display/msm: qcom,
 sdm845-mdss: document the DP device
Date: Mon,  9 Jan 2023 06:54:58 +0200
Message-Id: <20230109045458.316114-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
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
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Document the DP controller added to the sdm845 display subsystem.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml   | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml
index 300d8f1ac45c..8f60be6147d8 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml
@@ -46,6 +46,12 @@ patternProperties:
       compatible:
         const: qcom,sdm845-dpu
 
+  "^displayport-controller@[0-9a-f]+$":
+    type: object
+    properties:
+      compatible:
+        const: qcom,sdm845-dp
+
   "^dsi@[0-9a-f]+$":
     type: object
     properties:
-- 
2.39.0

