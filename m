Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC6EC430550
	for <lists+dri-devel@lfdr.de>; Sun, 17 Oct 2021 00:17:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB6E86E8FF;
	Sat, 16 Oct 2021 22:17:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com
 [IPv6:2607:f8b0:4864:20::c30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 685296E8F2
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Oct 2021 22:17:01 +0000 (UTC)
Received: by mail-oo1-xc30.google.com with SMTP id
 k11-20020a4aa5cb000000b002b73749f3cdso823871oom.4
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Oct 2021 15:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YCldvVc/GAW/slmnXCOBbon0kUi8IujN99j0wGc0Qok=;
 b=IczW/rI+KCJMj4UJ0xuZXt8fK4/dUd6jCLECu9YvS8izjoIBu2E54TmymUBMFMW3vi
 WcAoFcM/ewacm0E9evClgmk52nGAOX/t8HljhwY4Yuucfp6tXg9KFWeFbWWddo/y4F8K
 nd5uKet4+hVNTszkYWEfis2J1c24NdiI3TzK5kC+p+JMgJdGxrLALklYowjCFj1rrQmi
 VEm3J1/eEUbiaanf5OCaNRrMidNBBgYh6L+8rszeegK1B3ebutu9+F/vFFJun2A+ODoz
 zZF8UMA/jMHSTpnwHgR9Ys6t600eHl2jutiziHBDHwhz5gl+6HDGMJZqPRyIXSjsruN4
 Z35A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YCldvVc/GAW/slmnXCOBbon0kUi8IujN99j0wGc0Qok=;
 b=HMY0ksCd3OEcaeZ1nNAZWKY/NIf56TLrqETmHksCr8aJu2oF27Eo2PgsN+GKTPR3XH
 LDSopOMY3a7q1VhLqt8HJ+QSAzzSIKVMMb6dg5wWGS6U1jmyieba/uGuF4qdR9OazRIs
 PTVVQmIKTV1rqFhFwh+J5vdVZrSoKDR26TMlyBXyFlDad7oPOXQfm0CoEsAIOUXG5TUU
 b5ChIYYO3GTme+hfS+n80EGexFglLCvtBwNnSpqkyRMBIegPGZWP9Y+HfjGs0y1zP+2T
 aDtX5gSsIEKhH2oniJr6ghmdDuqYBeCGce8hSJ/LL4rnoAr8cuFy4kNvANOsd9dB4xd1
 PYCA==
X-Gm-Message-State: AOAM530RAxvhIyad2rSza3TOxYwchiZudfpORK/0mWi6yMq8L/pPh6kA
 nHNqwBeXenepHje9oODNEl15dg==
X-Google-Smtp-Source: ABdhPJw9eAziXbPqcUM3c4j08KGbMhhUyk8hEsiILchOvxT7cjtqsS0/2BYQFMDISFiJeGTW/t7Vgg==
X-Received: by 2002:a4a:a847:: with SMTP id p7mr11089393oom.78.1634422620720; 
 Sat, 16 Oct 2021 15:17:00 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
 by smtp.gmail.com with ESMTPSA id
 d15sm1747058oic.32.2021.10.16.15.16.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Oct 2021 15:17:00 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Kalyan Thota <kalyan_t@codeaurora.org>,
 Kuogee Hsieh <khsieh@codeaurora.org>
Cc: Rob Herring <robh+dt@kernel.org>, Stephen Boyd <swboyd@chromium.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 6/7] dt-bindings: msm/dp: Add SC8180x compatibles
Date: Sat, 16 Oct 2021 15:18:42 -0700
Message-Id: <20211016221843.2167329-7-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20211016221843.2167329-1-bjorn.andersson@linaro.org>
References: <20211016221843.2167329-1-bjorn.andersson@linaro.org>
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

The Qualcomm SC8180x has 2 DP controllers and 1 eDP controller, add
compatibles for these to the msm/dp binding.

Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v4:
- None

 .../devicetree/bindings/display/msm/dp-controller.yaml          | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index 6bb424c21340..63e585f48789 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -17,6 +17,8 @@ properties:
   compatible:
     enum:
       - qcom,sc7180-dp
+      - qcom,sc8180x-dp
+      - qcom,sc8180x-edp
 
   reg:
     items:
-- 
2.29.2

