Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C4E7824D72
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jan 2024 04:32:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3421110E033;
	Fri,  5 Jan 2024 03:32:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C27C810E033
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jan 2024 03:32:06 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a28b2e1a13fso131506066b.3
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Jan 2024 19:32:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704425525; x=1705030325; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=uLgzfsJfzUpir0OOLpo8gXDQBRiZZVIWNzCo/W91Qrc=;
 b=Sxgx4e3KFMdE+LnhYNesUx4mEEnBNj2+EYFfRB/0mm2tZGVALhSL/ZA0ZZ2qrh3VKe
 Tieh0mYfSSXC7L1essF/HyLbNkCRNB/vso3OlwtmSkOKzSAZrF41elkkOi5BWN9ergmK
 go4dI3h73SmK+JjUN51AmvTIOtT0OQyMssuttj0qVO6t45BVSEvSXgXGU8e9yoqXR19P
 5XJJzEPpV0lzPPMsDRTZBpOIt3+qIDBdIh46+VMFsc7vAXaU9lgbMrPTx1cLlFGWdzAx
 dwmUJtQCqjy1ysOjIRiJrqE/3H7KUj0yoeEOo5duZqYzV49pU5nfvi/3xzzhsrE5DUwT
 aakw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704425525; x=1705030325;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=uLgzfsJfzUpir0OOLpo8gXDQBRiZZVIWNzCo/W91Qrc=;
 b=wLmt3SO9TdWd0dqJKYfqY2l+RvL9kbP7JI4SjRrUDsdvEx9DYo7Cac1gA3VdmsAOoS
 oTLGgRthLtqqReaJ9B0MD5YzSSX+vulsKi1aBLbiwnD7TWc/JMBailwpMwNzyra58wLH
 XM+M/CKnmUp+R3D2NIzzipEfscY3soKyHCqLj8lwFnTEgNAmnTILg7x0B8mNBeeRjjVa
 dTFmVQyie+3c1/wh9LsAz8mRQEoQX9a6Jpg2KIKqOLR1f2iRIO6WxTjZjsLekVAn+cyP
 Vlx27ItXsDjmo3a9EHKE5akYCaIn2oVCLCI9nzZNH1s7gRqKpGqrws8hSNb5L9jS5ih2
 RvRQ==
X-Gm-Message-State: AOJu0YwMouxLXInlQJYw6D827KJAxTzFUe0mbRdO2WxvW1MaWbDqFiHz
 CBY8kFAuYQ8Mkqd8mIt7tCUZlaMO86CqMTShkMA=
X-Google-Smtp-Source: AGHT+IFRS5PhooTs2LmcpUrcBT7cRnQEGZtqWHsEBtVtCNUmHyByT9oZhvpp/SmjkBAa7wiFYN6iUUHXWCAoFIn+OeI=
X-Received: by 2002:a17:907:9706:b0:a28:e5eb:3f31 with SMTP id
 jg6-20020a170907970600b00a28e5eb3f31mr856881ejc.80.1704425524788; Thu, 04 Jan
 2024 19:32:04 -0800 (PST)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 5 Jan 2024 13:31:53 +1000
Message-ID: <CAPM=9txH-Rag6weAFHx_VgozGmLd4RinHCOzpGbyVsLT7qpcfA@mail.gmail.com>
Subject: [git pull] drm fixes (part2) for 6.7 final
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
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
Cc: LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Linus,

Hopefully I got the version numbers right this time. This is the final
set of fixes I think, some amdgpu and nouveau.

Since I suspect this is a bit larger than you might be comfortable
with, I'll give some more info:

The amdgpu ones are fairly normal, the one that is a bit large is a
fix for a newly introduced IP in 6.7 so unlikely to cause regressions.

The nouveau ones are mostly memory leaks and debugging cleanups from
the GSP (new nvidia firmware) enablement. There are some GSP changes
to the message passing code and a subsequent fix for eDP panel turn
on, that means my laptop can turn on the panel in GSP mode. These are
fairly low chance of disrupting things since GSP is new in 6.7. The
final not all in GSP fix is a deadlock seen with i915/nouveau when GSP
is used where the the fence and irq paths have locking inversions,
I've pushed some irq enablement out to a workqueue, and this has seen
some fairly decent testing.

