Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 870CC913DE4
	for <lists+dri-devel@lfdr.de>; Sun, 23 Jun 2024 22:03:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB53910E0E0;
	Sun, 23 Jun 2024 20:03:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="UOR6W2y7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B6FE10E0C8
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Jun 2024 20:03:31 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-36279cf6414so2816997f8f.3
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Jun 2024 13:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719173009; x=1719777809; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=G+6qL3IbNbDQ7NbNJW9ZWKAgjOjLvdUH02qEn+4RvBY=;
 b=UOR6W2y7MWQSj5QaDmQJ2CCN2oeahJZnJ8Uq5z6oQCw0VhtlwVbjaHZrjNUrmwQS0R
 DhC34dSZQNx9uKL8AKCvQqldIlktaiE8haIJlLdZ+WC9Ge8sHcqhiiMo8KEFE95utm1d
 gKvnhAcoJsIIXsHDhl3dJa6KwDdXOiQNlM58pxb3WURfdavgFI3PYEt3P/kHkpbfSTgZ
 me9V6/9GcNDRFnXdQnFakM0pav+EbjUaFDUXqccXoFaK63gqLzwTS88uJ0wStZX1nJcZ
 Dx+XeuLSegNEyvrMFB3fu/q4WkXyKBET71JdcyEXw0jsjyD1/a//Km2AkPYmuuR6ehrE
 Glgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719173009; x=1719777809;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=G+6qL3IbNbDQ7NbNJW9ZWKAgjOjLvdUH02qEn+4RvBY=;
 b=Xjq3RBM1vCdlcdcT1Qge9lfTX9wPCo4dGPRl+dVdqHAUYQSUBm+q5A9TzkS47CLYuG
 B9BsGQiSaXWp/GvwAZyho/kzkJSIS430ofDXmMqSs2U9RAqZleDXBq3bC91dmQ1WFnZe
 Urpmmqbhgo7sC8bz4rk44CTW+uotlCIl2w4ZVGb7xCxZkkcowUKil26ccbU4d8uodjQW
 OEHQGiCi3+QIUYrY4kY2muOFKufhITEULcObgjQci6V3w/7UYxILUy4yp5iO9XHUBo9a
 /hs7ct67MS9D/EnBknzp0B4uvSEXH5onEcERBI9PJ3fb1aNj+uoUxdsqzhP9y3qbTknD
 7VlQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVjlmgZk6At2XviWuW/aooLmUePSH+eeKO0P0creTe5sHXonllLOo+MQZMKS94FEfPDyWgrXBgS9t6v2gAv468KiQzhvKC6KaPa9/Qo9jYs
X-Gm-Message-State: AOJu0YxUi6bhtfV6nE/CF8IqnQY9WBXq/oMMN5cBI62iMEBKBRi0VQe2
 1frwymhV2/iGPqi7yxhGpVUZHd6Ze/DOC9ncwDvaWqSC4qUtyo4/dqu/ulOpmcQ=
X-Google-Smtp-Source: AGHT+IHSfTUXKpuQEhA7mqTVvrXfmo/dGWjKRQLxfYcpyBFQqAWlUT5gQ4Nn8QebW4B8BvDmSP56lw==
X-Received: by 2002:adf:ec51:0:b0:35f:24dc:ad97 with SMTP id
 ffacd0b85a97d-366e94d15eamr1671210f8f.34.1719173009661; 
 Sun, 23 Jun 2024 13:03:29 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4247d0c54c9sm150685345e9.27.2024.06.23.13.03.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Jun 2024 13:03:29 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sun, 23 Jun 2024 22:03:02 +0200
Subject: [PATCH v2 3/4] dt-bindings: display/msm/gpu: simplify compatible regex
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240623-qcom-adreno-dts-bindings-driver-v2-3-9496410de992@linaro.org>
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
 linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1024;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=kTOjE3SJPwtUEM3ek0Ts7GXtebcamPz3ppbmsVldcPo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmeH+Ie3/89b8rXNK7ftiXK0IL3Kr+0MXppEPhl
 AfxZvPNu2yJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZnh/iAAKCRDBN2bmhouD
 1z/fD/9gbJW6LOjV3ohG5X8o2SeH7jWNu/xjf+IJB2X9lBDx3kxyVoQdooX/Rc/m+82NlC/rFuL
 64CzgFWRwPSrTP1+7GuPP7N0ICU6XLLRgpxStTrz1HEGk+mep2MSZPtjWlt85+isckAK2lBhnIk
 lkfj3QxPQjr5UZ6cvjgHRaU86LK6PiVC97duB9lmilZxv+7KtoJUQLo3mnVjMLgV2nbVfrg/UX5
 GcGXBOrKSgd25hrOMLHMddMuG707Br6f3lfFOUDJPUBn1RimfSjOg9nAy38JjJzPeBO2qmXRyAW
 /C0xtyXRXJ3HHiTXhDiVuK5DoGs/7EvwG0cbKhqpaW8dIetDZ5x7ohID1eGTJ5dI/yqna+gjPS2
 gx23YMb1ZYZTFLhQmkzvPBgzCuu+gF7tOmo67x1gbKLBaG0xkNWEUHVhI4PgNYwknvc/MSQ2rhS
 9udWYWRO41Jfnr+4DYhiHLlBTnuRDQDaowvjGnJdiwv/XSosGCAS3XpltBbptpLW5iq6zTgGb9C
 uYPdptPPSr182ldp1oaZcNLDSdb+m635epPwT6SWF78TFKOy8w3Fwb7DUQFFJqS17LhQgnUrnFT
 7nfpmaDVCASVRyZzwVqMs+p7771BoUvUDRaZyvJRLdF5bgOfhyvSZfIyrrKWg7E7lqpN9WsSZ+w
 pFYC80/Ftcyr0Pg==
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

Regex for newer Adreno compatibles can be simpler.

Suggested-by: Conor Dooley <conor@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/gpu.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
index baea1946c65d..03aaced1abda 100644
--- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
@@ -17,7 +17,7 @@ properties:
           The driver is parsing the compat string for Adreno to
           figure out the chip-id.
         items:
-          - pattern: '^qcom,adreno-[0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f]$'
+          - pattern: '^qcom,adreno-[0-9a-f]{8}$'
           - const: qcom,adreno
       - description: |
           The driver is parsing the compat string for Adreno to

-- 
2.43.0

