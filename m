Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 844BB1F63C5
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jun 2020 10:39:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B74E16E049;
	Thu, 11 Jun 2020 08:39:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F91A6E049
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jun 2020 08:39:06 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id g1so3333410edv.6
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jun 2020 01:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=Jt69eBlMhftqx8Dq8Pz0jiYvo6ytNHDe7koTS1ms+pI=;
 b=nxZFLhkwo4sP6AWmBPZkr63bEC/8MW8U75TZkOCxIbVTBfNFPL0mk8kcjT7xUE6UBy
 y94lUvzzH62bHqnDjdusHnfc7CyvOJSxNP0y0if/fXKu+k1bNmdTcYHazpVa0oGmcg28
 2J2XH21D2zf/+kftXNVG0JkUPk6rBGFSNpsK78Yu4UAFoNCVCS7Jp7VH3VcclFRNsjUF
 9RRo2ReLqKfa8zpVZtgVQaWU6C5BmS3kCJjKbNY07DM7ZI1oDr9tepK0FrKX7QWimZcn
 gWpioeCD44VEcYOS5NNDdlLJPPLBsjO9gsSj0QICd420olLKzzUk9fyUEG0UseLxfiST
 RyZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=Jt69eBlMhftqx8Dq8Pz0jiYvo6ytNHDe7koTS1ms+pI=;
 b=JrARbyuv7SbEALs2rf1SR+we0qFOaz3koVlRTEtYBRIPPB69IeJwWL+UnaK6RXTbI9
 hhRDcaU5/boSoVCHf5n/BFwiPB3p7BOD47Hx1okds2LS5MGVZBSF87+kyNWQ1oiQfimO
 bOKX7G7A58gwjguxoRrIv7OeRgqwFFmilWrdIn59L3fPPCQq7x8n2Dp1u6Vhnd4/MVUF
 p+ZUF9dWT6QCs8PKdUG4lGtNoSqj2DTga/5l31wREYSKc3uO7rIfqvTRO9lHhb/insjs
 Ql/pANMFBCAezh9BFnG970BeNVgC7YrmWhm0klv4XCtvssCEOYl0hlOJdKU8q8Nea5Wv
 gGWw==
X-Gm-Message-State: AOAM533LdM77n9F7vujyRfxIonjKSeaa/+y+DkPGrS5+l53sMghsa1QR
 9pOPU+M6STll5AeTJrZIz8WEnQOdeWBN573IdVE=
X-Google-Smtp-Source: ABdhPJy5hJspyiNYrlGvO+ocRla/Mn05EuhoMs0ELNp6CGUyPq7wCaBaKd7//pzT+bDbrBQIE44nDtC9AJYM1apPoXQ=
X-Received: by 2002:a05:6402:1481:: with SMTP id
 e1mr6060527edv.113.1591864745013; 
 Thu, 11 Jun 2020 01:39:05 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 11 Jun 2020 18:38:54 +1000
Message-ID: <CAPM=9tyM72CtJbA4Q9wKnft6oQoMLGEt=xCYBcPn9wK9F=+Uwg@mail.gmail.com>
Subject: [git pull] drm fixes for 5.7-rc1 (updated pull)
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

Hi Linus,

This is the update of the pull I sent earlier today, it's got a couple
of more fixes along with the i915 fixes. One sun4i fix and a connector
hotplug race The ast fix is for a regression in 5.6, and as mentioned
previously one of the i915 ones fixes an oops reported by dhowells.

definitely taking tomorrow off now :-)

Regards,
Dave.

drm-next-2020-06-11-1:
drm fixes for 5.7-rc1

core:
- fix race in connectors sending hotplug

i915:
- Avoid use after free in cmdparser
- Avoid NULL dereference when probing all display encoders
- Fixup to module parameter type

sun4i:
- clock divider fix

ast:
- 24/32 bpp mode setting fix
The following changes since commit 8d286e2ff4400d313955b4203fc640ca6fd9228b:

  Merge tag 'drm-intel-next-fixes-2020-06-04' of
git://anongit.freedesktop.org/drm/drm-intel into drm-next (2020-06-08
11:59:57 +1000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-next-2020-06-11-1

for you to fetch changes up to 66057dd1d1cf2149e0f5fdaee58d6ea69bc98048:

  Merge tag 'drm-misc-next-fixes-2020-06-11' of
git://anongit.freedesktop.org/drm/drm-misc into drm-next (2020-06-11
17:51:15 +1000)

----------------------------------------------------------------
drm fixes for 5.7-rc1

core:
- fix race in connectors sending hotplug

i915:
- Avoid use after free in cmdparser
- Avoid NULL dereference when probing all display encoders
- Fixup to module parameter type

sun4i:
- clock divider fix

ast:
- 24/32 bpp mode setting fix

----------------------------------------------------------------
Chris Wilson (2):
      drm/i915/gem: Mark the buffer pool as active for the cmdparser
      drm/i915/display: Only query DP state of a DDI encoder

Colin Ian King (1):
      drm/ast: fix missing break in switch statement for format->cpp[0] case 4

Dave Airlie (2):
      Merge tag 'drm-intel-next-fixes-2020-06-10' of
git://anongit.freedesktop.org/drm/drm-intel into drm-next
      Merge tag 'drm-misc-next-fixes-2020-06-11' of
git://anongit.freedesktop.org/drm/drm-misc into drm-next

Jani Nikula (1):
      drm/i915/params: fix i915.reset module param type

Jernej Skrabec (1):
      drm/sun4i: hdmi ddc clk: Fix size of m divider

Jeykumar Sankaran (1):
      drm/connector: notify userspace on hotplug after register complete

 drivers/gpu/drm/ast/ast_mode.c                 |  1 +
 drivers/gpu/drm/drm_connector.c                |  5 +++
 drivers/gpu/drm/drm_sysfs.c                    |  3 --
 drivers/gpu/drm/i915/display/intel_dp.c        |  3 ++
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c | 56 ++++++++++++++++++++++----
 drivers/gpu/drm/i915/i915_params.c             |  2 +-
 drivers/gpu/drm/sun4i/sun4i_hdmi.h             |  2 +-
 drivers/gpu/drm/sun4i/sun4i_hdmi_ddc_clk.c     |  2 +-
 8 files changed, 60 insertions(+), 14 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
