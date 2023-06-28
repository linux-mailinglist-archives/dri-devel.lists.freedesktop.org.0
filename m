Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CAD5C741990
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jun 2023 22:35:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A74D10E39F;
	Wed, 28 Jun 2023 20:35:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A31F010E38F
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jun 2023 20:35:32 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-4f004cc54f4so82394e87.3
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jun 2023 13:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687984530; x=1690576530;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=QI4S80IbpmJGWcAHJEYaCz9cOc4lq8KkuI2BUdGIiSM=;
 b=zDPaHKBHxTObBtw3Hs0Mz69O4uvQdEBwf5EyOXQImUl2K2uVOI8qzYxP8hCT90sqqh
 i7VcfOezs2HrZm445XlTtuKSaNlq++XGdQfEDYPQh2TgAXGmwxT7Gt4kcq+I0U/dB3F3
 TOJOo+da6I8vabJE0sKX1AOb4aPUa2JFT6sZxu+EQyLiK9NkddQ63gDD+d1UFKO9+KZJ
 9DCB6c8vQd7vA2XGUpXuejiT8RhEuAOiF92QMO+5PIvzN2khfhvMfuwI9ktAP/GXpEk4
 jKplptsvuReqy8QrsyQ2GpQOMjRn7CX71P3fmumO0VorHmWUXEBurpMRtFAnnczP7vyI
 Sobw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687984530; x=1690576530;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QI4S80IbpmJGWcAHJEYaCz9cOc4lq8KkuI2BUdGIiSM=;
 b=FUVLGqPZmh9KRaPa4q7v91SSiZprReaLK/1jC4gA3uj1KbmwUJnxybmEaAqd7LBAUu
 Ge3RlgkQ23OfMynMe8VkQCtEAY6rRLfVf7zrozI0z07CWs3klrJMCSAyQmBNXQUlNkyj
 lbt95Lzr/0mfRNkEE4mzj8ZpidhAfAjE7yqFYiyQLm4doFoj2Bg661K+0At+xBKYCX5k
 pSVznT42KSqkjl8EGfFXQzoLPvq6vJN7XjHAe8Vo9LntvWHtfzXtAz7WXk71dQ26lbv+
 XP0Nr0J2F+ukYKLP4DKsvzXkQYdAARn2cc5hG0U78USkLB+uz/Aa0mk5GC9ReOyxz3zp
 +aqQ==
X-Gm-Message-State: AC+VfDxuF9tRYsxWkF+bDznCiqh6qtdlFSCxfvzrpk1T5zV+SBdPSfXb
 kwju9aT2Rp1FIzcFw3YypTPvww==
X-Google-Smtp-Source: ACHHUZ5mm5lykLFS5DX+1deTfpudBEK5Y3wGVrKtgQxS+2FvQ799hxJNur5yRQHPaEncR2ph/UcBTQ==
X-Received: by 2002:a19:6445:0:b0:4f8:74b5:b4ec with SMTP id
 b5-20020a196445000000b004f874b5b4ecmr19816524lfj.41.1687984530292; 
 Wed, 28 Jun 2023 13:35:30 -0700 (PDT)
Received: from [192.168.1.101] (abyk82.neoplus.adsl.tpnet.pl. [83.9.30.82])
 by smtp.gmail.com with ESMTPSA id
 m25-20020a056512015900b004fb86c89fa1sm753363lfo.135.2023.06.28.13.35.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jun 2023 13:35:30 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Wed, 28 Jun 2023 22:35:03 +0200
Subject: [PATCH 03/14] dt-bindings: display/msm/gpu: Allow A7xx SKUs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230628-topic-a7xx_drmmsm-v1-3-a7f4496e0c12@linaro.org>
References: <20230628-topic-a7xx_drmmsm-v1-0-a7f4496e0c12@linaro.org>
In-Reply-To: <20230628-topic-a7xx_drmmsm-v1-0-a7f4496e0c12@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1687984524; l=1360;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=e2+Rw2GtRwMdjAHM3qAAk8/OIw+eBRortjNyKdEVon8=;
 b=yf24Cdam9WGLA3sF+Jtzk5K6coKWXVq+I+kC34pHa547AjU0E+y/7iswJU7WtpRl/rD+hS5aV
 ggU1nB3z0n3ClJFh6Qli6kJeMVihVDAGia11ruDJ0lbSnoSvsxWNsX1
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Allow A7xx SKUs, such as the A730 GPU found on SM8450 and friends.
They use GMU for all things DVFS, just like most A6xx GPUs.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/gpu.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
index 58ca8912a8c3..30bfdfdbe4d9 100644
--- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
@@ -17,7 +17,7 @@ properties:
           The driver is parsing the compat string for Adreno to
           figure out the gpu-id and patch level.
         items:
-          - pattern: '^qcom,adreno-[3-6][0-9][0-9]\.[0-9]$'
+          - pattern: '^qcom,adreno-[3-7][0-9][0-9]\.[0-9]$'
           - const: qcom,adreno
       - description: |
           The driver is parsing the compat string for Imageon to
@@ -197,7 +197,7 @@ allOf:
         properties:
           compatible:
             contains:
-              pattern: '^qcom,adreno-6[0-9][0-9]\.[0-9]$'
+              pattern: '^qcom,adreno-[67][0-9][0-9]\.[0-9]$'
 
       then: # Starting with A6xx, the clocks are usually defined in the GMU node
         properties:

-- 
2.41.0

