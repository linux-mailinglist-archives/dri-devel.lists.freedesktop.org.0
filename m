Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23F23A349C1
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 17:28:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93CF110E117;
	Thu, 13 Feb 2025 16:28:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="xbGpkoru";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE6F510E2B8
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 16:28:04 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-4395578be70so11603235e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 08:28:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739464083; x=1740068883; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=nckyoaf9WMSwIR46ubTH6va+VexZaxBrD6oq84P05tk=;
 b=xbGpkorucW4vWYTacWEOweEpiR0lhlWNkfX3E6/5unwFZh6Ub8C+Befe8Hz+ATobvB
 zpqUksDJmFhQ9aPmWpBdbMvrMhB6BR3eflLpvOkbmnDkQ7zrlbMalTpEMybpE8FJosXX
 lZ7oWQz9GM8bRT6fE+8lkKDkz4LUPS8xiZYO1TRZOXp4F6Zst1xV5ChV6VOPnfkoc/DK
 +RFGDl82aneRpiuOvMa8IL/gwj9+iiQe/dWIDINONgvFjP+s52xYaY+Ro/Qoblas1MZq
 /wgC+8OMxMqnSlCS6prsAAuycuAdl5P2QIXUTFnYLbx5ACTLuF0CZ9SGkQZ/7Ju3RDO2
 KfAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739464083; x=1740068883;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nckyoaf9WMSwIR46ubTH6va+VexZaxBrD6oq84P05tk=;
 b=S3mYWTss1WlVPUcg/mJnUY2vV4E4yea/S743Vv9OTq1B+d9gw/gCS8mbtSFOsq5GAO
 04QWI+t7ELNQB6pYXUGGBiTE/iNqRxZIDbIMqBjrdPzjcRI7BV+URnTOgRiKEK/qgI83
 BgSxt5xBrY45ck142FnpAaXccgXSwyRCCVOHUhwZ6gP7mqCyg2t3BbIPRQ0o8ACU69IS
 HsHI8XJPs4AJFtr5niC5kPI/0wmOh8477Hpv3TRoOJUKHrAr78AvVmTbLrMZIIYJjV3G
 awLsic+F6YQ+GnLkWlrQrt29AR4SIa2YzI+XuogZlz7COhtxCUJV9K20XFpdU1IcAM9j
 fEHQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXSkBsQ2HfgdUr1ebZbCp593iWVBE8BOhWNDkB4qcZU8VRtM+xo0lj5GeDJljDeXY7qTYsw4F4/S6g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzA0r5fbr/ZOOn7us3L7ZPnFT0AyN+69D2fykqLfY24303K14+r
 z7fp/czDf0u1pYsYHPV4KQ0Zt1jS+FGzB/cBXdKaKjfyIX7WgcGh89Oswc+6hG1W//EmNdR7NBb
 o
X-Gm-Gg: ASbGncubC85e+0cS9QwA9e7CGNv2DTEtilJcX4EZYdlR7g5vKsb/0IV5xpePsy2Pfm/
 er11gdFyR6HAfxBUFSNmLZ8rq2y9XVcEAhxo6asIYUqpf8iFdkYVmkQeVgNU8SPGupG+sggSxvD
 R+9UDY9VWTYqjoTidIKn9edIzI1XdlP5lXwbeQjuMrRcNn7eOqGBG/BcnaaFmO0tLjPg1u4C0ya
 XMCJa+ACU5ba6A67VI+QK2iCqOpQKhyZIHt7gD7sSWCFkxdlqh9qWaI719WYGdpt3M+mMd23cIT
 rHCY6Wn5YDzbkneBtQ+bwU++xLr0kEQIbXHH
X-Google-Smtp-Source: AGHT+IELeKCADQgg3H5ZzZcXql0ZPJ1C4Uvb1zOBpoOn1s+Bz0PEz8ZZ92bF4HPtyxGd27LfKSXksQ==
X-Received: by 2002:a05:600c:3544:b0:439:57bb:2aa with SMTP id
 5b1f17b1804b1-43958166727mr107502195e9.11.1739464083323; 
 Thu, 13 Feb 2025 08:28:03 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f258b412esm2274382f8f.1.2025.02.13.08.28.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2025 08:28:03 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 13 Feb 2025 17:27:56 +0100
