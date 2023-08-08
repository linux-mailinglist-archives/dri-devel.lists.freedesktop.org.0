Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AD5D774C11
	for <lists+dri-devel@lfdr.de>; Tue,  8 Aug 2023 23:03:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6599D10E20D;
	Tue,  8 Aug 2023 21:02:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6237510E19D
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Aug 2023 21:02:53 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2b95d5ee18dso94676911fa.1
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Aug 2023 14:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691528571; x=1692133371;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=hfboBfiRFogaTpUuhly3NgfZjgGVKja/IsRvHexLQ30=;
 b=FWL/9588n+DzkqoNB8hffVQrNAMttYAEKN+YYxfTS9SFuaMVv0x1FDgWAbYpX1lpEn
 y+HgLcWjx/BPzB34iijB2ZhCbTIBeJV3cWPm2iKnk8sPzH0fMfDC2hPL8ElG1vk2b9Iv
 yf7Q++GsxTRpX34BXPKK3S7XWzE90oDZVVyqXUr8Hml4TJuAJiX0EoD9meI1pN0tsbPg
 g1fdxp3AwjtMfPY62SdVUxMmfXzdg0Gt4Dzn4Knl0qTIDFM4E/2FcphyjG1MSrBS3Dyg
 MUJ9PltjjE7Xt+Vb77M2S2xF5DUFudNblx+0ptKg8udZO0L9QpWsYcvxhCLBfxmULkjk
 XIMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691528571; x=1692133371;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hfboBfiRFogaTpUuhly3NgfZjgGVKja/IsRvHexLQ30=;
 b=hvsbaRv0GTWntVtbxjPa71+P/ybhpGboXYsSIKyMAYfVi90a6qmD7s+j8rFUywfFaj
 MXnzh3gwlpSh50ZWjXCpTrQ9/KgiLsdtvqkrU4mB4Q1NFnTEWkQ+t95Bz2KbVUcNTZKD
 9NXoTgmgpEbCHVmNgQuLj+HryQDlgZ7u7/xlByU3mDPYo2oPAVlYG6J3Gice6HHEWym5
 s+i460rTnCBiXEjU0NDK5q/r61P4gIdfAW/1Uzg4YqiIRpW42H77gyf2qVPIOp9cBirI
 Xrh7xD5Ly5qwQ8cINKEw4ZYqVtzDuks18tZ0lojUVZm20fKQXmxmDhrwhXgV2yYtwW+O
 W6Kg==
X-Gm-Message-State: AOJu0Yy0vFLMpNyOZo7tELI1nVuRWxwaZxzpbPFI1+u59ym5MC8Ytz95
 4utZNRV59xdyXFUc4grmWBRNWQ==
X-Google-Smtp-Source: AGHT+IHmtQKh9Ne4fsCZMKO/0I3do4hlNgFoi5gsoycNE3Zw2qfKFIElCjB2RXnFAV2OS+qeIducrA==
X-Received: by 2002:a2e:6a04:0:b0:2b6:cff1:cd1c with SMTP id
 f4-20020a2e6a04000000b002b6cff1cd1cmr444440ljc.34.1691528571765; 
 Tue, 08 Aug 2023 14:02:51 -0700 (PDT)
Received: from [192.168.1.101] (abxi185.neoplus.adsl.tpnet.pl. [83.9.2.185])
 by smtp.gmail.com with ESMTPSA id
 h11-20020a2eb0eb000000b002b6cc17add3sm2431483ljl.25.2023.08.08.14.02.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Aug 2023 14:02:51 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 08 Aug 2023 23:02:40 +0200
Subject: [PATCH v2 02/14] dt-bindings: display/msm/gmu: Allow passing QMP
 handle
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230628-topic-a7xx_drmmsm-v2-2-1439e1b2343f@linaro.org>
References: <20230628-topic-a7xx_drmmsm-v2-0-1439e1b2343f@linaro.org>
In-Reply-To: <20230628-topic-a7xx_drmmsm-v2-0-1439e1b2343f@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1691528566; l=1248;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=DmGlYwIEUEHn/wQtjBFLoVdCMMIvFa4G3MsWRsymdpo=;
 b=NsU1D9zX+SvHMM5tanczlcL+kW81jzbaObcsHCwoLQsp3YgUXDvomWL0uXIX/ygHDXQhieJdr
 SQ/Mr8eaZ4aAqjvuI/2lC0ahRXyGV8q84BrlIDCdKIwq62BnzEw5evp
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
Cc: devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When booting the GMU, the QMP mailbox should be pinged about some tunables
(e.g. adaptive clock distribution state). To achieve that, a reference to
it is necessary. Allow it and require it with A730.

Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> # sm8450
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/gmu.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/gmu.yaml b/Documentation/devicetree/bindings/display/msm/gmu.yaml
index 20ddb89a4500..e132dbff3c4a 100644
--- a/Documentation/devicetree/bindings/display/msm/gmu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gmu.yaml
@@ -64,6 +64,10 @@ properties:
   iommus:
     maxItems: 1
 
+  qcom,qmp:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Reference to the AOSS side-channel message RAM
+
   operating-points-v2: true
 
   opp-table:
@@ -251,6 +255,9 @@ allOf:
             - const: hub
             - const: demet
 
+      required:
+        - qcom,qmp
+
   - if:
       properties:
         compatible:

-- 
2.41.0

