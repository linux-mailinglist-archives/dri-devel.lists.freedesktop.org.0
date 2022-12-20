Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80F3F65209D
	for <lists+dri-devel@lfdr.de>; Tue, 20 Dec 2022 13:37:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2453010E3A7;
	Tue, 20 Dec 2022 12:36:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7AEC10E379
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 12:36:38 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id z10so1023839wrh.10
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 04:36:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=YZugwc/t/ZJz6w/djvKK9nUP1aiYFAKi2NzgJ26Xsqc=;
 b=O/D7iMUnkCQJjmK1NOzj8UzCydsf1KMAt58QAorUK0RoBo9wwo+OIQzJr3vE4uEOgF
 0dv9KjJY8MJby4yfNjmrisKRiEv2uIF7EBvADYyUjA+q+XDOieRnz1+TPwRKd/2dPofP
 H6V6SlWi1ig3FmXUICAP2UqsJVdI2aBspfOy/K2sNbgbw0oTVbYVfVA8y6tJ6GbKrdP3
 s6QN5iHR8LEidv0LlZT0n1q/JnekeR2cX5e2GHTGS45sKHjwwdFmVCv94E4hU6JquO2Y
 F9R86zcfgedOe7Rf8WiMCdWw7izU2Ms4rFQoiWpz7Vu9W67gvP2EBlg6lUjHcPYi6W3M
 hNLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YZugwc/t/ZJz6w/djvKK9nUP1aiYFAKi2NzgJ26Xsqc=;
 b=l7HPptVumkFshgPxEG3SCCXhex0oQiIZI08Z6ytZYMenvodALbxcrl6aMHAafOCa/q
 uVvGBM2s8Nn+sejSq+mRYzHpz1Qs+VikIR9Zk20SrF19OH/PBrN4NuumVEgUmMgzjG/E
 DtnK9jSmZXG0n5rGbXNO9iU2XjnXEydA2rs2GkNV4z1vc4yBnv4YIDBU/KJOteAq53ci
 EW6ELBrkFU2IoQ+AbWp3GmBwi44OUUNdU+m5OOlINUZ1FkvTQnWbe7ANTf/ly6Qe8hj9
 RHh0GyvFUdrfdYjx3eOKoKOnCxjWTmjKrfQ7dGJMPDwzk4qljJcUrsILeGw7fpX+ENDp
 RlQA==
X-Gm-Message-State: ANoB5plzgH9q2pq8Dxq7+JW+Ves4CJRz6xZ1VLblKV+MFEYxPurIKq20
 mGfv39fl4fW6GgynmZja6Qe4ng==
X-Google-Smtp-Source: AA0mqf7iEUd3ZUsc2l/5OvGsGvshsOZUpsxm9RxTXn1RYcv03TDyxEBakFAj0tedvJCg6jhwf5zcgA==
X-Received: by 2002:a5d:6a12:0:b0:242:63de:2f57 with SMTP id
 m18-20020a5d6a12000000b0024263de2f57mr38944318wru.26.1671539797040; 
 Tue, 20 Dec 2022 04:36:37 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie.
 [188.141.3.169]) by smtp.gmail.com with ESMTPSA id
 da13-20020a056000408d00b00242257f2672sm12641208wrb.77.2022.12.20.04.36.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Dec 2022 04:36:36 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
Subject: [PATCH v5 00/21] mdss-dsi-ctrl binding and dts fixes
Date: Tue, 20 Dec 2022 12:36:13 +0000
Message-Id: <20221220123634.382970-1-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.38.1
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
Cc: dri-devel@lists.freedesktop.org, krzysztof.kozlowski+dt@linaro.org,
 sean@poorly.run, andersson@kernel.org, konrad.dybcio@somainline.org,
 quic_abhinavk@quicinc.com, david@ixit.cz, dianders@chromium.org,
 robh+dt@kernel.org, agross@kernel.org, dmitry.baryshkov@linaro.org,
 bryan.odonoghue@linaro.org, swboyd@chromium.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V5:
- Adds compat strings to bindings/display/msm/qcom,SoC-mdss.yaml - Dmitry
- Re-orders simple fixes to the start of the series to allow backports - Dmitry 
- VDDA and drop of node-names - Krzysztof
- Deprecates qcom,dsi-ctrl-6g-qcm2290 - Krzysztof, Dmitry
- Expands set of updated files to include new msm8953 - bod
- Converts to agreed compat string qcom,SoC-dsi-ctrl hence
  -              - qcom,mdss-dsi-ctrl-msm8996
  +              - qcom,msm8996-dsi-ctrl
- Adds RB where indicated for the compat strings.
V4:
- Moves the update of the example from patch #5 to patch #4

V3:
- Moves declaration of mdss-dsi-ctrl into compat string declaration
  patch - Krzysztof, Dmitry
- Renames qcm-2290 compat string to agreed compat "qcom,socname-dsi-ctrl"
  Dmirty, Krzysztof
- Adds empty line after if clause in yaml control flow section - Dmirty
- Adds Rb/Ack - Krzysztof, Dmitry, Doug, David
- vdd*
  Looking into this some more, I don't believe vdd, vdda, vddio ought to be
  required properties. Its up to the PCB manufacturer and the panel in-use
  how that panel is powered. Powering the panel is not something that
  even necessarily needs to be done from the dsi-ctrl driver.
  Originally marking vdd* as required in the .txt was an error, its not a
  SoC level dtsi requirement.
- clock-names
  Rather than replicate the clock-name in each if block I listed them with
  a specific description from a similar reference in usb/qcom,dwc3.yaml.
 
