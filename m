Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A831A653702
	for <lists+dri-devel@lfdr.de>; Wed, 21 Dec 2022 20:30:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F386510E14A;
	Wed, 21 Dec 2022 19:29:53 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3763110E14A;
 Wed, 21 Dec 2022 19:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671650991; x=1703186991;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=wH91EP8jFjF6xj+MTbXY+ce1xpQDjyik/Iv0htTI8Ck=;
 b=EjJ2GclkhmNG/mzLRdmMS6zNWbGsZBPszYBIHEF5cpS6UZ0JIBJLgIpn
 EfI1dMxn0/2pbBjQk91kbDKvmOnxEtLVb2eTxYn0JD9uwXDlMUIgcBC2+
 Oxtc2q3XYQvsHIKvT6tSlQcoQ1QMrKQvoTqZKS7ACYakCnpFbqPBkOXYs
 hqKT9Zwp2qFQQR+tVmHXzkb0OZACHgFfeZFdT+w+NBYDn7pqIzX6hlay4
 YzGRlyFbibe9woGPFf0OR0sAHxkJmGMpNly7e6Ps3fjuYzIEjomahuPnl
 Z3gRO0dgvweQ1c/XRM0fvq6IzH5mc11FBuicP4gj3PHNpTSBMk8IMuV4v A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10568"; a="321871014"
X-IronPort-AV: E=Sophos;i="5.96,263,1665471600"; d="scan'208";a="321871014"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2022 11:29:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10568"; a="644948803"
X-IronPort-AV: E=Sophos;i="5.96,263,1665471600"; d="scan'208";a="644948803"
Received: from relo-linux-5.jf.intel.com ([10.165.21.200])
 by orsmga007.jf.intel.com with ESMTP; 21 Dec 2022 11:29:50 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH 0/3] Fixes for various UC related issues
Date: Wed, 21 Dec 2022 11:30:28 -0800
Message-Id: <20221221193031.687266-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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
Cc: John Harrison <John.C.Harrison@Intel.com>, DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

Fix a bunch of assorted issues with firmware loading and GuC
intialisation.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>


John Harrison (3):
  drm/i915/guc: Fix missing return code checks in submission init
  drm/i915/guc: Fix a static analysis warning
  drm/i915/uc: Fix two issues with over-size firmware files

 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 75 ++++++++++++++-----
 .../gpu/drm/i915/gt/uc/intel_guc_submission.h |  2 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc.c         |  7 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c      | 42 +++++++----
 4 files changed, 91 insertions(+), 35 deletions(-)

-- 
2.39.0

