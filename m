Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7CB7BA2616
	for <lists+dri-devel@lfdr.de>; Fri, 26 Sep 2025 06:22:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD86210E9D5;
	Fri, 26 Sep 2025 04:22:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FOIoTmV6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FB8C10E15A
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 04:22:28 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-b33d785de7cso278208866b.1
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 21:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758860546; x=1759465346; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=6saHKE8v7y3gcL2pFVLakX6jbgxVNkxceljx6TZ2T70=;
 b=FOIoTmV6V9Qsip2f1cD3UFvKHXWOkmiNCHwspb1ErKtNBhQZ3LTIg5vNaJIab8a8a0
 8o+CxJfd8MHbuvanugFZ8y52PCsbS4BC5HX4zH8KOTplYAIZsbJvwXHBBJO8Z9658MDb
 TqBD+PFytSIFP8/im4JuNtgsH2YLUQX4qypDupWHrGrpEoMIo19HY0zFynx+GO6dlAF3
 hUR++wUUi/yDL9d61Ex/9OCvsPKns0PhosXzAY84AofR5SIRgITlNWQ6WK7FqwAxyUhj
 NjU2N5/dd3QVK0FKyP0mIOt8i4CRYTZiqKOLC2H9R41q7sChVf4COHhkTenHnxTW0L5k
 tq8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758860546; x=1759465346;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6saHKE8v7y3gcL2pFVLakX6jbgxVNkxceljx6TZ2T70=;
 b=sJOyD3mrUFqtpdTw+UfqskEo1cBE8bQz0IryuwaPsZ+YSfYXVISakWNVAzEC5DsRG9
 Al1kp8ptF0ktTyKYWl9SlnFreXMpwUXAiUiZeTzi7W/qitITKwigp57ScsF98ekNx6T4
 NKTT8pJF6UW/E9qRXZmQuMVbOopl3bX4eVwuXB05Q1lMT2hQ9HH0a0yCotElT1vSEv0o
 eWfF5Mv3ucI1IQjYZ4Ti6NLQT8PiewSktAXRsWFarr6JZkANniUZ6S7HGjuQ8yz4gLzw
 OEL2qIc4WuDJdcdT+PBabvy5RU6awI5y8zSkEu5V36XQYoyIXUE4+CyvqwxcQxjLpfAV
 Y9cA==
X-Gm-Message-State: AOJu0YyR8y32+WCQsdYqYXh3yNaNfu2TAzpB5gXP5vrdqFln1TufZmuW
 Yx0WQBwPFLNRwttfU8yOpqpsiJg3kz6ZeAhSZ/wsCG0bmJXESVhMYTGlLrCd5tpXmMCCyeBgRaM
 doSE2ZBju63wJZ3mHfwRTDXNFHYJ1t68=
X-Gm-Gg: ASbGncuq28LyXsQyYHppBvc5wFE54X3bQGodAp11biACIuiSFBU2siBxeEhbV9czG5Q
 KNMHnh6P7SG0pDbEen1KWWm8YGEZpw58Nvv+GxvKKpEQdpPm00DFqgVuYo2h5G0nU+i+ud+U0AX
 9ADh3Z/TOHZz9SjNRdmy8o85s7KLaQmaorHhBYi1fFXhzBFLrS8RCU1ifa7lGvzyofO3MxyNHxx
 0z8tA==
X-Google-Smtp-Source: AGHT+IGZTAi6DT1z6+587DJEbV3xm9kNdP6C1CTZDGuxoUy/1fygNYaDU74eh8/YF1hzWhdbSc5971CCOlTNEukKm3k=
X-Received: by 2002:a17:906:6a07:b0:b2c:15aa:ff51 with SMTP id
 a640c23a62f3a-b34b7cd20dbmr648168666b.14.1758860546252; Thu, 25 Sep 2025
 21:22:26 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 26 Sep 2025 14:22:14 +1000
X-Gm-Features: AS18NWDkoDaygCPdummng72PiouEdLbrYJDxgW0DrRhuYo-0kGYuJgXPk7JeUOw
Message-ID: <CAPM=9tyfHf9jLv36vvc9=sRt0OWk-jTVq8n8uRJvu2O5a9X5bg@mail.gmail.com>
Subject: [git pull] drm fixes for 6.17-rc8/final
To: Linus Torvalds <torvalds@linux-foundation.org>, Sima Vetter <sima@ffwll.ch>
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
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

Hey Linus,

Weekly fixes, some fbcon font handling fixes, then amdgpu/xe/i915 with
a few, and a few misc fixes for other drivers. Seems about right for
this stage, and I don't know of anything outstanding.

Regards,
Dave.

drm-fixes-2025-09-26:
drm fixes for 6.17-rc8 (or final)

