Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 953196C7B56
	for <lists+dri-devel@lfdr.de>; Fri, 24 Mar 2023 10:28:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2425610EB9A;
	Fri, 24 Mar 2023 09:28:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B02B10EB9A
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Mar 2023 09:28:51 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id y14so1061123wrq.4
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Mar 2023 02:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679650129;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pe6xkVW/LwNnSr0qXJhAQ9MlrUZGEMQPRfSGh9j4qrQ=;
 b=pvrGPWA/YRlHFpq2pgubC7K7Wz159BTtXW1nold76ETFYVsNHJq0KLt5ho23Rm/GbZ
 wrrBJxjgefV1wsa/1CJF2LzZaArGvqprKvWpKyXwfXfvDCFhe0HlGEZo40acZ9gl6hg4
 G74NJw7afWFPy8ousSRa3Xd5zuFBLoReJAeoeTw4FgjJjdctgOuple7iNXAA4TaPE9Je
 iK3TETjd+nQYCERBu0cpgGnNeACZDefAmT1f/OAU3kVd/78bYxGgenOUzfw29OMRUUny
 lZuiXc3wvlFmZ2y0IID7YttoMweJGjk5ciNzlweou5tiEIQE+0GyhA2yhgHiotySnSUh
 YD6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679650129;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pe6xkVW/LwNnSr0qXJhAQ9MlrUZGEMQPRfSGh9j4qrQ=;
 b=i2XVblCuPJTPFkZoyMU+MFV24CHrc7H8HKVBDpvLVT+dCFIDXADKaoGFTC30EYeCCE
 WRTxbpOX/9KqirFyIoGUgKHVRlxdNnLYUrDUU+3+cBOP+Ysx/QmLP5/KgH7bNb2/0a13
 /66Jd5axuFA4Zdnl7QmQsNSyRmKRlFAOr68Tj8vZZCs7xaQ+FVoHc6ksfdONWFqPqxng
 rWbliPWPxcw7wp/IptizZCE7HpY2g3tz5kDK9QaJ+zQvSdce2cpPkkiHO4xz9xEfUypF
 91esT6sRrZjxWm2nRoP1GhX07MjQCzg/6exhfgVceLp5CjR6zhGJL7pH4OD3tNzMsPJq
 T86g==
X-Gm-Message-State: AAQBX9eYJJICFuF1bd8dwlZe2dWGEInMmDRb18q/q6Bsp/p675Eqemcb
 i0ynUtCPZ1JDzwycPPBSErW2Ng==
X-Google-Smtp-Source: AKy350ZPhLrsgllqoWa7OK8+vEdPLlF/AzIB3IxOzcqgJtDgt1Cf0B3PK9hkTPs7esoGyotLah7zjA==
X-Received: by 2002:adf:df83:0:b0:2ca:175b:d850 with SMTP id
 z3-20020adfdf83000000b002ca175bd850mr1655308wrl.11.1679650129542; 
 Fri, 24 Mar 2023 02:28:49 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 v14-20020adfe28e000000b002c5a790e959sm18029980wri.19.2023.03.24.02.28.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Mar 2023 02:28:49 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v2 0/4] arm64: qcom: sm8450: bindings check cleanup
Date: Fri, 24 Mar 2023 10:28:45 +0100
Message-Id: <20230323-topic-sm8450-upstream-dt-bindings-fixes-v2-0-0ca1bea1a843@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAE1tHWQC/5WOSw6CQBBEr0JmbZv5oBJX3sOwGKCBTmCGdA9EQ
 7i7ozdw+V4qVbUrQSYUdS92xbiRUAwZ7KlQ7ejDgEBdZmW1ddpZByku1ILMVXnRsC6SGP0MXYK
 GQkdhEOjphQKVuTp9sxbRGZXbGi8IDfvQjrkvrNOU5cL4S2fzrDOPJCny+/dmM1/7//BmQIND3
 xksTdVj+ZgoeI7nyIOqj+P4APDdCe70AAAA
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.1
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
 dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A few fixes to pass the DT bindings check successfully
for sm8450 qrd & hdk DTs.

The following are still needed to pass all the checks:
- https://lore.kernel.org/r/20230308082424.140224-3-manivannan.sadhasivam@linaro.org
- https://lore.kernel.org/r/20230130-topic-sm8450-upstream-pmic-glink-v5-5-552f3b721f9e@linaro.org
- https://lore.kernel.org/all/20230308075648.134119-1-manivannan.sadhasivam@linaro.org/
- https://lore.kernel.org/r/20230306112129.3687744-1-dmitry.baryshkov@linaro.org
- https://lore.kernel.org/all/20221209-dt-binding-ufs-v3-0-499dff23a03c@fairphone.com/
- https://lore.kernel.org/all/20221118071849.25506-2-srinivas.kandagatla@linaro.org/

A tree with the applied & rebased patches is available at:
- https://git.codelinaro.org/neil.armstrong/linux/-/tree/topic/sm8450/upstream/dt-bindings-fixes

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v2:
- updated patches dependency to pass tests
- fixes dt-bindings examples
- added review tag
- dropped already sent patches (2,6,7)
- Link to v1: https://lore.kernel.org/r/20230323-topic-sm8450-upstream-dt-bindings-fixes-v1-0-3ead1e418fe4@linaro.org

---
Neil Armstrong (4):
      dt-bindings: display: msm: sm8450-mdss: Fix DSI compatible
      arm64: dts: qcom: sm8450: remove invalid properties in cluster-sleep nodes
      arm64: dts: qcom: sm8450: remove invalid power-domain-names in pcie nodes
      arm64: dts: qcom: sm8450: fix pcie1 gpios properties name

 .../devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml      |  6 +++---
 arch/arm64/boot/dts/qcom/sm8450.dtsi                           | 10 ++--------
 2 files changed, 5 insertions(+), 11 deletions(-)
---
base-commit: 207ecce2dffa48a738c1c4d17f889d25b7629655
change-id: 20230323-topic-sm8450-upstream-dt-bindings-fixes-81630722ee31

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>

