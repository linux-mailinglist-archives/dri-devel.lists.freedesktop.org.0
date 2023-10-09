Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DCDD7BEA13
	for <lists+dri-devel@lfdr.de>; Mon,  9 Oct 2023 20:50:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DB0F10E2C2;
	Mon,  9 Oct 2023 18:50:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B99D10E2C7
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Oct 2023 18:50:51 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-5068692b0d9so3888198e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Oct 2023 11:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696877449; x=1697482249; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=slmO4xUHNmPhnYDTbWl3Wo5De7S89LXSHwl13Zbo/KM=;
 b=dfYc6Eff5EUJwbT9WyyrREENYv/eloDwgJOrYUCc38P8Copv7V2CiK610CAJduwHSv
 nnU/JVPr5Bj0nWvZdLlSOWLuFl1Dv+IHnQFKjofOEfgiYiJ6Kt1zqY1iS7yaQsXjkcr3
 DWn8otlvtmCRQ8sjAZ1D5XZbtb27N7fg5kNlcBQgMDqQZv55FpKJbbZTjXiUNo4naNM7
 WKVC3Bo0RqZQnA/nJ58mGCmqItb3+UCT/suTor5Gcsx3X7UckSDrshFUiTq8IfCgRGid
 84kIDEC4zbu+7KGn6NhcdzQNwM8hZtrFfSbJbcFZ17n60znzYU0ip9tr2g1Em4/yrZbz
 AGbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696877449; x=1697482249;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=slmO4xUHNmPhnYDTbWl3Wo5De7S89LXSHwl13Zbo/KM=;
 b=mF+hdiJR+Yyl4MSFarVktDFFjDY0KQJItAZdgN7p4b1Wo0QdxS/Hrr/3ihu1Sj/t5r
 zlxavFwenOGGUrdpxyP2qXQbK4KxG+DkcvryuH8QPVkVQOs3VR0B8eGdsddgNxZ7dTyT
 WSkasR5GlVG3l7sTz8GO1gLXtPepQPCU6wRLkdi6+XZXV6oP7Snu1fW5pWmn+S2cOfsa
 VVU/nefxJgtDR+tEJSQE16JubsexqJQLCJwLTsfh6TrJ7bWizNLC2dsNCcr+7A1s6nVl
 spyg5NzrIybVLDbZpU/vmKHeajYVjOAmrc3e5m70SB31h90FypyWJjWEW0kmz6+dRpDq
 2NEw==
X-Gm-Message-State: AOJu0YzWHCOMR0d8l0zu7o0OY/wr82cGNJK3SZjWeFGle+YK5QUD+9Eu
 PyQv+12FOcDIIVeKXhiSSxrcWQ==
X-Google-Smtp-Source: AGHT+IHDJCsYlgFmsZsx0zm/DUdvCByNHIvnK0GLgP9SCszDGfUpRsPkhhEG6OZiSxjvTkmGv18DRA==
X-Received: by 2002:a05:6512:3b9a:b0:503:18c5:6833 with SMTP id
 g26-20020a0565123b9a00b0050318c56833mr17763900lfv.61.1696877449613; 
 Mon, 09 Oct 2023 11:50:49 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 u7-20020a056512040700b00501ce0cacb6sm1529262lfk.188.2023.10.09.11.50.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Oct 2023 11:50:49 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v2 0/3] drm: introduce per-encoder debugfs directory
Date: Mon,  9 Oct 2023 21:50:45 +0300
Message-Id: <20231009185048.2758954-1-dmitry.baryshkov@linaro.org>
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Each of connectors and CRTCs used by the DRM device provides debugfs
directory, which is used by several standard debugfs files and can
further be extended by the driver. Add such generic debugfs directories
for encoder. As a showcase for this dir, migrate `bridge_chains' debugfs
file (which contains per-encoder data) and MSM custom encoder status to
this new debugfs directory.

Changes since v1:
- Brought back drm_printer usage to bridges_show (Tomi Valkeinen)
- Updated the drm/bridge commit message to reflect format changes (Tomi
  Valkeinen)

Dmitry Baryshkov (3):
  drm/encoder: register per-encoder debugfs dir
  drm/bridge: migrate bridge_chains to per-encoder file
  drm/msm/dpu: move encoder status to standard encoder debugfs dir

 drivers/gpu/drm/drm_bridge.c                | 44 --------------
 drivers/gpu/drm/drm_debugfs.c               | 65 ++++++++++++++++++++-
 drivers/gpu/drm/drm_encoder.c               |  4 ++
 drivers/gpu/drm/drm_internal.h              |  9 +++
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 45 ++------------
 include/drm/drm_bridge.h                    |  2 -
 include/drm/drm_encoder.h                   | 16 ++++-
 7 files changed, 96 insertions(+), 89 deletions(-)

-- 
2.39.2

