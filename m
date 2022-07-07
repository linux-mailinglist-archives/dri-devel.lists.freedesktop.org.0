Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC7CE56AD82
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jul 2022 23:32:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 311F911A864;
	Thu,  7 Jul 2022 21:32:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81F5311A071
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Jul 2022 21:32:07 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id e20so4542023lfq.11
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Jul 2022 14:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7Jn6Iu6IK/cjTsHc82YNQ/VqbemoAFWW2VWGq7e/Oyc=;
 b=DXNw+Lwu0b1c4Q7WGiKJn+tKfkGfrOKlD7rgU61K1kPy51HaIBn/x+JMD9O2sjOz7Q
 4Prp6O0gqeqGU1KBazLNZTgnLTjs/mDFxjQly0CuR6Q1XwiPry6MHhyP81AiNqaijUuz
 FWyxk+urYZTTDnk7nufyM2npOqTRZQ8T0PO3E7dGMcgU1QCbRnDQuo8mMx4xZ79Rzpuw
 QdZOGtWSHRMrjJcGkYadSUzFZQfXxdboJyBBAZMrqjKMzVIApafXsPVwTr1fTVwCv3v/
 VznA2WZVqlw8zvTegoBTgPy1xGXxPcXD0bv0ocNjAJG3743qeBHCIJbNcwwFDvx+FmAq
 6rDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7Jn6Iu6IK/cjTsHc82YNQ/VqbemoAFWW2VWGq7e/Oyc=;
 b=B6ZwxBI74HvuzA975bIhHGb5zGZHOQGYuO6Oxf91Mpd/T1NQhdlYFOpmZL2s9XbRB6
 qyzGFJpYyvzjMdo1LYWs7UGrattu9X6nQ4oe/dy3dg8EnuDZhpaWV5QbxaYxKjS4EcG0
 l/eJOzT9nhbO8ASV8ABKNvnLSYvjbRbkECIT9Dxuk0oZFMtznsnoKhV+qxWOASclS497
 URJwSq2E1F4PnGdo8HCgiZd+Gf4tPGiX3Sq6p1te5TqrVZTjStD0X+FCqkmdi/3+oY0x
 vqyuHrnZtSZExff26eLpLugAwxca8+Jj2vC2O8cHNEkue6gH+qg0HMDOcX2+ISDnXLEL
 O1MA==
X-Gm-Message-State: AJIora8VSDFbzsyeNxhVt9O2lyIUnY96hvixDfOn0AzgGkd+3Czdd8vQ
 6rzicRz/aD+iF86M201vNHuZpQ==
X-Google-Smtp-Source: AGRyM1vmraEqvsKJOGH5XWV+o6YVlUd7ht5gxF0NEUL44H7Z8+DZYQI+aJN1f5ShgR7NbAP3B4aPfw==
X-Received: by 2002:a19:490c:0:b0:481:4b9e:cbdb with SMTP id
 w12-20020a19490c000000b004814b9ecbdbmr152799lfa.350.1657229525781; 
 Thu, 07 Jul 2022 14:32:05 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 o19-20020ac24e93000000b0047f8cb94004sm7046709lfr.35.2022.07.07.14.32.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jul 2022 14:32:05 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH 0/9] dt-bindings: msm/dp: cleanup Qualcomm DP and eDP bidndings
Date: Fri,  8 Jul 2022 00:31:55 +0300
Message-Id: <20220707213204.2605816-1-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix several issues with the DP and eDP bindings on the Qualcomm
platforms. While we are at it, fix several small issues with platform
files declaring these controllers.

Dmitry Baryshkov (9):
  dt-bindings: msm/dp: drop extra p1 region
  dt-bindings: msm/dp: bring back support for legacy DP reg property
  dt-bindings: msm/dp: mark vdda supplies as deprecated
  dt-bindings: msm/dp: add missing properties
  dt-bindings: msm/dp: account for clocks specific for qcom,sc7280-edp
  dt-bindings: msm/dp: handle DP vs eDP difference
  arm64: dts: qcom: sc7180: drop #clock-cells from
    displayport-controller
  arm64: dts: qcom: sc7280: drop #clock-cells from
    displayport-controller
  arm64: dts: qcom: sc7280: drop address/size-cells from eDP node

 .../bindings/display/msm/dp-controller.yaml   | 115 ++++++++++++++----
 arch/arm64/boot/dts/qcom/sc7180.dtsi          |   1 -
 arch/arm64/boot/dts/qcom/sc7280.dtsi          |   5 -
 3 files changed, 91 insertions(+), 30 deletions(-)

-- 
2.35.1

