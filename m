Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FFDB95F7C2
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2024 19:15:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1090C10E272;
	Mon, 26 Aug 2024 17:15:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GhrWZCLO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1CD810E272;
 Mon, 26 Aug 2024 17:15:54 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id
 d2e1a72fcca58-714186ce2f2so3469495b3a.0; 
 Mon, 26 Aug 2024 10:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724692554; x=1725297354; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Vcql72JPQTQ2OTkoapF5mbW4vnMiQPQvKYGW7HfPhkQ=;
 b=GhrWZCLOoGbWnteknNkdEWTjGE6OVOBNzJREoQcl3WCjs1hszSCbwq3LzAVgrdu6M/
 xQk9Nm+6m1IF5jHpuL7qDqUwXoXuhsmocwhWvMiWwtZr0kg+lqKQgeaTG79tp1csN8KR
 RmZcbmzt0hrg/y5BRV1vKXglvBPo5PXPXcl+u4eTxEG0oNAwitlbNHLo2VDplKHiANTl
 rCjGZtmipiQ+G9Y6zV+vhseSqAVmfYnoh62x+IC27KYzSC7cI7ItZ8FYlRv4U5xG55t1
 xzPHMi68cq/0R+FW1YbdIc2ovxW2BiFqPBPrtefSMdveyzlAK4TA8PKCDhu7oGy/Y2h5
 ygcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724692554; x=1725297354;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Vcql72JPQTQ2OTkoapF5mbW4vnMiQPQvKYGW7HfPhkQ=;
 b=WPFYZu/qd0+sYdChm2W+o3+o+DLpiGr7UNfUxaPhfElgXs2zt7j26f+diAYRjjbM6g
 2zRxMiUADt+U7mcT8RueTqeGCb+jdrRw/MELf3Pw224CSJgSSu/aEDNP7RsVBWTKuTJ0
 TpBq2I7AVKA/bcbf3VksVKS5aNh66OIoVkv7RMKPtAxckKst6I2GuVFDY6Y+eEKtOugx
 BmICFBzbeuZqDQvT9wMQtVOdsh/SgyJyV5v4RhTDaFcELMIBLVNnKZErOhfm58nldzvp
 gsMMDDqUL+5LH2nDnpLoPyh05E4PlTRtJwW3vbn/HRKRt6unIm52FLGEvl+xSyWpdICV
 zOAQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVKZAlSdKcMLG3EVH6/mO0JjTWUPLIXZqrTNdlIoTitBkkaSAHDJNrT+DGQ2VywrlJDbSjqnZDyWQg=@lists.freedesktop.org,
 AJvYcCVUQDZHFvYlqfq/bzLN9J3mt8RJQJ+s08TjW8aJ14C2ppOh84I8Y3kyVU5zzIlvuFzPFfoZjsbzaRTk@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzCTfeCcX+8vjjVYj9pYACfEL658m+tYefLRdXGgL1FLDyWaj5w
 fvo4pGN5hIcNvH6L05WUBQXWay6i2Ob/L1sFfyUPaYXEM4I3q3ND
X-Google-Smtp-Source: AGHT+IHqCiVZD8k41tBXvr0tubaCtVb1j37tqzR+PZ1WdzT88DIUTlpRPwV6ErHFhiO0ftk2Eidn8w==
X-Received: by 2002:a05:6a20:4f89:b0:1cc:bb4e:a905 with SMTP id
 adf61e73a8af0-1ccbb4ea95amr1234779637.1.1724692553998; 
 Mon, 26 Aug 2024 10:15:53 -0700 (PDT)
Received: from localhost ([2a00:79e1:2e00:1301:12e9:d196:a1e9:ab67])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7cd9acdca6asm6761815a12.48.2024.08.26.10.15.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Aug 2024 10:15:53 -0700 (PDT)
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
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Ryan Roberts <ryan.roberts@arm.com>, Sean Paul <sean@poorly.run>
Subject: [PATCH v8 0/4] io-pgtable-arm + drm/msm: Extend iova fault debugging
Date: Mon, 26 Aug 2024 10:15:37 -0700
Message-ID: <20240826171546.6777-1-robdclark@gmail.com>
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

