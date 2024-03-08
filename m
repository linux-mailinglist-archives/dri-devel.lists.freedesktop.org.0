Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EC76875CEB
	for <lists+dri-devel@lfdr.de>; Fri,  8 Mar 2024 04:53:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3518A10F72E;
	Fri,  8 Mar 2024 03:52:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="RxBY7cF1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AC2F10F72D
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Mar 2024 03:52:54 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-56781070f38so4747799a12.0
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Mar 2024 19:52:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709869972; x=1710474772; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=yaQRbk5QmEJP3wwqgTNAEXZGVsVjV/bZr84Z3Hdwx5g=;
 b=RxBY7cF1RbC98RqZ/rs0kb6mUexl9CfWIGiPiy67p/b5J8bfngGJxxMjLBIfG7LNxo
 CaQHAawrf/bUpQ8P4CdJBlc1yZRb0/N7mGJjt8pUFDGcu9Do0KeP04BPurOHrE0PhGar
 hlDCyT4zfMPpuDl2ulYESRuVMa3c3qw5hj0T/P6v0/8z6boVV5f7KJQrIf5eatXwhkRw
 mlEUQHtcs9vtzhT+24ehQo9SCCOhxU8BYuQ93CfuYtwziE5S+97wMdwOmQtBRCMLtYg5
 W72IOTzQuWX5sDnGQMXWTktilVS0WkXflhxMlRjLODDmQn0dmUAGl3EbNODX9cFCHs7C
 YmlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709869972; x=1710474772;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yaQRbk5QmEJP3wwqgTNAEXZGVsVjV/bZr84Z3Hdwx5g=;
 b=Y0vjVl66YHI4A+2yZvhw7XQoYnWYQWWcSBMroGFxQxK7c6/aEMZuVJQINMn4fZCTV/
 srCStAc76jkZYrdOO9Ooq+1PgeCkbzaxEibYds3Xg6ihJqAjcPH5j2clP29lPGyQ7eWc
 qIh5T9kazNUkOuhNaeaYyCkS0Vp29VHv+pXhTPhwpn01HUWAKt505nXbVcIx0dJ3v4mg
 r2AVF1ROX+4xikgN3epV1mJjaVCPHB50+a7k6+Qn3oVKITUN7N6mB0YeX64zlvBqeNiD
 tMysCH9vqJLNGiugsvYZzjTBrvB3UH+tlKPdxIeUqkLJ+K8DlP0gLwgyUOekSqRBv9Dn
 7Scw==
X-Gm-Message-State: AOJu0YzpVkTReCFkMVDY5HlTYEzUnTZXhPgBYMUIvrXxVR+A9bLfrUzF
 oFwH+wESd48eMtRgcdWlYVNq9Sq5rQL75ZlfKYvAd34r9NXGbvDIcdf0UbNW8Sbm7FsXYq9BM6i
 riSmJhnbK+QwEwo5BN/7odPTJz2s=
X-Google-Smtp-Source: AGHT+IHnv0YHHWkoO2WX34G9FH8gXPrK1s2Qe2DPcmRL3JizKCox9A4TZ9lr3cjysLeq+OmUGsUxTgFtfkIqhvpziGQ=
X-Received: by 2002:a17:906:f352:b0:a45:af32:5e04 with SMTP id
 hg18-20020a170906f35200b00a45af325e04mr2841791ejb.30.1709869971794; Thu, 07
 Mar 2024 19:52:51 -0800 (PST)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 8 Mar 2024 13:52:40 +1000
Message-ID: <CAPM=9tzTeAgY3rUR_KC8=q5MybJ5PDAyzXJyh0RUigR6_ccyZA@mail.gmail.com>
Subject: [git pull] drm fixes for 6.8 final
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
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

not sure if -final is correct but guess I'll find out if it should
have said rc8.

Regular fixes (two weeks for i915), scattered across drivers, amdgpu
and i915 being the main ones, with nouveau having a couple of fixes.
One patch got applied for udl, but reverted soon after as the
maintainer has missed some crucial prior discussion.

Seems quiet and normal enough for this stage.

Dave.

drm-fixes-2024-03-08:
drm fixes for 6.8 final

MAINTAINERS
- update email address

core:
- fix polling in certain configurations

buddy:
- fix kunit test warning

panel:
- boe-tv101wum-nl6: timing tuning fixes

i915:
- Fix to extract HDCP information from primary connector
- Check for NULL mmu_interval_notifier before removing
- Fix for #10184: Kernel crash on UHD Graphics 730 (Cc stable)
- Fix for #10284: Boot delay regresion with PSR
- Fix DP connector DSC HW state readout
- Selftest fix to convert msecs to jiffies

xe:
- error path fix

amdgpu:
- SMU14 fix
- Fix possible NULL pointer
- VRR fix
- pwm fix

nouveau:
- fix deadlock in new ioctls fail path
- fix missing locking around object rbtree