Dave.

drm-fixes-2024-01-05:
drm fixes for 6.7 final (part 2 - correct version)

amdgpu:
- DP MST fix
- SMU 13.0.6 fixes
- Fix displays on macbooks using vega12
- Fix VSC and colorimetry on DP/eDP

nouveau:
- fix deadlock between fence signalling and irq paths
- fix GSP memory leaks
- fix GSP leftover debug
- hide some GSP callback messages
- fix GSP display disable path
- fix GSP ACPI interaction
- handle errors in ctrl messages
- use errors info to fix DP link training
The following changes since commit faa21f4c20960fee268bdb0fe977ed0edb6685fe:

  Merge tag 'drm-misc-fixes-2024-01-03' of
git://anongit.freedesktop.org/drm/drm-misc into drm-fixes (2024-01-04
11:18:32 +1000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2024-01-05

for you to fetch changes up to eb284f4b37817d2038fdfe1a9d51769730ab7b5f:

  drm/nouveau/dp: Honor GSP link training retry timeouts (2024-01-05
12:27:53 +1000)

----------------------------------------------------------------
drm fixes for 6.7 final (part 2 - correct version)

amdgpu:
- DP MST fix
- SMU 13.0.6 fixes
- Fix displays on macbooks using vega12
- Fix VSC and colorimetry on DP/eDP

nouveau:
- fix deadlock between fence signalling and irq paths
- fix GSP memory leaks
- fix GSP leftover debug
- hide some GSP callback messages
- fix GSP display disable path
- fix GSP ACPI interaction
- handle errors in ctrl messages
- use errors info to fix DP link training

----------------------------------------------------------------
Alex Deucher (2):
      drm/amd/display: add nv12 bounding box
      drm/amdgpu: skip gpu_info fw loading on navi12

Asad Kamal (5):
      drm/amd/pm: Use separate metric table for APU
      drm/amd/pm: Update metric table for jpeg/vcn data
      drm/amd/pm: Add mem_busy_percent for GCv9.4.3 apu
      drm/amd/pm: Add gpu_metrics_v1_5
      drm/amd/pm: Use gpu_metrics_v1_5 for SMUv13.0.6

Dave Airlie (10):
      Merge tag 'amd-drm-fixes-6.7-2024-01-04' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes
      nouveau/gsp: add three notifier callbacks that we see in normal
operation (v2)
      nouveau/gsp: drop some acpi related debug
      nouveau: fix disp disabling with GSP
      nouveau/gsp: free acpi object after use
      nouveau/gsp: free userd allocation.
      nouveau/gsp: convert gsp errors to generic errors
      nouveau/gsp: don't free ctrl messages on errors
      nouveau/gsp: always free the alloc messages on r535
      nouveau: push event block/allowing out of the fence context

Joshua Ashton (1):
      drm/amd/display: Fix sending VSC (+ colorimetry) packets for
DP/eDP displays without PSR

Lyude Paul (2):
      drm/nouveau/gsp: Fix ACPI MXDM/MXDS method invocations
      drm/nouveau/dp: Honor GSP link training retry timeouts

Wayne Lin (1):
      drm/amd/display: pbn_div need be updated for hotplug event

 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  11 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  11 +-
 .../gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c   | 110 ++++++++++++-
 .../amd/display/modules/info_packet/info_packet.c  |  13 +-
 drivers/gpu/drm/amd/include/kgd_pp_interface.h     |  80 ++++++++++
 drivers/gpu/drm/amd/pm/amdgpu_pm.c                 |   4 +-
 .../amd/pm/swsmu/inc/pmfw_if/smu_v13_0_6_pmfw.h    | 100 +++++++++++-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c   | 153 ++++++++++--------
 drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c             |   3 +
 drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h  |  17 +-
 drivers/gpu/drm/nouveau/nouveau_fence.c            |  28 +++-
 drivers/gpu/drm/nouveau/nouveau_fence.h            |   5 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/base.c    |   6 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c    | 171 +++++++++++++--------
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/r535.c    |   1 +
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c     |  86 +++++++----
 16 files changed, 603 insertions(+), 196 deletions(-)
