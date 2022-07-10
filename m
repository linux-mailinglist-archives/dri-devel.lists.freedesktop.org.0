Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE6E156CDFC
	for <lists+dri-devel@lfdr.de>; Sun, 10 Jul 2022 10:42:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1636F11BFE6;
	Sun, 10 Jul 2022 08:41:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5155111BF6C
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Jul 2022 08:41:44 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id z25so4258752lfr.2
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Jul 2022 01:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uL7wiVg1RgrpxbM/E5AHKRDJeIFgAkbS4akWzL7eFSM=;
 b=cduRVgw3BOsc7BKIWJ1NZS3FAwj24GNmlO+somU5Bcit3gf6AnzVVzJuU7gvux7O9D
 8uZq4Y0nZ9o0Fl9dGvnGSPVmHmQq5TvJiAxnR3omUILA8LD5HNoSh0NmPyyLe1qMhEhd
 IZvhJapk8M18k5UF07RQ7eXmXRqXpRNrM01qOzVPGtudfIRS4irAPRcLoM7JrRZwL8jt
 Etxj+Q9GX6u9Z/EavcWWVNjqj669zdSyqJEQkFzojAX+aIr8OVm6cx1BPH5Gh4KwzUQn
 Wfhb7W1bzbaOlWvZbT2c3nSayub/Tn66VZdgKcboKKsRCIr+CH4ibLKSLZ/mnO708moY
 LjnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uL7wiVg1RgrpxbM/E5AHKRDJeIFgAkbS4akWzL7eFSM=;
 b=YDJJD3aIfj+KojBGW2KzU2hiMEdpha6mfwyJMb0CS9GYeqCnVTYt1qJt77epEHSz11
 aq4cgSL9Wtn7vepjQqCoR2eNW6mPryg6X/E7vU9jh3Q4wOB6GzjMIym2fSN4NCWEVmfg
 U04nKtxKKv40YK012FhryJ6Cepsmj9As7WvhC3fsmOkNdyNUiGLM7le+Jsb31Er0kfcJ
 r0NFRvtm/5e3aK4xOOGO+Bz4GOButG8mtx5Uy2O+661JKdSO3O8K2gWx17XSRzbcW+PZ
 C0Umacppm49UdaP7oLGExnfrpYFP0pbYzFXKSQfzVzefy85RkYVG9USjOGAWYlZoI/iJ
 pTHg==
X-Gm-Message-State: AJIora+R3ed6pRXQa1Zgz1/o7tjhUPgPTomCFexH3DXJUsqeRQgHNLYe
 eXRjYNpmkpd6gXHH3DuEkgW6/A==
X-Google-Smtp-Source: AGRyM1v3sQKMx15SYFl9GMpgtDEpQhV6ZiOxRN71c1mR6H49vk4tEqt3nmzxHSnEcHRz4fU7sQn+Ag==
X-Received: by 2002:a05:6512:e93:b0:486:5c68:e46d with SMTP id
 bi19-20020a0565120e9300b004865c68e46dmr8631570lfb.670.1657442502675; 
 Sun, 10 Jul 2022 01:41:42 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 i21-20020a2ea235000000b0025d4addbad4sm912536ljm.91.2022.07.10.01.41.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Jul 2022 01:41:42 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v2 7/9] dt-bindings: msm/dp: mark vdda supplies as deprecated
Date: Sun, 10 Jul 2022 11:41:31 +0300
Message-Id: <20220710084133.30976-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220710084133.30976-1-dmitry.baryshkov@linaro.org>
References: <20220710084133.30976-1-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The commit fa384dd8b9b8 ("drm/msm/dp: delete vdda regulator related
functions from eDP/DP controller") removed support for VDDA supplies
from the DP controller driver. These supplies are now handled by the eDP
or QMP PHYs. Mark these properties as deprecated and drop them from the
example.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/display/msm/dp-controller.yaml   | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index 94bc6e1b6451..391910d91e43 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -76,8 +76,10 @@ properties:
   "#sound-dai-cells":
     const: 0
 
-  vdda-0p9-supply: true
-  vdda-1p2-supply: true
+  vdda-0p9-supply:
+    deprecated: true
+  vdda-1p2-supply:
+    deprecated: true
 
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
@@ -140,9 +142,6 @@ examples:
 
         power-domains = <&rpmhpd SC7180_CX>;
 
-        vdda-0p9-supply = <&vdda_usb_ss_dp_core>;
-        vdda-1p2-supply = <&vdda_usb_ss_dp_1p2>;
-
         ports {
             #address-cells = <1>;
             #size-cells = <0>;
-- 
2.35.1

