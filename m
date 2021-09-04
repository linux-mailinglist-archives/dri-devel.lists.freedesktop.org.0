Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D69754008BD
	for <lists+dri-devel@lfdr.de>; Sat,  4 Sep 2021 02:36:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D90D6E8E9;
	Sat,  4 Sep 2021 00:35:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43BB96E8E9;
 Sat,  4 Sep 2021 00:35:54 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10096"; a="216404814"
X-IronPort-AV: E=Sophos;i="5.85,266,1624345200"; d="scan'208";a="216404814"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2021 17:35:53 -0700
X-IronPort-AV: E=Sophos;i="5.85,266,1624345200"; d="scan'208";a="511701399"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2021 17:35:53 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
	Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH 0/2] drm/i915: Add MOCS tables for XeHP SDV and DG2
Date: Fri,  3 Sep 2021 17:35:42 -0700
Message-Id: <20210904003544.2422282-1-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.25.4
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Now that Ayaz's MOCS initialization series has landed on
drm-intel-gt-next, we can add the new MOCS tables for XeHP SDV and DG2.

[1] https://patchwork.freedesktop.org/series/94315/

Lucas De Marchi (1):
  drm/i915/xehpsdv: Define MOCS table for XeHP SDV

Matt Roper (1):
  drm/i915/dg2: Define MOCS table for DG2

 drivers/gpu/drm/i915/gt/intel_mocs.c | 70 +++++++++++++++++++++++++++-
 1 file changed, 69 insertions(+), 1 deletion(-)

-- 
2.25.4

