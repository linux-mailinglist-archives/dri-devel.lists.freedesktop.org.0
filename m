Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED90A482176
	for <lists+dri-devel@lfdr.de>; Fri, 31 Dec 2021 03:20:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97EC810E11B;
	Fri, 31 Dec 2021 02:20:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABB0E10E11B
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Dec 2021 02:20:17 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id x15so104467916edv.1
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Dec 2021 18:20:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=4BT5zSfL/LUdbZdT7j6ucUNjI5aCsRxRWutN5UwoeoQ=;
 b=JS05VUbdXCb2vE/Df2H2tmvCQg0xPu00xtd1dFM6nybozLMpF10Ffn87plGDDoLs9a
 07mcVsORaWKjjbHEl0dg0qMToISbz24ywLH9drAs9Btv/gzplx9h0OL/ObOME9pvi7pp
 Exzzfkbgrh0DisQlvrtoGh+nRJSDoYaAncIOVwg/0FoDHVzVcOXji0DGVSZZaGTeOBUt
 iY95+Om1JHo1jM34GmHRIxNh3p9VJL0Er86cjHGmiVeO02WZEPPPdZxtxtr225iUDCNM
 9anPDhYr8nYoq3Af0iZTMGtgLya3jS2DTOtNsgwDVLa1vuOuG4pkkvU4orUa4C3tco+E
 jKyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=4BT5zSfL/LUdbZdT7j6ucUNjI5aCsRxRWutN5UwoeoQ=;
 b=Lnxp89leGYpNylSBf/sEtUyw+VyA2ERmtS+z+Hij7d+5TUhEp9Z3NKkLjOgf9AgZJ+
 iYxBJdfp8vvEu02R12A4YS6N9eBAsBkRheFAq+mmTQ3VaYIXzwZA53nHpLH7/NlQ7266
 ew2iq7DKUjluqe96bO7lembubd3oQ66PMVVCDNOfLA1BcazKdkj7EhePoE8KSdOQJX8R
 hC3gvqMCakTBqbQOn1s3W+UzH07HgxMKc4LyEun9tF+t3GeMnqrdr2tLpTjBDEhLWb/E
 /8KPYbLoTF9q6D6nKk8grBbyPBmzzRxzypeETLwADa9HyakwfFVA8FAg/8yrY0kXAsyl
 p1jg==
X-Gm-Message-State: AOAM5336PubLKxMOGyIiRM1PAQ4vHcC7UUSY2YE95a9VpfGl/mCXE0gg
 8DC0vp+wenNe2WlWCu9dpgoosLiNcoNCp5qmtnE=
X-Google-Smtp-Source: ABdhPJzK4bwK3dCrdFYmwJN+bnta2+FkZk2rCib3ASiiaOzTq7TLIxCQxhMawtWlr6zLbgjFMrbjQeBRlYpzxMTlWwI=
X-Received: by 2002:a17:907:9493:: with SMTP id
 dm19mr26834530ejc.161.1640917216039; 
 Thu, 30 Dec 2021 18:20:16 -0800 (PST)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 31 Dec 2021 12:20:04 +1000
Message-ID: <CAPM=9tyK28tROtoYmE-Li2P5JL92GHcXFcXmWFi+z1m1AU6yqw@mail.gmail.com>
Subject: [git pull] drm fixes for 5.16-rc8
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
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

Hi Linus (and misc maintainers),

This is a bit bigger than I'd like, however it has two weeks of amdgpu
fixes in it, since they missed last week, which was very small.

The nouveau regression is probably the biggest fix in here, and it
needs to go into 5.15 as well, two i915 fixes, and then a scattering
of amdgpu fixes. The biggest fix in there is for a fencing NULL
pointer dereference, the rest are pretty minor.

For the misc team, I've pulled the two misc fixes manually since I'm
not sure what is happening at this time of year!

The amdgpu maintainers have the outstanding runpm regression to fix
still, they are just working through the last bits of it now.

Happy New Year in advance!
Dave.

drm-fixes-2021-12-31:
drm fixes for 5.16-rc8

nouveau:
- fencing regression fix

i915:
- Fix possible uninitialized variable
- Fix composite fence seqno increment on each fence creation

amdgpu:
- Fencing fix
- XGMI fix
- VCN regression fix
- IP discovery regression fixes
- Fix runpm documentation
- Suspend/resume fixes
- Yellow Carp display fixes
- MCLK power management fix
- dma-buf fix
The following changes since commit fc74e0a40e4f9fd0468e34045b0c45bba11dcbb2=
:

  Linux 5.16-rc7 (2021-12-26 13:17:17 -0800)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2021-12-31

