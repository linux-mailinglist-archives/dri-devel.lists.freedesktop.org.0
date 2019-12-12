Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16E9011D961
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2019 23:32:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30AAD6E21C;
	Thu, 12 Dec 2019 22:32:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com
 [IPv6:2607:f8b0:4864:20::72c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1340C6E21C;
 Thu, 12 Dec 2019 22:32:22 +0000 (UTC)
Received: by mail-qk1-x72c.google.com with SMTP id l124so156858qkf.8;
 Thu, 12 Dec 2019 14:32:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Py08hdabZY29vNG0So0/29zNWEt2AH0RZ0SSAE3tT08=;
 b=jgrZwV+Oe+sjITf7/XQ+bGjRquAiVU5c6vUA0E3X6RO2H2aglyua4RzpsO/9WvWRTP
 RfjWsDqHp7w2CYqpSI0wbKxEveA4WWu7bNy1XfHPNaQ+/mH7IO3b0PLzMT2fVSXZ7ClC
 0wzBXX4BMb5hth+0djhVS/eHSlV6BKMmlIBm6behFWQHs09SCeB0rNUA4rJ3yCng74TG
 eNb5WgmgKPxm+YY5z3aDFm2/j3sTcjU89THKdHlsa425qLVEwGAb3v1NdKRyaR06h8Ap
 +BozUkpxX8vN0ZxZhcDVh5Ovt/IGkaDqu5leP+belB4gnhHqyx+BLF/G6TQLGl+UQf1v
 322Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Py08hdabZY29vNG0So0/29zNWEt2AH0RZ0SSAE3tT08=;
 b=iCBmtPuewjPV0bJCC+CZWSAbPQvPAo6MrmcAJVPzr1WmtnDocJnaf+At9j8mXUeqPY
 e+uHhImSe6S9o7eSd8Vva/b2k6NzYjsBx0qf/ouVk2nABoY9QvQM1iHK1PUao9Cy5+Xm
 oO11c/ZCEdop65w73yAi0ERgdEwagPdf5uqL8Qrnrq8hxqJ5ao5V7qX1ruQIzseNTsWL
 yi1ysv4kPwQtzrvG0M8cGs7VvlFdj/qlVbIrBWY4i/ulUwtyrw1cS/R+lfiGoF+dY0uV
 9MM1WZSEj9LJ69G+LoVTlq8Fp3AM3DLBae/kKYjN8cfah+cKuQYaqsX5mrFQtVlVG+Th
 vHsg==
X-Gm-Message-State: APjAAAUwbOABc9md5n+om2auBa0hq/pxduJc9hDMMTLs21Qsyq169NpC
 tKO5IIh5Bow+0qmyF6sCqBkcW6GA
X-Google-Smtp-Source: APXvYqy/0cTw4IMWBLc/5/puTzGXBm4vd3A7aCQN3QQODgDs+nDI9i9XMlNpyx/dRS2+tGQ1LccFiQ==
X-Received: by 2002:a37:a54b:: with SMTP id o72mr10350234qke.313.1576189940663; 
 Thu, 12 Dec 2019 14:32:20 -0800 (PST)
Received: from localhost.localdomain ([71.219.59.120])
 by smtp.gmail.com with ESMTPSA id x42sm2704037qtc.25.2019.12.12.14.32.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Dec 2019 14:32:19 -0800 (PST)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, daniel.vetter@ffwll.ch
Subject: [pull] amdgpu drm-fixes-5.5
Date: Thu, 12 Dec 2019 17:32:10 -0500
Message-Id: <20191212223211.8034-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.23.0
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

Fixes for 5.5.

The following changes since commit b53bd16fec3d52ff7be1648a9b0a747288f52cf8:

  Merge tag 'drm-misc-next-fixes-2019-12-04' of git://anongit.freedesktop.org/drm/drm-misc into drm-next (2019-12-05 11:11:11 +1000)

are available in the Git repository at:

  git://people.freedesktop.org/~agd5f/linux tags/drm-fixes-5.5-2019-12-12

for you to fetch changes up to f271fe1856138d402e0438f994ccae95f9044b2c:

  drm/amdgpu: add invalidate semaphore limit for SRIOV in gmc10 (2019-12-12 16:13:48 -0500)

----------------------------------------------------------------
drm-fixes-5.5-2019-12-12:

amdgpu:
- DC fixes for renoir
- Gfx8 fence flush align with mesa
- Power profile fix for arcturus
- Freesync fix
- DC I2c over aux fix
- DC aux defer fix
- GPU reset fix
- GPUVM invalidation semaphore fixes for PCO and SR-IOV
- Golden settings updates for gfx10

----------------------------------------------------------------
Alex Deucher (4):
      drm/amdgpu: add header line for power profile on Arcturus
      drm/amdgpu/display: add fallthrough comment
      drm/amdgpu: fix license on Kconfig and Makefiles
      Revert "drm/amdgpu: dont schedule jobs while in reset"

Amanda Liu (1):
      drm/amd/display: Fix screen tearing on vrr tests

Arnd Bergmann (2):
      drm/amd/display: fix undefined struct member reference
      drm/amd/display: include linux/slab.h where needed

Brandon Syu (1):
      drm/amd/display: fixed that I2C over AUX didn't read data issue

David Galiffi (1):
      drm/amd/display: Fixed kernel panic when booting with DP-to-HDMI dongle

Eric Yang (2):
      drm/amd/display: update sr and pstate latencies for Renoir
      drm/amd/display: update dispclk and dppclk vco frequency

George Shen (1):
      drm/amd/display: Increase the number of retries after AUX DEFER

Guchun Chen (1):
      drm/amdgpu: add check before enabling/disabling broadcast mode

Joseph Gravenor (3):
      drm/amd/display: fix DalDramClockChangeLatencyNs override
      drm/amd/display: populate bios integrated info for renoir
      drm/amd/display: have two different sr and pstate latency tables for renoir

Leo (Hanghong) Ma (1):
      drm/amd/display: Change the delay time before enabling FEC

Nikola Cornij (2):
      drm/amd/display: Map DSC resources 1-to-1 if numbers of OPPs and DSCs are equal
      drm/amd/display: Reset steer fifo before unblanking the stream

Pierre-Eric Pelloux-Prayer (1):
      drm/amdgpu: add cache flush workaround to gfx8 emit_fence

Tianci.Yin (4):
      drm/amdgpu/gfx10: update gfx golden settings
      drm/amdgpu/gfx10: update gfx golden settings for navi14
      drm/amdgpu/gfx10: update gfx golden settings
      drm/amdgpu/gfx10: update gfx golden settings for navi14

Yongqiang Sun (1):
      drm/amd/display: Compare clock state member to determine optimization.

changzhu (3):
      drm/amdgpu: avoid using invalidate semaphore for picasso
      drm/amdgpu: add invalidate semaphore limit for SRIOV and picasso in gmc9
      drm/amdgpu: add invalidate semaphore limit for SRIOV in gmc10

 drivers/gpu/drm/amd/acp/Kconfig                    |   2 +-
 drivers/gpu/drm/amd/amdgpu/Kconfig                 |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c            |   5 +-
 drivers/gpu/drm/amd/amdgpu/df_v3_6.c               |  38 +++---
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             |   6 +
 drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c              |  22 +++-
 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c             |  29 +++--
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c              |  32 +++--
 drivers/gpu/drm/amd/amdkfd/Kconfig                 |   2 +-
 drivers/gpu/drm/amd/display/Kconfig                |   2 +-
 drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c |   1 +
 .../drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.c  | 134 ++++++++++++++++-----
 drivers/gpu/drm/amd/display/dc/core/dc_link.c      |   2 +-
 drivers/gpu/drm/amd/display/dc/core/dc_link_ddc.c  |   2 +-
 drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c   |   9 +-
 drivers/gpu/drm/amd/display/dc/dce/dce_aux.c       |  33 +++--
 drivers/gpu/drm/amd/display/dc/dcn20/Makefile      |   1 +
 .../gpu/drm/amd/display/dc/dcn20/dcn20_resource.c  |  15 ++-
 .../amd/display/dc/dcn20/dcn20_stream_encoder.c    |  12 +-
 drivers/gpu/drm/amd/display/dc/dcn21/Makefile      |   1 +
 .../gpu/drm/amd/display/dc/dcn21/dcn21_resource.c  |  24 +++-
 drivers/gpu/drm/amd/display/dc/dsc/Makefile        |   1 +
 drivers/gpu/drm/amd/display/dc/inc/hw/clk_mgr.h    |   2 +
 .../gpu/drm/amd/display/include/i2caux_interface.h |   2 +-
 .../drm/amd/display/modules/freesync/freesync.c    |  32 ++---
 .../gpu/drm/amd/display/modules/inc/mod_freesync.h |   1 -
 drivers/gpu/drm/amd/powerplay/arcturus_ppt.c       |   5 +
 27 files changed, 299 insertions(+), 118 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
