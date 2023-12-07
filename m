Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 117D1808D94
	for <lists+dri-devel@lfdr.de>; Thu,  7 Dec 2023 17:37:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B536510E934;
	Thu,  7 Dec 2023 16:37:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D250110E932
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Dec 2023 16:37:29 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40c1e3ea2f2so11884555e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Dec 2023 08:37:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701967048; x=1702571848; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=QHPdC8oASRump8lliefjp+VWx5EqaK9zM/MQaDjAajM=;
 b=rD+BT63OeqTL/PJJthDB15H1Zhx/6HwcRBOU122RMirI/Vsq+87nQ5fzMr7p/E35fE
 pN9yeILOVwFy4VLy0JVP9sRLNVKo1D0s2VdhqOK3JnYUoXmiIbao0RF8soktBVTYL5nW
 dADZslSmLtJcwLpp08isCeaPoE0ZJ2+NNfzQYuSJUYTZ2EYsvl7MvjLMvQo0jmxspQJQ
 sqvsrGhtLkw1HateyAVAiRZQw8KttiRrynb9HoF7xp35NdNms+6S2eNNbGdP+/2Zcdnh
 kY0qwTk4hxzyemE3uJErpT1EiKNkpTWp5LAdcnBsCTuu2pvG2u2wGiaqN39ZFB6/cscq
 8elg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701967048; x=1702571848;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QHPdC8oASRump8lliefjp+VWx5EqaK9zM/MQaDjAajM=;
 b=LGq12alA3ZvNpaQi9h29DlEqce9mo6aHz9czAlHdpm9bhRGlkF/RZ6kN66hnNvlue6
 krRCQSexCKO+i4HhqoZY4MApfEUOvJXpbENmg3qVl6liV1duwiCBOIDLU1PioCN+IjvR
 cqB7r/AnnoQzAUiuAC9CQWhbKG9Ux+sGm4i7nEJxEHyp2Cm/Ju5WfqJ5PmAyJacOs/qb
 hTQBzHGL1yfPhJa0U9oH/P3XkCI/51m+fbWCo4RMvfUMX46orZfDMo6n7oZAi1uu4cL1
 6uiHDnTnZv6Q+8WJeagdWxozzxJ6xojiuJR5vF7hEJNoV1tLaS2Q0qPAA+IH7lPJJU8R
 tEBw==
X-Gm-Message-State: AOJu0YyIGhfN1TQDOkvpYE4f3yoT/47R1/sb16LZ9g/BNoGWd15xJMGu
 X1NK/q33I2Mm9eITlSA4hKobaw==
X-Google-Smtp-Source: AGHT+IECup8lerGo7s57uB+PYd5IipnuMCyZOc5WNaL7TCPdJGJcwc1h0hxkWIrWeL4zEkuayTbOoQ==
X-Received: by 2002:a05:600c:3144:b0:40b:4812:22e2 with SMTP id
 h4-20020a05600c314400b0040b481222e2mr1703251wmo.11.1701967048113; 
 Thu, 07 Dec 2023 08:37:28 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 r5-20020a05600c35c500b004080f0376a0sm175424wmq.42.2023.12.07.08.37.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Dec 2023 08:37:27 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH 0/3] arm64: qcom: sm8650: add support for DisplayPort
 Controller
Date: Thu, 07 Dec 2023 17:37:16 +0100
Message-Id: <20231207-topic-sm8650-upstream-dp-v1-0-b762c06965bb@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALz0cWUC/x3MPQqAMAxA4atIZgNtxR+8ijjUmmoGtTQqQvHuF
 sdveC+BUGQS6IsEkW4WPvYMXRbgVrsvhDxng1Gm0ka1eB6BHcrWNbXCK8gZyW44B7ST9k5PXrm
 2gZyHSJ6ffz2M7/sBJqqDj2oAAAA=
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1244;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=DEk4ut9+Eb2hTaXLTn1gbajtsrPpbY3ybidbDLfSO9Q=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlcfTF8nxT5gy3VCqOv83+EH5YSHq5f3Ed4xnl1LWe
 ZxBTOLeJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZXH0xQAKCRB33NvayMhJ0ZPiD/
 9QHLYS27pZ9P60USW8oJeQkpKWQjoQgC+eO7xx3SzfI+MhRT9RJvkGfp1hWx1FGPoQ/YP3ybHuKFzZ
 du3eCISSqUDhdcHiGyTKQp3TU+5EfGCyHk6CJBgJwZdrNDFjalZwNqFxg5lxTBdSFjS++Y0+Oc2E5v
 N+dQzxs84pmHQXQxc/ZmgvtqWYFBINQ9ncOpNt1CFIo7fYT29OtzPL70Fmz71HWndOkri7dp7N2FBg
 PX6MKINs1IYdKejUuPRllLcPD/x6d8wBqsfIM0oSjOQ2HLKGsvuGRQsbThbjl0fjt0kqMwZ5hWSHbf
 kw9hPoO4OMp/Ne7JipYvLEAlk72leZI7AjYv6xHNkrnBV1Sj5nWiYW5Iq9k2yv0a0c0Nmibc2NVJ0h
 hSfHurZfTIhqFE5gAYNYmE/9efCZBVas0cUZgGi+y8V2uq57DAjymJQECJsCJ6lzbwlQ0y99935u7p
 Rgd4fRXvPAlgrWZDd2keO0/t5MbM5iegD2NAxHMqflhJTKLKUVNDWRxmALC9cswBSVjl+se9i2dn0Y
 ZfwA6JlGmLxWsyc31WJovzYUfiseZKo2Ly82uZVPQJf6M/5QOxVlNIHPE3yEn3a//ekJi2Rcvq7bnK
 V2Nc9jAGz6JOKrn3/sBCYJyWjDbVzMhUvmkSYdW4lgW3sxcUYeugMAJP1llw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This adds support for the DisplayPort Controller found in the SM8650
SoC, but it requires a specific compatible because the registers offsets
has changed since SM8550.

This also updates the SM8650 MDSS bindings to allow a displayport subnode,
and adds the necessary changes in the SM8650 DTSI to declare the DisplayPort
Controller.

Dependencies:
- DT: https://lore.kernel.org/all/20231130-topic-sm8650-upstream-dt-v5-0-b25fb781da52@linaro.org/

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Neil Armstrong (3):
      dt-bindings: display: msm: dp-controller: document SM8650 compatible
      drm/msm/dp: Add DisplayPort controller for SM8650
      arm64: dts: qcom: sm8650: Add DisplayPort device nodes

 .../bindings/display/msm/dp-controller.yaml        |   1 +
 .../bindings/display/msm/qcom,sm8650-mdss.yaml     |   6 ++
 arch/arm64/boot/dts/qcom/sm8650.dtsi               | 120 ++++++++++++++++++++-
 drivers/gpu/drm/msm/dp/dp_display.c                |   6 ++
 4 files changed, 131 insertions(+), 2 deletions(-)
---
base-commit: 9ea914fd2cc702e8be88c0666d4df3e58ffe8131
change-id: 20231207-topic-sm8650-upstream-dp-ab1fc1bf0c76

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>

