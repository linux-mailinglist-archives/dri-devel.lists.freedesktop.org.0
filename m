Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A192629A45
	for <lists+dri-devel@lfdr.de>; Tue, 15 Nov 2022 14:31:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 656A010E3DB;
	Tue, 15 Nov 2022 13:31:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCD7F10E3DC
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Nov 2022 13:31:11 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id u24so21814328edd.13
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Nov 2022 05:31:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=IiZNPefqWsmH3ZBwLzJSiNW009NxhDiT7gHxpkwTECI=;
 b=kyMm9dzGTmkggekSl/fhsLsfuT8amxXO4nXvV3egvBQEdesRVsaWe8PtW5bKNQvtKm
 utNBsudX6+R6JDFrkZCybji7HWB8/tc0MHD87PCqLk/h61ijC7HJKGcEUxmay3sa+cYN
 n94o9hzrHBxHETnHy879umkzFz+aBDQ65gsP1w5ULcp+P5IiRCbdmVbWrUxNK3iRD32S
 6uNLZKvcQrqOEVOeaE7cs7wef+HXgW67h6WfduQWqzK82mpvdy8OqN6K6sDOg7qc+SJc
 DqNz44GQIefFBkAF8dFb6LiNt/u33l9YxlUbqzQcClLerQrklw8+wJYBbuot3F+kcjwS
 Y+CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IiZNPefqWsmH3ZBwLzJSiNW009NxhDiT7gHxpkwTECI=;
 b=SOtLbxXYy0KAArhxVMOg+hlrN9hwKYoeVjRHdUeQ+z3556V3wQnGpKZdu/MRHV4tCW
 h5qOUwIPXIdp6DONI0iC/9LHRDI9qZZcAIEn685nKR/kyjnweeCaewPtM71kSBnHDHXa
 bDH6jkZryXhO3f5NF9PU0ru7CxjawoIVS51p03/THsXR9+wdDbfVOPhd81yA9Di7GcIh
 reUuN4DiHQdhfDY+Q5lnq2Jml+gPYQIGkiYV3DETTAN1kkw6Vn0yB/M3jRIj3EHSBa4D
 zpDL/e+BxuyDfTkkqzTv0hZ/VU7XTItu5nlFGaeACLhsuI4iMfwMVudoUiuIg5pLfi0X
 8euA==
X-Gm-Message-State: ANoB5pn8xPcOwysWvZdBTdi9se/1UQGjCNyn5rDVPrMeBizAQt85Yq7H
 UTHmlwEF4g1POhFi/COOLJyTsg==
X-Google-Smtp-Source: AA0mqf4dpx4w6x/phoewqJ5Ke40pRyOHvvagLP/cl7aCR6H+XDSla2FPNOiX4W017H1HCmTjVHDr0A==
X-Received: by 2002:a05:6402:f19:b0:461:a1c1:b667 with SMTP id
 i25-20020a0564020f1900b00461a1c1b667mr15330299eda.191.1668519070263; 
 Tue, 15 Nov 2022 05:31:10 -0800 (PST)
Received: from prec5560.. (freifunk-gw.bsa1-cpe1.syseleven.net. [176.74.57.43])
 by smtp.gmail.com with ESMTPSA id
 q22-20020aa7d456000000b004618f2127d2sm6162176edr.57.2022.11.15.05.31.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Nov 2022 05:31:09 -0800 (PST)
From: Robert Foss <robert.foss@linaro.org>
To: robdclark@gmail.com, quic_abhinavk@quicinc.com,
 dmitry.baryshkov@linaro.org, sean@poorly.run, airlied@linux.ie,
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 agross@kernel.org, bjorn.andersson@linaro.org,
 konrad.dybcio@somainline.org, quic_kalyant@quicinc.com,
 swboyd@chromium.org, robert.foss@linaro.org,
 angelogioacchino.delregno@somainline.org, loic.poulain@linaro.org,
 quic_khsieh@quicinc.com, quic_vpolimer@quicinc.com, vkoul@kernel.org,
 dianders@chromium.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jonathan Marek <jonathan@marek.ca>, vinod.koul@linaro.org,
 quic_jesszhan@quicinc.com, andersson@kernel.org
Subject: [PATCH v2 00/12] Enable Display for SM8350
Date: Tue, 15 Nov 2022 14:30:53 +0100
Message-Id: <20221115133105.980877-1-robert.foss@linaro.org>
X-Mailer: git-send-email 2.34.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dependencies:
https://lore.kernel.org/all/20221102231309.583587-1-dmitry.baryshkov@linaro.org/
https://lore.kernel.org/all/20221024164225.3236654-1-dmitry.baryshkov@linaro.org/
https://lore.kernel.org/all/20221104130324.1024242-5-dmitry.baryshkov@linaro.org/

Branch:
https://git.linaro.org/people/robert.foss/linux.git/log/?h=sm8350_dsi_v2

This series implements display support for SM8350 and
enables HDMI output for the SM8350-HDK platform.


Changes from v1:
 - Added R-b tags from v1
 - Added qcom,sm8350-dpu binding patch
 - Added qcom,sm8350-mdss binding patch
 - Corrected sm8350.dtsi according to new dpu/mdss bindings
 - Bjorn: Removed regulator-always-on property from lt9611_1v2 regulator
 - Bjorn: Moved lt9611 pinctl pins into a common node
 - Bjorn/Krzysztof: Moved status property to last in node
 - Krzysztof: Changed hdmi-out to hdmi-connector
 - Krzysztof: Fixed regulator node name
 - Krzysztof: Changed &mdss to status=disabled as default
 - Krzysztof: Changed &mdss_mdp node name to display-controller
 - Krzysztof: Fixed opp-table node name
 - Krzysztof: Fixed phy node name
 - Dmitry: Split commit containing dpu & mdss compatibles string
 - Dmitry: Added msm_mdss_enable case
 - Dmitry: Fixed dpu ctl features
 


Robert Foss (12):
  dt-bindings: display: msm: Add qcom,sm8350-dpu binding
  dt-bindings: display: msm: Add qcom,sm8350-mdss binding
  drm/msm/dpu: Refactor sc7280_pp location
  drm/msm/dpu: Add SM8350 to hw catalog
  drm/msm/dpu: Add support for SM8350
  drm/msm: Add support for SM8350
  arm64: dts: qcom: sm8350: Add &tlmm gpio-line-names
  arm64: dts: qcom: sm8350: Remove mmxc power-domain-name
  arm64: dts: qcom: sm8350: Use 2 interconnect cells
  arm64: dts: qcom: sm8350: Add display system nodes
  arm64: dts: qcom: sm8350-hdk: Enable display & dsi nodes
  arm64: dts: qcom: sm8350-hdk: Enable lt9611uxc dsi-hdmi bridge

 .../bindings/display/msm/qcom,sm8350-dpu.yaml | 120 +++++++
 .../display/msm/qcom,sm8350-mdss.yaml         | 240 +++++++++++++
 arch/arm64/boot/dts/qcom/sm8350-hdk.dts       | 332 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8350.dtsi          | 226 +++++++++++-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 210 ++++++++++-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   1 +
 drivers/gpu/drm/msm/msm_mdss.c                |   4 +
 8 files changed, 1108 insertions(+), 26 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sm8350-dpu.yaml
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml

-- 
2.34.1

