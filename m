Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B113B629718
	for <lists+dri-devel@lfdr.de>; Tue, 15 Nov 2022 12:17:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43A4510E132;
	Tue, 15 Nov 2022 11:17:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B26E10E3A2
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Nov 2022 11:17:33 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id n12so35138913eja.11
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Nov 2022 03:17:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=f6IjOuxVRqwYYk9pLv1Yfn07Gi6XGY94dgyzaZaHkoI=;
 b=puMBpdWyj4ubsojCo/jC54Hst8XON3KObkLMeAubcKA6ihpqoIIDRkJRvVIQCMJ1YP
 7eYr5a7zHxqqgsEuzmiMYYTazppiXKn+gSLR1tX9tuNh9OlcJhOsfU9MVeQsUOcTqsdv
 5njesmo3FllfcDseoIMj9J+nHjEUgrq4sKghAnOETIr1jkbt3lnW6rjGAaAtLBO2cI8c
 UpqCQNu7F2MLUz9fIbW3PH+I78Ux5G+zWgal1/0RHbC7JQYj5HvLaPhJwNLKuPHK3X2b
 n+8I1dMIX0BhhtsmDr3YURxUhOhIpJymN0jsjr6wD+y42GeSA2CQjo5h6ghaSvTfET+0
 Nguw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=f6IjOuxVRqwYYk9pLv1Yfn07Gi6XGY94dgyzaZaHkoI=;
 b=Uflk5foNbS4RCSDNcRtnDaWE2B5qZRNMQUo15p654OU9O5m0dtIaHqnALmEer/glHy
 9/bjwiq5B+CMyqVcq3Yh4q17ARCXkY1n0+zUJ8TR8VO8b1JPeW2x057MFMf4TIxTeJQe
 k8ufJbTRzn4Cl4a5RkwYyPHBX4SMA66udCLLJnfSAOsPpHJccGhuleoMbqEnKJq/pDUi
 dy4y0Cv4E4B8KPmk0quM981I8GESncY9E/IoEuk/oO/LhFQRg32KS42BaTfkLNJ1sx8p
 LdfZePVLX9JAey3XXnoFCuwz8MbW9yfUVPSMAbSsMZgPNSRC6Rq+0DPdBxcEeYEDMql6
 ZMSw==
X-Gm-Message-State: ANoB5plDRprhI5JrmIUnOxAC5SQLj7qPDZogT2n1TSf0WrFl7eX6lzjT
 mUde9git2JMOCo7Y8WLut7URrQ==
X-Google-Smtp-Source: AA0mqf5IysjqPGQiH0eOOXTA4zlm4ZoIUc/ikYmnFKhdkc7e/dZX+QzxUMdfSlI1E9bvlfo9aJxpaw==
X-Received: by 2002:a17:906:388c:b0:7aa:97c7:2c04 with SMTP id
 q12-20020a170906388c00b007aa97c72c04mr13520583ejd.191.1668511051709; 
 Tue, 15 Nov 2022 03:17:31 -0800 (PST)
Received: from prec5560.. (freifunk-gw.bsa1-cpe1.syseleven.net. [176.74.57.43])
 by smtp.gmail.com with ESMTPSA id
 eg25-20020a056402289900b00457b5ba968csm5973519edb.27.2022.11.15.03.17.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Nov 2022 03:17:28 -0800 (PST)
From: Robert Foss <robert.foss@linaro.org>
To: robdclark@gmail.com, quic_abhinavk@quicinc.com,
 dmitry.baryshkov@linaro.org, sean@poorly.run, airlied@linux.ie,
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 agross@kernel.org, bjorn.andersson@linaro.org,
 konrad.dybcio@somainline.org, quic_kalyant@quicinc.com,
 swboyd@chromium.org, robert.foss@linaro.org,
 angelogioacchino.delregno@somainline.org, loic.poulain@linaro.org,
 vkoul@kernel.org, quic_vpolimer@quicinc.com, dianders@chromium.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jonathan Marek <jonathan@marek.ca>,
 vinod.koul@linaro.org, quic_jesszhan@quicinc.com, andersson@kernel.org
Subject: [PATCH v2 00/12] Enable Display for SM8350
Date: Tue, 15 Nov 2022 12:17:09 +0100
Message-Id: <20221115111721.891404-1-robert.foss@linaro.org>
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

