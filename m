Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4849542FC4
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 14:07:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BDE810FAEA;
	Wed,  8 Jun 2022 12:07:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C94E10FAEB
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jun 2022 12:07:29 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id h23so32897503lfe.4
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jun 2022 05:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IKrJPErhKWd4bPluexyY2DxW0ir12Zi/jdXLVdVRR1E=;
 b=pXTHyrp4nETfrVRxVykFpNYU7Gdcx1h7qPyh9Duu3hOKs0OW7qSeH4sd8GrmZ4SmoS
 MCcwKkC3fRm8zqp0x+Nb3FciqWmcEz7FCYhZgL+H+fq5VUC0IrlWAmLqnETBPdHbZ0vU
 J9h6JQzQ2AyS0M7jLFYB5fascJ8hkikG7DI6C1aai3XEqN+jyYoN3wDK+N8BovyMg4+V
 vrRm/pTYEMk7oN+9k5FcVMl1SUfz++4Gky7I0kMgh5gpnlaNzH2BIWJdWSpoBVQ6EDEG
 DRQvLim7bEgpkXxjqYpzIm5YluBS/cWfhkA5WkaXKPVRMIgwUu5lZlArL78owkGyhUug
 5bkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IKrJPErhKWd4bPluexyY2DxW0ir12Zi/jdXLVdVRR1E=;
 b=y0kAc9EP+M+15sMPq+luTOyxqAHVesFcxS38hCMWZMt8u0dcxcyJnl64Mllp5rEh59
 E5RZofbVEnX78tbwSirutzVEKoTnn68vGJQn3dypz/V6kbHMj9lOewyF1wBUhRe+4SgY
 qDt9zsLiBpocBno92A8etT6XDX1j+B0KsMLyla1F34azB7+roz8E40UTcyL6bY8uWipR
 MunGaipvUsmPh+s1IzodeGEM94Vnx2X5Z5+VoP3buo7PDPa2sWezlrNKXgbQus5FFh7j
 z9mINLw31mHyXN6IeaTaWvh6MBw3zOUrD8b1aCzDOSV08Q6cadHFWORX1FiPiRGgbm1b
 +EMQ==
X-Gm-Message-State: AOAM530ZjTUDjWgRosVIwpMxHlQ1QM+q9B42TYb8e7h8TiAYuZu1dsKv
 9qi0uzgwMy1NVaPfdDQNdPYllA==
X-Google-Smtp-Source: ABdhPJzIJCCXIGZOq65/f62Q4Wtugam8SJXGd9jVjz/mCnSoRAbZrsLNmWxyTeI5dt8/It3sJ7r7mg==
X-Received: by 2002:a05:6512:459:b0:479:6916:4f25 with SMTP id
 y25-20020a056512045900b0047969164f25mr4399273lfk.119.1654690047144; 
 Wed, 08 Jun 2022 05:07:27 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 4-20020ac25f04000000b0047b0f2d7650sm52049lfq.271.2022.06.08.05.07.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jun 2022 05:07:26 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v2 02/12] dt-bindings: display/msm: hdmi: mark old GPIO
 properties as deprecated
Date: Wed,  8 Jun 2022 15:07:13 +0300
Message-Id: <20220608120723.2987843-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220608120723.2987843-1-dmitry.baryshkov@linaro.org>
References: <20220608120723.2987843-1-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Mark obsolete GPIO properties as deprecated. They are not used by
existing device trees. While we are at it, also drop them from the
schema example.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/hdmi.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/hdmi.yaml b/Documentation/devicetree/bindings/display/msm/hdmi.yaml
index ef425c649ead..81997759584c 100644
--- a/Documentation/devicetree/bindings/display/msm/hdmi.yaml
+++ b/Documentation/devicetree/bindings/display/msm/hdmi.yaml
@@ -65,14 +65,17 @@ properties:
 
   qcom,hdmi-tx-mux-en-gpios:
     maxItems: 1
+    deprecated: true
     description: HDMI mux enable pin
 
   qcom,hdmi-tx-mux-sel-gpios:
     maxItems: 1
+    deprecated: true
     description: HDMI mux select pin
 
   qcom,hdmi-tx-mux-lpm-gpios:
     maxItems: 1
+    deprecated: true
     description: HDMI mux lpm pin
 
   '#sound-dai-cells':
-- 
2.35.1

