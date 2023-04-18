Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 15EDA6E60C0
	for <lists+dri-devel@lfdr.de>; Tue, 18 Apr 2023 14:11:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0ED610E152;
	Tue, 18 Apr 2023 12:11:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E533210E77C
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 12:11:01 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2a8bdcf87f4so16539521fa.2
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 05:11:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681819859; x=1684411859;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=fftkJp3Coct54pcoJxqOJznZa4eb2ZsBLmF7Bh2NPzw=;
 b=yT/BiOHJ+Wb2Fowb5VKhN9CkH2wqsNJE9NMZRSDGk4DXvenGL6eOdB8DlC/etQesDw
 dtOy68VZtrLhULwcn9/Mi9WT7Y8P3NAvFpLgTBxc+8AIDLGEScilP24Dh3AA/nx4wMOD
 j3Z9Q7BlS2bnKN139hMOkzsDLGoMk0fPulZVUEm5TosYsVVqzQMizwSXVbX72TBmvagL
 looqHnRRbrN27J2r3pebd4DSAIVDVFu/Et035MPmkDkjTuMHAluOrpHYbTTgAUgD0AYe
 dP3Kq03ixRHzCPq7IzoNQ3erAJ/HIQVJ4AfwP3pg49snXLAoXuIq8GSkth6QU20GOrmB
 YCXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681819859; x=1684411859;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fftkJp3Coct54pcoJxqOJznZa4eb2ZsBLmF7Bh2NPzw=;
 b=FasH8AyIVI6G/VOK6zfEK42jPibWnfH68887ZjdNICM7zXy6+SfKr4KiFR0s3UabyT
 6wUWvS/ptR6tx35u3OzkDpdXKyVCm15bALX6kvzuvGhim8XLWFm/RZuKBmGeuAg9Q759
 SB9hRCYKghg3ThlUaVtITfMzU4k+EGPripJS80nZyYb0+rWUOwvB2kJ867Hhgu8/qzm0
 t8pMUkKuiOTvzqZlED66Q5+UEdFszjR1cOpOWGuiB9dQOAZS89DtkFxvF46Nme3HY6UM
 qARi77ZBKai6DpHxe3WCwYBj/KCbE4yX3roeR2fQ2wl2Notj+3x8LHTCsxCgb0jNIE2x
 GIPw==
X-Gm-Message-State: AAQBX9fYTgXQubXg21zpfF4g56nR74JbHABiWe56W76L9xwEYDhvWVHg
 npSvu4KK0ZBYj12l/qfcX++f/A==
X-Google-Smtp-Source: AKy350ZPb2pcudeOWD4NUzexqOVtDM0ulgBKkxy07npJmGB5XjCQyP1ClBYjw6LCleNLEPUOy8LFOw==
X-Received: by 2002:a19:f70b:0:b0:4ed:cb37:7d95 with SMTP id
 z11-20020a19f70b000000b004edcb377d95mr897901lfe.44.1681819859602; 
 Tue, 18 Apr 2023 05:10:59 -0700 (PDT)
Received: from [192.168.1.101] (abyj144.neoplus.adsl.tpnet.pl. [83.9.29.144])
 by smtp.gmail.com with ESMTPSA id
 q17-20020a19a411000000b004d86808fd33sm2365895lfc.15.2023.04.18.05.10.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Apr 2023 05:10:59 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 18 Apr 2023 14:10:56 +0200
Subject: [PATCH v2 1/5] dt-bindings: display/msm: Add reg bus interconnect
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230417-topic-dpu_regbus-v2-1-91a66d04898e@linaro.org>
References: <20230417-topic-dpu_regbus-v2-0-91a66d04898e@linaro.org>
In-Reply-To: <20230417-topic-dpu_regbus-v2-0-91a66d04898e@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1681819856; l=1310;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=9eGzIhdzE/kh12Ssb8zLi8BB+5t4kj0lnuayorvjl54=;
 b=6fysWEnV+Y3QmSTMiVPNmoQ9u0QIAaEjvJEkX1mj0vdB2azvjMKBFTXFeb43KILmDBjB8FFs4iVp
 BB/S89PrA4Ytu9jBc2Dfi9OeeG/7wbARaGTUTtuRCJrQlU8X+ytt
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

Apart from the already handled data bus (MAS_MDP_Pn<->DDR), there's
another path that needs to be handled to ensure MDSS functions properly,
namely the "reg bus", a.k.a the CPU-MDSS interconnect.

Gating that path may have a variety of effects.. from none to otherwise
inexplicable DSI timeouts..

Describe it in bindings to allow for use in device trees.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/mdss-common.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/mdss-common.yaml b/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
index ccd7d6417523..30a8aed4289a 100644
--- a/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
+++ b/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
@@ -66,12 +66,14 @@ properties:
     items:
       - description: Interconnect path from mdp0 (or a single mdp) port to the data bus
       - description: Interconnect path from mdp1 port to the data bus
+      - description: Interconnect path from CPU to the reg bus
 
   interconnect-names:
     minItems: 1
     items:
       - const: mdp0-mem
       - const: mdp1-mem
+      - const: cpu-cfg
 
   resets:
     items:

-- 
2.40.0

