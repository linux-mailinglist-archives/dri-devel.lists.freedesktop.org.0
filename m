Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13AC790BF3D
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 00:51:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C156C10E51B;
	Mon, 17 Jun 2024 22:51:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Q/3uGIHh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com
 [209.85.161.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1621D10E51A;
 Mon, 17 Jun 2024 22:51:36 +0000 (UTC)
Received: by mail-oo1-f45.google.com with SMTP id
 006d021491bc7-5ba33b08550so2283461eaf.2; 
 Mon, 17 Jun 2024 15:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718664695; x=1719269495; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=XOCRwnrSRpia5cthXeBvh3mxj7l6TXY79siPnfMre0E=;
 b=Q/3uGIHh9o6GTkBRQrNMy1ZTw8T3YWSF/JJ1k/kzDKbYtUhsqJClX20n34eVwz91MW
 W2JZAy3LhewJq10fj98vCYErTicA+WE5bByOlLYyFJ+QEPlVU/YrWfKblgJFrbeEZdnq
 R/CVLOU0WNil2zRldW+IlFGX1pguEN38Ik02uSrzI7+JfPmw0+tebemSUdLhaffeSKg2
 ImkdfvNYhSQ2S/6QBUQQ0wJBBFAI3CAt9+f5+teCaTXF1voFXRjl1oFslhPJiUA5yS2a
 oYEd46+IlpqEPGA5O6hCnzeY9xy4sOj1vxo74i+OxgJ024f7y6BgvGtYaVLfhP9NDHlP
 cjcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718664695; x=1719269495;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XOCRwnrSRpia5cthXeBvh3mxj7l6TXY79siPnfMre0E=;
 b=MuWc/qSPO2f+ZhMYgSzHge18IHviB9IdIkwgbZKmlKuik4g6klsCU6++t5K0xPIuCh
 7MS8V2/DEABSQJ4OzFc03LN5WObWeIPqDmxNboeqFTohsSa0RIDCXIl4RgkCuR2kIk8G
 RA5wWxitbTY83sHsdbVd5/srJUPRmR6LXSGYQPsIDEiFQ/fs1M7wQY4883g1P94lyPvp
 +8zHqMGLZxcaB1YCQCREyUgYfJBrDAFB60AcgWfaNITfyFJSfFc5GKyxpoFyrYEhMJDE
 xILDgf0wPUvOKrhyugEYOGRqRTNu30uxIeDRk98HQuENxTdKZf5tbrYMztjFE+3NI0gG
 I/Dw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW+rqvlJPrLMOZZTES2zyWsg/r9oEWGCgrODFNYsPR6lIEbb1XfIxt9bymVe9WET5ruLmMn9lxinENxWEcHHwjSavuIFeGPtqPvQQxKbY2v
X-Gm-Message-State: AOJu0YyqxUPStjuGfyN+3QzJ0vMmt2pKRMuXtA3HFN7IVxwzkQMVTqZI
 ZQgsW7NEV9xgnEblFixfhmfaCVN/uJxjy3wpKFGNo78sP+xdkzyLwRqKcA==
X-Google-Smtp-Source: AGHT+IHGLkycX4xJ5JW5WejSq2hWxZskYG8gSZhmXCHER51ANX/Wv0SwwOVWWPB9tOOjB/01BlbIBQ==
X-Received: by 2002:a05:6358:9146:b0:19f:3d80:5896 with SMTP id
 e5c5f4694b2df-19fb4f5bbf0mr1369553655d.23.1718664695063; 
 Mon, 17 Jun 2024 15:51:35 -0700 (PDT)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-6fede16a58dsm7096536a12.29.2024.06.17.15.51.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jun 2024 15:51:34 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Rob Clark <robdclark@chromium.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 linux-kernel@vger.kernel.org (open list),
 linux-pm@vger.kernel.org (open list:SUSPEND TO RAM),
 Marijn Suijten <marijn.suijten@somainline.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Sean Paul <sean@poorly.run>
Subject: [PATCH v3 0/5] drm/msm/adreno: Introduce/rework device hw catalog
Date: Mon, 17 Jun 2024 15:51:10 -0700
Message-ID: <20240617225127.23476-1-robdclark@gmail.com>
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
v3: Fix typo

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

