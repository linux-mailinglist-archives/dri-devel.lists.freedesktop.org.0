Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7892FB0FE29
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jul 2025 02:29:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D595810E013;
	Thu, 24 Jul 2025 00:29:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="G7V8bH0b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92A7B10E013
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jul 2025 00:29:50 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-adfb562266cso64011366b.0
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 17:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753316989; x=1753921789; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=eC1Sn3OuPO3THfDVPup7KXOJqAlpNnex3FG2505D1Nk=;
 b=G7V8bH0bECLAJtIILDzJArtKJoYLTGlI2LMXyGwAMMGlQWmsojOQ3QzWpD9LCxXuC9
 4Fz3ZmJZcN2mzXLWblyPhv2QfqS6TSFh5nIqwTqJRDsHb59znylZFK3GJdcZ9m6mL5iU
 elF2qDmRyEfvHPr/nkMkIhEFtLDabSZ6KuZ5WpdpECT7YM2RPeM80tDFifiN9pLFtOCN
 m41tQItch0kIDCE7fg6yJAHcJD63CABBU+16A5+8UBAD8vqj3U/4Ho77K4J7iv0pQUvz
 3B1YKmcJz+XFbMjeD4KE1tcIEZFq9ytnIveU7wjWJ8+fj18P/xFe5A1lVFHo/HvMdew3
 ww2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753316989; x=1753921789;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=eC1Sn3OuPO3THfDVPup7KXOJqAlpNnex3FG2505D1Nk=;
 b=n4wbgOzHiR2qu3FWJhJUcfo22MIe2b+PqyTAiPCvfOgOxyo048MSMPnNBak5klFtcW
 l7H/82/k9RFdUunvPytaGzOl8VHZ9l1EdKCbsvmWhBrL4/QtDw4dCrE+RxRTdoqD/Mtf
 NFeqkwYCEq+ix+c5TADUteViuSoMkDmMsJ1Wrc4CZuMIWc5UFMYz9HluMZNjaZT0tP4X
 e7n3s8aEDAE6yeNrb5fSFyV9zc/Bb5brqzftLjdKNLCpuXn9bgXAdJziM4XqHmxuZs53
 +Hci51GlaJ8sBPRRr7CWBcmZDgbBfsXlR+EwtxWIT5eU7R67kJRzRiq2SS6f5xbv2MQH
 SuFA==
X-Gm-Message-State: AOJu0YwgZWy839BC0BAfcB9DkEEYtgBGCPNgwCKXBOi8wq43e/RXVgKL
 xMXug93nvJgPPte4VWe7LkUtK8ofqB/6+XZrj9i1sX896YmOv/IOvApChZHlubAoCaWU8d//YgP
 PqIqQTDFozi4oNPziYHy8i3VADfQCDcef0g6ff3I=
X-Gm-Gg: ASbGncvFpZnzrMPWrP5WB6O671LPZJBZuPA94m/u9pSokT5PvFrGo8DxP90a/BqdHIp
 WW0vgD5RfV6TaUP16P0M7+Z7mmnSgqGWCs7If+QuNT90dXslXo19BLyzyO8hD9cx/FaWMp3qpap
 dlv7Rj9zdzSPE65sBMKH90AIIdCQY92/LCEP1x6AzaSeyzOO75ZfkIljLR4PPjDG2cvCNtuJ4Xr
 /HTJw==
X-Google-Smtp-Source: AGHT+IEDnKJp/BUjK5ICdoUzbzNf4gXWP5IInfeQI82iZiSZTbD52y67udn58JyFXlgTirjlGxRK9yn+a1KtLLci4e4=
X-Received: by 2002:a17:907:3d0d:b0:ae0:da2d:44b9 with SMTP id
 a640c23a62f3a-af2f64b604cmr518476666b.7.1753316988769; Wed, 23 Jul 2025
 17:29:48 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 24 Jul 2025 10:29:37 +1000
X-Gm-Features: Ac12FXx1B_J2N25tTEU3ZCUIV2PpHvc_MuLZ0D-QYNCI7VY2VE4gUE9gZReipiM
Message-ID: <CAPM=9twEYAfwGx2EiYXUPUt=mUMS4WdzTpriK=GEEANhDwAmXg@mail.gmail.com>
Subject: [git pull] drm fixes for 6.16-rc8/final
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Content-Type: multipart/alternative; boundary="0000000000004b5b20063aa1eceb"
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

--0000000000004b5b20063aa1eceb
Content-Type: text/plain; charset="UTF-8"

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

--0000000000004b5b20063aa1eceb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Linus,</div><div><br></div><div>This might just be=
 part one, but I&#39;m sending it a bit early as it has two sets of reverts=
 for regressions, one is all the gem/dma-buf handling and another was a nou=
veau ioctl change.</div><div><br></div><div>Otherwise there is an amdgpu fi=
x, nouveau fix and a scheduler fix.</div><div><br></div><div>If any other c=
hanges come in I&#39;ll follow up with another more usual Fri/Sat MR.</div>=
<div><br></div><div>Dave.</div><div><br></div><div>drm-fixes-2025-07-24:<br=
>drm fixes for 6.16-rc8<br><br>gem:<br>- revert all the dma-buf/gem changes=
<br>=C2=A0 as there as lifetime issues with it.<br><br>nouveau:<br>- revert=
 an ioctl change as it causes issues<br>- fix NULL ptr on fermi<br><br>brid=
