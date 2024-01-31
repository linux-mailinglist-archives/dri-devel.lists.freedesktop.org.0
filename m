Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F262B843450
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jan 2024 04:02:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1628B1138B5;
	Wed, 31 Jan 2024 03:02:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 575F61138B5;
 Wed, 31 Jan 2024 03:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706670142; x=1738206142;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Ttg4tkOLr0+dMelFjOGrpWcNWMn1P5Ar706yYPv/Dn4=;
 b=bxT3HCidP14bZqNZ3MYQiFELmN88i/Em0dHRGXnccEU6NurwYBSOHAiE
 +KOE8b11fsKnhtfBHb5+HdSNcYBX9Bg67BA2YyQrqRKyDxGdU2L/FxUSJ
 NGPKzbx0pWDFUjgMtJ+6TUaELo+3qihv0UyXTrmq9LYuWCo7Nn3/delMw
 AVDLChjXYzsqDF4kyinvsmFZuPPIeIclkuzCfb/I29B8YFaKF1CX5aII+
 NrKxCXhZ3ILKI/UHOjWgGFPgRqUQcnSosNiMytdngvSqjkvXZxPBbeQyG
 Dyw8GIpBnSzdX/rkOCITzEmJyoZ8m8Chz2mBd+N0//tLAKH+HYUifigSM g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="402330046"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; d="scan'208";a="402330046"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2024 19:02:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="931681123"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; d="scan'208";a="931681123"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2024 19:02:21 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/sched: Add Matthew Brost to maintainers
Date: Tue, 30 Jan 2024 19:03:02 -0800
Message-Id: <20240131030302.2088173-1-matthew.brost@intel.com>
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
Cc: Matthew Brost <matthew.brost@intel.com>, Dave Airlie <airlied@redhat.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>, Luben Tuikov <ltuikov89@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add Matthew Brost to DRM scheduler maintainers.

Cc: Luben Tuikov <ltuikov89@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Dave Airlie <airlied@redhat.com>
Cc: Christian König <christian.koenig@amd.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5c00fad59e91..e968d68a96c8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7308,6 +7308,7 @@ F:	drivers/gpu/drm/xlnx/
 
 DRM GPU SCHEDULER
 M:	Luben Tuikov <ltuikov89@gmail.com>
+M:	Matthew Brost <matthew.brost@intel.com>
 L:	dri-devel@lists.freedesktop.org
 S:	Maintained
 T:	git git://anongit.freedesktop.org/drm/drm-misc
-- 
2.34.1

