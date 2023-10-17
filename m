Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0D767CB84B
	for <lists+dri-devel@lfdr.de>; Tue, 17 Oct 2023 04:18:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC02E10E057;
	Tue, 17 Oct 2023 02:18:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com
 [IPv6:2607:f8b0:4864:20::f2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A85010E057;
 Tue, 17 Oct 2023 02:18:46 +0000 (UTC)
Received: by mail-qv1-xf2e.google.com with SMTP id
 6a1803df08f44-66afd39c8edso33806426d6.2; 
 Mon, 16 Oct 2023 19:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697509125; x=1698113925; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Au8EOE9+FRX6HvHTMGueg6NHALIY7M3L0ggSoJVnPyk=;
 b=QWu9QdTzLAJNeaBdOZqFzdS5fwzJGI3lkZk+XjrKxEqMyeX4mfHlZDkALFqhxkIREJ
 8SCa537etpuquuMRKJ8QXZ3p0OnQPwDGDxJLeN+MRSg/xQ3MCCyJyOzImFBSiHkxoI7Q
 5Z6uuNHVWp+y1ILdefCNo4Xtsh57iH/OTrb/ZrhjEHt+NlHDMLd5TUqvsgVWQ6ZHuI+C
 TlNMrt6Saf54OUIsPx7nSHBcTSdL/xqhSHoAm7lH4dB45Q4mGvLuwI8rrq99DU4iVWd8
 fjWYFz9BMgPPMTSxshzufQiUjBGuZb4mDTf3f9S05rgBusZtwUWx4HiTlZakb+5P0uED
 dpNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697509125; x=1698113925;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Au8EOE9+FRX6HvHTMGueg6NHALIY7M3L0ggSoJVnPyk=;
 b=l6UyGyrYysI9XrP7VUEl00FpcZUgnrjPhebuhs2ZVhFZnsGVmOqZZZVV6QXcZaJQC6
 IDqw2q50Wnhm0NYsSpvJJDY062ouMx7twHro1wYvJytjBT4mIdOGe2jq7NbLKaNwj2mI
 KIJVTSXTgeOUSlf/ayU2f9F5Sagmgdf59KEY8bHcGdnkN5MJcBxQcgLjQzyh89Kf8Slt
 cLfMOIWY0QXLSsnnA8sMY0OWm7cTPWpXejEVhNSMPEeoD8hC8Cs/U8YNBNV3TU8Y7LA/
 edXAFkHphwtItBGQhmpDRlWdHeI+GuVphiF3tJuQ0HYGt93QrclwrdGvX6uMBJIEhP3+
 5NvA==
X-Gm-Message-State: AOJu0YxWZcQ00Bd3rV5wT/d1+dUe5gUt7dCyBoEL0QYn5TZmR3BQOg/w
 C+t5B6W53aiqU/IscySdzCg=
X-Google-Smtp-Source: AGHT+IFtEsvhkbeh2ULNCZoN5G/wwOiM7w7Uq65N4uCwO3yxCz4P6/Cu3d6wi5VaXVRjxt/MLombLw==
X-Received: by 2002:a05:6214:2467:b0:66d:1215:4470 with SMTP id
 im7-20020a056214246700b0066d12154470mr1309232qvb.44.1697509125562; 
 Mon, 16 Oct 2023 19:18:45 -0700 (PDT)
Received: from localhost ([2607:fea8:529e:7800::1d3d])
 by smtp.gmail.com with ESMTPSA id
 d24-20020a05620a137800b00770f2a690a8sm255814qkl.53.2023.10.16.19.18.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Oct 2023 19:18:44 -0700 (PDT)
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
Subject: [PATCH v4 0/6] SDM670 display subsystem support
Date: Mon, 16 Oct 2023 22:18:07 -0400
Message-ID: <20231017021805.1083350-9-mailingradian@gmail.com>
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

Changes since v3 (20231009233337.485054-8-mailingradian@gmail.com):
 - move status properties down (review tag retained) (6/6)
 - accumulate review tag (3/6)

Changes since v2 (20231003012119.857198-9-mailingradian@gmail.com):
 - rebase on series and reference generic sblk definitions (5/6)
 - add interconnects properties in example (3/6)
 - remove phy-names properties from dtsi (6/6)
 - accumulate review tags (4/6, 6/6)

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

This series depends on https://patchwork.freedesktop.org/series/119804/.

Richard Acayan (6):
  dt-bindings: display/msm: dsi-controller-main: add SDM670 compatible
  dt-bindings: display/msm: sdm845-dpu: Describe SDM670
  dt-bindings: display: msm: Add SDM670 MDSS
  drm/msm: mdss: add support for SDM670
  drm/msm/dpu: Add hw revision 4.1 (SDM670)
  arm64: dts: qcom: sdm670: add display subsystem

 .../display/msm/dsi-controller-main.yaml      |   1 +
 .../display/msm/qcom,sdm670-mdss.yaml         | 292 ++++++++++++++++++
 .../bindings/display/msm/qcom,sdm845-dpu.yaml |   4 +-
 arch/arm64/boot/dts/qcom/sdm670.dtsi          | 292 ++++++++++++++++++
 .../msm/disp/dpu1/catalog/dpu_4_1_sdm670.h    | 104 +++++++
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |   1 +
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   1 +
 drivers/gpu/drm/msm/msm_mdss.c                |   7 +
 9 files changed, 702 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sdm670-mdss.yaml
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h

-- 
2.42.0

