Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A66E6F3604
	for <lists+dri-devel@lfdr.de>; Mon,  1 May 2023 20:45:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98B7D10E256;
	Mon,  1 May 2023 18:45:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DEDE10E1DF;
 Mon,  1 May 2023 18:45:08 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id
 98e67ed59e1d1-24ded4b33d7so1210469a91.3; 
 Mon, 01 May 2023 11:45:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682966708; x=1685558708;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=l4TtnDaucJ1/IdFz7cgpnnbthTRQAkVtjilDPnFIRFQ=;
 b=W9VggSOnJQ/2lFEqhx94aKQ83hIbovdIhoKb7OiLLzq75wkWPswXIcRqrzXxm2NApG
 pB27DUyrbrhmVkZrrMX4YHlRzVF4tGS68nJ8Ejm8/BroZ+7hMHJuWQDTjuahOxhawRX2
 R16bnE4Y30VLSXXwBMvtqz8tiD2ZXfTrhNCDBskt/ZknqAIGxoIei8hIn2gsyuOvFZJT
 gcvTDoUkwne1R9te7FHSfKEIs+OMrGDJPRnXrfVYvm9LGAlMfDrZKhf3rH0KGi67d7/N
 6nggw95HVE442Z2Z2BWGqs5xyzseMQ8dW3H1P1Jmk/kb8zbLKv3rSGLZgQP6m91kkrJp
 zt+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682966708; x=1685558708;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=l4TtnDaucJ1/IdFz7cgpnnbthTRQAkVtjilDPnFIRFQ=;
 b=WfIAoLVJz3LHAlNBflp9RjvS/kJrRJqAi3CksJm/nYks50QJhpto0xTeLrucyn/CO/
 h/VQQMItItOg+N5O7azivyxRb3XtRKyXDVB5PqknsBM6/2Z3OKQb7QfGxiraDcbTrO6W
 AhgDN6ybm/tvk8vdGHxWsBBnXxKvi/7moSYxTdIaGaLEYVHDnnRq2889xaoXY48+vqN+
 xf4x1KvJHP80BQXhtSlw8xD9xbbCfXiGgoliWQyIPV1lNCd7LiP2HnxubdphpqbBpLpL
 U+lXgNVsn2oZCGtofFV1cj6dftkNYR/ksnK1AcqVwrGhuU4qA4WOFP5W6xtkYXtHZTYx
 gMDA==
X-Gm-Message-State: AC+VfDwzG6Pi65iy+g6sUMXMXLgi+BjqJGx1aiSoo90wYr8UQsk/utdw
 k1d7h7KlUOE6t0c4nht470kU2geOHuU=
X-Google-Smtp-Source: ACHHUZ5eAVBIqpAYEQNPFjADJrF0hyhOUOXr1qE6lR8ApK2ME+3UgTkS6x8bvceg5F1jcgxm+mDnDg==
X-Received: by 2002:a17:90a:bd98:b0:23d:16d6:2f05 with SMTP id
 z24-20020a17090abd9800b0023d16d62f05mr14722184pjr.22.1682966707721; 
 Mon, 01 May 2023 11:45:07 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:61b:48ed:72ab:435b])
 by smtp.gmail.com with ESMTPSA id
 9-20020a17090a0f0900b0024c1f1cdf98sm6413617pjy.13.2023.05.01.11.45.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 May 2023 11:45:07 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 0/9] drm: fdinfo memory stats
Date: Mon,  1 May 2023 11:44:46 -0700
Message-Id: <20230501184502.1620335-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.39.2
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
Cc: "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <mdaenzer@redhat.com>,
 YiPeng Chai <YiPeng.Chai@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Rob Clark <robdclark@chromium.org>, Guchun Chen <guchun.chen@amd.com>,
 Shashank Sharma <shashank.sharma@amd.com>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 =?UTF-8?q?Marek=20Ol=C5=A1=C3=A1k?= <marek.olsak@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sean Paul <sean@poorly.run>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Elliot Berman <quic_eberman@quicinc.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Maximilian Luz <luzmaximilian@gmail.com>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Christopher Healy <healych@amazon.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Similar motivation to other similar recent attempt[1].  But with an
attempt to have some shared code for this.  As well as documentation.

It is probably a bit UMA-centric, I guess devices with VRAM might want
some placement stats as well.  But this seems like a reasonable start.

Basic gputop support: https://patchwork.freedesktop.org/series/116236/
And already nvtop support: https://github.com/Syllo/nvtop/pull/204

I've combined the separate series to add comm/cmdline override onto
the end of this, simply out of convenience (they would otherwise
conflict in a bunch of places).

v2: Extend things to allow for multiple regions other than just system
    "memory", make drm_show_memory_stats() a helper so that, drivers
    can use it or not based on their needs (but in either case, re-
    use drm_print_memory_stats()
v3: Docs fixes

[1] https://patchwork.freedesktop.org/series/112397/

Rob Clark (9):
  drm/docs: Fix usage stats typos
  drm: Add common fdinfo helper
  drm/msm: Switch to fdinfo helper
  drm/amdgpu: Switch to fdinfo helper
  drm: Add fdinfo memory stats
  drm/msm: Add memory stats to fdinfo
  drm/doc: Relax fdinfo string constraints
  drm/fdinfo: Add comm/cmdline override fields
  drm/msm: Wire up comm/cmdline override for fdinfo

 Documentation/gpu/drm-usage-stats.rst      | 101 ++++++++++----
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c    |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c |  16 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.h |   2 +-
 drivers/gpu/drm/drm_file.c                 | 147 +++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.c    |  24 +++-
 drivers/gpu/drm/msm/msm_drv.c              |  15 ++-
 drivers/gpu/drm/msm/msm_gem.c              |  15 +++
 drivers/gpu/drm/msm/msm_gpu.c              |   2 -
 drivers/gpu/drm/msm/msm_gpu.h              |  10 ++
 include/drm/drm_drv.h                      |   7 +
 include/drm/drm_file.h                     |  51 +++++++
 include/drm/drm_gem.h                      |  30 +++++
 13 files changed, 376 insertions(+), 47 deletions(-)

-- 
2.39.2

