Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E2BE9B3CD0
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2024 22:35:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 990A810E232;
	Mon, 28 Oct 2024 21:35:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KRO/LnnN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A74E810E228;
 Mon, 28 Oct 2024 21:35:22 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-20cb7139d9dso43839465ad.1; 
 Mon, 28 Oct 2024 14:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730151322; x=1730756122; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=O/WuSIt+DjzGI2XfAN06ei9IlKFvKYq+fLWWtLmBqEs=;
 b=KRO/LnnNpprqczagK8XnGwMbhtboiWExErGUqqcb45wp6nwSls08ybBK7PBcHyoZxL
 +cd6ggH0QA2Cv5URA6hrPzwwDARRj2mjodi3zbwEtDooZCfrCym9spO9Q7l0VJ8lkbJM
 vYmmGuR3BnI8GrhbfTuIXpkby8TxiwwUXkhoIrQnHRZJEhjyS2RJ2MgFx16HoKyh0Jcz
 AUke60dF50YGEkVGkNwfIqwZ24almYMVna2ZRRfk+ey7V7kCUvQgsG0DThI3C7/DRqtN
 /3nOvzoIeqYWJ2j88443c5/WrsOy0Qj/74tstnwNCW9i8J0B7YASnujaIXO9UZWPcj4d
 YIVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730151322; x=1730756122;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=O/WuSIt+DjzGI2XfAN06ei9IlKFvKYq+fLWWtLmBqEs=;
 b=hf4N9t5iv/cPVUq6xm1U1Pv0B6B86mAUmrxEXTyMnlQ7oPV9Y1zH8a7zhR8cq9vMTM
 9hfQs5iOnLpxb+wa2jXrNAwbX2iyqVNS9D1OIfgx2DPlCs2MFBjiyY7JKWtO5aFG/dyC
 VQWKiuLs2oOyYrbabTlmSnCcKFZLfpF9kD0iNFARLETg4pmMVJZahKquKCReJ6GgzehR
 rkA1gPv5MXbnN+5W1YQZMLx72Q/lOfHRBwTl5e0eWZyPZ7S/7q0pDofv1zxXjpVJG7MG
 YQNT0/SBa9Wf4ywNhQ+2GB3pXoPM/DhZdOgFvpLaArMWdnpjB2m0mpNFVshvI9R1GCZx
 xC6A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQNE8Ugkl5vvTP1CtJ7l8KOIE12E2OvCluG5gLkP3eeZzzlhj/lFpuXTfZnxe6Ewvfb7ceMrqHrlrm@lists.freedesktop.org,
 AJvYcCWdpMpc6ZSe2HEmQkamdN64+je6Rbho0V+0hcRgR73/TdqA6Cg8fGtCKBnuqprd32Qu7LE4ez2VXdI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YySdm0Qx/Nhf+IUyg62aPm7Hhv69Ek10A5aL7abJk+5l6eABIwb
 P6uVopcwWuvqmWT7jC12Z9t7ETrhuoL3PRWJPMdBXeBJCIubCTvs+gRKFA==
X-Google-Smtp-Source: AGHT+IHpXaUaQZbGQlSlLzr86C3aCU0KQKQ4WqN1NM7MJCznKl4kJ0inRJj992VpciPWjE7vWWI19Q==
X-Received: by 2002:a17:903:2445:b0:20c:bcd8:5ccb with SMTP id
 d9443c01a7336-210c6c0610amr146342205ad.30.1730151321914; 
 Mon, 28 Oct 2024 14:35:21 -0700 (PDT)
Received: from localhost ([2a00:79e1:2e00:1301:12e9:d196:a1e9:ab67])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-210bbf6d3dcsm55171655ad.88.2024.10.28.14.35.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2024 14:35:21 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: iommu@lists.linux.dev
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Mostafa Saleh <smostafa@google.com>, Rob Clark <robdclark@chromium.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org (open list:DRM DRIVER for Qualcomm Adreno
 GPUs), Jason Gunthorpe <jgg@ziepe.ca>,
 Joao Martins <joao.m.martins@oracle.com>, Joerg Roedel <jroedel@suse.de>,
 Konrad Dybcio <konradybcio@kernel.org>,
 linux-arm-kernel@lists.infradead.org (moderated list:ARM SMMU DRIVERS),
 linux-kernel@vger.kernel.org (open list),
 linux-pm@vger.kernel.org (open list:POWER MANAGEMENT CORE),
 Marijn Suijten <marijn.suijten@somainline.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Sean Paul <sean@poorly.run>,
 Steven Price <steven.price@arm.com>
Subject: [PATCH v10 0/4] io-pgtable-arm + drm/msm: Extend iova fault debugging
Date: Mon, 28 Oct 2024 14:31:36 -0700
Message-ID: <20241028213146.238941-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.47.0
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

v2:  Fix an armv7/32b build error in the last patch
v3:  Incorperate Will Deacon's suggestion to make the interface
     callback based.
v4:  Actually wire up the callback
v5:  Drop the callback approach
v6:  Make walk-data struct pgtable specific and rename
     io_pgtable_walk_data to arm_lpae_io_pgtable_walk_data
v7:  Re-use the pgtable walker added for arm_lpae_read_and_clear_dirty()
v8:  Pass pte pointer to callback so it can modify the actual pte
v9:  Fix selftests_running case
v10: Call visit cb for all nodes traversed, leave the decision about
     whether to care about non-leaf nodes to the callback

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
 drivers/iommu/io-pgtable-arm.c          | 156 +++++++++++++++---------
 include/linux/io-pgtable.h              |  15 +++
 7 files changed, 166 insertions(+), 57 deletions(-)

-- 
2.47.0

