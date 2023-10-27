Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A11337D9E48
	for <lists+dri-devel@lfdr.de>; Fri, 27 Oct 2023 18:59:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 738D610EA15;
	Fri, 27 Oct 2023 16:59:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23DDC10E141;
 Fri, 27 Oct 2023 16:59:15 +0000 (UTC)
Received: by mail-pg1-x52b.google.com with SMTP id
 41be03b00d2f7-5a9bc2ec556so1850151a12.0; 
 Fri, 27 Oct 2023 09:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698425954; x=1699030754; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=l2XOiyO7ELntzgtLuOwOBKhVQExybEKPgHk4URVDgho=;
 b=FjFy+FOkCP9RMiPr369zyKzQ1BLB4JhIXhoRIKSHIzm0J6M5x/oq8tbctibYaN50Dp
 yiPjYbqP0WoWuycO9Z3Waw3ETGZl8p9D7kHwKTlS8BU841D1ZfybT+Gj6CRS9ibcj/xY
 ZFMOeTklBCn/EK96GnHX5Md5jfMlJ4WEe+yZWgsaPBhAWvTdCmj14BPalH1hGYboXWjR
 m3/qJtWLuhsWltsfkuRgN3UusznHbdTBWTzX1eO9LO1nVYb7u3zDwDfq/p8hW+TR8qXK
 /181Q74YuYiawQQ/GoPJEWcekgwUzMG6xSsUG0wcWvStDggvTeGL5RpImD9nCDsBRjcU
 Rfsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698425954; x=1699030754;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=l2XOiyO7ELntzgtLuOwOBKhVQExybEKPgHk4URVDgho=;
 b=BdRvSKw+zrFDBInmsv1/tdPX0ZN2Diwh+M+KQKeh+n9hoTTiwJGPNwMqiYBO2U13RK
 B2Al1rRx1ML7ZE9Se29O94g8oztGWis57Jzby1kPPzwjpjRUKAxUbWaObLyqckseKazq
 nFh8EkW8QqcuuAHgvknk8iCQrqS1D3n6MFOLz4L/fR4gRY3Gft/df9pzwVSm/Jc1MBKD
 wO/I1y1tn2/7uPR9ZKFZCamCkRCTd/vIlZTmABoDS/MWBikuj6JELNz/n4TznZAV+uYl
 pY+jTShMkW/0qsC8MokmGf+G4YUy/Ukwkm6d7FZD+AKZcv8Z0G2b9xNeQ9w0wH60KZBH
 Ep4g==
X-Gm-Message-State: AOJu0Yz/mYPD5eLw1tpQYSj9G51QqYiGIbW6LwVafq/RGgVg8lhmUQnZ
 3oF9u4d8cl9GPKA7EgC6cyJJuM9TZAc=
X-Google-Smtp-Source: AGHT+IGmj0N9Vkha046UwwcpchKPTTZ+UtBOMnjmz7YeYZi5yoFGRN7OlD9zVh2noyVB62tlU/Jayw==
X-Received: by 2002:a17:90a:1a0b:b0:280:1022:f00e with SMTP id
 11-20020a17090a1a0b00b002801022f00emr1807988pjk.29.1698425954002; 
 Fri, 27 Oct 2023 09:59:14 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:6c80:7c10:75a0:44f4])
 by smtp.gmail.com with ESMTPSA id
 s31-20020a17090a2f2200b0028017a2a8fasm733629pjd.3.2023.10.27.09.59.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Oct 2023 09:59:13 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/7] drm/msm/gem: drm_exec conversion
Date: Fri, 27 Oct 2023 09:58:34 -0700
Message-ID: <20231027165859.395638-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.41.0
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
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <nouveau@lists.freedesktop.org>, Mario Limonciello <mario.limonciello@amd.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Rob Clark <robdclark@chromium.org>, Guchun Chen <guchun.chen@amd.com>,
 Shashank Sharma <shashank.sharma@amd.com>,
 "open list:SUSPEND TO RAM" <linux-pm@vger.kernel.org>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 Dong Chenchen <dongchenchen2@huawei.com>, Luben Tuikov <luben.tuikov@amd.com>,
 Philip Yang <Philip.Yang@amd.com>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 linux-arm-msm@vger.kernel.org, James Zhu <James.Zhu@amd.com>,
 Sean Paul <sean@poorly.run>, Jack Xiao <Jack.Xiao@amd.com>,
 Jonathan Kim <jonathan.kim@amd.com>, freedreno@lists.freedesktop.org,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 open list <linux-kernel@vger.kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>, Lang Yu <Lang.Yu@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Simplify the exec path (removing a legacy optimization) and convert to
drm_exec.  One drm_exec patch to allow passing in the expected # of GEM
objects to avoid re-allocation.

I'd be a bit happier if I could avoid the extra objects table allocation
in drm_exec in the first place, but wasn't really happy with any of the
things I tried to get rid of that.

Rob Clark (7):
  drm/msm/gem: Remove "valid" tracking
  drm/msm/gem: Remove submit_unlock_unpin_bo()
  drm/msm/gem: Don't queue job to sched in error cases
  drm/msm/gem: Split out submit_unpin_objects() helper
  drm/msm/gem: Cleanup submit_cleanup_bo()
  drm/exec: Pass in initial # of objects
  drm/msm/gem: Convert to drm_exec

 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c  |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c |   4 +-
 drivers/gpu/drm/drm_exec.c              |  15 +-
 drivers/gpu/drm/msm/Kconfig             |   1 +
 drivers/gpu/drm/msm/msm_gem.h           |  13 +-
 drivers/gpu/drm/msm/msm_gem_submit.c    | 197 ++++++------------------
 drivers/gpu/drm/msm/msm_ringbuffer.c    |   3 +-
 drivers/gpu/drm/nouveau/nouveau_exec.c  |   2 +-
 drivers/gpu/drm/nouveau/nouveau_uvmm.c  |   2 +-
 include/drm/drm_exec.h                  |   2 +-
 12 files changed, 79 insertions(+), 170 deletions(-)

-- 
2.41.0

