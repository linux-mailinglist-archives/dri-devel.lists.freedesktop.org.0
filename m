Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C9059695F
	for <lists+dri-devel@lfdr.de>; Wed, 17 Aug 2022 08:21:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE66D10F3ED;
	Wed, 17 Aug 2022 06:21:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F04610F413
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Aug 2022 06:21:04 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id z6so17776328lfu.9
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Aug 2022 23:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=F1CoLNi7AKqMTtEG1BCU/Ns1KxSKYwE8yDEdxSlCoH8=;
 b=jr/5t/QN7wSQM3bJVAQZrkWuZIYE82wSjMtHi975dWHxRiYmKswsbMGWFk+n1VJpHL
 NHb6Qtmu3MVAwIvBgqZBxLX/Lh1qt7DC5q3lZ9T2DI0E/8DEEYu1qJhI2RJS0Meq9Q80
 MRFJkgzF6jTlYLwMbTkOz6S1Wbkb+KDjwBTM7k7zp4JBAsssaV8Vj3s7MIc3Tl/kQY2n
 QwOxowtUzJEucRT+gAZxOULafrADgBRnM0YOZc0XhFwILge3duxjQYyrNxxQUgBc+IVT
 1nxTGalFV8QtXSCI/rWueAL7AVzurWYac2kIa5h6wcuZp4vvqnJQKz8YNo5TeMBTATZi
 AWOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=F1CoLNi7AKqMTtEG1BCU/Ns1KxSKYwE8yDEdxSlCoH8=;
 b=P/LKczh9n5qQyN+KyaMDkyOpdX2LBdn09atyGc6AEefX60GSH+nG+k71PdhGy/qUsL
 Zujls0xQqDHh0+1IsSs5wLtHUulsqcnWFmG5E/w2VP57JRanofhUXbvhSNTIQn5p0mUZ
 Q6/jnh5fM6oyOQEhaNXU7WigSUsfwWtiN6vKkSLSsKlXP1g27kpQJxJKkLRTimQFNZsS
 zYloHotOWUfYRhMVrOCZogeO5DR5s87s9E6gDyxGz4eNtfeewSWnAoU//1vGhlUH1PKf
 pLSaXoENZLULrn5NJ0qLj967oAQTsRtVb2qkaMtHJVEIpVYMc6J5QBNZMHh+Y5M5fQbR
 MIZA==
X-Gm-Message-State: ACgBeo1eadh+rPKzGmdTnVGXeVYVfcgrFJSz2glcpUNgqsNQQ0DImNMA
 S4p0U6X+qhpl1Xv2xABotLUxqw==
X-Google-Smtp-Source: AA6agR4q9Tm93umc2dmOf06x5Qwp61RdkCW0A/RNbxL/dQdwoKjhPA27IRJt8+n+Ad3tQnDUqqeRbw==
X-Received: by 2002:a05:6512:3503:b0:481:4470:4134 with SMTP id
 h3-20020a056512350300b0048144704134mr8079473lfs.42.1660717262326; 
 Tue, 16 Aug 2022 23:21:02 -0700 (PDT)
Received: from krzk-bin.. (d15l54h48cw7vbh-qr4-4.rev.dnainternet.fi.
 [2001:14bb:ae:539c:1b1c:14b7:109b:ed76])
 by smtp.gmail.com with ESMTPSA id
 u27-20020ac258db000000b0048b0062a14fsm1581002lfo.144.2022.08.16.23.21.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Aug 2022 23:21:01 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Del Regno <angelogioacchino.delregno@somainline.org>,
 Loic Poulain <loic.poulain@linaro.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Stephen Boyd <swboyd@chromium.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/5] dt-bindings: display/msm: dpu: opp-table fixes
Date: Wed, 17 Aug 2022 09:20:54 +0300
Message-Id: <20220817062059.18640-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Changes since v1
================
1. Use opp-table:object (Rob)

Merging/other work
==================
There is a conflicting series of
https://lore.kernel.org/all/20220710090040.35193-1-dmitry.baryshkov@linaro.org/
but I think this one here should go before to fix the issue before the
refactoring.

Best regards,
Krzysztof

Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>

Krzysztof Kozlowski (5):
  dt-bindings: display/msm: dpu-msm8998: add missing DPU opp-table
  dt-bindings: display/msm: dpu-qcm2290: add missing DPU opp-table
  dt-bindings: display/msm: dpu-sc7180: add missing DPU opp-table
  dt-bindings: display/msm: dpu-sc7280: add missing DPU opp-table
  dt-bindings: display/msm: dpu-sdm845: add missing DPU opp-table

 .../devicetree/bindings/display/msm/dpu-msm8998.yaml          | 4 ++++
 .../devicetree/bindings/display/msm/dpu-qcm2290.yaml          | 3 +++
 Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml | 3 +++
 Documentation/devicetree/bindings/display/msm/dpu-sc7280.yaml | 3 +++
 Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml | 4 ++++
 5 files changed, 17 insertions(+)

-- 
2.34.1

