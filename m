Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7660988FBD7
	for <lists+dri-devel@lfdr.de>; Thu, 28 Mar 2024 10:43:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ED1310FF12;
	Thu, 28 Mar 2024 09:43:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fairphone.com header.i=@fairphone.com header.b="JIxnaqCa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3362210F4C9
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Mar 2024 09:43:05 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id
 4fb4d7f45d1cf-56c0d1bddc1so841567a12.3
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Mar 2024 02:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fairphone.com; s=fair; t=1711618983; x=1712223783; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=IWaLqxKFsff0HC4ZJrh+qrM5gTmGQFtweOeGkkKCYRU=;
 b=JIxnaqCaTx4neDzEyt6lYShE+sWEuL5QI60q9p2n1HHboY7GHQiXNxLkF42TVfOZY0
 Xlj57o2tVrOkLGgVXWGuEyenBm3Hw4vM3E2vPahpcAquVsTw4Cs6lDrIeRVIYF7IhEGl
 ILRi2/HI7U1yvpNsJ3I1nZ+cEKUy/zPedNohylY4WG8miLqq0OFmBBOkLrm0LnGlssiT
 2OgLzoz0jO99xYPgeT9KuRLcbsj17b8TCR+O5tsBD+ssE7p6fsXrUj65cPhECUS0aSyz
 QhTFA24NhZwGcTxL5W7v4r0ZnXKBlV4dDZ7dtG7KQurWVbKTk0NZVWPFfsPc+5emyV/s
 t2wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711618983; x=1712223783;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IWaLqxKFsff0HC4ZJrh+qrM5gTmGQFtweOeGkkKCYRU=;
 b=Wnr/5TOWDOuHKrvco1b2TrkW1nvrj+hzxIUASQ9gLWNfLtJ0Wuh+LOyT6l3wH2WJmp
 q97dNuFtd/kQfHjaMkXYSk0zw1hP9e1y70sYp0hKPYgtsVZwlNawQqCSW8YyTPmOgJ2k
 CLrXkTU3+diuDD+CXZLNJSc1p55cvLL9kSwxMFy1idljENV0eUxivXqclwjW3PocJBJA
 LRQuGgfH/h1w7XK+4/cegkqMTQ+XJ/Ix4NyK1Wo3UCAPmri/DvGLK4cz0jWgIwwDTUYw
 gF8mVMDx+wxUBXM2B+/hYI0u81bBEMVV1gvGXba9XvatRGFrvD68V4KnL/P229Ne2Hbw
 rrEw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU2IiE/8Zbu81HJkB9+Fb1Ep40HrjWLpn7OUdjcQoPVn0gIcJ7gub+30O5ilndIT1cGpzW3HNgHom0wd+yhZKQzAeR0CTwb9a8UNfEIAMQT
X-Gm-Message-State: AOJu0YwhZxAZH1N+1SOofo8XAmThC0IG8rrUzixcGJibTx6iOw2Xc/xl
 POzm9O2CvWUhvMCWAtYqrXDUC0pQ5wH3KHAVQF9KLYr3+w46MJuY7ojSAekOffA=
X-Google-Smtp-Source: AGHT+IGonGHsQ9ouyMDD2MO97PoD8QuMY2EXeRRHhh0Q4aWvKaO5R82DEegQI8rei1CJvYFMt4V1ng==
X-Received: by 2002:a50:9b09:0:b0:566:d333:45e8 with SMTP id
 o9-20020a509b09000000b00566d33345e8mr1799112edi.20.1711618983567; 
 Thu, 28 Mar 2024 02:43:03 -0700 (PDT)
Received: from otso.luca.vpn.lucaweiss.eu
 (144-178-202-138.static.ef-service.nl. [144.178.202.138])
 by smtp.gmail.com with ESMTPSA id
 l2-20020aa7c302000000b005645961ad39sm631362edq.47.2024.03.28.02.43.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Mar 2024 02:43:02 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Thu, 28 Mar 2024 10:42:45 +0100
Subject: [PATCH 2/3] dt-bindings: display: msm: sm6350-mdss: document DP
 controller subnode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240328-sm6350-dp-v1-2-215ca2b81c35@fairphone.com>
References: <20240328-sm6350-dp-v1-0-215ca2b81c35@fairphone.com>
In-Reply-To: <20240328-sm6350-dp-v1-0-215ca2b81c35@fairphone.com>
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
 .../devicetree/bindings/display/msm/qcom,sm6350-mdss.yaml      | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm6350-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm6350-mdss.yaml
index c9ba1fae8042..d91b8eca6aba 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm6350-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm6350-mdss.yaml
@@ -53,6 +53,16 @@ patternProperties:
       compatible:
         const: qcom,sm6350-dpu
 
+  "^displayport-controller@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        items:
+          - const: qcom,sm6350-dp
+          - const: qcom,sm8350-dp
+
   "^dsi@[0-9a-f]+$":
     type: object
     additionalProperties: true

-- 
2.44.0

