Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB5B41469B1
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jan 2020 14:50:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE2656FCC3;
	Thu, 23 Jan 2020 13:50:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E61E46FCC2;
 Thu, 23 Jan 2020 13:50:52 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Jan 2020 05:50:51 -0800
X-IronPort-AV: E=Sophos;i="5.70,354,1574150400"; d="scan'208";a="229835029"
Received: from jlahtine-desk.ger.corp.intel.com (HELO localhost)
 ([10.252.22.21])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Jan 2020 05:50:48 -0800
Date: Thu, 23 Jan 2020 15:50:45 +0200
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-fixes
Message-ID: <20200123135045.GA12584@jlahtine-desk.ger.corp.intel.com>
MIME-Version: 1.0
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
Cc: dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave & Daniel,

Last pull request for 5.5. Then it's Jani's turn
to handle 5.6.

A fix for huge userptr objects and a fix that is
also cc stable, to correctly handle negative values
in engine->uabi_class/instance.

Regards, Joonas

***

drm-intel-fixes-2020-01-23:

- Avoid overflow with huge userptr objects
- uAPI fix to correctly handle negative values in
  engine->uabi_class/instance (cc: stable)

The following changes since commit def9d2780727cec3313ed3522d0123158d87224d:

  Linux 5.5-rc7 (2020-01-19 16:02:49 -0800)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-fixes-2020-01-23

for you to fetch changes up to 5eec71829ad7749a8c918f66a91a9bcf6fb4462a:

  drm/i915: Align engine->uabi_class/instance with i915_drm.h (2020-01-21 09:25:20 +0200)

----------------------------------------------------------------
- Avoid overflow with huge userptr objects
- uAPI fix to correctly handle negative values in
  engine->uabi_class/instance (cc: stable)

----------------------------------------------------------------
Matthew Auld (1):
      drm/i915/userptr: fix size calculation

Tvrtko Ursulin (1):
      drm/i915: Align engine->uabi_class/instance with i915_drm.h

 drivers/gpu/drm/i915/gem/i915_gem_busy.c     | 12 ++++++------
 drivers/gpu/drm/i915/gem/i915_gem_userptr.c  |  9 +++++----
 drivers/gpu/drm/i915/gt/intel_engine_types.h |  4 ++--
 drivers/gpu/drm/i915/i915_gem_gtt.c          |  2 ++
 4 files changed, 15 insertions(+), 12 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
