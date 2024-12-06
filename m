Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE4C79E7845
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2024 19:44:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89EA810E615;
	Fri,  6 Dec 2024 18:44:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mDR4C6HL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87BB210E615
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2024 18:44:42 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-aa55171d73cso648193966b.0
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Dec 2024 10:44:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733510681; x=1734115481; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=5eUIfs5ii7dkuEncNSc1PTsK8FFDpPMSw8oehCADsHA=;
 b=mDR4C6HLeDxU/tmhTIicON+d/hBArwi1S6XACyrC0gY2FPlG+RL0tJegc8Kq4BfIwQ
 m2zCu+UjRsQ2zF1H6DW+bzCYf1Ubzly9/CPUz+BTb7o0SaiDO0B0XiynbzInQ8urbFPc
 V7MLNg3P9/NC5AAVqZFAG9QAbh75XoBNRRfvciYmXoP8GfzkOYUWeQXGA0PwWpaR/BeH
 YA45j5GEus5uH/Dxm3gVWT3j7/3cg2fQ6moPsGJlzA4zxwB6nJxWLR3A7CxtFkJWtNCZ
 kPqh0IDjA6JQZbdrtpo7YzsZhxUCdWAhKuHGbC0beHkBdk5Z2AyJvU2q4pgvrq9p8D1a
 5yjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733510681; x=1734115481;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5eUIfs5ii7dkuEncNSc1PTsK8FFDpPMSw8oehCADsHA=;
 b=lS5YX231YgOkknQ4Nx5pcnokIKQt8iQZu41OoW/KGMIhYHFrc0WdEFDlrufQ6+KG9v
 vNaxYz81GSKnC/fBcq3ShhCfCGsIsTAUoHMptT1KemCsx6yqRGGP8HObcBiSJ6usoB5h
 gSRTHqWgT7XYuMZPyz6yrFSrs9ajU6OK9DzIV7KhnShc/+JOsXGluGUROs1uAVdoLhN2
 EF0Vv2uFf7eRZ7HFz0PyKLcS2Gz2NgREhkv3k+F8fpr3MP/QDRWd5IetouJi2U+yMoWE
 GKCMBZfITQvQQz8Fr514FAWSS6gcRG4XcYz3645wmv99GvZp1yB+j60V30wY4g0EHT8W
 t3wQ==
X-Gm-Message-State: AOJu0YxkKiFFeUq9BWmQSVF+iOozuagsbXJGU/Ln0KimCZJJrb+qF/VW
 GJM7tA+LRB2n9KnU2cgupk3Ba8R+0slnLOtTXH5sJz5SDtt51CmkBpC0J/Tc/50bGzG3HBg0ZKo
 90cnQRv9kj5YJ64XJ9NUGCnY1+gA=
X-Gm-Gg: ASbGnct44ymrP//kzShm/cRDojuE2nJsoPK5BUVYxeY9JGS8QUAPgG6wgxsF8yiqe2B
 fgt3O4nTGjixbzJ7F+A2+fm5BO1qokUuy/Q==
X-Google-Smtp-Source: AGHT+IFvv7yV58NYQZU1cy/7lUNiYbCS3JK73I0/vQef2sRbhNE0Y6QnsyMxYfkh7V/VbAsu49Heoy0XRzi/aaznGFY=
X-Received: by 2002:a17:906:32c2:b0:a9e:85f8:2a3a with SMTP id
 a640c23a62f3a-aa6373494a2mr442359166b.2.1733510680668; Fri, 06 Dec 2024
 10:44:40 -0800 (PST)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Sat, 7 Dec 2024 04:44:29 +1000
Message-ID: <CAPM=9typZWd9P_81asANhuE_F7a9j+k5auWhwwCn=xLDQ1mFdQ@mail.gmail.com>
Subject: [git pull] drm fixes for 6.13-rc2
To: Linus Torvalds <torvalds@linux-foundation.org>, Sima Vetter <sima@ffwll.ch>
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Hi Linus,

