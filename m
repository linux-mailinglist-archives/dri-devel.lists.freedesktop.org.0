Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 238EC645130
	for <lists+dri-devel@lfdr.de>; Wed,  7 Dec 2022 02:28:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B04B310E199;
	Wed,  7 Dec 2022 01:28:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DB1310E168
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Dec 2022 01:28:06 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id s8so26423790lfc.8
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Dec 2022 17:28:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=bfrgb8LmygfZn98WhFUeywPOLMjR7f+hzTMKV7Woi74=;
 b=mdd8dfqV16Bi1k3ovMs3c2p2XNU0oKk3XwBCg7DQfxE3iHVPJBGVx73xkZPw+/F1qj
 vlIjnCbRLHq8wy8yeldNalMGRS5VkJD9TuEgnPCrz1CvUau+pwoGDK3ZYQB4Uq2QSGi0
 6Yef2o0wwf8wMDZwAiFx1JlBNNYClSB3NdV0yIIz0/DPH/13nTP0qhB6LbhZh2pwMGSZ
 DRTHUSWzVdoMUdlfD2upZlxtJCEif+EzGOG/YcOyA2YFmm7LcYlFNVeXqV1BOjK8eJLf
 D0G97OgPyp8FAueY7rNw92IdrLRW3qRk/tnbZISITRyKm/K3aHqif68ivdJfCRYxXbdi
 p8+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bfrgb8LmygfZn98WhFUeywPOLMjR7f+hzTMKV7Woi74=;
 b=whep7eBjXaof7AXPc5TDZQK00IseRBtgqSw3Jkr/7oo1naFgY0x1LWRBbJVBaDTKzj
 rZbNW0bM/bCBfi9o4cmBI6l1UQnZcdtYHQAtoZZLfy4YX+6zl5v7pM1Rl6dho5+cyfi2
 5OFzE5GyXMWkh5LSNUbkUQgf51/O8xU/diXgN5W3ULK4nTPbwTRM1ucrY8utVYZuXOY8
 krWbNm0hKwr8UahQXPNKUDNQg/uwZcRqBmdtwveQdlMD3cUMlTusaGq3JUSVI0bPVNch
 KUIlEPBi+paguEnr9PbFWh+wPphFedkAyVOO5mi13ExkFnI/eDiwcHw0CnJefiUj6z1E
 ETkQ==
X-Gm-Message-State: ANoB5pneB56BFBZlQLCZwbSbHlm0j9zw2mnwNVxsGeiGvKgqa/hdR8qE
 /Lxn1AGDzevrsWHvuD9Rh8Kthg==
X-Google-Smtp-Source: AA0mqf4RwQzhEUSeU7ewYGfbNrc0S+6QgfPge42Yi9h+mSEhUzs8nFr/i4pnZuGpqSazHuu+/x1ykA==
X-Received: by 2002:a05:6512:340d:b0:497:456d:890 with SMTP id
 i13-20020a056512340d00b00497456d0890mr22844683lfr.687.1670376484641; 
 Tue, 06 Dec 2022 17:28:04 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 n26-20020a05651203fa00b004b5626ef9f4sm1461157lfq.262.2022.12.06.17.28.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Dec 2022 17:28:04 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v4 0/5] arm64: dts: qcom: sm8450-hdk: enable HDMI output
Date: Wed,  7 Dec 2022 03:27:58 +0200
Message-Id: <20221207012803.114959-1-dmitry.baryshkov@linaro.org>
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

Changes since v3:
- Renamed mdss node to display-subsystem@ (Krzysztof)
- Dropped empty line from the patch4 (Krzysztof)
- Renamed HDMI connector endpoint to hdmi_connector_out

Changes since v2:
- Dropped clock-names from mdss device node
- Fixed pinctrl configuration used by lt9611uxc (Krzysztof)

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

 arch/arm64/boot/dts/qcom/sm8450-hdk.dts | 117 +++++++++
 arch/arm64/boot/dts/qcom/sm8450.dtsi    | 303 +++++++++++++++++++++++-
 include/dt-bindings/power/qcom-rpmpd.h  |   1 +
 3 files changed, 409 insertions(+), 12 deletions(-)

-- 
2.35.1