ge:<br>- remove extra semicolon<br><br>sched:<br>- remove hang causing opti=
misation<br><br>amdgpu:<br>- fix garbage in cleared vram after resume<br>Th=
e following changes since commit 89be9a83ccf1f88522317ce02f854f30d6115c41:<=
br><br>=C2=A0 Linux 6.16-rc7 (2025-07-20 15:18:33 -0700)<br><br>are availab=
le in the Git repository at:<br><br>=C2=A0 <a href=3D"https://gitlab.freede=
sktop.org/drm/kernel.git">https://gitlab.freedesktop.org/drm/kernel.git</a>=
 tags/drm-fixes-2025-07-24<br><br>for you to fetch changes up to 337666c522=
b9eca36deabf4133f7b2279155b69f:<br><br>=C2=A0 Merge tag &#39;drm-misc-fixes=
-2025-07-23&#39; of <a href=3D"https://gitlab.freedesktop.org/drm/misc/kern=
el">https://gitlab.freedesktop.org/drm/misc/kernel</a> into drm-fixes (2025=
-07-24 06:49:38 +1000)<br><br>---------------------------------------------=
-------------------<br>drm fixes for 6.16-rc8<br><br>gem:<br>- revert all t=
he dma-buf/gem changes<br>=C2=A0 as there as lifetime issues with it.<br><b=
r>nouveau:<br>- revert an ioctl change as it causes issues<br>- fix NULL pt=
r on fermi<br><br>bridge:<br>- remove extra semicolon<br><br>sched:<br>- re=
move hang causing optimisation<br><br>amdgpu:<br>- fix garbage in cleared v=
ram after resume<br><br>---------------------------------------------------=
-------------<br>Arnd Bergmann (1):<br>=C2=A0 =C2=A0 =C2=A0 Revert &quot;dr=
m/nouveau: check ioctl command codes better&quot;<br><br>Arunpravin Paneer =
Selvam (1):<br>=C2=A0 =C2=A0 =C2=A0 drm/amdgpu: Reset the clear flag in bud=
dy during resume<br><br>Ben Skeggs (1):<br>=C2=A0 =C2=A0 =C2=A0 drm/nouveau=
/nvif: fix null ptr deref on pre-fermi boards<br><br>Dave Airlie (1):<br>=
=C2=A0 =C2=A0 =C2=A0 Merge tag &#39;drm-misc-fixes-2025-07-23&#39; of <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/misc/kernel">https://gitlab.freede=
sktop.org/drm/misc/kernel</a> into drm-fixes<br><br>Douglas Anderson (1):<b=
r>=C2=A0 =C2=A0 =C2=A0 drm/bridge: ti-sn65dsi86: Remove extra semicolon in =
ti_sn_bridge_probe()<br><br>Lin.Cao (1):<br>=C2=A0 =C2=A0 =C2=A0 drm/sched:=
 Remove optimization that causes hang when killing dependent jobs<br><br>Th=
omas Zimmermann (7):<br>=C2=A0 =C2=A0 =C2=A0 Revert &quot;drm/virtio: Use d=
ma_buf from GEM object instance&quot;<br>=C2=A0 =C2=A0 =C2=A0 Revert &quot;=
drm/vmwgfx: Use dma_buf from GEM object instance&quot;<br>=C2=A0 =C2=A0 =C2=
=A0 Revert &quot;drm/etnaviv: Use dma_buf from GEM object instance&quot;<br=
>=C2=A0 =C2=A0 =C2=A0 Revert &quot;drm/prime: Use dma_buf from GEM object i=
nstance&quot;<br>=C2=A0 =C2=A0 =C2=A0 Revert &quot;drm/gem-framebuffer: Use=
 dma_buf from GEM object instance&quot;<br>=C2=A0 =C2=A0 =C2=A0 Revert &quo=
t;drm/gem-shmem: Use dma_buf from GEM object instance&quot;<br>=C2=A0 =C2=
=A0 =C2=A0 Revert &quot;drm/gem-dma: Use dma_buf from GEM object instance&q=
uot;<br><br>=C2=A0drivers/gpu/drm/amd/amdgpu/amdgpu_device.c =C2=A0 | =C2=
=A02 ++<br>=C2=A0drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h =C2=A0 =C2=A0 =C2=
=A0| =C2=A01 +<br>=C2=A0drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c | 17 +=
++++++++++<br>=C2=A0drivers/gpu/drm/bridge/ti-sn65dsi86.c =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| =C2=A02 +-<br>=C2=A0drivers/gpu/drm/drm_buddy.c =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 43 ++++++++++++++++++++++=
++++++<br>=C2=A0drivers/gpu/drm/drm_gem_dma_helper.c =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | =C2=A02 +-<br>=C2=A0drivers/gpu/drm/drm_gem_framebuffer_helper.c |=
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
 38 deletions(-)</div></div>

--0000000000004b5b20063aa1eceb--
