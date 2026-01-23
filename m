Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OPk4GCgHc2knrwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 06:29:12 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF417071C
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 06:29:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2581210E034;
	Fri, 23 Jan 2026 05:29:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="RMV1JcAL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com
 [209.85.222.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1078110E034
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jan 2026 05:29:08 +0000 (UTC)
Received: by mail-qk1-f171.google.com with SMTP id
 af79cd13be357-8c52c1d2a7bso345303185a.0
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jan 2026 21:29:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769146147; cv=none;
 d=google.com; s=arc-20240605;
 b=RAU2U0PSJqRKslXK3Koq6SOXbN/d+o5tYa99TgIjomM1XLUSks5ocAhkMRahuisgka
 /+eu4JXmYgAcAkl892OBLdKhURAqZIL/hfkrBAoFiLXFd9BmRzudYPDd0d9l38W6kuIq
 CZEzkXsjo+hcRPWxhaCm/hLDXMLjODlqtWbaeAqvv2Ufijs03CDN9bMleBxjR39lb//B
 SaQqd7ztRmzZ5IvsI2iXXB+214hxMV4SjzLF9onPzk1JU//ombgNFrp8bvP6UTqhdEnG
 j+p8ZJehqAbahsC05/+IO48mtQWWE76eQ/hmwkyHH0Afqr99JAmggabuJto4WGYRJi1A
 qsqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:to:subject:message-id:date:from
 :mime-version:dkim-signature;
 bh=IoED9ntpOc0uT8IxiceDp6hkchDAvhT36BreAOFFK40=;
 fh=gm7fztkFN7wkHYGK5ih7e4sbskpHYmGBW4HyCqbQBLU=;
 b=N6f3MoPPZ8h6q0tffvFvUCeXi5jrKDkzn5t0Z3C97Dy0ckiovcpkbFRly7ttB6NvkL
 5deSGqK4z/7+rAsXx54WrTsyVf7aJGep6v5TeovPLrv2UFxrnlZJUZDVBLnEC7QHsbTJ
 o1G6PvObmur9EpGQxD1GBU+YbnyE96rRfZYSOspEgftWB6Mj93tjhr3E9W8UkO4/QXGd
 EF255E2oCaa4fuY8P/bY6GXCloV0akzkSG+3DyoJIy3cYRY+3kzNCIFo9Htva/xRNfax
 9kG7bo6F2z07I3Ym51c27YSNonqbLHaAQIoj6398dishTJqM9SPaPmfja0qyEFYvqgVq
 mEBw==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769146147; x=1769750947; darn=lists.freedesktop.org;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=IoED9ntpOc0uT8IxiceDp6hkchDAvhT36BreAOFFK40=;
 b=RMV1JcAL1I8p7iOJ84rkT3gflyqpwe/1B2KznzgnuSluPK8mOnpW1Ix/+vLZlR1UZ9
 HhRxv3j88Of8GB2/LNfyLamZM0DRNIJE7QNtJtlX+q/iJPnbmHN/ztuBLzLI4mPHkpox
 Lu3qR2RktKVLW2unQRf5q2ylH+hMjFhHrsV6xKHTbYNOSnhsakfI/RT2/LCMfh1Xlse6
 BzJr5ZUnpSURvQbamquKQ+St8J/kWQneNuXvoTIwGb9ATmNMNXsA0mW+EKeU+h66sKBL
 jPOjm9fKEfqXZF56oFLgee9bIjPTK4IFJS0T/csQahQgDsfOrE1WXp/cV0UCwfRdeLIf
 B4sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769146147; x=1769750947;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IoED9ntpOc0uT8IxiceDp6hkchDAvhT36BreAOFFK40=;
 b=DyPojShVS8HxbzC+Zm57HbhNOFPsnGAgoGARn8bapeNupvix3zj77ypAgK2CLa3aSI
 /YD0wluFb/mRRAferlct0gehRA7rV9RIs8rixbJsFcfe91Ba68uN9CTAesDTx6M5DNgs
 wst/CLJxWOe5L3UtHmIDru8dbVGFKKm+Co4LT9Wq98f7Hk1F2Ud/vvOwDSlJnqj+rXCW
 OjzfJ49XwFx1ztqxzufUgJZmJNgrf+n73kd5vBbiwzDHOT9YcNxLD4lM/X3OY+2sFoyZ
 MQctpegkSAvOnw9WqAVXBfshdo2Nj7P+pGG62L/HdsQAxGVectfgziaEbnAoUWK5WoHk
 /L0Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWmvXuUwp6LvqYQqHEnN4kIWBZvJgi7ABNWriWbG1ml/FGK5PC6JQta/9l8t8ZN94K1o5lNhK+5QOo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzfoFXY7iOKRRPWo028u24frKQtDFDKB9bgAdHelWOImRvdUXHc
 Qlai+3NGspWv29h2zdSj7kw4A3bhhuVIl6hVeffMto1cDPoTK1c34nuJ8Eqa094hR+XZJSgxfFn
 tVAMNDtOaiMM6mBpp1MX9YdvI4A/SFvE=
X-Gm-Gg: AZuq6aKeL2h/1QHdsOjF58Rf4akJzsaL/J0SD/zEdz4iW0bjUNoQ+Ci0Is/9swvbK9Q
 5Dzby7Ee4oUqbDIqrYQQkvjI7iRqfnlv3ltxdqovdac9De1KgcOzYl06ws389fvhToJ51mWeyjv
 +7+lidcF/92xY0b8Ai5xqkayHCX0QFeh461gXgSBOCcpo4nB58NopQviqmB4Rtsa76uzV1jAd5/
 lFWPeGNMXYRqjU5qyUZLSfkxLxnNbuBKaSK/EozqKGkKHmqfHaw2I733bF0aar675OI4wPkJ6ot
 WR6DFaG3o8q70H8tWt0BzzjEXlD+jJ0PvkVgmtDRribSLkJCtNwF9ts=
X-Received: by 2002:a05:620a:2699:b0:8c3:67f7:713d with SMTP id
 af79cd13be357-8c6e2e86e30mr235487285a.26.1769146146626; Thu, 22 Jan 2026
 21:29:06 -0800 (PST)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 23 Jan 2026 15:28:55 +1000
X-Gm-Features: AZwV_Qj9_SDKN0PP5b7KX6psT_WBkyi9zPNlWS9zharfXO2bC9U314Z_nQJmxH0
Message-ID: <CAPM=9tznJ3wXkXceM6poZ3Y2nWbFaWdyXyusAMyXZjhUTt50ew@mail.gmail.com>
Subject: [git pull] drm fixes for 6.19-rc7
To: Linus Torvalds <torvalds@linux-foundation.org>, Sima Vetter <sima@ffwll.ch>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:torvalds@linux-foundation.org,m:sima@ffwll.ch,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[airlied@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.997];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[airlied@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FREEMAIL_FROM(0.00)[gmail.com]
X-Rspamd-Queue-Id: AAF417071C
X-Rspamd-Action: no action

Hi Linus,

Probably a good thing you decided to do an rc8 in this round. Nothing
stands out, but xe/amdgpu and mediatek all have a bunch of fixes, and
then there are a few other single patches. Hopefully next week is
calmer for release.

Regards,
DAve.

drm-fixes-2026-01-23:
drm fixes for 6.19-rc7

xe:
- Disallow bind-queue sharing across multiple VMs
- Fix xe userptr in the absence of CONFIG_DEVICE_PRIVATE
- Fix a missed page count update
- Fix a confused argument to alloc_workqueue()
- Kernel-doc fixes
- Disable a workaround on VFs
- Fix a job lock assert
- Update wedged.mode only after successful reset policy change
- Select CONFIG_DEVICE_PRIVATE when DRM_XE_GPUSVM is selected

amdgpu:
- fix color pipeline string leak
- GC 12 fix
- Misc error path fixes
- DC analog fix
- SMU 6 fixes
- TLB flush fix
- DC idle optimization fix

amdkfd:
- GC 11 cooperative launch fix

imagination:
- sync wait for logtype update completion to ensure FW trace is
  available

bridge/synopsis:
- Fix error paths in dw_dp_bind

nouveau:
- Add and implement missing DSB connector types, and improve unknown
  connector handling.
- Set missing atomic function ops.

intel:
- place 3D lut at correct place in pipeline
- fix color pipeline string leak

vkms:
- fix color pipeline string leak

mediatek:
- Fix platform_get_irq() error checking
- HDMI DDC v2 driver fixes
- dpi: Find next bridge during probe
- mtk_gem: Partial refactor and use drm_gem_dma_object
- dt-bindings: Fix typo 'hardwares' to 'hardware'
The following changes since commit 24d479d26b25bce5faea3ddd9fa8f3a6c3129ea7=
:

  Linux 6.19-rc6 (2026-01-18 15:42:45 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2026-01-23

for you to fetch changes up to b91adbe83093629a675c77d39ac638610630b1e8:

  Merge tag 'mediatek-drm-fixes-20260119' of
https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux
into drm-fixes (2026-01-23 10:13:12 +1000)

----------------------------------------------------------------
drm fixes for 6.19-rc7

xe:
- Disallow bind-queue sharing across multiple VMs
- Fix xe userptr in the absence of CONFIG_DEVICE_PRIVATE
- Fix a missed page count update
- Fix a confused argument to alloc_workqueue()
- Kernel-doc fixes
- Disable a workaround on VFs
- Fix a job lock assert
- Update wedged.mode only after successful reset policy change
- Select CONFIG_DEVICE_PRIVATE when DRM_XE_GPUSVM is selected

amdgpu:
- fix color pipeline string leak
- GC 12 fix
- Misc error path fixes
- DC analog fix
- SMU 6 fixes
- TLB flush fix
- DC idle optimization fix

amdkfd:
- GC 11 cooperative launch fix

imagination:
- sync wait for logtype update completion to ensure FW trace is
  available

bridge/synopsis:
- Fix error paths in dw_dp_bind

nouveau:
- Add and implement missing DSB connector types, and improve unknown
  connector handling.
- Set missing atomic function ops.

intel:
- place 3D lut at correct place in pipeline
- fix color pipeline string leak

vkms:
- fix color pipeline string leak

mediatek:
- Fix platform_get_irq() error checking
- HDMI DDC v2 driver fixes
- dpi: Find next bridge during probe
- mtk_gem: Partial refactor and use drm_gem_dma_object
- dt-bindings: Fix typo 'hardwares' to 'hardware'

----------------------------------------------------------------
Alex Deucher (3):
      drm/amdgpu: fix error handling in ib_schedule()
      drm/amdgpu: fix type for wptr in ring backup
      Revert "drm/amd/display: pause the workload setting in dm"

Alex Ram=C3=ADrez (2):
      drm/nouveau: add missing DCB connector types
      drm/nouveau: implement missing DCB connector types; gracefully
handle unknown connectors

AngeloGioacchino Del Regno (1):
      drm/mediatek: mtk_gem: Partial refactor and use drm_gem_dma_object

Brajesh Gupta (1):
      drm/imagination: Wait for FW trace update command completion

Chaitanya Kumar Borah (4):
      drm/i915/color: Place 3D LUT after CSC in plane color pipeline
      drm/amd/display: Fix color pipeline enum name leak
      drm/vkms: Fix color pipeline enum name leak
      drm/i915/display: Fix color pipeline enum name leak

Chen-Yu Tsai (1):
      drm/mediatek: dpi: Find next bridge during probe

Dan Carpenter (1):
      drm/mediatek: Fix platform_get_irq() error checking

Dave Airlie (4):
      Merge tag 'drm-misc-fixes-2026-01-22' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-fixes
      Merge tag 'drm-xe-fixes-2026-01-22' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes
      Merge tag 'amd-drm-fixes-6.19-2026-01-22' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes
      Merge tag 'mediatek-drm-fixes-20260119' of
https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux
into drm-fixes

Jani Nikula (3):
      drm/xe/vf: fix struct xe_gt_sriov_vf_migration kernel-doc
      drm/xe/xe_late_bind_fw: fix enum xe_late_bind_fw_id kernel-doc
      drm/xe/vm: fix xe_vm_validation_exec() kernel-doc

Jiqian Chen (1):
      drm/amdgpu: free hw_vm_fence when fail in amdgpu_job_alloc

Jonathan Kim (1):
      drm/amdkfd: fix gfx11 restrictions on debugging cooperative launch

Likun Gao (1):
      drm/amdgpu: remove frame cntl for gfx v12

Louis-Alexis Eyraud (2):
      drm/mediatek: mtk_hdmi_ddc_v2: Add transfer abort on timeout cases
      drm/mediatek: mtk_hdmi_ddc_v2: Fix multi-byte writes

Lukasz Laguna (1):
      drm/xe: Update wedged.mode only after successful reset policy change

Lyude Paul (1):
      drm/nouveau/disp: Set drm_mode_config_funcs.atomic_(check|commit)

Maarten Lankhorst (1):
      Merge remote-tracking branch 'drm/drm-fixes' into drm-misc-fixes

Marco Crivellari (1):
      drm/xe: fix WQ_MEM_RECLAIM passed as max_active to alloc_workqueue()

Matthew Auld (2):
      drm/xe/uapi: disallow bind queue sharing
      drm/xe/migrate: fix job lock assert

Matthew Brost (2):
      drm/xe: Adjust page count tracepoints in shrinker
      drm/xe: Disable timestamp WA on VFs

Nathan Chancellor (1):
      drm/mediatek: mtk_hdmi_v2: Fix return type of
mtk_hdmi_v2_tmds_char_rate_valid()

Nauman Sabir (1):
      dt-bindings: display: mediatek: Fix typo 'hardwares' to 'hardware'

Osama Abdelkader (1):
      drm/bridge: synopsys: dw-dp: fix error paths of dw_dp_bind

Thomas Hellstr=C3=B6m (2):
      drm, drm/xe: Fix xe userptr in the absence of CONFIG_DEVICE_PRIVATE
      drm/xe: Select CONFIG_DEVICE_PRIVATE when DRM_XE_GPUSVM is selected

Timur Krist=C3=B3f (5):
      drm/amd/display: Only poll analog connectors
      drm/amd/pm: Fix si_dpm mmCG_THERMAL_INT setting
      drm/amd/pm: Don't clear SI SMC table when setting power limit
      drm/amd/pm: Workaround SI powertune issue on Radeon 430 (v2)
      drm/amdgpu: Fix validating flush_gpu_tlb_pasid()

 .../bindings/display/mediatek/mediatek,dp.yaml     |   2 +-
 drivers/gpu/drm/Kconfig                            |   2 +-
 drivers/gpu/drm/Makefile                           |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c          |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c            |   6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c             |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c            |   7 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c             |  12 -
 drivers/gpu/drm/amd/amdkfd/kfd_debug.h             |   3 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c  |   4 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c |  11 -
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c  |  10 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c    |  13 +-
 drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c         |  31 +--
 drivers/gpu/drm/bridge/synopsys/dw-dp.c            |  20 +-
 .../gpu/drm/i915/display/intel_color_pipeline.c    |  36 +--
 drivers/gpu/drm/imagination/pvr_fw_trace.c         |   8 +-
 drivers/gpu/drm/mediatek/Kconfig                   |   2 +-
 drivers/gpu/drm/mediatek/mtk_dpi.c                 |  23 +-
 drivers/gpu/drm/mediatek/mtk_gem.c                 | 264 ++++++++---------=
----
 drivers/gpu/drm/mediatek/mtk_gem.h                 |  33 +--
 drivers/gpu/drm/mediatek/mtk_hdmi_common.c         |   2 +-
 drivers/gpu/drm/mediatek/mtk_hdmi_common.h         |   2 +-
 drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c         |  58 +++--
 drivers/gpu/drm/mediatek/mtk_hdmi_v2.c             |   7 +-
 drivers/gpu/drm/mediatek/mtk_plane.c               |   8 +-
 .../drm/nouveau/include/nvkm/subdev/bios/conn.h    |  95 ++++++--
 drivers/gpu/drm/nouveau/nouveau_display.c          |   2 +
 drivers/gpu/drm/nouveau/nvkm/engine/disp/uconn.c   |  73 ++++--
 drivers/gpu/drm/vkms/vkms_colorop.c                |  15 +-
 drivers/gpu/drm/xe/Kconfig                         |   5 +-
 drivers/gpu/drm/xe/xe_bo.c                         |   9 +-
 drivers/gpu/drm/xe/xe_debugfs.c                    |  72 ++++--
 drivers/gpu/drm/xe/xe_device_types.h               |  18 ++
 drivers/gpu/drm/xe/xe_exec_queue.c                 |  32 ++-
 drivers/gpu/drm/xe/xe_exec_queue.h                 |   1 +
 drivers/gpu/drm/xe/xe_exec_queue_types.h           |   6 +
 drivers/gpu/drm/xe/xe_ggtt.c                       |   2 +-
 drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h          |   4 +-
 drivers/gpu/drm/xe/xe_guc_ads.c                    |  14 +-
 drivers/gpu/drm/xe/xe_guc_ads.h                    |   5 +-
 drivers/gpu/drm/xe/xe_late_bind_fw_types.h         |   4 +-
 drivers/gpu/drm/xe/xe_lrc.c                        |   3 +
 drivers/gpu/drm/xe/xe_migrate.c                    |   4 +-
 drivers/gpu/drm/xe/xe_sriov_vf_ccs.c               |   2 +-
 drivers/gpu/drm/xe/xe_vm.c                         |   7 +-
 drivers/gpu/drm/xe/xe_vm.h                         |   2 +-
 include/drm/drm_pagemap.h                          |  19 +-
 48 files changed, 561 insertions(+), 405 deletions(-)
