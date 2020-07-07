Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EDBA21797B
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jul 2020 22:36:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CCC96E233;
	Tue,  7 Jul 2020 20:36:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61D776E233;
 Tue,  7 Jul 2020 20:36:20 +0000 (UTC)
Received: by mail-pg1-x52d.google.com with SMTP id m22so10173189pgv.9;
 Tue, 07 Jul 2020 13:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kYdONvMdJAADML4BPPbRbs7311WOl+MmOi58FDooBKo=;
 b=Ztuh0++A/C/3gGj6shzPsBd5YTUcajDUvpDLzheQE94FqM4Zgij8EkBSXVR0pKZhG4
 mCIeJ/M7KrkHlql0bZnwslTWYz+snttwyYDTz7qzEY3mkIVWo8QXQ0m3uP5Gsif6vQ4u
 dGAVa71d0kwaDr8KSO5+xztFesKkc5lisTTycGm3smRn/uhtk2LeTJBdHiEXtVPUBrpC
 J9yYxforKh3D7XuCL6XQKtsVZWP/GmxXgyD95FnOE9cIpUJHmNPcdVDFvAGmQfDgrv0s
 hDuSQCgycc5wloMRljI6NHVGBZHa7mASXTooTZ0/JLhupWZzTTO6vqxrg2QDl+vV1Nss
 4Axg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kYdONvMdJAADML4BPPbRbs7311WOl+MmOi58FDooBKo=;
 b=WMihQGP/AQtCNVcr37VLwBuWUiPrCqezXiaARH2VFXT4W9KpueU0xCz8/3Tj2tj9V9
 5drlokfAoVgVf+Y+ewKi9p439W0npIR+PNgUHl7xTlmBcNyH+ADEoMeIEwaF3v5gKmcr
 AiE7EiDGcyz9OR3/g02mRn3Rk3jaDKFu0Com6WL+4K5EizNlLQkQrKD+sVxkXkJH3H/h
 So9cfL40zSvPqSyQebbcDClq1HJHupK9HDBvZmWTKtAcME/ax7/UiOzPe22MOJqn+t9u
 7xjOnD9fVVphkGZkd9TLWifvNYkDT7Mrg9zrZPC6aAzAyPCGKoIhLFPlQpgEWrUy7eNp
 a2SA==
X-Gm-Message-State: AOAM530BtV1MnqNbe7qRPwRTnulA7oYKzzWYUgn4nYcJZFV2v1imI20a
 ycma0R+73HO5Atr5WMkYX6zO9BBLCgI=
X-Google-Smtp-Source: ABdhPJzhV3qXUyNVtweFO4xS/ZbBj105176Kpc6BoO2oGQwnKkqdFkpWsOYX28d8ssKhm3VlR559aQ==
X-Received: by 2002:a63:a558:: with SMTP id r24mr47731179pgu.70.1594154179555; 
 Tue, 07 Jul 2020 13:36:19 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id q7sm23942952pfn.23.2020.07.07.13.36.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2020 13:36:18 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/2] drm/msm/adreno: cleanup some packet building
Date: Tue,  7 Jul 2020 13:34:58 -0700
Message-Id: <20200707203529.2098979-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
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
Cc: Rob Clark <robdclark@chromium.org>, zhengbin <zhengbin13@huawei.com>,
 Jonathan Marek <jonathan@marek.ca>, Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Harigovindan P <harigovi@codeaurora.org>,
 open list <linux-kernel@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 Ben Dooks <ben.dooks@codethink.co.uk>, Sean Paul <seanpaul@chromium.org>,
 AngeloGioacchino Del Regno <kholk11@gmail.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>,
 Sharat Masetty <smasetty@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Resync generated headers, which we haven't done in a while, and cleanup
some open coded packet building.

Rob Clark (2):
  drm/msm: sync generated headers
  drm/msm/adreno: un-open-code some packets

 drivers/gpu/drm/msm/adreno/a2xx.xml.h         | 1102 +++++++-
 drivers/gpu/drm/msm/adreno/a3xx.xml.h         |   85 +-
 drivers/gpu/drm/msm/adreno/a4xx.xml.h         |   87 +-
 drivers/gpu/drm/msm/adreno/a5xx.xml.h         |  156 +-
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c         |    5 +-
 drivers/gpu/drm/msm/adreno/a6xx.xml.h         | 2305 ++++++++++++++---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h     |   28 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c         |   11 +-
 .../gpu/drm/msm/adreno/adreno_common.xml.h    |   29 +-
 drivers/gpu/drm/msm/adreno/adreno_pm4.xml.h   |  932 ++++++-
 drivers/gpu/drm/msm/disp/mdp4/mdp4.xml.h      |    2 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5.xml.h      |    2 +-
 drivers/gpu/drm/msm/disp/mdp_common.xml.h     |    2 +-
 drivers/gpu/drm/msm/dsi/dsi.xml.h             |  208 +-
 drivers/gpu/drm/msm/dsi/dsi_host.c            |   14 +-
 drivers/gpu/drm/msm/dsi/mmss_cc.xml.h         |    2 +-
 drivers/gpu/drm/msm/dsi/sfpb.xml.h            |    2 +-
 drivers/gpu/drm/msm/edp/edp.xml.h             |    2 +-
 drivers/gpu/drm/msm/hdmi/hdmi.xml.h           |    2 +-
 drivers/gpu/drm/msm/hdmi/qfprom.xml.h         |    2 +-
 20 files changed, 4328 insertions(+), 650 deletions(-)

-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
