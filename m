Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C9E91993F
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2024 22:40:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C758210E159;
	Wed, 26 Jun 2024 20:40:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fc2GoX8u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
 [209.85.215.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D82AD10E065;
 Wed, 26 Jun 2024 20:40:40 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id
 41be03b00d2f7-710437d0affso5395161a12.3; 
 Wed, 26 Jun 2024 13:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719434440; x=1720039240; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=AbOHayuQJNiEIov1gYrLNhraOo1uckdkGZa6Izlq/48=;
 b=fc2GoX8u+hHrAaSXw2aoy0G4r2OOS8CKSAn4VxBoZ9HuOkTcAt9IGk7E4oY013dMbu
 RmdnIf/xGVHRqsY5lHwM+cmxiehqgSaWM+7+qZSsWGFFBKJuuUKladslHurtTepvXxTg
 7SStwvvZHVPUywoVN9r3FxmwPxElRyZ2eWzqf+AvbwqNHgc8uH+h+ztaElIe09ZmZuDq
 m4eOEkRNt0KIzjzxNA4p1fkopecZ0Rvc04PNOUX0TPk0ZwXO5+ySUwz/OIGul9CXqYJk
 C7iFPDdL/00NtQ5Ls/yCigHOyDpy2Wb585ppHh/EW1/fMmQzNqB+XHQs7j7HXFxYaGXd
 O7bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719434440; x=1720039240;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AbOHayuQJNiEIov1gYrLNhraOo1uckdkGZa6Izlq/48=;
 b=NAr+pQcdCoBl7vcVyraaEpgv4hH4fH4Kwa21O8fTAwDorqFkvnYg5NAaeYd5/aTp3s
 oeLVAplWhDgFONeyR9Fdw9fQwJSF2N1f7fpvD2qU586bqEnE5DkUrr/ADnPfYj84qan5
 FaRWRrVfg2G0d/cvdWiatqe8HU9CJO+iIegszwnWvX1AZbm+iswzshivg7adPp1Xehnd
 7rFu6asSJJzSDcYBMM4kW7k4QMe7IN6lw5jgxh+kMbg9X2jrp3tM0UwsemoeAM/oTpP2
 +wOzzN+ZaICxABwvf9iTFxl60b5v4r83nha5iZeLTBqpB1sQgot95zemdC3Q+5O8lQKq
 3g2g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXPBO+kG4d8+Bft/gUDXIqZ6syAWodtAq2HmXoTNbsDtCwYu8XY1V2UPGa6Grk0lEN0k89hLuKwE17i0qTo9RzLLmgtOYjBNtQPDyv0oS4Hb4wjpP1uGzQyFfj1ORfnUlYKDsmqdzsNi1i+hQXLJnnC
X-Gm-Message-State: AOJu0YzJMGlW8pzqBcpK0AXwpi/RtgpBIh22OyifCuBtH0/WX4pEftzm
 hHUV84HxRFGu+L+PwAlkuWu5t6Qf/o/QvXeYollJ1WAo301xtmcI
X-Google-Smtp-Source: AGHT+IF3IekAjZVaykmQWQEV/CWbBuXRqd14xzAhjMZ8QLFh0Na24yFedXvOlLwgPR38grbkYKuKzQ==
X-Received: by 2002:a05:6a20:6387:b0:1bd:1e0f:efa3 with SMTP id
 adf61e73a8af0-1bd1e0ff0dbmr5381451637.4.1719434439963; 
 Wed, 26 Jun 2024 13:40:39 -0700 (PDT)
Received: from localhost ([2a00:79e1:2e00:1301:e1c5:6354:b45d:8ffc])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f9eb323636sm103241125ad.102.2024.06.26.13.40.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jun 2024 13:40:39 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: iommu@lists.linux.dev
Cc: linux-arm-msm@vger.kernel.org, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Rob Clark <robdclark@chromium.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org (open list:DRM DRIVER for Qualcomm Adreno
 GPUs), 
 freedreno@lists.freedesktop.org (open list:DRM DRIVER for Qualcomm Adreno
 GPUs), Jason Gunthorpe <jgg@ziepe.ca>,
 Joao Martins <joao.m.martins@oracle.com>, Joerg Roedel <jroedel@suse.de>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 linux-arm-kernel@lists.infradead.org (moderated list:ARM SMMU DRIVERS),
 linux-kernel@vger.kernel.org (open list),
 linux-pm@vger.kernel.org (open list:POWER MANAGEMENT CORE),
 Lu Baolu <baolu.lu@linux.intel.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Sean Paul <sean@poorly.run>
Subject: [PATCH v5 0/2] io-pgtable-arm + drm/msm: Extend iova fault debugging
Date: Wed, 26 Jun 2024 13:40:25 -0700
Message-ID: <20240626204033.255813-1-robdclark@gmail.com>
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

Rob Clark (2):
  iommu/io-pgtable-arm: Add way to debug pgtable walk
  drm/msm: Extend gpu devcore dumps with pgtbl info

 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 10 ++++++++
 drivers/gpu/drm/msm/msm_gpu.c           |  9 +++++++
 drivers/gpu/drm/msm/msm_gpu.h           |  8 ++++++
 drivers/gpu/drm/msm/msm_iommu.c         | 25 ++++++++++++++++++
 drivers/gpu/drm/msm/msm_mmu.h           |  3 ++-
 drivers/iommu/io-pgtable-arm.c          | 34 ++++++++++++++++++-------
 include/linux/io-pgtable.h              | 16 ++++++++++++
 7 files changed, 95 insertions(+), 10 deletions(-)

-- 
2.45.2

