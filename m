Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78F0A634AD0
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 00:13:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D17A010E48D;
	Tue, 22 Nov 2022 23:13:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7272310E494
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Nov 2022 23:12:41 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id f13so4224388lfa.6
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Nov 2022 15:12:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e6yfa/gbbLb8r9CDdFD4rR6qCDT67lUql/3o3mSvJqo=;
 b=WlcfOapqTEQmXO05S/sqfsZV1/ZIf2CwSTJo8Ayc+MfGHSlQvV4A0WRY3mGrL0Hr4C
 AKA5wpUkuQaW719bCPlCqHuPLbVg2TW+Ur7tAq8B7k5ILEEJpOyMQ3Dy0kxZLNwNreRY
 bpazKO2XgpTb/ZMTwEAfeOwhoxn4WKs9WKmo5HE33K+YCuC0eGrXJAGmxNsN9XEM0vSo
 Adpwh09QDsj2BynnMiRgmWb00nfIzUMWesNWBlVukjXsjTQ6CxtPM/h5OVS+MvwSc98D
 omn0s0ikdloPKo3LX1ZO6+bqbZiKNJoDrlcQuUVYgIPo2paN6OtSGHZNOQg5xWtJc6QK
 pg4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=e6yfa/gbbLb8r9CDdFD4rR6qCDT67lUql/3o3mSvJqo=;
 b=zQ76W83RBmZVPW1lQDz2M0dLV38gnA/ysphbKlfwmIjr6T8Reu8vvYqJhbfjA5vHwf
 nQt5nLOn/brQLJE7xCW0mGpyIf7Woi//RSDGjvOqUtJKedmI37GWeMdZ7uzkM8R3Y9Rv
 vTxtbIhnk71l2b87d5gTlGmrKou5FlACN+BQ8wscX3bmh0sNv8TQVxMGivY1yAsET2Zo
 n9mZ9Zdb3CvuGEWhWi420Z+hKYd7rO774HWpyPsebfHOYDIJTDBxZ0JZFgGY+ESmURE/
 GkDISbw36hrIMOpjYxB1tDReznbpoNg7G4rhRjIB0bUOwAWbSchqR0G/xxVGSidAEYVQ
 Rkow==
X-Gm-Message-State: ANoB5pnuboKOc9cAE4R0LCmasoOKXmMThLt7r5YUjr758v1A/tW3QjS1
 f5tYujJKrDlB3Dmd4HqxosIqtA==
X-Google-Smtp-Source: AA0mqf6M//tJi0iqBqqzJEX/ky3XoQjCwZq2azXmC4OveKdON/JsF6RhuaqFB/vGoE4SY6R8nbl0Gw==
X-Received: by 2002:a05:6512:5d3:b0:4a4:1cfd:c4ef with SMTP id
 o19-20020a05651205d300b004a41cfdc4efmr8931501lfo.678.1669158759519; 
 Tue, 22 Nov 2022 15:12:39 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (dzpbkzhtyyyyyyyyyyyyt-3.rev.dnainternet.fi. [2001:14ba:a302:8a1a::1])
 by smtp.gmail.com with ESMTPSA id
 q18-20020ac246f2000000b00497feee98basm2617541lfo.274.2022.11.22.15.12.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Nov 2022 15:12:39 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v4 04/11] dt-bindings: display/msm: add sm8350 and sm8450 DSI
 PHYs
Date: Wed, 23 Nov 2022 01:12:27 +0200
Message-Id: <20221122231235.3299737-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221122231235.3299737-1-dmitry.baryshkov@linaro.org>
References: <20221122231235.3299737-1-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SM8350 and SM8450 platforms use the same driver and same bindings as the
existing 7nm DSI PHYs. Add corresponding compatibility strings.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
index c851770bbdf2..bffd161fedfd 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
@@ -15,6 +15,8 @@ allOf:
 properties:
   compatible:
     enum:
+      - qcom,dsi-phy-5nm-8350
+      - qcom,dsi-phy-5nm-8450
       - qcom,dsi-phy-7nm
       - qcom,dsi-phy-7nm-8150
       - qcom,sc7280-dsi-phy-7nm
-- 
2.35.1

