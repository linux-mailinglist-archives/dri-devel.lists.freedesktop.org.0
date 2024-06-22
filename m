Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9BD69136E4
	for <lists+dri-devel@lfdr.de>; Sun, 23 Jun 2024 01:26:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DF1110E52D;
	Sat, 22 Jun 2024 23:26:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hdMMaJu2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE1BC10E518;
 Sat, 22 Jun 2024 23:26:00 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-42198492353so27068525e9.1; 
 Sat, 22 Jun 2024 16:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719098759; x=1719703559; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=uNZIBBitXPi1uUiKPoj+62/BSgetTcrhDK59sUyVjUo=;
 b=hdMMaJu2Lfzq+kirPixF/1bRCM4lshymqhV6G7edvGmLTt7R56SE8TFN5mk0l+qkm8
 BJ8/u0+D4bGDEjv5/DdLomB08TCPg8sPTzfIjOrYYHlEWRk7TDaESivMvWw4roJbJFUn
 2DX62roOZnR8cKr4x2MJVeXo5rvXB5glOzcH6wQDFsGDs6dJmQ5sKgxzyeWQWubWD2jj
 d9KO1DThBAew+yCKOWOhaGYgEs8LfYFpXTEtg6k+7Anp3U8Zh9XILKSk1cIPTG7eZ5JP
 jVTxpyPrP/aV+WeXchVxdjzQ4WXr9QZ1Ge5bP77cJfFkmVgHCATQMY3+h6XrmkZGbaur
 uHGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719098759; x=1719703559;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uNZIBBitXPi1uUiKPoj+62/BSgetTcrhDK59sUyVjUo=;
 b=MQR52e4oh0/HwZ+J+zVYiE0Qg4djCz5aFRxq0SyMbYtuQ9A7RRLbZ8YuELr2kHyMtN
 6nWhCohqVGhmGekqQhNfas1pxbuB1px4rkbkuAUOfw9p+JZzQrzE7DllvNrOlYEFTm0n
 aSBtKNEN9Emg7gmxfFVUqzmp917S6apUP9ovY4ZPzoGYX/fXvSWr1NBSwJmwIj4LdN4c
 c89YgkSjpLQW6tlTpia12PP8+Xz5fenAchM6Dz+OQiNBFuAFrKGQC0ZnMDS9mBwL9o7K
 mE6wMizP78OoR9iLRSh35H3Imv0xGe59ns5mS32ZIoVW6VDE3F/MOBZBQXpmx1xFCtkX
 0DmQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU15yh50kneLAhbjuHAQ7t73mvujeiGT7g3dywFS0bHV1FdvX/o8oZsF37vbhohY1667Kj1GHH8x3o53iPccRrqdBexaey8s987zW2rxgNHAArbSvkCDbgUYhxXRvjRThMK8RuLkQv2MgwCtYaOIwyD
X-Gm-Message-State: AOJu0YyVmYheeTOtsamcbdxa1Tw1sKcVaZy08Olfpy/abJ/k9pJYGHB9
 S0cSWLvAMkStL/roDYR8ihpWGfUNPp+o9MbXNvYRV60dhGwO/rDV
X-Google-Smtp-Source: AGHT+IEgNo+6duAt+aCgvMCkwCVQGht/gvaa7NRc/S63e47o7jVhTD+sGrZavu2g7pi1hRkGDj8wQw==
X-Received: by 2002:a05:600c:3209:b0:424:7d42:fd7a with SMTP id
 5b1f17b1804b1-4248cc2b71cmr6092835e9.15.1719098759079; 
 Sat, 22 Jun 2024 16:25:59 -0700 (PDT)
Received: from [192.168.1.90]
 (20014C4E18129200DEAEE2020304A5A2.dsl.pool.telekom.hu.
 [2001:4c4e:1812:9200:deae:e202:304:a5a2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4247d2190desm120301875e9.48.2024.06.22.16.25.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Jun 2024 16:25:58 -0700 (PDT)
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <trabarni@gmail.com>
Date: Sun, 23 Jun 2024 01:25:53 +0200
Subject: [PATCH 3/4] dt-bindings: msm: dsi-phy-28nm: Document msm8937
 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240623-dsi-v1-3-4ab560eb5bd9@gmail.com>
References: <20240623-dsi-v1-0-4ab560eb5bd9@gmail.com>
In-Reply-To: <20240623-dsi-v1-0-4ab560eb5bd9@gmail.com>
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
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <trabarni@gmail.com>
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

