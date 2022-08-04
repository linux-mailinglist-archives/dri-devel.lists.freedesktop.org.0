Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 359F9589DB7
	for <lists+dri-devel@lfdr.de>; Thu,  4 Aug 2022 16:40:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF5A296D21;
	Thu,  4 Aug 2022 14:39:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [IPv6:2607:f8b0:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 446099424D
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Aug 2022 14:39:19 +0000 (UTC)
Received: by mail-pg1-x531.google.com with SMTP id bf13so28541pgb.11
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Aug 2022 07:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=eiXJeP7WokDKvW2gy8/Ekzn80/y0tYXfb01K6UEv3lo=;
 b=VsrMMFdPnpBCkYIHS/8OlaF+PlqFIGTirKIbaSa5AE4wKgjslo29008CtGT619gMIT
 Ex0cX8v+7y0sm9KVWMiW6+HrHEGQuoEFMt0I52/VPDRolLiEfS3NXdJv92ojd1a6JTDh
 1vSJ6jB4tQPT2ypbNg9C+h3sKPn0vxwcKCjx4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=eiXJeP7WokDKvW2gy8/Ekzn80/y0tYXfb01K6UEv3lo=;
 b=62M9o6KAQ8a7SnppSfa8jZHOalg3oQ6Dr1thHyaGmNU9e0acsbRvByHgi3BMfRskDw
 JjOS2qP9c++yu7ItFEilG/HlMbFSif1xSYkI8THN2/4uEkMjqnGcBsKF8S1rt10jW1AF
 ZD7pRk0Z83GAgyNIsgH4TVaHCqY0TOKglgRS+zY90WvT0LNMxdlo2G2OOMzZPFYCKjIz
 V/aKnfIO8O9wCzNvh9TQnI0bozNzq6WwLUObll43NINSVzC53/QzOJhDXXlk9SH+OAEQ
 Jo+A1iW+4k1ktccOZL1CKGklUKNHfcyAIMH1L0FP715gJx7eSGeMUpdY6JVHkzZQWose
 4hBA==
X-Gm-Message-State: ACgBeo26YKY3Atju6vXGxDNUOy2dS9shfHMNKusYKzLaoR/w4JZj7o1V
 gBHO3fywbAscEaiBm4GOenGQFw==
X-Google-Smtp-Source: AA6agR7Rnj6JVadOw+wUTPK9LSMDxWtcpLrIyOUlRbk4YSruGHyO1UKQ+7PBkeD8xesD3fFqH0MeFg==
X-Received: by 2002:a05:6a00:1821:b0:52e:3c7c:9297 with SMTP id
 y33-20020a056a00182100b0052e3c7c9297mr2278473pfa.54.1659623958441; 
 Thu, 04 Aug 2022 07:39:18 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:aa71:2553:6f54:5cb1])
 by smtp.gmail.com with ESMTPSA id
 h7-20020a170902680700b0016a111c83cdsm1075071plk.119.2022.08.04.07.39.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Aug 2022 07:39:17 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v4 0/6] drm/msm/dsi regulator improvements
Date: Thu,  4 Aug 2022 07:38:47 -0700
Message-Id: <20220804143854.1544395-1-dianders@chromium.org>
X-Mailer: git-send-email 2.37.1.455.g008518b4e5-goog
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
Cc: Sean Paul <sean@poorly.run>, Vinod Koul <vkoul@kernel.org>,
 Archit Taneja <architt@codeaurora.org>, Loic Poulain <loic.poulain@linaro.org>,
 Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Vladimir Lypak <vladimir.lypak@gmail.com>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rajeev Nandan <quic_rajeevny@quicinc.com>, Mark Brown <broonie@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The main goal of this series is to make a small dent in cleaning up
the way we deal with regulator loads for DSI drivers.

As of v3 of this series, the regulator API improvements needed for the
later patches in the series are merged into mainline. Thus this series
only contains the DSI changes now.

I'd expect:
* The first two patches are bugfixes found while converting the DSI
  driver over. Those could land any time.
* The third patch ("drm/msm/dsi: Don't set a load before disabling a
  regulator") is a patch a sent the other day verbatim, included in
  this series because it's highly related. It could land any
  time.
* The next two patches use the new APIs. Since those APIs are now in
  mainline those could also land any time.
* The last patch is just cleanup I noticed as I was touching the
  function. It's not really related to regulators but it applies atop
  these. In theory it could be rebased to land separately.

Changes in v4:
- Correct the commit that this Fixes.
- Mention error code change in commit message.
- Use more gooder English in the commit description.

Changes in v3:
- ("Improve dsi_phy_driver_probe() probe error handling") new for v3.
- Do all the PHYs too.
- Fix typo in commit message.
- Get rid of error print after devm_regulator_bulk_get_const().
- Just directly call the bulk commands; get rid of the wrapper.
- Update commit message to point at the git hash of the regulator change.

Changes in v2:
- ("Fix number of regulators for SDM660") new for v2.
- ("Fix number of regulators for msm8996_dsi_cfg") new for v2.
- ("Take advantage of devm_regulator_bulk_get_const") new for v2.
- ("Use the new regulator bulk feature to specify the load") new for v2.

Douglas Anderson (6):
  drm/msm/dsi: Fix number of regulators for msm8996_dsi_cfg
  drm/msm/dsi: Fix number of regulators for SDM660
  drm/msm/dsi: Don't set a load before disabling a regulator
  drm/msm/dsi: Use the new regulator bulk feature to specify the load
  drm/msm/dsi: Take advantage of devm_regulator_bulk_get_const()
  drm/msm/dsi: Improve dsi_phy_driver_probe() probe error handling

 drivers/gpu/drm/msm/dsi/dsi.h                 |  13 --
 drivers/gpu/drm/msm/dsi/dsi_cfg.c             | 172 +++++++++---------
 drivers/gpu/drm/msm/dsi/dsi_cfg.h             |   3 +-
 drivers/gpu/drm/msm/dsi/dsi_host.c            |  96 ++--------
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c         | 160 ++++------------
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h         |   5 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c    |  20 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c    |  32 ++--
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_20nm.c    |  14 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c    |  28 +--
 .../gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c   |  12 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c     |  32 ++--
 12 files changed, 197 insertions(+), 390 deletions(-)

-- 
2.37.1.455.g008518b4e5-goog

