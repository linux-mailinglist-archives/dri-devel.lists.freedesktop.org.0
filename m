Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 31349634B34
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 00:37:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DADD210E49B;
	Tue, 22 Nov 2022 23:37:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 059E510E495
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Nov 2022 23:37:02 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id g12so25832782lfh.3
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Nov 2022 15:37:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jiQzjk4U2HBL8m9nCmdH0QqbW0qnEDB7JZce1irB8qw=;
 b=gGKAQKdv563C0u+WXaCrTOxSt4oi0Gzo9xbEyK0chJ5EkTcKRvEG7Chp7zHxOYhqBU
 xuNHeX+I2qzo1Bb65t4nCoto3D19Npd11LkQvCygMMcnblKMIbwQbZe66b1NfkaRBqtU
 NjP7rEVEXms5uh0ocz6cA72tmeEtp/7+DR4ub5CEW/zJTzFn1cxlxxfw6tcDfaQfFr3N
 PiXhHoDN38B5dqHk3D3MlUy68kYLCgGelhayXsDx7XmGEmxoRn3u7UVp5H4+5Nbm9H9K
 x7qG8BPSG/JBj02t2RUFCCNYdVZJj41myreXKfbExEFnTo03HpIYmNkz7iFD5no7/XuX
 6H4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jiQzjk4U2HBL8m9nCmdH0QqbW0qnEDB7JZce1irB8qw=;
 b=Ye4Gspw9oT8iAWF4XGH38uWrkvYDxdUBKXb0MfDN297SjRyNO2CByOec25aB7xCIvt
 llrVFdah03V1fx8LBXyfL3fBLRa82y0YwofXZmUSvhifrHVRxvk7sj/HviDWVZI0d45G
 MDSskStq7VBDB4tmxl6V4Wz0IKl7yZ93xTxJI5WaYrDIHAnyQhgvkZoWwcE21i1gtvPH
 pBEWry8WHmDVdfX7NEuoMBMxcJx4P+PMGNYnxb1quxo8D+8FdT6/yA8QyjFNQPu+iviW
 SbMiv21mUHzzmlbUxO05LcOdmujvV0FP6DMtnhgoJ8GUsfaWhHywuf9g+L7PP20Q423B
 qcBQ==
X-Gm-Message-State: ANoB5plNRRICrhnAgMfv9MFLMskGbuxdnK75ZA1VC0ix4gy/TCSUB3bE
 QTK8nKwXyQyKXA2Uhpu1AUpFrQ==
X-Google-Smtp-Source: AA0mqf4rbwu1mUCXJ+V4n19yRGiu6bs/kFIOG1QwdiwAGz+l+K+/1xXJzZ04Qsd1evUe7LbbLVzz7g==
X-Received: by 2002:a05:6512:32d0:b0:4b4:b5ed:c71f with SMTP id
 f16-20020a05651232d000b004b4b5edc71fmr8410539lfg.227.1669160220307; 
 Tue, 22 Nov 2022 15:37:00 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (dzpbkzhtyyyyyyyyyyyyt-3.rev.dnainternet.fi. [2001:14ba:a302:8a1a::1])
 by smtp.gmail.com with ESMTPSA id
 h3-20020ac250c3000000b00492c463526dsm2666454lfm.186.2022.11.22.15.36.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Nov 2022 15:36:59 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v2 0/5] arm64: dts: qcom: sm8450-hdk: enable HDMI output
Date: Wed, 23 Nov 2022 01:36:54 +0200
Message-Id: <20221122233659.3308175-1-dmitry.baryshkov@linaro.org>
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

 arch/arm64/boot/dts/qcom/sm8450-hdk.dts | 119 ++++++++++
 arch/arm64/boot/dts/qcom/sm8450.dtsi    | 304 +++++++++++++++++++++++-
 include/dt-bindings/power/qcom-rpmpd.h  |   1 +
 3 files changed, 412 insertions(+), 12 deletions(-)

-- 
2.35.1

