Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A70EC18C58C
	for <lists+dri-devel@lfdr.de>; Fri, 20 Mar 2020 04:02:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25BF36E0FE;
	Fri, 20 Mar 2020 03:01:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B89896E0FE
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Mar 2020 03:01:56 +0000 (UTC)
Received: by mail-ot1-x32a.google.com with SMTP id s15so4675284otq.8
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Mar 2020 20:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=zToM2vZiFh64aleo6394lnbX3TeWMRdOKkO6etfhVds=;
 b=cfbFfGjBXFilHfvDx5MaOK8ILLQvH6ri8ltNka6974ET78ztmk4G50vewjbBTReVSw
 bjSr/cCbhKRg66LwqMQnhNJzhlqa4knWfXRkAvkUywLmdsr8MWNXLX755Zs90Q2LCnLB
 BnIPC70hu7iBvMzk0+LUOYWNh5IJnJEUy9y9cqPV1G2rSsVB8ARLSHn5e7J//Sm2Kggt
 zqbzi/6HDeqy571TyCZPpysS8uTJnQCtK/vP3lhMlCSt7C5fIlGgMyuU+cyM8AE0NKoS
 03NUxUkqC3iAM4+PmYEYxK0aS5E2SVXzFd3X7o4KFCMhnlCQWF7eQc+jnsltX69dF0Zj
 xk+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=zToM2vZiFh64aleo6394lnbX3TeWMRdOKkO6etfhVds=;
 b=EZYFm1LMJFA293xXCfwfmVSC40z7b4lNr3qAqrDT6U1bFYxdfJtzzvR10P895cBGlu
 PbfPRYDQXd9lEPReQj+0b/UeTAfQ4SLI7RjLvYjGymvTW1g908zO5lc8j5akR8UkYaCV
 Ca1b9t0NgCcJJFc8M8tba0/MQsuKfNa2x3boa9zLdPApFQjJd/LJg1HzmQL2vU36cAmY
 gckHTu5usrMJiugXATrXfn8uo00NxwyHVGYQDRIZZPESG20NwJ6sMS+7qjWO4vXvAGl/
 5Pg+aLsvuSMeEsnRbvxDXia/RmunpWdliVl+MSeLGy/4maXaTm8t5BdLZ8P3dkK1unsn
 fMfA==
X-Gm-Message-State: ANhLgQ3R27ibVW2hSjSXZXRdyLt54pbOzaCyjgSw0VOLeCN1BnGixqP6
 MCijiIdTtwOHxOhiwPv+U4lUUcQ4Ayvz9j3OaCU=
X-Google-Smtp-Source: ADFU+vtJOhKJRoTSjcdyhpwBn4Bwdn+X9RGuEWNi/V6/4R09ipu1RBg5d2wWp/on7zCFup4kQw3qd+NqXZM4sDZmerI=
X-Received: by 2002:a9d:6c58:: with SMTP id g24mr4889943otq.106.1584673315609; 
 Thu, 19 Mar 2020 20:01:55 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 20 Mar 2020 13:01:44 +1000
