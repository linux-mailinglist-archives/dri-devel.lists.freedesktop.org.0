Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F129958CF7
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2024 19:17:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1215010E7C9;
	Tue, 20 Aug 2024 17:17:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ipj1TE6X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 726B110E7D4;
 Tue, 20 Aug 2024 17:17:05 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id
 98e67ed59e1d1-2d3ec4bacc5so2890213a91.1; 
 Tue, 20 Aug 2024 10:17:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724174225; x=1724779025; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=dx99I4gVjE0nKHxOcEFDps9UKSShAk0pVoAeBRskDVw=;
 b=ipj1TE6XUXwsq1p5jY6Z7gHwQeX4Dnydc5ppHY8h6Fyw2fmp9g5dPWlY714aFKLEFc
 9MZdu8zf2DkW938Ba07tQlf4A8aXG4GZnvULrRsDojKaPsVCFWjOEjjlGX1gYfb8iyFg
 BVKXzZXKCxocWLrEZgfOmFFoynAMRBtFR4vb1hbhfr61x3oKU+PU2n+jq+jyb5gDIwR3
 i/NoHGTKiymxr2Fnp2xvn36JhdT7XhJ4q1N+1mMiDqG9YEDQEi9R+P3Dw4XfvxNdcg8h
 rubFymYyGexfNhFHI8Jx8271bmurGqRlzTuPYbVwrgZtLVAN6cLIn88+xcGru8NdAwGU
 7hFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724174225; x=1724779025;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dx99I4gVjE0nKHxOcEFDps9UKSShAk0pVoAeBRskDVw=;
 b=FDXxcKEQy0o2e/VHxy2KD2TMnI0TOitgklX88f2HLKDsdoAiMKIzaUfatyB/Nu+Svn
 eyubiv0GQ5ZDa95FhSRU4Bh6e/d0rmTCMvW8t/ECWBAsmikflmwc4T5+zYcYmJed7bG8
 JkBq6Vc1u+w9mG8jcwfoQtnn/1+iTvXdPywbTqx4b3XA2qtDIk38EKI7avAZm1Ye3Cf6
 sUqgW+AcBbZaDPwhLbbNAkIL1ddSuYpSHj4srBwesukE9raDuTEluUBrBr9GUBoh+hum
 r8jCQ+SI4xfKbKaTGAWwWZYTznMAFHaZWnszWyNfIgfB0qQDYz6X14HrygCtjmzuw+t/
 d8rg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVGq+JOQnypxm5qUrLSCTotjuWDOTAUAA1QqtaU5q5KLdBtY/TU6hAOXZuBdvKW1Q8npSPSwKxbgS8=@lists.freedesktop.org,
 AJvYcCWHfgHqDHjDwPhg8OMyWG/r8T2RbG++84tUgyEj2REjKGj/KQcju3NhxBhAS3xVLPimOf/AhEA4AQHS@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywx6LZpJezqdmJgrESy8510H6IT8sWDIKWr71oTRr3Kk/LuoTcs
 maeX6OVJJs2AVpn1aEMjiyzTX059DtjXr1BLzNlReUnExHrRL3hl
X-Google-Smtp-Source: AGHT+IFqPaVzJwjKdCz+zT/UW2wJpDdZc+xGRDH+xt/ijn6H6ZIBqZtSC9ajtEejlFBlcXFWdHaCwg==
X-Received: by 2002:a17:90a:ce08:b0:2ab:8324:1b47 with SMTP id
 98e67ed59e1d1-2d47327c70bmr5465287a91.15.1724174224643; 
 Tue, 20 Aug 2024 10:17:04 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:bd02:d0ce:e791:dc08:a375])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2d3e3171e01sm9721042a91.30.2024.08.20.10.17.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2024 10:17:04 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: iommu@lists.linux.dev
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Mostafa Saleh <smostafa@google.com>, Will Deacon <will@kernel.org>,
 Rob Clark <robdclark@chromium.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org (open list:DRM DRIVER for Qualcomm Adreno
 GPUs), Jason Gunthorpe <jgg@ziepe.ca>,
 Joao Martins <joao.m.martins@oracle.com>,
 Kevin Tian <kevin.tian@intel.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 linux-arm-kernel@lists.infradead.org (moderated list:ARM SMMU DRIVERS),
 linux-kernel@vger.kernel.org (open list),
 linux-pm@vger.kernel.org (open list:SUSPEND TO RAM),
 Marijn Suijten <marijn.suijten@somainline.org>,
 Nicolin Chen <nicolinc@nvidia.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Sean Paul <sean@poorly.run>
Subject: [PATCH v7 0/4] io-pgtable-arm + drm/msm: Extend iova fault debugging
Date: Tue, 20 Aug 2024 10:16:43 -0700
Message-ID: <20240820171652.145673-1-robdclark@gmail.com>
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
 drivers/iommu/io-pgtable-arm.c          | 147 +++++++++++++++---------
 include/linux/io-pgtable.h              |  15 +++
 7 files changed, 158 insertions(+), 56 deletions(-)

-- 
2.46.0

