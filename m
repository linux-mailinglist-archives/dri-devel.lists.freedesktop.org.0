Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C0E9F661E43
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 06:14:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0202110E02E;
	Mon,  9 Jan 2023 05:14:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D16F10E270
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jan 2023 05:14:04 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id f21so3337929ljc.7
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Jan 2023 21:14:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=PvdkWVVFT++i2HrXBK25wLmmBQIyNJvJJ78RUMtwfHQ=;
 b=cMmJD80AQE5+uGOgBtAn20gwsELKhIR5IRx28DwD9gcV/j376g1au5p3+zmmlWRRoJ
 ik5BtT0BPcSiCHxmJCPV3zFErCP/brX6c6gIGzCZbMnyGk7KD5hclqpxrZmee4mSO2za
 YzNsWNh3pENDCfe3KqxSjl22TY/kKSe0E+BN0ZSgBVfbzcaW+EIgX6BQgBGmdXn6HbtX
 KTm5AMr8S4HsVlNK0nPmZD8diV2d9jvlhnUMeTOCS59Zs12CTRBZpqxgtO7jGS1WlJcz
 7XPoBH1YRvijCI8OxnoPKxWAoePIb1JpcoH/qzrnhqJvd+jsKcul6+PQDTJ3LOGyGYz2
 ac6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PvdkWVVFT++i2HrXBK25wLmmBQIyNJvJJ78RUMtwfHQ=;
 b=DPi5JGLg6qhZqeZs8tuyi0ZutOwYsZ3AD30WjdBAp+dd+C5yzcKZhsq1SsK9tc3bqJ
 J/IHUo8CsMSvlnwTre7jvsDbrzEm6jSc+wd7ITmCMw6tsh4opttpAnRLXMZl6U/5bPKb
 ESuGhBWguzcQ8V2IIjFBglOzEQ9fHWwpFbrlbk8jhNL5mgOcXHtLBeCdvxByz0j6jCx0
 /UCAanCNFD4IK6wdJF6okhEMXt69hezkQHvVTSCQV9Nk6mlNBrviG3St3VaJJFvzNayd
 LfYxxc8bm7uDHy2F5UPPXO8S8Vxucan1qlWK64o7sY4B1nlKx7XpEWtOqU7tNropsAiv
 SP4A==
X-Gm-Message-State: AFqh2krnkNvMf6qsjzeymnRNWIDibgiNGPX8tTQSxhC+GK5YsjcrvTR8
 Z1a6CRx0W0xCX2R/L1zZtsF5GA==
X-Google-Smtp-Source: AMrXdXtdwSRQ4dPucdNAQqPmdkBsTj0C9tXRHKfE+ngpkDjMyh9Kw6hDCs2C7izQqkMAG/GiGql+5Q==
X-Received: by 2002:a2e:92cf:0:b0:27f:a604:22b8 with SMTP id
 k15-20020a2e92cf000000b0027fa60422b8mr15051285ljh.40.1673241242904; 
 Sun, 08 Jan 2023 21:14:02 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 w4-20020a19c504000000b004b5812207dbsm1426880lfe.201.2023.01.08.21.14.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jan 2023 21:14:02 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH 0/6] dt-bindings: display/msm: rename mdss and mdp nodes
Date: Mon,  9 Jan 2023 07:13:56 +0200
Message-Id: <20230109051402.317577-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
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
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Finish the process of renaming display-related nodes on Qualcomm
systems. Fix it in the schema that MDSS (Mobile Display SubSystem)
devices are named `display-subsystem' and both MDP (Mobile Display
Processor) and DPU (Display Processor Unit) nodes are named
`display-controller'.

Dmitry Baryshkov (6):
  dt-bindings: display/msm: rename mdss nodes to display-sybsystem
  dt-bindings: display/msm: rename mdp nodes to display-controller
  arm64: dts: qcom: rename mdss nodes to display-subsystem
  ARM: dts: qcom-msm8974: rename mdss node to display-subsystem
  arm64: dts: qcom: rename mdp nodes to display-controller
  ARM: dts: qcom: rename mdp nodes to display-controller

 .../devicetree/bindings/display/msm/dpu-common.yaml   |  8 ++++++++
 .../devicetree/bindings/display/msm/mdss-common.yaml  |  8 ++++++++
 .../devicetree/bindings/display/msm/qcom,mdp5.yaml    |  3 +++
 .../devicetree/bindings/display/msm/qcom,mdss.yaml    | 11 +++++++----
 arch/arm/boot/dts/qcom-apq8064.dtsi                   |  2 +-
 arch/arm/boot/dts/qcom-msm8974.dtsi                   |  4 ++--
 arch/arm64/boot/dts/qcom/msm8916.dtsi                 |  4 ++--
 arch/arm64/boot/dts/qcom/msm8953.dtsi                 |  4 ++--
 arch/arm64/boot/dts/qcom/msm8996.dtsi                 |  4 ++--
 arch/arm64/boot/dts/qcom/sc7180.dtsi                  |  2 +-
 arch/arm64/boot/dts/qcom/sdm630.dtsi                  |  4 ++--
 arch/arm64/boot/dts/qcom/sdm845.dtsi                  |  2 +-
 arch/arm64/boot/dts/qcom/sm8250.dtsi                  |  2 +-
 13 files changed, 40 insertions(+), 18 deletions(-)

-- 
2.39.0

