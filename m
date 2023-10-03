Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C5EB7B5E90
	for <lists+dri-devel@lfdr.de>; Tue,  3 Oct 2023 03:21:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11AAA10E195;
	Tue,  3 Oct 2023 01:21:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com
 [IPv6:2607:f8b0:4864:20::f2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39ACC10E195;
 Tue,  3 Oct 2023 01:21:40 +0000 (UTC)
Received: by mail-qv1-xf2f.google.com with SMTP id
 6a1803df08f44-65b051a28b3so2600756d6.2; 
 Mon, 02 Oct 2023 18:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696296099; x=1696900899; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0vhZi82yU9f+9I66zAblRTPICxvjbQ5OMGMGyPzNQBM=;
 b=XSJH6FDHvfDGlCwVsdlzWuDbSUluH1CKr+4R7/VZAPKufLiAhCjddArHz8WNiFTpwX
 yYdFUMzcitvuyZjZe3AaUCdlBJNGNQA5cuSpLKZv59tn6hKzsWJDzRBtKwdlmGZyQ3N3
 g4OYq+nEhsg9QTBOLN9vbd4tsWiCidbLlFgPVoFq8uAPEuIWsswzy1TNL/BDN8+3RzXQ
 OILIDYueBC163S3ch6Y7mND1w1RPrXeW6yF//hNruvfRrYqDdYxYRIv3wOw2waFcdcJR
 +vm+Df4aY2EU4jrgo2V6u5eTyHfRmZveV4Sfz3SuoW7h22N6IMSWbXJMu4zX5C8GZHUv
 YKaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696296099; x=1696900899;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0vhZi82yU9f+9I66zAblRTPICxvjbQ5OMGMGyPzNQBM=;
 b=tkK5+fiCVt2d+cytV3UFq79l3FHp2QX4xX+825V4vmQKBbVy8sJBJAktqto4D8Fou4
 9EPYEtFb+47d0APaqG7ubBRF+jEXrb1gFHM5xlId2uwhOtx8lLBS4d6Sb6n1R+gdArpd
 x09wPIvxx99Ow3z+LRbvhpgjVbiD95X1E10ZPpAm2qrqj4H5yN6kRfZhQ4Lw5bURCxAq
 vtuqn4CARjRsO4no2seZyZrOm94JQ4uQ5eQhks9BqnAkVM58TbUcYMDbOBhcCwP/u62u
 ZMkkqqury4y7ykyHQLZbBTMSr8NwEw8VQ29oc1uaIzNkCxQAaph7XjHKGbiqgNj0yKmz
 Dr2Q==
X-Gm-Message-State: AOJu0YxEzldLLasuFK83/7+8wvt6HeKGtRx+kO4cnTlw5EC3zWNstM5p
 WPVki1IpcyB8pRkXJbXLeR0=
X-Google-Smtp-Source: AGHT+IGkrxlOmVZRgiW1JdvxZW/v1DIl0xUWG2ue6i5gqYguwaGs+Oc5zoGwPn1UiqL60jwhHSP3tw==
X-Received: by 2002:a0c:e30b:0:b0:65b:229e:cb8a with SMTP id
 s11-20020a0ce30b000000b0065b229ecb8amr12256754qvl.44.1696296098801; 
 Mon, 02 Oct 2023 18:21:38 -0700 (PDT)
Received: from localhost ([2607:fea8:529e:7800::efbe])
 by smtp.gmail.com with ESMTPSA id
 j15-20020a0ce00f000000b0063d038df3f3sm56569qvk.52.2023.10.02.18.21.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Oct 2023 18:21:38 -0700 (PDT)
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
Subject: [PATCH v2 0/6] SDM670 display subsystem support
Date: Mon,  2 Oct 2023 21:21:21 -0400
Message-ID: <20231003012119.857198-9-mailingradian@gmail.com>
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

Changes since v1 (20230925232625.846666-9-mailingradian@gmail.com):
 - prefix dsi1 labels with `mdss_` in example dts (3/6)
 - make all parts of catalog entry const (5/6)
 - add spaces before closing brackets on same line (5/6)
 - join opening and closing braces on the same line in dsc array (5/6)

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
 .../display/msm/qcom,sdm670-mdss.yaml         | 287 +++++++++++++++++
 .../bindings/display/msm/qcom,sdm845-dpu.yaml |   4 +-
 arch/arm64/boot/dts/qcom/sdm670.dtsi          | 294 ++++++++++++++++++
 .../msm/disp/dpu1/catalog/dpu_4_1_sdm670.h    | 104 +++++++
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |   6 +
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   1 +
 drivers/gpu/drm/msm/msm_mdss.c                |   7 +
 9 files changed, 704 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sdm670-mdss.yaml
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h

-- 
2.42.0

