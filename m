Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F12F757D959
	for <lists+dri-devel@lfdr.de>; Fri, 22 Jul 2022 06:16:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E67A11A380;
	Fri, 22 Jul 2022 04:15:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCC6110F087
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Jul 2022 04:15:49 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id os14so6570888ejb.4
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jul 2022 21:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:from:to:cc;
 bh=KPpMtjYycKsWO8I/2HQoLfLw+bGthVnZUbY/Sz4won8=;
 b=l9NTA96MbQS2WQTpP0ZGntinKVYwq9qxqk5waWcwikJTZOpQCrb4DPsKAI94TozmXl
 Znx0pSiCL3jRcXvNI0qnRY6Rh8SNse6fL5MP9g/meVlyM005jaruUxZpv7gOA6w4bNVG
 kKvUQkrNozDtXTpp2SFoznf/FU3WBvZH2S0e/F/p6bs9nopLZXT3VNlmon3G6VL8UJWQ
 XPKNzjL+uRbeMzQdzpjKgEh1lr0qFkqEMLmi8SJOSG5qWXS15X8lCVvW1tEeIXl6d7SJ
 F1LBS3nSylYVtDfElmatgsb2Mg97kNFetuut5/ZXQeVfw31Yud1lzemwY7EC24OuCQzc
 S/3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc;
 bh=KPpMtjYycKsWO8I/2HQoLfLw+bGthVnZUbY/Sz4won8=;
 b=adLBsW/KICGwpY7LbyCxrGK4wmuAp2oZhjtQl3XNBKXHJOc2eEulxvHvEy3g7nRT/F
 fuJh4uGBhPWmXMkfwsTMJoWNGPMnciXw2/U6vKYTy57FprugQDVWaZGyQHTQCeUNK1Se
 wj7IwxamG0FmWD6rOLPJJL+loVaN4A9Gxml7S10l3E+jZ5mWu1bF+30CxIq03cUMRQz2
 DoIj6aFdiGDNTE9ggzZuMsi3CUK4bAbLfYIHzaiWyRJL6XeU89i/kQ8B/NTmmNjtURwC
 ebcqHg2a3GxBxFU5BXZEXrjTBacr+Pno1kn1W7dp+1Dx3ZxYWjPQDH5YIO5Hq7YuahTK
 dVDQ==
X-Gm-Message-State: AJIora80yrQCizHyfaAWbrlgGUJOBem3Sdde5gBWcmvu6ZW/3F4fKTDy
 ICvKOD1Zbox2bZofqe2ftbR1ZbJtmbdEljptbtLAkCsywrw=
X-Google-Smtp-Source: AGRyM1vGB5026zxlcfevkvyTQRDxff9xNnhge1ch/G0mmL8B2YsA8Nv6qchY5uEHv0BxATxfDL5yiVNYi+l8GoMrClU=
X-Received: by 2002:a17:907:96ac:b0:72f:1dea:5b66 with SMTP id
 hd44-20020a17090796ac00b0072f1dea5b66mr1574100ejc.266.1658463347975; Thu, 21
 Jul 2022 21:15:47 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 22 Jul 2022 14:15:37 +1000
Message-ID: <CAPM=9tx177pqAbBTC586NRwr+kbx=_pQjQwKpFjB+442m-uSdw@mail.gmail.com>
Subject: [git pull] drm fixes for 5.19-rc8
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

Fixes for this week. The main one is the i915 firmware fix for the
phoronix reported issue. I've written some firmware guidelines as a
result, should land in -next soon. Otherwise a few amdgpu fixes, a
scheduler fix, ttm fix and two other minor ones.

Regards,
Dave.

drm-fixes-2022-07-22:
drm fixes for 5.19-rc8

scheduler:
- scheduling while atomic fix

ttm:
- locking fix

edp:
- variable typo fix

i915:
- add back support for v69 firmware on ADL-P.

amdgpu:
- Drop redundant buffer cleanup that can lead to a segfault
- Add a bo_list mutex to avoid possible list corruption in CS
- dmub notification fix

imx:
- fix error path
The following changes since commit ff6992735ade75aae3e35d16b17da1008d753d28=
:

  Linux 5.19-rc7 (2022-07-17 13:30:22 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2022-07-22

for you to fetch changes up to 7f5ec14a4e07a2a78fbde069709d5c8806882be2:

  Merge tag 'drm-misc-fixes-2022-07-21' of
git://anongit.freedesktop.org/drm/drm-misc into drm-fixes (2022-07-22
12:19:45 +1000)

----------------------------------------------------------------
drm fixes for 5.19-rc8

scheduler:
- scheduling while atomic fix

ttm:
- locking fix

edp:
- variable typo fix

i915:
- add back support for v69 firmware on ADL-P.

amdgpu:
- Drop redundant buffer cleanup that can lead to a segfault
- Add a bo_list mutex to avoid possible list corruption in CS
- dmub notification fix

imx:
- fix error path

----------------------------------------------------------------
Christian K=C3=B6nig (1):
      drm/ttm: fix locking in vmap/vunmap TTM GEM helpers

Daniele Ceraolo Spurio (1):
      drm/i915/guc: support v69 in parallel to v70

Dave Airlie (3):
      Merge tag 'drm-intel-fixes-2022-07-20-1' of
git://anongit.freedesktop.org/drm/drm-intel into drm-fixes
      Merge tag 'amd-drm-fixes-5.19-2022-07-20' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes
      Merge tag 'drm-misc-fixes-2022-07-21' of
git://anongit.freedesktop.org/drm/drm-misc into drm-fixes

Dmitry Osipenko (1):
      drm/scheduler: Don't kill jobs in interrupt context

Liang He (1):
      drm/imx/dcss: Add missing of_node_put() in fail path

Luben Tuikov (1):
      drm/amdgpu: Protect the amdgpu_bo_list list with a mutex v2

Matthew Brost (1):
      drm/i915/guc: Support programming the EU priority in the GuC descript=
or

N=C3=ADcolas F. R. A. Prado (1):
      drm/panel-edp: Fix variable typo when saving hpd absent delay from DT

Stylon Wang (1):
      drm/amd/display: Fix new dmub notification enabling in DM

xinhui pan (1):
      drm/amdgpu: Remove one duplicated ef removal

 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |   6 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c        |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h        |   4 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c             |  16 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  27 +-
 drivers/gpu/drm/drm_gem_ttm_helper.c               |   9 +-
 drivers/gpu/drm/i915/gt/intel_context_types.h      |  11 +-
 .../gpu/drm/i915/gt/intel_execlists_submission.c   |  12 +-
 drivers/gpu/drm/i915/gt/intel_lrc.h                |  10 -
 drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h   |   3 +
 drivers/gpu/drm/i915/gt/uc/intel_guc.h             |   5 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h        |  45 +++
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c  | 374 +++++++++++++++++=
+---
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c           |  56 ++-
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h           |   7 +
 drivers/gpu/drm/imx/dcss/dcss-dev.c                |   3 +
 drivers/gpu/drm/panel/panel-edp.c                  |   2 +-
 drivers/gpu/drm/scheduler/sched_entity.c           |   6 +-
 include/drm/gpu_scheduler.h                        |   4 +-
 19 files changed, 505 insertions(+), 98 deletions(-)
