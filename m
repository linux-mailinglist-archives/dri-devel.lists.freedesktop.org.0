Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD8E89148C
	for <lists+dri-devel@lfdr.de>; Fri, 29 Mar 2024 08:47:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B1A1112571;
	Fri, 29 Mar 2024 07:47:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fairphone.com header.i=@fairphone.com header.b="gXDaqmA9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD23E112572
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Mar 2024 07:47:01 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-515cd2ae7aeso603872e87.0
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Mar 2024 00:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fairphone.com; s=fair; t=1711698358; x=1712303158; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=4McqOYY3UTRJyQ2CjaqCL8nyfMiP9YKrs8lnA2q8yiE=;
 b=gXDaqmA9quiZp+ruPAMGnI1hoJMmVf1Uhv3vmcXui1gptk+fz1TzaJpCOT6ABSyipZ
 FBGMdupgESxudLwz8pjWizjdh/PLdKiKJaglBYYllauezBcP1vEu1GE9i+4cgGu7CWIq
 Ln34oZAcqlkEb38fVqIq7zo0M2vleCCh+5GyvQnWhvWcBLhjaA05HZ3Dnn8Y9j3NYzTv
 4LrPFw1tjyT+CWTrbEmRZF7qaPRGhuW/9oUkE+kGAz/vEbgY5I/ChVz/FLqQWTDnOwLe
 p2WI3xEsB4KZgSX+MXqNX38EL2cKv7OADWUr1baZBM0tdAcsHWOBMImzekhFrZN72gWo
 IcPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711698358; x=1712303158;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4McqOYY3UTRJyQ2CjaqCL8nyfMiP9YKrs8lnA2q8yiE=;
 b=mX/YQq3hY0GGCzFpZKGaVCj/b3jQICjGEmmkNcnZyU39Mz88XLw26/aTF9LctuFHon
 IcCL0IhVUzJ6u5NshOyOgz2fWnYB+4YdTcZlGa5Z5kRO/vr6sT5khFEfzJEne/o3hzR5
 XWEur7EE0gjzzjGeanmJOjlQG8PKi9+RHATe8r/HEsHMwqfAQFRa6HdwuQjJ5Yadf0E/
 VBtUuC7COcoDoJQ9sVVW/GviFsBbCOsQpiJMqtH1EEvhyvd8SWPRLpln+L7p7R0scgi2
 6PUIdWpjGAIxXYxYx2nzI001n4oTc35Tk2sgvpVFBB0TqAjZA6XUyTIlDfNhvZ6ws1UH
 NCHg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWXeW2bDTHcoys7pdsDj25JhKoOA5l28hTcCysLUepJKP0p5ovGan/hKRtIiz/hkFYpm5ePPo+tXkUOSp+APTEL6klRray/oNEUhOIw23Jr
X-Gm-Message-State: AOJu0YxpxPb9WLnqsA92XoYZf9cBvVNvqu7lYTK0woTlBCHDdL0BVHF6
 oUeMC0arQ3Ca+QpoyYm70YnBBbFYRE6AThEMqxLk8smY1ambOgk3f/l+T8bSygE=
X-Google-Smtp-Source: AGHT+IGr9SjS2/x9Bg3Cg9sAk0T6zHFzcOeMV4fzLJHUxJzzp46Etz1DP0Mivc1g9nSdBVgZiLJLTg==
X-Received: by 2002:a19:2d06:0:b0:513:d8e3:fe3d with SMTP id
 k6-20020a192d06000000b00513d8e3fe3dmr976784lfj.26.1711698358274; 
 Fri, 29 Mar 2024 00:45:58 -0700 (PDT)
Received: from otso.luca.vpn.lucaweiss.eu
 (144-178-202-138.static.ef-service.nl. [144.178.202.138])
 by smtp.gmail.com with ESMTPSA id
 l9-20020a1709060cc900b00a4e24d259edsm1382737ejh.167.2024.03.29.00.45.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Mar 2024 00:45:57 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 29 Mar 2024 08:45:55 +0100
Subject: [PATCH v2 2/3] dt-bindings: display: msm: sm6350-mdss: document DP
 controller subnode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240329-sm6350-dp-v2-2-e46dceb32ef5@fairphone.com>
References: <20240329-sm6350-dp-v2-0-e46dceb32ef5@fairphone.com>
In-Reply-To: <20240329-sm6350-dp-v2-0-e46dceb32ef5@fairphone.com>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.13.0
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

Document the displayport controller subnode of the SM6350 MDSS.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 .../devicetree/bindings/display/msm/qcom,sm6350-mdss.yaml        | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm6350-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm6350-mdss.yaml
index c9ba1fae8042..bba666bdffe5 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm6350-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm6350-mdss.yaml
@@ -53,6 +53,15 @@ patternProperties:
       compatible:
         const: qcom,sm6350-dpu
 
+  "^displayport-controller@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        contains:
+          const: qcom,sm6350-dp
+
   "^dsi@[0-9a-f]+$":
     type: object
     additionalProperties: true

-- 
2.44.0

