Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A464C54F584
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jun 2022 12:36:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97E1C11A9A0;
	Fri, 17 Jun 2022 10:36:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41E3311A991
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 10:36:19 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id c2so6336092lfk.0
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 03:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+mbF+CT4pj0sqOG4T30LpuUV61IhgblfEF1NrGou+hc=;
 b=kx4PfLy2XLmc8jxKBvCw5y+bwlmV5LhtLO3ZV3A/LS5GqtkQDVOaiRGkIWzZIoVFsy
 ETBCtf0RCSBO4mgakTkVDr0ZCygFPtjWf1pE6rPf7dxjqEZyNszlv2709v/GZkwauE7z
 HWndjnaUKvNquf+3uL5laRFKMqMBp0Oia50ho90s1CAYpW0tIOQHilUH7NwnzVPXjuTv
 h5w9MepAt61gsMO2hA57hk4h28oW8of6+JvN1jhBNHdyTLTQ/RSeZciiOJ/Z711E45t+
 mg72oZRK6I2dDL1509XFIuZthHQUuU1vdJ2C0oK42L2z8UVUHs9w+UcQeQa6FT2E4Sh0
 ChSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+mbF+CT4pj0sqOG4T30LpuUV61IhgblfEF1NrGou+hc=;
 b=4b4cbGZLiaEu9jcvZNUd/32OKutzMZ1VC6sgUkLkg2Cu1Nv1Kr2Y0wC7L9toqRc469
 5UWQkby/9eWCCxQ8fsmuu3IgymigfgjSab/nI54dkIIVb2dSO0OhaCigfjQl6kKtYVba
 4LHBwLRfDZzVLTu3JF9Zlgd1m0QbcuwCe0dci4eamBdYPBwE/UQf8T7za/HCJmuahxO1
 GzRJtL7N73wP+1UWTsQ2wcap50Tv+axr9Z59VrsgPudg7ZfzgfykL/YdtGmZ6q3EebsW
 vNqmDDwkT5kkLUt2wGeYyeJQyQxppSilka3HPJrLDodtDrlLfaa60LW8dKtLE6OOs5qx
 ajlw==
X-Gm-Message-State: AJIora8xIne6W6aUgCnRlCtaQloSF4GBgTsDUvb/bezi6LBSB8eol2av
 tw4k630RN2CoUf8CFQuG8pGOHQ==
X-Google-Smtp-Source: AGRyM1sKdiIYMNjTRBjuxiCZLxXGBdUfp5MBs0U9Q+lvXrTgNjerprVbhOZjK57i7s5XIItJ9Jcy4w==
X-Received: by 2002:a05:6512:3a93:b0:479:76e7:3861 with SMTP id
 q19-20020a0565123a9300b0047976e73861mr5188182lfu.446.1655462177295; 
 Fri, 17 Jun 2022 03:36:17 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 d3-20020a056512368300b00478ff020832sm591803lfs.106.2022.06.17.03.36.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jun 2022 03:36:16 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH 1/3] dt-bindings: phy: qcom,hdmi-phy-qmp: add clock-cells
Date: Fri, 17 Jun 2022 13:36:06 +0300
Message-Id: <20220617103608.605898-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220617103608.605898-1-dmitry.baryshkov@linaro.org>
References: <20220617103608.605898-1-dmitry.baryshkov@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, linux-phy@lists.infradead.org,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As the QMP HDMI PHY is a clock provider, add constant #clock-cells
property. For the compatibility with older DTs the property is not
marked as required.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/phy/qcom,hdmi-phy-qmp.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,hdmi-phy-qmp.yaml b/Documentation/devicetree/bindings/phy/qcom,hdmi-phy-qmp.yaml
index eea2e02678ed..1ada0d9857c0 100644
--- a/Documentation/devicetree/bindings/phy/qcom,hdmi-phy-qmp.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,hdmi-phy-qmp.yaml
@@ -44,6 +44,9 @@ properties:
   vddio-supply:
     description: phandle to VDD I/O supply regulator
 
+  '#clock-cells':
+    const: 0
+
   '#phy-cells':
     const: 0
 
@@ -78,6 +81,7 @@ examples:
                <&gcc 214>;
       clock-names = "iface",
                     "ref";
+      #clock-cells = <0>;
       #phy-cells = <0>;
 
       vddio-supply = <&vreg_l12a_1p8>;
-- 
2.35.1

