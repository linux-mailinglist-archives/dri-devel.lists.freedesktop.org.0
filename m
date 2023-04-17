Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B73FA6E455B
	for <lists+dri-devel@lfdr.de>; Mon, 17 Apr 2023 12:39:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A3AD10E3F6;
	Mon, 17 Apr 2023 10:39:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3874210E3F6;
 Mon, 17 Apr 2023 10:39:02 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 o6-20020a05600c4fc600b003ef6e6754c5so11415700wmq.5; 
 Mon, 17 Apr 2023 03:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681727940; x=1684319940;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=CmymNmbm0SFHzsUmDof5GjJMAJrAxQvLWm3ATdzKtGw=;
 b=PyvaEv2OMxFIha0wI5BblRADti0qMpbF1gYKEZVSU+3OQvz6SQLcjJhiL9ivyhdUJX
 Jb51hQ3SCun1pojTJp2CchSEKcFXvBfUJJu3MAmTMlpif8JME8EoPYWO8T/A1WKH63dn
 iCDX652nzriAxGav7OZ1aUKb9uc75SBq6ftsy7wQIDFQ77EmUqpdILH41UoDxSDq42fT
 Ik6pucLjrK09/Sp8YwnwEyv5Jq8q7Wmtra2+UPFgR6rkOqbnl857HapViUrvQozrv9an
 0Q4DU2D8AOcPqO45ccxzJzqe+0zpbiShI+j/zYpxofd5e/2sGWDs2H7WFvs3Yvt6R3RA
 NBAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681727940; x=1684319940;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CmymNmbm0SFHzsUmDof5GjJMAJrAxQvLWm3ATdzKtGw=;
 b=TnTdoA94pDtFhY1oniCBc4PXSiHDgKpWqCbqT6FpUK2JWa0QULYLTq+4wDViFUbXXN
 yu70y+WDL9is1VlRRALWk6Rb9FvG9ez+3xx60soCPDdJXbLnAjfg9bA+GX+3eYdWmrO5
 bb3WTde46r2msBNjI/vOhmzwZSm+rVteFehK/zRAGeAoudIjLYpIipbGsKZuosTy9oMO
 xJWErfkELYng6yCFG78oGrP+H5pm/g++selJyq+NURwCUGz/HkipCpUFUJrFNKtCUYJ+
 MJTh3L1wZbnNLBDTydXNGnEHvA8SrVIFJYvi08zuC8HosOtLt5hKDzNx/MaSG7HcjL23
 SbjQ==
X-Gm-Message-State: AAQBX9eC3LX6pU7ZoEDrdCGziwl8P88dN6QBWM8cELwYs68ci9FvaZbw
 PACzKmo9kim1O6kgfIjN2ho0RXg3Vm4=
X-Google-Smtp-Source: AKy350YdU7qP4tBFqWVAJiivAblmNCnXdRCQFu60ob4m4TJL8g5SZDT0ZYc4RdPK2cbPhPtXmnnk3w==
X-Received: by 2002:a05:600c:292:b0:3f1:73ca:7807 with SMTP id
 18-20020a05600c029200b003f173ca7807mr1703037wmk.37.1681727939919; 
 Mon, 17 Apr 2023 03:38:59 -0700 (PDT)
Received: from localhost.localdomain
 (host-87-19-108-254.retail.telecomitalia.it. [87.19.108.254])
 by smtp.gmail.com with ESMTPSA id
 y12-20020a5d470c000000b002c70ce264bfsm10238018wrq.76.2023.04.17.03.38.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Apr 2023 03:38:59 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Matt Roper <matthew.d.roper@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] drm/i915: Replace kmap() with kmap_local_page()
Date: Mon, 17 Apr 2023 12:38:51 +0200
Message-Id: <20230417103854.23333-1-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Ira Weiny <ira.weiny@intel.com>,
 "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

kmap() has been deprecated in favor of kmap_local_page().

There are two main problems with kmap(): (1) It comes with an overhead as
mapping space is restricted and protected by a global lock for
synchronization and (2) it also requires global TLB invalidation when the
kmap’s pool wraps and it might block when the mapping space is fully
utilized until a slot becomes available.

With kmap_local_page() the mappings are per thread, CPU local, can take
page faults, and can be called from any context (including interrupts).

The tasks can be preempted and, when they are scheduled to run again, the
kernel virtual addresses are restored and so they are still valid.

Furthermore, kmap_local_page() is faster than kmap() in kernels with
HIGHMEM enabled.

Thread locality implies that the kernel virtual addresses returned by
kmap_local_page() are only valid in the context of the callers. This
constraint is never violated with the conversions in this series,
because the pointers are never handed to other threads, so the local
mappings are allowed and preferred.

Therefore, replace kmap() with kmap_local_page() in drm/i915/,
drm/i915/gem/, drm/i915/gt/.

Suggested-by: Ira Weiny <ira.weiny@intel.com>
Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>

v1->v2: Do some changes in the text of the cover letter and in the
commit messages. There are no changes in the code of any of the three
patches.

Fabio M. De Francesco (3):
  drm/i915: Replace kmap() with kmap_local_page()
  drm/i915/gt: Replace kmap() with kmap_local_page()
  drm/i915/gem: Replace kmap() with kmap_local_page()

 drivers/gpu/drm/i915/gem/i915_gem_shmem.c          |  6 ++----
 drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c |  8 ++++----
 drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c       |  4 ++--
 drivers/gpu/drm/i915/gt/shmem_utils.c              | 11 ++++-------
 drivers/gpu/drm/i915/i915_gem.c                    |  8 ++++----
 5 files changed, 16 insertions(+), 21 deletions(-)

--
2.40.0

