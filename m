Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFB3ECFF70E
	for <lists+dri-devel@lfdr.de>; Wed, 07 Jan 2026 19:27:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9802D10E601;
	Wed,  7 Jan 2026 18:27:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IWkpBbcw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0022B10E1E9;
 Wed,  7 Jan 2026 18:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767810441; x=1799346441;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=DRxd3T2VHnxOpFxn5ly0D8lfHGbZHagXLhEfUs/KQ+g=;
 b=IWkpBbcwCeu5eNsZQ2xbvCRjHe1DVcbyCK2QbQtOWaPguDdg80BFUX7h
 XpIe2FXjALY25s40nWavTdW6Cvt60TWRzkaaDJRk7EKyzGhLs0HwMEbCW
 I1KlAuvfM9d8OZgVl78160L0jZ01QFrhPhWrT0j+TM/P4awuYMxkjRcOv
 lirsm8Tp05BSF7V1qGsW/vbMJngTw5/Hu6Ql28IQlk17i1KStkLNUYSJq
 R/9jvjfLAK/WC9VPxlurLW3uiP7Jow6EIJa8d49xeBwpN6Ohw0PDhOy/R
 r1pzCKR/Zjf+OPqCNgWOeIw/CvOXs09i9RmFeYpBdCKyXm1A/EXmZWJjO Q==;
X-CSE-ConnectionGUID: Y/VlRJxAQ968YFSlSnbsxA==
X-CSE-MsgGUID: 7pWPub/3TD2tyWWrPFxMjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="56747385"
X-IronPort-AV: E=Sophos;i="6.21,208,1763452800"; d="scan'208";a="56747385"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 10:27:21 -0800
X-CSE-ConnectionGUID: Hb2mlTL+RPWy5p+sSF79DQ==
X-CSE-MsgGUID: 9Ky/tEY4SsS2oq+SIqZvVg==
X-ExtLoop1: 1
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 10:27:20 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com,
	francois.dugast@intel.com
Subject: [PATCH 0/2] Fix a couple drm_pagemap issues with multi-GPU 
Date: Wed,  7 Jan 2026 10:27:14 -0800
Message-Id: <20260107182716.2236607-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

A couple of fixes, 2nd one is temporary W/A to stable CI until a proper
fix can be found.

Matt 

Matthew Brost (2):
  drm/pagemap Fix error paths in drm_pagemap_migrate_to_devmem
  drm/pagemap: Disable device-to-device migration

 drivers/gpu/drm/drm_pagemap.c | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

-- 
2.34.1

