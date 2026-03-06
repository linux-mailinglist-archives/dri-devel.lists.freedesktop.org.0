Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gF5vOYI5q2nZbAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 21:30:58 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BFDA22783A
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 21:30:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B25810E3F3;
	Fri,  6 Mar 2026 20:30:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jcvF+0Z/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com
 [209.85.219.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29D8610E3F3
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2026 20:30:55 +0000 (UTC)
Received: by mail-qv1-f47.google.com with SMTP id
 6a1803df08f44-89a0b376fedso30264136d6.0
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Mar 2026 12:30:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772829054; cv=none;
 d=google.com; s=arc-20240605;
 b=XDPMDJVUBgUs1queUael4/0VoIz638PDWBUcA9cSdhSy9VoKoDkpa0fodkjeWzr5l+
 t+WGUODfRZGJCVXItDHtmCftKisRV8KFOR5A5pDbZ8zXpPKolxHVcUBlKhlZlc0gCoZe
 3kuwzW+jy8ZrAnTrSVs7FUXpiH/TAOVmOO+sMKETMmLhZ8kqgyYcts49PSqIh4BOdl1i
 3pHoojWWFNfDtTaNteRsGljlc32jk9D03o0a0oPFWD3JDClSteUjjbNh7qqfUB2lbnnz
 VlYZNN+f1RVIb+feBTiTUPwSCOzKLXJB+EAWVa+UD3RTvdDwsxDuje+yTH/72HNFQnfu
 yqTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:dkim-signature;
 bh=WeGel/2pLjS77XVDYcSL+rBc57ChAiNKClX6qeWc3l4=;
 fh=HQwGS/tgfrjuEQ8NZOhWLiLZo088fJVbEezIgNGsHOo=;
 b=FfDTK0cMy8YyH/j+ksYirmIQE+rkAHGk31NImiqYEM5VVLzQapdqStJbwwFi8oqYx3
 OACW3rKvOT/QnTUiDds4vytujvzVAzNOTEEauWHkWZylAr9rFHnLGYZwm5s6AJQKCdTR
 nzdLrOJl2gOL3vpyQ/d8zHwMum+EyxzEuL09AojieG59peVTUlmNUfNJyS6/jthadIs3
 gz+8Y/JBgwzheT+i1d5xoJhUVMsXClTPoM6ESlfiRil5BLFIZKD6FLDIEky9OOzk/NKd
 /Yn6D2V6J1nipuwoK7fuWq4uAzd8UbXMgmOgvRc1LbPA5SqTySoNNWTOjVBJ4rivqcmV
 LtfQ==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772829054; x=1773433854; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=WeGel/2pLjS77XVDYcSL+rBc57ChAiNKClX6qeWc3l4=;
 b=jcvF+0Z/66vhImsBJaMPWi9Kl/YuaneX8Y4pgm7RL3OHU33/ehpgoMsp2gHcNyqvTR
 T82OLL66rlnGt3UZi3pcWu/+RYSdYP49daPnj/APRMtaHIKG5SDSPFYOMV91Gfyi8Ve/
 H+E1h6Mm7Eq2hPSTLQFkvK1dbMTX0huDA4t9iVCA6HiTbB5loD8T2v2r+Wn0OAEMVwGR
 b/XFpH7z2dIETeV6ecudYfJTPPGPg9sf0WMCyHR0OVcWMF3KbqEXnAhvWvSiblG2EYQ/
 nPnNvel0TCfCvbVEWzViod2CBXKyBpdlih7Wr0lX3ejW7SSygLFyGyKfRam+2894Vag5
 IbBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772829054; x=1773433854;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WeGel/2pLjS77XVDYcSL+rBc57ChAiNKClX6qeWc3l4=;
 b=cxBVQh/OFbcvSgaW9zziooM7qhIPjR8GU4poPq1SPlZXyOY4I3wrU8fWD7IY7/E+2A
 YuggLmQXiq19+Y2FQQWA1YEGI++cv/z+c2wUUye8DBCW9pdsIp9Siz1NwaSr55S9Jl8N
 XXiP/vutzLy+xL6SD9UBUDrwUFGz7I7LMrJqoNsJmKrwvL6CN5zL9BsvaD70+xLejjc3
 4VBUqQ04EliZ96YBj9yeF9Nq3oa4PLleD3loOswbvQfvMb7M87wEB8h+ZZsW59UzTF3w
 gNYQ/Ea5ctA65p0DiXcXk7TNCiOGXgyw805fQWWb2Bu7lZxO9c6rR/Q7VwV7olSHW3LX
 SZJA==
X-Gm-Message-State: AOJu0YyFS9zXnVQVCGdK5P/fgO0vLa9RMGSrvzEbMks8VV5wInzEDJu1
 i9UXFxIM4Frp2x5uaYg+x1DGO4SZ25R2j0/Ngf9Xy76QmpY+vbRRqNqRqKHyhKIGMAGj4AJpUgX
 JrHLUGHhQuqnryll56h4YmL6t7SqAk90=
X-Gm-Gg: ATEYQzwIG9Q7hhTk3CVRubP8tIgZH17n+sO1cVok8paKsWUK5iFElrtneMHZAcV6F0W
 dMYkNx2eon1fyW1+kkqKCqcAQL32sT20avOjmR6DSjZLHEsqX/c9hTREsNxWJl8tesuOm1EM9MN
 bCVXzctt9OVVzH4OWR7sNbWUlPyplaARkMZJtLkmcuIRbr5gPmJO9POFLXDQyoXwCMK1w8uaxVg
 M/qi+gnX1nBQrSVaFAMzK3JMJsdR66pQz6myxJ8AftPPWU9/tcSr0qr8OMzZvc9fANOsrygVUQq
 JEu9sleBdanh/v70+wmdnwcAUDK+e3T3faKsTtp2DeVzjeXR1eJdofTrhT5hyu3OxTY=
X-Received: by 2002:a05:6214:c67:b0:89a:1c81:65c2 with SMTP id
 6a1803df08f44-89a30a18a1fmr51920146d6.5.1772829053713; Fri, 06 Mar 2026
 12:30:53 -0800 (PST)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Sat, 7 Mar 2026 06:30:41 +1000
X-Gm-Features: AaiRm50Zv6MmdJlHNR0Kq23VyYzd0XWwtrCcLfLGKKDJB2s06PupDNKerc3VF4g
Message-ID: <CAPM=9txfLEdF+faNUOP6_DWyKV9TnRCMGEbfA+ppnc6FJEJkMQ@mail.gmail.com>
Subject: [git pull] drm fixes for 7.0-rc3
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
X-Rspamd-Queue-Id: 5BFDA22783A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[airlied@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:torvalds@linux-foundation.org,m:sima@ffwll.ch,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.983];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[airlied@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.freedesktop.org:url]
X-Rspamd-Action: no action

Hi Linus,

Weekly fixes pull. There is one mm fix in here for a HMM livelock
triggered by the xe driver tests. Otherwise it's a pretty wide range
of fixes across the board, ttm UAF regression fix, amdgpu fixes,
nouveau doesn't crash my laptop anymore fix, and a fair bit of misc.
Seems about right for rc3.

Regards,
Dave.

drm-fixes-2026-03-07:
drm fixes for 7.0-rc3

mm:
- mm: Fix a hmm_range_fault() livelock / starvation problem

pagemap:
- Revert "drm/pagemap: Disable device-to-device migration"

ttm:
- fix function return breaking reclaim
- fix build failure on PREEMPT_RT
- fix bo->resource UAF

dma-buf:
- include ioctl.h in uapi header

sched:
- fix kernel doc warning

amdgpu:
- LUT fixes
- VCN5 fix
- Dispclk fix
- SMU 13.x fix
- Fix race in VM acquire
- PSP 15.x fix
- UserQ fix

amdxdna:
- fix invalid payload for failed command
- fix NULL ptr dereference
- fix major fw version check
- avoid inconsistent fw state on error

i915/display:
- Fix for Lenovo T14 G7 display not refreshing

xe:
- Do not preempt fence signaling CS instructions
- Some leak and finalization fixes
- Workaround fix

nouveau:
- avoid runtime suspend oops when using dp aux

panthor:
- fix gem_sync argument ordering

solomon:
- fix incorrect display output

renesas:
- fix DSI divider programming

ethosu:
- fix job submit error clean-up refcount
- fix NPU_OP_ELEMENTWISE validation
- handle possible underflows in IFM size calcs
The following changes since commit 11439c4635edd669ae435eec308f4ab8a0804808=
:

  Linux 7.0-rc2 (2026-03-01 15:39:31 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2026-03-07

for you to fetch changes up to 96bfe9ff7e88f0541002640acbcb3ec63c9d0130:

  Merge tag 'drm-xe-fixes-2026-03-05' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes
(2026-03-06 19:45:19 +1000)

----------------------------------------------------------------
drm fixes for 7.0-rc3

mm:
- mm: Fix a hmm_range_fault() livelock / starvation problem

pagemap:
- Revert "drm/pagemap: Disable device-to-device migration"

ttm:
- fix function return breaking reclaim
- fix build failure on PREEMPT_RT
- fix bo->resource UAF

dma-buf:
- include ioctl.h in uapi header

sched:
- fix kernel doc warning

amdgpu:
- LUT fixes
- VCN5 fix
- Dispclk fix
- SMU 13.x fix
- Fix race in VM acquire
- PSP 15.x fix
- UserQ fix

amdxdna:
- fix invalid payload for failed command
- fix NULL ptr dereference
- fix major fw version check
- avoid inconsistent fw state on error

i915/display:
- Fix for Lenovo T14 G7 display not refreshing

xe:
- Do not preempt fence signaling CS instructions
- Some leak and finalization fixes
- Workaround fix

nouveau:
- avoid runtime suspend oops when using dp aux

panthor:
- fix gem_sync argument ordering

solomon:
- fix incorrect display output

renesas:
- fix DSI divider programming

ethosu:
- fix job submit error clean-up refcount
- fix NPU_OP_ELEMENTWISE validation
- handle possible underflows in IFM size calcs

----------------------------------------------------------------
Akash Goel (1):
      drm/panthor: Correct the order of arguments passed to gem_sync

Alex Hung (2):
      drm/amd/display: Use mpc.preblend flag to indicate 3D LUT
      drm/amd/display: Enable DEGAMMA and reject COLOR_PIPELINE+DEGAMMA_LUT

Alysa Liu (1):
      drm/amdgpu: Fix use-after-free race in VM acquire

Chris Brandt (1):
      drm: renesas: rz-du: mipi_dsi: Set DSI divider

Dave Airlie (6):
      nouveau/dpcd: return EBUSY for aux xfer if the device is asleep
      Merge tag 'amd-drm-fixes-7.0-2026-03-04' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes
      Merge tag 'drm-intel-fixes-2026-03-05' of
https://gitlab.freedesktop.org/drm/i915/kernel into drm-fixes
      Merge tag 'drm-misc-fixes-2026-03-05' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-fixes
      Merge tag 'drm-misc-fixes-2026-03-06' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-fixes
      Merge tag 'drm-xe-fixes-2026-03-05' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes

Dillon Varone (1):
      drm/amd/display: Fallback to boot snapshot for dispclk

Francesco Lavra (1):
      drm/solomon: Fix page start when updating rectangle in page
addressing mode

Isaac J. Manjarres (1):
      dma-buf: Include ioctl.h in UAPI header

Jouni H=C3=B6gander (2):
      drm/dp: Add definition for Panel Replay full-line granularity
      drm/i915/psr: Fix for Panel Replay X granularity DPCD register handli=
ng

Julian Orth (1):
      drm/syncobj: Fix handle <-> fd ioctls with dirty stack

Lizhi Hou (4):
      accel/amdxdna: Fill invalid payload for failed command
      accel/amdxdna: Fix NULL pointer dereference of mgmt_chann
      accel/amdxdna: Fix major version check on NPU1 platform
      accel/amdxdna: Split mailbox channel create function

Maarten Lankhorst (2):
      drm/ttm/tests: Fix build failure on PREEMPT_RT
      Revert "drm/syncobj: Fix handle <-> fd ioctls with dirty stack"

Matt Roper (1):
      drm/xe/xe2_hpg: Correct implementation of Wa_16025250150

Matthew Brost (1):
      drm/xe: Do not preempt fence signaling CS instructions

Rob Herring (Arm) (3):
      accel: ethosu: Fix job submit error clean-up refcount underflows
      accel: ethosu: Fix NPU_OP_ELEMENTWISE validation with scalar
      accel: ethosu: Handle possible underflow in IFM size calculations

Shuicheng Lin (2):
      drm/xe/configfs: Free ctx_restore_mid_bb in release
      drm/xe/reg_sr: Fix leak on xa_store failure

Sunil Khatri (1):
      drm/amdgpu/userq: refcount userqueues to avoid any race conditions

Thadeu Lima de Souza Cascardo (1):
      drm/ttm: Fix bo resource use-after-free

Thomas Hellstr=C3=B6m (2):
      mm: Fix a hmm_range_fault() livelock / starvation problem
      Revert "drm/pagemap: Disable device-to-device migration"

Tomasz Lis (1):
      drm/xe/queue: Call fini on exec queue creation fail

Tvrtko Ursulin (2):
      drm/ttm: Fix ttm_pool_beneficial_order() return type
      drm/amdgpu/userq: Consolidate wait ioctl exit path

Varun Gupta (1):
      drm/xe: Fix memory leak in xe_vm_madvise_ioctl

Yang Wang (1):
      drm/amd/pm: remove invalid gpu_metrics.energy_accumulator on smu v13.=
0.x

Yujie Liu (1):
      drm/sched: Fix kernel-doc warning for drm_sched_job_done()

Zhanjun Dong (1):
      drm/xe/gsc: Fix GSC proxy cleanup on early initialization failure

sguttula (2):
      drm/amdgpu: Enable DPG support for VCN5
      drm/amdgpu/psp: Use Indirect access address for GFX to PSP mailbox

 drivers/accel/amdxdna/aie2_ctx.c                   |  23 ++--
 drivers/accel/amdxdna/aie2_message.c               |  36 +++++--
 drivers/accel/amdxdna/aie2_pci.c                   |  66 ++++++------
 drivers/accel/amdxdna/aie2_pci.h                   |   1 +
 drivers/accel/amdxdna/amdxdna_ctx.c                |  27 +++++
 drivers/accel/amdxdna/amdxdna_ctx.h                |   3 +
 drivers/accel/amdxdna/amdxdna_mailbox.c            |  99 +++++++++--------=
-
 drivers/accel/amdxdna/amdxdna_mailbox.h            |  31 +++---
 drivers/accel/amdxdna/npu1_regs.c                  |   2 +-
 drivers/accel/ethosu/ethosu_gem.c                  |  12 ++-
 drivers/accel/ethosu/ethosu_job.c                  |  28 +++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |   6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c          | 116 ++++++++++++++---=
----
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq.h          |   4 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c    |  42 +++-----
 drivers/gpu/drm/amd/amdgpu/psp_v15_0.c             |  20 ++--
 drivers/gpu/drm/amd/amdgpu/soc21.c                 |   4 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_color.c    |   6 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c  |   3 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c |  16 +--
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c    |   8 ++
 .../drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c  |   6 +-
 .../drm/amd/include/asic_reg/mp/mp_15_0_0_offset.h |  18 ++++
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c   |   8 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c   |   3 +-
 drivers/gpu/drm/drm_pagemap.c                      |  14 +--
 drivers/gpu/drm/i915/display/intel_psr.c           |  11 +-
 drivers/gpu/drm/nouveau/nouveau_connector.c        |   3 +
 drivers/gpu/drm/panthor/panthor_sched.c            |   9 +-
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c     |  16 ++-
 drivers/gpu/drm/scheduler/sched_main.c             |   1 +
 drivers/gpu/drm/solomon/ssd130x.c                  |   6 +-
 drivers/gpu/drm/ttm/tests/ttm_bo_test.c            |   4 +-
 drivers/gpu/drm/ttm/ttm_bo.c                       |  11 +-
 drivers/gpu/drm/ttm/ttm_pool_internal.h            |   2 +-
 drivers/gpu/drm/xe/xe_configfs.c                   |   1 +
 drivers/gpu/drm/xe/xe_exec_queue.c                 |  23 ++--
 drivers/gpu/drm/xe/xe_gsc_proxy.c                  |  43 ++++++--
 drivers/gpu/drm/xe/xe_gsc_types.h                  |   2 +
 drivers/gpu/drm/xe/xe_lrc.h                        |   3 +-
 drivers/gpu/drm/xe/xe_reg_sr.c                     |   4 +-
 drivers/gpu/drm/xe/xe_ring_ops.c                   |   9 ++
 drivers/gpu/drm/xe/xe_vm_madvise.c                 |   3 +-
 drivers/gpu/drm/xe/xe_wa.c                         |  13 +--
 include/drm/display/drm_dp.h                       |   2 +
 include/linux/migrate.h                            |  10 +-
 include/uapi/linux/dma-buf.h                       |   1 +
 mm/filemap.c                                       |  15 ++-
 mm/memory.c                                        |   3 +-
 mm/migrate.c                                       |   8 +-
 mm/migrate_device.c                                |   2 +-
 51 files changed, 516 insertions(+), 291 deletions(-)
