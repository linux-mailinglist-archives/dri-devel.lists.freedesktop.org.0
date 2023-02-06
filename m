Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D4D68C09A
	for <lists+dri-devel@lfdr.de>; Mon,  6 Feb 2023 15:57:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B4E010E3EE;
	Mon,  6 Feb 2023 14:57:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99A2110E3EE
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Feb 2023 14:57:10 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id e22so5629139ejb.1
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Feb 2023 06:57:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=cLuf1U+2WjifV8fnrslcwZDFA4TZvCGB2iPkwtWqNUI=;
 b=oq9jViBl3HA8dQj59yZsQcWYKhAEvJWr1Mqzc1nDjWd3kRLMlEJmDIhfOc2l+p9NLd
 sEyjvRaMXAsm/bYtTpQnIz65QqWwNZzD2ixnXeIv/n7h0wwjcYKGqo5UlUhhHj/+UxhN
 Vjip+0N5Gcg9eBr6e9L2FgnlD02pMQtDmefHpu6L6q15uOGJwGLd6Q+iHLS5qDhwcnpv
 jcH/BDXAdXafNKaM0EBgworEii3bTIRcz1nDLBmzdKEdZFuwosxwjqEO4W6y868kqLfD
 btVyftrdECwXZvuYQTLDMsH366OL3edNWQJg4/Ues9yHsG8FHbMc5frF17qLpR6RVgFB
 TLKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cLuf1U+2WjifV8fnrslcwZDFA4TZvCGB2iPkwtWqNUI=;
 b=LhXqQ5suMob6x/9y9zX6KDy2OBvvJWYQwF2+n5Tj8KJc90diFLVvyuKy87hnobQ4Up
 KdAA7+mPaMvt/4Z5zjn5CoOOQW1mKTcbXzPYuWwuZpwJ4MdacdbMGEsWgqVuBGsJSfxy
 /Wxo0GDvnSznruU6eKvSCaR6Th73jNTYqvd0hAAcNpxwuh2fb2r7PfSJ+VknjsYS8rGm
 i4toKzc0U9FvMZvSemJHUWufPY3Ni7jNe+6reV4/7TmcCHnahOAWAZWpPH249Go7aIeG
 LlG6ZZCrhp8b9xDkwhlld3yGi5eKKKfWYWKKU5K9ODutKiz0PW0oQaTZ0Boq3GRSKpeu
 SaRg==
X-Gm-Message-State: AO0yUKW4Z9ncHRABEZXqzBMq5TAKlLVkEJlPDZ8d2Z2dKJTbBT9HysS7
 ozlPNIpkovRDyWJgJgEAj4H9hg==
X-Google-Smtp-Source: AK7set/oKvZyc+ZrfLJPgnfOVLJVKoAm0Z0SgsTUoA8rN3b3dRK6zhySANFVfe+x2ByyCb7N0W7vLw==
X-Received: by 2002:a17:907:7ba9:b0:87b:d3dd:e0ca with SMTP id
 ne41-20020a1709077ba900b0087bd3dde0camr13140091ejc.26.1675695429234; 
 Mon, 06 Feb 2023 06:57:09 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 gw1-20020a170906f14100b0087bd4e34eb8sm5495533ejb.203.2023.02.06.06.57.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Feb 2023 06:57:08 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Taniya Das <quic_tdas@quicinc.com>
Subject: [PATCH v2 0/8] arm64: dts: qcom: sm8350: enable GPU on the HDK board
Date: Mon,  6 Feb 2023 16:56:59 +0200
Message-Id: <20230206145707.122937-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.1
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 linux-clk@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add A660 device to the Qualcomm SM8350 platform and enable it for the
sm8350-hdk board. Unfortunately while adding the GPU & related devices I
noticed that DT nodes on SM8350 are greatly out of the preagreed order,
so patches 4-6 reorder DT nodes to follow the agreement.

Changes since v1:
- Fixed the subject and commit message for patch 1
- Fixed GMU's clocks to follow the vendor kernel
- Marked Adreno SMMU as dma-coherent
- Dropped comments targeting sm8350 v1, we do not support that chip
  revision.

Dmitry Baryshkov (8):
  dt-bindings: clock: Merge qcom,gpucc-sm8350 into qcom,gpucc.yaml
  dt-bindings: power: qcom,rpmpd: add RPMH_REGULATOR_LEVEL_LOW_SVS_L1
  dt-bindings: display/msm/gmu: add Adreno 660 support
  arm64: dts: qcom: sm8350: reorder device nodes
  arm64: dts: qcom: sm8350: move more nodes to correct place
  arm64: dts: qcom: sm8350: finish reordering nodes
  arm64: dts: qcom: sm8350: add GPU, GMU, GPU CC and SMMU nodes
  arm64: dts: qcom: sm8350-hdk: enable GPU

 .../bindings/clock/qcom,gpucc-sm8350.yaml     |   71 -
 .../devicetree/bindings/clock/qcom,gpucc.yaml |    2 +
 .../devicetree/bindings/display/msm/gmu.yaml  |    1 +
 arch/arm64/boot/dts/qcom/sm8350-hdk.dts       |    8 +
 arch/arm64/boot/dts/qcom/sm8350.dtsi          | 2512 +++++++++--------
 include/dt-bindings/power/qcom-rpmpd.h        |    1 +
 6 files changed, 1357 insertions(+), 1238 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/qcom,gpucc-sm8350.yaml

-- 
2.39.1

