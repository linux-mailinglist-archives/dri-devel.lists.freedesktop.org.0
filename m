Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC77164C39
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2020 18:40:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C0586E840;
	Wed, 19 Feb 2020 17:40:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [IPv6:2607:f8b0:4864:20::72d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E27FD6E83B;
 Wed, 19 Feb 2020 17:40:03 +0000 (UTC)
Received: by mail-qk1-x72d.google.com with SMTP id z19so897384qkj.5;
 Wed, 19 Feb 2020 09:40:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VKf+ehgk2+nhcAIj54K+LuX0eS06Ow4t+1KGNuoyED8=;
 b=INd3ifF6fOql9yXrORjHDIG9pd6Gi+J3819DB0ZOzDp+BPU7cOYxyOs+GcmGrPbxOh
 /zYPJDfyVJJUD3JSVsU3Q13XeDb4tYWSBq39mAuWVzPx50QeKH3WDUDAgn/V2HhfHqDU
 uRXuOXv7Or+Cjux4v/wJcGXO3yeTBKwFAStqzRSPgfrMPmLoevh8c2xhDGPeuEcjPdxc
 AfcyBlqONAAs6oyV0xFUZS3CzkakzxQsDZtnUtpYkHHsiKdzowkjwacD/9jkpoSrtrUM
 bUthXIWGoPSb6Bial8Fib9/yn6dSq0B25y3Ffp+3NEurxL5jSd9ebpef+clpJQzEB65O
 hsgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VKf+ehgk2+nhcAIj54K+LuX0eS06Ow4t+1KGNuoyED8=;
 b=KJt+RE+7aLZ2ilkwPfjLhF4kHWcyJh+VIYH8jAAvQ9ichsXodsBAZYJ+WDTSvj0HEQ
 7st4PDuyfJcMpmGJxHve1Ps8GoNLZUTTHZpX/U3xff8ISIjRtJc79P/+ovy/59KBNpxK
 klamrdmKUhfKW+9RY+H4z7LLoQijnrCeN6u8PAYyfaBKEvKketztwiwbBEnq5Ju4wKR1
 opfqk4KrRPXMMJxnkVa8XZl0KT4NAudX3j0G7TuS4y6H5kFMFUOrmYS85+ycPGTBSdYt
 vri6AYH+o6fkmB+SQQ8cMj/pEEo9psReOy2BtkfHd7GN+h3MFhS42GmacJ0MM+HbyYLP
 Wulg==
X-Gm-Message-State: APjAAAWdKLDgWrFd06PF21ZUZFEol52qt09tGCFtWyOGVj4bjCUOfGKs
 CkCRQJMOp5CeBMBO+0Yrc7PWb69i
X-Google-Smtp-Source: APXvYqzLnQe23L1RqY5qB+VmERrBAtm0DlUWV2FW0tDWziCQtHndeIpa2RzrZ1a+92dr3ErGVRJSOw==
X-Received: by 2002:ae9:f205:: with SMTP id m5mr24992673qkg.152.1582134002745; 
 Wed, 19 Feb 2020 09:40:02 -0800 (PST)
Received: from localhost.localdomain ([71.219.59.120])
 by smtp.gmail.com with ESMTPSA id c21sm156624qkj.130.2020.02.19.09.40.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2020 09:40:01 -0800 (PST)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, daniel.vetter@ffwll.ch
Subject: [pull] amdgpu 5.6 fixes
Date: Wed, 19 Feb 2020 12:39:54 -0500
Message-Id: <20200219173954.3847-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.24.1
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave, Daniel,

Fixes for 5.6.

The following changes since commit 6f4134b30b6ee33e2fd4d602099e6c5e60d0351a:

  Merge tag 'drm-intel-next-fixes-2020-02-13' of git://anongit.freedesktop.org/drm/drm-intel into drm-fixes (2020-02-14 13:04:46 +1000)

are available in the Git repository at:

  git://people.freedesktop.org/~agd5f/linux tags/amd-drm-fixes-5.6-2020-02-19

for you to fetch changes up to 6c62ce8073daf27ae3fd03b6929d6cea3887eeb2:

  drm/amdgpu/display: clean up hdcp workqueue handling (2020-02-19 11:03:24 -0500)

----------------------------------------------------------------
amd-drm-fixes-5.6-2020-02-19:

amdgpu:
- HDCP fixes
- xclk fix for raven
- GFXOFF fixes

----------------------------------------------------------------
Alex Deucher (4):
      drm/amdgpu/soc15: fix xclk for raven
      drm/amdgpu/gfx9: disable gfxoff when reading rlc clock
      drm/amdgpu/gfx10: disable gfxoff when reading rlc clock
      drm/amdgpu/display: clean up hdcp workqueue handling

Bhawanpreet Lakha (2):
      drm/amd/display: fix backwards byte order in rx_caps.
      drm/amd/display: fix dtm unloading

Evan Quan (1):
      drm/amd/powerplay: always refetch the enabled features status on dpm enablement

changzhu (1):
      drm/amdgpu: add is_raven_kicker judgement for raven1

 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            | 26 +++++++++++++++++++++-
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             |  2 ++
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              | 13 +++++++++--
 drivers/gpu/drm/amd/amdgpu/soc15.c                 |  7 +++++-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  | 10 +++++----
 .../drm/amd/display/modules/hdcp/hdcp2_execution.c |  4 ++--
 drivers/gpu/drm/amd/powerplay/smu_v11_0.c          |  6 ++---
 7 files changed, 55 insertions(+), 13 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
