Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 783D3617194
	for <lists+dri-devel@lfdr.de>; Thu,  3 Nov 2022 00:13:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 671BA10E548;
	Wed,  2 Nov 2022 23:13:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD5A110E53A
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Nov 2022 23:13:12 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id a15so209830ljb.7
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Nov 2022 16:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uSZbtUrumgTcxUg6hHxu4JdqNGMhW+St+6BoWj9AtF4=;
 b=QWt5bE8GoKSTTe/12Fs3pjrZDO66jgMoUnihmGU+vi3vEz3SP9OP8UBz98g69t1Ft2
 xkPX9UVN3qgTPlf/KV+s/wqndJwJTa2V0ZSLFU/kGijn9finrOppSL3lM4MgEGCjPIrt
 6JesASoR9g8ECQHnweaQvHtZTS8HVDAlDh7ZIi5zT9tXqoVEWWB0qajBTypNMTTGm398
 yVLAmrfYy3kZ9+JSms+ygi95vGu/99VG4Zr0SV/9GncofTTkKabI7nqcX7OTs3yYr5HJ
 q2xYs9WRD0hjVaWgUMtOCNzC9n75MlFhFcLUsyCNATAf6j82hbwpFafcp32xpy+6Lin7
 QE5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uSZbtUrumgTcxUg6hHxu4JdqNGMhW+St+6BoWj9AtF4=;
 b=hc8YnX+MkNEDpAvOxmFGtgT1C5+mn8WADXeK25an+0Nt3hkfwBmV0CsGktxpXA2F1B
 KLHyBnntupXDqCLB1dSxiksevsahPz0oJw5yDONWJk8pzEQ7XTS5ZRBzi47ogtEsaBGv
 k4AiY3nkVItrwY3tUSqgJGxuJjTw898IecaaMxK6jTjXyL7zB5BE6vbj9rwtHxkeTdF0
 uV1dXxzA4oyWnXI/jUAHZfsBWzOWwl7+fgSD+MQOeVeE8ibBmHpPt3Fu1BUWQeZvuSRZ
 XilTorIe+84aGuhz2aLhPxqHs3sIca8pCYCjZr47bp+6/ybX0gXaSEIGTcLAxrnG8ZD3
 1hPg==
X-Gm-Message-State: ACrzQf3alSj4BG8X+C/sjVNKQnqJjH3InXdxB2k8sUcfJSSM2g6jK+JB
 l3NB5GvW+FeTVgJX+eWq03jK0g==
X-Google-Smtp-Source: AMsMyM51xOPV6VD0ssIJh3+v+lQCDuf6J7gYV288GMSp2BNb3pLPFS1Fkom80EzbVJYExX6qGy0eow==
X-Received: by 2002:a2e:a163:0:b0:277:159b:4da2 with SMTP id
 u3-20020a2ea163000000b00277159b4da2mr10169593ljl.502.1667430791072; 
 Wed, 02 Nov 2022 16:13:11 -0700 (PDT)
Received: from localhost.localdomain ([195.165.23.90])
 by smtp.gmail.com with ESMTPSA id
 m6-20020a056512114600b004b0a1e77cb6sm1636134lfg.139.2022.11.02.16.13.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 16:13:10 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v2 0/8] drm/msm: add support for SM8450
Date: Thu,  3 Nov 2022 02:13:01 +0300
Message-Id: <20221102231309.583587-1-dmitry.baryshkov@linaro.org>
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

This adds support for the MDSS/DPU/DSI on the Qualcomm SM8450 platform.

Change since v1:
- Fixed the regdma pointer in sm8450_dpu_cfg
- Rebased onto pending msm-next-lumag
- Added DT bindings for corresponding devices

Dmitry Baryshkov (8):
  dt-bindings: display/msm/dsi-controller-main: allow defining opp-table
  dt-bindings: display/msm: add sm8350 and sm8450 DSI PHYs
  dt-bindings: display/msm: add support for the display on SM8450
  drm/msm/dsi: add support for DSI-PHY on SM8350 and SM8450
  drm/msm/dsi: add support for DSI 2.6.0
  drm/msm/dpu: add support for MDP_TOP blackhole
  drm/msm/dpu: add support for SM8450
  drm/msm: mdss add support for SM8450

 .../display/msm/dsi-controller-main.yaml      |   3 +
 .../bindings/display/msm/dsi-phy-7nm.yaml     |   2 +
 .../bindings/display/msm/qcom,sm8450-dpu.yaml | 132 +++++++
 .../display/msm/qcom,sm8450-mdss.yaml         | 349 ++++++++++++++++++
 drivers/gpu/drm/msm/Kconfig                   |   6 +-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 224 +++++++++++
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h   |   3 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  12 +-
 drivers/gpu/drm/msm/dsi/dsi_cfg.c             |   2 +
 drivers/gpu/drm/msm/dsi/dsi_cfg.h             |   1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c         |   4 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h         |   2 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c     | 132 ++++++-
 drivers/gpu/drm/msm/msm_mdss.c                |   5 +
 15 files changed, 864 insertions(+), 15 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sm8450-dpu.yaml
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml

-- 
2.35.1

