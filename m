Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD7E88FBD4
	for <lists+dri-devel@lfdr.de>; Thu, 28 Mar 2024 10:43:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD97310F4C9;
	Thu, 28 Mar 2024 09:43:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fairphone.com header.i=@fairphone.com header.b="Op2KIf9U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFDB610F4A1
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Mar 2024 09:43:03 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-56c0a249bacso903329a12.1
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Mar 2024 02:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fairphone.com; s=fair; t=1711618982; x=1712223782; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=pkS0hnNrFDbXHrlcoNspnOJj4NSYX03NbGI5xXPUHvo=;
 b=Op2KIf9Um87dOMqYja+W88CIKCTaIEX2DaaWPVWDxuJPLQ0pgq1a5xD/Uexp7h/wO+
 F5mg9ZKUT8GQrp/zKv0+lSinsLQ44w3O6+CQLcXV4g3rkj37pe2PbOzk4tnJjFFvu1t9
 01zHZPqVzDN7QSo3iU/LDijYGgKTXP3x6HH4gBsRJVW0chLWOcmK+8Ns6gJDEOa4UvY3
 MDGqBo+WSEwHFNtduuXthaBj8B276Hk8CmAzJhskgmSh8mkPKibpbIgaug1URKmtx4s1
 3o+RKsbl+j2NfvEmVY8V7/M2I2djwnxB6xxdO9i+FdTbzBRPw2k21j2L2SAsueEQZkK9
 pFqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711618982; x=1712223782;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pkS0hnNrFDbXHrlcoNspnOJj4NSYX03NbGI5xXPUHvo=;
 b=KSzQoXeXeO3Sq2Egk8Ptu96FFRIMOeupnRr9+miw1+wL9KkOQhQDQuTdD0p59JKuH2
 HadpryvrBegCTaHsWhBC17BjPY8sGiGWm2O6j4S0/HsMDDzHx35v1KcyAcJt1F468l7W
 iMaYcHESJCMst+XqtaQTN8WbMgAGNh0wQDmh0Cizix8+iNO8uBfASoaQhSprD1AG7tbn
 8FGmJ1uccIFFANFD2hODBgFhtpn/1qcL/h6LeIqv5C7rz+G55UD2MNBk1qPNHugSw6HS
 1HAZVM6RrAXitDVUnXCwwBjHVFDf00kiqrZTYrq73phlf2M4HbzMNsPVB42pnyXQzAYh
 ckXQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVwuCrr0iQcrwP15KQmn9ypYdQy/9DdeZ5ir2HeCdJAWDCLxnnxceIVbYFGW8fuOyT0ToSjGEKrztCrAW+ZRbGo27LIQrMEMTHSvVuS25UJ
X-Gm-Message-State: AOJu0Yw7pPnwS/bsKu+cqUxGSYXh4Ji/UVb07LLV171FQSkgF0mIgh37
 cg611LWr+FATkoxTAjAndmRQLymh/PaH3u2Omt+tNrOO0WL3OT0IUdNlRnSNoec=
X-Google-Smtp-Source: AGHT+IEWpqXuFzJjsC1M/sOHK3zZOE84F5IxzcbN5OkAPk4DTWHSoyiO2rVY9a6j5rj0JVACU4kHSA==
X-Received: by 2002:a50:cdc2:0:b0:566:ab45:e6c5 with SMTP id
 h2-20020a50cdc2000000b00566ab45e6c5mr1772674edj.28.1711618982129; 
 Thu, 28 Mar 2024 02:43:02 -0700 (PDT)
Received: from otso.luca.vpn.lucaweiss.eu
 (144-178-202-138.static.ef-service.nl. [144.178.202.138])
 by smtp.gmail.com with ESMTPSA id
 l2-20020aa7c302000000b005645961ad39sm631362edq.47.2024.03.28.02.43.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Mar 2024 02:43:01 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Thu, 28 Mar 2024 10:42:44 +0100
Subject: [PATCH 1/3] dt-bindings: display: msm: dp-controller: document
 SM8250 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240328-sm6350-dp-v1-1-215ca2b81c35@fairphone.com>
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

Add the compatible string for the DisplayPort controller on SM6350 which
is compatible with the one on SM8350.

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

