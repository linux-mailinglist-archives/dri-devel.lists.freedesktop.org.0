Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D69EE68B346
	for <lists+dri-devel@lfdr.de>; Mon,  6 Feb 2023 01:27:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D166710E0C6;
	Mon,  6 Feb 2023 00:27:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 561E310E0C6
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Feb 2023 00:27:39 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id p26so29750392ejx.13
 for <dri-devel@lists.freedesktop.org>; Sun, 05 Feb 2023 16:27:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gp59R213AIVhf0rg6oz7SOZcDdHcOLWRVoAaATbsRQE=;
 b=MEUCBQISThWH+b2Ucyn3XNV+AMeMMPmsEZVQ7+rHhHXpNkNa+RQoysPG6e5naxWS2Y
 5IJzU83D0bTazSZAQKck+IJuX62oVbGUNmFzCTH0Qa6MWCMfvzLiUXfj8f9vALEPQP3o
 izH2SSsc3SxJ24i0QwXLyW6ZdfAhnuW+fH3bsjdeG50qFmN1Dan40TuYjPHBr89706qw
 6vR6Kw1ySwGjoUSwHXIcP8YXj7QNZEHdcQPtZGzp3l8e2l4BNh8CHMvbmq3dQJCZgrgD
 Lnwxrer7WIahNbmjKkjrqqObaX2zMjpv3Lfc1ExE0tS0JUMfK93nnR6UCkKwPhvaAYdC
 BaeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gp59R213AIVhf0rg6oz7SOZcDdHcOLWRVoAaATbsRQE=;
 b=p/6XpwUv+dEc8TFRjRb0TX39wVpAEgntmthVvE5SpXkG/EnLrXnz+EdSym9plpgXfg
 i8OROe3xV42BMQNpdluXoS6Q4EwAs9ET0B7pc5BN3zrEI0ri7G0ZxMqIq+GzwYDX6Unz
 qEHDDkKmYm93rNe4CUWgjKGli44jxUD7tLVNAiRjZxFGHulZHGMwBtdiQE/B2O0bEKxu
 GwZZHi3VrJ6TPX8as8ADsgFxnyfLaL4uqOszbfR2nby17T99CBS36AOxhOFjDRL8sMmQ
 I9eHG1j2+YoIP/HvNQ5e29udJkrQDKiCXfL8tcD2k3LN6y+o5fHli4ynwQtJ58g5boPa
 AJxw==
X-Gm-Message-State: AO0yUKW8Hu71xc1sOtJLENicizZoONwjDFDq6b8+V4P8AzXdBWAwh/sy
 vuGc5kphOttdwBw3PVbNAR9MGg==
X-Google-Smtp-Source: AK7set8grDq0upnIL9MazKBpssfMi58EDXVWhNbeRv0+yo9661x6mlbD4FsdAAniDhMUASPf8H68VQ==
X-Received: by 2002:a17:906:5283:b0:879:8752:9fb2 with SMTP id
 c3-20020a170906528300b0087987529fb2mr19113510ejm.67.1675643257673; 
 Sun, 05 Feb 2023 16:27:37 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 y18-20020a1709063a9200b00878b89075adsm4716085ejd.51.2023.02.05.16.27.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Feb 2023 16:27:37 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Taniya Das <quic_tdas@quicinc.com>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>
Subject: [PATCH 0/8] arm64: dts: qcom: sm8350: enable GPU on the HDK board
Date: Mon,  6 Feb 2023 02:27:26 +0200
Message-Id: <20230206002735.2736935-1-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-clk@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add A660 device to the Qualcomm SM8350 platform and enable it for the
sm8350-hdk board. Unfortunately while adding the GPU & related devices I
noticed that DT nodes on SM8350 are greatly out of the preagreed order,
so patches 4-6 reorder DT nodes to follow the agreement.

Dmitry Baryshkov (8):
  dt-bindings: clock: Merge qcom,gpucc-sm8350 into qcom,gpucc.yaml
  arm64: dts: qcom: sm8350: add RPMH_REGULATOR_LEVEL_LOW_SVS_L1
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
 arch/arm64/boot/dts/qcom/sm8350.dtsi          | 2515 +++++++++--------
 include/dt-bindings/power/qcom-rpmpd.h        |    1 +
 6 files changed, 1359 insertions(+), 1239 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/qcom,gpucc-sm8350.yaml

-- 
2.39.1

