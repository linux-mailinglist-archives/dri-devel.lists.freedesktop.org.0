Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F2EB44BB3D
	for <lists+dri-devel@lfdr.de>; Wed, 10 Nov 2021 06:29:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B7186E835;
	Wed, 10 Nov 2021 05:29:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92ABC6E7E5;
 Wed, 10 Nov 2021 05:29:31 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10163"; a="219502374"
X-IronPort-AV: E=Sophos;i="5.87,222,1631602800"; d="scan'208";a="219502374"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2021 21:29:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,222,1631602800"; d="scan'208";a="503820677"
Received: from tilak-nuc8i7beh.iind.intel.com ([10.145.162.9])
 by orsmga008.jf.intel.com with ESMTP; 09 Nov 2021 21:29:27 -0800
From: Tilak Tangudu <tilak.tangudu@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 0/1] drm/i915/rpm: Enable runtime pm autosuspend by default
Date: Wed, 10 Nov 2021 10:59:25 +0530
Message-Id: <20211110052926.2881092-1-tilak.tangudu@intel.com>
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
Cc: jon.ewins@intel.com, anshuman.gupta@intel.com, tilak.tangudu@intel.com,
 badal.nilawar@intel.com, rodrigo.vivi@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Enable runtime pm autosuspend by default for all Gen12
and Gen12+ platforms

Tilak Tangudu (1):
  drm/i915/rpm: Enable runtime pm autosuspend by default

 drivers/gpu/drm/i915/intel_runtime_pm.c | 4 ++++
 1 file changed, 4 insertions(+)

-- 
2.25.1

