Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0344C2113C6
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jul 2020 21:44:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E51D6E326;
	Wed,  1 Jul 2020 19:44:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com
 [IPv6:2607:f8b0:4864:20::f33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACA236E326;
 Wed,  1 Jul 2020 19:44:24 +0000 (UTC)
Received: by mail-qv1-xf33.google.com with SMTP id t7so11563907qvl.8;
 Wed, 01 Jul 2020 12:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=H68WCJrZrfATgq2+qOSb/oN+5CurPVefjmJCzGslDNU=;
 b=psWK/tl+7p6/j0chpXN8DWN1qNvWmr1gzBpbSVFsgD+0IB/bEiZXxYZUyK4FqFhdq/
 2YxzwZgZpLfWaUusAcuDgSiNnZoJMI1gz8NNospB7kw6eO3NCFPBxSVRMb0YYaAEJ/Pi
 NiIcX4WMBEtAnMWrbj3AnkWW26ItyDNzQYR/JDreAJT1sb/8z8+i/qPkYNwcoL4CB5Z/
 GFkRFY5tJlODopbEt4JyI4MWu11II3TaEpViPjbpU0Z89Eamxz0/IOq2psg3Tg/JwWTH
 NTtxl62AXMX74yqJEaWCb48bB4bQE+jtbEORp8HbE1/s4Uz7NmRumNnVxLCD9uvl5rEu
 qE+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=H68WCJrZrfATgq2+qOSb/oN+5CurPVefjmJCzGslDNU=;
 b=FuZa0Q08m0e6kkNMadWJ+FEpY/ygJ0G6TSeMoXj1+NQQqS7kMs4Zm8vVodEHj1Utjb
 nLrH13f+IfGQ+7U6H+PWvO23X9gLFSiy6BLveiRmuo8OfIfB7xASewGBJFPDQTAGgSIw
 utGDoadYg6IQfzZCEVIgL34oH6IqKC4dZaCP6YLYRjWms/7plsLZHEdizg099XBfZGiI
 H2YmfsJdyY1OaqeUCw4NoRbuj54kcvCd3dWg2m9wUuJDVDeSe7y7ro3CRMbUGAZMKi2D
 7vesQB1mDyQM2q8BN+3slWUMvPulyeOEnYtmxCfwIgjIUD7CS4bmfpS5sIHTG3rR2W4V
 okYQ==
X-Gm-Message-State: AOAM532U6Oc0zSv3VVP7GoOZfPU0lPwhRJnbYLUcbkeKWkrbxbbtiX5G
 YVoHzFfl0kX4KTd6/eVQ8fakal/U
X-Google-Smtp-Source: ABdhPJwVw5vfZtLZIxQYOFnMxAsuguf99mWbMrXlItob7i4tn8GksmxER2L3WjXu9GlMV4vzrS8B2g==
X-Received: by 2002:a0c:f214:: with SMTP id h20mr26292141qvk.131.1593632663314; 
 Wed, 01 Jul 2020 12:44:23 -0700 (PDT)
Received: from localhost.localdomain ([71.51.183.177])
 by smtp.gmail.com with ESMTPSA id e25sm6205995qtc.93.2020.07.01.12.44.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jul 2020 12:44:22 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, daniel.vetter@ffwll.ch
Subject: [pull] amdgpu drm-fixes-5.8
Date: Wed,  1 Jul 2020 15:44:15 -0400
Message-Id: <20200701194415.4065-1-alexander.deucher@amd.com>
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

Fixes for 5.8.

The following changes since commit 5b83c254571b26e6b6110019929dc9729e5c59d1:

  Merge tag 'amd-drm-fixes-5.8-2020-06-24' of git://people.freedesktop.org/~agd5f/linux into drm-fixes (2020-06-25 14:51:14 +1000)

are available in the Git repository at:

  git://people.freedesktop.org/~agd5f/linux tags/amd-drm-fixes-5.8-2020-07-01

for you to fetch changes up to beaf10efca64ac824240838ab1f054dfbefab5e6:

  drm/amdgpu: use %u rather than %d for sclk/mclk (2020-07-01 14:20:23 -0400)

----------------------------------------------------------------
amd-drm-fixes-5.8-2020-07-01:

amdgpu:
- Fix for vega20 boards without RAS support
- DC bandwidth revalidation fix
- Fix Renoir vram info fetching
- Fix hwmon freq printing

----------------------------------------------------------------
Alex Deucher (2):
      drm/amdgpu/atomfirmware: fix vram_info fetching for renoir
      drm/amdgpu: use %u rather than %d for sclk/mclk

Ivan Mironov (1):
      drm/amd/powerplay: Fix NULL dereference in lock_bus() on Vega20 w/o RAS

Nicholas Kazlauskas (1):
      drm/amd/display: Only revalidate bandwidth on medium and fast updates

 drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c     |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c               |  4 ++--
 drivers/gpu/drm/amd/display/dc/core/dc.c             | 10 ++++++----
 drivers/gpu/drm/amd/powerplay/smumgr/vega20_smumgr.c | 11 +++++++----
 4 files changed, 16 insertions(+), 10 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
