Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 449177AE263
	for <lists+dri-devel@lfdr.de>; Tue, 26 Sep 2023 01:37:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CD3D10E337;
	Mon, 25 Sep 2023 23:37:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com
 [IPv6:2607:f8b0:4864:20::112d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E30010E260;
 Mon, 25 Sep 2023 23:37:07 +0000 (UTC)
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-59c215f2f4aso96829007b3.1; 
 Mon, 25 Sep 2023 16:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695685026; x=1696289826; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=XusWQaiVLnnypr9tEOMeBvsSPZlhaNXNSC6Pr95vupU=;
 b=FH4N0abWvw5zXVgFwKBBMhZAN0TT+OVNIp+eyjDh7YRlCPPDHqZmWMpAVtsQuE8Zk/
 JotAR2WlZfohU6ZSy8jAaNx+Cod+yWephpNlMuTDGHcvz/8rIZeDq1WrTdVi4ycdxdA+
 j3z4C5axt457Vg5NN1y43dpHn9gH4VtcJRZzXcrgPNRndbR1vHgMpn3NAPTcE/XUFbBz
 uvOrXD7UWU9wvC/K9cuil2BU5f4Wjzm2Sr+tLVCijF2JxhsK1GicJ/HcsCRlmsGEavnI
 fujDfnfkbaQg32Mfkk+zHDp9lOdRaz7C9EA29o7OnWLCgsHL1Swmft+iBFpaJ/RCOLFs
 z7Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695685026; x=1696289826;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XusWQaiVLnnypr9tEOMeBvsSPZlhaNXNSC6Pr95vupU=;
 b=q2ZPl9q3H7clgtyNJ2FChoKHWMrxpnxwp19l3qa+3338NjlDlVEaW21pGMIzZxiIqx
 YeaLJmVthNFFwk9EnAkQwS0Mo1p1T7VXhLm3aUW7SbLExa3RuqYAPJe7kmfM5bOz/d7C
 q09W1AnkjjhX9R5h6Pv05Tj7UyZ1ES6FlT4SnEaFTqrlctwRPePGNBYJe0RkOep6f8Bl
 Sqo6vf1ArpcRab524Dgdz8CRw5yQ00MjavuyyG2a9n53aPdUW4EBd3GANQ5f38x01ALa
 U6xYDYV0TxP803btel9o+CmZgwqebnlNjP6BJSPpFg6P3WIUFutwXFkh8HBAo7t0GUPp
 JmJw==
X-Gm-Message-State: AOJu0YxTjcyqcw8EHVPQFG9rIR4i0qQ8AhnQPYLJpu5JciBpLNxuyauc
 iJgZwGe+/BqXM4Aw1L8j6Vg=
X-Google-Smtp-Source: AGHT+IGWYEcfZBHT8tIWl1aa1+4+LVlzd5+IjI30XfF1jhF0OnlyzN7cwbBtYzp2chrfmVlAzzzZ5g==
X-Received: by 2002:a0d:c381:0:b0:592:9035:834f with SMTP id
 f123-20020a0dc381000000b005929035834fmr8800286ywd.34.1695685026161; 
 Mon, 25 Sep 2023 16:37:06 -0700 (PDT)
Received: from localhost ([2607:fea8:529e:7800::efbe])
 by smtp.gmail.com with ESMTPSA id
 e11-20020a81690b000000b0059b20231f1dsm2699161ywc.121.2023.09.25.16.37.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Sep 2023 16:37:05 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Vinod Polimera <quic_vpolimer@quicinc.com>,
 Ryan McCann <quic_rmccann@quicinc.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Liu Shixin <liushixin2@huawei.com>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: [PATCH 0/6] SDM670 display subsystem support
Date: Mon, 25 Sep 2023 19:26:27 -0400
Message-ID: <20230925232625.846666-9-mailingradian@gmail.com>
X-Mailer: git-send-email 2.42.0
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
Cc: Richard Acayan <mailingradian@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series adds support for the display subsystem on the Snapdragon
670. It is based on an earlier patch a few versions back, which had
missing device tree bindings and device tree changes.

There is a separate IOMMU patch which adds the MDSS compatible to a
workaround.

Richard Acayan (6):
  dt-bindings: display/msm: dsi-controller-main: add SDM670 compatible
  dt-bindings: display/msm: sdm845-dpu: Describe SDM670
  dt-bindings: display: msm: Add SDM670 MDSS
  drm/msm: mdss: add support for SDM670
  drm/msm/dpu: Add hw revision 4.1 (SDM670)
  arm64: dts: qcom: sdm670: add display subsystem

 .../display/msm/dsi-controller-main.yaml      |   1 +
 .../display/msm/qcom,sdm670-mdss.yaml         | 280 +++++++++++++++++
 .../bindings/display/msm/qcom,sdm845-dpu.yaml |   4 +-
 arch/arm64/boot/dts/qcom/sdm670.dtsi          | 294 ++++++++++++++++++
 .../msm/disp/dpu1/catalog/dpu_4_1_sdm670.h    | 105 +++++++
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |   6 +
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   1 +
 drivers/gpu/drm/msm/msm_mdss.c                |   7 +
 9 files changed, 698 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sdm670-mdss.yaml
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h

-- 
2.42.0

