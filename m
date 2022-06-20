Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A9DD0550E44
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jun 2022 03:03:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF85E11308E;
	Mon, 20 Jun 2022 01:03:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17728113090
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jun 2022 01:03:06 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id w9so1218853lji.4
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Jun 2022 18:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Aq9g/wDzsIqQecRl2cJJ+5IocI39Htj97JGHlen04Z4=;
 b=rzWWUU/x8NNpQ4kYJA2bz7B4zeXB5TlPFwvd1Dzpr9/2yiGHMMQ6oMRmJYdPDcFKJ7
 x7DTkbWx+P6bWWEMdCLW1zsHOC5JczWXdt0huzvyifxRT5iH93gX/JUeZokIlDlFw1P/
 50LXGRU0gJlNjAajBraevzzoSscrhG8DJCDewaNIorLEG5IkZ1zUdxXNpiQnQXqK8UHW
 aBl5QAURdwuChEPqsjeloudpaZAgVd8mp4GGIBW+EUqh9RNWy2Gw66roJb36ocxbxP6t
 k8kcdWRhkOmaYp5yoXT/MtLrTKFCr8zE8M5YDCZj/AUp17BwiYJBsCZ8B7ImIopP+IDi
 U6uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Aq9g/wDzsIqQecRl2cJJ+5IocI39Htj97JGHlen04Z4=;
 b=aKTcC1mPqzQ9GQz1X1CsqebtDSt58WY5f1L4skG4NG1REaMUsv4onosS5AV+QX0aQt
 Ab87shpBrd1/JFEy/MYIM8RefA54d1tL+lMG+DjOGjm5G0X5UTVWogPMviwj1uyC5gv5
 xWdFZFWMuEPbebyqIGf3B084WxeDn7SIvvWk3MxW4P2Cm8/5zUiXwV4MCivkrqtMfYCs
 XGLx0pYFqoXN4Q6LmUHvhO18ydSkgPFR18L/YNdgIhOSyQmPnh4lTm4T4ODzFzaea+ag
 ccvg08j83h6J6MK5Kr5WTiD9uOjEE9M2XNDlPY0xSvS6axM4YhvAwUv1WawmJW49Ks8F
 16bA==
X-Gm-Message-State: AJIora9TTmn2VNUIA+U6O9WkLfGWFgREQjEWVEKcl0zaTqsLCW/VsC1v
 BBQWdSXnBOAxMox6uYRKHayGKw==
X-Google-Smtp-Source: AGRyM1uVUKJ2MrHi+briVhJofI8k8bmYZztVJLPfNEu18XPV559iKEfxeDHvfTNlP5xg79FHoXwuSw==
X-Received: by 2002:a2e:a911:0:b0:25a:53dc:82b2 with SMTP id
 j17-20020a2ea911000000b0025a53dc82b2mr6706463ljq.341.1655686984315; 
 Sun, 19 Jun 2022 18:03:04 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 a1-20020a19e301000000b00477a6c86f17sm1550334lfh.8.2022.06.19.18.03.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Jun 2022 18:03:02 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v2 1/3] dt-bindings: phy: qcom,
 hdmi-phy-qmp: add clock-cells and XO clock
Date: Mon, 20 Jun 2022 04:02:58 +0300
Message-Id: <20220620010300.1532713-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220620010300.1532713-1-dmitry.baryshkov@linaro.org>
References: <20220620010300.1532713-1-dmitry.baryshkov@linaro.org>
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
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As the QMP HDMI PHY is a clock provider, add constant #clock-cells
property. For the compatibility with older DTs the property is not
marked as required. Also add the XO clock to the list of the clocks used
by the driver.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/phy/qcom,hdmi-phy-qmp.yaml | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,hdmi-phy-qmp.yaml b/Documentation/devicetree/bindings/phy/qcom,hdmi-phy-qmp.yaml
index eea2e02678ed..41e6492d4a0f 100644
--- a/Documentation/devicetree/bindings/phy/qcom,hdmi-phy-qmp.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,hdmi-phy-qmp.yaml
@@ -28,12 +28,14 @@ properties:
       - const: hdmi_phy
 
   clocks:
-    maxItems: 2
+    minItems: 2
+    maxItems: 3
 
   clock-names:
     items:
       - const: iface
       - const: ref
+      - const: xo
 
   power-domains:
     maxItems: 1
@@ -44,6 +46,9 @@ properties:
   vddio-supply:
     description: phandle to VDD I/O supply regulator
 
+  '#clock-cells':
+    const: 0
+
   '#phy-cells':
     const: 0
 
@@ -75,9 +80,12 @@ examples:
                   "hdmi_phy";
 
       clocks = <&mmcc 116>,
-               <&gcc 214>;
+               <&gcc 214>,
+               <&xo_board>;
       clock-names = "iface",
-                    "ref";
+                    "ref",
+                    "xo";
+      #clock-cells = <0>;
       #phy-cells = <0>;
 
       vddio-supply = <&vreg_l12a_1p8>;
-- 
2.35.1

