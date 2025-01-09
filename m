Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E7FA07687
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 14:08:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2523B10E468;
	Thu,  9 Jan 2025 13:08:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="JWZuvrcF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC3DC10E468
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2025 13:08:45 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-434f398a171so926265e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Jan 2025 05:08:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736428124; x=1737032924; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=fuLlOiXUXKnRhH1On0PX1rvgW+QHGgHGX18PUfH8Sfk=;
 b=JWZuvrcFRuUy97VipHMoGNSzVwq8OME3FFrlpCXXXMxsh+iX5H7RgzehFSigGKHzGa
 fUn47Hy90NsU9CzEZwwcoK87CSGRfzva5OTLFUEmf0szjRw543jCzz4qY30XpVUZJu/T
 I626RlJILQfkUtR8Lwp6TOuodjpS8Z6nvJH8Mcv89u9gRSqI+njY0a8OiVouX017leGZ
 MnOaUuXWxLI5HNiu7iAWdz7Qz94HUzFpp48+dO8I3GVUID9c213FDKeu8uDpUWKk9c/f
 zNewQWnp9w3XcYVyOwK7brUlh2RYvqFbSwJ+b1/M0uK6PwKO4EWgE7s/JDGK5aE1b0ic
 cWaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736428124; x=1737032924;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fuLlOiXUXKnRhH1On0PX1rvgW+QHGgHGX18PUfH8Sfk=;
 b=wI0Ryp5zi4VwoGnadqQ4FgcZya/kp+veTfCsu/t4sIivSJbF3dAccRyxTGrizU2v7W
 iOrtdgcI9mswRSK3qtqL651WA9LFyNvEF5TzGmI/aYx4cbHD+ya4hnto9ylb/7RwDxo+
 rUxO/kaD/qqBTOkBXK1hmuEhZds3rHSGSeNXd7g2ScnI52/Qxc3Qmelh0In14l7YsC+Z
 Bqx1orzImKmYc4xrzC0cCGrEQgx37WXpwFl1+BdETTnFht1is9iGTPODEADcAxLSaxvU
 ViHDL9NPdPpxfE4MAoVb/yaY3nppVCDQrDhmL5yVJ110z8SSdIJWNavb4pkVydFeu/rV
 8Rfg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU06/rearjSsQGmOxyaJTQmm0Lhp/ZAoMceRxEZKR/1Co8PL0aj3ux5dzOOS5q4W2rN9NG5AHbDktc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxN230DmobvXdccAEBcIkIts6egglWvENewsAYbuYuMc7kpnkP8
 vhHyIvdFicDkxTeG46vlSJBuXtpIi++b96u+65vE7SSBbh5jw/TreE4U9GJ/UrI=
X-Gm-Gg: ASbGncsumMUm2EaFy3cIY2aYBhk0kDb24tn/araQcWTv8U6wATp7rvmufelmwSHseMc
 monMexX3wfLCHlBkacvrrS+RuCNTjzrJBaB9gkulhvxodaV7x01r9vZJo4RRjD4eS/eZMO/BShZ
 Z/qz+7fxM+n+LIfMjR3r4AlglkSwOLGqM79dJ4nKcBGUGSWzs64ea5wqs5GHBwQxP63aXsfIz7U
 WWewkojiryrTsXtglTNaxN0Pk+JsHZWDkBJCgXMccVqjmVSosraSul2Vp6mUBXLAxPNuBsP
X-Google-Smtp-Source: AGHT+IFHSrO/z2IrsdPv1zlsY4eaxotZ8IucbvWgCMwW9PfHOa6zyCWKyMdvewg6jasNjfGQd9IjHQ==
X-Received: by 2002:a05:600c:4e52:b0:434:a339:ec67 with SMTP id
 5b1f17b1804b1-436eba35780mr7441695e9.3.1736428124428; 
 Thu, 09 Jan 2025 05:08:44 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.165])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a8e4b8124sm1789167f8f.81.2025.01.09.05.08.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jan 2025 05:08:43 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [RFC PATCH 00/11] drm/msm: Add support for SM8750
Date: Thu, 09 Jan 2025 14:08:27 +0100
Message-Id: <20250109-b4-sm8750-display-v1-0-b3f15faf4c97@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEvKf2cC/x3MTQ5AMBBA4avIrE3S0iquIhbFYBJ/6SRCxN01l
 t/ivQeEApNAnTwQ6GThfYvQaQL97LeJkIdoyFRmlVYVdgZlLZ1VOLAci7+xIG9z56zxo4bYHYF
 Gvv5n077vB5Y+EIJjAAAA
