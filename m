Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD596259490
	for <lists+dri-devel@lfdr.de>; Tue,  1 Sep 2020 17:41:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5138A6E871;
	Tue,  1 Sep 2020 15:41:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 559356E86B;
 Tue,  1 Sep 2020 15:41:10 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id x18so718519pll.6;
 Tue, 01 Sep 2020 08:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XcOkZQQTpeiKz0Mw1rh6CWyKzUqBxGHdddTMQluuF34=;
 b=Rk78CRGY6dy+ZFEdUZrfDrnbPXFN0j/Mbf4gfXAkMjV1FkA2jKOMgzMPmrqys1xN/H
 0oCBCSDeXw/3JmqJZZBZI2e7KU4I11AowUw16Fa5saUX2Td1HzQEjH27G0+GzfYgv8x1
 WX2VFPksk/1wwi4AtjUfXd+bsoX3k0XsL5Lq+kr6hwqV3iUoxwn+wvzj4GXMcDrGhY0A
 ysSl74XDSHwkVGrez9PxQELCFAg10MTAMEyRB6gwJ5NAGR1sUCH5qbZq+ZOcotuZrAzw
 VHuZvLHYBOgzIm4GmCQ4I4fktm63T6bnrtxlkHJkCgBlae9cGWqQATf2Lh+cNLVr/Kf+
 AHkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XcOkZQQTpeiKz0Mw1rh6CWyKzUqBxGHdddTMQluuF34=;
 b=HxqrfimDF4HjsVRHJc8YybsozURikNsbD0tIj06TBlAqjaLRtyHTSXnSNFYAt+31I7
 pM/Xpi8jLuu2g72DcJOORlb7TBHV9T3bD4JnDyFzr+k0SeSLBj8nG0W+fdLdMMKfdxFi
 BNXSpInY3qV+dujbzVyg7qLulexWq9VOvlfzF2+vE1Y/B83NBRHa03VAdkK4kFh7ohYc
 KtJAcbh1JKT1i2MGzmNxDkKDiop1pVG+3oIGx8L0RjfQhO9PG4SCaSQ0vQR8yJmvjmmN
 WzhzwQcEy+WNzxa5+51MU+G43XCCHX2yhMzROFJkvTnNKjdxON+hScpaI8skZ7IVVr8L
 Wvtw==
X-Gm-Message-State: AOAM530hjOaJ3BJ3bc/vvFYLSYa7MJY89mwx0LGWllZe0SOm7UXrsxTa
 nCrcHlidIkdQOIG2BZyyXQKWeJGOinPKZw==
X-Google-Smtp-Source: ABdhPJyqWurWH/ORf0ZgMqXz4uWDelIfZv4TSIVGUQMClW7m1/yiFKFieKf6KGpAAbYBd4+w7PET0g==
X-Received: by 2002:a17:90a:2846:: with SMTP id
 p6mr2106145pjf.75.1598974868605; 
 Tue, 01 Sep 2020 08:41:08 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id l21sm2499407pgb.35.2020.09.01.08.41.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Sep 2020 08:41:07 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/3] drm/msm: More GPU tracepoints
Date: Tue,  1 Sep 2020 08:41:53 -0700
Message-Id: <20200901154200.2451899-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, Jonathan Marek <jonathan@marek.ca>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Various extra tracepoints that I've been collecting.

Rob Clark (3):
  drm/msm/gpu: Add GPU freq_change traces
  drm/msm: Convert shrinker msgs to tracepoints
  drm/msm/gpu: Add suspend/resume tracepoints

 drivers/gpu/drm/msm/adreno/a6xx_gmu.c  |  3 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c  |  4 ++
 drivers/gpu/drm/msm/msm_gem_shrinker.c |  5 +-
 drivers/gpu/drm/msm/msm_gpu.c          |  4 ++
 drivers/gpu/drm/msm/msm_gpu_trace.h    | 83 ++++++++++++++++++++++++++
 5 files changed, 97 insertions(+), 2 deletions(-)

-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
