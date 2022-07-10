Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 076D656CDE4
	for <lists+dri-devel@lfdr.de>; Sun, 10 Jul 2022 10:41:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DE7E11BE78;
	Sun, 10 Jul 2022 08:41:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43FB211BE78
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Jul 2022 08:41:36 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id bx13so3037073ljb.1
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Jul 2022 01:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ng9sE96WrnIx3xQqutYhfh5XLKWJitjlsYB4zzGeV8U=;
 b=Qsn4LaHSwTMU51F04OesvPJNbPxXD4oMQFLWl/7JxiEGaAJEzqpHUT5+EnoOOlvzMf
 HREx4aWfGryUUkow99r0JpcNX68syExzCcnhjj2pjpA6h7O4J0tfGX6+DF0Axs4xaW24
 FxOCj6FxUww5Ya4dk9IyY+qjhItSIoZgeUnCBKFjSu8Qe9PwOFXTjWGbupmsXfXz+MTL
 9J15KATd74EpxXmcmb/iS5ucRzjm7Fta7y9nGJVkKYz19rtzHMP/HkiIABQSS6g+JAGE
 tQmsgqku0gZk4r8lScKAKNv8pClXqNxccvr80e9QE6CEevcKCXIrSCeHHzlzLq1mIBHR
 /BJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ng9sE96WrnIx3xQqutYhfh5XLKWJitjlsYB4zzGeV8U=;
 b=s+gSkX8ZzuULb6NZwf9Zyc+d6aebCsDZJ+Kv4MN4d67Lp8MyOWcg+9j9KksgpUU1+K
 ltF+4Wo5A0E4SHF5LrIB/26QFMFS4z6MlQcdLlkRGnV1oibg8lU4Nsvv5eqBUIzbSHAw
 +I19Ww+WpUuDDTdvCAWWLP0sebdrgyf2292qZ5XThEymKQ7BJ/+wxffcz9xNL4GX3U2m
 w7or8h6Duv7TXrIH9CAzp1081oZeqZW+jHe5PherJwdM0sB1bb/t+rCnqsi+sb7n51lz
 iDxqYO9DLQFpuDZBUWGnsMlUnAvnNnUX6Yqi1W4k0tIO65OW2DSB6gTKYBM/jHAnsQn1
 pp0Q==
X-Gm-Message-State: AJIora/F9WvhzGeNuPiOGAALr/eFcRfdH+OPgqSE/BmFllOmQPlEQixP
 YbtzyNAaQw7YPxJCIr4X8gtKCA==
X-Google-Smtp-Source: AGRyM1v08aU8P5seYjw/3JLFPxv2a3nAdhwSLebTrqOgrKbenfnMH+mgaHO46Ye5C47bl9zpxFySzQ==
X-Received: by 2002:a2e:b0d3:0:b0:25d:6888:7c70 with SMTP id
 g19-20020a2eb0d3000000b0025d68887c70mr913658ljl.244.1657442495285; 
 Sun, 10 Jul 2022 01:41:35 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 i21-20020a2ea235000000b0025d4addbad4sm912536ljm.91.2022.07.10.01.41.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Jul 2022 01:41:34 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v2 0/9] dt-bindings: msm/dp: cleanup Qualcomm DP and eDP
 bidndings
Date: Sun, 10 Jul 2022 11:41:24 +0300
Message-Id: <20220710084133.30976-1-dmitry.baryshkov@linaro.org>
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
 Stephen Boyd <swboyd@chromium.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix several issues with the DP and eDP bindings on the Qualcomm
platforms. While we are at it, fix several small issues with platform
files declaring these controllers.

Changes since v1:
 - Reordered patches to cleanup dts first, to remove warnings from DP
   schema
 - Split DP register blocks in sc7180.dtsi and sc7280.dtsi
 - Cleaned up the p1 register block handling: marked it as required for DP
   and absent for eDP controllers
 - Dropped unused xo and ref clocks from sc7280-edp node, they belong to
   eDP PHY.

Dmitry Baryshkov (9):
  arm64: dts: qcom: sc7180: split register block for DP controller
  arm64: dts: qcom: sc7180: drop #clock-cells from
    displayport-controller
  arm64: dts: qcom: sc7280: split register block for DP controller
  arm64: dts: qcom: sc7280: drop #clock-cells from
    displayport-controller
  arm64: dts: qcom: sc7280: drop address/size-cells from eDP node
  arm64: dts: qcom: sc7280: drop unused clocks from eDP node
  dt-bindings: msm/dp: mark vdda supplies as deprecated
  dt-bindings: msm/dp: add missing properties
  dt-bindings: msm/dp: handle DP vs eDP difference

 .../bindings/display/msm/dp-controller.yaml   | 47 ++++++++++++++++---
 arch/arm64/boot/dts/qcom/sc7180.dtsi          |  7 ++-
 arch/arm64/boot/dts/qcom/sc7280.dtsi          | 19 +++-----
 3 files changed, 53 insertions(+), 20 deletions(-)

-- 
2.35.1

