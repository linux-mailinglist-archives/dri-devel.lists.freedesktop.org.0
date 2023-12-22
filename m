Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7733081C47C
	for <lists+dri-devel@lfdr.de>; Fri, 22 Dec 2023 05:59:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73E4810E767;
	Fri, 22 Dec 2023 04:59:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 010C510E767
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Dec 2023 04:59:51 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a236d77dceeso179874066b.2
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Dec 2023 20:59:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703221190; x=1703825990; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=xQqKvWO5zpgbO53H46vu3olCtWjTZGqQDRCPR+HkntE=;
 b=PQ/9XCcS6G3rW9ESRvc82zcIekRkJAAtFaxq+RPTCHJ3ZkLqiz9+ELR2rNhHWxxxm/
 tPTeqSdV0aVQo16/lbN8wLXRRz7wD5Y/dmSFuwrg6APOxDJrbRd8fSpp9HryBm2A2G06
 NEDRNQKls4i5Arz/gd1GHSTljv9FMVqJAJsgQRTGGVXrSHg/PSdFAOXDnLHUw/18Yvkn
 Zu7XbVWLw8GJnfy5ywT5TigkaxkhRLHHK5uEjIJ2pDNh6Pg1VCG0treQzdp3V2HB6EzZ
 02078uoiSwnIbUYcwl5bfPcmSwipyQYYPA+w0QcAQcZDOmsZf/3BBLPgLuVDn//0Rd4D
 u53A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703221190; x=1703825990;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xQqKvWO5zpgbO53H46vu3olCtWjTZGqQDRCPR+HkntE=;
 b=iCra0P6B6BjTIbj42Ikcvtj0mpuMfsgPhze8H/uTWBk1WXjKENm5JcQ+YXyPpRzoJR
 JfFhSdtawtDiktITWt4XD4lGqHp1jhHJJxBDq5qhANZEJapYGIknMEspXmArCmzUOUc7
 X1LaxQmslYeQOJaSu8z8uOB6vsodT91l9dmCbrpyJuEJJWseB46lfzHF8sJY/ZFg+OPS
 S5EQmqmcvcHEhIv6yN7BRUAql/uzx67d2/lzp3CAoqCtTcw5begj23Bm/189ATE3UbO0
 QqTl43UmMURaxKHxvC1O7xOqbZPHFnmxI1tZLMJ9MdyoipOib4/KCn2kDbhXxbHValUY
 JeWQ==
X-Gm-Message-State: AOJu0YzN1+NkjDYSvdF6fy4bORbtIzk3/QRU1LHRthn09RoVEdbYTgDZ
 lRI3Z3NBC99dsnlFLfhsy5bSBxCedRdqz0SlIJnu8DpwdII=
X-Google-Smtp-Source: AGHT+IFMWu2U+0t62tk/hUPkfMn/vYVc3TBcmU9QphvzOw1lz2NfnvCPqyNrUeSKigubhzVVI5kLPVf5h60Gn49c4QM=
X-Received: by 2002:a17:906:906:b0:a26:87e2:53 with SMTP id
 i6-20020a170906090600b00a2687e20053mr233515ejd.222.1703221190138; Thu, 21 Dec
 2023 20:59:50 -0800 (PST)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 22 Dec 2023 14:59:38 +1000
Message-ID: <CAPM=9txmoVE1CPtarnL=Y4M8XxHs0VYkfdWw-X2MErNHt+DEig@mail.gmail.com>
Subject: [git pull] drm fixes for 6.7-rc7
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

Pretty quiet for this week, just i915 and amdgpu fixes, I think the
misc tree got lost this week, but didn't seem to have too much in it,
so it can wait. I've also got a bunch of nouveau GSP fixes sailing
around that'll probably land next time as well.

Dave.

drm-fixes-2023-12-22:
drm fixes for 6.7-rc7

amdgpu:
- DCN 3.5 fixes
- DCN 3.2 SubVP fix
- GPUVM fix

amdkfd:
- SVM fix for APUs

i915:
- Fix state readout and check for DSC and bigjoiner combo
- Fix a potential integer overflow
- Reject async flips with bigjoiner
- Fix MTL HDMI/DP PLL clock selection
- Fix various issues by disabling pipe DMC events
The following changes since commit ceb6a6f023fd3e8b07761ed900352ef574010bcb=
:

  Linux 6.7-rc6 (2023-12-17 15:19:28 -0800)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2023-12-22

for you to fetch changes up to d4b6e7f582e29acac17bcaf7f7771138d72f89d2:

  Merge tag 'drm-intel-fixes-2023-12-21' of
git://anongit.freedesktop.org/drm/drm-intel into drm-fixes (2023-12-22
13:11:09 +1000)

----------------------------------------------------------------
drm fixes for 6.7-rc7

amdgpu:
- DCN 3.5 fixes
- DCN 3.2 SubVP fix
- GPUVM fix

amdkfd:
- SVM fix for APUs

i915:
- Fix state readout and check for DSC and bigjoiner combo
- Fix a potential integer overflow
- Reject async flips with bigjoiner
- Fix MTL HDMI/DP PLL clock selection
- Fix various issues by disabling pipe DMC events

----------------------------------------------------------------
Alvin Lee (1):
      drm/amd/display: Revert " drm/amd/display: Use channel_width =3D 2
for vram table 3.0"

Ankit Nautiyal (1):
      drm/i915/display: Get bigjoiner config before dsc config during reado=
ut

Charlene Liu (1):
      drm/amd/display: get dprefclk ss info from integration info table

Dave Airlie (2):
      Merge tag 'amd-drm-fixes-6.7-2023-12-20' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes
      Merge tag 'drm-intel-fixes-2023-12-21' of
git://anongit.freedesktop.org/drm/drm-intel into drm-fixes

Hamza Mahfooz (1):
      drm/amd/display: disable FPO and SubVP for older DMUB versions on DCN=
32x

Imre Deak (1):
      drm/i915/mtl: Fix HDMI/DP PLL clock selection

Josip Pavic (1):
      drm/amd/display: dereference variable before checking for zero

Karthik Poosa (1):
      drm/i915/hwmon: Fix static analysis tool reported issues

Philip Yang (1):
      drm/amdkfd: svm range always mapped flag not working on APU

Ville Syrj=C3=A4l=C3=A4 (2):
      drm/i915: Reject async flips with bigjoiner
      drm/i915/dmc: Don't enable any pipe DMC events

Wayne Lin (1):
      drm/amd/display: Add case for dcn35 to support usb4 dmub hpd event

ZhenGuo Yin (1):
      drm/amdgpu: re-create idle bo's PTE during VM state machine reset

 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |  1 +
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c               | 18 ++++++---
 drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c | 27 ++++++++------
 drivers/gpu/drm/amd/display/dc/core/dc.c           | 26 +++++++++----
 .../drm/amd/display/dc/dml2/display_mode_core.c    |  2 +-
 .../drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.c    |  6 +++
 .../amd/display/include/grph_object_ctrl_defs.h    |  2 +
 drivers/gpu/drm/i915/display/intel_cx0_phy.c       |  3 +-
 drivers/gpu/drm/i915/display/intel_display.c       | 13 ++++++-
 drivers/gpu/drm/i915/display/intel_dmc.c           | 43 ++++++++++++++++++=
+++-
 drivers/gpu/drm/i915/i915_hwmon.c                  |  4 +-
 11 files changed, 112 insertions(+), 33 deletions(-)
