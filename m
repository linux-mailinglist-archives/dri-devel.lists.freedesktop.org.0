Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B49DBB0FE33
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jul 2025 02:36:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE9D210E19D;
	Thu, 24 Jul 2025 00:36:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="eXIcaTQB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A760310E19D
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jul 2025 00:36:30 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-ae36dc91dc7so62448566b.2
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 17:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753317389; x=1753922189; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=LP5C9I+e5v/MzKvkoEW9Ka+TOEoC78cHuowJpEmBMV4=;
 b=eXIcaTQBw+gbTcD15lYacMbuMUrC7lsdnujZTDi3udEyZRSYBQApjUKrO3iu0areRy
 zQcY8WPeL1HwXsx2/155p9FMdlP7KcAbRDSnBDqgQqYanydj3DFDmMtuqDDlC+8qhAba
 +Vo9tZMjg7+5KW/OvnkNxnyLhE/QeCXpB5kWMIB08r0a/8387AkKQlIeV92tL9+AnAnP
 snKZARRrLtxF6CQBW/BX1nKm6+K3TbKYCfZkK0AIqQPmMlXelkuYU3TZrbhVJvbZ7O1J
 Tkfk5bUbtjlfgg/J9jqzgq8ndPJpoVyCj1sGAiIAWuv8FY7sFUD6Tb8VmLvcxk71Q2Fb
 iqag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753317389; x=1753922189;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LP5C9I+e5v/MzKvkoEW9Ka+TOEoC78cHuowJpEmBMV4=;
 b=gPRb6QDCeHfTNkq8BtszQ7C3M8pzg4249/zc5W79bC1hsSbKKDNydgyiQcqAGiv/ay
 5fsRN8tXNPy8srJCnybKvsR7WAm8ZOl/24PtYZqFGrS3a+hfpgkNG1c76MbrZGOzRTDX
 /GbBTY+BYhoGsglEaXA+hl8s10DUSCAyeLhDt5MT4zSym43HcNynbntO6HoF9C08RI8X
 2Ndm/GDX9f+VqJSKnxAKLstroy97LM3J5629T1Y1jIjDhlzUNktm3oc8y5GN4/7uh8hk
 uAHpcFCbCxih//+RA0w4JmJEy8zhtBwhr4XYq0fckQgrGwiA8kfRdI6WSSnIZFoledMa
 FTTw==
X-Gm-Message-State: AOJu0Yz/dD9R5qOAyJZaqNwbpgOLKQuYOM7tbUbxJbPvC2BBy8xo+/wT
 Fksf54F6tqqC6QOOIJrbJQwahvGMHM/VHBhJx/YEj8W7/T6CbQ9dz3MaoeSV3pgP0nDYwSgvhKB
 2of/+rqO+N/thfEHJTbbXiU5Nz9P5ARjdnyO4iEY=
X-Gm-Gg: ASbGncuTdpXD/eGBG5Qt1/P342y1OMaxUhHDAG2UW8YFBlJJboQ0SRoyIyB4coagbr+
 97CJ7xwOd/uA15ZdeplkZ3YZWLRvh7+/nqUqtLOs90gy5mxfdI4ouepacVPxZxdJnO1GbhtT/8s
 Z3JwVGW6p0FguJdvclI5tr5PUIs/Dtt1lVdZ8b3S01dIGe9z5eTYmuoFNLAMEHf5X1FI7yfKokg
 P8XcQ==
X-Google-Smtp-Source: AGHT+IEvTm0ObzgeIxjhu/JPGxezQhG3Pad6gWIaI0+TSgldHTHejqrYZIesn+AVmfMM46QTldAE3LTup4IQ1vap9ZQ=
X-Received: by 2002:a17:906:fe44:b0:ae6:d94f:4326 with SMTP id
 a640c23a62f3a-af2f927a0cfmr563816666b.57.1753317388935; Wed, 23 Jul 2025
 17:36:28 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 24 Jul 2025 10:36:17 +1000
