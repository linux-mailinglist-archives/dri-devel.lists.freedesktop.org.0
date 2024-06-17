Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF05190BD8C
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 00:29:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15B1010E50F;
	Mon, 17 Jun 2024 22:29:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Uklf30oq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C44BE10E506;
 Mon, 17 Jun 2024 22:29:27 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-1f717b3f2d8so41212255ad.1; 
 Mon, 17 Jun 2024 15:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718663366; x=1719268166; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=XM94SIgqTgrJbrT5e0SKLh/HdcnUyE0iL7Um2J9PNd4=;
 b=Uklf30oq/+5ANXzhZfSBb+zvreWsIoP6sWohewBx4EFxl1Ywn2dehwS2oZnMq8aij0
 Vzvc1Ghx7VZyfo2lCCMXgsojowcVp1BO+JK0HM3mQNrGDvrlJUjcPw69jCIzbDvxMwti
 iqcuRyRPqjs0QkWa7SbX6MG9aXVpR4VpbjLsAGAXFA2737bZKfkpmQ1nBjjoH7ghh2Ca
 rROvrxuBmyYO+SgC3pXb81AL65YUkQ9Dc0P77LeHNAUq1wA9WHqFafrRvdqbGFFLQAC3
 4Gng10eFgwYnbgNlDdhCnOlnd4SOVMNcC4eacbkSBaASHhF+Eup0z5oKKvrvswaEULjj
 poQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718663366; x=1719268166;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XM94SIgqTgrJbrT5e0SKLh/HdcnUyE0iL7Um2J9PNd4=;
 b=sy/Wvl4CvzVEcaOb/2kM4VKtJGwh+eatj8JguyS/nbfA7/03aVacmLfjUn9Z71yNZn
 +glxcOvw4pAm3c2qSfbpTZBwG0qZqIItUlUZ5ozyC85Yp92gVbAyNOYi25DGKIDeG81U
 4piCMDqGxGKt9Io2fqCh4zy2Ps16FrT/wYCkBza+ZxuywtcfSfQfGS6dyzrHefM3/rNJ
 NEi8Ygae84ubnoZn5XcLLJB05GW00jNVcJQBhllvSWA7CUwCga4DX0D8te4WqhKTqvCd
 wFivMKc9F29NkOJDqYvX3KZI8ku5SAIA0sqXHYT3aaUUjWt+Af1S/J9qy38UWHUfGLF9
 bGyg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXl3uMTq/+VQXqrPkpFd0zDle/29mKyB6yXKzdQGfRH3cvmBFY9IYwqYD+zERzzIsLyDrqkh6xJKXM7iS1nFlbZejzF+FDmc6it3IWNgx1a
X-Gm-Message-State: AOJu0Yw/abJelqcc+ptK5IAllg6RIJD5o4MCY4SlmPCTWUYHX3avermq
 lU1kP5m6Pc9zkdGt91HwgCUwiiatuN7L/fU3NtbSfZTxcQvT9KkaujnPmw==
X-Google-Smtp-Source: AGHT+IEOpgI4p8x4cS6eEpW2PNtg21Ko2+su+tSYSUewhI2L7n5QvQjQZK3b2ttS8wmFTQuHEHMrtQ==
X-Received: by 2002:a17:902:f791:b0:1f6:32ef:3e00 with SMTP id
 d9443c01a7336-1f98b12905amr15453335ad.0.1718663366090; 
 Mon, 17 Jun 2024 15:29:26 -0700 (PDT)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f855e55c80sm84222675ad.21.2024.06.17.15.29.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jun 2024 15:29:25 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Rob Clark <robdclark@chromium.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 linux-kernel@vger.kernel.org (open list),
 linux-pm@vger.kernel.org (open list:HIBERNATION (aka Software Suspend,
 aka swsusp)), Marijn Suijten <marijn.suijten@somainline.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Sean Paul <sean@poorly.run>
Subject: [PATCH v2 0/5] drm/msm/adreno: Introduce/rework device hw catalog
Date: Mon, 17 Jun 2024 15:28:58 -0700
Message-ID: <20240617222916.5980-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.45.2
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Split the single flat gpulist table into per-gen tables that exist in
their own per-gen files, and start moving more info into the device
table.  This at least gets all the big tables of register settings out
of the heart of the a6xx_gpu code.  Probably more could be moved, to
remove at least some of the per-gen if/else ladders, but this seemed
like a reasonably good start.

v2: Drop sentinel table entries

Rob Clark (5):
  drm/msm/adreno: Split up giant device table
  drm/msm/adreno: Split catalog into separate files
  drm/msm/adreno: Move hwcg regs to a6xx hw catalog
  drm/msm/adreno: Move hwcg table into a6xx specific info
  drm/msm/adreno: Move CP_PROTECT settings to hw catalog

 drivers/gpu/drm/msm/Makefile               |    5 +
 drivers/gpu/drm/msm/adreno/a2xx_catalog.c  |   52 +
 drivers/gpu/drm/msm/adreno/a3xx_catalog.c  |   81 ++
 drivers/gpu/drm/msm/adreno/a4xx_catalog.c  |   50 +
 drivers/gpu/drm/msm/adreno/a5xx_catalog.c  |  148 +++
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c  | 1239 ++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c      |  880 +-------------
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h      |   11 +
 drivers/gpu/drm/msm/adreno/adreno_device.c |  624 +---------
 drivers/gpu/drm/msm/adreno/adreno_gpu.h    |   32 +-
 10 files changed, 1648 insertions(+), 1474 deletions(-)
 create mode 100644 drivers/gpu/drm/msm/adreno/a2xx_catalog.c
 create mode 100644 drivers/gpu/drm/msm/adreno/a3xx_catalog.c
 create mode 100644 drivers/gpu/drm/msm/adreno/a4xx_catalog.c
 create mode 100644 drivers/gpu/drm/msm/adreno/a5xx_catalog.c
 create mode 100644 drivers/gpu/drm/msm/adreno/a6xx_catalog.c

-- 
2.45.2