Message-ID: <CAPM=9tziNvC7VozK1C3yd+wqspVGF7d0eToOANwV4Euwy4LMkQ@mail.gmail.com>
Subject: [git pull drm fixes for 5.6-rc7
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey Linus,

Hope you are well hiding out above the garage, a few amdgpu changes
but nothing too major. I've had a wisdom tooth out this week so
haven't been to on top of things, but all seems good.

Dave.

drm-fixes-2020-03-20:
drm fixes for 5.6-rc7

core:
- fix lease warning

i915:
- Track active elements during dequeue
- Fix failure to handle all MCR ranges
- Revert unnecessary workaround

amdgpu:
- Pageflip fix
- VCN clockgating fixes
- GPR debugfs fix for umr
- GPU reset fix
- eDP fix for MBP
- DCN2.x fix

dw-hdmi:
- fix AVI frame colorimetry

komeda:
- fix compiler warning

bochs:
- downgrade a binding failure to a warning
The following changes since commit fb33c6510d5595144d585aa194d377cf74d31911:

  Linux 5.6-rc6 (2020-03-15 15:01:23 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2020-03-20

for you to fetch changes up to 5366b96b1997745d903c697a32e0ed27b66fd158:

  Merge tag 'drm-intel-fixes-2020-03-19' of
git://anongit.freedesktop.org/drm/drm-intel into drm-fixes (2020-03-20
12:52:35 +1000)

----------------------------------------------------------------
drm fixes for 5.6-rc7

core:
- fix lease warning

i915:
- Track active elements during dequeue
- Fix failure to handle all MCR ranges
- Revert unnecessary workaround

amdgpu:
- Pageflip fix
- VCN clockgating fixes
- GPR debugfs fix for umr
- GPU reset fix
- eDP fix for MBP
- DCN2.x fix

dw-hdmi:
- fix AVI frame colorimetry

komeda:
- fix compiler warning

bochs:
- downgrade a binding failure to a warning

----------------------------------------------------------------
Arnd Bergmann (1):
      drm/komeda: mark PM functions as __maybe_unused

Caz Yokoyama (1):
      Revert "drm/i915/tgl: Add extra hdc flush workaround"

Chris Wilson (1):
      drm/i915/execlists: Track active elements during dequeue

Dave Airlie (3):
      Merge tag 'drm-misc-fixes-2020-03-18-1' of
git://anongit.freedesktop.org/drm/drm-misc into drm-fixes
      Merge tag 'amd-drm-fixes-5.6-2020-03-19' of
git://people.freedesktop.org/~agd5f/linux into drm-fixes
      Merge tag 'drm-intel-fixes-2020-03-19' of
git://anongit.freedesktop.org/drm/drm-intel into drm-fixes

Evan Quan (1):
      drm/amdgpu: add fbdev suspend/resume on gpu reset

Gerd Hoffmann (1):
      drm/bochs: downgrade pci_request_region failure from error to warning

James Zhu (3):
      drm/amdgpu: fix typo for vcn1 idle check
      drm/amdgpu: fix typo for vcn2/jpeg2 idle check
      drm/amdgpu: fix typo for vcn2.5/jpeg2.5 idle check

Jernej Skrabec (1):
      drm/bridge: dw-hdmi: fix AVI frame colorimetry

Mario Kleiner (2):
      drm/amd/display: Add link_rate quirk for Apple 15" MBP 2017
      drm/amd/display: Fix pageflip event race condition for DCN.

Matt Roper (1):
      drm/i915: Handle all MCR ranges

Qiujun Huang (1):
      drm/lease: fix WARNING in idr_destroy

Stanley.Yang (1):
      drm/amd/display: fix typos for dcn20_funcs and dcn21_funcs struct

Tom St Denis (1):
      drm/amd/amdgpu: Fix GPR read from debugfs (v2)

 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c       |  6 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c        |  4 ++
 drivers/gpu/drm/amd/amdgpu/jpeg_v2_0.c            |  2 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c            |  2 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c             |  2 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c             |  2 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c             |  2 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 18 ++++++--
 drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c  | 11 +++++
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_init.c |  1 -
 drivers/gpu/drm/amd/display/dc/dcn21/dcn21_init.c |  1 -
 drivers/gpu/drm/arm/display/komeda/komeda_drv.c   |  4 +-
 drivers/gpu/drm/bochs/bochs_hw.c                  |  6 +--
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c         | 46 +++++++++++---------
 drivers/gpu/drm/drm_lease.c                       |  3 +-
 drivers/gpu/drm/i915/gt/intel_lrc.c               | 52 ++++++-----------------
 drivers/gpu/drm/i915/gt/intel_workarounds.c       | 25 +++++++++--
 17 files changed, 104 insertions(+), 83 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