Pretty quiet week which is probably expected after US holidays, the
dma-fence and displayport MST message handling fixes make up the bulk
of this, along with a couple of minor xe and other driver fixes.

Dave.

drm-fixes-2024-12-07:
drm fixes for 6.13-rc2

dma-fence:
- Fix reference leak on fence-merge failure path
- Simplify fence merging with kernel's sort()
- Fix dma_fence_array_signaled() to ensure forward progress

dp_mst:
- Fix MST sideband message body length check
- Fix a bunch of locking/state handling with DP MST msgs

sti:
- Add __iomem for mixer_dbg_mxn()'s parameter

xe:
- Missing init value and 64-bit write-order check
- Fix a memory allocation issue causing lockdep violation

v3d:
- performance counter fix.
The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37=
:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2024-12-07

for you to fetch changes up to 471f3a21addd4e5f170ab1364f11c3e4823e687d:

  Merge tag 'drm-misc-fixes-2024-12-05' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-fixes
(2024-12-06 08:40:47 +1000)

----------------------------------------------------------------
drm fixes for 6.13-rc2

dma-fence:
- Fix reference leak on fence-merge failure path
- Simplify fence merging with kernel's sort()
- Fix dma_fence_array_signaled() to ensure forward progress

dp_mst:
- Fix MST sideband message body length check
- Fix a bunch of locking/state handling with DP MST msgs

sti:
- Add __iomem for mixer_dbg_mxn()'s parameter

xe:
- Missing init value and 64-bit write-order check
- Fix a memory allocation issue causing lockdep violation

v3d:
- performance counter fix.

----------------------------------------------------------------
Christian K=C3=B6nig (1):
      dma-buf: fix dma_fence_array_signaled v4

Dave Airlie (4):
      Merge tag 'drm-misc-fixes-2024-11-21' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-fixes
      Merge tag 'drm-misc-fixes-2024-11-28' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-fixes
      Merge tag 'drm-xe-fixes-2024-12-04' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes
      Merge tag 'drm-misc-fixes-2024-12-05' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-fixes

Imre Deak (8):
      drm/dp_mst: Fix MST sideband message body length check
      drm/dp_mst: Fix resetting msg rx state after topology removal
      drm/dp_mst: Verify request type in the corresponding down message rep=
ly
      drm/dp_mst: Simplify error path in drm_dp_mst_handle_down_rep()
      drm/dp_mst: Fix down request message timeout handling
      drm/dp_mst: Ensure mst_primary pointer is valid in
drm_dp_mst_handle_up_req()
      drm/dp_mst: Reset message rx state after OOM in drm_dp_mst_handle_up_=
req()
      drm/dp_mst: Use reset_msg_rx_state() instead of open coding it

John Harrison (1):
      drm/xe: Move the coredump registration to the worker thread

Ma=C3=ADra Canal (1):
      drm/v3d: Enable Performance Counters before clearing them

Pei Xiao (1):
      drm/sti: Add __iomem for mixer_dbg_mxn's parameter

Tvrtko Ursulin (2):
      dma-fence: Fix reference leak on fence merge failure path
      dma-fence: Use kernel's sort for merging fences

Zhanjun Dong (1):
      drm/xe/guc: Fix missing init value and add register order check

 drivers/dma-buf/dma-fence-array.c             |  28 +++++-
 drivers/dma-buf/dma-fence-unwrap.c            | 126 +++++++++++++---------=
----
 drivers/gpu/drm/display/drm_dp_mst_topology.c | 107 ++++++++++++++++++----
 drivers/gpu/drm/sti/sti_mixer.c               |   2 +-
 drivers/gpu/drm/v3d/v3d_perfmon.c             |   2 +-
 drivers/gpu/drm/xe/xe_devcoredump.c           |  73 ++++++++-------
 drivers/gpu/drm/xe/xe_guc_capture.c           |  77 +++++++++++++---
 include/drm/display/drm_dp_mst_helper.h       |   7 ++
 8 files changed, 285 insertions(+), 137 deletions(-)