fbcon:
- fix OOB access in font allocation
- fix integer overflow in font handling

amdgpu:
- Backlight fix
- DC preblend fix
- DCN 3.5 fix
- Cleanup output_tf_change

xe:
- Don't expose sysfs attributes not applicable for VFs
- Fix build with CONFIG_MODULES=3Dn
- Don't copy pinned kernel bos twice on suspend

i915:
- Set O_LARGEFILE in __create_shmem()
- Guard reg_val against a INVALID_TRANSCODER [ddi]

ast:
- sleeps causing cpu stall fix

panthor:
- scheduler race condition fix

gma500:
- NULL ptr deref in hdmi teardown fix
The following changes since commit 07e27ad16399afcd693be20211b0dfae63e0615f=
:

  Linux 6.17-rc7 (2025-09-21 15:08:52 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2025-09-26

for you to fetch changes up to ec73e5984e01bfdf92234eaf5a2c3e54aa67f2aa:

  Merge tag 'drm-xe-fixes-2025-09-25' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes
(2025-09-26 14:12:33 +1000)

----------------------------------------------------------------
drm fixes for 6.17-rc8 (or final)

fbcon:
- fix OOB access in font allocation
- fix integer overflow in font handling

amdgpu:
- Backlight fix
- DC preblend fix
- DCN 3.5 fix
- Cleanup output_tf_change

xe:
- Don't expose sysfs attributes not applicable for VFs
- Fix build with CONFIG_MODULES=3Dn
- Don't copy pinned kernel bos twice on suspend

i915:
- Set O_LARGEFILE in __create_shmem()
- Guard reg_val against a INVALID_TRANSCODER [ddi]

ast:
- sleeps causing cpu stall fix

panthor:
- scheduler race condition fix

gma500:
- NULL ptr deref in hdmi teardown fix

----------------------------------------------------------------
Adri=C3=A1n Larumbe (1):
      drm/panthor: Defer scheduler entitiy destruction to queue release

Alvin Lee (1):
      drm/amd/display: Use mpc.preblend flag to indicate preblend

Dave Airlie (4):
      Merge tag 'amd-drm-fixes-6.17-2025-09-24' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes
      Merge tag 'drm-intel-fixes-2025-09-25' of
https://gitlab.freedesktop.org/drm/i915/kernel into drm-fixes
      Merge tag 'drm-misc-fixes-2025-09-25' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-fixes
      Merge tag 'drm-xe-fixes-2025-09-25' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes

Leo Li (1):
      drm/amd/display: Init DCN35 clocks from pre-os HW values

Lucas De Marchi (1):
      drm/xe: Fix build with CONFIG_MODULES=3Dn

Matthew Schwartz (1):
      drm/amd/display: Only restore backlight after amdgpu_dm_init or dm_re=
sume

Melissa Wen (1):
      drm/amd/display: remove output_tf_change flag

Michal Wajdeczko (1):
      drm/xe/vf: Don't expose sysfs attributes not applicable for VFs

Nirmoy Das (1):
      drm/ast: Use msleep instead of mdelay for edid read

Samasth Norway Ananda (1):
      fbcon: fix integer overflow in fbcon_do_set_font

Suraj Kandpal (1):
      drm/i915/ddi: Guard reg_val against a INVALID_TRANSCODER

Taotao Chen (1):
      drm/i915: set O_LARGEFILE in __create_shmem()

Thomas Hellstr=C3=B6m (1):
      drm/xe: Don't copy pinned kernel bos twice on suspend

Thomas Zimmermann (1):
      fbcon: Fix OOB access in font allocation

Zabelin Nikita (1):
      drm/gma500: Fix null dereference in hdmi teardown

 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  12 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  |   7 ++
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_color.c    |   2 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c    |   2 +-
 .../amd/display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c   | 121 +++++++++++++++++=
+++-
 drivers/gpu/drm/amd/display/dc/dc.h                |   1 -
 .../drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c    |   6 +-
 .../drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c  |   6 +-
 drivers/gpu/drm/ast/ast_dp.c                       |   2 +-
 drivers/gpu/drm/gma500/oaktrail_hdmi.c             |   2 +-
 drivers/gpu/drm/i915/display/intel_ddi.c           |   5 +-
 drivers/gpu/drm/i915/gem/i915_gem_shmem.c          |   7 ++
 drivers/gpu/drm/panthor/panthor_sched.c            |   8 +-
 drivers/gpu/drm/xe/xe_bo_evict.c                   |   4 +-
 drivers/gpu/drm/xe/xe_configfs.c                   |   2 +-
 drivers/gpu/drm/xe/xe_device_sysfs.c               |   2 +-
 drivers/video/fbdev/core/fbcon.c                   |  13 ++-
 17 files changed, 167 insertions(+), 35 deletions(-)
