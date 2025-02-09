Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47FF4A2DAE4
	for <lists+dri-devel@lfdr.de>; Sun,  9 Feb 2025 06:06:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94B9110E46E;
	Sun,  9 Feb 2025 05:06:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="W3wFhrwE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 107B910E46D
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Feb 2025 05:06:51 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-5450b91da41so31584e87.3
 for <dri-devel@lists.freedesktop.org>; Sat, 08 Feb 2025 21:06:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739077610; x=1739682410; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=nTcdagHfVvJWdpzLDW5hzkEO6YN/7LPqkZiqmOtMZH8=;
 b=W3wFhrwEeufCSZ2P2Y09hf816WzfP+5+sa+DAP0UlZ6QjUrRpafBdQAclpIjUGrxGn
 2j+fO97L4/SjQMGKX4RLZHsDtuhMGtV9jY9e+ztZS9IsJJKwP3d9jIb935B4my+ISABL
 fJerfW53tnZwvXbhFnMuNfrqCeysLOkpogTndtj9hR2GVSxIBrD33cg17g0hXSL0cfC2
 /OlVVOIVReaeTDAgdVLL2O0qfkfcTerPDM9HOr2VPUja/jqhl2r13lM9mqb+x4fYwxR+
 253at679itidA8/01GE+mpigug6lT0szgQqhAbVHO2HI/BzLkh+FwAXR7WMRKKbFv+j6
 rQ1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739077610; x=1739682410;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nTcdagHfVvJWdpzLDW5hzkEO6YN/7LPqkZiqmOtMZH8=;
 b=VfrcH9u4L+iL61cLcNUv1115sIdIcBXtOUEI8pqn5NMR/j4XbVY481FEMmgGIt/rQ7
 9VIE6F8GWC61r3Kt8Ck2sbB4Ta2x99nYQYUwHcfVJ3YeCZqmd+r7Pikb577NWrlR0OyF
 dbo/Mm/+vi/3dnLTSvieF/hG530fl3kkXtUk0IJtiVFoifCN71FVNt+XGZRSqTdgno82
 uJlP3EcVCU9udqQOwNEf3v0y8exIVkIdNNiWdgPAxhkKX3yv9vuhwxZMOODxVRUA/4AX
 ujCSGaCzn1Re1bmmjpVwG5ORLeAl9HMfHJcglKsKXgQBM6c74mGrQqwApXbEZa1ojT06
 c57g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWSUW/XrV67K+ydqt8PbIBVYB7DLLxjkZ0mA9jIqWZVyDOOc2uRZ9BJ2+WW/eZ3SieqpFjIhIeKNt4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxB89402Z5IRmWVnS7mK40wOc/upOjImz9vG5ZcHpgu6bzbL4dM
 CarlfxPf8a8W9gNumXpDdm5Yv82/ZZ6NF/b5VY8K2pD/0jvgOyIguiOxo+I1IIw=
X-Gm-Gg: ASbGncvms3z94/9z058vX9rwTuCpbpIW423El15wriBvIctH+5e53MF3B0Lv2h5FDpw
 1a/yzEwn0NERDU4jZizGG4RMTPk8BAhpbn1790kRtzq2fB/l7hEeQqO04vZfbzPKZdGyUaNtD90
 L4QX8ni/D8txb1PvboTgVXMSIkRRFSCb3Yqh9MgSQyiWR3yyjUTZ2lSpSl+Arvv1oe1KF7xrCwa
 gvi26aUEN0eP+kKj0qGRjo+JhEL4qEaRTKFxcUORmLL5JekQ9qnbVxwl/t54p1f/SjId9pyZ5As
 VAnlBXfi7Tw+Z8S+rXkw2bU=
X-Google-Smtp-Source: AGHT+IEFXe5K8k+ix/TTKVKq9EFeSW9km/qit2DCh/DLsirowioK0KDRuuwtMc/zx6EiGq/Gs8hrxA==
X-Received: by 2002:a05:6512:2205:b0:545:576:cbd2 with SMTP id
 2adb3069b0e04-54507bfa112mr584003e87.10.1739077610224; 
 Sat, 08 Feb 2025 21:06:50 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54506ef1733sm245576e87.1.2025.02.08.21.06.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Feb 2025 21:06:49 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 09 Feb 2025 07:04:46 +0200
Subject: [PATCH v4 02/16] dt-bindings: display/msm: hdmi: drop hpd-gpios
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250209-fd-hdmi-hpd-v4-2-6224568ed87f@linaro.org>
References: <20250209-fd-hdmi-hpd-v4-0-6224568ed87f@linaro.org>
In-Reply-To: <20250209-fd-hdmi-hpd-v4-0-6224568ed87f@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1438;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=NLSCP5E6ORI9H0QuM74oVHUl+a0F/vNbAQWYghqkTiw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnqDfhYclpOw8R2du6T24MrpOm7QjiPhE/g7GXP
 i/M4vlXimmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ6g34QAKCRCLPIo+Aiko
 1bNlCACw8jnIu5ritWEfsFqRqlft4maCais+D8f7xJZLStAU3zaKpA81oDi+4en7jDRNdsZKwTR
 gggCP29ILVZoZGLRsfYrFUbdVnSjGejPVwCyXS/x4+tby9pkAeheeDOhHxx3F1+XL4FWqUv2sdR
 RS/kMmNkTQI//eK08wp5ld2x+RDs66f/J21yrExwXeahWL9KacJuD1P1PRPUTIQCzsNw834YPny
 exHq0VzE1nH4db6YwrCrf4+h1hoz2IIXXh2LAIjesZE1cT2n426Kv5wR96kCUi0Ovzz++zkiiGR
 uwA7gar7slMJunZwgXtK5+AflEVpxjcM8yBfnXpM4OSqNowq
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

Supporting simultaneous check of native HPD and the external GPIO proved
to be less stable than just native HPD. Drop the hpd-gpios from the
bindings. This is not a breaking change, since the HDMI block has been
using both GPIO _and_ internal HPD anyway. In case the native HPD
doesn't work users are urged to switch to specifying the hpd-gpios
property to the hdmi-connector device.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/hdmi.yaml | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/hdmi.yaml b/Documentation/devicetree/bindings/display/msm/hdmi.yaml
index 7e6f776a047a00851e3e1e27fec3dabeed5242fd..a5ff7045a14be3b8106b3edf0033a8028a684529 100644
--- a/Documentation/devicetree/bindings/display/msm/hdmi.yaml
+++ b/Documentation/devicetree/bindings/display/msm/hdmi.yaml
@@ -62,10 +62,6 @@ properties:
   core-vcc-supply:
     description: phandle to VCC supply regulator
 
-  hpd-gpios:
-    maxItems: 1
-    description: hpd pin
-
   '#sound-dai-cells':
     const: 1
 
@@ -178,7 +174,6 @@ examples:
       clocks = <&clk 61>,
                <&clk 72>,
                <&clk 98>;
-      hpd-gpios = <&msmgpio 72 GPIO_ACTIVE_HIGH>;
       core-vdda-supply = <&pm8921_hdmi_mvs>;
       hdmi-mux-supply = <&ext_3p3v>;
       pinctrl-names = "default", "sleep";

-- 
2.39.5

