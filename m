Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F90885FD2F
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 16:55:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 081AF10E99B;
	Thu, 22 Feb 2024 15:55:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="E7KcAFFw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E33D10E99A
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Feb 2024 15:55:24 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-565468bec51so1051772a12.1
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Feb 2024 07:55:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708617322; x=1709222122; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=E/qRBGuntVpmUEzLsJY9ZgDe9uMSJ+xK+pvUdRKBs80=;
 b=E7KcAFFw8E+CQQYTcd5Y8ldrPYu95M4hMEqEZu7zAGSEWAKR7ZGpbCxe1ocAX6Xmq5
 0/Thf9XKYF4vMckbGox+J2On8c1kPEUYUNGXpGqWq60D6CvxhhjcXsIyyLr/cVe1Vmoy
 +KJ5k6XfBiS0v0Bm/FpTQvGvUxSrZ2j7hrYTtgHXIO+SBm3GD4MYbEMok8qiVhU9JrHp
 agFgvOTx50V8QhFXJ/ZJQoedpz3ouyC5bgnIqmLmcAtts8H7UU0WoQWLqfXb72588kqJ
 4PhCvdXd2g54vkyH82//A96VeRfjnVqMgxR5upmy9iosC5BedJiVdjgkxIhFPF3G2SZi
 FKrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708617322; x=1709222122;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=E/qRBGuntVpmUEzLsJY9ZgDe9uMSJ+xK+pvUdRKBs80=;
 b=dIdV6W/aVP+UlWKDHGWhizU7A+ppayMaT2slJBHIOzRoVzADNEFAAMKcCXQKqzqqup
 i4tVYOzbqDww56qWwfjUpqrvSFqNePSeg7l5xF07IA3H8YJiJpuWqZ4GHMh6kNHyvqS/
 fRfKCZiurqlqcODxzH3NWfhdWO+GYZAKOxpPj2moU+o1aGUG61fnmcYciGuB2o42Evua
 Yk+ydENlEz04VrPQxw/DInJD4J6SljV0LgGUMMQ/sGUzIToc5CQoaQ7oz3HpSluTpr9N
 Alw2PYs3/0TU7d1L8hyRqXLqUO+jzxXsmz4tViViqkefu0BLPjSxMoBfgg8V1hTLY70+
 Ln1A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWD/POXIBN+NYg8RU1n8CbJXNOQYOxcmaAMEmcCGmGjZOW+v47nfI+3fQk+52gfJprUbrViNJ3Bo63KlQs4fHTw0euP5vDKpHjKvjzFUt2z
X-Gm-Message-State: AOJu0Yzv9TwMVYY2q1eqKAvkygInaczj6LhAllVqfg/4nthwXHpIUwgO
 HLlV6qtdE1X8xQ0XUFdvp+vtzxjEUpfZNTcoF3jFOVcgjFXQf7s4rXpjKHnIN4I=
X-Google-Smtp-Source: AGHT+IEM79QWygSavS7FLc1eJs7WoqOaYvTeCTfGxzrVhMHQlzTgnwR6V3UoG0G+3SBVTMXxL/v3qA==
X-Received: by 2002:a05:6402:2021:b0:565:2e3d:d019 with SMTP id
 ay1-20020a056402202100b005652e3dd019mr2162738edb.4.1708617322526; 
 Thu, 22 Feb 2024 07:55:22 -0800 (PST)
Received: from [127.0.1.1] ([188.24.162.93]) by smtp.gmail.com with ESMTPSA id
 v7-20020aa7dbc7000000b00564e489ce9asm1924247edt.12.2024.02.22.07.55.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Feb 2024 07:55:22 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Thu, 22 Feb 2024 17:55:06 +0200
Subject: [PATCH v2 1/3] dt-bindings: display: msm: dp-controller: document
 X1E80100 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240222-x1e80100-display-refactor-connector-v2-1-bd4197dfceab@linaro.org>
References: <20240222-x1e80100-display-refactor-connector-v2-0-bd4197dfceab@linaro.org>
In-Reply-To: <20240222-x1e80100-display-refactor-connector-v2-0-bd4197dfceab@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Johan Hovold <johan@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1194; i=abel.vesa@linaro.org; 
 h=from:subject:message-id;
 bh=Dgy4bpUuD1DREK8e21cUFvAnpbWONI5ldnxfYKMR5OM=; 
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBl125jCxw4MKZFiUZh/ZMZdfvjY3Y2ijItoeR8X
 VZAumqDoGKJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZdduYwAKCRAbX0TJAJUV
 VlncD/9HrYnh9zrnKbDIebEbauG+1baUus8l4qSrbAb3Ntl5fGjkgkHqpD0pJVXqSEEjIfuopAk
 OLIagSfkQ190FupimhKKkBGDvpAVfTolpJufGbLXwcfaZ424E6QMJX4oaCklqX8b06EfyGF9aMN
 We96I77voVT4JkfrOyCAT8G/sCjah2cpGEO9nYywBm1XvKB5wFwa4hqHxgiqG/XjHCDPhIIrQei
 Mqp8WclHbx4jmx+jQc8ylDL9ojoPcBaqsRF870nfQl8kSRDE/BUhI+E0Rt+eX4hDu0o9ILclAzT
 pyDbEm4VkcYK6hQaK8Juz7+tAM7ysu9C2FGghCehIutP6NCafWW9JYuMBdZ3EV4Ha+Ia7QDI6Vt
 CLGQesCQwn6fXf9L5rjPvbbGKj1CpB/dJDB6yE33Ox0+6VyQeQ6V8Unds3DZ7eY7LKWnhvqqVb6
 kAiBZ0mtQYB3b44nQ9Gq+gQbcfsXCQAZj/anTDfqncIblK4rWG/jIegTi23oZTK33r6UjD3Pl2T
 39Wy/JhacD0bK8ACs4kXk0nIcR2/lNLiTUh9N3rRhT5wt8NUJoj0tB+wVf2Yk5Urs8EBYvRj1Ne
 XhniW6npGnqpE5q60USEHV7Cgd+R/i/xrSGqCgnd3fR5ZAWsL810t0lsC2RdK7OAap+JgQuHxbn
 tt1FGK0P8RVK+Qw==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
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

Add the X1E80100 to the list of compatibles and document the is-edp
flag. The controllers are expected to operate in DP mode by default,
and this flag can be used to select eDP mode.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index ae53cbfb2193..ed11852e403d 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -27,6 +27,7 @@ properties:
           - qcom,sdm845-dp
           - qcom,sm8350-dp
           - qcom,sm8650-dp
+          - qcom,x1e80100-dp
       - items:
           - enum:
               - qcom,sm8150-dp
@@ -73,6 +74,11 @@ properties:
       - description: phy 0 parent
       - description: phy 1 parent
 
+  is-edp:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      Tells the controller to switch to eDP mode
+
   phys:
     maxItems: 1
 

-- 
2.34.1

