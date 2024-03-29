Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 207CE89148B
	for <lists+dri-devel@lfdr.de>; Fri, 29 Mar 2024 08:47:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F33489364;
	Fri, 29 Mar 2024 07:47:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fairphone.com header.i=@fairphone.com header.b="ByOgAKKo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D556C11256B
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Mar 2024 07:47:00 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-a4a387ff7acso213130866b.2
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Mar 2024 00:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fairphone.com; s=fair; t=1711698357; x=1712303157; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ktUevP6u8w4KHYW86f+K8GcdXFfL/uIUgZtZWzBIQhc=;
 b=ByOgAKKoI17PIXQkYCuJ6Lv2MBvgMnna/WJs8v7GfOWiJAjcS7UogYxbWk2vH9MLZX
 lzqJrTIUahY1O8T8FEjVz3dMAv3VgpTRScqcobgiIHQC662XwJ9Yp9S4bvVV8u/jvk5N
 pkyrdtjGqX10EtSPdXAmWYNAty/I4+yOrQ2wdyX5atvtRtXSYeKfYl0cLxKagh5G5rkV
 kCQZ7sKTLpV4+PsV/Gq/mQlvOBa1DaPU+JegXaUQZ4oH+hak0nolDJ+BUZqmBsFh9t6S
 dHSuQzOG+5hXhqTVC9ah7SAph0zM2yy72nNVDjNYyaro6p4fLbVsXG+ymhnJu9p2pCLc
 M0aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711698357; x=1712303157;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ktUevP6u8w4KHYW86f+K8GcdXFfL/uIUgZtZWzBIQhc=;
 b=YbIvNGRRt9oGIAXQkfKIPnPgbhqyDBaJwAjPwVnleu6OTzc1J7TH2tUPvUSr+BN5Qn
 JMc4fX9+OvIS9zCV9yXckxFxgNIY7VN4kKabLfPaCxbqNVnHJmx24t0XU765BgBZAb6b
 +p5o5uI6m/r+B0qzLiTA17H/QHZik+Qa1KiH67LYA3dE4Y2UNlCHPSf5+tFf3r2Oat9+
 a7lCFevm9ER3XcrIgy2pk65n02bJazwn0cbewrFf5kROp3evrJ/tJf5DkyUFRyKbTLVe
 SSl2Oz1eNqfcPHvbymgYUSq6CQGB7dXpFSCklOWIvMREmwIoPp6LHinFpy/FppctKfuM
 PNMA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWyH7K+OsvkKfgxadudx6OMAHLeTJsA9UXx/4B1fs7SWUA+O3PR5BMtFZPSyJJzCgya6RFF/xiEkiffNp6meAgEtXMy6DAbqvQ+7ckjLRP5
X-Gm-Message-State: AOJu0YyQSmr2VWzc0V10+xocnIMyNl5KR5BK3xwHcQNJZuxrWfO62kTM
 JRldaEUcCOEPU1uluLzrI+5nXdPMPxwyKegH8BV2k8Yvx9AlZUBa4+Ya3RpfzTE=
X-Google-Smtp-Source: AGHT+IFa6363X6GOmkR4BsEQwG0xCUHGlbVBpxaeQsPeMOww1hYOuly/ejvvRwJqZ9obHOITNtL4iQ==
X-Received: by 2002:a17:906:5053:b0:a4e:2a62:7eb6 with SMTP id
 e19-20020a170906505300b00a4e2a627eb6mr863656ejk.51.1711698357114; 
 Fri, 29 Mar 2024 00:45:57 -0700 (PDT)
Received: from otso.luca.vpn.lucaweiss.eu
 (144-178-202-138.static.ef-service.nl. [144.178.202.138])
 by smtp.gmail.com with ESMTPSA id
 l9-20020a1709060cc900b00a4e24d259edsm1382737ejh.167.2024.03.29.00.45.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Mar 2024 00:45:56 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 29 Mar 2024 08:45:54 +0100
Subject: [PATCH v2 1/3] dt-bindings: display: msm: dp-controller: document
 SM6350 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240329-sm6350-dp-v2-1-e46dceb32ef5@fairphone.com>
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

Add the compatible string for the DisplayPort controller on SM6350 which
is compatible with the one on SM8350.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index ae53cbfb2193..97993feda193 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -29,6 +29,7 @@ properties:
           - qcom,sm8650-dp
       - items:
           - enum:
+              - qcom,sm6350-dp
               - qcom,sm8150-dp
               - qcom,sm8250-dp
               - qcom,sm8450-dp

-- 
2.44.0

