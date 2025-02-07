Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D97A2C0E8
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2025 11:50:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DB6F10EAB1;
	Fri,  7 Feb 2025 10:50:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="QxM9ydNs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9996010EAB6
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Feb 2025 10:50:44 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-435f8f29f8aso13500505e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Feb 2025 02:50:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738925443; x=1739530243; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=x9F9syRGL78OlaYlRaFRYp3PVBGzkzHY2NtLPwbRk9w=;
 b=QxM9ydNs/jOOmo0nEdET0CYNJR14GRP9KPMI1uAumbGWlnWXf3DTx54UlZSlfw7DXt
 /rAU9mqvdIGeMNib/vHDgQUSMEEOYP1y3/pqVOzlOHQubGTCXhQK0oUwIzwY3wd/d3xM
 pgli3rHeE23G+y2sDzNrrmBaRhclIGzRukPEJo12rb701PUJMEPWxGUnMLKum/INpW4b
 V3pYxUgPpAyjc0HwJdtsuS84gx7R2vcGJgF1syRK6t+0L8yvY7ZmObWhwFwGRPlD+277
 6QyoEccG3XxGPqObNxfmjYy57bCcVc74OD/LNdjclht4kcpK18vVU0tNgeHCfPrTNImw
 8HyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738925443; x=1739530243;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=x9F9syRGL78OlaYlRaFRYp3PVBGzkzHY2NtLPwbRk9w=;
 b=iSa+tRcjCCN8zPFk69BPkWVLXMtqunPOw05iBK1Pbi5EgtCAKpxlS3+UGulg9QpKHC
 DSkAqsPwiyNikiLWoENpQ+STrm1u0TaNlryt/BtYuXJNB2at1Qk81N49XaISnMMK5myc
 xv8vJC0xv7fSVsBTl8MV7CAhUheecQ2LD37KDtgUzkiLXrcZ+wLUdaqBhdJ7hd0vQ3vK
 xOMpkpo7WMBH9YrnfA9GnHVj7N6SVvVCOhGCsrFYaD0NHAUZk5B8ebu0MQf5ce9a9yyH
 v+nRXDvsxqXvHR3PtTROIBtD7YwMD9Zn3ZZjXkGDc0UUtpzEWgRcQvTp/WD1UI/fzKYN
 ATkA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWmqGdNyzu5Zx4YJN5tRM+BiTASlqSFd9siXzntdgWk/1nAshfG6L5VFsu5gWQyUkGJ6dI972lmDt0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyuYcJj4iU7Kjl46SBmFLB0y9TYgsgq9YDJYdNhrKE7xgSbDVew
 C6UtWLPtEa7Uf0OnvVfJTE0q92oFaNtbTqQIafrf9PbGJR75tU4XBt/8Qqfc1rc=
X-Gm-Gg: ASbGncvCKQqI6yZl6a0K1H3PxoTCvy3tWb29DN7isS3OD379TmlPSm9NggGewnXiCkX
 db146iNUjmCz6cFZv3AQjck2RoDCM9ezVafeJHoaNn1McvQ778ysTPyYuXyIqXR08VFnGJMJ4RV
 l269v3RtnydFbClkLSeo2egrzaDLcobAYZeTZwR2sECYKe+WoGiBaqj+0q26ih1X7o9UY5vuyje
 s4MTxwHDFvl4ferkqfIkbgTPWFv6nRyJgMQeYCL6ZUz4WTJkC/mHb8B7VROB2uUJ+tCpznFpZu3
 O0eyD3uLQrXbKNxplqWFZVToeWhWmHdp1Sy9
X-Google-Smtp-Source: AGHT+IHJ0IQ5eJAn6lwmpSD5Q7BnuG1tR6YViGBqJPThkFk/1nqflnJML+7RJ5gogTUT8jCkusUDfg==
X-Received: by 2002:a05:600c:4f50:b0:434:f131:1e64 with SMTP id
 5b1f17b1804b1-43924988842mr21093595e9.9.1738925443007; 
 Fri, 07 Feb 2025 02:50:43 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4390daf4480sm85968635e9.27.2025.02.07.02.50.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Feb 2025 02:50:42 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 07 Feb 2025 11:50:37 +0100
Subject: [PATCH 1/2] dt-bindings: display: qcom,sm8550-mdss: only document
 the mdp0-mem interconnect path
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250207-topic-sm8x50-mdss-interconnect-bindings-fix-v1-1-852b1d6aee46@linaro.org>
References: <20250207-topic-sm8x50-mdss-interconnect-bindings-fix-v1-0-852b1d6aee46@linaro.org>
In-Reply-To: <20250207-topic-sm8x50-mdss-interconnect-bindings-fix-v1-0-852b1d6aee46@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=951;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=7+j3AnBKmeNEDl1PfOeB9mydlM9bTHw3r4PijL2u3sw=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnpeV/DLHzDiSC4+1BT+Un0xrC6SdgHIcfgAMQ7X9q
 RNV7RP+JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ6XlfwAKCRB33NvayMhJ0TggD/
 94HOkL3KJEF7KYF02IE1qsJH+mvb/MxPuMYQ25p2JZZjVntBiPwquHSwwE+Kfd6xpcdZlpfUzkSaY5
 hf8kNBgkZvnrkDHPYZbrZdQ/21zRAL1BqSnfGCC1BEAdTKBrE82eRKfyh1S948U1zRfQgBPYmBypNR
 Ac6BIJHOmxQTtlBumb9LdjrjcgksmTpW9SAYzR7+0WE72FNezRPG0/Dj65j6FXw6TtHvmsNI+su+e2
 9mihh+HCBrE2wqtWa6WWCHYX5tkA36r3ReJnsfVxG4P11xbI+tld/qSI9v4B+XW7ZduhF8mAFtyhV7
 RGZYOHZ3/IZaVjFpL7R4wg2ZfDkk076uGQ1GlmHpEHo0AsmLPmpLPsHNyuWnoUIzFrua9EVH24y8do
 Fvc70xEyyHIBTFkfjNdOoRfLhEcCB0R5CGbuJ4mJBdsuf/t9p7ZJ0yqFbuLb7utJeryszX24Rc//C/
 GbPF73VKJ09vXDxfnhSlfTsvEM+Ifv9Bxu8OIb+TPAZFMGBes6NN8P5+O75ITt/zPgxmalqBUO6w33
 Wcx2mTfG0ubcPI9v/1fUHuBs84kFko0WyH0uuWeFdUKbHHdSQ7Vd0S8YT9okcyxvgwXt3x3XpUrJQ0
 pYFBpzF8yQGFZNkHTy14Ab0reF/mjyGHR9p4IXHh5/CcIsyBT/D5chgFsrAw==
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

The mdp1-mem is not supported on the SM8550 SoCs, so only support a single
mdp0-mem interconnect entry.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/qcom,sm8550-mdss.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8550-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8550-mdss.yaml
index 1ea50a2c7c8e9f420125ad30a80b4ebd05c9367a..bc95ea33682e494ee498b3b049c4966f010aa2df 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8550-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8550-mdss.yaml
@@ -30,10 +30,10 @@ properties:
     maxItems: 1
 
   interconnects:
-    maxItems: 2
+    maxItems: 1
 
   interconnect-names:
-    maxItems: 2
+    maxItems: 1
 
 patternProperties:
   "^display-controller@[0-9a-f]+$":

-- 
2.34.1

