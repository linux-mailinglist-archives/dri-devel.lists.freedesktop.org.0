Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3A7E50EB00
	for <lists+dri-devel@lfdr.de>; Mon, 25 Apr 2022 23:07:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4F4F10E22F;
	Mon, 25 Apr 2022 21:07:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6C5B10E22F
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Apr 2022 21:07:15 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id c12so28323496plr.6
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Apr 2022 14:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fYD/F2OSbA7Q4eCV40OrtxHiQtAfyrFTFEIn6t3W6f8=;
 b=WvFR64qpnd4yCLm8ubU/W/DeKgWVe5sf1D05fbZmkSyTq8yGSG6v5hnDff1XSYazp6
 83XXw1NiHbANd+TaAV+ZBDA2iYhNtL67l2+aocpmUGDCinB5/oxcsmHaIHzPCmL0lSdx
 g5TTDnxbPbEk7GACTTB9R3BKu9hJsSL5XH2GA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fYD/F2OSbA7Q4eCV40OrtxHiQtAfyrFTFEIn6t3W6f8=;
 b=dacypHosqDleAzPuy0KcoCPhmMnrWJI8B0jrjiC3as0P55UHwJuIbyCghaNgMhgsUU
 7FlXIl3AL13MSi3g35IOtXtfhEU00c1mO9JHOiIFzotkaw4JSlD8H0xBn0DF2wNX5Xmk
 rXwuWcEAqiM6Oqc5zDwj0hndEP+9JEZ9UQ6qNNk/FeqyeasPvNw3yCjUHgDah0S+v/qK
 nDnFu/S7r5TYUl4+3o35yD82M0HbR2uySMd3bt5c0XskVn4iIybggMXOp40iqgDxG12P
 0EDEmSMLgfBHJw9OmyeRHbDv5wdNpZ7Ec3Yp4lCNDpOZvlbvUoexdQ7I0XdJgZjCFznk
 hNJQ==
X-Gm-Message-State: AOAM533LMnREqdFmqQcBapGW/wPQl9ilsGyhVAJj43Nd/5Za7mv+wTdl
 M8B8B9h4eAL0gEtIPhuIv4a87g==
X-Google-Smtp-Source: ABdhPJyG9Xx7/t8cUKO2ub7bBhrSNggYmBrlKgygY827SF0gU8Mp7i0d+ErwAnNSiBQq7WdPpARN0w==
X-Received: by 2002:a17:902:ed89:b0:15a:d3e:ada6 with SMTP id
 e9-20020a170902ed8900b0015a0d3eada6mr20094621plj.94.1650920835532; 
 Mon, 25 Apr 2022 14:07:15 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:b820:7f63:f3dd:3da])
 by smtp.gmail.com with ESMTPSA id
 b20-20020a62a114000000b0050d231e08ffsm8523202pff.37.2022.04.25.14.07.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Apr 2022 14:07:15 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@chromium.org>
Subject: [PATCH 2/2] dt-bindings: phy: List supplies for qcom,edp-phy
Date: Mon, 25 Apr 2022 14:06:43 -0700
Message-Id: <20220425140619.2.Iae013f0ff4599294189f3a6e91376fad137bbabf@changeid>
X-Mailer: git-send-email 2.36.0.rc2.479.g8af0fa9b8e-goog
In-Reply-To: <20220425210643.2420919-1-dianders@chromium.org>
References: <20220425210643.2420919-1-dianders@chromium.org>
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
Cc: quic_kalyant@quicinc.com, devicetree@vger.kernel.org,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 Douglas Anderson <dianders@chromium.org>, linux-arm-msm@vger.kernel.org,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Kishon Vijay Abraham I <kishon@ti.com>, Andy Gross <agross@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-phy@lists.infradead.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We're supposed to list the supplies in the dt bindings but there are
none in the eDP PHY bindings.

Looking at the driver in Linux, I can see that there seem to be two
relevant supplies: "vdda-phy" and "vdda-pll". Let's add those to the
bindings.

NOTE: from looking at the Qualcomm datasheet for sc7280, it's not
immediately clear how to figure out how to fill in these supplies. The
only two eDP related supplies are simply described as "power for eDP
0.9V circuits" and "power for eDP 1.2V circuits". From guessing and
from comparing how a similar PHY is hooked up on other similar
Qualcomm boards, I'll make the educated guess that the 1.2V supply
goes to "vdda-phy" and the 0.9V supply goes to "vdda-pll" and I'll use
that in the example here.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
index a5850ff529f8..cf9e9b8011cb 100644
--- a/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
@@ -41,6 +41,9 @@ properties:
   "#phy-cells":
     const: 0
 
+  vdda-phy-supply: true
+  vdda-pll-supply: true
+
 required:
   - compatible
   - reg
@@ -65,5 +68,8 @@ examples:
 
       #clock-cells = <1>;
       #phy-cells = <0>;
+
+      vdda-phy-supply = <&vdd_a_edp_0_1p2>;
+      vdda-pll-supply = <&vdd_a_edp_0_0p9>;
     };
 ...
-- 
2.36.0.rc2.479.g8af0fa9b8e-goog

