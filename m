Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 368A5855DB9
	for <lists+dri-devel@lfdr.de>; Thu, 15 Feb 2024 10:20:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4373B10E462;
	Thu, 15 Feb 2024 09:20:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="P7DCiQCA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4E1610E46A
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Feb 2024 09:20:33 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-2d0e5212559so7383351fa.0
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Feb 2024 01:20:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707988832; x=1708593632; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=/RMgnrHnFvnkqmQ/HYz89uTL6/4/6fzEmMqCiEApO7Y=;
 b=P7DCiQCAJzzov411or0P6kBxcLTIdeI4p69TlkjzJtLsKc7PjtX5/U+xN1bmw4I+PM
 AC6FFAKyor/KtQF4BNPltEXGs9RbGi7Fygn8tMbbrrxf1zlY1IZ0aIwjpbOPKYyt6viY
 TWLQMY8++YftpsR7C6Qrd2D2alCZr/0iHz46YlraOmG8T7sx0EYPE0ZIs5fYAHyZYBVm
 MTjxUBjusKUeyj+IjgX/VU9lJAWoH+OI01DY3Tll7fzFnx2JIKDO8fe2LYKO5ZOQfub2
 h+hM4RdZ4oSgaUQK64sNpGVsDIl8uYvzVZGnPaLtcrSOJOstL+r6VYcq6rCCOo6RqEAM
 Zorw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707988832; x=1708593632;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/RMgnrHnFvnkqmQ/HYz89uTL6/4/6fzEmMqCiEApO7Y=;
 b=em0KatxyIXLSyrDSpObzdyZ+kSzrZx/2aB4vKXMjuPKXhOjEdK2gJY3uS7+LutbzfG
 CI4R+yEX1NdZ3LU+0mWOBFRBoJRhmcN0MtbMrHggxKf16U7Zb2XjPcKsp1xNFF10T3+m
 QImOG947rWEZIXIsqvzJLm+uxCdEOEBHUyYPvyk70/vJa91n3Nj/vZin/rlK5mNnj5WU
 VHlRA51cIJMZvAzJtP48AQeTrvZ8tCXfUQDHuf1gQhWk25RLLMNzwHuvMx4pyQgRLmsw
 sPDNQOCySwwl8lWujdVBmjR4UhHy5JJjdrKPCGt8aGV5E+g+ncMWdZ4ZLW4aZv5u7byT
 rddw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXXyiXjt/hkqVi+hRnPz5prhTeMF6ZBsHhlrpUbb7qt5OCjgnVfL85dr1Cbgc6GEpCqWQ7adHTOZqK15zVLbgaVVquaPCouQzywXXZZReC7
X-Gm-Message-State: AOJu0Ywks47p6AIzmiMXeqnMMJCiPraNBC3pWG0Wm2CYEUKUkJaodSiR
 AvtmDbzedafh+FnI+qUWScPMUwj/HEh482yVv45xlh1nrWoD26xYrZcD/ZTL994=
X-Google-Smtp-Source: AGHT+IHjoLYwjQO2evmWDkGzS21OU9pSICDlRxJhWfQtTk/vibTdzci6Q9CTyCXn5Ys3Glr07s+Xqg==
X-Received: by 2002:a2e:a1c9:0:b0:2d0:c308:5f6e with SMTP id
 c9-20020a2ea1c9000000b002d0c3085f6emr771443ljm.44.1707988831872; 
 Thu, 15 Feb 2024 01:20:31 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 l8-20020adfa388000000b0033b66c2d61esm1156435wrb.48.2024.02.15.01.20.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Feb 2024 01:20:31 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 15 Feb 2024 10:20:23 +0100
Subject: [PATCH v2 1/6] dt-bindings: display/msm/gmu: Document Adreno 750 GMU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240215-topic-sm8650-gpu-v2-1-6be0b4bf2e09@linaro.org>
References: <20240215-topic-sm8650-gpu-v2-0-6be0b4bf2e09@linaro.org>
In-Reply-To: <20240215-topic-sm8650-gpu-v2-0-6be0b4bf2e09@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 iommu@lists.linux.dev, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=799;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=QCkz/HAlxsbVXDc+FMCgFBx5P0nVAWSA4UynpoVJyfQ=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlzddasnMca9nUPOla3cwN7PCE0JduOPzXxA2qqUzW
 e2kOVoeJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZc3XWgAKCRB33NvayMhJ0Wj9D/
 0RrWe9Gn5RAb867YZH0V9YAQVDSuc+HT6lV+Agq2y2GLHtzIvXJ4JsruwNsmuq+ZqPe2MkIMFnx+/X
 MjUYuej5kzmpVhL6yKUf8hm1MGWPg603I+yQpGGDbRtv/LMwkXU/25tTDKJVWNA51megauxy0xhMcE
 iyNW00psGC5hAqM8sz7hoIfgxkH3en1jUV1FRO/SqwecGflASYiAu3ipm966nrm0+slYNljFvYHhfs
 KsfSSCFLpDtSF32DZxeBvCEXlqWpZ0iatAC16NfWMcxvwnVDRC5Uvg8zZ2cjXR4HJCH9UG4xUI5MjZ
 5R57NvkOFIENTbZlLisDk+KCJrKjwxia2SYeIXvSAt8tXtRC0ptAu8nAjQlukMpigIoz3qwnDduS0x
 Xc7RSPzhVpLd7nayvRfGvqKGJrpoyQYQXCK/WKvln+fVnOJjKCkxJW0OSBSIIXl7s4CUpLU8PNhRiA
 0VGRhC7l6fpzGNMKk3ROgQ7IEQIJpqr/Sk0HtuobQh+a8hid4CV0EDYZylLf7neHtwD2dIK6N8WML6
 tTK8CC0A0vJYJOUlYuSfXlQU0F59EBeq8S+5xUI+nLMsVPaOr74uQjXV+uXpQdemascqVz3dWudKwF
 MJat0Wecksh1yK/yjz0ofkVSRa5Bdv/rpEx2JhojBfqBnGuGL5yEJp2AMPQw==
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

Document the Adreno 750 GMU found on the SM8650 platform.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/gmu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/gmu.yaml b/Documentation/devicetree/bindings/display/msm/gmu.yaml
index 4e1c25b42908..b3837368a260 100644
--- a/Documentation/devicetree/bindings/display/msm/gmu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gmu.yaml
@@ -224,6 +224,7 @@ allOf:
             enum:
               - qcom,adreno-gmu-730.1
               - qcom,adreno-gmu-740.1
+              - qcom,adreno-gmu-750.1
     then:
       properties:
         reg:

-- 
2.34.1

