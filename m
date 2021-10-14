Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A45D42D5B0
	for <lists+dri-devel@lfdr.de>; Thu, 14 Oct 2021 11:09:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84A996EC33;
	Thu, 14 Oct 2021 09:09:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBE466EC33;
 Thu, 14 Oct 2021 09:09:46 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10136"; a="214798518"
X-IronPort-AV: E=Sophos;i="5.85,372,1624345200"; d="scan'208";a="214798518"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2021 02:09:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,372,1624345200"; d="scan'208";a="524991129"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by orsmga001.jf.intel.com with SMTP; 14 Oct 2021 02:09:42 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 14 Oct 2021 12:09:41 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Dave Airlie <airlied@redhat.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: [PATCH 0/4] drm/i915: Make the driver not oops on load on old machines
Date: Thu, 14 Oct 2021 12:09:37 +0300
Message-Id: <20211014090941.12159-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Fix a pile of regression on older machines which just oops the driver
on load.

Cc: Dave Airlie <airlied@redhat.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>

Ville Syrjälä (4):
  drm/i915: Replace the unconditional clflush with
    drm_clflush_virt_range()
  drm/i915: Convert unconditional clflush to drm_clflush_virt_range()
  drm/i915: Catch yet another unconditioal clflush
  drm/i915: Fix oops on platforms w/o hpd support

 drivers/gpu/drm/i915/display/intel_hotplug.c    | 3 ++-
 drivers/gpu/drm/i915/gt/intel_ring_submission.c | 2 +-
 drivers/gpu/drm/i915/gt/intel_timeline.c        | 4 ++--
 3 files changed, 5 insertions(+), 4 deletions(-)

-- 
2.32.0

