Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A8A6E0D44
	for <lists+dri-devel@lfdr.de>; Thu, 13 Apr 2023 14:12:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D36810E147;
	Thu, 13 Apr 2023 12:12:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D463310E147;
 Thu, 13 Apr 2023 12:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681387952; x=1712923952;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=UtybjZXL5xPLxx93PLDjbsXu1oO8sSyCoUCcTNgXdqU=;
 b=OQlLUhtD/UNP+IO7Y8UR521lw6M4BY1PYBX5nGY+H6VpcoV5AOr/8LW6
 /NJH/Q0LRDfVtWbt7sgdvnU+fAyzh+JH2/XdArcasK1DxvkG+y10+/HNg
 SiOqkMHDOxDzP3xS4HoBfVDJe2DlvDKL8pZa4kDtNhqATkFvPZgim7D4i
 AIpoHPNmrRGin6Oo/40o/1blP7fUqDspQmwmPl7sYm/r/mQ3LP9sOyC6y
 3lIPuKhWGhkB7mJa8l+byyi/3ovUW09kLBAwhZp3nGDv27x/x4i4JhguA
 9CZE0OhGUBRNxA8wW6PstekC8iyDdFTXGIGW3qzvQ1rFE2x94MegDRlZd g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="346850791"
X-IronPort-AV: E=Sophos;i="5.99,341,1677571200"; d="scan'208";a="346850791"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2023 05:12:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="863752301"
X-IronPort-AV: E=Sophos;i="5.99,341,1677571200"; d="scan'208";a="863752301"
Received: from vmabille-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.29.244])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2023 05:12:22 -0700
Date: Thu, 13 Apr 2023 15:12:19 +0300
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-next-fixes
Message-ID: <ZDfxo+PXyw9ivFLI@jlahtine-mobl.ger.corp.intel.com>
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

Just one Cc:stable fix for indirect sampler state this week on
drm-intel-next-fixes.

Regards, Joonas

***

drm-intel-next-fixes-2023-04-13:

Short summary of fixes pull (less than what git shortlog provides):

Just one Cc:stable fix for sampler indirect state in bindless heap.

The following changes since commit 55bf14961db9da61220e6f04bc9919c94b1a6585:

  Merge tag 'mediatek-drm-next-6.4' of https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux into drm-next (2023-04-11 12:28:10 +0200)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-next-fixes-2023-04-13

for you to fetch changes up to 81900e3a37750d8c6ad705045310e002f6dd0356:

  drm/i915: disable sampler indirect state in bindless heap (2023-04-12 11:36:09 +0300)

----------------------------------------------------------------
Short summary of fixes pull (less than what git shortlog provides):

Just one Cc:stable fix for sampler indirect state in bindless heap.

----------------------------------------------------------------
Lionel Landwerlin (1):
      drm/i915: disable sampler indirect state in bindless heap

 drivers/gpu/drm/i915/gt/intel_gt_regs.h     |  1 +
 drivers/gpu/drm/i915/gt/intel_workarounds.c | 19 +++++++++++++++++++
 2 files changed, 20 insertions(+)