Subject: [PATCH v4 1/4] dt-bindings: display: qcom,sm8550-mdss: explicitly
 document mdp0-mem and cpu-cfg interconnect paths
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250213-topic-sm8x50-mdss-interconnect-bindings-fix-v4-1-3fa0bc42dd38@linaro.org>
References: <20250213-topic-sm8x50-mdss-interconnect-bindings-fix-v4-0-3fa0bc42dd38@linaro.org>
In-Reply-To: <20250213-topic-sm8x50-mdss-interconnect-bindings-fix-v4-0-3fa0bc42dd38@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1989;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=oNd12i+2YmkCuPYQliiOZGjMa/GCFMaAOwx4UZry5cY=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnrh2PxgSsYod7hW5BPfhjvjXJr3Hpc/Y4nGjmbpLq
 /LWeb26JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ64djwAKCRB33NvayMhJ0Q0WD/
 4qd13mpilaLgIGAOQgbLY3IKdNqPNm5kMS18FEVqOC1wxxdtMXcWQ2TV916MPWxwLWyZ0V+Ogkc7Vm
 wj7AE90w09sWjRWMNFJAaevlVjzFtRj7tg8tLEH2WaojWU91xJZZZxhDjnNImc44IiO4fn0OftaVmo
 2J3PnvAEDJpeDqfcDgBr3MWEm9wHjT/kGPjr6Ahi6f7dKqnFqMKAVBAmXEUx82IxzCaJDdnAoxZAlI
 Dx3TVYX5ofK3S3RyvhvJ9Wj8GwF+I8Apc14DU9RQZyBrtw+1Do6t598lCEFkf5UKGoc2WKNknHRoMS
 VmpNK1g+E9t32NnlryQo/qdHVcNuvEw35dcQe9Xhk2J0gYSiJO1ERiD5D6iCZAoFjwWiqw0JV/QlWk
 ENCrWpIIx3f+xkO2O48CRatyzt/5LHDLM9sprI3wfkgo1IdVeOmjDUzqdgQ6l8P/q8pF6out0DEETR
 apeKJV3LdWurx4UNkET5DYpweh4Gqo4tQLcKHrka/6Nw7/TPoVVTfk19sUnvOgA9GS7U+mkdsT+fqo
 xtRoN+LAo3ESej07wlqYf9wx+qprBUirXwTFlTC3QSOMU3aqiQrC8h5LaoAeYjRswn/7dSfjD+Xclh
 AEW9bbl3X2yhN+fPBK0yTONibKBvxtZ7jAeopKOWiGtzNr7J8t17swEwq47Q==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
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

The mdp1-mem is not supported on the SM8550 SoCs, and having maxItems=2
makes the bindings not clear if mdp0-mem/mdp1-mem or mdp0-mem/cpu-cfg is
required, so explicitly document the mdp0-mem/cpu-cfg interconnect and
add the cpu-cfg path in the example.

Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../devicetree/bindings/display/msm/qcom,sm8550-mdss.yaml  | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8550-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8550-mdss.yaml
index 1ea50a2c7c8e9f420125ad30a80b4ebd05c9367a..59192c59ddb9c126ada43ada1430fa7569651f99 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8550-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8550-mdss.yaml
@@ -30,10 +30,14 @@ properties:
     maxItems: 1
 
   interconnects:
-    maxItems: 2
+    items:
+      - description: Interconnect path from mdp0 port to the data bus
+      - description: Interconnect path from CPU to the reg bus
 
   interconnect-names:
-    maxItems: 2
+    items:
+      - const: mdp0-mem
+      - const: cpu-cfg
 
 patternProperties:
   "^display-controller@[0-9a-f]+$":
@@ -91,9 +95,9 @@ examples:
         reg = <0x0ae00000 0x1000>;
         reg-names = "mdss";
 
-        interconnects = <&mmss_noc MASTER_MDP 0 &gem_noc SLAVE_LLCC 0>,
-                        <&mc_virt MASTER_LLCC 0 &mc_virt SLAVE_EBI1 0>;
-        interconnect-names = "mdp0-mem", "mdp1-mem";
+        interconnects = <&mmss_noc MASTER_MDP 0 &mc_virt SLAVE_EBI1 0>,
+                        <&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_DISPLAY_CFG 0>;
+        interconnect-names = "mdp0-mem", "cpu-cfg";
 
         resets = <&dispcc DISP_CC_MDSS_CORE_BCR>;
 

-- 
2.34.1

