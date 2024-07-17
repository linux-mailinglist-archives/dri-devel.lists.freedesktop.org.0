Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DD6F934093
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jul 2024 18:36:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C860610E2D9;
	Wed, 17 Jul 2024 16:36:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UfxMuZwX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6250410E2D9;
 Wed, 17 Jul 2024 16:36:42 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-1fb3b7d0d56so39504655ad.1; 
 Wed, 17 Jul 2024 09:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721234201; x=1721839001; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4TKuZ+LLWKFD2SRhsXU6njcd+7Nl5m44Gcrf0C6YsTI=;
 b=UfxMuZwXM7qcNTPWZEssL6S/gRMs1R39FsOFqcimb6jjVS9TZkbHCq67J7v0RF/Elu
 Ot8uGW8hNxcZnNSN/4Hr4/sRDQzvNQ0JIs8iayHYWJ9mrlxHxTQAWLe+9M/SkKAPOZqy
 N6UoIjbPM9jxY+788SZLtxYt7AzJO7kR7AN/KHwpZy1L8yJS2hxI6eDKLFQd7FGt4dRJ
 ElVNAWDehChqUG0A75pqu69b8q2rdOVEaJTsceQDcknsvK/Rh4sbvJHhZY5jcw5IskEf
 OrMZ0ZHGqs7y11pBsWgS9T4deWZZILec2KfnEbzTd8Z12tsTOaScuvkWrn9eG8B2175H
 C3hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721234201; x=1721839001;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4TKuZ+LLWKFD2SRhsXU6njcd+7Nl5m44Gcrf0C6YsTI=;
 b=LluSjT0yM/RB2o7t4pUGVAG6wXy7FONRNst0ObPoksqGwPAX8BHR5SZk2O91Xr/f5a
 weFWmDelBFYPxj/Bbg0/kV1qVa9tOlthA9p3VYAt5gXCU45deuqcv705Ct8nXGQ3VvL5
 qb04YgFGkJYptFAYkQ3kW9ynQ+3Ft280R5tXPu0jwgd57Jm+aD1Z2lxdtoXb54nCzCbt
 Qj7bQOHQWI7lJIqpMmPbJqbG6f1lvtWqDYAPNq9OkTnGt17CknBsbC27oBBkm6M3OVf8
 NKPM4GfBSGMrEY+UukLmClnlvLPFlNrxSwv9XZPAfYKahQJb3iYxUCVflTV57sapQJJ2
 n6GA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXA9pro2ZFN44Y4Za9POty6w2qDxIpDRgWXUXoWJ0QbtEMmO4pMlzFIVYV/NFD4TvOmwKuw3ue7zik8cj5rr+Y3mT67SxxQIE86GnFyy4V5
X-Gm-Message-State: AOJu0Yze0ehwzuQ5U+jmMNAp9uVMRB196Riz3j6znoVWhJBAdWlArW46
 IPfv1MseWNVBT7BSGolaI3a7o66Q6kToWyJ9I0oRjAevO7doZF82w2FnRg==
X-Google-Smtp-Source: AGHT+IHEmLpSAb65L1ZZEAG7DejWL9QRUnhbkb1WfvjNwqFc5ST7wh4b/x5LadbiinMc04M/Mvyhlw==
X-Received: by 2002:a17:902:eccc:b0:1fb:6ea1:5e with SMTP id
 d9443c01a7336-1fc4e562501mr19451975ad.44.1721234201188; 
 Wed, 17 Jul 2024 09:36:41 -0700 (PDT)
Received: from localhost ([2a00:79e1:2e00:1301:e1c5:6354:b45d:8ffc])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fc0bc27178sm77113815ad.134.2024.07.17.09.36.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jul 2024 09:36:40 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 iommu@lists.linux.dev, Will Deacon <will@kernel.org>,
 Rob Clark <robdclark@chromium.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Joao Martins <joao.m.martins@oracle.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 linux-arm-kernel@lists.infradead.org (moderated list:ARM SMMU DRIVERS),
 linux-kernel@vger.kernel.org (open list),
 linux-pm@vger.kernel.org (open list:SUSPEND TO RAM),
 Marijn Suijten <marijn.suijten@somainline.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Sean Paul <sean@poorly.run>,
 Steven Price <steven.price@arm.com>
Subject: [PATCH v6 0/2] io-pgtable-arm + drm/msm: Extend iova fault debugging
Date: Wed, 17 Jul 2024 09:36:20 -0700
Message-ID: <20240717163627.43423-1-robdclark@gmail.com>
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

Rob Clark (2):
  iommu/io-pgtable-arm: Add way to debug pgtable walk
  drm/msm: Extend gpu devcore dumps with pgtbl info

 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 10 +++++++
 drivers/gpu/drm/msm/msm_gpu.c           |  9 +++++++
 drivers/gpu/drm/msm/msm_gpu.h           |  8 ++++++
 drivers/gpu/drm/msm/msm_iommu.c         | 22 +++++++++++++++
 drivers/gpu/drm/msm/msm_mmu.h           |  3 ++-
 drivers/iommu/io-pgtable-arm.c          | 36 ++++++++++++++++++-------
 include/linux/io-pgtable.h              | 17 ++++++++++++
 7 files changed, 95 insertions(+), 10 deletions(-)

-- 
2.45.2

