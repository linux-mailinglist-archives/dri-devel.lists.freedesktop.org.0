Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uFulBcBfhWmfAgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 04:28:00 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F80BF9BBA
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 04:27:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A795510E0F1;
	Fri,  6 Feb 2026 03:27:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ddiXuutO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com
 [209.85.222.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F6A810E0F1
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Feb 2026 03:27:55 +0000 (UTC)
Received: by mail-qk1-f170.google.com with SMTP id
 af79cd13be357-8c70c6b2bcaso164559485a.3
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Feb 2026 19:27:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770348474; cv=none;
 d=google.com; s=arc-20240605;
 b=TZjUWPb3Hwx+j8B27ODIGuiM360sES3F7SvUwtTFj0ICqlK1d/4K0/sTu341+iMV/v
 lsz/iDbN8D9FPoZeeEc53pgxBLv9uD277ETIhS8o4bQszywK3hi4s8gfbnkqwZhZapzY
 gVnSZN7g4wtyPxIPSfqsYg2lAznfciGubR56Yhx0NEImP9bO4CeC4l3M8LX37/M5DG8H
 7C9UmvmS+Kqo70iVFNrtmkXOjhbjwFeHLjg09DgWglsiccY1DUlVttfab3BDj3RWx54j
 uY6K9+bshA0sKQDhJ8oBm+zo3P+oUKaoh9ldSKZqyKOsPYeJwxUt39eKu64BTvEhk07v
 Rc3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
 bh=EPIKgpVggIu3dVhICA3wTQ7+oeXoACxe3xzb0kIp9rY=;
 fh=A08XZwmmb57jzirbgTkluPSvjDeiJMkkojF1n6qDmTk=;
 b=CDDqjcTQ7X466zbJ5ZlzzUzuOwYeKC9MVV8OYxHGFV3Et0tfhCDbyA1TZbz5pWfOPH
 jfhnhFJrbWtpHOGRVfH0tHRneS1xo+TrXeR+fUHq7bPVE+peyDUUQeyW5DKK5seLjdr6
 jTY0dOFQtPazB+HCeXJozYgy3PYxM2vF7Xy9rVTT6msQzS8hrutvz6M1STI58YfNsvIl
 6MdE5/ZI0UjSweRd+akVNw4Qu0d74Pv29FTCqkq/d0huxGJrVZYUX1xUKMtBawoVwwkD
 unoGqCRKVo4I4BksdMiReG3rg/aij9ypeTF+Vu7p9ITPMD3XojmAuuqj5FsXd3rWF2H3
 z0vw==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770348474; x=1770953274; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=EPIKgpVggIu3dVhICA3wTQ7+oeXoACxe3xzb0kIp9rY=;
 b=ddiXuutO1WTqZd98eQiFJkC1bD4GmaopkNJQx5J1ojgHTgpD1dg+rbvX1/oDb6deQ5
 WH7SVOie0RhxavEWL9IFQKeCijbINmoGaKCL7U5bEMHtrmlVo/jX4OTbBarCEzGDKKbt
 rd3dWxIX0/HgB5kAmR6/jhzwoksVD9kpPgO2QFwkiaxmUWgkrAdEaNVcAZilOcLV6isV
 aC6SOiHVDI9y8Hz9EVy4uRFSZQL8xnSj7zvh31DfFy//hUFWT7bJJ42AU8ji/dD4Q4UJ
 kDjhf6/385mH6LjXPeg1nbz+XNtRTlopup4p8kXTeGK7s22+rmmNu+hztMwj65STjjhW
 iy1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770348474; x=1770953274;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EPIKgpVggIu3dVhICA3wTQ7+oeXoACxe3xzb0kIp9rY=;
 b=eWpDZrRz0235JQ7y3PZlOtyYdL3qrhYH7k9c+hjudnA7aCZk1VaJINiLKbaQc1Mcsj
 o9+N2lecQo+x88E0dRwVoTeejGlcmxne154ROfbHPdK5jViWlnyz9DliInxYjQxZYQ9t
 D7yjp+jskX8k+lb/rmF+5EoSTP0acTBuNC20CorEmbX19o/YZFFNY8jVu0hJLQQ/LCKH
 yMgkKBjEXJmC5RRFBoQN6aIS9dfXZ21CGqhGhrpZlINHwAqWuPebxi30CVYWzqvligom
 Dd2vaaaZb7r6zmMxnNFaUnjJo0AYJGiD6BORpDx8bNH6CMUyLaU7i/yfbC265RrcixQb
 0I0Q==
X-Gm-Message-State: AOJu0YzJLgsm57eqj7wVp5oQQWB4pW0uYxml7wbGD25TAW7wKUhnb0dy
 Afnfc4kSyJ659mwpx26VNy5jgYgZa8LOCZ5eQb0l3Sif886h738JZGx/GJ2qwz+LyE8OG4qGQzb
 UO0Pjg5dpQzSl6n82a5Jt2CvstXnYN1Y=
X-Gm-Gg: AZuq6aKXKoJ33tspon2stPryq6qdy/N0PiTnkzuRgxXA8XqBBe0XBE2mrFVXOAlawgM
 H2228GfJ78Zbet3vgf3A4qH7k+OuLa8+9KroFVF9UdwuVuVojBdTthkuL1cSnUVLbmXnC/oxt8n
 O2GGGk4oQXtyNGBCIFd7DkbOSTDK790HVo2zgOMVVA9DwSk3cs4GEFxkw0vrJFkDqcYEi0VGY/T
 y7Nx+UkUVom8qfwRFpqsw8YTB0vnTyp2wYwYCIBhG2LI9AXgnzg26g9BQlaENTPFS2v+pyooth/
 PMfyIZafLt9qt4ZhdnViy068FnuJdoWo/joRqdE6VBAQqbBaBYHLW0g=
X-Received: by 2002:a05:620a:462c:b0:8b2:598d:6e66 with SMTP id
 af79cd13be357-8caef30bf03mr180315985a.22.1770348473816; Thu, 05 Feb 2026
 19:27:53 -0800 (PST)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 6 Feb 2026 13:27:42 +1000
X-Gm-Features: AZwV_QiBRF5XnR522WnGNvZl1F-qC-HaXZ4seUMkFqm7HR8ByBgwC33VJyGRDFA
Message-ID: <CAPM=9twrSEbBC1pGvxghuJtYzPtRHxN1OC103HLj3v_d+h_P2g@mail.gmail.com>
Subject: [git pull] drm fixes for 6.19-final
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
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
	FORGED_RECIPIENTS(0.00)[m:torvalds@linux-foundation.org,m:simona@ffwll.ch,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[airlied@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 4F80BF9BBA
X-Rspamd-Action: no action

Hey Linus,

Weekly pull, last set of fixes for 6.19. The usual xe/amdgpu
selection, and a couple of misc changes for gma500, mgag200 and
bridge. There is a nouveau revert, and also a set of changes that fix
a regression since we moved to 570 firmware. Suspend/resume was broken
on a bunch of GPUs. The fix looks big, but it's mostly just
refactoring to pass an extra bit down the nouveau abstractions to the
firmware command.

Dave.

drm-fixes-2026-02-06:
drm fixes for 6.19-final

amdgpu:
- MES 11 old firmware compatibility fix
- ASPM fix
- DC LUT fixes

amdkfd:
- Fix possible double deletion of validate list

xe:
- Fix topology query pointer advance
- A couple of kerneldoc fixes
- Disable D3Cold for BMG only on specific platforms
- Fix CFI violation in debugfs access

nouveau:
- Revert adding atomic commit functions as it regresses pre-nv50.
- Fix suspend/resume bugs exposed by enabling 570 firmware.

gma500:
- Revert a regression caused by vblank changes.

mgag200:
- Replace a busy loop with a polling loop to fix that blocking 1 cpu
for 300 ms roughly every 20 minutes.

bridge:
- imx8mp-hdmi-pa: Use runtime pm to fix a bug in channel ordering.
The following changes since commit 18f7fcd5e69a04df57b563360b88be72471d6b62:

  Linux 6.19-rc8 (2026-02-01 14:01:13 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2026-02-06

for you to fetch changes up to 7ef92d2ecef7486d46eda0f911dc53b873fdf567:

  Merge tag 'amd-drm-fixes-6.19-2026-02-05' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes (2026-02-06
12:44:54 +1000)

----------------------------------------------------------------
drm fixes for 6.19-final

amdgpu:
- MES 11 old firmware compatibility fix
- ASPM fix
- DC LUT fixes

amdkfd:
- Fix possible double deletion of validate list

xe:
- Fix topology query pointer advance
- A couple of kerneldoc fixes
- Disable D3Cold for BMG only on specific platforms
- Fix CFI violation in debugfs access

nouveau:
- Revert adding atomic commit functions as it regresses pre-nv50.
- Fix suspend/resume bugs exposed by enabling 570 firmware.

gma500:
- Revert a regression caused by vblank changes.

mgag200:
- Replace a busy loop with a polling loop to fix that blocking 1 cpu
for 300 ms roughly every 20 minutes.

bridge:
- imx8mp-hdmi-pa: Use runtime pm to fix a bug in channel ordering.

----------------------------------------------------------------
Bert Karwatzki (1):
      Revert "drm/amd: Check if ASPM is enabled from PCIe subsystem"

Daniele Ceraolo Spurio (1):
      drm/xe/guc: Fix CFI violation in debugfs access.

Dave Airlie (6):
      nouveau/gsp: use rpc sequence numbers properly.
      nouveau: add a third state to the fini handler.
      nouveau/gsp: fix suspend/resume regression on r570 firmware
      Merge tag 'drm-misc-fixes-2026-02-05' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-fixes
      Merge tag 'drm-xe-fixes-2026-02-05' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes
      Merge tag 'amd-drm-fixes-6.19-2026-02-05' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes

Harish Kasiviswanathan (1):
      drm/amdgpu: Fix double deletion of validate_list

Jacob Keller (1):
      drm/mgag200: fix mgag200_bmc_stop_scanout()

Jani Nikula (1):
      Revert "drm/gma500: use drm_crtc_vblank_crtc()"

John Ogness (1):
      Revert "drm/nouveau/disp: Set drm_mode_config_funcs.atomic_(check|commit)"

Karthik Poosa (1):
      drm/xe/pm: Disable D3Cold for BMG only on specific platforms

Mario Limonciello (1):
      drm/amd: Set minimum version for set_hw_resource_1 on gfx11 to 0x52

Melissa Wen (3):
      drm/amd/display: fix wrong color value mapping on MCM shaper LUT
      drm/amd/display: extend delta clamping logic to CM3 LUT helper
      drm/amd/display: remove assert around dpp_base replacement

Shengjiu Wang (1):
      drm/bridge: imx8mp-hdmi-pai: enable PM runtime

Shuicheng Lin (4):
      drm/xe/query: Fix topology query pointer advance
      drm/xe: Fix kerneldoc for xe_migrate_exec_queue
      drm/xe: Fix kerneldoc for xe_gt_tlb_inval_init_early
      drm/xe: Fix kerneldoc for xe_tlb_inval_job_alloc_dep

 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   | 18 +++++------
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |  3 --
 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c             |  2 +-
 .../gpu/drm/amd/display/dc/dcn30/dcn30_cm_common.c | 37 +++++++++++++++++-----
 .../drm/amd/display/dc/dwb/dcn30/dcn30_cm_common.h |  2 +-
 .../drm/amd/display/dc/hwss/dcn30/dcn30_hwseq.c    |  9 +++---
 .../drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.c    | 18 ++++++-----
 .../drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c  | 16 ++++++----
 drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pai.c       | 15 +++++++++
 drivers/gpu/drm/gma500/psb_irq.c                   | 36 ++++++++-------------
 drivers/gpu/drm/mgag200/mgag200_bmc.c              | 31 +++++++-----------
 drivers/gpu/drm/mgag200/mgag200_drv.h              |  6 ++++
 drivers/gpu/drm/nouveau/include/nvif/client.h      |  2 +-
 drivers/gpu/drm/nouveau/include/nvif/driver.h      |  2 +-
 drivers/gpu/drm/nouveau/include/nvkm/core/device.h |  3 +-
 drivers/gpu/drm/nouveau/include/nvkm/core/engine.h |  2 +-
 drivers/gpu/drm/nouveau/include/nvkm/core/object.h |  5 +--
 drivers/gpu/drm/nouveau/include/nvkm/core/oproxy.h |  2 +-
 drivers/gpu/drm/nouveau/include/nvkm/core/subdev.h |  4 +--
 .../drm/nouveau/include/nvkm/core/suspend_state.h  | 11 +++++++
 drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h  |  6 ++++
 drivers/gpu/drm/nouveau/nouveau_display.c          |  2 --
 drivers/gpu/drm/nouveau/nouveau_drm.c              |  2 +-
 drivers/gpu/drm/nouveau/nouveau_nvif.c             | 10 ++++--
 drivers/gpu/drm/nouveau/nvif/client.c              |  4 +--
 drivers/gpu/drm/nouveau/nvkm/core/engine.c         |  4 +--
 drivers/gpu/drm/nouveau/nvkm/core/ioctl.c          |  4 +--
 drivers/gpu/drm/nouveau/nvkm/core/object.c         | 20 +++++++++---
 drivers/gpu/drm/nouveau/nvkm/core/oproxy.c         |  2 +-
 drivers/gpu/drm/nouveau/nvkm/core/subdev.c         | 18 +++++++++--
 drivers/gpu/drm/nouveau/nvkm/core/uevent.c         |  2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/ce/ga100.c     |  2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/ce/priv.h      |  2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/device/base.c  | 22 ++++++++++---
 drivers/gpu/drm/nouveau/nvkm/engine/device/pci.c   |  4 +--
 drivers/gpu/drm/nouveau/nvkm/engine/device/priv.h  |  2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/device/user.c  |  2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/base.c    |  4 +--
 drivers/gpu/drm/nouveau/nvkm/engine/disp/chan.c    |  2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/falcon.c       |  4 +--
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/base.c    |  2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/uchan.c   |  6 ++--
 drivers/gpu/drm/nouveau/nvkm/engine/gr/base.c      |  4 +--
 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c     |  2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/nv04.c      |  2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/nv10.c      |  2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/nv20.c      |  2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/nv20.h      |  2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/nv40.c      |  4 +--
 drivers/gpu/drm/nouveau/nvkm/engine/mpeg/nv44.c    |  2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/sec2/base.c    |  2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/xtensa.c       |  4 +--
 drivers/gpu/drm/nouveau/nvkm/subdev/acr/base.c     |  2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/bar/base.c     |  2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c     |  2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/devinit/base.c |  4 +--
 drivers/gpu/drm/nouveau/nvkm/subdev/fault/base.c   |  2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/fault/user.c   |  2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/gpio/base.c    |  2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/base.c     |  2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/gh100.c    |  2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h     |  8 ++---
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fbsr.c |  2 +-
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c  |  8 ++---
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rpc.c  |  6 ++++
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/fbsr.c |  8 ++---
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/gsp.c  |  2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h    |  2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c    |  2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/i2c/base.c     |  2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/instmem/base.c |  2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/pci/base.c     |  2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/pmu/base.c     |  2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/therm/base.c   |  6 ++--
 drivers/gpu/drm/nouveau/nvkm/subdev/timer/base.c   |  2 +-
 drivers/gpu/drm/xe/xe_guc.c                        |  6 ++--
 drivers/gpu/drm/xe/xe_guc.h                        |  2 +-
 drivers/gpu/drm/xe/xe_migrate.c                    |  2 +-
 drivers/gpu/drm/xe/xe_pm.c                         | 13 ++++++--
 drivers/gpu/drm/xe/xe_query.c                      |  2 +-
 drivers/gpu/drm/xe/xe_tlb_inval.c                  |  2 +-
 drivers/gpu/drm/xe/xe_tlb_inval_job.c              |  2 +-
 82 files changed, 290 insertions(+), 189 deletions(-)
 create mode 100644 drivers/gpu/drm/nouveau/include/nvkm/core/suspend_state.h
