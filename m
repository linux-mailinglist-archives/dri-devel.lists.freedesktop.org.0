Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 230C782D422
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jan 2024 07:18:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66B3E10E1FE;
	Mon, 15 Jan 2024 06:18:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9965210E1FE
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jan 2024 06:18:15 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-50e7b273352so9018822e87.1
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Jan 2024 22:18:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705299494; x=1705904294; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Yu24RwbVV6OfhGrTeYHWgy4heI3tkvvA8kiJdl0p1xo=;
 b=bVDE2YP4bdpmMMZ48eiFFGlZqWadKtN3fd3Fs4AwI8w6wbVFmacSladDvYz0z1E0VZ
 2xfNioi0MMBCtOh5eMNixJdcLykpgcV7zG8QaSBHOnV89pJvZoPSKbQcfsDNRBPr7Scn
 XjSNCATdGA4g34/IR210mQqL5iKUxob0cAeczZq7jrz5Tj8C0/AFhwogeAFUswuKMK9E
 ExjDiSIfC8IXxveQFSDRYEoHOH3HXyw542bvfJNEIBKjE8xqMrNIYMyFYYCuOaMadCIg
 UbTSlN+5HMdLlxYoDM08FaAq+LgNeDwE8CHzTHlWrwGDylKaInY86a0af547coTuNelH
 V3Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705299494; x=1705904294;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Yu24RwbVV6OfhGrTeYHWgy4heI3tkvvA8kiJdl0p1xo=;
 b=HJ3cGuZ/YSy99EnHK8/2/HhSxbc4utBA2zpOs59HWbYc8xbuUbod2B2zoVeVsftX78
 DTmM5yjUBcSx/B3Efvq/xfKs/VKyc8IDMegKasXag/+C22bFnME2LfmFk2Uirq+eCXSd
 ZB+ftjrUKayP/XVr3sHV657XI4aXJi/GO7yugPNfZMbZ91E+ViO1UUaPS5QSHGlKCC1+
 6UTRf78Cck4qG/iuH7WxX0bSBU0ccCJSvPl1ByC/8K/wocDxZh5Yo/M9t1REMBt52XDc
 H2UZt/m7uz9zgrw32zlpBo0WJG9MBcO9ZM9Ezf/Ra15MysKIwDD4wpoTCeS66o0ZQcgm
 2SSg==
X-Gm-Message-State: AOJu0YwvoQ7FhpbY9XARzXoFHP84UFLGfywxm1iJrcK3vzxGAjilvDO8
 diEXzO6PTHfs36PaVqisyUHpVNofUz9X4d41kztWFDkE0s8=
X-Google-Smtp-Source: AGHT+IFjWhCI9Bx+HVfPmJecMRJxI9Q1x6wTHSCjSk5BMN4k06nYZsCUfMk95/OG6gPUVp1f2lnGfdVLjtfepb+6CWs=
X-Received: by 2002:a05:6512:3d29:b0:50e:771a:9ff9 with SMTP id
 d41-20020a0565123d2900b0050e771a9ff9mr2738736lfv.78.1705299493488; Sun, 14
 Jan 2024 22:18:13 -0800 (PST)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Mon, 15 Jan 2024 16:18:01 +1000
Message-ID: <CAPM=9tx+5WuM8CjN5ACN1e4Wrr+qNhMSWQe1_g-QDiPbEpPbbg@mail.gmail.com>
Subject: [git pull] drm fixes for 6.8-rc1
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
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
Cc: LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Linus,

Hopefully you get your power back at some point, this is just a wrap
up of fixes from the last few days. It has the proper fix to the
i915/xe collision, we can clean up what you did later once rc1 lands.

Otherwise it's a few other i915, a v3d, rockchip and a nouveau fix to
make GSP load on some original Turing GPUs.

I have some amdgpu fixes lined up, but they broke clang build here, so
I'll wait to send those until AMD can fix it.

Dave.

drm-next-2024-01-15-1:
drm fixes for 6.8-rc1

i915:
- Fixes for kernel-doc warnings enforced in linux-next
- Another build warning fix for string formatting of intel_wakeref_t
- Display fixes for DP DSC BPC and C20 PLL state verification

v3d:
- register readout fix

rockchip:
- two build warning fixes

nouveau:
- fix GSP loading on Turing with different nvdec configuration
The following changes since commit b76c01f1d950425924ee1c1377760de3c024ef78=
:

  Merge tag 'drm-intel-gt-next-2023-12-15' of
git://anongit.freedesktop.org/drm/drm-intel into drm-next (2024-01-10
11:36:47 +1000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-next-2024-01-15-1

for you to fetch changes up to 205e18c13545ab43cc4fe4930732b4feef551198:

  nouveau/gsp: handle engines in runl without nonstall interrupts.
(2024-01-15 16:04:48 +1000)

----------------------------------------------------------------
drm fixes for 6.8-rc1

i915:
- Fixes for kernel-doc warnings enforced in linux-next
- Another build warning fix for string formatting of intel_wakeref_t
- Display fixes for DP DSC BPC and C20 PLL state verification

v3d:
- register readout fix

rockchip:
- two build warning fixes

nouveau:
- fix GSP loading on Turing with different nvdec configuration

----------------------------------------------------------------
Ankit Nautiyal (1):
      drm/i915/dp: Fix the max DSC bpc supported by source

Cristian Ciocaltea (2):
      drm/rockchip: vop2: Drop superfluous include
      drm/rockchip: vop2: Drop unused if_dclk_rate variable

Dave Airlie (3):
      Merge tag 'drm-intel-next-fixes-2024-01-11' of
git://anongit.freedesktop.org/drm/drm-intel into drm-next
      Merge tag 'drm-misc-next-fixes-2024-01-11' of
git://anongit.freedesktop.org/drm/drm-misc into drm-next
      nouveau/gsp: handle engines in runl without nonstall interrupts.

Imre Deak (1):
      drm/i915/dp: Fix the PSR debugfs entries wrt. MST connectors

Jani Nikula (1):
      drm/i915: don't make assumptions about intel_wakeref_t type

Ma=C3=ADra Canal (1):
      drm/v3d: Fix support for register debugging on the RPi 4

Mika Kahola (1):
      drm/i915/display: Fix C20 pll selection for state verification

Randy Dunlap (4):
      drm/i915/gem: reconcile Excess struct member kernel-doc warnings
      drm/i915/gt: reconcile Excess struct member kernel-doc warnings
      drm/i915/guc: reconcile Excess struct member kernel-doc warnings
      drm/i915/perf: reconcile Excess struct member kernel-doc warnings

 drivers/gpu/drm/i915/display/intel_cx0_phy.c       | 25 +++++---
 drivers/gpu/drm/i915/display/intel_display_power.c |  4 +-
 drivers/gpu/drm/i915/display/intel_dp.c            |  2 +-
 drivers/gpu/drm/i915/display/intel_psr.c           | 10 +--
 drivers/gpu/drm/i915/gem/i915_gem_context_types.h  |  4 +-
 drivers/gpu/drm/i915/gt/intel_gsc.h                |  7 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc.h             | 75 ++++++++++++------=
----
 drivers/gpu/drm/i915/i915_perf_types.h             |  9 ++-
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/ga100.c   |  4 ++
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/r535.c    |  2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/base.c     |  8 +--
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c       |  4 +-
 drivers/gpu/drm/v3d/v3d_debugfs.c                  | 20 +++---
 13 files changed, 96 insertions(+), 78 deletions(-)
