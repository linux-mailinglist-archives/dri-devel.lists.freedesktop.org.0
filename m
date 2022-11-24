Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F027636ED4
	for <lists+dri-devel@lfdr.de>; Thu, 24 Nov 2022 01:18:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AE6110E665;
	Thu, 24 Nov 2022 00:17:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BAD510E663;
 Thu, 24 Nov 2022 00:17:49 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id d6so181367lfs.10;
 Wed, 23 Nov 2022 16:17:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=DYsSNCXWhpFs7o4x2IkqFxSQUbarPP9Op1/XKXYtDBY=;
 b=mO8gD1Uq4kFyJckqBAStesA4EMzaLVQ9SgJ0grZsFpjIsTvd02FQAgKAxa9v6/u+CF
 BN6XSSaPVq+OoDOnEVtxg0sEoV48DSp/2fgD9+GLjxNSEDWCP+L+tk9XhZHll1ZAPPTf
 8uVGsIL07M26DlMzU1u53ta1rYqKeHlLOvfIMCNfY3N42+nZLmC0nUUHtXOWBjLpuKYK
 YuFzTrHTbKF+8wlto5dYW5HeeifxP+WZdN2C+hERORQOem13X83mU/wJ1EHzIKAsp2Iy
 l2G1hMj/d8M/oWvk/hcC45WS1wFNufg3xnZe9PKolAiwobxkVFM4UDO5VmOU5vnrKRDy
 SIFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DYsSNCXWhpFs7o4x2IkqFxSQUbarPP9Op1/XKXYtDBY=;
 b=D3FDiq7qjuud4AQhd27pms53cgYrtxkK1lJ3G9PzPfa3c56GaBYmaF0yKlUKaGPXcb
 t1fpIKWXFE669h6Q7qEEYBJawvad0n84kBqsBY4FIk/WkIFy/Ebp46CeMphPD7W5c63J
 vPMw0pcSfG8aA5pL9kiKQl2+b/wjU2XWqoX6k5PjMsY0/yhuKcOhp3Q5lgm7otv3B0C1
 K5mQRnHExI+2zQKIIvBWwXcsUncVC8zPYbhFlUjKIo3vP6MeAK90UCvaaXrv+Rnc2WO/
 CVyYdgTqATT43XOM60xloZPUhDksGM8Kzb5WcTs2l7PlhV0I7YVwKfy4eY4Yh80EM2XP
 02uA==
X-Gm-Message-State: ANoB5pnIzpeRX98ALIxowpVzsdoeOiX3KqkVi00HwakWa3jvKaqc1dYp
 Aa4nzWpcWJ2JYQ6PymP2zG0=
X-Google-Smtp-Source: AA0mqf7qCd7dpkyoK6YOZrAt8Il3y3aOCsCuSaTgXZRgDwiIVGU+E0Q3JF+W1YU83f5PZvHiHOSe9Q==
X-Received: by 2002:a05:6512:c09:b0:4ac:2fae:8a9e with SMTP id
 z9-20020a0565120c0900b004ac2fae8a9emr9855039lfu.413.1669249067646; 
 Wed, 23 Nov 2022 16:17:47 -0800 (PST)
Received: from localhost.localdomain (ccy110.neoplus.adsl.tpnet.pl.
 [83.30.148.110]) by smtp.gmail.com with ESMTPSA id
 p8-20020a19f008000000b004ac980a1ba1sm3054388lfc.24.2022.11.23.16.17.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Nov 2022 16:17:47 -0800 (PST)
From: Adam Skladowski <a39.skl@gmail.com>
To: 
Subject: [PATCH v2 0/2] Add SM6115 MDSS/DPU support
Date: Thu, 24 Nov 2022 01:16:30 +0100
Message-Id: <20221124001708.25720-1-a39.skl@gmail.com>
X-Mailer: git-send-email 2.25.1
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
Cc: Konrad Dybcio <konrad.dybcio@somainline.org>,
 Jason Wang <wangborong@cdjrlc.com>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Vinod Polimera <quic_vpolimer@quicinc.com>, phone-devel@vger.kernel.org,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Adam Skladowski <a39.skl@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Stephen Boyd <swboyd@chromium.org>,
 Rob Herring <robh+dt@kernel.org>, ~postmarketos/upstreaming@lists.sr.ht,
 Sean Paul <sean@poorly.run>, Kalyan Thota <quic_kalyant@quicinc.com>,
 Loic Poulain <loic.poulain@linaro.org>, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>, Vinod Koul <vkoul@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch series add support for MDSS and DPU block found on SM6115.
These patches were tested on Xiaomi Redmi 9T smartphone.

Changes since v1
================
1. Adjusted YAMLs per requests.
2. Changed MDP regs to lowercase hex.
3. Rebased series over latest next and SM8450 patches.

Adam Skladowski (2):
  dt-bindings: display/msm: add support for SM6115
  drm/msm/disp/dpu1: add support for display on SM6115

 .../bindings/display/msm/qcom,sm6115-dpu.yaml |  94 +++++++++
 .../display/msm/qcom,sm6115-mdss.yaml         | 182 ++++++++++++++++++
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |  87 +++++++++
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   1 +
 drivers/gpu/drm/msm/msm_mdss.c                |   5 +
 6 files changed, 370 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sm6115-dpu.yaml
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml

-- 
2.25.1

