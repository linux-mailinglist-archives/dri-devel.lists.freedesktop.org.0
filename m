Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E1F09A3174
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2024 01:39:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09DCC10E335;
	Thu, 17 Oct 2024 23:39:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HtUP5B7p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA0F310E335;
 Thu, 17 Oct 2024 23:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729208358; x=1760744358;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=LHKbFRn+SCZV5qIq4QvtH2Tn8fwN95EU3gfHHrr4Wsg=;
 b=HtUP5B7pIMh9bOXsXKNmZ7ed9AzrGuVucERT+bmhl0Ubw6HTy81QAtdz
 1JHZ54LhXyg+W3eVI8vCmNsKE7sbFJouqx6k/c4PEeJXKkYBCtdnF9wvi
 3jZNNQUlER8CT2pbTAcp/0vJ8Wv+FNljILYe/Qxw9IZHDYcDHlazAFIUP
 CXo3QSObYvr9CuUjKM1VLJn2TnLL56RF83HZvxjxXIlcLZyKwonqcmjWf
 FzPUm9ik9YSXY8uyilvZCw9bi9pzo2V7SasWGASXFMmGIUCaGcsz8VhJq
 ccR2OZQYyPrkoD1nu4/f+m7a+hzNMJWVtSwH0Ye4/RJ271t1VQBRhS5SR Q==;
X-CSE-ConnectionGUID: DXr3mVtwQVartGE2m9IZPQ==
X-CSE-MsgGUID: /uog3adAQ9W06zzpDBPmsw==
X-IronPort-AV: E=McAfee;i="6700,10204,11228"; a="32518608"
X-IronPort-AV: E=Sophos;i="6.11,212,1725346800"; d="scan'208";a="32518608"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2024 16:39:17 -0700
X-CSE-ConnectionGUID: vcCANo6VTGaf5lxFsgZInQ==
X-CSE-MsgGUID: vbto/nNJS3WlUq7Fe/QYYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,212,1725346800"; d="scan'208";a="83778406"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2024 16:39:17 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: thomas.hellstrom@linux.intel.com
Subject: [RFC PATCH 0/1] Enable non-contiguous VRAM access in Xe
Date: Thu, 17 Oct 2024 16:39:39 -0700
Message-Id: <20241017233941.1047522-1-matthew.brost@intel.com>
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

Patches should be split but quick RFC for feedback.

Matt

Matthew Brost (1):
  drm/ttm, drm/xe: Add ttm_bo_access

 drivers/gpu/drm/ttm/ttm_bo_vm.c | 20 +++++++++-----
 drivers/gpu/drm/xe/xe_bo.c      | 48 +++++++++++++++++++++++++++++++++
 include/drm/ttm/ttm_bo.h        |  2 ++
 3 files changed, 64 insertions(+), 6 deletions(-)

-- 
2.34.1

