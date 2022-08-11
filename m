Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E047358F68E
	for <lists+dri-devel@lfdr.de>; Thu, 11 Aug 2022 05:59:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B9B810E05D;
	Thu, 11 Aug 2022 03:58:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 586B218BC8B
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Aug 2022 03:58:46 +0000 (UTC)
Received: by mail-oi1-x233.google.com with SMTP id q184so20044874oif.1
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Aug 2022 20:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=w+7/p7loDU12A5408vaGmzS8MHgBWt2avSxfYLUZLGU=;
 b=Kob7L1bb7pZlKVh3Nr85SgI9ecv91ntN2SnDhWUxOVzzohP8gC1F1LzRgbUPa6dgQ/
 EPcOqUy9uiqptUG/OESjxUBw7VXMA0/+KvUagsobHQhLJdSChDwV3wptX6qfmY8bpS9N
 Ks6SPqZJroxubJZxXXNq08NomKjllFX7h55aQmGuVWMEujN4yI4TEImYbKSv2cziOgDB
 c0ZkIURne7GBOoutsu/59kICCBe70lO2JhgfcA+aEO7VVajBSyyGhllUb7dU9lUGTpnR
 OUdLPB259K+CClZdfGO/Psmsg7Uu7mb4ca6nc6SH34aSyQqieK3/u1bEA+5fXG+rFf1H
 qQ8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=w+7/p7loDU12A5408vaGmzS8MHgBWt2avSxfYLUZLGU=;
 b=4mySrMp2pzQdasSurRLMm8melNrF7lBeJ83W/Io3pqs4M590tv+zZ0xPf3NCvvkQeu
 FJ0vz1SPPgZDf4etfnGDJaJRtIEMh2JdSUum4kiLgYznHoQZ2nRAVqifxI3gnV0HxIqD
 PpMMTSyUlhcYRe+F/q4lbhGTENm4ZkwXDvl9Xe+7nigNrI816B64QM0HjktpdeYfLnk/
 PzfVBbbsykT4mBA5fSWdhXrXW0ax6FO/YVAHmdCD53dWhDy/1z4YtUTRu1SnxnNySLBV
 mPtqAzxPp73Eqnh2QvY0As996H4f0XrzLwKf4IbmriAujyvWeTP3F8p5eh01I/RdnUlO
 oISg==
X-Gm-Message-State: ACgBeo3HgvSqHB80kf/75MjGR81bQ+3xisUlO11LqgGQ4y/fYgCBj2Dc
 PJ8vQFMXPJ7X6SwTbWyqoxiF3A==
X-Google-Smtp-Source: AA6agR6Vs2Vcu8hixDaGfupTUFgHcyNNcs3nvOW+jJ8bqmrmjTvdaVNBZs4cxnx9uCye0SZs4NAEtg==
X-Received: by 2002:a05:6808:20a9:b0:343:c4e:24c8 with SMTP id
 s41-20020a05680820a900b003430c4e24c8mr2800681oiw.73.1660190325376; 
 Wed, 10 Aug 2022 20:58:45 -0700 (PDT)
Received: from ripper.. (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186]) by smtp.gmail.com with ESMTPSA id
 w22-20020a056808141600b00338869042fdsm891443oiv.32.2022.08.10.20.58.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Aug 2022 20:58:44 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH 0/3] drm/msm/dpu: Add support for SC8280XP
Date: Wed, 10 Aug 2022 21:01:18 -0700
Message-Id: <20220811040121.3775613-1-bjorn.andersson@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This adds support the MDSS and DPU found in the SC8280XP platform.

Bjorn Andersson (2):
  dt-bindings: display/msm: Add binding for SC8280XP MDSS
  drm/msm/dpu: Introduce SC8280XP

Dmitry Baryshkov (1):
  drm/msm/dpu: add support for MDP_TOP blackhole

 .../bindings/display/msm/dpu-sc8280xp.yaml    | 284 ++++++++++++++++++
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 211 +++++++++++++
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   2 +
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c |  18 ++
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h |   3 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h   |   2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  12 +-
 drivers/gpu/drm/msm/msm_drv.h                 |   1 +
 drivers/gpu/drm/msm/msm_mdss.c                |   2 +
 9 files changed, 533 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/msm/dpu-sc8280xp.yaml

-- 
2.35.1

