Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C35386B1A7
	for <lists+dri-devel@lfdr.de>; Wed, 28 Feb 2024 15:22:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9077D10E88B;
	Wed, 28 Feb 2024 14:22:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nuMY0IFL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE42D10E88B;
 Wed, 28 Feb 2024 14:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709130169; x=1740666169;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Zyy3vOWbN9CNXIJi3DeG6e23eV6FtWhsMR1FozLh5EA=;
 b=nuMY0IFL+7TaKenuWwjmaX08f5vMVa+kHVyiBLWNQIaKw6wuBG7C90Lt
 ygiHSc8QUHkdc6J5vheU7GIiYsVvNg6j/yVDP3PsoACbf72Iur2r3z1iY
 oEPYUfZFeNB+fzJvXNcDtsivoTUScSOB1MH9B9ZjwvWBrCaYWFUNRf32p
 RusROzkXV+2VNny/6bDm2n8feQEzf0N9afQHwbMe4+yE1GIRhPxz7ebSi
 TuwWgUGHm4IbUWNu4YUnOHGn6KOQZ1uCPbiSYzrJ32fJtkfy3/eEzTmuR
 0C6CbdIIMkRwZuWSgjUdQrzDpV+7kPD47blkeMkFUUCm34Ll1qJuzt5ad A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="14948592"
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; d="scan'208";a="14948592"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2024 06:22:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; d="scan'208";a="11989525"
Received: from mcox1-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.233.55])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2024 06:22:47 -0800
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 Dave Airlie <airlied@redhat.com>, Jani Nikula <jani.nikula@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH] MAINTAINERS: Update email address for Tvrtko Ursulin
Date: Wed, 28 Feb 2024 14:22:40 +0000
Message-Id: <20240228142240.2539358-1-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.40.1
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

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

I will lose access to my @.*intel.com e-mail addresses soon so let me
adjust the maintainers entry and update the mailmap too.

While at it consolidate a few other of my old emails to point to the
main one.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Dave Airlie <airlied@redhat.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 .mailmap    | 5 +++++
 MAINTAINERS | 2 +-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/.mailmap b/.mailmap
index b99a238ee3bd..d67e351bce8e 100644
--- a/.mailmap
+++ b/.mailmap
@@ -608,6 +608,11 @@ TripleX Chung <xxx.phy@gmail.com> <triplex@zh-kernel.org>
 TripleX Chung <xxx.phy@gmail.com> <zhongyu@18mail.cn>
 Tsuneo Yoshioka <Tsuneo.Yoshioka@f-secure.com>
 Tudor Ambarus <tudor.ambarus@linaro.org> <tudor.ambarus@microchip.com>
+Tvrtko Ursulin <tursulin@ursulin.net> <tvrtko.ursulin@intel.com>
+Tvrtko Ursulin <tursulin@ursulin.net> <tvrtko.ursulin@linux.intel.com>
+Tvrtko Ursulin <tursulin@ursulin.net> <tvrtko.ursulin@sophos.com>
+Tvrtko Ursulin <tursulin@ursulin.net> <tvrtko.ursulin@onelan.co.uk>
+Tvrtko Ursulin <tursulin@ursulin.net> <tvrtko@ursulin.net>
 Tycho Andersen <tycho@tycho.pizza> <tycho@tycho.ws>
 Tzung-Bi Shih <tzungbi@kernel.org> <tzungbi@google.com>
 Uwe Kleine-König <ukleinek@informatik.uni-freiburg.de>
diff --git a/MAINTAINERS b/MAINTAINERS
index 19f6f8014f94..b940bfe2a692 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10734,7 +10734,7 @@ INTEL DRM I915 DRIVER (Meteor Lake, DG2 and older excluding Poulsbo, Moorestown
 M:	Jani Nikula <jani.nikula@linux.intel.com>
 M:	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
 M:	Rodrigo Vivi <rodrigo.vivi@intel.com>
-M:	Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
+M:	Tvrtko Ursulin <tursulin@ursulin.net>
 L:	intel-gfx@lists.freedesktop.org
 S:	Supported
 W:	https://drm.pages.freedesktop.org/intel-docs/
-- 
2.40.1