X-Gm-Features: Ac12FXw9xOs3LFJx71GBstCo5886k6Xzn_Y3ikkHHrOoWRjEhjSzDGL1B7zoQro
Message-ID: <CAPM=9tzHkh1jiV6HdSbU4=1rriZ0uWGekYOvA7rb_hCtB+b6Pg@mail.gmail.com>
Subject: [git pull] drm fixes for 6.16-rc8/final (resend)
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Content-Type: multipart/alternative; boundary="0000000000002566fb063aa20452"
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

--0000000000002566fb063aa20452
Content-Type: text/plain; charset="UTF-8"

(somehow fat fingered into HTML writing the first time)

Hi Linus,

This might just be part one, but I'm sending it a bit early as it has two
sets of reverts for regressions, one is all the gem/dma-buf handling and
another was a nouveau ioctl change.

Otherwise there is an amdgpu fix, nouveau fix and a scheduler fix.

If any other changes come in I'll follow up with another more usual Fri/Sat
MR.

Dave.

drm-fixes-2025-07-24:
drm fixes for 6.16-rc8

gem:
- revert all the dma-buf/gem changes
  as there as lifetime issues with it.

nouveau:
- revert an ioctl change as it causes issues
- fix NULL ptr on fermi

bridge:
- remove extra semicolon

sched:
- remove hang causing optimisation