X-Change-ID: 20250109-b4-sm8750-display-6ea537754af1
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Srini Kandagatla <srinivas.kandagatla@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2797;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=V/rvpjKAc8KwegpBEpR0XfRNaqLlpjQvs3AFkc0+3mc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnf8pNMxOxDm6xY/QOvdYu5+akyHTu8VgNfBwAe
 6VwNxI77hiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ3/KTQAKCRDBN2bmhouD
 17uHEACGj8f29cWYZih4RbFvhERvA/L+duReJZfq9d9CgKJ7xas6I5SlG3ngq/xKmzoZaWRG/Oh
 ZW9Ao9yofp80d3R25rnB0Jz4XwNRnHklzWylNjvODP7eQ5MRLpAt6BS8S31ePLTYle+NmBwtGXR
 ycK8CgHKhWqz8WXSE303J+8L8LVbzha8kIAi3sj4zC6PiPK1kY5wdaFqWpRveLvujsmL8MWXSUu
 CiqohhGM1lmH+YbAiYh18t5bWc9bhRaUp0xzFueO48cJ1RjEJV9vd3tUVkVyG62LQIVsgF6lUAI
 ft0HqSi76fSvEusD8WciL8L7sijeBOn7xYndPVXNXrVVSk5k9Ng6V191HCGGrm6YplGd/v8Di1E
 rDY0bkVSvvaCR2bt+P8gXXkvCZtbXGV68dt2J3XHDzUNsnQVrXYlMYpf3WUZwRcXgjIGn5oNaNj
 q8WdA3+BMXEYel7b27RvkafsQ0DOB8jOgKy2PZkZWfqgb6+oe6l4+Sr38iAxn5KbFgXomNmwinS
 Jy5g3bE5XhA4b9b808dzhzXQ2WRHuC9SvBuNwjd8o1M4w+Y2QhNNAVRuEHGCty5fBIGVyBtnWot
 v1go/IG7wfraVukYcisvNcE0EIhsuVkz9vNJPh560JzAppkbdcYSlgkiwlfb8+RisYzDjP2tAMI
 wFeIluQPFV4IrLA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
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

Hi,

RFC or WIP: support is not yet finished because of two important
differences not yet implemented.
1. DPU_CTL_NO_LAYER_EXT: see last commit
2. SDE_MIXER_X_SRC_SEL: LM crossbar: also hardware changes requiring
   each pipe rectangle to be programmed separately in X_SRC_SEL blend
   stage. Downstream patch is bigger than above (1).

Sending this early, to gather comments or maybe find volunteers for
implementing above missing pieces. :)

The hardware catalog and DSI parts should be finished.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (11):
      dt-bindings: display/msm: dsi-controller-main: Combine if:then: entries
      dt-bindings: display/msm: dsi-controller-main: Add missing minItems
      dt-bindings: display/msm: dsi-phy-7nm: Add SM8750
      dt-bindings: display/msm: dsi-controller-main: Add SM8750
      dt-bindings: display/msm: dp-controller: Add SM8750
      dt-bindings: display/msm: qcom,sm8650-dpu: Add SM8750
      dt-bindings: display/msm: qcom,sm8750-mdss: Add SM8750
      drm/msm/dsi: Add support for SM8750
      drm/msm/dpu: Add support for SM8750
      drm/msm/mdss: Add support for SM8750
      [RFC / WIP] drm/msm/dpu: WIP: CTL_LAYER_EXT is gone

 .../bindings/display/msm/dp-controller.yaml        |   4 +
 .../bindings/display/msm/dsi-controller-main.yaml  | 124 +++--
 .../bindings/display/msm/dsi-phy-7nm.yaml          |   1 +
 .../bindings/display/msm/qcom,sm8650-dpu.yaml      |   1 +
 .../bindings/display/msm/qcom,sm8750-mdss.yaml     | 460 ++++++++++++++++++
 .../drm/msm/disp/dpu1/catalog/dpu_12_0_sm8750.h    | 522 +++++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |  38 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   4 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c         |  16 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h        |   6 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
 drivers/gpu/drm/msm/dsi/dsi.h                      |   2 +
 drivers/gpu/drm/msm/dsi/dsi_cfg.c                  |  25 +
 drivers/gpu/drm/msm/dsi/dsi_cfg.h                  |   1 +
 drivers/gpu/drm/msm/dsi/dsi_host.c                 |  80 ++++
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c              |   2 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h              |   1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c          |  78 ++-
 drivers/gpu/drm/msm/msm_mdss.c                     |  33 ++
 drivers/gpu/drm/msm/msm_mdss.h                     |   1 +
 .../gpu/drm/msm/registers/display/dsi_phy_7nm.xml  |  14 +
 21 files changed, 1335 insertions(+), 79 deletions(-)
---
base-commit: c38a35d266317199e72729fbbca5b2337c20a6d9
change-id: 20250109-b4-sm8750-display-6ea537754af1

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

