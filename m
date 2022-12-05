Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D8EFD642D07
	for <lists+dri-devel@lfdr.de>; Mon,  5 Dec 2022 17:38:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72C3110E0DC;
	Mon,  5 Dec 2022 16:38:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA3C110E0A2
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Dec 2022 16:38:00 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id bj12so29157327ejb.13
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Dec 2022 08:38:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=vw1KzIGH3Ss6fc3E2pWM7Y1p2LnTyddlJD34yedCJAo=;
 b=pTffiomX2l7lpqqQICVRZW2YjRrUfsAG9YcxMc6p6E3UP+pPkbCOkb9YR3AoCGXC4c
 uJeTGVrrIGm4cp5rb4tLmQqoMEBwH+Tgh3t9WBD0IeGETbJjDsFTV9nDJeLhc5XdWhsZ
 eHUU9Jx0Gczcn80vfl33SKaNwgzfLSf3bQmGGT/8P3kz0DLCaBlG/gAZZP1CozHMziKF
 cLZ0eADIBn4sz2f+tKf+06++2PynfoQbijcqj7zvIHcFRFWXN+DodmbngpiV8Jl7ehoy
 OFEzrEaSVGT0abiluET+em7HubIg+MQvZjm8YmSTRyjaTrEBD/wm9UEIhqqHLQxGSQqi
 xFDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vw1KzIGH3Ss6fc3E2pWM7Y1p2LnTyddlJD34yedCJAo=;
 b=ZT3/xJDhfJ1wNA1acFdjfJJM17d5aSrJZaFnTmPsjdzIn3zaoRlEOvoBd7q/GBJYr5
 yC+hu3Zaoqg9eLqB8QeLLvJcG4k9Hm1JGLIqDkDNJlkg6h+b47EW6CiFXYWCl2jW1+u8
 IEfXxI3UZRCRVhBoXst+zdYsNjAd6SxRAH0iy/Kwqj11iCGGvI2SnHMusVQHBOH3MqZq
 7q6UtHVdpp/9O9V2iH09HqLHOTkHlgM4uKD6A1j7YVNt1EXvJlKGlJ09dbQFdccW2jdN
 /pfdYd+l6fLqizS8qC6l/Er32lQKl37fvY7+S16lB2DoTpNujQ+KqVcu5hc8wuS8ToSm
 5Edw==
X-Gm-Message-State: ANoB5plgGgWfovGHtMo5wB1IeyLEx6mc+znbf88cx2lSfVwmNKtsTBs3
 WIPhjbv1AsIus71bbJnE7uTlOA==
X-Google-Smtp-Source: AA0mqf5eJN8MzV9ViJA/mumudvzKh8vziLSQLFAlZs+wrELKleuv/lGeIxtJNoSPv68nbYDzR5yvAw==
X-Received: by 2002:a17:906:240f:b0:7c0:f7b0:fbbb with SMTP id
 z15-20020a170906240f00b007c0f7b0fbbbmr4155635eja.266.1670258279325; 
 Mon, 05 Dec 2022 08:37:59 -0800 (PST)
Received: from prec5560.localdomain (ip5f58f364.dynamic.kabel-deutschland.de.
 [95.88.243.100]) by smtp.gmail.com with ESMTPSA id
 e21-20020a170906315500b007bed316a6d9sm6413610eje.18.2022.12.05.08.37.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Dec 2022 08:37:58 -0800 (PST)
From: Robert Foss <robert.foss@linaro.org>
To: robdclark@gmail.com, quic_abhinavk@quicinc.com,
 dmitry.baryshkov@linaro.org, sean@poorly.run, airlied@linux.ie,
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 agross@kernel.org, bjorn.andersson@linaro.org,
 konrad.dybcio@somainline.org, quic_kalyant@quicinc.com,
 angelogioacchino.delregno@somainline.org, robert.foss@linaro.org,
 loic.poulain@linaro.org, swboyd@chromium.org, quic_vpolimer@quicinc.com,
 vkoul@kernel.org, dianders@chromium.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jonathan Marek <jonathan@marek.ca>, vinod.koul@linaro.org,
 quic_jesszhan@quicinc.com, andersson@kernel.org
Subject: [PATCH v3 00/11] Enable Display for SM8350
Date: Mon,  5 Dec 2022 17:37:43 +0100
Message-Id: <20221205163754.221139-1-robert.foss@linaro.org>
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
https://git.linaro.org/people/robert.foss/linux.git/log/?h=sm8350_dsi_v3


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
 
Changes from v2:
 - Rob: Added r-b
 - Rob: Improved mdss binding description
 - Rob: Added interconnect names for mdss-binding
 - Rob: Removed phy from example
 - Konrad: Remove sc7280_pp refactor patch
 - Konrad: Fixed upper case hex in dpu_hw_catalog
 - Konrad: Fixed various downstream dts based values for dpu_hw_catalog
 - Konrad: Removed status=disabled from mdss_mdp
 - Konrad: Removed phy-names from dsi nodes
 - Konrad/Dmitry: Change mdp_opp_table opp-200000000 to use &rpmhpd_opp_svs, add comment
 - Dmitry: Move mdp_opp_table to dsi0 node


Robert Foss (11):
  dt-bindings: display: msm: Add qcom,sm8350-dpu binding
  dt-bindings: display: msm: Add qcom,sm8350-mdss binding
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
 .../display/msm/qcom,sm8350-mdss.yaml         | 221 ++++++++++++
 arch/arm64/boot/dts/qcom/sm8350-hdk.dts       | 332 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8350.dtsi          | 228 +++++++++++-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 196 +++++++++++
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   1 +
 drivers/gpu/drm/msm/msm_mdss.c                |   4 +
 8 files changed, 1084 insertions(+), 19 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sm8350-dpu.yaml
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml

-- 
2.34.1

