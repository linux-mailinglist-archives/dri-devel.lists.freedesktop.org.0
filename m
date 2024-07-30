Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75E3F9403DD
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2024 03:38:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4358210E183;
	Tue, 30 Jul 2024 01:38:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="eu9Gx2EL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com
 [209.85.219.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7616810E11D;
 Tue, 30 Jul 2024 01:38:51 +0000 (UTC)
Received: by mail-yb1-f179.google.com with SMTP id
 3f1490d57ef6-e04196b7603so2484563276.0; 
 Mon, 29 Jul 2024 18:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722303530; x=1722908330; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=o5T2H1MxibV59R6E5ponVFEf8aVMT7LzzdBaNyOKYAQ=;
 b=eu9Gx2ELE4IVvY8Ae253AGYZ155BHyOs/ixChgO6ScO3tKqCC/Yfsh8CYBCk9u2jsi
 2iE8LOOq72bpnC4McR0dRo/j8lvqhjBjuz/mKlOFs1ZYCV/jCPXyMdAW6Q4im2VrT08p
 E/vjdYwYMX0gDOOx58vnp1vMrg+nJpq1QyjnEQiVik7mVtXJ3LqpAELswAYF4FjPzO0u
 DDQWecvtz/1wR6aqDqmfd6OptVNtWaIV7zEERjLYKlF5QtyK+y7tnMrrlA/KvuF1qz+j
 7YJELWFc245WATSwEWrOEkAIivkLS4uPPuMGajn9Yk7k/mLcTLnN9uiMBbQR5uYEvkkb
 B2/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722303530; x=1722908330;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=o5T2H1MxibV59R6E5ponVFEf8aVMT7LzzdBaNyOKYAQ=;
 b=uh+v8HyZL82c+RbeK3X4k34GRtPDbL0xXP88po6PEvReG41debz7Yx2Le25C12WIR1
 2WPAPoHRcW7NWB54v269MU7zlYDSK2cMRWkc0pAEMEf/kXJnVMu6uouMfOxTohz+tO2T
 1mXHGIem0M5nDhW26BHt7OD8aFFY7kLVNXNh44Yl241KHj/BFGhrM6iYDcMSLEpKqv5X
 w3CJwqYbsWRbsQH8f9+A+ICEjuCWGaKePXvrm+NXOvgXnwO7SR7XHT7xVg0DsYrenb1X
 1kt+2e/dN6ntfj0K0FPL69tetKNV+FPUClmCUesa2613ksx6/8g54PAqP+ZH8GhUG5K8
 jokw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWjKKWNDRjq4/xOPL7wB5Gc9d3tstZM/NVFPXFIxvkMrx+zsveL3Vup+FWK2s2rSeG+g5xHrvhz0xs=@lists.freedesktop.org,
 AJvYcCWs2pvFXpSniz5RDCxOScfyG8/bqhX9TZbhH2JKLsW+fvglgfAgnoHYMv3orGOUhEBM2Q/m9EkHQPBB@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxoez/lv3GgWSQ+RAWE0s7XnumtDapraAUrUj58TH8juF/USSio
 +q3mpsWGcP/OSah32BBTzAdBgrFhITQFH/LnNCfoAf4ZeGKcIXV5
X-Google-Smtp-Source: AGHT+IE8CCqiBQzc9P2bfVnL3NGKo0Stf9R5bLEeJaR55c3XfqJse2oFJU3IpAa/r9TGBMegBbSatw==
X-Received: by 2002:a05:6902:124e:b0:e0b:97c4:77cb with SMTP id
 3f1490d57ef6-e0b97c4831fmr2285692276.27.1722303530216; 
 Mon, 29 Jul 2024 18:38:50 -0700 (PDT)
Received: from localhost ([2607:fea8:52a3:d200:324c:b818:b179:79b])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-45034f7804dsm2284681cf.16.2024.07.29.18.38.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jul 2024 18:38:49 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
Cc: Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH 0/4] drm/msm/adreno: Add A615 GPU for SDM670 and Pixel 3a
Date: Mon, 29 Jul 2024 21:38:45 -0400
Message-ID: <20240730013844.41951-6-mailingradian@gmail.com>
X-Mailer: git-send-email 2.45.2
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

This adds support for the speed-binned A615 GPU on SDM670.

Richard Acayan (4):
  dt-bindings: display/msm/gmu: Add SDM670 compatible
  drm/msm/adreno: add a615 support
  arm64: dts: qcom: sdm670: add gpu
  arm64: dts: qcom: sdm670-google-common: enable gpu

 .../devicetree/bindings/display/msm/gmu.yaml  |   1 +
 .../boot/dts/qcom/sdm670-google-sargo.dts     |  13 ++
 arch/arm64/boot/dts/qcom/sdm670.dtsi          | 168 ++++++++++++++++++
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c     |  27 +++
 4 files changed, 209 insertions(+)

-- 
2.45.2