for you to fetch changes up to ce9b333c73a5a8707f2f446a837a6ca743ddcffd:

  Merge branch 'drm-misc-fixes' of
ssh://git.freedesktop.org/git/drm/drm-misc into drm-fixes (2021-12-31
11:40:29 +1000)

----------------------------------------------------------------
drm fixes for 5.16-rc8

nouveau:
- fencing regression fix

i915:
- Fix possible uninitialized variable
- Fix composite fence seqno icrement on each fence creation

amdgpu:
- Fencing fix
- XGMI fix
- VCN regression fix
- IP discovery regression fixes
- Fix runpm documentation
- Suspend/resume fixes
- Yellow Carp display fixes
- MCLK power management fix
- dma-buf fix

----------------------------------------------------------------
Alex Deucher (4):
      drm/amdgpu: add support for IP discovery gc_info table v2
      drm/amdgpu: fix runpm documentation
      drm/amdgpu: always reset the asic in suspend (v2)
      drm/amdgpu: no DC support for headless chips

Angus Wang (1):
      drm/amd/display: Changed pipe split policy to allow for
multi-display pipe split

Charlene Liu (1):
      drm/amd/display: fix B0 TMDS deepcolor no dislay issue

Christian K=C3=B6nig (2):
      drm/amdgpu: fix dropped backing store handling in
amdgpu_dma_buf_move_notify
      drm/nouveau: wait for the exclusive fence after the shared ones v2

Dave Airlie (3):
      Merge tag 'drm-intel-fixes-2021-12-29' of
git://anongit.freedesktop.org/drm/drm-intel into drm-fixes
      Merge tag 'amd-drm-fixes-5.16-2021-12-29' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes
      Merge branch 'drm-misc-fixes' of
ssh://git.freedesktop.org/git/drm/drm-misc into drm-fixes

Evan Quan (1):
      drm/amdgpu: put SMU into proper state on runpm suspending for
BOCO capable platform

Huang Rui (1):
      drm/amdgpu: introduce new amdgpu_fence object to indicate the
job embedded fence

Lai, Derek (1):
      drm/amd/display: Added power down for DCN10

Lijo Lazar (1):
      drm/amd/pm: Fix xgmi link control on aldebaran

Matthew Brost (2):
      drm/i915: Fix possible uninitialized variable in parallel extension
      drm/i915: Increment composite fence seqno

Nicholas Kazlauskas (3):
      drm/amd/display: Send s0i2_rdy in stream_count =3D=3D 0 optimization
      drm/amd/display: Set optimize_pwr_state for DCN31
      drm/amd/display: Fix USB4 null pointer dereference in
update_psp_stream_config

Prike Liang (1):
      drm/amd/pm: skip setting gfx cgpg in the s0ix suspend-resume

chen gong (1):
      drm/amdgpu: When the VCN(1.0) block is suspended, powergating is
explicitly enabled

 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  17 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      |  76 +++++++++----
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c        |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |  27 ++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c          | 126 ++++++++++++++---=
----
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h           |   4 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c              |   7 ++
 .../amd/display/dc/clk_mgr/dcn31/dcn31_clk_mgr.c   |   1 +
 drivers/gpu/drm/amd/display/dc/core/dc_link.c      |   5 +-
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_init.c  |   1 +
 .../gpu/drm/amd/display/dc/dcn20/dcn20_resource.c  |   2 +-
 .../drm/amd/display/dc/dcn201/dcn201_resource.c    |   2 +-
 .../gpu/drm/amd/display/dc/dcn21/dcn21_resource.c  |   2 +-
 .../gpu/drm/amd/display/dc/dcn30/dcn30_resource.c  |   2 +-
 .../drm/amd/display/dc/dcn301/dcn301_resource.c    |   2 +-
 .../drm/amd/display/dc/dcn302/dcn302_resource.c    |   2 +-
 .../drm/amd/display/dc/dcn303/dcn303_resource.c    |   2 +-
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_init.c  |   1 +
 .../gpu/drm/amd/display/dc/dcn31/dcn31_resource.c  |  27 ++++-
 .../gpu/drm/amd/display/dc/dcn31/dcn31_resource.h  |  31 +++++
 drivers/gpu/drm/amd/include/discovery.h            |  49 ++++++++
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |   7 +-
 drivers/gpu/drm/amd/pm/swsmu/smu12/smu_v12_0.c     |   3 +-
 drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c |   2 +-
 drivers/gpu/drm/i915/gem/i915_gem_context.c        |   2 +-
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c     |   2 +-
 drivers/gpu/drm/nouveau/nouveau_fence.c            |  28 ++---
 27 files changed, 318 insertions(+), 114 deletions(-)
