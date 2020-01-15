Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CFE613B898
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2020 05:09:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 442316E84E;
	Wed, 15 Jan 2020 04:09:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe2f.google.com (mail-vs1-xe2f.google.com
 [IPv6:2607:f8b0:4864:20::e2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 856A96E844
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2020 04:09:20 +0000 (UTC)
Received: by mail-vs1-xe2f.google.com with SMTP id s16so9657616vsc.10
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2020 20:09:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=SdtBfNL8DEKtIYDZw9q4/SCjOHJSoHBQdNSEDeslsBo=;
 b=kxl5QZVLUGm0LXsmSfmEkn+N2sIhsUeP4ajNtV4OlNanrXKoz+rvaFmJ4oM+fhBApl
 dCGuLP8uCS9CQ7W8DBYtK+rdnX1Xn6lGRmtpR8OEqqDy51BO4qP2aPqZ01kzXkLODgS2
 sjqZBtK8M6ikulXxcBPBa+jXMozEphZFsNBiL1irrKzzJZbA703DdpiMnxakFUBZunBN
 eZ/Fvng8GMChkNQEz895sQvJfPmRdHfiGi+RwhwREKcUbsV9/XxdfBOIGFClIyWgA2B5
 lx8Eh96aCQjKEuApkKXWdTEsM6p+/YsE4pSPHUsJSch2IasQ2iH1UzF7vRmGtmhFT9rq
 laAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=SdtBfNL8DEKtIYDZw9q4/SCjOHJSoHBQdNSEDeslsBo=;
 b=FcCZ8IQZNP81j2pdG/REmm3zgZT8dqzh74KGrjLc7zI7Po7pmIdq3jIdjEg+nntNFO
 VAPtQV76D2GuarLZhm9cYA8TSe8dLvCdzykSuCxYIn/ZAEfBVtkOPA3M77Fmofwly/jd
 KELDKktNFHdyT9+pHN5NB0bgsZsqCSnx0H5kYGmvSb/rq2L8+eRoRzDObeMk5p6Yh0BG
 nHwjrj8wts2pWNHl16Y8EqL1emr1eJ8pCR+8uc49qTjX4V1M6M9fqx+1je8a4DeQXdla
 +0cSGs4TQ912nu/j0zu73d1U2DvvEqQQApNzvqDz6xTuEwhayTlVGVpbcmJBo9bFlxSl
 AIwg==
X-Gm-Message-State: APjAAAUOTtlMT5Y3bwioScfIQqhKcmVrjncoBFuMMOu21jBu3sQw2bOv
 0ZxE0//pI52Q8jTWNm1KrkEEJmLAMVqZ0QnRsnHECx3dIXs=
X-Google-Smtp-Source: APXvYqz6ZLWZygtvEGe4QwfiPtSTIaMh3yLEbm4iAntmRnJse8EEvTP0FUQCHRnfM7pJBSOJMjUxREBgyb2Nt38Qcj0=
X-Received: by 2002:a67:6345:: with SMTP id x66mr3220472vsb.132.1579061358907; 
 Tue, 14 Jan 2020 20:09:18 -0800 (PST)
MIME-Version: 1.0
From: Ben Skeggs <skeggsb@gmail.com>
Date: Wed, 15 Jan 2020 14:09:07 +1000
Message-ID: <CACAvsv5GKasg9-hEUwp9+aHVJg+nbQ0LukXyudgj6=YKu96jWQ@mail.gmail.com>
Subject: nouveau-next 5.6
To: ML dri-devel <dri-devel@lists.freedesktop.org>,
 Dave Airlie <airlied@gmail.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey Dave,

It's a little late in the -next cycle, but final firmware images from
NVIDIA appear to be ready now, so I've spent the last few days
testing/tidying up this code to get it ready to upstream - finally.

Brief overview (more info in commit messages):

- Rewrite of the ACR (formerly "secure boot") code, both to support
Turing, support multiple FW revisions, and to make life easier when
having to debug HW/FW bring-up in the future
- Support for TU10x graphics engine, TU11x not available yet as FW isn't ready
- Proper page 'kind' mappings for Turing
- 10-bit LUT support
- GP10B (Tegra) fixes
- Misc other fixes

Thanks,
Ben.

The following changes since commit 688486a49cf500a193dfe15be9eb5aa468887769:

  Merge tag 'amd-drm-next-5.6-2020-01-10-dp-mst-dsc' of
git://people.freedesktop.org/~agd5f/linux into drm-next (2020-01-13
17:14:34 +1000)

are available in the Git repository at:

  git://github.com/skeggsb/linux linux-5.6

for you to fetch changes up to afa3b96b058d87c2c44d1c83dadb2ba6998d03ce:

  drm/nouveau/gr/tu10x: initial support (2020-01-15 10:50:30 +1000)

----------------------------------------------------------------
Ben Skeggs (77):
      drm/nouveau/gr/gk208-gm10x: regenerate built-in firmware
      drm/nouveau/core: fix missing newline in fw loader error message
      drm/nouveau/fault/tu102: define nvkm_fault_func.pin
      drm/nouveau/gr/gf100-: remove dtor
      drm/nouveau/gr/gk20a,gm200-: add terminators to method lists read from fw
      drm/nouveau/gr/gv100-: modify gr init to match newer version of RM
      drm/nouveau/disp/dp: fix typo when determining failsafe link configuration
      drm/nouveau/fault/gv100-: fix memory leak on module unload
      drm/nouveau/flcn: move fetching of configuration until first use
      drm/nouveau/flcn: fetch PRI address from TOP if not provided by
constructor
      drm/nouveau/flcn: export existing funcs
      drm/nouveau/core: output fw size in debug messages
      drm/nouveau/core: add a macro to better handle multiple firmware versions
      drm/nouveau/core: add representation of generic binary objects
      drm/nouveau/core: define ACR subdev
      drm/nouveau/acr: add stub implementation for all GPUs currently
supported by SECBOOT
      drm/nouveau/acr: add loaders for currently available LS firmware images
      drm/nouveau/gsp: select implementation based on available firmware
      drm/nouveau/gsp: initialise SW state for falcon from constructor
      drm/nouveau/pmu/gp10b: split from gm20b implementation
      drm/nouveau/pmu: select implementation based on available firmware
      drm/nouveau/pmu: initialise SW state for falcon from constructor
      drm/nouveau/gr/gf100-: use nvkm_blob structure for fecs/gpccs fw
      drm/nouveau/gr/gk20a,gm200-: use nvkm_firmware_load_blob for sw init
      drm/nouveau/gr/gf100-: drop fuc_ prefix on sw init
      drm/nouveau/gr/gf100-: move fecs/gpccs ucode into their substructures
      drm/nouveau/gr/gp108: split from gp107
      drm/nouveau/gr/gf100-: select implementation based on available FW
      drm/nouveau/gr/gf100-: initialise SW state for falcon from constructor
      drm/nouveau/sec2/gp108: split from gp102 implementation
      drm/nouveau/sec2: select implementation based on available firmware
      drm/nouveau/sec2: initialise SW state for falcon from constructor
      drm/nouveau/sec2: use falcon funcs
      drm/nouveau/sec2: move interrupt handler to hw-specific module
      drm/nouveau/nvdec: select implementation based on available fw
      drm/nouveau/nvdec: initialise SW state for falcon from constructor
      drm/nouveau/nvdec/gm107: rename from gp102 implementation
      drm/nouveau/nvdec/gm107-: add missing engine instances
      drm/nouveau/nvenc: add a stub implementation for the GPUs where
it should be supported
      drm/nouveau/flcn: specify FBIF offset from subdev
      drm/nouveau/flcn: move bind_context WAR out of common code
      drm/nouveau/flcn: specify EMEM address from subdev
      drm/nouveau/flcn: specify debug/production register offset from subdev
      drm/nouveau/flcn: specify queue register offsets from subdev
      drm/nouveau/flcn: reset sec2/gsp falcons harder
      drm/nouveau/flcn: add printk macros
      drm/nouveau/flcn: split msgqueue into multiple pieces
      drm/nouveau/flcn/qmgr: explicitly create queue manager from subdevs
      drm/nouveau/flcn/cmdq: explicitly create command queue(s) from subdevs
      drm/nouveau/flcn/msgq: explicitly create message queue from subdevs
      drm/nouveau/flcn/qmgr: move sequence tracking from nvkm_msgqueue
to nvkm_falcon_qmgr
      drm/nouveau/flcn/qmgr: allow arbtrary priv + return code for callbacks
      drm/nouveau/flcn/qmgr: support syncronous command submission
from common code
      drm/nouveau/flcn/qmgr: rename remaining nvkm_msgqueue bits to
nvkm_falcon_qmgr
      drm/nouveau/flcn/cmdq: split the condition for queue readiness
vs pmu acr readiness
      drm/nouveau/flcn/cmdq: cmd_queue_push can't fail, remove error
handling for it
      drm/nouveau/flcn/cmdq: cmd_queue_close always commits, simplify it
      drm/nouveau/flcn/cmdq: switch to falcon queue printk macros
      drm/nouveau/flcn/cmdq: drop nvkm_msgqueue argument to functions
      drm/nouveau/flcn/cmdq: implement a more explicit send() interface
      drm/nouveau/flcn/cmdq: rename cmdq-related nvkm_msqqueue_queue
to nvkm_falcon_cmdq
      drm/nouveau/flcn/cmdq: move command generation to subdevs
      drm/nouveau/flcn/msgq: remove error handling for
msg_queue_open(), it can't fail
      drm/nouveau/flcn/msgq: simplify msg_queue_pop() error handling
      drm/nouveau/flcn/msgq: switch to falcon queue printk macros
      drm/nouveau/flcn/msgq: drop nvkm_msgqueue argument to functions
      drm/nouveau/flcn/msgq: move handling of init message to subdevs
      drm/nouveau/flcn/msgq: pass explicit message queue pointer to recv()
      drm/nouveau/flcn/msgq: rename msgq-related nvkm_msgqueue_queue
to nvkm_falcon_msgq
      drm/nouveau/secboot: move code to boot LS falcons to subdevs
      drm/nouveau/core/memory: add macros to read/write blocks from objects
      drm/nouveau/fb/gp102-: unlock VPR as part of FB init
      drm/nouveau/acr: implement new subdev to replace "secure boot"
      drm/nouveau/secboot: remove
      drm/nouveau/core: remove previous versioned fw loader
      drm/nouveau/acr/tu10x: initial support
      drm/nouveau/gr/tu10x: initial support

Colin Ian King (1):
      drm/nouveau/nouveau: fix incorrect sizeof on args.src an args.dst

Dan Carpenter (1):
      drm/nouveau/secboot/gm20b: initialize pointer in gm20b_secboot_new()

Ilia Mirkin (1):
      drm/nouveau/kms/gf119-: allow both 256- and 1024-sized LUTs to be used

James Jones (2):
      drm/nouveau: Fix ttm move init with multiple GPUs
      drm/nouveau/mmu: Add correct turing page kinds

Lyude Paul (3):
      drm/nouveau/kms/nv50-: Remove nv50_mstc_best_encoder()
      drm/nouveau/kms/nv50-: Use less encoders by making mstos per-head
      drm/nouveau/kms/nv50-: Report possible_crtcs incorrectly on mstos, for now

Thierry Reding (7):
      drm/nouveau/fault: Add support for GP10B
      drm/nouveau: Do not try to disable PCI device on Tegra
      drm/nouveau/tegra: Avoid pulsing reset twice
      drm/nouveau/tegra: Set clock rate if not set
      drm/nouveau/secboot/gm20b,gp10b: Read WPR configuration from GPU registers
      drm/nouveau/ltc/gp10b: Add custom L2 cache implementation
      drm/nouveau/ce/gp10b: Use correct copy engine

Wambui Karuga (3):
      drm/nouveau/fb/gf100-: declare constants as unsigned long long.
      drm/nouveau/kms/nv04: remove set but unused variable.
      drm/nouveau: use NULL for pointer assignment.

YueHaibing (3):
      drm/nouveau/kms/nv04-nv4x: Use match_string() helper to simplify the code
      drm/nouveau: Fix copy-paste error in nouveau_fence_wait_uevent_handler
      drm/nouveau/drm/ttm: Remove set but not used variable 'mem'

 drivers/gpu/drm/nouveau/dispnv04/arb.c             |    3 +-
 drivers/gpu/drm/nouveau/dispnv04/tvnv17.c          |   13 +-
 drivers/gpu/drm/nouveau/dispnv50/base907c.c        |   11 +-
 drivers/gpu/drm/nouveau/dispnv50/disp.c            |  111 +-
 drivers/gpu/drm/nouveau/dispnv50/disp.h            |    2 +
 drivers/gpu/drm/nouveau/dispnv50/head.c            |   43 +-
 drivers/gpu/drm/nouveau/dispnv50/head.h            |   10 +-
 drivers/gpu/drm/nouveau/dispnv50/head507d.c        |    9 +-
 drivers/gpu/drm/nouveau/dispnv50/head827d.c        |    1 +
 drivers/gpu/drm/nouveau/dispnv50/head907d.c        |   11 +-
 drivers/gpu/drm/nouveau/dispnv50/head917d.c        |    1 +
 drivers/gpu/drm/nouveau/dispnv50/headc37d.c        |   11 +-
 drivers/gpu/drm/nouveau/dispnv50/headc57d.c        |   12 +-
 drivers/gpu/drm/nouveau/dispnv50/lut.c             |    2 +-
 drivers/gpu/drm/nouveau/dispnv50/wndw.c            |   17 +-
 drivers/gpu/drm/nouveau/dispnv50/wndw.h            |    3 +-
 drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c        |   11 +-
 drivers/gpu/drm/nouveau/dispnv50/wndwc57e.c        |   11 +-
 drivers/gpu/drm/nouveau/include/nvfw/acr.h         |  152 +++
 drivers/gpu/drm/nouveau/include/nvfw/flcn.h        |   97 ++
 drivers/gpu/drm/nouveau/include/nvfw/fw.h          |   28 +
 drivers/gpu/drm/nouveau/include/nvfw/hs.h          |   31 +
 drivers/gpu/drm/nouveau/include/nvfw/ls.h          |   53 +
 drivers/gpu/drm/nouveau/include/nvfw/pmu.h         |   98 ++
 drivers/gpu/drm/nouveau/include/nvfw/sec2.h        |   60 +
 drivers/gpu/drm/nouveau/include/nvif/class.h       |    3 +
 drivers/gpu/drm/nouveau/include/nvif/if0008.h      |    2 +-
 drivers/gpu/drm/nouveau/include/nvif/mmu.h         |    4 +-
 drivers/gpu/drm/nouveau/include/nvkm/core/device.h |   10 +-
 drivers/gpu/drm/nouveau/include/nvkm/core/falcon.h |   77 ++
 .../gpu/drm/nouveau/include/nvkm/core/firmware.h   |   51 +-
 drivers/gpu/drm/nouveau/include/nvkm/core/memory.h |   16 +
 .../gpu/drm/nouveau/include/nvkm/core/msgqueue.h   |   43 -
 drivers/gpu/drm/nouveau/include/nvkm/core/os.h     |   13 +
 .../gpu/drm/nouveau/include/nvkm/engine/falcon.h   |   20 +-
 drivers/gpu/drm/nouveau/include/nvkm/engine/gr.h   |    2 +
 .../gpu/drm/nouveau/include/nvkm/engine/nvdec.h    |    8 +-
 .../gpu/drm/nouveau/include/nvkm/engine/nvenc.h    |   10 +
 drivers/gpu/drm/nouveau/include/nvkm/engine/sec2.h |   13 +-
 drivers/gpu/drm/nouveau/include/nvkm/subdev/acr.h  |  126 ++
 .../gpu/drm/nouveau/include/nvkm/subdev/fault.h    |    1 +
 drivers/gpu/drm/nouveau/include/nvkm/subdev/fb.h   |    2 +
 drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h  |    5 +-
 drivers/gpu/drm/nouveau/include/nvkm/subdev/ltc.h  |    1 +
 drivers/gpu/drm/nouveau/include/nvkm/subdev/pmu.h  |   14 +-
 drivers/gpu/drm/nouveau/nouveau_bo.c               |    5 +-
 drivers/gpu/drm/nouveau/nouveau_dmem.c             |    4 +-
 drivers/gpu/drm/nouveau/nouveau_drm.c              |    3 +-
 drivers/gpu/drm/nouveau/nouveau_fence.c            |    2 +-
 drivers/gpu/drm/nouveau/nouveau_hwmon.c            |    2 +-
 drivers/gpu/drm/nouveau/nouveau_ttm.c              |    4 -
 drivers/gpu/drm/nouveau/nvif/mmu.c                 |    1 +
 drivers/gpu/drm/nouveau/nvkm/Kbuild                |    1 +
 drivers/gpu/drm/nouveau/nvkm/core/firmware.c       |   67 +-
 drivers/gpu/drm/nouveau/nvkm/core/subdev.c         |    2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/device/base.c  |  108 +-
 drivers/gpu/drm/nouveau/nvkm/engine/device/priv.h  |    2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c |   24 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c      |    2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/Kbuild      |    3 +
 drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgf100.c  |   27 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgf100.h  |   10 +
 drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgk20a.c  |    6 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgm20b.c  |    6 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgv100.c  |   23 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxtu102.c  |   95 ++
 .../drm/nouveau/nvkm/engine/gr/fuc/hubgk208.fuc5.h |  786 ++++++-------
 .../drm/nouveau/nvkm/engine/gr/fuc/hubgm107.fuc5.h |  786 ++++++-------
 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c     |  311 ++---
 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.h     |   89 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf104.c     |    9 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf108.c     |    9 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf110.c     |    9 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf117.c     |    9 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf119.c     |    9 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/gk104.c     |    9 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/gk110.c     |    9 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/gk110b.c    |    9 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/gk208.c     |    9 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/gk20a.c     |  130 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/gm107.c     |    9 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/gm200.c     |  160 ++-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/gm20b.c     |   98 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/gp100.c     |   21 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/gp102.c     |   21 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/gp104.c     |   34 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/gp107.c     |   23 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/gp108.c     |   97 ++
 drivers/gpu/drm/nouveau/nvkm/engine/gr/gp10b.c     |   35 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/gv100.c     |   29 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/tu102.c     |  177 +++
 drivers/gpu/drm/nouveau/nvkm/engine/nvdec/Kbuild   |    2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/nvdec/base.c   |   42 +-
 .../nouveau/nvkm/engine/nvdec/{gp102.c => gm107.c} |   39 +-
 drivers/gpu/drm/nouveau/nvkm/engine/nvdec/priv.h   |   14 +-
 drivers/gpu/drm/nouveau/nvkm/engine/nvenc/Kbuild   |    3 +-
 drivers/gpu/drm/nouveau/nvkm/engine/nvenc/base.c   |   63 +
 drivers/gpu/drm/nouveau/nvkm/engine/nvenc/gm107.c  |   63 +
 drivers/gpu/drm/nouveau/nvkm/engine/nvenc/priv.h   |   19 +
 drivers/gpu/drm/nouveau/nvkm/engine/sec2/Kbuild    |    1 +
 drivers/gpu/drm/nouveau/nvkm/engine/sec2/base.c    |  109 +-
 drivers/gpu/drm/nouveau/nvkm/engine/sec2/gp102.c   |  312 ++++-
 .../secboot/acr_r367.h => engine/sec2/gp108.c}     |   37 +-
 drivers/gpu/drm/nouveau/nvkm/engine/sec2/priv.h    |   24 +-
 drivers/gpu/drm/nouveau/nvkm/engine/sec2/tu102.c   |   47 +-
 drivers/gpu/drm/nouveau/nvkm/falcon/Kbuild         |    6 +-
 drivers/gpu/drm/nouveau/nvkm/falcon/base.c         |   87 +-
 drivers/gpu/drm/nouveau/nvkm/falcon/cmdq.c         |  214 ++++
 drivers/gpu/drm/nouveau/nvkm/falcon/msgq.c         |  213 ++++
 drivers/gpu/drm/nouveau/nvkm/falcon/msgqueue.c     |  577 ---------
 drivers/gpu/drm/nouveau/nvkm/falcon/msgqueue.h     |  213 ----
 .../drm/nouveau/nvkm/falcon/msgqueue_0137c63d.c    |  436 -------
 .../drm/nouveau/nvkm/falcon/msgqueue_0148cdec.c    |  264 -----
 drivers/gpu/drm/nouveau/nvkm/falcon/priv.h         |    6 +-
 drivers/gpu/drm/nouveau/nvkm/falcon/qmgr.c         |   87 ++
 drivers/gpu/drm/nouveau/nvkm/falcon/qmgr.h         |   89 ++
 drivers/gpu/drm/nouveau/nvkm/falcon/v1.c           |   86 +-
 drivers/gpu/drm/nouveau/nvkm/nvfw/Kbuild           |    7 +
 drivers/gpu/drm/nouveau/nvkm/nvfw/acr.c            |  165 +++
 drivers/gpu/drm/nouveau/nvkm/nvfw/flcn.c           |  115 ++
 drivers/gpu/drm/nouveau/nvkm/nvfw/fw.c             |   51 +
 drivers/gpu/drm/nouveau/nvkm/nvfw/hs.c             |   62 +
 drivers/gpu/drm/nouveau/nvkm/nvfw/ls.c             |  108 ++
 drivers/gpu/drm/nouveau/nvkm/subdev/Kbuild         |    2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/acr/Kbuild     |   10 +
 drivers/gpu/drm/nouveau/nvkm/subdev/acr/base.c     |  411 +++++++
 drivers/gpu/drm/nouveau/nvkm/subdev/acr/gm200.c    |  470 ++++++++
 drivers/gpu/drm/nouveau/nvkm/subdev/acr/gm20b.c    |  134 +++
 drivers/gpu/drm/nouveau/nvkm/subdev/acr/gp102.c    |  281 +++++
 drivers/gpu/drm/nouveau/nvkm/subdev/acr/gp108.c    |  111 ++
 drivers/gpu/drm/nouveau/nvkm/subdev/acr/gp10b.c    |   57 +
 drivers/gpu/drm/nouveau/nvkm/subdev/acr/hsfw.c     |  180 +++
 drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c     |  249 ++++
 drivers/gpu/drm/nouveau/nvkm/subdev/acr/priv.h     |  151 +++
 drivers/gpu/drm/nouveau/nvkm/subdev/acr/tu102.c    |  215 ++++
 drivers/gpu/drm/nouveau/nvkm/subdev/fault/Kbuild   |    1 +
 drivers/gpu/drm/nouveau/nvkm/subdev/fault/base.c   |    3 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/fault/gp100.c  |   17 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/fault/gp10b.c  |   53 +
 drivers/gpu/drm/nouveau/nvkm/subdev/fault/gv100.c  |    1 +
 drivers/gpu/drm/nouveau/nvkm/subdev/fault/priv.h   |   10 +
 drivers/gpu/drm/nouveau/nvkm/subdev/fault/tu102.c  |    1 +
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/base.c      |   19 +
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/gp102.c     |   96 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/gv100.c     |    9 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/priv.h      |   10 +
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgf100.c  |    2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgf108.c  |    2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgk104.c  |    2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgm107.c  |    2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgm200.c  |    2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgp100.c  |    2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/Kbuild     |    1 +
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/base.c     |   59 +
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/gv100.c    |   53 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h     |   15 +
 drivers/gpu/drm/nouveau/nvkm/subdev/ltc/Kbuild     |    1 +
 drivers/gpu/drm/nouveau/nvkm/subdev/ltc/gp10b.c    |   65 +
 drivers/gpu/drm/nouveau/nvkm/subdev/ltc/priv.h     |    2 +
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/gf100.c    |    3 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/gm200.c    |    3 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/nv50.c     |    3 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/priv.h     |    8 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/tu102.c    |   16 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/ummu.c     |    7 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgf100.c |    6 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c |    6 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmnv50.c  |    6 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/pmu/Kbuild     |    1 +
 drivers/gpu/drm/nouveau/nvkm/subdev/pmu/base.c     |   53 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gf100.c    |   15 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gf119.c    |    9 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gk104.c    |    9 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gk110.c    |    9 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gk208.c    |    9 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gk20a.c    |   21 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gm107.c    |    9 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gm20b.c    |  211 +++-
 drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gp100.c    |    9 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gp102.c    |    9 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gp10b.c    |   96 ++
 drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gt215.c    |   27 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/pmu/priv.h     |   33 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/secboot/Kbuild |   17 -
 drivers/gpu/drm/nouveau/nvkm/subdev/secboot/acr.c  |   54 -
 drivers/gpu/drm/nouveau/nvkm/subdev/secboot/acr.h  |   70 --
 .../gpu/drm/nouveau/nvkm/subdev/secboot/acr_r352.c | 1241 --------------------
 .../gpu/drm/nouveau/nvkm/subdev/secboot/acr_r352.h |  167 ---
 .../gpu/drm/nouveau/nvkm/subdev/secboot/acr_r361.c |  229 ----
 .../gpu/drm/nouveau/nvkm/subdev/secboot/acr_r361.h |   71 --
 .../gpu/drm/nouveau/nvkm/subdev/secboot/acr_r364.c |  117 --
 .../gpu/drm/nouveau/nvkm/subdev/secboot/acr_r367.c |  418 -------
 .../gpu/drm/nouveau/nvkm/subdev/secboot/acr_r370.c |  168 ---
 .../gpu/drm/nouveau/nvkm/subdev/secboot/acr_r370.h |   50 -
 .../gpu/drm/nouveau/nvkm/subdev/secboot/acr_r375.c |   94 --
 drivers/gpu/drm/nouveau/nvkm/subdev/secboot/base.c |  213 ----
 .../gpu/drm/nouveau/nvkm/subdev/secboot/gm200.c    |  262 -----
 .../gpu/drm/nouveau/nvkm/subdev/secboot/gm200.h    |   46 -
 .../gpu/drm/nouveau/nvkm/subdev/secboot/gm20b.c    |  148 ---
 .../gpu/drm/nouveau/nvkm/subdev/secboot/gp102.c    |  264 -----
 .../gpu/drm/nouveau/nvkm/subdev/secboot/gp108.c    |   88 --
 .../gpu/drm/nouveau/nvkm/subdev/secboot/gp10b.c    |   95 --
 .../gpu/drm/nouveau/nvkm/subdev/secboot/hs_ucode.c |   97 --
 .../gpu/drm/nouveau/nvkm/subdev/secboot/hs_ucode.h |   81 --
 .../gpu/drm/nouveau/nvkm/subdev/secboot/ls_ucode.h |  161 ---
 .../drm/nouveau/nvkm/subdev/secboot/ls_ucode_gr.c  |  160 ---
 .../nvkm/subdev/secboot/ls_ucode_msgqueue.c        |  177 ---
 drivers/gpu/drm/nouveau/nvkm/subdev/secboot/priv.h |   65 -
 208 files changed, 8123 insertions(+), 7774 deletions(-)
 create mode 100644 drivers/gpu/drm/nouveau/include/nvfw/acr.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvfw/flcn.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvfw/fw.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvfw/hs.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvfw/ls.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvfw/pmu.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvfw/sec2.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvkm/core/falcon.h
 delete mode 100644 drivers/gpu/drm/nouveau/include/nvkm/core/msgqueue.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvkm/subdev/acr.h
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxtu102.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/gr/gp108.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/gr/tu102.c
 rename drivers/gpu/drm/nouveau/nvkm/engine/nvdec/{gp102.c => gm107.c} (56%)
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/nvenc/base.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/nvenc/gm107.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/nvenc/priv.h
 rename drivers/gpu/drm/nouveau/nvkm/{subdev/secboot/acr_r367.h =>
engine/sec2/gp108.c} (50%)
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/falcon/cmdq.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/falcon/msgq.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/falcon/msgqueue.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/falcon/msgqueue.h
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/falcon/msgqueue_0137c63d.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/falcon/msgqueue_0148cdec.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/falcon/qmgr.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/falcon/qmgr.h
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/nvfw/Kbuild
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/nvfw/acr.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/nvfw/flcn.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/nvfw/fw.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/nvfw/hs.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/nvfw/ls.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/acr/Kbuild
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/acr/base.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/acr/gm200.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/acr/gm20b.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/acr/gp102.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/acr/gp108.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/acr/gp10b.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/acr/hsfw.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/acr/priv.h
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/acr/tu102.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/fault/gp10b.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/base.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/ltc/gp10b.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gp10b.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/secboot/Kbuild
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/secboot/acr.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/secboot/acr.h
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/secboot/acr_r352.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/secboot/acr_r352.h
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/secboot/acr_r361.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/secboot/acr_r361.h
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/secboot/acr_r364.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/secboot/acr_r367.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/secboot/acr_r370.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/secboot/acr_r370.h
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/secboot/acr_r375.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/secboot/base.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/secboot/gm200.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/secboot/gm200.h
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/secboot/gm20b.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/secboot/gp102.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/secboot/gp108.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/secboot/gp10b.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/secboot/hs_ucode.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/secboot/hs_ucode.h
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/secboot/ls_ucode.h
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/secboot/ls_ucode_gr.c
 delete mode 100644
drivers/gpu/drm/nouveau/nvkm/subdev/secboot/ls_ucode_msgqueue.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/secboot/priv.h
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
