Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB23B92F4B1
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jul 2024 06:47:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 873AD10EBEE;
	Fri, 12 Jul 2024 04:47:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="OHo1DPbf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04E7E10EB22
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jul 2024 04:47:10 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id
 4fb4d7f45d1cf-58c2e5e8649so3946259a12.1
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jul 2024 21:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720759628; x=1721364428; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=pAkn2cTSTcU5jSssfeBuKmvRbIUP8ptqi04m3wwrjB4=;
 b=OHo1DPbf7HDipVKmPAL0Ron5X9RK2jmzoSB03FIvbs4hDNuHpht+EjiAI5RJoMWiC0
 lNxmHneGBNes9ByARYWpSSo+/ZDsByi4EdiQtpI9QtTJJjLtx7ggTAgY0GUpfAH1DhYS
 HHQinNkjSqJsxR1rCN9LRGp+zDoWmnKgT4x43UUzHcfFylx6CrHM0qM5hsIchiCY8wLx
 RUYyG0IRZSwLJY2+1eIJ85RHz4e+BkTQw/+jJLe+I8U5UiJcwtt8JBl4YW1pcn+33pYq
 h35crOF4x5z1aoR9s60IMxzCYTKFS9jWvfQ4W58jtg4ydPiPbvsRpGt+m/pCZmNO7etX
 mKSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720759628; x=1721364428;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pAkn2cTSTcU5jSssfeBuKmvRbIUP8ptqi04m3wwrjB4=;
 b=sohfE6vtyeawkJSRtsVZZpL/anTXv40S1+e7BPD4zVwDwNbjBZbAO1etsrHc2ZyG60
 ocX2yO5zwtyQ9CZrQ0YENZ/eBrF4SHnrB+erfAqTomzBWpuTljP412svprvy+qK24c87
 o7+/aNXvK3Ev+xHhUEORnypNtTmk5qzNm4wsmi05EacpUA1BP33djH/6Oy6+29aaS+qW
 UmB90VyJMZny76b9VXA4aYxSMj6d7hZJECy1IlbKtzdov7FwJ2X7TV4hYsiZTd3WjfMy
 23uzgDITFVC3R9jKMElFymfHkNR7OpLaZW6jPhgE/8o/G8JDY97GT82OYtZVrrV/6vhx
 GZNQ==
X-Gm-Message-State: AOJu0YxgKT/z2axz0sQL7taIsherW7ixfEFj3lEC70jRKw8ysWEu/evX
 YagEQlQs/BBGf/2YEPwsCVPqs2JSpmPtj9n860+aX21w/pyGQT0ZzugVbwyEuEMvV+pELj3HkZt
 Vt11mImjb1+shuoocKkU0/OWSbbBbgLcKJp8=
X-Google-Smtp-Source: AGHT+IFZYBNzXtdjjVzb8dVyNE6tOfvjEVwR/PDhKcvGdCvIxNVO1vIgJ78q/iMjD9YQS0N3JFJqlTWFxpwOckYUnlI=
X-Received: by 2002:a17:907:7d90:b0:a77:e152:a8e with SMTP id
 a640c23a62f3a-a799cd00609mr126400866b.26.1720759627920; Thu, 11 Jul 2024
 21:47:07 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 12 Jul 2024 14:46:56 +1000
Message-ID: <CAPM=9tzVaA1Y4A69HF-gHPy3YEgE7EGKxZa0rFWT4NUKvdF1wg@mail.gmail.com>
Subject: [git pull] drm fixes for 6.10-rc8
To: LKML <linux-kernel@vger.kernel.org>, Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: dri-devel <dri-devel@lists.freedesktop.org>
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

Back to work, thanks to Sima for last week, not too many fixes as
expected getting close to release, amdgpu and xe have a couple each,
and then some other misc ones.

Dave.

drm-fixes-2024-07-12:
drm fixes for 6.10-rc8

amdgpu:
- PSR-SU fix
- Reseved VMID fix

xe:
- Use write-back caching mode for system memory on DGFX
- Do not leak object when finalizing hdcp gsc

bridge:
- adv7511 EDID irq fix

gma500:
- NULL mode fixes.

meson:
- fix resource leak
The following changes since commit 256abd8e550ce977b728be79a74e1729438b4948=
:

  Linux 6.10-rc7 (2024-07-07 14:23:46 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2024-07-12

for you to fetch changes up to 8b68788bebd3f697ae62aa9af3dac35ed112ebd7:

  Merge tag 'amd-drm-fixes-6.10-2024-07-11' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes (2024-07-12
13:32:36 +1000)

----------------------------------------------------------------
drm fixes for 6.10-rc8

amdgpu:
- PSR-SU fix
- Reseved VMID fix

xe:
- Use write-back caching mode for system memory on DGFX
- Do not leak object when finalizing hdcp gsc

bridge:
- adv7511 EDID irq fix

gma500:
- NULL mode fixes.

meson:
- fix resource leak

----------------------------------------------------------------
Adam Ford (1):
      drm/bridge: adv7511: Fix Intermittent EDID failures

Christian K=C3=B6nig (1):
      drm/amdgpu: reject gang submit on reserved VMIDs

Dave Airlie (3):
      Merge tag 'drm-misc-fixes-2024-07-11' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-fixes
      Merge tag 'drm-xe-fixes-2024-07-11' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes
      Merge tag 'amd-drm-fixes-6.10-2024-07-11' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes

Leo Li (1):
      Revert "drm/amd/display: Reset freesync config before update new stat=
e"

Ma Ke (2):
      drm/gma500: fix null pointer dereference in psb_intel_lvds_get_modes
      drm/gma500: fix null pointer dereference in cdv_intel_lvds_get_modes

Nirmoy Das (1):
      drm/xe/display/xe_hdcp_gsc: Free arbiter on driver removal

Thomas Hellstr=C3=B6m (1):
      drm/xe: Use write-back caching mode for system memory on DGFX

Yao Zi (1):
      drm/meson: fix canvas release in bind function

 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c            | 15 ++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c           | 15 +++++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ids.h           |  1 +
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  1 -
 drivers/gpu/drm/bridge/adv7511/adv7511.h          |  2 +-
 drivers/gpu/drm/bridge/adv7511/adv7511_cec.c      | 13 +++++--
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c      | 22 ++++++-----
 drivers/gpu/drm/gma500/cdv_intel_lvds.c           |  3 ++
 drivers/gpu/drm/gma500/psb_intel_lvds.c           |  3 ++
 drivers/gpu/drm/meson/meson_drv.c                 | 37 +++++++++---------
 drivers/gpu/drm/xe/display/xe_hdcp_gsc.c          | 12 ++++--
 drivers/gpu/drm/xe/xe_bo.c                        | 47 ++++++++++++++-----=
----
 drivers/gpu/drm/xe/xe_bo_types.h                  |  3 +-
 include/uapi/drm/xe_drm.h                         |  8 +++-
 14 files changed, 122 insertions(+), 60 deletions(-)
