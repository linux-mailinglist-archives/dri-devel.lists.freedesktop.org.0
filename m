Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B213619737
	for <lists+dri-devel@lfdr.de>; Fri,  4 Nov 2022 14:14:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06BD010E748;
	Fri,  4 Nov 2022 13:14:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 477DD10E74A
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Nov 2022 13:14:02 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id l8so6262439ljh.13
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Nov 2022 06:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vkNU3+fp0nhaCwixTYlRHoDEFAnLM2EV/3w7IT8vNw4=;
 b=HLaOKFbepOY9VJ3gr1x5NgM/GwvMIHKqUMbknWaeU3h2qGxlJLt4QUvVBnFlRUmY6F
 eNBmATDZ/hDVpS6avJnga+LSbezCUtgOCqQbnBNs2KAMYEiZZB8wm70NXehTJCJWxZzD
 asBbK5cWoixW9xnsJFj3bPbkMUMy3wxxwX4RuQEQ8hgBxit15xHe4O6SRu+xGsse1JhK
 ClJDNO/g2eK3pW3m0WQUYvzdvA1voKqcKCmniH99HmIGzanotBREFZ0HZ9usdyzDKRbX
 pBI/EepxckCd1p3TjMICEAiQtmiaRAN7Q9wrUXvVPwUPaBJOO8tMgosrkPsh1OMYFNbz
 PZrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vkNU3+fp0nhaCwixTYlRHoDEFAnLM2EV/3w7IT8vNw4=;
 b=AFjDKkvE4JDRP4kDgZ/3d0Eaof7UkcHf6JpHhVt7FOq0FO9t18571orRJS811Z8YY5
 wcX0rawmjiA85qgkcD7P5haYbxMx5wEJv5JVhL0I4Jx9MqH4ui6s/iSVVZTr1uqGla0V
 nhdIlG5yLWfkxcHZZiO5YChbQdJhXGSCaR+QQERWi05KwPdsvfpepiKs8AmSOLhwcwam
 40wE5S8hw6BNnKA8IewLIsz+5oLngD1h6dzf+cKkOw9oSEUu39v/IQf81UWJEqRv+GJ4
 i20eiJVy60IVsXL6C1obqiXX4UhC56x3Sy3ytWqG58gOEuJXCPdOrzEvbtoVhC1ItMtN
 tojg==
X-Gm-Message-State: ACrzQf1Kzk9XXqlnh51u7GTY2AdlL0d9871ej2fi58/VN7ifm7aohN3U
 g1zc4xjTfP7LNx78IGVGXAOWZQ==
X-Google-Smtp-Source: AMsMyM6L5kv9idmr6tL6VMZge4A6ccABD2Rf6Tdjxzvbt7trM4M0KMRdHYubn2IjK29mSFCyyDuuHw==
X-Received: by 2002:a05:651c:14f:b0:277:3f46:a034 with SMTP id
 c15-20020a05651c014f00b002773f46a034mr12664086ljd.529.1667567640496; 
 Fri, 04 Nov 2022 06:14:00 -0700 (PDT)
Received: from localhost.localdomain ([195.165.23.90])
 by smtp.gmail.com with ESMTPSA id
 t27-20020a19911b000000b004a95d5098f2sm457050lfd.226.2022.11.04.06.13.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Nov 2022 06:14:00 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v1 0/5] arm64: dts: qcom: sm8450-hdk: enable HDMI output
Date: Fri,  4 Nov 2022 16:13:53 +0300
Message-Id: <20221104131358.1025987-1-dmitry.baryshkov@linaro.org>
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
 Vinod Koul <vkoul@kernel.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add device tree nodes for MDSS, DPU and DSI devices on Qualcomm SM8450
platform. Enable these devices and add the HDMI bridge configuration on
SM8450 HDK.

Dmitry Baryshkov (3):
  arm64: dts: qcom: sm8450: add RPMH_REGULATOR_LEVEL_LOW_SVS_D1
  arm64: dts: qcom: sm8450: add display hardware devices
  arm64: dts: qcom: sm8450-hdk: enable display hardware

Vinod Koul (2):
  arm64: dts: qcom: sm8450-hdk: Add LT9611uxc HDMI bridge
  arm64: dts: qcom: sm8450-hdk: Enable HDMI Display

 arch/arm64/boot/dts/qcom/sm8450-hdk.dts | 124 ++++++++++
 arch/arm64/boot/dts/qcom/sm8450.dtsi    | 304 +++++++++++++++++++++++-
 include/dt-bindings/power/qcom-rpmpd.h  |   1 +
 3 files changed, 417 insertions(+), 12 deletions(-)

-- 
2.35.1