amdgpu:
- fix garbage in cleared vram after resume
The following changes since commit 89be9a83ccf1f88522317ce02f854f30d6115c41:

  Linux 6.16-rc7 (2025-07-20 15:18:33 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2025-07-24

for you to fetch changes up to 337666c522b9eca36deabf4133f7b2279155b69f:

  Merge tag 'drm-misc-fixes-2025-07-23' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-fixes (2025-07-24
06:49:38 +1000)

----------------------------------------------------------------
drm fixes for 6.16-rc8

gem:
- revert all the dma-buf/gem changes
  as there as lifetime issues with it.

nouveau:
- revert an ioctl change as it causes issues
- fix NULL ptr on fermi

bridge:
- remove extra semicolon

sched:
- remove hang causing optimisation

amdgpu:
- fix garbage in cleared vram after resume

----------------------------------------------------------------
Arnd Bergmann (1):
      Revert "drm/nouveau: check ioctl command codes better"

Arunpravin Paneer Selvam (1):
      drm/amdgpu: Reset the clear flag in buddy during resume

Ben Skeggs (1):
      drm/nouveau/nvif: fix null ptr deref on pre-fermi boards

Dave Airlie (1):
      Merge tag 'drm-misc-fixes-2025-07-23' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-fixes

Douglas Anderson (1):
      drm/bridge: ti-sn65dsi86: Remove extra semicolon in
ti_sn_bridge_probe()

Lin.Cao (1):
      drm/sched: Remove optimization that causes hang when killing
dependent jobs

Thomas Zimmermann (7):
      Revert "drm/virtio: Use dma_buf from GEM object instance"
      Revert "drm/vmwgfx: Use dma_buf from GEM object instance"
      Revert "drm/etnaviv: Use dma_buf from GEM object instance"
      Revert "drm/prime: Use dma_buf from GEM object instance"
      Revert "drm/gem-framebuffer: Use dma_buf from GEM object instance"
      Revert "drm/gem-shmem: Use dma_buf from GEM object instance"
      Revert "drm/gem-dma: Use dma_buf from GEM object instance"

 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c   |  2 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h      |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c | 17 +++++++++++
 drivers/gpu/drm/bridge/ti-sn65dsi86.c        |  2 +-
 drivers/gpu/drm/drm_buddy.c                  | 43
++++++++++++++++++++++++++++
 drivers/gpu/drm/drm_gem_dma_helper.c         |  2 +-
 drivers/gpu/drm/drm_gem_framebuffer_helper.c |  8 ++++--
 drivers/gpu/drm/drm_gem_shmem_helper.c       |  4 +--
 drivers/gpu/drm/drm_prime.c                  |  8 +++++-
 drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c  |  4 +--
 drivers/gpu/drm/nouveau/nouveau_drm.c        | 11 +++----
 drivers/gpu/drm/nouveau/nvif/chan.c          |  3 ++
 drivers/gpu/drm/scheduler/sched_entity.c     | 21 ++------------
 drivers/gpu/drm/virtio/virtgpu_prime.c       |  5 ++--
 drivers/gpu/drm/vmwgfx/vmwgfx_gem.c          |  6 ++--
 include/drm/drm_buddy.h                      |  2 ++
 16 files changed, 101 insertions(+), 38 deletions(-)

--0000000000002566fb063aa20452
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>(somehow fat fingered into HTML writing the first tim=
e)</div><div><br></div><div>Hi Linus,</div><br>This might just be part one,=
 but I&#39;m sending it a bit early as it has two sets of reverts for regre=
ssions, one is all the gem/dma-buf handling and another was a nouveau ioctl=
 change.<br><br>Otherwise there is an amdgpu fix, nouveau fix and a schedul=
er fix.<br><br>If any other changes come in I&#39;ll follow up with another=
 more usual Fri/Sat MR.<br><br>Dave.<br><br>drm-fixes-2025-07-24:<br>drm fi=
xes for 6.16-rc8<br><br>gem:<br>- revert all the dma-buf/gem changes<br>=C2=
=A0 as there as lifetime issues with it.<br><br>nouveau:<br>- revert an ioc=
tl change as it causes issues<br>- fix NULL ptr on fermi<br><br>bridge:<br>=
- remove extra semicolon<br><br>sched:<br>- remove hang causing optimisatio=
n<br><br>amdgpu:<br>- fix garbage in cleared vram after resume<br>The follo=
wing changes since commit 89be9a83ccf1f88522317ce02f854f30d6115c41:<br><br>=
=C2=A0 Linux 6.16-rc7 (2025-07-20 15:18:33 -0700)<br><br>are available in t=
he Git repository at:<br><br>=C2=A0 <a href=3D"https://gitlab.freedesktop.o=
rg/drm/kernel.git">https://gitlab.freedesktop.org/drm/kernel.git</a> tags/d=
rm-fixes-2025-07-24<br><br>for you to fetch changes up to 337666c522b9eca36=
deabf4133f7b2279155b69f:<br><br>=C2=A0 Merge tag &#39;drm-misc-fixes-2025-0=
7-23&#39; of <a href=3D"https://gitlab.freedesktop.org/drm/misc/kernel">htt=
ps://gitlab.freedesktop.org/drm/misc/kernel</a> into drm-fixes (2025-07-24 =
06:49:38 +1000)<br><br>----------------------------------------------------=
------------<br>drm fixes for 6.16-rc8<br><br>gem:<br>- revert all the dma-=
buf/gem changes<br>=C2=A0 as there as lifetime issues with it.<br><br>nouve=
au:<br>- revert an ioctl change as it causes issues<br>- fix NULL ptr on fe=
rmi<br><br>bridge:<br>- remove extra semicolon<br><br>sched:<br>- remove ha=
ng causing optimisation<br><br>amdgpu:<br>- fix garbage in cleared vram aft=
er resume<br><br>----------------------------------------------------------=
------<br>Arnd Bergmann (1):<br>=C2=A0 =C2=A0 =C2=A0 Revert &quot;drm/nouve=
au: check ioctl command codes better&quot;<br><br>Arunpravin Paneer Selvam =
(1):<br>=C2=A0 =C2=A0 =C2=A0 drm/amdgpu: Reset the clear flag in buddy duri=
ng resume<br><br>Ben Skeggs (1):<br>=C2=A0 =C2=A0 =C2=A0 drm/nouveau/nvif: =
fix null ptr deref on pre-fermi boards<br><br>Dave Airlie (1):<br>=C2=A0 =
=C2=A0 =C2=A0 Merge tag &#39;drm-misc-fixes-2025-07-23&#39; of <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/misc/kernel">https://gitlab.freedesktop.o=
rg/drm/misc/kernel</a> into drm-fixes<br><br>Douglas Anderson (1):<br>=C2=
=A0 =C2=A0 =C2=A0 drm/bridge: ti-sn65dsi86: Remove extra semicolon in ti_sn=
_bridge_probe()<br><br>Lin.Cao (1):<br>=C2=A0 =C2=A0 =C2=A0 drm/sched: Remo=
ve optimization that causes hang when killing dependent jobs<br><br>Thomas =
Zimmermann (7):<br>=C2=A0 =C2=A0 =C2=A0 Revert &quot;drm/virtio: Use dma_bu=
f from GEM object instance&quot;<br>=C2=A0 =C2=A0 =C2=A0 Revert &quot;drm/v=
mwgfx: Use dma_buf from GEM object instance&quot;<br>=C2=A0 =C2=A0 =C2=A0 R=
evert &quot;drm/etnaviv: Use dma_buf from GEM object instance&quot;<br>=C2=
=A0 =C2=A0 =C2=A0 Revert &quot;drm/prime: Use dma_buf from GEM object insta=
nce&quot;<br>=C2=A0 =C2=A0 =C2=A0 Revert &quot;drm/gem-framebuffer: Use dma=
_buf from GEM object instance&quot;<br>=C2=A0 =C2=A0 =C2=A0 Revert &quot;dr=
m/gem-shmem: Use dma_buf from GEM object instance&quot;<br>=C2=A0 =C2=A0 =
=C2=A0 Revert &quot;drm/gem-dma: Use dma_buf from GEM object instance&quot;=
<br><br>=C2=A0drivers/gpu/drm/amd/amdgpu/amdgpu_device.c =C2=A0 | =C2=A02 +=
+<br>=C2=A0drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h =C2=A0 =C2=A0 =C2=A0| =
=C2=A01 +<br>=C2=A0drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c | 17 ++++++=
+++++<br>=C2=A0drivers/gpu/drm/bridge/ti-sn65dsi86.c =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| =C2=A02 +-<br>=C2=A0drivers/gpu/drm/drm_buddy.c =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 43 +++++++++++++++++++++++++=
+++<br>=C2=A0drivers/gpu/drm/drm_gem_dma_helper.c =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | =C2=A02 +-<br>=C2=A0drivers/gpu/drm/drm_gem_framebuffer_helper.c | =
=C2=A08 ++++--<br>=C2=A0drivers/gpu/drm/drm_gem_shmem_helper.c =C2=A0 =C2=
=A0 =C2=A0 | =C2=A04 +--<br>=C2=A0drivers/gpu/drm/drm_prime.c =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A08 +++++-<br>=C2=A0=
drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c =C2=A0| =C2=A04 +--<br>=C2=A0dr=
ivers/gpu/drm/nouveau/nouveau_drm.c =C2=A0 =C2=A0 =C2=A0 =C2=A0| 11 +++----=
<br>=C2=A0drivers/gpu/drm/nouveau/nvif/chan.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| =C2=A03 ++<br>=C2=A0drivers/gpu/drm/scheduler/sched_entity.c =C2=A0=
 =C2=A0 | 21 ++------------<br>=C2=A0drivers/gpu/drm/virtio/virtgpu_prime.c=
 =C2=A0 =C2=A0 =C2=A0 | =C2=A05 ++--<br>=C2=A0drivers/gpu/drm/vmwgfx/vmwgfx=
_gem.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A06 ++--<br>=C2=A0include/dr=
m/drm_buddy.h =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| =C2=A02 ++<br>=C2=A016 files changed, 101 insertions(+),=
 38 deletions(-)<br><br><br></div>

--0000000000002566fb063aa20452--
