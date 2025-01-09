Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E82ABA0768B
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 14:08:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B940C10E460;
	Thu,  9 Jan 2025 13:08:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="fSuMxLYV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 858F310EDC2
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2025 13:08:49 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3862f11a13dso89864f8f.2
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Jan 2025 05:08:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736428128; x=1737032928; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=BDA/EjpsNR921BuCko+v9yYrWjX+qufTJa1GXOf3ODM=;
 b=fSuMxLYVGmrjakOsikWz9V+IJvY3s0JWaWjW139J2BEB0WSE6r9/7yV2Y4kUz0Tcev
 VhLKnah/yM+ZNnJfdDntxiD+zpSoXsdWIMq0ZCVz+spM2gkuDnB/ni8MmbbPR5T5qO1x
 dnkWRpbYBZcpjnncd8+tgAeaa5vE6mpcqBRPkPbSaXwfWMZFxd457aR2xs3VIYCD2iJf
 wj+aec7txmn7KFaQrA4A6BSEPjaMxYsJuNFzS0cZMVwoyKCpWhAiCCszUrWfkqHcbKgw
 uDdclAiPu5/ie6okOORAN0jV5hrDMLb4DCb8qSnoHZPdZeOViypC64mHyg3+dBcuWuv8
 xtZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736428128; x=1737032928;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BDA/EjpsNR921BuCko+v9yYrWjX+qufTJa1GXOf3ODM=;
 b=joSi7t2e+/wC92mTcmGjZvi4iU3MhmoCaDXtZuThaBka1sIvBjeU+fyvLX4L4minj6
 +W+9YRNT7ZDIGaKsgtlFEr40L9XobiTxVA01FArPhOZkKk6Ay3NzSM7APFssBdSFViUg
 +7A1Iyj25zBGMWgBxOWhVGc1qr1vUT9ZmeyOVZ9dLzMe1HtcnOKdnmsnn0mNC9OEkHfW
 ZAQzA0ulphVFsvxVrTUugN1igWOhOq+NET4oRX2xUhtfvYhYKRgvyvYLuTXWLI/nLBcY
 eB9cQOJmWpSoQ1v+/nHjaHliT/TvnJSzdE+YdYOq2FcAS7WVvL4X0+Hu/cMDPcs9Pu74
 fKqA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXGUHgnZUg5Zm1uYQImckoIFjEr2BwYmuc/LMSzwBl/7hfOTzbeLr0ezm/x05CKMJynaM842+Nr2RE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwoPaURbcGLG47rMHRv0ZFDjCKiGTAOHDCpOUXRPffBBJw33mZn
 cOn8fFhxTCedzgDn37iWanlG7ltae4w1mYhDvWBEv5koakqvYEmYdE/+vDnRiqU=
X-Gm-Gg: ASbGncuffDqJyhx4JBR0zNpMETfMz7CNVCQOzfjUsXwiaw6vPTLQdkfWViHWBVN+3i7
 xbtCG+JH19ao2JhOHVy1lGtNMJRGDY0e0+bHk3yydVxktpj87iCpnzYnlHSWJGE27mn3msgPmq3
 uGtn26URyN58X5+7ldbr+A2xcE72yqW/sARbs/ghzsIx2u+qScuNhHajFTD/TJfjJTgAa9pzw5Z
 BWELBkQjUfHcSWegt6++tPsFc7XdFbFkhTFFsVcVokOO6jFdn5FQnVnxVAeL3ut/HVZOYp0
X-Google-Smtp-Source: AGHT+IGwhh9Gyj/S9PPeSwXhzIIHOS2Ah5yuSO55RJB6RLTEM/fZhzJet2ouU+u0iq2mUUa4OAqo3Q==
X-Received: by 2002:a5d:64e7:0:b0:385:e374:bee with SMTP id
 ffacd0b85a97d-38a872da449mr2215547f8f.4.1736428128006; 
 Thu, 09 Jan 2025 05:08:48 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.165])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a8e4b8124sm1789167f8f.81.2025.01.09.05.08.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jan 2025 05:08:47 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 09 Jan 2025 14:08:29 +0100
