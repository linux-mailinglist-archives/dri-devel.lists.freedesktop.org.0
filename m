Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B4C274166A
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jun 2023 18:30:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F45010E37E;
	Wed, 28 Jun 2023 16:29:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEDF410E37B
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jun 2023 16:29:54 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2b69f958ef3so62261471fa.1
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jun 2023 09:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687969793; x=1690561793;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=9eMvEkJ/XegETFODHiz62mk7KCxYtx3hl5+l1ieaHBA=;
 b=M2eG9b/rwLJbJ+ZYensGn99Z3sahqkhwgsICE+uWcaeCOhsMZixj0R91WrZhWHqvcT
 n077rgit6FDUr5nM+sZR6cA1yP9+24oT3o4DzuvO5+NGFm2ZSHsfTWKQSmmq2ClZweEH
 KU0lHXDJObPPbiBqKhxzrEB2ZPPFI8it67dn8IqsxVpiJmTQKFanRhkpwsx3UmQuQV6P
 FN0/+23yrw/BmMu+s+bAodxLNjgUYIK6dwYMMOG3TsEfZ5zhdfnvcisUm26xEq+oBd6v
 SElLQ5rIRNneoicmeE1ikfUOSowdZa11gUYoCWgqZo6j/h6BHzPhG0Fh1tzyJAUjIspc
 lUWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687969793; x=1690561793;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9eMvEkJ/XegETFODHiz62mk7KCxYtx3hl5+l1ieaHBA=;
 b=Vj+x2tRZRylO+FUCwC58PEZVnVaTB1XUPR2vCKUbNcQi7eSEijQRRccgxbEtYqlRu0
 Z7CaZJ6+6dGcP0883iaY6tMY5GGeCybGsJvcnJB2aTxD1f/xHvfeCBOSBjBQIr432BuC
 /xoPmJ7HEwCpL0J+0BE/M8lkcIAdEuS2Nm1r0H24C5xauXISOZkef7oL22v/bSOl7VLO
 yXYCy3lWisITLR28wj0MJQl57fIrFclklRfq3+ZAg0RWHMn3Y7cyNIRgu8AZvD4FszPK
 jU+jlZkT6r/MCLvIJDykT2EXg2065WNYU5vvvklNicg7UL8wOuu57Vpi2JBt9d0FaWbd
 Rd/w==
X-Gm-Message-State: AC+VfDxVwcxsPEqMn1wyZa6nU/FE7sBZURemVVHyoUoiH+DbvOD6IZUf
 zywvm961f4tzLfdvbc+YZ69zyQ==
X-Google-Smtp-Source: ACHHUZ51B3mrrRAOt7s7WF2oHJ0SQg/cpfsp3d3HETCr5iBgITcho1tWvUElbupu3H1F3zZdBZLC2g==
X-Received: by 2002:a05:6512:2024:b0:4f9:dac6:2f41 with SMTP id
 s4-20020a056512202400b004f9dac62f41mr6940702lfs.2.1687969792904; 
 Wed, 28 Jun 2023 09:29:52 -0700 (PDT)
Received: from [192.168.1.101] (abyk82.neoplus.adsl.tpnet.pl. [83.9.30.82])
 by smtp.gmail.com with ESMTPSA id
 v28-20020a056512049c00b004faeedbb29dsm1678783lfq.64.2023.06.28.09.29.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jun 2023 09:29:52 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Wed, 28 Jun 2023 18:29:47 +0200
Subject: [PATCH 3/4] dt-bindings: display/msm: dsi-controller-main: Allow
 refgen-supply
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230628-topic-refgen-v1-3-126e59573eeb@linaro.org>
References: <20230628-topic-refgen-v1-0-126e59573eeb@linaro.org>
In-Reply-To: <20230628-topic-refgen-v1-0-126e59573eeb@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1687969785; l=919;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=PSg1b4zAMPXvW/Hco4OyLK9NQz9E7zBcyA/3he+DDzs=;
 b=+OPEQNKdq4VxxdpETYujbLytJ4CfZJo5uT5nocAXxJ+Eyh9ZqgvBwYThV/7U27B/FHOT38/Me
 IiuUpQ7aMsjCNHKV40ETBzW3EwM7J1JB/Vf8qqxL5H0O4LwU2c1qKah
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
 freedreno@lists.freedesktop.org, Konrad Dybcio <konradybcio@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DSI host needs REFGEN to be enabled (if it's present on a given platform).
Allow consuming it.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 .../devicetree/bindings/display/msm/dsi-controller-main.yaml          | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index 01848bdd5873..76270992305a 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -166,6 +166,10 @@ properties:
     description:
       Phandle to vdd regulator device node
 
+  refgen-supply:
+    description:
+      Phandle to REFGEN regulator device node
+
   vcca-supply:
     description:
       Phandle to vdd regulator device node

-- 
2.41.0

