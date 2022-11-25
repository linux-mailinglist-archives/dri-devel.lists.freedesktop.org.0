Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 135E36389F0
	for <lists+dri-devel@lfdr.de>; Fri, 25 Nov 2022 13:36:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F7DE10E09E;
	Fri, 25 Nov 2022 12:36:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1A4A10E09E
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Nov 2022 12:36:42 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 ay14-20020a05600c1e0e00b003cf6ab34b61so6106637wmb.2
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Nov 2022 04:36:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=F8QEr1U+4DdwT5X6CEZxWsT4dF4Ejt6T8JypPrPO5rI=;
 b=K1xi5tAQLXN9sLEIHr9BFO77DXOhF/h+p2Te8YWE54iOn1IeUtcnLo90aaRsxW20W5
 rZVEcSEaRhabtLkuR0NeGOtMxgEZZotZzAzoHiA9UL2BZETO7Y4wWT8wDedQ9Z0YgHdu
 n5PHhsvP51wHsF0Ysd5M7CCE7wpBlA9BgIN9e5xLPXWW8Iuy2NrnfFZX2KcB7lQhuMTb
 ckk8NdpZ7uYvZGI3sP/hNvAuFcRVdVRIQfZ9rW3SLuDmGTygd6rAHWbfy5SEI9znwF+u
 akM+qLLW7oSTGMNWAeNhmf+qlyHWx438NqeWmTvr8wVuaQEZDKpzVIvomFZQiG+yZrvi
 RS6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=F8QEr1U+4DdwT5X6CEZxWsT4dF4Ejt6T8JypPrPO5rI=;
 b=QXu+HE/WSOhRWgSjTS6fkGDaULpy6H8e5XzviBvDyft4xbJf5/TuSUtAVme3cQHxoj
 oU+6Y4x+Xhm/iaB+jPzye0gbwFNtrsk4iDqctnCE5nQqkRKYLsMr5Fktw9KQb916LJ84
 l9q/qjOAQyB9BSHsgVXQvvmSkXXCFwuYxwl/pbOKvCcQuOPsT3wJMTkLG5pY5LGb2p7y
 lkB/UC1u9NebrKDBU4ghq1V9BvhZYx6mYMbBYtbhl8rxnkqyoVKVF5t1kRaT5qBXh86E
 zpMrRcG0xca2kPEGHqxm26M+KUlLlmscZ8b71SXLKkGWHtWyG4XWi0022Dw70+dbD/kY
 EJRw==
X-Gm-Message-State: ANoB5pmzjf1p06P0jbIKpU1zU2MAR7MwHCNLVrn/BruAiFxIQEclVDOf
 jZYqYYyHHRJGa2/ngrLWfNR//A==
X-Google-Smtp-Source: AA0mqf7i/gSH7GGQvOSqsgv9xi7K0jb2aAWSKxgFmGXT6Puc65tmss7R9tmharjDtcFbJgZW8DFsoA==
X-Received: by 2002:a05:600c:1e85:b0:3cf:84be:aaf9 with SMTP id
 be5-20020a05600c1e8500b003cf84beaaf9mr14204871wmb.111.1669379800868; 
 Fri, 25 Nov 2022 04:36:40 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie.
 [188.141.3.169]) by smtp.gmail.com with ESMTPSA id
 k15-20020a5d6d4f000000b002366dd0e030sm3574111wri.68.2022.11.25.04.36.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Nov 2022 04:36:40 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
Subject: [PATCH v4 00/18] mdss-dsi-ctrl binding and dts fixes
Date: Fri, 25 Nov 2022 12:36:20 +0000
Message-Id: <20221125123638.823261-1-bryan.odonoghue@linaro.org>
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

Bryan O'Donoghue (18):
  dt-bindings: msm: dsi-controller-main: Fix operating-points-v2
    constraint
  dt-bindings: msm: dsi-controller-main: Fix power-domain constraint
  dt-bindings: msm: dsi-controller-main: Rename qcom,dsi-ctrl-6g-qcm2290
    to qcom,qcm2290-dsi-ctrl
  dt-bindings: msm: dsi-controller-main: Add compatible strings for
    every current SoC
  dt-bindings: msm: dsi-controller-main: Document clocks on a per
    compatible basis
  dt-bindings: msm: dsi-controller-main: Fix description of core clock
  dt-bindings: msm: dsi-controller-main: Fix clock declarations
  dt-bindings: msm: dsi-controller-main: Add vdd* descriptions back in
  ARM: dts: qcom: apq8064: add compat qcom,apq8064-dsi-ctrl
  ARM: dts: qcom: msm8974: Add compat qcom,msm8974-dsi-ctrl
  arm64: dts: qcom: msm8916: Add compat qcom,msm8916-dsi-ctrl
  arm64: dts: qcom: msm8996: Add compat qcom,msm8996-dsi-ctrl
  arm64: dts: qcom: sc7180: Add compat qcom,sc7180-dsi-ctrl
  arm64: dts: qcom: sc7280: Add compat qcom,sc7280-dsi-ctrl
  arm64: dts: qcom: sdm630: Add compat qcom,sdm630-dsi-ctrl
  arm64: dts: qcom: sdm660: Add compat qcom,sdm660-dsi-ctrl
  arm64: dts: qcom: sdm845: Add compat qcom,sdm845-dsi-ctrl
  arm64: dts: qcom: sm8250: Add compat qcom,sm8250-dsi-ctrl

 .../display/msm/dsi-controller-main.yaml      | 205 ++++++++++++++++--
 arch/arm/boot/dts/qcom-apq8064.dtsi           |   3 +-
 arch/arm/boot/dts/qcom-msm8974.dtsi           |   3 +-
 arch/arm64/boot/dts/qcom/msm8916.dtsi         |   3 +-
 arch/arm64/boot/dts/qcom/msm8996.dtsi         |   6 +-
 arch/arm64/boot/dts/qcom/sc7180.dtsi          |   3 +-
 arch/arm64/boot/dts/qcom/sc7280.dtsi          |   3 +-
 arch/arm64/boot/dts/qcom/sdm630.dtsi          |   3 +-
 arch/arm64/boot/dts/qcom/sdm660.dtsi          |   3 +-
 arch/arm64/boot/dts/qcom/sdm845.dtsi          |   6 +-
 arch/arm64/boot/dts/qcom/sm8250.dtsi          |   6 +-
 11 files changed, 208 insertions(+), 36 deletions(-)

-- 
2.38.1

