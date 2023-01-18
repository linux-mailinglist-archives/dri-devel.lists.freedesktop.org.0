Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 952D7671277
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 05:13:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 242D510E672;
	Wed, 18 Jan 2023 04:12:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF50E10E666
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jan 2023 04:12:51 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id u19so80210773ejm.8
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jan 2023 20:12:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Lf6psy7ntm6XZpjeMKG29URoVYD787zn4N0Bmfpn80k=;
 b=Rc5PsVd8VGbcigMI4Z3FtmNThwWSo78WsxFbP1hzIVU9g9qdiUmPtA/SBukjqngTqk
 3Kq2Eu8jLKoG/pV6cDlBq72ogNNCF7N4HlG9Eijl28xSnEt2ZalEe0U10NHGYo3gEaVn
 uYX5du0E/ONU9zPYL1o2GT10xMC+ZImsVw73pRjBfayAbi4sgPcWXayxdGPBn34XmT01
 tHJyqWsEvmoia1BdYCLIdkq1NNWEDPz8vUJ7hmwsZhSN+UqAaUWQvGPU33TEtAUsHH3d
 LytpRfVtNa86CFbk4N0T6jfdYQw+zxJLlT7QYC3XoPhvmFAagGSIwGo8sgyb++8bGfbG
 RA/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Lf6psy7ntm6XZpjeMKG29URoVYD787zn4N0Bmfpn80k=;
 b=qcSzb8Dgd4Qw4T+6nXene4JIimQwnrISwwh6yq6HZ5ki2B7HD7d2eB77qdwsmTI0us
 LI1pp2dEE/jxbDSm6ygA+aeKZ1krBgGf2pAWGEwvblHtuWA8zZkVwxhyzX8Gzlli7JYS
 Aj2BG7/z+H0+DTItLsFVCZQyMWztnjXnEiCfwKebY7W0cvO5v1H02u7OG1s+cdZ+LZQD
 +EovSZVs+5jJoqcoqs9CYdQSksGCGmVlEod/y2kmv3y3g3uYYSAYIicxI1db5pXNnIP1
 I9Ix6VHYF1LWcF1hFAburMSskj/MQcThdrYddogOjdiNUE2G6rrpGIQJVTli912PQF4n
 86rg==
X-Gm-Message-State: AFqh2kod6hTiImedR61TY0V5iIB/63Z59YePr2Wa7zUzsvRJFdIawjN9
 /whmQqbfxq67iXEZA8Ma4Jj6ag==
X-Google-Smtp-Source: AMrXdXvuKZhpqF2/x8IoKKviUMJGD5ImMcpEu1VkcOiN4uEhFIcUnqWSluOAI7Fcin1+IoBXBvqhnw==
X-Received: by 2002:a17:906:7185:b0:81b:fc79:be51 with SMTP id
 h5-20020a170906718500b0081bfc79be51mr5285245ejk.50.1674015170410; 
 Tue, 17 Jan 2023 20:12:50 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 hp24-20020a1709073e1800b008720c458bd4sm2314100ejc.3.2023.01.17.20.12.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 20:12:50 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v7 04/11] dt-bindings: display/msm: rename mdss nodes to
 display-subsystem
Date: Wed, 18 Jan 2023 06:12:36 +0200
Message-Id: <20230118041243.1720520-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230118041243.1720520-1-dmitry.baryshkov@linaro.org>
References: <20230118041243.1720520-1-dmitry.baryshkov@linaro.org>
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

Follow the 'generic names' rule and rename mdss nodes to
display-subsystem.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---

Note, this patch might generate warnings in qcom,sm6115-mdss and
qcom,qcm2290-mdss examples, but they have been fixed by the commit
e5266ca38294 ("dt-bindings: display: msm: Rename mdss node name in
example")

See https://gitlab.freedesktop.org/drm/msm/-/commit/e5266ca38294


---
 .../devicetree/bindings/display/msm/mdss-common.yaml      | 8 ++++++++
 .../devicetree/bindings/display/msm/qcom,mdss.yaml        | 5 ++++-
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/mdss-common.yaml b/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
index 59f17ac898aa..ccd7d6417523 100644
--- a/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
+++ b/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
@@ -15,7 +15,15 @@ description:
   Device tree bindings for MSM Mobile Display Subsystem(MDSS) that encapsulates
   sub-blocks like DPU display controller, DSI and DP interfaces etc.
 
+# Do not select this by default, otherwise it is also selected for qcom,mdss
+# devices.
+select:
+  false
+
 properties:
+  $nodename:
+    pattern: "^display-subsystem@[0-9a-f]+$"
+
   reg:
     maxItems: 1
 
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
index 461cb13c7092..7dceb2c54edd 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
@@ -15,6 +15,9 @@ description:
   encapsulates sub-blocks like MDP5, DSI, HDMI, eDP, etc.
 
 properties:
+  $nodename:
+    pattern: "^display-subsystem@[0-9a-f]+$"
+
   compatible:
     enum:
       - qcom,mdss
@@ -144,7 +147,7 @@ examples:
   - |
     #include <dt-bindings/clock/qcom,gcc-msm8916.h>
     #include <dt-bindings/interrupt-controller/arm-gic.h>
-    mdss@1a00000 {
+    display-subsystem@1a00000 {
         compatible = "qcom,mdss";
         reg = <0x1a00000 0x1000>,
               <0x1ac8000 0x3000>;
-- 
2.39.0

