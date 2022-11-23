Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB2A636C04
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 22:07:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFFC910E630;
	Wed, 23 Nov 2022 21:07:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0858810E630
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 21:07:23 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id f13so8420927lfa.6
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 13:07:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=v0A9RS9WTIAG2lt1QtTE8t0FlIRUG4CfcC0TMQSUbrY=;
 b=OlLe32Q7esYlagWdYgvqaaO7qhmshYM8OtCqr+j9I+xK/dw34fk/8Aqicw3BcPvaZ/
 1PCv2AxP/VlKMF2iwb002W0G3prAqiIHdun1LZsEUmG8uLJ/CJ6Un8Kj0keI00PCk08n
 i2U8gVm9BpvwrhLuQG7CIIf9EPzSV0oudxv5dl+Xqe+xhAlohvG4rYrMYE2geLt6jfFb
 ZRx7549DNxoku9IpQXYrBFDh0vs2mPZcFTLruShebPgXLUclk9YF3ucB/9vzvINaJvYp
 Mzcr2s3LVqHOjEUBe/FiL4zQodidSM/Nasz3T5gq20+S4EAQllxKONFAyVHBXcZoEej9
 T3fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=v0A9RS9WTIAG2lt1QtTE8t0FlIRUG4CfcC0TMQSUbrY=;
 b=fp7o2LSAnYI9Ifxx9YC83ueOVII+fi4UoZ4RoUOrHJN9ShbcYrTexpvCWfcpTU6+h8
 5aAS87HVbW8wg/6w5ZGD7Vde2tzdvZpelUPoSrSGkLaH08YPTmFnJgIauWMjvNHDh1p/
 4lmz48Z1besO7f89Q3n2cLWeUYWalYKoZ87E0pG/Jdd1S00CEFeuS4+udb6X4OOh5FwO
 sxW594SaCALNYuXLPeSXOhnWOoUQWDwPvb0a9nGORviBkeZbgkUeFkfZM1xsN8ke61zw
 j43TtUW0iCTQbG+0Fc3/pARuPuYbU53HaX/q8AUqKuyu6GZGx3KJJqRVjieXEY9G8OW9
 tk+w==
X-Gm-Message-State: ANoB5pnmP64nS29EHYzS7EjZtGqhTwtRW4St9be2ZcrWwlRFdBk8ee5a
 XyYMgXjOxfX8ONLvJkN79Wm8KQ==
X-Google-Smtp-Source: AA0mqf75hVPqSKxibnxFEsIPqYTLibqLSPku8NPj30wsuDlj+TSP2+pWTMc7yYwJd2S8M4bkwpKu9w==
X-Received: by 2002:a05:6512:3c8e:b0:4ab:714b:7d1b with SMTP id
 h14-20020a0565123c8e00b004ab714b7d1bmr9670025lfv.621.1669237641402; 
 Wed, 23 Nov 2022 13:07:21 -0800 (PST)
Received: from eriador.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 c26-20020ac2415a000000b0048a8c907fe9sm3024119lfi.167.2022.11.23.13.07.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Nov 2022 13:07:21 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v3 0/5] arm64: dts: qcom: sm8450-hdk: enable HDMI output
Date: Wed, 23 Nov 2022 23:07:15 +0200
Message-Id: <20221123210720.3593671-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
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

Add device tree nodes for MDSS, DPU and DSI devices on Qualcomm SM8450
platform. Enable these devices and add the HDMI bridge configuration on
SM8450 HDK.

Changes since v2:
- Dropped clock-names from mdss device node
- Fixed pinctrl configuration used by lt9611uxc (Krzysztof)

Changes since v1:
- Reorder properties, making status the last one
- Rename opp nodes to follow the schema
- Renamed display-controller and phy device nodes
- Dropped phy-names for DSI PHYs
- Renamed DSI and DSI PHY labels to include mdss_ prefix
- Renamed 3v3 regulator device node to add -regulator suffix

Dmitry Baryshkov (3):
  arm64: dts: qcom: sm8450: add RPMH_REGULATOR_LEVEL_LOW_SVS_D1
  arm64: dts: qcom: sm8450: add display hardware devices
  arm64: dts: qcom: sm8450-hdk: enable display hardware

Vinod Koul (2):
  arm64: dts: qcom: sm8450-hdk: Add LT9611uxc HDMI bridge
  arm64: dts: qcom: sm8450-hdk: Enable HDMI Display

 arch/arm64/boot/dts/qcom/sm8450-hdk.dts | 117 +++++++++
 arch/arm64/boot/dts/qcom/sm8450.dtsi    | 303 +++++++++++++++++++++++-
 include/dt-bindings/power/qcom-rpmpd.h  |   1 +
 3 files changed, 409 insertions(+), 12 deletions(-)

-- 
2.35.1

