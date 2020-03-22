Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6281B18ED47
	for <lists+dri-devel@lfdr.de>; Mon, 23 Mar 2020 00:29:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F17CC6E064;
	Sun, 22 Mar 2020 23:29:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5253D6E064;
 Sun, 22 Mar 2020 23:29:23 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id b23so14331684edx.4;
 Sun, 22 Mar 2020 16:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=qtuq6N55/cW3iPYtxBvjA3AV9DJr5vFxSYYSJdykhog=;
 b=R+FpMqx6TClSexIsQhyh1Mlzdrv6hzYHm3cHEpbK1Wc+PjexHu/uHgQB1dVwGsbMaS
 180Xp/KIvwqTGtIWsRsn7QH4mRJrk3HrjHXrmupbzjSYsA74EF1bCYf91L3qUnRLxCVI
 1sB3H7oulW15Cyv1GMpZXZICQeCRFne69dFPScPmbiMBjjltY/4R1NCP+pcT0Rq3k/B1
 XL156ow/owmNPb8iJkZ6GtmZiAwClK2/AJDj/g8/6HrpUhWapWFtTWVKZWFeWihYpj87
 W3KXWslYm2Yv66bb1RtoGRbBjPGCsn3+sWhAnKi36WEW7aegPubIibrvqUl+YNitXwov
 8Uzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=qtuq6N55/cW3iPYtxBvjA3AV9DJr5vFxSYYSJdykhog=;
 b=oLuo72pqCfUYc+MCsk2YoVw6Kjg9LvwERLq+6jReIKNFyuZcMfn5N8ET0ZKYqmBEen
 YsENUFBxzbb+SD+T+OFnueQ57VuBjoiNVDj+sYxstiIE8hZx1KcVMjdE7Br0BcbS287F
 o0FpOejX54PeXv+b4updha0Yn+OJ4hJG3h+tpRip/VbcETPTarQ6DAPDD2pebYVpaNiK
 aOxtnpE9bv8cLLayayFaSkX2FnaH1T0tWKACv+OalvbrekFoEpnmptifqQR6eaEh+Otu
 Iq81eZo2fM0Zr3yXWrHqMGqDL9ReuVAaNpfIl8RTc2k+DsELzYEP92fTHuhdp4gK5cqb
 y3XQ==
X-Gm-Message-State: ANhLgQ1Z3F5dPsVAG1QxEKq+vGoIaoggQWgKyRYWhjzxg2badeLwAw4i
 +vbuEUaO37QPavp04oZ/KazvVRjlUiofTVADF6s=
X-Google-Smtp-Source: ADFU+vvDNl9KF6aWmG1Nag+zo6K4mMMz/lowU/jb6RrY9/cFR5io+N8rAzuOKYPoirYOxdi09+q/IW2mxNQvpY6/SZY=
X-Received: by 2002:a50:a0c7:: with SMTP id 65mr19127482edo.7.1584919761847;
 Sun, 22 Mar 2020 16:29:21 -0700 (PDT)
MIME-Version: 1.0
From: Rob Clark <robdclark@gmail.com>
Date: Sun, 22 Mar 2020 16:29:12 -0700
Message-ID: <CAF6AEGuf1R4Xz-t9Z7_cwx9jD=b4wUvvwfqA5cHR8fCSXSd5XQ@mail.gmail.com>
Subject: [pull] drm/msm: msm-next for 5.7
To: Dave Airlie <airlied@gmail.com>
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
Cc: freedreno <freedreno@lists.freedesktop.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave,

A bit smaller this time around.. there are still a couple uabi
additions for vulkan waiting in the wings, but I punted on them this
cycle due to running low on time.  (They should be easy enough to
rebase, and if it is a problem for anyone I can push a next+uabi
branch so that tu work can proceed.)

The bigger change is refactoring dpu resource manager and moving dpu
to use atomic global state.  Other than that, it is mostly cleanups
and fixes.

The following changes since commit fb33c6510d5595144d585aa194d377cf74d31911:

  Linux 5.6-rc6 (2020-03-15 15:01:23 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/msm.git drm-msm-next-2020-03-22

for you to fetch changes up to a5fb8b918920c6f7706a8b5b8ea535a7f077a7f6:

  drm/msm/a6xx: Use the DMA API for GMU memory objects (2020-03-20
07:13:05 -0700)

----------------------------------------------------------------
Brian Masney (1):
      dt-bindings: display: msm: gmu: move sram property to gpu bindings

Drew Davenport (4):
      drm/msm/dpu: Remove unused function arguments
      drm/msm/dpu: Refactor rm iterator
      drm/msm/dpu: Refactor resource manager
      drm/msm/dpu: Track resources in global state

Gustavo A. R. Silva (1):
      drm/msm/msm_gem.h: Replace zero-length array with flexible-array member

Ilia Mirkin (1):
      drm/msm: avoid double-attaching hdmi/edp bridges

Jordan Crouse (3):
      drm/msm/a5xx: Always set an OPP supported hardware value
      dt-bindings: display: msm: Convert GMU bindings to YAML
      drm/msm/a6xx: Use the DMA API for GMU memory objects

Pavel Machek (1):
      drm/msm: fix leaks if initialization fails

Rob Clark (2):
      drm/msm: devcoredump should dump MSM_SUBMIT_BO_DUMP buffers
      drm/msm/a6xx: Fix CP_MEMPOOL state name

Takashi Iwai (1):
      drm/msm: Use scnprintf() for avoiding potential buffer overflow

Zheng Bin (4):
      drm/msm/dpu: fix comparing pointer to 0 in dpu_encoder_phys_cmd.c
      drm/msm/dpu: fix comparing pointer to 0 in dpu_encoder_phys_vid.c
      drm/msm/dpu: fix comparing pointer to 0 in dpu_vbif.c
      drm/msm/dpu: fix comparing pointer to 0 in dpu_encoder.c

tongtiangen (1):
      drm/msm/dpu: Remove some set but not used variables

 .../devicetree/bindings/display/msm/gmu.txt        | 116 ----
 .../devicetree/bindings/display/msm/gmu.yaml       | 123 ++++
 .../devicetree/bindings/display/msm/gpu.txt        |  55 +-
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c              |  27 +-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c              | 115 +---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h              |   6 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h        |   2 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c            |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        | 118 ++--
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c   |   4 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   |   4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h        |  10 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h    |  10 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |  98 +++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h            |  26 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c             | 620 +++++++++------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h             |  71 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c           |   6 +-
 drivers/gpu/drm/msm/edp/edp.c                      |   4 -
 drivers/gpu/drm/msm/hdmi/hdmi.c                    |   4 -
 drivers/gpu/drm/msm/msm_drv.c                      |   6 +-
 drivers/gpu/drm/msm/msm_gem.h                      |  12 +-
 drivers/gpu/drm/msm/msm_gpu.c                      |  28 +-
 drivers/gpu/drm/msm/msm_rd.c                       |   8 +-
 24 files changed, 724 insertions(+), 751 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/msm/gmu.txt
 create mode 100644 Documentation/devicetree/bindings/display/msm/gmu.yaml
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
