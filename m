Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F35AC913E1B
	for <lists+dri-devel@lfdr.de>; Sun, 23 Jun 2024 22:31:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C839C10E011;
	Sun, 23 Jun 2024 20:30:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="K+qZk9yu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7179810E1C6;
 Sun, 23 Jun 2024 20:30:47 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-4218180a122so27711745e9.1; 
 Sun, 23 Jun 2024 13:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719174646; x=1719779446; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=LSLZRfc59PgjAu3IAfb10/Y7qX+44+MtwIvZ2wCAgyw=;
 b=K+qZk9yu5UxfK1mjT+iVoiA3jABVhFlHZ4oJC9pJRAqStBcNT86D46dpUDZLpu9TIo
 hIQTMN6ohXCIGXFO/lLkuRh6LuEZsfucd5OBl1yyYNpCByKF4LAmO4RIGuhCi2wLVbxv
 UG42uPZ783RSE8er4MeoqcigUJ/58hZsCx/ZzaNMF1u2mLz62+f3l3oeD0ZaJHBOOvks
 tWJHGC1GdziXO32VZda82RmiKPKs4lVD0lA1TUh3yLbjpH5vm9t32abD0e1dIQQ7FMqF
 R2/DYvzzi8p6gPa+370j0RzUphn3CtsX6qGzkslil00iwVXsB0rqVfPjx5LzXzNmB/xv
 3/zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719174646; x=1719779446;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LSLZRfc59PgjAu3IAfb10/Y7qX+44+MtwIvZ2wCAgyw=;
 b=DaKcDj4ccpF8vkTQ9909yzWvuRKyxh3RtWNpY87JtDL1f0A+M3AXXyf5KH1JMeg+vT
 vez/dNWjzHl2gmn/IG8sVTvBsq8AtTlmd8QIjXrBpKS8fvCpamPTwqJmysDC0ww6lVQe
 rOjC9HPoTwtFYgX7MgocVBz+QtPDAKb1Y/cbtbTlFXoatpgmo6RvQ1+Y++7AXtpiKNXv
 fCvdk0ijtKQZZJcqEWZwtKKhK2Hmafsd0zlIhGQVjVcxzxF3bPztfnGPRj36xfLU6Z3e
 YkQGeEn7qgQe7xg4BeOXAIkdTfeUchN0YnOrJK4jibMJZUg35XIjGbaf5iHHsnDp4Mm+
 Mxcw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVcMfN1PR7n7rrw39vomo4NfQR0wpG1qOuHtk/ysj24EZPetDnGJI+HK3Rm2WDr1Hoqo5sTW5YiJRppnJeVSUyTdfanMNocowXcASl4jPH/CrNPMu1nJa9BACCDh8oVzCN7e4AUWB7H2ovsIZ06PkNk
X-Gm-Message-State: AOJu0Yy5q3t+J/ojSRcvc5dcqPQhC6s9neGj+BT87qORa11xfXSoLm2i
 GypTmWhWctMJ0jy5Oqj+zXgIR4MJNmGockcqoUOsbHZkipKPAs0DyqQ9FcADURQ=
X-Google-Smtp-Source: AGHT+IFQYzva89WBUwkGC27QsYMXMAq2H+qOvshVT5ndxoilTZ70p8PAYKz5+yc8iBxI+YDaJVklkA==
X-Received: by 2002:a5d:64c4:0:b0:366:f627:37 with SMTP id
 ffacd0b85a97d-366f6270197mr171245f8f.53.1719174645659; 
 Sun, 23 Jun 2024 13:30:45 -0700 (PDT)
Received: from [192.168.1.130] (BC2492F3.dsl.pool.telekom.hu. [188.36.146.243])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-366389b8ad2sm8088599f8f.33.2024.06.23.13.30.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Jun 2024 13:30:45 -0700 (PDT)
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <trabarni@gmail.com>
Date: Sun, 23 Jun 2024 22:30:38 +0200
Subject: [PATCH v2 3/4] dt-bindings: msm: dsi-phy-28nm: Document msm8937
 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240623-dsi-v2-3-a0ca70fb4846@gmail.com>
References: <20240623-dsi-v2-0-a0ca70fb4846@gmail.com>
In-Reply-To: <20240623-dsi-v2-0-a0ca70fb4846@gmail.com>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <trabarni@gmail.com>, 
 phone-devel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.0
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

The MSM8937 SoC uses a slightly different 28nm dsi phy. Add a new
compatible for it.

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Barnabás Czémán <trabarni@gmail.com>
---
 Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.yaml | 1 +
 Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml    | 1 +
 2 files changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.yaml
index 288d8babb76a..a55c2445d189 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.yaml
@@ -16,6 +16,7 @@ properties:
   compatible:
     enum:
       - qcom,dsi-phy-28nm-8226
+      - qcom,dsi-phy-28nm-8937
       - qcom,dsi-phy-28nm-8960
       - qcom,dsi-phy-28nm-hpm
       - qcom,dsi-phy-28nm-hpm-fam-b
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
index e4576546bf0d..7c6462caa442 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
@@ -126,6 +126,7 @@ patternProperties:
           - qcom,dsi-phy-14nm-8953
           - qcom,dsi-phy-20nm
           - qcom,dsi-phy-28nm-8226
+          - qcom,dsi-phy-28nm-8937
           - qcom,dsi-phy-28nm-hpm
           - qcom,dsi-phy-28nm-hpm-fam-b
           - qcom,dsi-phy-28nm-lp

-- 
2.45.2

