Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DF9A913DE7
	for <lists+dri-devel@lfdr.de>; Sun, 23 Jun 2024 22:03:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF87C10E1D1;
	Sun, 23 Jun 2024 20:03:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ptChiq6E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C19E710E02F
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Jun 2024 20:03:27 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-421f4d1c057so31205495e9.3
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Jun 2024 13:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719173006; x=1719777806; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=dRwsnzJtrZqzT+Su1tk781Q5TL7jN+Wj95SuluafSco=;
 b=ptChiq6E1ayWqxEtbNhCOObWJ/sc3BVFlLj/lp8nVV8vX72VNX2ush4KvjvLIIytof
 qeKxanDEXVesKNyOQPkL1321/Ozf/kJsMWflDEQYlAX160lZDl8IDivOFAbygGqR283V
 N4TOodDCrm/ImYTuhnbr35PvpB7LmQJB8rbYt5ExeYOghcFdHosFhrKrsBoWHXWvx7eC
 seosG50rXQKsKBlPa3qSlmcqymDWqVLyTi2GQz5uzBf+gtfpBVYNJRK1YJ+r/OfmCtHR
 76n1qTCaL6NRQ56MxvsL3/2Xv+D7jMi5i8wyThHkOfXoWuctQFpMXPEa+FFeyitg2tge
 N9qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719173006; x=1719777806;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dRwsnzJtrZqzT+Su1tk781Q5TL7jN+Wj95SuluafSco=;
 b=cJw5/4FMGNtOzGc0N7RnYBcRx86wG7+Cu29HThnXcCXM2PRaCiEj2gaDNovh9wAeQ2
 ar/qyQa7kB2D9mQvLdMh3uTsmF+hAAyZS5MYPtb3tJU4N0WVAbNmZ9BUpMGPzQ57idPt
 T4fp8/oOdAvu+wbeJ8HS+hH1Qhk8BINkc18FX1Uo1js7Khr2DQkk5GRCWaNR3fp4TAgY
 NxzrDgTZNMdRkRvmc0dAttluowQoJe+2H1koFwtauSoUdOb42pB1VsqhO6koV7+oLFXc
 XCYwPh27ICRfFQMgqs8TLCPMolhD0EUT0B2+Q86OwML5gFl4Bomd+1uQN+0sKO9SjY+O
 8w1g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUy3rg2GoHbzUXBjEaxyPJkM1J0kOvsJQ2AFp9JYnwtO/y1YpCkb35AfBo1n+mjXjnLJ5eNx6TpL7f80PdNzednvTZmbYQQGTw+wUYAGSBP
X-Gm-Message-State: AOJu0YzY5UKwbimn0dVi292DvN5p6kBhbFF5ft5HdaUp5heyQv6X3Iiq
 v3W8r/X3V9avPW4UWtkPjmKhVBRMl3PaDeYY81p9BGrq2UWe3Hl2HDmTuPpuibk=
X-Google-Smtp-Source: AGHT+IFJpv39zP4029Ssli5x6YQ1Ds7nJ3+NECE5rAgHlYqbz/JJirZIdj6Ljc5SlMfSG2LXJ09QnA==
X-Received: by 2002:a05:600c:240c:b0:424:9477:ba19 with SMTP id
 5b1f17b1804b1-4249477be72mr1664375e9.0.1719173006056; 
 Sun, 23 Jun 2024 13:03:26 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4247d0c54c9sm150685345e9.27.2024.06.23.13.03.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Jun 2024 13:03:25 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sun, 23 Jun 2024 22:03:00 +0200
Subject: [PATCH v2 1/4] dt-bindings: display/msm/gpu: constrain clocks in
 top-level
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240623-qcom-adreno-dts-bindings-driver-v2-1-9496410de992@linaro.org>
References: <20240623-qcom-adreno-dts-bindings-driver-v2-0-9496410de992@linaro.org>
In-Reply-To: <20240623-qcom-adreno-dts-bindings-driver-v2-0-9496410de992@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1071;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=4/9Aq/arFNn+xRSwSsZRPh1izhnXURJa1LwMF+ulWIA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmeH+GBCUCUJpJdjHiAhVps4qq/mnaC30VIybMf
 k4SsU1FP9WJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZnh/hgAKCRDBN2bmhouD
 1zJpD/4hFM10qme9VeV2lS5WgpaIGfkSCtPbJ9yqeAmaQunz1ilA8smxq8cdUVXE9gLxmFhU5l1
 lQI+Lt85hl+Y5dXEqzVKxzrxeWj7YMdNX//e9a3b76kZPr3OESjU6xFZ8wYcAsFPyTqiKUFh8FU
 hGD0Cy+ql0nbC4mA3mQSyQDKuDymYy55LJjnruaHgjIx8dE1LugaPIOsIbfgU2tC3TMhLBqkvrw
 jpIfJu0wJd2iY7blxkFwA2i3gAvo1FHIlj9k0oUMNo/miPH4Bc6NEux0tDGkDftTKM9gn67wz4D
 7YdaDJ24YV7g1pckorl4PYZS6cLcJ8+MXl+ovS4oYAf3/21eqYYUiPTCYvLvCjDCh/t+gcki17U
 b5gZFIG+X7H5IDDEQNk9QWbjP9fNQdqeMkgyEF4p6fF7j10zzpGh4IllsMEO2bY0h91CXKqG+A0
 Kkku9mY+F7xAWHFIB38ZkRxZFcP3VicGP8HmGnase3+7GOWNG+xSNnkzUdRhwB9uZH/taKN2e22
 v8jUhjV3gEsrLWjXqsrIja17NJDgakeyCKRqJizfHMBJIuE1lkP642irbb2BCnfknwUSdQVhDpM
 EaiPu+ZJ9ZmllVhplasqbS8nXwQoCwCL8Ct9Mm4dmk7Y3SnKlr8mxcNmqB08LjmKjTkxsEVronl
 XRvouwunMTYdgig==
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

We expect each schema with variable number of clocks, to have the widest
constrains in top-level "properties:".  This is more readable and also
makes binding stricter, if there is no "if:then:" block for given
variant.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/gpu.yaml | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
index 40b5c6bd11f8..253e68d92779 100644
--- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
@@ -32,9 +32,13 @@ properties:
           - pattern: '^amd,imageon-200\.[0-1]$'
           - const: amd,imageon
 
-  clocks: true
+  clocks:
+    minItems: 2
+    maxItems: 7
 
-  clock-names: true
+  clock-names:
+    minItems: 2
+    maxItems: 7
 
   reg:
     minItems: 1

-- 
2.43.0

