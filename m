Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15BAB5F57E8
	for <lists+dri-devel@lfdr.de>; Wed,  5 Oct 2022 18:00:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2120010E6BE;
	Wed,  5 Oct 2022 16:00:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89AED10E6BC;
 Wed,  5 Oct 2022 15:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664985597; x=1696521597;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/SEmjhX5hmHIax7DJj7QjBoHtl/nJmxvQGqhOiwZblI=;
 b=G6ZS+zr6PzGqNrFv/LKA7F/0z7JN1+5y+oH812irUyBemAjJTV1CrcYt
 HTvOSRdVSegEqb53/ml+mxB1uYhBWVh4it4viOGidgAGwFY5hxReKYZ1E
 4QXci9wHM9n7pzcDddA5y9NsZKCmKHg0X2wLEghcYMV5fZmBfpslOuQkq
 /8Wh+O/DLwZQ0DNJHReWc4k2BzJP7MOaUB9htG39DpeBbPv54HitPVnk6
 6CbKE4oiDzmh6xutRavLT2t2WM9vS2Yyv6EzcBbBZwiO8EzVy08UMUkKw
 qCvBvtZ337J4ZDYufTO4wjxRuQl6hrBL6+MJukhg/6GC2Jiagjf93Dn2k w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10491"; a="304177343"
X-IronPort-AV: E=Sophos;i="5.95,161,1661842800"; d="scan'208";a="304177343"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2022 08:59:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10491"; a="657549953"
X-IronPort-AV: E=Sophos;i="5.95,161,1661842800"; d="scan'208";a="657549953"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.27.27])
 by orsmga001.jf.intel.com with ESMTP; 05 Oct 2022 08:59:56 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v3 0/2] drm/i915/slpc: Update frequency debugfs for SLPC
Date: Wed,  5 Oct 2022 08:59:41 -0700
Message-Id: <20221005155943.34747-1-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
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
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove the RPS related information that is not valid when
SLPC is enabled.

v2: Add version numbers and address other comments (Jani)
v3: Fix compile warning

Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

Vinay Belgaumkar (2):
  drm/i915: Add a wrapper for frequency debugfs
  drm/i915/slpc: Update the frequency debugfs

 drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c | 157 +------------
 drivers/gpu/drm/i915/gt/intel_rps.c           | 207 ++++++++++++++++++
 drivers/gpu/drm/i915/gt/intel_rps.h           |   3 +
 3 files changed, 211 insertions(+), 156 deletions(-)

-- 
2.35.1