https://lore.kernel.org/linux-arm-msm/eb80681f-2e0b-605f-0444-ec65562f74b8@linaro.org/

V2:
https://www.spinics.net/lists/linux-arm-msm/msg116326.html

- Moves the DSI PHY changes to a different later series.
  There are enough dsi-controller-main changes to justify its own
  standalone series.

- The original phy-name binding change given discussion with Rob and
  Krzysztof became its own standalone series that has since been merged.
  https://www.mail-archive.com/dri-devel@lists.freedesktop.org/msg403214.html

- Retains the drop of power-domain from yaml as a required property.
  I dug into the available dtsi. The apq8064 doesn't appear to have any
  GDSC which can be attached as a power-domain, which means the
  power-domain requirement is not universal across the various silicon
  versions.

- Adds Dmitry's RB to power-domain drop

- For the clock declarations I've
  * I noticed that the simple change I had worked for msm8939 but
    subsquently broke other dtsi which drove a bigger change to document
    the clocks on a per compatible basis.
  * Added compat strings in yaml.
  * Moved the allOf down later in the file to acomodate the if/then.
  * Number of clocks validated on a per compatible basis
  * The driver code which doesn't care about the number of clocks
    can still operate on the mdss-dsi-ctrl compat but the dts checks will
    validate against the compat string and yaml.

- vdd descriptions
  Took the previous text I missed from the .txt file - Krzysztof, Dmitry
  Adds vdd, vdda and vddio to the required list. This exposes warnings in
  existing dtsi but the previous .txt declared these regulators as
  required. - Krzysztof
 
V1:
This series fixes up a number of dtbs checks which are being flagged adding
in the msm8939 dtsi.


When converting from .txt to .yaml a number of the parameters for the older
msm8916 silicon were not transmitted into the yaml.

Adding in the msm8939 which is a near 1:1 copy of the msm8916 in terms of
dtsi triggers a rake of dtbs checks as a result.

https://www.mail-archive.com/dri-devel@lists.freedesktop.org/msg403211.html

Bryan O'Donoghue (21):
  dt-bindings: msm: dsi-controller-main: Fix operating-points-v2
    constraint
  dt-bindings: msm: dsi-controller-main: Fix power-domain constraint
  dt-bindings: msm: dsi-controller-main: Fix description of core clock
  dt-bindings: msm: dsi-controller-main: Add compatible strings for
    every current SoC
  dt-bindings: msm: dsi-controller-main: Deprecate
    qcom,dsi-ctrl-6g-qcm2290 in favour of qcom,qcm2290-dsi-ctrl
  dt-bindings: msm: dsi-controller-main: Document clocks on a per
    compatible basis
  dt-bindings: msm: dsi-controller-main: Fix clock declarations
  dt-bindings: msm: dsi-controller-main: Add vdd* descriptions back in
  dt-bindings: display/msm: Add list of mdss-dsi-ctrl compats
  dt-bindings: display/msm: Update MDSS dsi compat strings
  ARM: dts: qcom: apq8064: add compat qcom,apq8064-dsi-ctrl
  ARM: dts: qcom: msm8974: Add compat qcom,msm8974-dsi-ctrl
  arm64: dts: qcom: msm8916: Add compat qcom,msm8916-dsi-ctrl
  arm64: dts: qcom: msm8953: Add compat qcom,msm8953-dsi-ctrl
  arm64: dts: qcom: msm8996: Add compat qcom,msm8996-dsi-ctrl
  arm64: dts: qcom: sc7180: Add compat qcom,sc7180-dsi-ctrl
  arm64: dts: qcom: sc7280: Add compat qcom,sc7280-dsi-ctrl
  arm64: dts: qcom: sdm630: Add compat qcom,sdm660-dsi-ctrl
  arm64: dts: qcom: sdm660: Add compat qcom,sdm660-dsi-ctrl
  arm64: dts: qcom: sdm845: Add compat qcom,sdm845-dsi-ctrl
  arm64: dts: qcom: sm8250: Add compat qcom,sm8250-dsi-ctrl

 .../display/msm/dsi-controller-main.yaml      | 250 ++++++++++++++++--
 .../bindings/display/msm/qcom,mdss.yaml       |  16 +-
 .../display/msm/qcom,msm8998-mdss.yaml        |   8 +-
 .../display/msm/qcom,sc7180-mdss.yaml         |   6 +-
 .../display/msm/qcom,sc7280-mdss.yaml         |   6 +-
 .../display/msm/qcom,sdm845-mdss.yaml         |   8 +-
 .../display/msm/qcom,sm8250-mdss.yaml         |   8 +-
 arch/arm/boot/dts/qcom-apq8064.dtsi           |   3 +-
 arch/arm/boot/dts/qcom-msm8974.dtsi           |   3 +-
 arch/arm64/boot/dts/qcom/msm8916.dtsi         |   3 +-
 arch/arm64/boot/dts/qcom/msm8953.dtsi         |   4 +-
 arch/arm64/boot/dts/qcom/msm8996.dtsi         |   6 +-
 arch/arm64/boot/dts/qcom/sc7180.dtsi          |   3 +-
 arch/arm64/boot/dts/qcom/sc7280.dtsi          |   3 +-
 arch/arm64/boot/dts/qcom/sdm630.dtsi          |   3 +-
 arch/arm64/boot/dts/qcom/sdm660.dtsi          |   3 +-
 arch/arm64/boot/dts/qcom/sdm845.dtsi          |   6 +-
 arch/arm64/boot/dts/qcom/sm8250.dtsi          |   6 +-
 18 files changed, 293 insertions(+), 52 deletions(-)

-- 
2.38.1

