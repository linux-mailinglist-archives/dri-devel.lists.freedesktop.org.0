Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 99C284FEEDB
	for <lists+dri-devel@lfdr.de>; Wed, 13 Apr 2022 07:58:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA84510FF3C;
	Wed, 13 Apr 2022 05:58:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFA2610F624;
 Wed, 13 Apr 2022 05:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649829520; x=1681365520;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=OnS94qWStTxRDGZV5Q3wGKzF0japkoQuNAZuOhR4EzQ=;
 b=ZDKO+s0A5albkc2Ze2qOBGYuhHkmRhXN67LHaXXi0a0IN1F3CYFiFc6E
 Dh2XO8Zbv4f9tXNh90rUEnbx4X6OAYgQ5DTc4avQKFvdHTC+5HSdlStY2
 dYyMnWCBLvIns7UWGtj51+VhNp/2qcUyS9KBst2hYjSZRVaBjw3ot1dlV
 ozcNdtXg6wYGLQPmm0078L+tNEmoZ5epjYf9f77J/3i/D5RdfjYasYb5P
 clVUjC4au3p2iQUXwU4kO7teNvYs6k2vnJRBvvi3D78i+zqzTplnmGL6s
 tggT4JxjqL6H1jVLm/gG4XUd4+Tzm4fqFT/rkZJS887l8lUB30uAS9QF0 g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10315"; a="244468925"
X-IronPort-AV: E=Sophos;i="5.90,255,1643702400"; d="scan'208";a="244468925"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2022 22:58:39 -0700
X-IronPort-AV: E=Sophos;i="5.90,255,1643702400"; d="scan'208";a="573125478"
Received: from ebruchet-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.45.44])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2022 22:58:36 -0700
Date: Wed, 13 Apr 2022 08:58:33 +0300
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-fixes
Message-ID: <YlZma8iA20iakK62@jlahtine-mobl.ger.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave & Daniel,

Just one fix towards v5.18-rc3.

Fix to align code with drm-tip to make sure full graphics IP version
is used for legacy mmap disable check.

Regards, Joonas

***

drm-intel-fixes-2022-04-13:

- Correct legacy mmap disabling to use GRAPHICS_VER_FULL

The following changes since commit ce522ba9ef7e2d9fb22a39eb3371c0c64e2a433e:

  Linux 5.18-rc2 (2022-04-10 14:21:36 -1000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-fixes-2022-04-13

for you to fetch changes up to 1acb34e7dd7720a1fff00cbd4d000ec3219dc9d6:

  drm/i915: Sunset igpu legacy mmap support based on GRAPHICS_VER_FULL (2022-04-11 09:11:21 +0300)

----------------------------------------------------------------
- Correct legacy mmap disabling to use GRAPHICS_VER_FULL

----------------------------------------------------------------
Matt Roper (1):
      drm/i915: Sunset igpu legacy mmap support based on GRAPHICS_VER_FULL

 drivers/gpu/drm/i915/gem/i915_gem_mman.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
