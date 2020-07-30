Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA8172335C6
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jul 2020 17:43:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFCF06E252;
	Thu, 30 Jul 2020 15:43:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com
 [IPv6:2607:f8b0:4864:20::f33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E2C56E252;
 Thu, 30 Jul 2020 15:43:47 +0000 (UTC)
Received: by mail-qv1-xf33.google.com with SMTP id ed14so12722158qvb.2;
 Thu, 30 Jul 2020 08:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GGtn+9FRRx4esxmCQlQJunLc1pE2sFOR8/641oCp1go=;
 b=nCbvWF+kldZwwXBB8w8N5pzdtBobVM/M9GIBi/A+1CENZv8g6b4ryAXw5ZvyeQVGgt
 vPUezqjb0MCER2DCIwrEau22A7pbS+dJdxegAXJ2k3msho1W/I9K8xB2ZTgqd1w3RiWF
 IZcMpzJX0nOrBa/eX/8JB4HWoBEG0vuAcxYqtEhSj4PcOrefw3YonyLDwnoE+XQOfLP8
 4rT5yI/+yt9t49vuNJR9UDpYKDm8p/Xc5d9++dtFNRRGOTUduQgGQ+eO6eeTuvUUwlkp
 y9FH4vfmNM6qluWdY8zlo1dtMzVaRWQjvbs//pERaIWWjbZWO28MjSv/9icOHOhpjNLc
 p2/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GGtn+9FRRx4esxmCQlQJunLc1pE2sFOR8/641oCp1go=;
 b=jPCePjX7rzWafBCbj3kUmqX4TQ9UzJY+ZjoecL99QS2HjXbaCtDCrXHKQC9hpO4Jhr
 kS+BWakj9TvDDDxeFpKTYYNLNhQtIrTMCMq3O9XLuTCIPXh5oH0ctKsXjoEci0IxjwND
 THdTrENIdUbKk5P4PsZjRF5Qs8xghRG6SgB/6LjWutoczU4HgDx9gImLSXlTtc09EbDY
 e1aafe/sT2YdkZaAaQaZT6HRY4Ng7cLFt2CRDr+Dbs2n/bFyBmbvrEHEciHwLF6Va3RV
 RRpQg200x7BP5hpQNcet1NxzxGGqP4I+kx6Jwshp2fVz9lEelJqkeF9Tp35sqHF2yDNh
 zQcg==
X-Gm-Message-State: AOAM532MFkBB/0qa7URO4KeYwvi2GFPzc0FBZg39KWRPQtvw86GjUfab
 2nXkLnktcQj1KSj6h2/VgYYzd4i/
X-Google-Smtp-Source: ABdhPJwfYML7cuwfMoOweh+NKEzy2vE30bd47OWWZ2CbgwAqC7pPyk7X+nUKWIGJ6J+EEpYDoRTVBw==
X-Received: by 2002:ad4:414b:: with SMTP id z11mr143319qvp.116.1596123826039; 
 Thu, 30 Jul 2020 08:43:46 -0700 (PDT)
Received: from localhost.localdomain ([71.219.66.138])
 by smtp.gmail.com with ESMTPSA id h23sm4394916qkl.38.2020.07.30.08.43.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jul 2020 08:43:45 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, daniel.vetter@ffwll.ch
Subject: [pull] amdgpu drm-fixes-5.8 (take 2)
Date: Thu, 30 Jul 2020 11:43:38 -0400
Message-Id: <20200730154338.244104-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.25.4
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

A few fixes for 5.8.  It would be nice to get these in for 5.8 final.  Take
2 just reverts the original fix because the fix for the fix seems to cause
other problems.

The following changes since commit a4a2739beb8933a19281bca077fdb852598803ed:

  Merge tag 'drm-misc-fixes-2020-07-28' of git://anongit.freedesktop.org/drm/drm-misc into drm-fixes (2020-07-29 12:46:58 +1000)

are available in the Git repository at:

  git://people.freedesktop.org/~agd5f/linux tags/amd-drm-fixes-5.8-2020-07-30

for you to fetch changes up to 87004abfbc27261edd15716515d89ab42198b405:

  Revert "drm/amdgpu: Fix NULL dereference in dpm sysfs handlers" (2020-07-30 11:03:28 -0400)

----------------------------------------------------------------
amd-drm-fixes-5.8-2020-07-30:

amdgpu:
- Revert a fix which caused other regressions
- Fix potential kernel info leak
- Fix a use-after-free bug that was uncovered by another change in 5.7

----------------------------------------------------------------
Alex Deucher (1):
      Revert "drm/amdgpu: Fix NULL dereference in dpm sysfs handlers"

Mazin Rezk (1):
      drm/amd/display: Clear dm_state for fast updates

Peilin Ye (1):
      drm/amdgpu: Prevent kernel-infoleak in amdgpu_info_ioctl()

 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c           |  3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c            |  9 ++++--
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 36 +++++++++++++++++------
 3 files changed, 35 insertions(+), 13 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
