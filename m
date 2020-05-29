Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86A421E7134
	for <lists+dri-devel@lfdr.de>; Fri, 29 May 2020 02:21:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D6F06E258;
	Fri, 29 May 2020 00:21:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28ACD6E258
 for <dri-devel@lists.freedesktop.org>; Fri, 29 May 2020 00:21:26 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id m21so377720eds.13
 for <dri-devel@lists.freedesktop.org>; Thu, 28 May 2020 17:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=4pM5c1cQ3g56121SjZ45rsEvKVQSMwyRfhGxq2A2I20=;
 b=IUbkmIffxEwqCpMwWLh1vmsPQ7VxJcD3qTZG5Ka6UZWTllIoAkYpB74ISHCgk23NWl
 9P+Sz5avR05RP7ETk8tXcR6ruiCLRscFWAm4f/gQGeu8cfe9aZkEnKtQIip1f6dl+UfZ
 VDQ+rXM7LAXWxRbf/4ur+ojXUPwthzE/WPRqXXJU8F9CnfIMElxpTNWhYJnxc43zYEao
 tKXsTRw0md60MgAcId0a1MV14eQMp1QqEOFTtdsQp6+9TXGW2E2Pgit80kCY/rp7Qm7I
 DqkK7p+NwyYn6hqf+83Sd/QzExwTFhQjqO5QRF3NtbomWPFc1wkHbVLz/IxgLHqVDjcV
 oUBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=4pM5c1cQ3g56121SjZ45rsEvKVQSMwyRfhGxq2A2I20=;
 b=NBroUJ+iYHI3fyxxm0f7aW1vdImMxDUYM9Bj+TgzVrTowgy7Sr+uuB9E0gfv7dZleT
 NIuehoI/Z31lqjDQbWZXQ/BzBszpIQguSUJzbB1M5Pm+M4bKIwwO0hMWqnEDNrg5ogCY
 +dg4gx0P2vFr7QOG8WM6wX3Bd9yq9SKoBdOdpaed/BIiY7d12VhrKnfNtuXVpYPoMY8M
 loFbWlo0QtdZbGy2DKfokdpA+ZrnMRrd2eu/uyYkCPzdzZlDNtsdZ68A9wJFievNeHtf
 KEgQt95qPlQWOulI/G0fldkG8kN3XCSSbVkuRy+YMo1nptExZIX9JmGYvaoK7C6XLt+7
 gqeA==
X-Gm-Message-State: AOAM533BOL+/nLcxcY514ogaobqAFcBcghughXh8bPf31u1A8nZH3uHU
 QMnC+kE6RO/iSUQT8FAYH4tLGha9/omyc30jxU8=
X-Google-Smtp-Source: ABdhPJz/E46YBu3Op2fxf9zP7Ifln5J3gZRDb1qfZb962EaMW3NEaM7dW9urbQHxeErnZ6p4gm4h2PbwmVr93qTF1fA=
X-Received: by 2002:a50:9547:: with SMTP id v7mr6158307eda.78.1590711684741;
 Thu, 28 May 2020 17:21:24 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 29 May 2020 10:21:13 +1000
Message-ID: <CAPM=9ty+Vyn8aSxNqWY+_KEnqj8nGZbp2PRJTvQLcV1iPhG7dA@mail.gmail.com>
Subject: [git pull] drm fixes for 5.7-rc8/final
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

Seems to have wound down nicely, a couple of i915 fixes, amdgpu fixes
and minor ingenic fixes.

Should be it until the merge window.

Dave.

drm-fixes-2020-05-29:
drm fixes for 5.7 final

i915:
- gcc 9 compile warning fix
- timeslicing fixes

amdgpu:
- display atomic test fix
- Fix soft hang in display vupdate code

ingenic:
- fix pointer cast
- fix crtc atomic check callback
The following changes since commit 9cb1fd0efd195590b828b9b865421ad345a4a145:

  Linux 5.7-rc7 (2020-05-24 15:32:54 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2020-05-29

for you to fetch changes up to d099f415d50c3980339479f56f124f8bfa6875bc:

  Merge tag 'drm-misc-fixes-2020-05-28' of
git://anongit.freedesktop.org/drm/drm-misc into drm-fixes (2020-05-29
09:25:23 +1000)

----------------------------------------------------------------
drm fixes for 5.7 final

i915:
- gcc 9 compile warning fix
- timeslicing fixes

amdgpu:
- display atomic test fix
- Fix soft hang in display vupdate code

ingenic:
- fix pointer cast
- fix crtc atomic check callback

----------------------------------------------------------------
Aric Cyr (1):
      drm/amd/display: Fix potential integer wraparound resulting in a hang

Arnd Bergmann (2):
      drm/i915/pmu: avoid an maybe-uninitialized warning
      drm/i915: work around false-positive maybe-uninitialized warning

Chris Wilson (2):
      drm/i915/gt: Incorporate the virtual engine into timeslicing
      drm/i915/gt: Prevent timeslicing into unpreemptable requests

Dave Airlie (3):
      Merge tag 'amd-drm-fixes-5.7-2020-05-27' of
git://people.freedesktop.org/~agd5f/linux into drm-fixes
      Merge tag 'drm-intel-fixes-2020-05-28' of
git://anongit.freedesktop.org/drm/drm-intel into drm-fixes
      Merge tag 'drm-misc-fixes-2020-05-28' of
git://anongit.freedesktop.org/drm/drm-misc into drm-fixes

Paul Cercueil (2):
      gpu/drm: ingenic: Fix bogus crtc_atomic_check callback
      gpu/drm: Ingenic: Fix opaque pointer casted to wrong type

Simon Ser (1):
      drm/amd/display: drop cursor position check in atomic test

 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |   7 --
 .../drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c  |   2 +
 drivers/gpu/drm/i915/gt/intel_lrc.c                |  31 ++++--
 drivers/gpu/drm/i915/gt/selftest_lrc.c             | 118 ++++++++++++++++++++-
 drivers/gpu/drm/i915/gt/selftest_workarounds.c     |   2 +
 drivers/gpu/drm/i915/i915_pmu.c                    |  84 +++++++--------
 drivers/gpu/drm/i915/i915_priolist_types.h         |   2 +-
 drivers/gpu/drm/ingenic/ingenic-drm.c              |   6 +-
 8 files changed, 192 insertions(+), 60 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