udl:
- apply and revert format change
The following changes since commit 90d35da658da8cff0d4ecbb5113f5fac9d00eb72=
:

  Linux 6.8-rc7 (2024-03-03 13:02:52 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2024-03-08

for you to fetch changes up to b7cc4ff787a572edf2c55caeffaa88cd801eb135:

  nouveau: lock the client object tree. (2024-03-08 13:40:56 +1000)

----------------------------------------------------------------
drm fixes for 6.8 final

MAINTAINERS
- update email address

core:
- fix polling in certain configurations

buddy:
- fix kunit test warning

panel:
- boe-tv101wum-nl6: timing tuning fixes

i915:
- Fix to extract HDCP information from primary connector
- Check for NULL mmu_interval_notifier before removing
- Fix for #10184: Kernel crash on UHD Graphics 730 (Cc stable)
- Fix for #10284: Boot delay regresion with PSR
- Fix DP connector DSC HW state readout
- Selftest fix to convert msecs to jiffies

xe:
- error path fix

amdgpu:
- SMU14 fix
- Fix possible NULL pointer
- VRR fix
- pwm fix

nouveau:
- fix deadlock in new ioctls fail path
- fix missing locking around object rbtree

udl:
- apply and revert format change

----------------------------------------------------------------
Alex Deucher (1):
      drm/amd/display: handle range offsets in VRR ranges

Animesh Manna (1):
      drm/i915/panelreplay: Move out psr_init_dpcd() from init_connector()

Cong Yang (1):
      drm/panel: boe-tv101wum-nl6: Fine tune Himax83102-j02 panel HFP
and HBP (again)

Daniel Vetter (1):
      Merge tag 'drm-intel-fixes-2024-03-01' of
https://anongit.freedesktop.org/git/drm/drm-intel into drm-fixes

Dave Airlie (5):
      Merge tag 'drm-intel-fixes-2024-03-07' of
https://anongit.freedesktop.org/git/drm/drm-intel into drm-fixes
      Merge tag 'drm-xe-fixes-2024-03-07' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes
      Merge tag 'amd-drm-fixes-6.8-2024-03-07' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes
      Merge tag 'drm-misc-fixes-2024-03-07' of
https://anongit.freedesktop.org/git/drm/drm-misc into drm-fixes
      nouveau: lock the client object tree.

Douglas Anderson (2):
      drm/udl: Add ARGB8888 as a format
      Revert "drm/udl: Add ARGB8888 as a format"

Imre Deak (2):
      drm: Fix output poll work for drm_kms_helper_poll=3Dn
      drm/i915/dp: Fix connector DSC HW state readout

Janusz Krzysztofik (1):
      drm/i915/selftests: Fix dependency of some timeouts on HZ

Karol Herbst (1):
      drm/nouveau: fix stale locked mutex in nouveau_gem_ioctl_pushbuf

Li Ma (1):
      drm/amd/swsmu: modify the gfx activity scaling

Ma Jun (1):
      drm/amdgpu/pm: Fix the error of pwm1_enable setting

Matthew Auld (1):
      drm/tests/buddy: fix print format

Melissa Wen (1):
      drm/amd/display: check dc_link before dereferencing

Nirmoy Das (1):
      drm/i915: Check before removing mm notifier

Rodrigo Vivi (1):
      drm/xe: Return immediately on tile_init failure

Suraj Kandpal (3):
      drm/i915/hdcp: Move to direct reads for HDCP
      drm/i915/hdcp: Remove additional timing for reading mst hdcp message
      drm/i915/hdcp: Extract hdcp structure from correct connector

Tvrtko Ursulin (1):
      MAINTAINERS: Update email address for Tvrtko Ursulin

Ville Syrj=C3=A4l=C3=A4 (1):
      drm/i915: Don't explode when the dig port we don't have an AUX CH

 .mailmap                                           |  5 +++
 MAINTAINERS                                        |  2 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  | 21 +++++++---
 drivers/gpu/drm/amd/pm/amdgpu_pm.c                 | 12 +++++-
 drivers/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0.c     |  2 -
 .../gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_0_ppt.c   |  5 ++-
 drivers/gpu/drm/drm_probe_helper.c                 |  8 ++--
 .../drm/i915/display/intel_display_power_well.c    | 17 ++++++--
 drivers/gpu/drm/i915/display/intel_display_types.h |  7 ++++
 drivers/gpu/drm/i915/display/intel_dp.c            | 16 ++++++++
 drivers/gpu/drm/i915/display/intel_dp.h            |  2 +
 drivers/gpu/drm/i915/display/intel_dp_hdcp.c       | 47 ++++++++----------=
----
 drivers/gpu/drm/i915/display/intel_dp_mst.c        |  1 +
 drivers/gpu/drm/i915/display/intel_modeset_setup.c | 13 +++---
 drivers/gpu/drm/i915/display/intel_psr.c           |  3 --
 drivers/gpu/drm/i915/gem/i915_gem_userptr.c        |  3 ++
 .../drm/i915/selftests/intel_scheduler_helpers.c   |  6 ++-
 drivers/gpu/drm/nouveau/include/nvkm/core/client.h |  1 +
 drivers/gpu/drm/nouveau/nouveau_gem.c              |  2 +-
 drivers/gpu/drm/nouveau/nvkm/core/client.c         |  1 +
 drivers/gpu/drm/nouveau/nvkm/core/object.c         | 26 +++++++++---
 drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c     |  8 ++--
 drivers/gpu/drm/tests/drm_buddy_test.c             |  2 +-
 drivers/gpu/drm/xe/xe_tile.c                       |  5 ++-
 24 files changed, 141 insertions(+), 74 deletions(-)
