Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF77080CFE1
	for <lists+dri-devel@lfdr.de>; Mon, 11 Dec 2023 16:44:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F054E10E470;
	Mon, 11 Dec 2023 15:44:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDC0710E470
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Dec 2023 15:44:48 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-50bdec453c8so5424956e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Dec 2023 07:44:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702309487; x=1702914287; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Hdsbz8sb9Hj8XgnhSW7DmZ4IXqWL9DwyDiWpjOSfMt8=;
 b=xPzmKanihGJwaS+nGrJzn1aK0hSceeMduNrPq68JzXcsQU3h3X3fWt1E10ShQeGPw+
 mkwSwDR/UwZcBxO5AhuzZiesJQUeHOl/1nhqxHTZ/rtWXYL9LMDYwZJqNZO5ZFQwz8Rv
 6D85pNi7l3KTjJE0f5Ny47zCEctClZ0hSIN6o9cGyy8hM7CQ9ieO7fwGs1tjjHtvj+S0
 nbgtjifFwrWpy4ALFU+DPliHzkbn6ZAwD+cB5Oc32Mu6cPhjdROrjpudpoX0zdFydC91
 r/HxN6ohHenQUDVvuT7Esr8K4yocq7Bvu6Hil6y1vrNf3qfIij+RvUrUmEZ0vOnMPMw7
 33hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702309487; x=1702914287;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Hdsbz8sb9Hj8XgnhSW7DmZ4IXqWL9DwyDiWpjOSfMt8=;
 b=MpIDhIg0+yzEXqZWRlsMboPPKZ0jKpFE25HMKxLPu5NV5QZwlVRVJxs9IYBMQ3CWY1
 UHGprcSxv2LnF0W3A7ctrOgvxMkLffMvvl/GUSX1Bx5jFapLwJ5ZnbMjITYuZ1n/zSDK
 0yFDPL9Kj7GGN0ml/yv8JXHmuRHN94PfoEprJch1ZovRQdXhiLYXvv9yaiSGZsh1sSuP
 ldttqAuauqap0fj9Gsub61UgSh1BaW2q/7nh/zsRFH7Y3Irpe3vgXfg93G4L36pEtUB1
 xstJtQoSSi5MuD8bPb+1wNZtFBvwpsm5CFD59SeD0+26lJk1K0FFH8m2OpytfkB96otP
 PBGA==
X-Gm-Message-State: AOJu0Yx9EqFRA/HV/kssXVnvg2aENVS6wyMe/4T+HETA3oXr/oArh26T
 WAt5SIjuOcYNAFRCM8Lsmp1s+g==
X-Google-Smtp-Source: AGHT+IHxCoL+l7KSHEGd7xaqHpmuKdHomR8emcbB6urk0ah7wnrXlsfrXB4VbFDvVisb924E6PSOAg==
X-Received: by 2002:a05:6512:1329:b0:50d:f93b:97a9 with SMTP id
 x41-20020a056512132900b0050df93b97a9mr1464713lfu.1.1702309486926; 
 Mon, 11 Dec 2023 07:44:46 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 c5-20020ac244a5000000b0050aa6e2ae87sm1109646lfm.2.2023.12.11.07.44.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Dec 2023 07:44:46 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v2 0/8] arm64: dts: qcom: sm8150-hdk: enable display output
Date: Mon, 11 Dec 2023 18:44:37 +0300
Message-Id: <20231211154445.3666732-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Enable display output on the SM8150 HDK device. This includes HDMI
output through the onboard DSI-HDMI bridge and DP output on the USB-C
port.

Changes since v1
- Dropped irrelevant stats patch
- Fixed endpoint stye (Konrad)
- Changed SVID from u32 to 16-bits value (Konrad)

Dmitry Baryshkov (8):
  dt-bindings: display: msm: dp: declare compatible string for sm8150
  arm64: dts: qcom: sm8150: make dispcc cast minimal vote on MMCX
  arm64: dts: qcom: sm8150-hdk: enable HDMI output
  arm64: dts: qcom: sm8150-hdk: fix SS USB regulators
  arm64: dts: qcom: sm8150: add DisplayPort controller
  arm64: dts: qcom: sm8150: add USB-C ports to the USB+DP QMP PHY
  arm64: dts: qcom: sm8150: add USB-C ports to the OTG USB host
  arm64: dts: qcom: sm8150-hdk: enable DisplayPort and USB-C altmode

 .../bindings/display/msm/dp-controller.yaml   |   1 +
 arch/arm64/boot/dts/qcom/sm8150-hdk.dts       | 264 +++++++++++++++++-
 arch/arm64/boot/dts/qcom/sm8150.dtsi          | 133 +++++++++
 3 files changed, 388 insertions(+), 10 deletions(-)

-- 
2.39.2

