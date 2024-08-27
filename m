Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 545019616A7
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2024 20:17:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4444F10E3F9;
	Tue, 27 Aug 2024 18:17:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="SLrRlsbQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
 [209.85.215.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CA8910E3F8;
 Tue, 27 Aug 2024 18:17:22 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id
 41be03b00d2f7-656d8b346d2so3505890a12.2; 
 Tue, 27 Aug 2024 11:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724782642; x=1725387442; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5Qqm4VTqFnRP1C9/26fHK+dHKryok08NkyH9r7+ILNc=;
 b=SLrRlsbQTbnqzNAk4PT0dZpUBnRKIBIZJL28UqlDHG5g8pWEFrfe7mb4lYXdl50NqR
 9WHBI720XDeTfQ8IMu4zuP50Zbyn7QYZLai1JGSCzged9yYj8+bQNhg/tzlqJldMRCaP
 /hJ4fm072LCksF9zpl+238634nmmoRo8X2hX3LU7TA2Fbbi+8vdrtM+kC9Cn3UVHijBu
 9ttcZROY/DfRrHbR+lkkGnrxriUsp/XKtpAAyPwn3V+AzelYqeO7TkYqcu3FGET9tY35
 n6m0OnvediSj3KrIrwTvuFsQ2P+qIGCTJZbauAiYmWYPv8p7f8w5QDx8qyRnaVZFdGzc
 ePiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724782642; x=1725387442;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5Qqm4VTqFnRP1C9/26fHK+dHKryok08NkyH9r7+ILNc=;
 b=Axn6ZJWKeN3M1wBhV4PrGO/CoF6KeToNwHTowrS6i2t2LeWi20tIQYAuRa2y55SFZY
 D4jYZ1msuuhMib6Evo8qRUTyO1m13VYLJPPIig0307xJb2Uv3nQdeJayhJyepCz5nT+K
 W4kpDJvSJ1Q+Z+ocMSSXDfuQ7Yuz3vxCbsc1+jt9lHanc9VaR/QhvuShV+U3x9Vtyxlt
 g/LKZOVtUruYTwfftH51ri1jSHuEq6aExSaAxc6q4jPrzrBkdl0PNyDYWl5xGwr3Frzb
 0f/nP/H3gzyL91w72nlVxqhhG7+LUn9jorAo2Hb9nXbgZxWpfQUlapu5noZllDdLQhOT
 rFBw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/cMUVNV240ANdOBrN2QY+bGAtzbpiZkHe9fEWMXah3c02bq2rWYNMdq55vzA5FEQQX9GfTr41+co=@lists.freedesktop.org,
 AJvYcCU1qqlb9ljOzv+zJMGgQfv0B97di/IzmFn1OHnQ7zOUeBVejDpUqOJyHRIKk4OmNUBMmTZ0ypBX6jB4@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxZRJq6cq+BxXufiIh8BQ1HRUH/D2vmgm9r/CaS/qo6yXhKjdxJ
 8+2llHHYLDykau4JNgKQwdokP4dtGmdApLO6TjLJTVLRPIVUVXVL
X-Google-Smtp-Source: AGHT+IH0n0TFg5/hRPO6Qh7jcBNG5pKNGVUs+INu5ONwGclHNTvAiowUqwIyW92ev15iZ2fiZpT+nw==
X-Received: by 2002:a17:90b:88d:b0:2c3:2557:3de8 with SMTP id
 98e67ed59e1d1-2d646d24df4mr13634871a91.33.1724782641772; 
 Tue, 27 Aug 2024 11:17:21 -0700 (PDT)
Received: from localhost ([2a00:79e1:2e00:1301:12e9:d196:a1e9:ab67])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2d613a6123fsm12436271a91.33.2024.08.27.11.17.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Aug 2024 11:17:20 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: iommu@lists.linux.dev
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Rob Clark <robdclark@chromium.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org (open list:DRM DRIVER for Qualcomm Adreno
 GPUs), 
 freedreno@lists.freedesktop.org (open list:DRM DRIVER for Qualcomm Adreno
 GPUs), Jason Gunthorpe <jgg@ziepe.ca>,
 Joao Martins <joao.m.martins@oracle.com>,
 Kevin Tian <kevin.tian@intel.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 linux-arm-kernel@lists.infradead.org (moderated list:ARM SMMU DRIVERS),
 linux-arm-msm@vger.kernel.org (open list:DRM DRIVER for Qualcomm Adreno GPUs), 
 linux-kernel@vger.kernel.org (open list),
 linux-pm@vger.kernel.org (open list:SUSPEND TO RAM),
 Marijn Suijten <marijn.suijten@somainline.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Sean Paul <sean@poorly.run>,
 Steven Price <steven.price@arm.com>
Subject: [PATCH v9 0/4] io-pgtable-arm + drm/msm: Extend iova fault debugging
Date: Tue, 27 Aug 2024 11:17:08 -0700
Message-ID: <20240827181717.187245-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.46.0
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

This series extends io-pgtable-arm with a method to retrieve the page
table entries traversed in the process of address translation, and then
beefs up drm/msm gpu devcore dump to include this (and additional info)
in the devcore dump.

This is a respin of https://patchwork.freedesktop.org/series/94968/
(minus a patch that was already merged)

v2: Fix an armv7/32b build error in the last patch
v3: Incorperate Will Deacon's suggestion to make the interface
    callback based.
v4: Actually wire up the callback
v5: Drop the callback approach
v6: Make walk-data struct pgtable specific and rename
    io_pgtable_walk_data to arm_lpae_io_pgtable_walk_data
v7: Re-use the pgtable walker added for arm_lpae_read_and_clear_dirty()
v8: Pass pte pointer to callback so it can modify the actual pte
v9: Fix selftests_running case

Rob Clark (4):
  iommu/io-pgtable-arm: Make pgtable walker more generic
  iommu/io-pgtable-arm: Re-use the pgtable walk for iova_to_phys
  iommu/io-pgtable-arm: Add way to debug pgtable walk
  drm/msm: Extend gpu devcore dumps with pgtbl info

 drivers/gpu/drm/msm/adreno/adreno_gpu.c |  10 ++
 drivers/gpu/drm/msm/msm_gpu.c           |   9 ++
 drivers/gpu/drm/msm/msm_gpu.h           |   8 ++
 drivers/gpu/drm/msm/msm_iommu.c         |  22 ++++
 drivers/gpu/drm/msm/msm_mmu.h           |   3 +-
 drivers/iommu/io-pgtable-arm.c          | 149 +++++++++++++++---------
 include/linux/io-pgtable.h              |  15 +++
 7 files changed, 160 insertions(+), 56 deletions(-)

-- 
2.46.0

