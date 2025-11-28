Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F148C90D33
	for <lists+dri-devel@lfdr.de>; Fri, 28 Nov 2025 05:17:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69EFD10E034;
	Fri, 28 Nov 2025 04:17:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="OIpuXc8X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com
 [209.85.222.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5785910E034
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Nov 2025 04:17:10 +0000 (UTC)
Received: by mail-qk1-f173.google.com with SMTP id
 af79cd13be357-8b2da83f721so151081585a.1
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Nov 2025 20:17:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764303429; x=1764908229; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=atftlMa3xy8Hg/4PBp6FgMTPztoQJfpEAETpIxZUoYQ=;
 b=OIpuXc8XQO1wFxoevrfdaN9vZ/N65Vr38Lyq7RLkm5KncXn//UzxaCks9j0VKhXKiF
 9ggV2/bJAvqi0KXZ1qg8lE9CghzeYJgbFMpB2aGn8Jye4r8mVuX0MncrQJQ1ENekjOG3
 KnDmiMswDAFEqSMRr3OCPDjmc6qN3k9wFrZFWacgY8l9lXt/CnteDkCJXJ4IU67K+IYq
 gZ4OkbB28Zn09KTOnF6G+FSHrB0y4a1sxECMSRpnAQUyFRxkuuujDtp2yxGQRf6c3JMW
 5LKoKkc3B6GbEhWbyyeeZ1tFIRUFxc9fMjTfKVDlpPkfPQTgwXAWt3A7zQJpTpe92bHL
 2jlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764303429; x=1764908229;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=atftlMa3xy8Hg/4PBp6FgMTPztoQJfpEAETpIxZUoYQ=;
 b=xLtJoJAcCQE+BO0erLlq10VxWlPgVY3NadRDNsu5JWvVKxbLwygKM7NQ6iLga+i3vk
 prQ+qeFyH71SqnGaONc7lEUBb3p0FiJXvoc68cO2mFkNn9fPnglDZYQnK2kHdchCXj13
 u57Zn5oEtHhKQ70Rm3BbKM8AsMfgddZyW+aa60kYhqzfBgDS46yKe9aEtFHbYjE84MIP
 tfF1f6C6tRNTc6ZTUjcuj/zcHMwGHEoIkXQCnDsJqGyvuV8CVAwkvXhOPKcLLtyHDCMp
 HnrFvjan+tbVDykEmcvSxiGFv+uZyLj9hlnBDUh/Svp1kOg8SeDvu6XHyNsgGgHvJk40
 6hXg==
X-Gm-Message-State: AOJu0Yx4eFipFHWJYsxFbimFbeRCWAQKDCEKNJWz4XmsGhurpiVSJs0L
 Pg5Ug1wZET4l77hUEZnqGnpFeS5p+0z45i0OnME+UAxYup3utgBR+tSCe7GtsXyHRWeMMc9HCUe
 AX0+vX2oQDi/r3LhNTcHRVh+5uhqoo30=
X-Gm-Gg: ASbGncuSQKHKvtpnTCNgwfVkhFItdOgZbhzNqANol6L1bWJZZtmumUSbkC020rCKfNH
 PGWH6u0Jf8DMtAw+DaoudkQc8rtg0Q1YtVLy4wntVK37rj0ASp3VSwKTjzMQNTxPMYarovrK3te
 Qz09q9xsX4yEPFt6JnCTFoJo6d40MfLWFxXCvZsX29iYVM1QE8jcoHx2NobtKNwPgUGC0m04uq3
 k6C53vVm2cfiEGF/aTjkOdelpHcK5nrZTFppKdIj8Jg6tFEol6ciNlsmMYn4mA/MzH0VA==
X-Google-Smtp-Source: AGHT+IHl13tkHpEylgIsn5iVTt1vfT3jQq9SeoUjvvSL2Vxor/MLQ7hXQbCK3JlJuCYKVvlxjLwtBSEXXD4zaZznU7E=
X-Received: by 2002:a05:620a:4096:b0:8b2:e3c1:24b7 with SMTP id
 af79cd13be357-8b32ae1bef7mr4225247385a.29.1764303428946; Thu, 27 Nov 2025
 20:17:08 -0800 (PST)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 28 Nov 2025 14:16:57 +1000
X-Gm-Features: AWmQ_bkkTRWQejv_0Uz1kQn2XkIc9LEU95ZV1M1VTLHmV2xNhQIMGbVH8NhpXj0
Message-ID: <CAPM=9twp8AapPsQGjVqdNhU9BxyR28-wngDH3zrTyBxoqDb+OQ@mail.gmail.com>
Subject: [git pull] drm fixes for 6.18 final
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Simona Vetter <simona@ffwll.ch>
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

Hi Linus,

Last one for this round hopefully, mostly the usual suspects,
xe/amdgpu, with some single fixes otherwise. There is one amdgpu HDMI
blackscreen bug that came in late in the cycle, but it was bisected
and the revert is in here.

Regards,
Dave.

drm-fixes-2025-11-28:
drm fixes for 6.18 final

i915:
- Reject async flips when PSR's selective fetch is enabled

xe:
- Fix resource leak in xe_guc_ct_init_noalloc()'s error path
- Fix stack_depot usage without STACKDEPOT_ALWAYS_INIT
- Fix overflow in conversion from clock tics to msec

amdgpu:
- Unified MES fix
- HDMI fix
- Cursor fix
- Bightness fix
- EDID reading improvement
- UserQ fix
- Cyan Skillfish IP discovery fix

bridge:
- sil902x: Fix HDMI detection

imagination:
- Update documentation

sti:
- Fix leaks in probe

vga_switcheroo:
- Avoid race condition during fbcon initialization
The following changes since commit ac3fd01e4c1efce8f2c054cdeb2ddd2fc0fb150d=
:

  Linux 6.18-rc7 (2025-11-23 14:53:16 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2025-11-28

for you to fetch changes up to 6dbcb801e1eb1b1764fd0012918225b60dd7916c:

  Merge tag 'drm-xe-fixes-2025-11-27' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes
(2025-11-28 12:10:25 +1000)

----------------------------------------------------------------
drm fixes for 6.18 final

i915:
- Reject async flips when PSR's selective fetch is enabled

xe:
- Fix resource leak in xe_guc_ct_init_noalloc()'s error path
- Fix stack_depot usage without STACKDEPOT_ALWAYS_INIT
- Fix overflow in conversion from clock tics to msec

amdgpu:
- Unified MES fix
- HDMI fix
- Cursor fix
- Bightness fix
- EDID reading improvement
- UserQ fix
- Cyan Skillfish IP discovery fix

bridge:
- sil902x: Fix HDMI detection

imagination:
- Update documentation

sti:
- Fix leaks in probe

vga_switcheroo:
- Avoid race condition during fbcon initialization

----------------------------------------------------------------
Alex Deucher (2):
      Revert "drm/amd/display: Move setup_stream_attribute"
      drm/amdgpu: fix cyan_skillfish2 gpu info fw handling

Alex Hung (1):
      drm/amd/display: Check NULL before accessing

Dave Airlie (4):
      Merge tag 'drm-intel-fixes-2025-11-26' of
https://gitlab.freedesktop.org/drm/i915/kernel into drm-fixes
      Merge tag 'amd-drm-fixes-6.18-2025-11-26' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes
      Merge tag 'drm-misc-fixes-2025-11-27' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-fixes
      Merge tag 'drm-xe-fixes-2025-11-27' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes

Devarsh Thakkar (1):
      drm/bridge: sii902x: Fix HDMI detection with
DRM_BRIDGE_ATTACH_NO_CONNECTOR

Harish Chegondi (1):
      drm/xe: Fix conversion from clock ticks to milliseconds

Johan Hovold (1):
      drm: sti: fix device leaks at component probe

Lucas De Marchi (1):
      drm/xe/guc: Fix stack_depot usage

Mario Limonciello (AMD) (2):
      drm/amd/display: Don't change brightness for disabled connectors
      drm/amd/display: Increase EDID read retries

Matt Coster (1):
      drm/imagination: Document pvr_device.power member

Michael Chen (1):
      drm/amd/amdgpu: reserve vm invalidation engine for uni_mes

Prike Liang (1):
      drm/amdgpu: attach tlb fence to the PTs update

Shuicheng Lin (1):
      drm/xe/guc: Fix resource leak in xe_guc_ct_init_noalloc()

Thomas Zimmermann (1):
      drm, fbcon, vga_switcheroo: Avoid race condition in fbcon setup

Ville Syrj=C3=A4l=C3=A4 (1):
      drm/i915/psr: Reject async flips when selective fetch is enabled

 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c           |  2 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c              |  3 +++
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c               |  2 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c    | 15 +++++++++++++++
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c    |  8 ++++----
 drivers/gpu/drm/amd/display/dc/core/dc_stream.c      | 11 ++++++++---
 .../drm/amd/display/dc/hwss/dce110/dce110_hwseq.c    |  1 -
 .../gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c  |  2 --
 .../drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c    |  2 --
 drivers/gpu/drm/amd/display/dc/link/link_dpms.c      |  3 +++
 .../amd/display/dc/virtual/virtual_stream_encoder.c  |  7 -------
 drivers/gpu/drm/bridge/sii902x.c                     | 20 ++++++++--------=
----
 drivers/gpu/drm/drm_fb_helper.c                      | 14 --------------
 drivers/gpu/drm/i915/display/intel_display.c         |  8 ++++++++
 drivers/gpu/drm/i915/display/intel_psr.c             |  6 ------
 drivers/gpu/drm/imagination/pvr_device.h             |  8 ++++++++
 drivers/gpu/drm/sti/sti_vtg.c                        |  7 ++++++-
 drivers/gpu/drm/xe/xe_gt_clock.c                     |  7 +------
 drivers/gpu/drm/xe/xe_guc_ct.c                       | 15 +++++++++------
 drivers/video/fbdev/core/fbcon.c                     |  9 +++++++++
 20 files changed, 85 insertions(+), 65 deletions(-)
