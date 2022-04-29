Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1213C513FCA
	for <lists+dri-devel@lfdr.de>; Fri, 29 Apr 2022 02:50:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A3B810F58C;
	Fri, 29 Apr 2022 00:50:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62AAD10F58C
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 00:50:38 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id p4so7416318edx.0
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Apr 2022 17:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=HLS85NRqZtg3G9bQ44dtccEj9xPw7oZObAgscfsjMGw=;
 b=SINyaraVZu6iC+jg6TL6Kzx7o+y6TwZra23I3BUJytk6wYDmi2i6XYBxVKL9lmo4LR
 /6JpU+uQL9XUo/aR1P9+FXPxxSegSoqx6IHNeT34LuP6/iI/87ffvUJtR/4ACmqd5Plx
 c4tpd4zmhusjVflGHOItNy9cK7kmbNp8YfBfBVAwvuvkuTRXAdColv1aCQEZ/f5jXRqN
 oBlsa90MtgCRQMQw3LpwPk3ipxyyLEKu8KJiMCL8g8soqSVCRtw6jKl7+vMCj4ZqNXB1
 whow6oBH1/fGrJAmoYMBXb2If97/wGcSvzY4pyoPGYwFX825VHDbsyrDY712AgyVYL6G
 ou5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=HLS85NRqZtg3G9bQ44dtccEj9xPw7oZObAgscfsjMGw=;
 b=txs7cIXGloVvza3/DhVNoC+/Rd8SX/FYxYz0dJUEWodD+RHL89MTNmHznsBJMSWDfS
 3hrMr5WtZyyU+Gc+tVHgxgl591pa+cQciF/jXuAZ1MieJhJXAIs6J1kMGtKwSVuX2cOS
 u/QFUm7bGIBCu6YZrsMNK58ETFaQ/PXm3hrY6OVe558eM57PW7jyOSFF9sy5JioQvYXA
 K5xGtsDOz6SnYWDiTGblqs8rGERJhuPz9SDtaHGBgsO4Q16CtgySD03hmW7BsR36434C
 CZLe3dSYUsBV2FytDMTZEPJ3XXkUM1tZ9oY3XQpdUBdHc0fva6jFln32t1jGhr/7VKT0
 JVZw==
X-Gm-Message-State: AOAM5320m8iot35gAggZjaydfVX9l4ZTkP6lVsGDmIWfBs3QQ2QafNlK
 SPwoauvGR2CG/qUF+ZoiNXxekSZyV3H0JfaVU0s=
X-Google-Smtp-Source: ABdhPJx86rlEa4DQbr5QeLvqbLOWqZwLZTyMJSUQoHynW2rxORE9FON12/AmJf9h9pwBmeC1S3DV9MIatBt5M6zS8Y4=
X-Received: by 2002:a05:6402:42d4:b0:416:5cac:a9a0 with SMTP id
 i20-20020a05640242d400b004165caca9a0mr38753482edc.86.1651193436699; Thu, 28
 Apr 2022 17:50:36 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 29 Apr 2022 10:50:25 +1000
Message-ID: <CAPM=9tydvfoBFBAY_Vba2vX=26ePwBZumRxnKWA7Lj5+G+tr5g@mail.gmail.com>
Subject: [git pull] drm fixes for 5.18-rc5
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

Another relatively quiet week, amdgpu leads the way, some i915 display
fixes, and a single sunxi fix.

Regards,
Dave.

drm-fixes-2022-04-29:
drm fixes for 5.18-rc5

amdgpu:
- Runtime pm fix
- DCN memory leak fix in error path
- SI DPM deadlock fix
- S0ix fix

amdkfd:
- GWS fix
- GWS support for CRIU

i915:
- Fix #5284: Backlight control regression on XMG Core 15 e21
- Fix black display plane on Acer One AO532h
- Two smaller display fixes

sunxi:
- Single fix removing applying PHYS_OFFSET twice
The following changes since commit af2d861d4cd2a4da5137f795ee3509e6f944a25b=
:

  Linux 5.18-rc4 (2022-04-24 14:51:22 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2022-04-29

for you to fetch changes up to 9d9f720733b7e8d11e4cc53b53f461b117dab839:

  Merge tag 'amd-drm-fixes-5.18-2022-04-27' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes (2022-04-29
10:27:05 +1000)

----------------------------------------------------------------
drm fixes for 5.18-rc5

amdgpu:
- Runtime pm fix
- DCN memory leak fix in error path
- SI DPM deadlock fix
- S0ix fix

amdkfd:
- GWS fix
- GWS support for CRIU

i915:
- Fix #5284: Backlight control regression on XMG Core 15 e21
- Fix black display plane on Acer One AO532h
- Two smaller display fixes

sunxi:
- Single fix removing applying PHYS_OFFSET twice

----------------------------------------------------------------
Alex Deucher (1):
      drm/amdgpu: don't runtime suspend if there are displays attached (v3)

Dave Airlie (3):
      Merge tag 'drm-misc-fixes-2022-04-27' of
git://anongit.freedesktop.org/drm/drm-misc into drm-fixes
      Merge tag 'drm-intel-fixes-2022-04-28' of
git://anongit.freedesktop.org/drm/drm-intel into drm-fixes
      Merge tag 'amd-drm-fixes-5.18-2022-04-27' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes

David Yat Sin (2):
      drm/amdkfd: Fix GWS queue count
      drm/amdkfd: CRIU add support for GWS queues

Evan Quan (1):
      drm/amd/pm: fix the deadlock issue observed on SI

Hans de Goede (1):
      drm/i915: Fix DISP_POS_Y and DISP_HEIGHT defines

Imre Deak (1):
      drm/i915: Fix SEL_FETCH_PLANE_*(PIPE_B+) register addresses

Jouni H=C3=B6gander (1):
      drm/i915: Check EDID for HDR static metadata when choosing blc

Miaoqian Lin (1):
      drm/amd/display: Fix memory leak in dcn21_clock_source_create

Prike Liang (1):
      drm/amdgpu: keep mmhub clock gating being enabled during s2idle suspe=
nd

Samuel Holland (1):
      drm/sun4i: Remove obsolete references to PHYS_OFFSET

Ville Syrj=C3=A4l=C3=A4 (1):
      drm/i915/fbc: Consult hw.crtc instead of uapi.crtc

 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            | 105 ++++++++++++++---=
----
 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c             |  10 ++
 .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.c  |  83 ++++++++--------
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h              |   2 +-
 .../gpu/drm/amd/amdkfd/kfd_process_queue_manager.c |  10 +-
 .../gpu/drm/amd/display/dc/dcn21/dcn21_resource.c  |   1 +
 drivers/gpu/drm/amd/pm/amdgpu_dpm.c                |  39 ++++++++
 drivers/gpu/drm/amd/pm/legacy-dpm/legacy_dpm.c     |  10 --
 drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c         |  35 -------
 drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c   |  10 --
 .../gpu/drm/i915/display/intel_dp_aux_backlight.c  |  34 +++++--
 drivers/gpu/drm/i915/display/intel_fbc.c           |   2 +-
 drivers/gpu/drm/i915/i915_reg.h                    |   6 +-
 drivers/gpu/drm/sun4i/sun4i_frontend.c             |   3 -
 14 files changed, 195 insertions(+), 155 deletions(-)
