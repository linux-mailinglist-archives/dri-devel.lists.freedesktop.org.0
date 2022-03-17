Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3DAF4DC06E
	for <lists+dri-devel@lfdr.de>; Thu, 17 Mar 2022 08:47:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 654E710EE57;
	Thu, 17 Mar 2022 07:47:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B99B110EE57;
 Thu, 17 Mar 2022 07:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647503273; x=1679039273;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=+n8NXWIe0jCqItnph5NMnymFrmcWNbD40tr138F262M=;
 b=XOYjk5fX+NfDkP5JPDqkb2v1PNLNxwuzZfFPGxlc77yV67/rVhCkVK98
 SX/aDfUE+NGbXVjPJQB0L77XCJTA4VjQmffjrBUtKbQJHhvqyyS7wA05W
 jJvEb1UQeH/Wcm7MearjwWFPSPJJki2m3fDuLDxkABOZkMuVyfqiTfAqb
 vm5Odiai/sfia8luDKT8SQd6D0x36xWLWX5ax9uKF/qQWtI8orxrxzEox
 loFJltaXVnLDu/1wAuF38TN9KowQCFG8DzU7icMrP0pw2YAMW0TWkrThn
 jXlwUEuSrNwqbpabshbaH1KpywVkHOxpeHBKT5cHcxVYFNqaHxXEVItOt A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10288"; a="256996290"
X-IronPort-AV: E=Sophos;i="5.90,188,1643702400"; d="scan'208";a="256996290"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2022 00:47:53 -0700
X-IronPort-AV: E=Sophos;i="5.90,188,1643702400"; d="scan'208";a="557821582"
Received: from emalinow-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.32.227])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2022 00:47:48 -0700
Date: Thu, 17 Mar 2022 09:47:45 +0200
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-next-fixes
Message-ID: <YjLnofpe5sMHX7Pt@jlahtine-mobl.ger.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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

Fix for vm_access() out-of-bounds access and PSR not staying disabled
during fastset once determined not reliable.

Then a naming fix to avoid conflicts for potential future fixes.

Regards, Joonas

***

drm-intel-next-fixes-2022-03-17:

- Do not re-enable PSR after it was marked as not reliable (Jose)
- Add missing boundary check in vm_access to avoid out-of-bounds access (Mastan)
- Naming fix for HPD short pulse handling for eDP (Jose)

The following changes since commit 5e7f44b5c2c035fe2e5458193c2bbee56db6a090:

  drm/i915/gtt: reduce overzealous alignment constraints for GGTT (2022-03-09 08:34:55 +0200)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-next-fixes-2022-03-17

for you to fetch changes up to 278da06c03655c2bb9bc36ebdf45b90a079b3bfd:

  drm/i915/display: Do not re-enable PSR after it was marked as not reliable (2022-03-16 08:17:40 +0200)

----------------------------------------------------------------
- Do not re-enable PSR after it was marked as not reliable (Jose)
- Add missing boundary check in vm_access to avoid out-of-bounds access (Mastan)
- Naming fix for HPD short pulse handling for eDP (Jose)

----------------------------------------------------------------
José Roberto de Souza (2):
      drm/i915/display: Fix HPD short pulse handling for eDP
      drm/i915/display: Do not re-enable PSR after it was marked as not reliable

Mastan Katragadda (1):
      drm/i915/gem: add missing boundary check in vm_access

 drivers/gpu/drm/i915/display/intel_dp.c  | 2 +-
 drivers/gpu/drm/i915/display/intel_pps.c | 6 +++---
 drivers/gpu/drm/i915/display/intel_pps.h | 2 +-
 drivers/gpu/drm/i915/display/intel_psr.c | 4 ++++
 drivers/gpu/drm/i915/gem/i915_gem_mman.c | 2 +-
 5 files changed, 10 insertions(+), 6 deletions(-)
