Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20CEEBAD265
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 16:13:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D97AD10E089;
	Tue, 30 Sep 2025 14:13:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UjC00rGu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 624B210E089
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 14:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759241602; x=1790777602;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qBlxUB2Nivyba5mIWUVQC0GVKITJ7CICof0QAdNXQYk=;
 b=UjC00rGuPl0sX+6K2kSTzES26nfc8qNBCn1PVVMZ6NGVPshuCIvgGxyx
 x+NFufo3FizT6KH6XD2YksZ6BmPQ0b0vft5kIlMd19PJ5As4JnAQohV6i
 v+JMKQrxyCdiRYM4L8bjqd5x6CnwCoQrvDyL7pBgP0/Q6tATRe8Hc84H+
 JQAldb1ITuE7PT0z8hACm09MW5E69KmZfDgxavIrE6Ajfkuktu5UZZMF1
 QThX3A1U5yNme6w/le8Q7T5hYoptK+9ahG3K4GY+JiCiw2RvFPmCyOt2W
 4O2E+m2PqjcgKOkGkw+p3jAcC7VWJ+msNgsZdux9rjastqU/bSUy1MVek Q==;
X-CSE-ConnectionGUID: oIeDInDfSSeJDP7v7B0dOg==
X-CSE-MsgGUID: /nL7iuAsQM+Ft03w51tRpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11568"; a="71747905"
X-IronPort-AV: E=Sophos;i="6.18,304,1751266800"; d="scan'208";a="71747905"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 07:13:22 -0700
X-CSE-ConnectionGUID: 4wp0rwysSw2QmXYl+3dpSQ==
X-CSE-MsgGUID: Vf4rSuMsQiuAg9cwQfbHdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,304,1751266800"; d="scan'208";a="202216146"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 07:13:21 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: christian.koenig@amd.com,
	pstanner@redhat.com
Subject: [PATCH 0/1] Xe submission as it relates to DRM scheduler 
Date: Tue, 30 Sep 2025 07:13:15 -0700
Message-Id: <20250930141316.1552516-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

Have XDC workshop about submission tomorrow - rather than explain this
on in person might be helpful for stakeholders to read this one through.

Matt

Matthew Brost (1):
  drm/xe/guc: Document GuC submission backend

 Documentation/gpu/xe/index.rst     |   1 +
 drivers/gpu/drm/xe/xe_guc_submit.c | 282 +++++++++++++++++++++++++++++
 2 files changed, 283 insertions(+)

-- 
2.34.1

