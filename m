Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D6C318369
	for <lists+dri-devel@lfdr.de>; Thu, 11 Feb 2021 03:07:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9627D6EDB9;
	Thu, 11 Feb 2021 02:07:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com
 [IPv6:2607:f8b0:4864:20::b29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56B586EDB9
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Feb 2021 02:07:29 +0000 (UTC)
Received: by mail-yb1-xb29.google.com with SMTP id p186so4111038ybg.2
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Feb 2021 18:07:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=pqL2p1dCjXqH3lRomTWJKbu9S7+5tUNbjk3s53CaQfc=;
 b=MGAVNY5BHLCRNMkFZ0RREkHMy42Wz/ePrpYr6SUlzT7NFK+elxKre+zC8R+6Hs7s1z
 xioNdFD+zV0caMcIDk2lICuGiKExaQ6AmQb4sRmmFpL2o8GMCw6BBnHQL0Yn9J8Q3FbU
 1yT5b8L78xUs4l6cCpGF6AxmkGzgFfcar9RXmo9z/sPoMlBkHtvlu5nKcA3Lv7m5Qbnx
 +15A/AEGANfpuGcpKySkMWg/b3YIhDjuM8jCe0YUKDMCn+72XpZg0oVdG3MjTnVnMIyN
 xkPD32rSWZWTBKj2VboKN5oj75bQVklXaBYRL/XcysW0cnA0cJviu12EBp+ctZeQOu0F
 n08g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=pqL2p1dCjXqH3lRomTWJKbu9S7+5tUNbjk3s53CaQfc=;
 b=MQ4rsRhYrRv/VCudeoxzjn/3Ix0bcaM2LNjdQ9TIkHBfXUdfBSL9TGo82AAbJYgKnr
 WDTXB5sCE0IKotwcExF7l790DfEzo0K0oVH5gQZ5D0tSPZGo+a9TUY7LehqqiIniM83c
 rRBULfvAIsfvCnxMKplm3x0OcZnJQhbA5qgEUnwFgLq24HApZCoLo07C5+4l3iV3K+Gy
 NRgOChC67kx+U5imnUyeGWuQDTfI8PpvgNFOBvp0aWkr0Be7Tjsiei2VUe4NF3GQyb9z
 /ysadXuBF/ZX7UFvEHcDt5KKfqOU233sGJVu+dV3aH0kPsHahN+YGUVcHaaLKiShvntH
 1Ksw==
X-Gm-Message-State: AOAM531gRuo1DTv5bGvEG0D2ljwosGCGOTt0n0ueCm14y9ZoHq2vuii5
 /cllBw837+5v23HaMTX2v6XP09f4Gi+TXA2Ta7LrYZRI//oExQ==
X-Google-Smtp-Source: ABdhPJz5pN5NbmWPPkeKRujabN5K8k9FdT5sk/DOGpUtccIZTGYXMqcfAGepw5FPwI+B4OdZk3Reb2oAwetWJo18kUY=
X-Received: by 2002:a05:6902:1025:: with SMTP id
 x5mr8499073ybt.96.1613009247448; 
 Wed, 10 Feb 2021 18:07:27 -0800 (PST)
MIME-Version: 1.0
From: Ben Skeggs <skeggsb@gmail.com>
Date: Thu, 11 Feb 2021 12:07:16 +1000
Message-ID: <CACAvsv4c_Y923ng0rT1y23wktHHyjEMsusb0=9Z7kQaVbxyPyQ@mail.gmail.com>
Subject: [PULL] nouveau-next 5.12
To: ML dri-devel <dri-devel@lists.freedesktop.org>,
 Dave Airlie <airlied@redhat.com>
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

Hey,

This is super late in the cycle, but after talking it over with Dave,
it's probably best to get this in sooner rather than later.  The vast
majority of the changes are simple and repetitive, but invasive in
that the constructor function signature of every sub-device module for
every chipset is touched.

The problem is that GA100 added enough new engine types and instances
that we would have begun to overflow various u64 bitfields used to
track the connections between various engines.

A less-invasive solution that was considered would have been to begin
to alias with engine types that no longer exist on newer hardware, but
that'd have only gotten us so far for so long, and introduces the
possibility of subtle and hard-to-detect bugs moving forward.

Instead, rather than addressing subdevs by a unique index, we give
each subdev a type and instance id, and replace the use of bitfields
tied to subdev index with other methods.

Notable changes:
- replace subdev index with subdev type + instance id
- engines that turn out to be fused-off (can't detect until later in
init) no longer leave dangling pointers around
- new subdev/instance additions no longer need to be made in multiple places
- ampere engine topology is now being parsed

Ben.

The following changes since commit 4c3a3292730c56591472717d8c5c0faf74f6c6bb:

  drm/amd/display: fix unused variable warning (2021-02-05 09:49:44 +1000)

are available in the Git repository at:

  git://github.com/skeggsb/linux 00.00-inst

for you to fetch changes up to f6df392dddbb9e637b785e7e3d9337a74923dc10:

  drm/nouveau/top/ga100: initial support (2021-02-11 11:50:04 +1000)

----------------------------------------------------------------
Ben Skeggs (87):
      drm/nouveau/engine: use refcount_t + private mutex
      drm/nouveau/fb: protect comptags with private mutex
      drm/nouveau/fb: protect vram mm with private mutex
      drm/nouveau/instmem: protect mm/lru with private mutex
      drm/nouveau/ltc: serialise cbc operations with private mutex
      drm/nouveau/mmu: serialise mmu invalidations with private mutex
      drm/nouveau/pmu: serialise send() with private mutex
      drm/nouveau/disp: use private spinlock to control exclusive access to disp
      drm/nouveau/fifo: private mutex
      drm/nouveau/perfmon: use private spinlock to control exclusive
access to perfmon
      drm/nouveau/subdev: remove nvkm_subdev.mutex
      drm/nouveau/subdev: store subdevs in list
      drm/nouveau/subdev: store full subdev name in struct
      drm/nouveau/subdev: track type+instance separately
      drm/nouveau/device: pass instance id when looking up a subdev/engine
      drm/nouveau/nvkm: add macros for subdev layout
      drm/nouveau/acr: switch to instanced constructor
      drm/nouveau/bar: switch to instanced constructor
      drm/nouveau/bios: switch to instanced constructor
      drm/nouveau/bus: switch to instanced constructor
      drm/nouveau/clk: switch to instanced constructor
      drm/nouveau/devinit: switch to instanced constructor
      drm/nouveau/fault: switch to instanced constructor
      drm/nouveau/fb: switch to instanced constructor
      drm/nouveau/fuse: switch to instanced constructor
      drm/nouveau/gpio: switch to instanced constructor
      drm/nouveau/gsp: switch to instanced constructor
      drm/nouveau/i2c: switch to instanced constructor
      drm/nouveau/ibus: switch to instanced constructor
      drm/nouveau/iccsense: switch to instanced constructor
      drm/nouveau/instmem: switch to instanced constructor
      drm/nouveau/ltc: switch to instanced constructor
      drm/nouveau/top: store device type and instance separately
      drm/nouveau/top: expose parsed device info more directly
      drm/nouveau/mc: switch to instanced constructor
      drm/nouveau/mc: lookup subdev interrupt handlers with split type+inst
      drm/nouveau/mc: use split type+inst in device reset APIs
      drm/nouveau/mc: use split type+inst in interrupt masking API
      drm/nouveau/mc: use split type+inst when handling dev_top interrupts
      drm/nouveau/mmu: switch to instanced constructor
      drm/nouveau/mmu: index engref by subdev type
      drm/nouveau/mxm: switch to instanced constructor
      drm/nouveau/pci: switch to instanced constructor
      drm/nouveau/pmu: switch to instanced constructor
      drm/nouveau/therm: switch to instanced constructor
      drm/nouveau/therm/gk104: use split subdev type+inst in cg engine lists
      drm/nouveau/tmr: switch to instanced constructor
      drm/nouveau/top: switch to instanced constructor
      drm/nouveau/volt: switch to instanced constructor
      drm/nouveau/bsp,vp: switch to instanced constructor
      drm/nouveau/falcon: use split type+inst when looking up PRI addr
      drm/nouveau/ce: switch to instanced constructor
      drm/nouveau/ce: make use of nvkm_subdev.inst
      drm/nouveau/cipher: switch to instanced constructor
      drm/nouveau/disp: switch to instanced constructor
      drm/nouveau/dma: switch to instanced constructor
      drm/nouveau/fifo: switch to instanced constructor
      drm/nouveau/fifo: add engine_id hook
      drm/nouveau/fifo: index base engctx by engine id
      drm/nouveau/fifo: index backend engctx by engine id
      drm/nouveau/fifo: add id_engine hook
      drm/nouveau/fifo: turn chan subdev mask into engine mask
      drm/nouveau/fifo: use type+inst to determine context pointer offsets
      drm/nouveau/fifo/gf100: use fifo engine id for engine recovery mask
      drm/nouveau/fifo/gf100-: switch static mmu fault id list to type+inst
      drm/nouveau/fifo/gk104-: switch dev_top fault handling to type+inst
      drm/nouveau/fifo/gk104-: remove use of subdev index in runlist
topology info
      drm/nouveau/gr: switch to instanced constructor
      drm/nouveau/ifb: switch to instanced constructor
      drm/nouveau/me: switch to instanced constructor
      drm/nouveau/mpeg: switch to instanced constructor
      drm/nouveau/msenc: switch to instanced constructor
      drm/nouveau/mspdec: switch to instanced constructor
      drm/nouveau/msppp: switch to instanced constructor
      drm/nouveau/msvld: switch to instanced constructor
      drm/nouveau/nvdec: switch to instanced constructor
      drm/nouveau/nvenc: switch to instanced constructor
      drm/nouveau/pm: switch to instanced constructor
      drm/nouveau/sec: switch to instanced constructor
      drm/nouveau/sec2: switch to instanced constructor
      drm/nouveau/sw: switch to instanced constructor
      drm/nouveau/vic: switch to instanced constructor
      drm/nouveau/nvkm: determine subdev id/order from layout
      drm/nouveau/nvkm: remove nvkm_subdev.index
      drm/nouveau/privring: rename from ibus
      drm/nouveau/top: add ioctrl/nvjpg
      drm/nouveau/top/ga100: initial support

 drivers/gpu/drm/nouveau/include/nvif/cl0080.h                  |   52 +-
 drivers/gpu/drm/nouveau/include/nvif/fifo.h                    |    6 +-
 drivers/gpu/drm/nouveau/include/nvkm/core/device.h             |  191 +-
 drivers/gpu/drm/nouveau/include/nvkm/core/engine.h             |   13 +-
 drivers/gpu/drm/nouveau/include/nvkm/core/enum.h               |    1 +
 drivers/gpu/drm/nouveau/include/nvkm/core/falcon.h             |   10 +-
 drivers/gpu/drm/nouveau/include/nvkm/core/layout.h             |   53 +
 drivers/gpu/drm/nouveau/include/nvkm/core/subdev.h             |   31 +-
 drivers/gpu/drm/nouveau/include/nvkm/engine/bsp.h              |    2 +-
 drivers/gpu/drm/nouveau/include/nvkm/engine/ce.h               |   18 +-
 drivers/gpu/drm/nouveau/include/nvkm/engine/cipher.h           |    2 +-
 drivers/gpu/drm/nouveau/include/nvkm/engine/disp.h             |   41 +-
 drivers/gpu/drm/nouveau/include/nvkm/engine/dma.h              |   10 +-
 drivers/gpu/drm/nouveau/include/nvkm/engine/falcon.h           |    2 +-
 drivers/gpu/drm/nouveau/include/nvkm/engine/fifo.h             |   42 +-
 drivers/gpu/drm/nouveau/include/nvkm/engine/gr.h               |   80 +-
 drivers/gpu/drm/nouveau/include/nvkm/engine/mpeg.h             |   10 +-
 drivers/gpu/drm/nouveau/include/nvkm/engine/mspdec.h           |    8 +-
 drivers/gpu/drm/nouveau/include/nvkm/engine/msppp.h            |    6 +-
 drivers/gpu/drm/nouveau/include/nvkm/engine/msvld.h            |   10 +-
 drivers/gpu/drm/nouveau/include/nvkm/engine/nvdec.h            |    2 +-
 drivers/gpu/drm/nouveau/include/nvkm/engine/nvenc.h            |    2 +-
 drivers/gpu/drm/nouveau/include/nvkm/engine/pm.h               |   23 +-
 drivers/gpu/drm/nouveau/include/nvkm/engine/sec.h              |    2 +-
 drivers/gpu/drm/nouveau/include/nvkm/engine/sec2.h             |    6 +-
 drivers/gpu/drm/nouveau/include/nvkm/engine/sw.h               |    8 +-
 drivers/gpu/drm/nouveau/include/nvkm/engine/vp.h               |    2 +-
 drivers/gpu/drm/nouveau/include/nvkm/engine/xtensa.h           |    2 +-
 drivers/gpu/drm/nouveau/include/nvkm/subdev/acr.h              |   12 +-
 drivers/gpu/drm/nouveau/include/nvkm/subdev/bar.h              |   14 +-
 drivers/gpu/drm/nouveau/include/nvkm/subdev/bios.h             |    2 +-
 drivers/gpu/drm/nouveau/include/nvkm/subdev/bus.h              |   10 +-
 drivers/gpu/drm/nouveau/include/nvkm/subdev/clk.h              |   20 +-
 drivers/gpu/drm/nouveau/include/nvkm/subdev/devinit.h          |   35 +-
 drivers/gpu/drm/nouveau/include/nvkm/subdev/fault.h            |    8 +-
 drivers/gpu/drm/nouveau/include/nvkm/subdev/fb.h               |   75 +-
 drivers/gpu/drm/nouveau/include/nvkm/subdev/fuse.h             |    6 +-
 drivers/gpu/drm/nouveau/include/nvkm/subdev/gpio.h             |   12 +-
 drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h              |    2 +-
 drivers/gpu/drm/nouveau/include/nvkm/subdev/i2c.h              |   18 +-
 drivers/gpu/drm/nouveau/include/nvkm/subdev/ibus.h             |   12 -
 drivers/gpu/drm/nouveau/include/nvkm/subdev/iccsense.h         |    2 +-
 drivers/gpu/drm/nouveau/include/nvkm/subdev/instmem.h          |   13 +-
 drivers/gpu/drm/nouveau/include/nvkm/subdev/ltc.h              |   16 +-
 drivers/gpu/drm/nouveau/include/nvkm/subdev/mc.h               |   40 +-
 drivers/gpu/drm/nouveau/include/nvkm/subdev/mmu.h              |   32 +-
 drivers/gpu/drm/nouveau/include/nvkm/subdev/mxm.h              |    2 +-
 drivers/gpu/drm/nouveau/include/nvkm/subdev/pci.h              |   22 +-
 drivers/gpu/drm/nouveau/include/nvkm/subdev/pmu.h              |   25 +-
 drivers/gpu/drm/nouveau/include/nvkm/subdev/privring.h         |   12 +
 drivers/gpu/drm/nouveau/include/nvkm/subdev/therm.h            |   18 +-
 drivers/gpu/drm/nouveau/include/nvkm/subdev/timer.h            |    8 +-
 drivers/gpu/drm/nouveau/include/nvkm/subdev/top.h              |   27 +-
 drivers/gpu/drm/nouveau/include/nvkm/subdev/volt.h             |   12 +-
 drivers/gpu/drm/nouveau/nouveau_abi16.c                        |   14 +-
 drivers/gpu/drm/nouveau/nouveau_chan.c                         |    2 +-
 drivers/gpu/drm/nouveau/nouveau_drm.c                          |    2 +-
 drivers/gpu/drm/nouveau/nvif/fifo.c                            |   30 +-
 drivers/gpu/drm/nouveau/nvkm/core/engine.c                     |   51 +-
 drivers/gpu/drm/nouveau/nvkm/core/memory.c                     |   18 +-
 drivers/gpu/drm/nouveau/nvkm/core/subdev.c                     |  110 +-
 drivers/gpu/drm/nouveau/nvkm/engine/bsp/g84.c                  |    5 +-
 drivers/gpu/drm/nouveau/nvkm/engine/ce/gf100.c                 |   17 +-
 drivers/gpu/drm/nouveau/nvkm/engine/ce/gk104.c                 |    6 +-
 drivers/gpu/drm/nouveau/nvkm/engine/ce/gm107.c                 |    4 +-
 drivers/gpu/drm/nouveau/nvkm/engine/ce/gm200.c                 |    4 +-
 drivers/gpu/drm/nouveau/nvkm/engine/ce/gp100.c                 |    6 +-
 drivers/gpu/drm/nouveau/nvkm/engine/ce/gp102.c                 |    4 +-
 drivers/gpu/drm/nouveau/nvkm/engine/ce/gt215.c                 |    6 +-
 drivers/gpu/drm/nouveau/nvkm/engine/ce/gv100.c                 |    4 +-
 drivers/gpu/drm/nouveau/nvkm/engine/ce/tu102.c                 |    4 +-
 drivers/gpu/drm/nouveau/nvkm/engine/cipher/g84.c               |    4 +-
 drivers/gpu/drm/nouveau/nvkm/engine/device/base.c              | 4599
+++++++++++++---------------
 drivers/gpu/drm/nouveau/nvkm/engine/device/priv.h              |    2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/device/user.c              |   40 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/base.c                |   27 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/channv50.c            |    2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/g84.c                 |    5 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/g94.c                 |    5 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/ga102.c               |    5 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/gf119.c               |    5 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/gk104.c               |    5 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/gk110.c               |    5 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/gm107.c               |    5 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/gm200.c               |    5 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/gp100.c               |    5 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/gp102.c               |    5 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/gt200.c               |    5 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/gt215.c               |    5 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/gv100.c               |    5 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/mcp77.c               |    5 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/mcp89.c               |    5 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/nv04.c                |    5 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/nv50.c                |    9 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/nv50.h                |    4 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/priv.h                |    8 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/tu102.c               |    5 +-
 drivers/gpu/drm/nouveau/nvkm/engine/dma/base.c                 |    4 +-
 drivers/gpu/drm/nouveau/nvkm/engine/dma/gf100.c                |    5 +-
 drivers/gpu/drm/nouveau/nvkm/engine/dma/gf119.c                |    5 +-
 drivers/gpu/drm/nouveau/nvkm/engine/dma/gv100.c                |    5 +-
 drivers/gpu/drm/nouveau/nvkm/engine/dma/nv04.c                 |    5 +-
 drivers/gpu/drm/nouveau/nvkm/engine/dma/nv50.c                 |    5 +-
 drivers/gpu/drm/nouveau/nvkm/engine/dma/priv.h                 |    4 +-
 drivers/gpu/drm/nouveau/nvkm/engine/falcon.c                   |   11 +-
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/base.c                |   10 +-
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/chan.c                |   38 +-
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/chan.h                |    2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/chang84.c             |   63 +-
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/changf100.h           |   11 +-
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/changk104.h           |    6 +-
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/channv04.h            |    6 +-
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/channv50.c            |   28 +-
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/channv50.h            |   22 +-
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/dmanv04.c             |   16 +-
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/dmanv10.c             |    6 +-
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/dmanv17.c             |    8 +-
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/dmanv40.c             |   32 +-
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/g84.c                 |   75 +-
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/gf100.c               |   99 +-
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/gk104.c               |  161 +-
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/gk104.h               |    3 +-
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/gk110.c               |    5 +-
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/gk208.c               |    5 +-
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/gk20a.c               |    5 +-
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/gm107.c               |    5 +-
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/gm200.c               |    5 +-
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/gm20b.c               |    5 +-
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/gp100.c               |    5 +-
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/gp10b.c               |    5 +-
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/gpfifogf100.c         |   53 +-
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/gpfifogk104.c         |   60 +-
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/gpfifogv100.c         |   27 +-
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/gv100.c               |    5 +-
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/nv04.c                |   44 +-
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/nv04.h                |    5 +-
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/nv10.c                |    8 +-
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/nv17.c                |    8 +-
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/nv40.c                |    8 +-
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/nv50.c                |   15 +-
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/nv50.h                |    4 +-
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/priv.h                |   11 +-
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/tu102.c               |   29 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/base.c                  |    4 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/g84.c                   |    4 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c                 |   10 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.h                 |    2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf104.c                 |    4 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf108.c                 |    4 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf110.c                 |    4 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf117.c                 |    4 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf119.c                 |    4 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/gk104.c                 |    4 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/gk110.c                 |    4 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/gk110b.c                |    5 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/gk208.c                 |    4 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/gk20a.c                 |    4 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/gm107.c                 |    4 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/gm200.c                 |    4 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/gm20b.c                 |    4 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/gp100.c                 |    4 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/gp102.c                 |    4 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/gp104.c                 |    4 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/gp107.c                 |    4 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/gp108.c                 |    4 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/gp10b.c                 |    4 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/gt200.c                 |    4 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/gt215.c                 |    4 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/gv100.c                 |    4 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/mcp79.c                 |    4 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/mcp89.c                 |    4 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/nv04.c                  |    4 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/nv10.c                  |    8 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/nv10.h                  |    2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/nv15.c                  |    4 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/nv17.c                  |    4 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/nv20.c                  |    8 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/nv20.h                  |    4 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/nv25.c                  |    4 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/nv2a.c                  |    4 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/nv30.c                  |    4 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/nv34.c                  |    4 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/nv35.c                  |    4 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/nv40.c                  |    8 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/nv40.h                  |    2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/nv44.c                  |    4 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/nv50.c                  |    8 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/nv50.h                  |    2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/priv.h                  |    4 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/tu102.c                 |    4 +-
 drivers/gpu/drm/nouveau/nvkm/engine/mpeg/g84.c                 |    5 +-
 drivers/gpu/drm/nouveau/nvkm/engine/mpeg/nv31.c                |   10 +-
 drivers/gpu/drm/nouveau/nvkm/engine/mpeg/nv31.h                |    4 +-
 drivers/gpu/drm/nouveau/nvkm/engine/mpeg/nv40.c                |    5 +-
 drivers/gpu/drm/nouveau/nvkm/engine/mpeg/nv44.c                |    5 +-
 drivers/gpu/drm/nouveau/nvkm/engine/mpeg/nv50.c                |    5 +-
 drivers/gpu/drm/nouveau/nvkm/engine/mspdec/base.c              |    7 +-
 drivers/gpu/drm/nouveau/nvkm/engine/mspdec/g98.c               |    6 +-
 drivers/gpu/drm/nouveau/nvkm/engine/mspdec/gf100.c             |    4 +-
 drivers/gpu/drm/nouveau/nvkm/engine/mspdec/gk104.c             |    4 +-
 drivers/gpu/drm/nouveau/nvkm/engine/mspdec/gt215.c             |    6 +-
 drivers/gpu/drm/nouveau/nvkm/engine/mspdec/priv.h              |    4 +-
 drivers/gpu/drm/nouveau/nvkm/engine/msppp/base.c               |    4 +-
 drivers/gpu/drm/nouveau/nvkm/engine/msppp/g98.c                |    4 +-
 drivers/gpu/drm/nouveau/nvkm/engine/msppp/gf100.c              |    4 +-
 drivers/gpu/drm/nouveau/nvkm/engine/msppp/gt215.c              |    6 +-
 drivers/gpu/drm/nouveau/nvkm/engine/msppp/priv.h               |    4 +-
 drivers/gpu/drm/nouveau/nvkm/engine/msvld/base.c               |    4 +-
 drivers/gpu/drm/nouveau/nvkm/engine/msvld/g98.c                |    4 +-
 drivers/gpu/drm/nouveau/nvkm/engine/msvld/gf100.c              |    4 +-
 drivers/gpu/drm/nouveau/nvkm/engine/msvld/gk104.c              |    4 +-
 drivers/gpu/drm/nouveau/nvkm/engine/msvld/gt215.c              |    6 +-
 drivers/gpu/drm/nouveau/nvkm/engine/msvld/mcp89.c              |    6 +-
 drivers/gpu/drm/nouveau/nvkm/engine/msvld/priv.h               |    4 +-
 drivers/gpu/drm/nouveau/nvkm/engine/nvdec/base.c               |    6 +-
 drivers/gpu/drm/nouveau/nvkm/engine/nvdec/gm107.c              |    4 +-
 drivers/gpu/drm/nouveau/nvkm/engine/nvdec/priv.h               |    4 +-
 drivers/gpu/drm/nouveau/nvkm/engine/nvenc/base.c               |    6 +-
 drivers/gpu/drm/nouveau/nvkm/engine/nvenc/gm107.c              |    4 +-
 drivers/gpu/drm/nouveau/nvkm/engine/nvenc/priv.h               |    2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/pm/base.c                  |   23 +-
 drivers/gpu/drm/nouveau/nvkm/engine/pm/g84.c                   |    4 +-
 drivers/gpu/drm/nouveau/nvkm/engine/pm/gf100.c                 |    8 +-
 drivers/gpu/drm/nouveau/nvkm/engine/pm/gf100.h                 |    4 +-
 drivers/gpu/drm/nouveau/nvkm/engine/pm/gf108.c                 |    4 +-
 drivers/gpu/drm/nouveau/nvkm/engine/pm/gf117.c                 |    4 +-
 drivers/gpu/drm/nouveau/nvkm/engine/pm/gk104.c                 |    4 +-
 drivers/gpu/drm/nouveau/nvkm/engine/pm/gt200.c                 |    4 +-
 drivers/gpu/drm/nouveau/nvkm/engine/pm/gt215.c                 |    4 +-
 drivers/gpu/drm/nouveau/nvkm/engine/pm/nv40.c                  |    8 +-
 drivers/gpu/drm/nouveau/nvkm/engine/pm/nv40.h                  |    4 +-
 drivers/gpu/drm/nouveau/nvkm/engine/pm/nv50.c                  |    4 +-
 drivers/gpu/drm/nouveau/nvkm/engine/pm/priv.h                  |    4 +-
 drivers/gpu/drm/nouveau/nvkm/engine/sec/g98.c                  |    5 +-
 drivers/gpu/drm/nouveau/nvkm/engine/sec2/base.c                |    6 +-
 drivers/gpu/drm/nouveau/nvkm/engine/sec2/gp102.c               |    5 +-
 drivers/gpu/drm/nouveau/nvkm/engine/sec2/gp108.c               |    5 +-
 drivers/gpu/drm/nouveau/nvkm/engine/sec2/priv.h                |    2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/sec2/tu102.c               |    5 +-
 drivers/gpu/drm/nouveau/nvkm/engine/sw/base.c                  |    4 +-
 drivers/gpu/drm/nouveau/nvkm/engine/sw/gf100.c                 |    4 +-
 drivers/gpu/drm/nouveau/nvkm/engine/sw/nv04.c                  |    4 +-
 drivers/gpu/drm/nouveau/nvkm/engine/sw/nv10.c                  |    4 +-
 drivers/gpu/drm/nouveau/nvkm/engine/sw/nv50.c                  |    4 +-
 drivers/gpu/drm/nouveau/nvkm/engine/sw/priv.h                  |    4 +-
 drivers/gpu/drm/nouveau/nvkm/engine/vp/g84.c                   |    6 +-
 drivers/gpu/drm/nouveau/nvkm/engine/xtensa.c                   |    9 +-
 drivers/gpu/drm/nouveau/nvkm/falcon/base.c                     |   14 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/Kbuild                     |    2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/acr/base.c                 |    4 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/acr/gm200.c                |    9 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/acr/gm20b.c                |    5 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/acr/gp102.c                |    5 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/acr/gp108.c                |    5 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/acr/gp10b.c                |    5 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/acr/priv.h                 |    4 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/acr/tu102.c                |    5 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/bar/base.c                 |    4 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/bar/g84.c                  |    5 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/bar/gf100.c                |    9 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/bar/gf100.h                |    2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/bar/gk20a.c                |    5 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/bar/gm107.c                |    5 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/bar/gm20b.c                |    5 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/bar/nv50.c                 |    9 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/bar/nv50.h                 |    2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/bar/priv.h                 |    2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/bar/tu102.c                |    5 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/bios/base.c                |    5 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/bus/base.c                 |    4 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/bus/g94.c                  |    5 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/bus/gf100.c                |    7 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/bus/nv04.c                 |    5 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/bus/nv31.c                 |    5 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/bus/nv50.c                 |    5 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/bus/priv.h                 |    2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c                 |    8 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/clk/g84.c                  |    6 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/clk/gf100.c                |    5 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/clk/gk104.c                |    5 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/clk/gk20a.c                |   16 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/clk/gk20a.h                |    4 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/clk/gm20b.c                |   17 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/clk/gt215.c                |    5 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/clk/mcp77.c                |    5 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/clk/nv04.c                 |    5 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/clk/nv40.c                 |    5 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/clk/nv50.c                 |    9 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/clk/nv50.h                 |    2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/clk/priv.h                 |    4 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/devinit/base.c             |   11 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/devinit/g84.c              |   18 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/devinit/g98.c              |   16 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/devinit/ga100.c            |    5 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/devinit/gf100.c            |   20 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/devinit/gm107.c            |   12 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/devinit/gm200.c            |    6 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/devinit/gt215.c            |   16 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/devinit/gv100.c            |    6 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/devinit/mcp89.c            |   18 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/devinit/nv04.c             |   11 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/devinit/nv04.h             |    2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/devinit/nv05.c             |    4 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/devinit/nv10.c             |    4 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/devinit/nv1a.c             |    4 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/devinit/nv20.c             |    4 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/devinit/nv50.c             |   17 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/devinit/nv50.h             |    2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/devinit/priv.h             |    3 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/devinit/tu102.c            |    6 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/fault/base.c               |    4 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/fault/gp100.c              |    6 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/fault/gp10b.c              |    4 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/fault/gv100.c              |    4 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/fault/priv.h               |    4 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/fault/tu102.c              |    6 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/base.c                  |   18 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/g84.c                   |    4 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/ga100.c                 |    4 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/ga102.c                 |    4 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/gf100.c                 |    8 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/gf100.h                 |    4 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/gf108.c                 |    4 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/gk104.c                 |    4 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/gk110.c                 |    4 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/gk20a.c                 |    4 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/gm107.c                 |    4 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/gm200.c                 |    4 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/gm20b.c                 |    4 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/gp100.c                 |    4 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/gp102.c                 |    8 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/gp10b.c                 |    4 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/gt215.c                 |    4 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/gv100.c                 |    4 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/mcp77.c                 |    4 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/mcp89.c                 |    4 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/nv04.c                  |    4 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/nv10.c                  |    4 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/nv1a.c                  |    4 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/nv20.c                  |    8 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/nv25.c                  |    6 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/nv30.c                  |    6 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/nv35.c                  |    6 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/nv36.c                  |    6 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/nv40.c                  |    6 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/nv41.c                  |    4 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/nv44.c                  |    4 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/nv46.c                  |    4 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/nv47.c                  |    4 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/nv49.c                  |    4 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/nv4e.c                  |    4 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/nv50.c                  |    9 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/nv50.h                  |    2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/priv.h                  |    6 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/ram.c                   |   12 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgk104.c              |    8 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/fuse/base.c                |    4 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/fuse/gf100.c               |    5 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/fuse/gm107.c               |    5 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/fuse/nv50.c                |    5 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/fuse/priv.h                |    4 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/gpio/base.c                |    4 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/gpio/g94.c                 |    5 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/gpio/ga102.c               |    5 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/gpio/gf119.c               |    5 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/gpio/gk104.c               |    5 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/gpio/nv10.c                |    5 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/gpio/nv50.c                |    5 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/gpio/priv.h                |    4 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/base.c                 |    8 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/gv100.c                |    5 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h                 |    2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/i2c/base.c                 |    4 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/i2c/g94.c                  |    5 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/i2c/gf117.c                |    5 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/i2c/gf119.c                |    5 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/i2c/gk104.c                |    5 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/i2c/gk110.c                |    5 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/i2c/gm200.c                |    5 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/i2c/nv04.c                 |    5 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/i2c/nv4e.c                 |    5 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/i2c/nv50.c                 |    5 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/i2c/priv.h                 |    4 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/ibus/Kbuild                |    7 -
 drivers/gpu/drm/nouveau/nvkm/subdev/ibus/priv.h                |    9 -
 drivers/gpu/drm/nouveau/nvkm/subdev/iccsense/base.c            |    8 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/iccsense/gf100.c           |    4 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/iccsense/priv.h            |    4 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/instmem/base.c             |   14 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/instmem/gk20a.c            |    4 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv04.c             |   15 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv40.c             |   15 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c             |   34 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/instmem/priv.h             |    2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/ltc/base.c                 |   10 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/ltc/gf100.c                |    9 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/ltc/gk104.c                |    5 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/ltc/gm107.c                |    5 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/ltc/gm200.c                |    5 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/ltc/gp100.c                |    5 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/ltc/gp102.c                |    5 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/ltc/gp10b.c                |    5 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/ltc/priv.h                 |    4 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/mc/base.c                  |   64 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/mc/g84.c                   |    4 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/mc/g98.c                   |    4 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/mc/ga100.c                 |    4 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/mc/gf100.c                 |   16 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/mc/gk104.c                 |    8 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/mc/gk20a.c                 |    4 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/mc/gp100.c                 |   10 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/mc/gp10b.c                 |    4 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/mc/gt215.c                 |    8 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/mc/nv04.c                  |    4 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/mc/nv11.c                  |    4 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/mc/nv17.c                  |    4 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/mc/nv44.c                  |    4 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/mc/nv50.c                  |    4 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/mc/priv.h                  |   13 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/mc/tu102.c                 |   10 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/base.c                 |   10 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/g84.c                  |    5 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/gf100.c                |    5 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/gk104.c                |    5 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/gk20a.c                |    5 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/gm200.c                |    7 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/gm20b.c                |    7 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/gp100.c                |    7 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/gp10b.c                |    7 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/gv100.c                |    5 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/mcp77.c                |    5 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/nv04.c                 |    5 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/nv41.c                 |    7 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/nv44.c                 |    7 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/nv50.c                 |    5 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/priv.h                 |    8 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/tu102.c                |    5 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgf100.c             |    7 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmnv41.c              |    7 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmnv50.c              |    9 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmtu102.c             |    7 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/mxm/base.c                 |    5 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/mxm/nv50.c                 |    5 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/mxm/priv.h                 |    2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/pci/base.c                 |    4 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/pci/g84.c                  |    5 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/pci/g92.c                  |    5 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/pci/g94.c                  |    5 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/pci/gf100.c                |    5 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/pci/gf106.c                |    5 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/pci/gk104.c                |    5 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/pci/gp100.c                |    5 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/pci/nv04.c                 |    5 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/pci/nv40.c                 |    5 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/pci/nv46.c                 |    5 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/pci/nv4c.c                 |    5 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/pci/priv.h                 |    4 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/pmu/base.c                 |   16 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gf100.c                |   11 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gf119.c                |    5 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gk104.c                |    5 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gk110.c                |    5 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gk208.c                |    5 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gk20a.c                |    5 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gm107.c                |    5 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gm200.c                |    5 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gm20b.c                |    5 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gp102.c                |    5 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gp10b.c                |    5 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gt215.c                |   11 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/pmu/priv.h                 |    8 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/privring/Kbuild            |    7 +
 drivers/gpu/drm/nouveau/nvkm/subdev/{ibus => privring}/gf100.c |   44 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/{ibus => privring}/gf117.c |   16 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/{ibus => privring}/gk104.c |   46 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/{ibus => privring}/gk20a.c |   30 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/{ibus => privring}/gm200.c |   10 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/{ibus => privring}/gp10b.c |   18 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/privring/priv.h            |    8 +
 drivers/gpu/drm/nouveau/nvkm/subdev/therm/base.c               |   10 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/therm/g84.c                |    5 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/therm/gf119.c              |    6 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/therm/gk104.c              |   43 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/therm/gk104.h              |    3 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/therm/gm107.c              |    4 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/therm/gm200.c              |    4 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/therm/gp100.c              |    4 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/therm/gt215.c              |    6 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/therm/nv40.c               |    4 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/therm/nv50.c               |    4 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/therm/priv.h               |    8 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/timer/base.c               |    4 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/timer/gk20a.c              |    5 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/timer/nv04.c               |    5 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/timer/nv40.c               |    5 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/timer/nv41.c               |    5 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/timer/priv.h               |    4 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/top/Kbuild                 |    1 +
 drivers/gpu/drm/nouveau/nvkm/subdev/top/base.c                 |   70 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/top/ga100.c                |  107 +
 drivers/gpu/drm/nouveau/nvkm/subdev/top/gk104.c                |   46 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/top/priv.h                 |   15 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/volt/base.c                |    8 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/volt/gf100.c               |    5 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/volt/gf117.c               |    5 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/volt/gk104.c               |    5 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/volt/gk20a.c               |    8 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/volt/gk20a.h               |    2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/volt/gm20b.c               |   11 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/volt/nv40.c                |    5 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/volt/priv.h                |    8 +-
 511 files changed, 4854 insertions(+), 4792 deletions(-)
 create mode 100644 drivers/gpu/drm/nouveau/include/nvkm/core/layout.h
 delete mode 100644 drivers/gpu/drm/nouveau/include/nvkm/subdev/ibus.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvkm/subdev/privring.h
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/ibus/Kbuild
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/ibus/priv.h
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/privring/Kbuild
 rename drivers/gpu/drm/nouveau/nvkm/subdev/{ibus => privring}/gf100.c (71%)
 rename drivers/gpu/drm/nouveau/nvkm/subdev/{ibus => privring}/gf117.c (79%)
 rename drivers/gpu/drm/nouveau/nvkm/subdev/{ibus => privring}/gk104.c (71%)
 rename drivers/gpu/drm/nouveau/nvkm/subdev/{ibus => privring}/gk20a.c (73%)
 rename drivers/gpu/drm/nouveau/nvkm/subdev/{ibus => privring}/gm200.c (83%)
 rename drivers/gpu/drm/nouveau/nvkm/subdev/{ibus => privring}/gp10b.c (78%)
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/privring/priv.h
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/top/ga100.c
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
