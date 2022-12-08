Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF479646628
	for <lists+dri-devel@lfdr.de>; Thu,  8 Dec 2022 01:55:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CA4810E19D;
	Thu,  8 Dec 2022 00:55:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25C0B10E140
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Dec 2022 00:55:01 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id h10so22770025ljk.11
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Dec 2022 16:55:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=WDR5TGPsNhjWsPBDgVfNtYEgkFBeujMENl7U3gpKJY0=;
 b=tY2d4VviSGal/QMy9Z8CDdTou7sz4oxGObjk1VhuO0dDlh07dZ/rj8gFNbZLpvolDr
 RsiekjR/3/s1q+hK6q5mLycMcIuBOX9nmO+86FAYo8GV462xgJU8JOXZz+KuI1lwsFqm
 nLlgUQiAa4BGZPDXR5CfiXcEXMOgZR43PMk0EDYRqrn/cRlJ6zy8n6c+p0nILDA3uWJq
 TBRKce7/qGf6r2l++J9vufs5OrlJm5MPo5V54ispGhcZy+202z4BMYTShMpl3EiJ5/0I
 HL5zScV3/d6utMGTzhyVtjnQzCmXvK8oFhDz/LvAAleKaUfktCjvkeoqTEK21fTQRosa
 xLTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WDR5TGPsNhjWsPBDgVfNtYEgkFBeujMENl7U3gpKJY0=;
 b=2KKmSDigG2V5vFVAGFTlb40ifhFLV51nWOHqY6PEa9/JIkwyVu++QET+GPYUQnwMQ+
 L7OhlS3qha6xiuG0/0ZVu316qhizqUojGnx1o5WF2Zvl1Hj7MnRczNb/4er1pMEbDZ/f
 +quavvY7kNaujiLXAJ3MYsjVRx3idX78Km30zxVWdSr76bXkew5JBVpFHPRB6dk21osf
 UPN/1fLqqxezvfsdUE6v+ic4rxgfc4KAB0ijxliZ/fo8tyI8VPX6lIM/u1MgDf4kJEtZ
 VITz6nEYxh/8LAjk9BZOuJMnEWa+necn6bfcVx0LuccRGpihA7yOiueXxAs3y+ORyqbV
 l4sg==
X-Gm-Message-State: ANoB5pn34BCATcz5dTSW/HPoB0A0TuHTscVDL1dbFxGbn9pRui0dYhfy
 M19sYSl0xAIH+m7EGOqoDOrpdA==
X-Google-Smtp-Source: AA0mqf7elxcLWQxq40/vt8Rf3Z6g2zKIwhLRkFfg9GZBlR3gUTfVmrB+lEcu5V+SRNewsNZOOhiTdg==
X-Received: by 2002:a2e:8092:0:b0:279:da43:44bc with SMTP id
 i18-20020a2e8092000000b00279da4344bcmr8376466ljg.432.1670460899485; 
 Wed, 07 Dec 2022 16:54:59 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 f27-20020a19381b000000b0049fff3f645esm3064159lfa.70.2022.12.07.16.54.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Dec 2022 16:54:59 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v2 0/4] dt-bindings: display/msm: convert MDP5 schema to YAML
 format
Date: Thu,  8 Dec 2022 02:54:54 +0200
Message-Id: <20221208005458.328196-1-dmitry.baryshkov@linaro.org>
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

This patch concludes the conversion of display/msm schema from txt files
to YAML format.

The per-SoC compat (new addition) is required to ease migrating platform
support between mdp5 and dpu drivers.

Changes since v1:
- Renamed mdp@ to display-controller@ in the example (Krzysztof)
- Extended ports description to mention possible ports (Krzysztof)
- Fixed ports@ regexp to limit to just four ports (Krzysztof)
- Included patches adding per-SoC compat strings to the schema and to
  dtsi files.

Dmitry Baryshkov (4):
  dt-bindings: display/msm: convert MDP5 schema to YAML format
  dt-bindings: display/msm: add SoC-specific compats to qcom,mdp5.yaml
  ARM: dts: qcom-msm8974: add SoC specific compat string to mdp5 node
  arm64: dts: qcom: add SoC specific compat strings to mdp5 nodes

 .../devicetree/bindings/display/msm/mdp5.txt  | 132 ---------------
 .../bindings/display/msm/qcom,mdp5.yaml       | 155 ++++++++++++++++++
 arch/arm/boot/dts/qcom-msm8974.dtsi           |   2 +-
 arch/arm64/boot/dts/qcom/msm8916.dtsi         |   2 +-
 arch/arm64/boot/dts/qcom/msm8996.dtsi         |   2 +-
 arch/arm64/boot/dts/qcom/sdm630.dtsi          |   2 +-
 arch/arm64/boot/dts/qcom/sdm660.dtsi          |   2 +
 7 files changed, 161 insertions(+), 136 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/msm/mdp5.txt
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml

-- 
2.35.1