Subject: [PATCH RFC 02/11] dt-bindings: display/msm: dsi-controller-main:
 Add missing minItems
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250109-b4-sm8750-display-v1-2-b3f15faf4c97@linaro.org>
References: <20250109-b4-sm8750-display-v1-0-b3f15faf4c97@linaro.org>
In-Reply-To: <20250109-b4-sm8750-display-v1-0-b3f15faf4c97@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Srini Kandagatla <srinivas.kandagatla@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1881;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=i7JO0HLgrEMWKiq5PNL/75diUS6xnQPlGhn/+YyG9Mo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnf8pRzcIp+IUHHJRFMtcZowylNchxE/O2Aqzon
 ujXHw/r652JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ3/KUQAKCRDBN2bmhouD
 1/ffD/4/t+xqGvvCzNNGaGTCWdyPtHFNxUjmYrJ+fRIbwPFO9XKXKALfOsWkxJEk2OFNq4w98jO
 uc6/c8x0mmoh8Jb8YrSfDm9Dy0B5owYFCJikik6CGvwd1QV/FAWrx71rcj8TuxKQ6P0/9u/0twy
 7XlnX3AdyT8rhBbF5hme7kIp5I7+nDuMzzxzed8F3SryZdSmvNEJiRLhsPbR7gx3qR7sGrVMa32
 gLFMUn2sEmq8KEkbiqldu5NINBvTby7Au3Hp0aRjDufFyUXhzu3EQvA/vqStJyKowNJlP/5ZaUJ
 QQjOtqJo/Uw+1nw8EyKeozYZBAficAS3JaiIiPQL4ewycsddqxcYqad49usrklatyfpeAbuxyfV
 fO4dkmR9rJjwKjCDBTTrsJtgcuCZyPXPt0FqLOuq9Opun0dt05gASnAOIl9ng3ZQplmAjrwsx84
 /EUSf2axXWa0S0DU0i1LeXye8VK1Q2SBu8S5shnUuLKFX6BJowLcbqDp9HUQzgCTj+TkC11L2rs
 YRjPn9hmBeers6k8otRgmhdOVUIqwVBBbU1eqoDGHDHdfVYo8uH5hDnNhy2VQaQlEpIOdYq3h6M
 3+K9Tam78jsOfumOmyGiH98cJBl1C9ajTD4wT7Bry+Y+U5TwBkT0oUZ8r6t+lVOOqdCEFv41T/d
 vMLIFKmmGrs0FXA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
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

Specific constrain in if:then: blocks for variable lists, like clocks
and clock-names, should have a fixed upper and lower size.  Older
dtschema implied minItems, but that's not true since 2024 and missing
minItems means that lower bound is not set.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/display/msm/dsi-controller-main.yaml        | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index a90255f60d9e31c9c7ed94816284fa8f0d71d392..c99dd06f2db9a7a77665ab057d05d87fd3ec2ec2 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -231,6 +231,7 @@ allOf:
     then:
       properties:
         clocks:
+          minItems: 7
           maxItems: 7
         clock-names:
           items:
@@ -253,6 +254,7 @@ allOf:
     then:
       properties:
         clocks:
+          minItems: 6
           maxItems: 6
         clock-names:
           items:
@@ -273,6 +275,7 @@ allOf:
     then:
       properties:
         clocks:
+          minItems: 7
           maxItems: 7
         clock-names:
           items:
@@ -293,6 +296,7 @@ allOf:
     then:
       properties:
         clocks:
+          minItems: 7
           maxItems: 7
         clock-names:
           items:
@@ -328,6 +332,7 @@ allOf:
     then:
       properties:
         clocks:
+          minItems: 6
           maxItems: 6
         clock-names:
           items:
@@ -347,6 +352,7 @@ allOf:
     then:
       properties:
         clocks:
+          minItems: 9
           maxItems: 9
         clock-names:
           items:

-- 
2.43.0

