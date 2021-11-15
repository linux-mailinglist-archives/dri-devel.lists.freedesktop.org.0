Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E45E450284
	for <lists+dri-devel@lfdr.de>; Mon, 15 Nov 2021 11:26:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91F216E927;
	Mon, 15 Nov 2021 10:26:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D5AC6E8E2;
 Mon, 15 Nov 2021 10:26:28 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10168"; a="296845732"
X-IronPort-AV: E=Sophos;i="5.87,236,1631602800"; d="scan'208";a="296845732"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2021 02:26:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,236,1631602800"; d="scan'208";a="592053757"
Received: from tilak-nuc8i7beh.iind.intel.com ([10.145.162.9])
 by fmsmga002.fm.intel.com with ESMTP; 15 Nov 2021 02:26:24 -0800
From: Tilak Tangudu <tilak.tangudu@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/1] drm/i915/rpm: Enable runtime pm autosuspend by default
Date: Mon, 15 Nov 2021 15:56:09 +0530
Message-Id: <20211115102610.3141720-1-tilak.tangudu@intel.com>
X-Mailer: git-send-email 2.25.1
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
Cc: tilak.tangudu@intel.com, ville.syrjala@intel.com, anshuman.gupta@intel.com,
 jon.ewins@intel.com, badal.nilawar@intel.com, rodrigo.vivi@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Enable runtime pm autosuspend by default for all
platforms

Signed-off-by: Tilak Tangudu <tilak.tangudu@intel.com>

Tilak Tangudu (1):
  drm/i915/rpm: Enable runtime pm autosuspend by default

 drivers/gpu/drm/i915/intel_runtime_pm.c | 3 +++
 1 file changed, 3 insertions(+)

-- 
2.25.1

