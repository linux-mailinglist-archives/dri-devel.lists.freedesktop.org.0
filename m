Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D384466C37F
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jan 2023 16:21:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E258610E071;
	Mon, 16 Jan 2023 15:21:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECE6E10E071
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jan 2023 15:21:32 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id r2so27801883wrv.7
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jan 2023 07:21:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=nv0qa2Y9kKxU6VGIR/RqoCE+47f00hC3eEX/3It1chk=;
 b=BKqVukHaNZ2DjWhsK2wghZ2mTsJu+9IwS9P/qGTacZ0hXj+iyool3k9BEfn8x6JXQJ
 hw3JDOmQN3yWNzSVg3VGPy9Cf5/GGU1zFY0l3Nca3VaEqh1+MzTcGR4ZGwDI7cGGdHD+
 8TbSsVQEieGnEMxsTK9HhLpZaXZ+S/SWQ+oSzinvM9LN7mM5yYZbBIsIzQqCLMBiYOlS
 KABMxb76aWIK83/ubWTSgBlSwmAq78EZ9yPnMgv4A+pmjowA8zokO7+q0ESsyUFMri9B
 KI2bEKXrT9Fif28tva4jio2E2+tU//zFGLIe0M7b2SuEdASgsbDp8+dapdW+vkNO7lZc
 seVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nv0qa2Y9kKxU6VGIR/RqoCE+47f00hC3eEX/3It1chk=;
 b=oAPVW86BqSCtkpK3MykAhmCpOvAytj9GQUGywZT/22MFQOzkxj+vagnS7SghfhDd3a
 rYG5P0XobzORctsYjpsSdpC7Nx+rnK5ngsV9co8dMA43LwtZqPZjXfBQUe3CIlj7sz6b
 xlLda2V32ff0rTlBbem3HT0p3sWzn+gvuvsDsa7yW9t7RBecSbLoHiwnZ4CqIUYN1n5C
 P1NxoGDkMV7NHqqHHHLOVhb1SixA3qWwzmKVOBKA3cOlCn4UL9jTkDUq4TNCHJdEc5fW
 xn7g0nIlZNW2gkSZpOoztTaB/aSBh/V5jlxNwwABRu1gmWGpgeabIkVl3lLTWbfVsdMK
 iE3Q==
X-Gm-Message-State: AFqh2kod8EYH6PDQbYEPD1XR739pjl5qqcr872jqkapz+0PlFEc+8j7J
 1oDkigU6M3GgxjN+4upKt89xew==
X-Google-Smtp-Source: AMrXdXvzupPXPZrH8q5lavvJWVE7k7Wke3TppTjy+Xv6euTu3Vht9rwJhUpDg2Gdg2InPn98dgobaA==
X-Received: by 2002:a05:6000:1b05:b0:2b5:dc24:e08e with SMTP id
 f5-20020a0560001b0500b002b5dc24e08emr26936729wrz.69.1673882491286; 
 Mon, 16 Jan 2023 07:21:31 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie.
 [188.141.3.169]) by smtp.gmail.com with ESMTPSA id
 u18-20020adff892000000b002bded7da2b8sm6874686wrp.102.2023.01.16.07.21.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Jan 2023 07:21:30 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
Subject: [PATCH v7 0/4] mdss-dsi-ctrl binding and dts fixes
Date: Mon, 16 Jan 2023 15:21:24 +0000
Message-Id: <20230116152128.909646-1-bryan.odonoghue@linaro.org>
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

V7:
- The bulk of the patches for this series have been merged.
  There are still four patches to be pushed/updated.
- Adds clocks for msm8974 - Dmitry
- Adds compat strings for sm8150, sm8350, sm8450, sm8550 - Dmitry
- Changes last patch in series to state - Rob
  compatible:
    contains:
      const: qcom,mdss-dsi-ctrl

link: https://lore.kernel.org/linux-arm-msm/20221223021025.1646636-1-bryan.odonoghue@linaro.org/

V6:
- Squashes a number of patches per Krzysztof's comments on bisectability
- Adds in Acked-by Rob and Krzysztof 

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

Bryan O'Donoghue (4):
  dt-bindings: msm: dsi-controller-main: Add compatible strings for
    every current SoC
  dt-bindings: msm: dsi-controller-main: Document clocks on a per
    compatible basis
  dt-bindings: msm: dsi-controller-main: Add vdd* descriptions back in
  dt-bindings: display/msm: Add list of mdss-dsi-ctrl compats

 .../display/msm/dsi-controller-main.yaml      | 261 ++++++++++++++++--
 .../bindings/display/msm/qcom,mdss.yaml       |   3 +-
 .../display/msm/qcom,msm8998-mdss.yaml        |   8 +-
 .../display/msm/qcom,sc7180-mdss.yaml         |   6 +-
 .../display/msm/qcom,sc7280-mdss.yaml         |   6 +-
 .../display/msm/qcom,sdm845-mdss.yaml         |   8 +-
 .../display/msm/qcom,sm8150-mdss.yaml         |   8 +-
 .../display/msm/qcom,sm8250-mdss.yaml         |   8 +-
 .../display/msm/qcom,sm8350-mdss.yaml         |   6 +-
 .../display/msm/qcom,sm8450-mdss.yaml         |   4 +-
 10 files changed, 277 insertions(+), 41 deletions(-)

-- 
2.38.1

