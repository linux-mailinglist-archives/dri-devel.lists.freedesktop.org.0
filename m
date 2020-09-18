Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC1A526FE32
	for <lists+dri-devel@lfdr.de>; Fri, 18 Sep 2020 15:25:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED3126ECF1;
	Fri, 18 Sep 2020 13:25:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99C866E182
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Sep 2020 13:25:12 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id k15so5609180wrn.10
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Sep 2020 06:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UBx1PEmn0W4aDiCsFb5YFigHJoHIwLLzOZ1tXmUxyJc=;
 b=G7OaI49UWbNUKXHTKQeo5alyNmun03V6bN+GnHogC+Ep7LFe1X2G4zGD/dhLy1SgRu
 gW9EvNLJGZiorbCOUuBCvgz4sw0q9XlemKqMrCrjV0FzRw7LajzE5RerIUud29d4RSvR
 QSyz3t3+hPmRBcFwvSizUKafcAbYNNiIWOCMU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UBx1PEmn0W4aDiCsFb5YFigHJoHIwLLzOZ1tXmUxyJc=;
 b=Y+t0WLqFoaftZHgaAkEcnSJYWvfi+uuLPDfTjtfaRIbdmbdg5unlAYlOmUu46/dRbc
 bpDRG16nKAGnXP5YOpunqQKEF86tcmhZTHqDPjMoKFEHKJ3fbtQZynZipl0jFaAtbNAB
 KEv5tpmXxBOc716dnLYkFnS/BfZf24s2lc3xOoEaoBYQcFMxILXAFFa59ttYBhTABoFg
 hqI+sZ5D9vo3UoR/KV+zECmOQYOr4LrZyo7o6ulPAcs93geweLF6exkvE3j268Wf+ewc
 b0g1bqB/QzaVGx2NkQ871DIybmLE5OLtwQfyvyfR9J+mMHFeVzfh23XBZLbXyjkOVvnN
 BtnQ==
X-Gm-Message-State: AOAM532gNjsNHGuHiolKuDEcbiTZmsfiteP3105xm45V9DtLpV0cv+2d
 yv17UYuuOcVu0XC1295Ou7mnCUPe+irMqxs8
X-Google-Smtp-Source: ABdhPJzi29RcoloJdDY7B+Pk6hmy9TeacocMO63nWs80KfgVLp4l18Ve5k6EzSNBv5IQwFlhykY9/Q==
X-Received: by 2002:adf:e6c2:: with SMTP id y2mr40238845wrm.117.1600435510935; 
 Fri, 18 Sep 2020 06:25:10 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id k6sm4872693wmi.1.2020.09.18.06.25.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Sep 2020 06:25:10 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 0/4] managed drm_device, absolute final leftover bits
Date: Fri, 18 Sep 2020 15:25:01 +0200
Message-Id: <20200918132505.2316382-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.28.0
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,

These are the leftovers of the leftovers of my initial drmm series to
manage drm_device.

Changes:
- bugfixed i915 selftests
- patch from Luben to finalize the admgpu conversion

Alex & i915 maintainers, pls ack for merging this all through
drm-misc-next since otherwise the final patch (and the resulting confusion
with outdated docs) is held up another round.

Cheers, Daniel

Daniel Vetter (3):
  drm/i915/selftest: Create mock_destroy_device
  drm/i915/selftests: align more to real device lifetimes
  drm/dev: Remove drm_dev_init

Luben Tuikov (1):
  drm/amdgpu: Convert to using devm_drm_dev_alloc() (v2)

 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       | 16 ++----
 drivers/gpu/drm/drm_drv.c                     | 41 ++--------------
 drivers/gpu/drm/drm_internal.h                |  1 +
 drivers/gpu/drm/drm_managed.c                 | 13 -----
 .../gpu/drm/i915/gem/selftests/huge_pages.c   |  2 +-
 .../drm/i915/gem/selftests/i915_gem_context.c |  2 +-
 .../drm/i915/gem/selftests/i915_gem_dmabuf.c  |  2 +-
 .../drm/i915/gem/selftests/i915_gem_object.c  |  2 +-
 .../drm/i915/gem/selftests/i915_gem_phys.c    |  2 +-
 drivers/gpu/drm/i915/gt/selftest_timeline.c   |  2 +-
 .../gpu/drm/i915/selftests/i915_gem_evict.c   |  2 +-
 drivers/gpu/drm/i915/selftests/i915_gem_gtt.c |  2 +-
 drivers/gpu/drm/i915/selftests/i915_request.c |  2 +-
 drivers/gpu/drm/i915/selftests/i915_vma.c     |  2 +-
 .../drm/i915/selftests/intel_memory_region.c  |  2 +-
 .../gpu/drm/i915/selftests/mock_gem_device.c  | 49 ++++++++++++-------
 .../gpu/drm/i915/selftests/mock_gem_device.h  |  2 +
 include/drm/drm_drv.h                         |  4 --
 18 files changed, 51 insertions(+), 97 deletions(-)

-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
