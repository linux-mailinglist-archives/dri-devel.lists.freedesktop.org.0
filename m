Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46CFECC1C83
	for <lists+dri-devel@lfdr.de>; Tue, 16 Dec 2025 10:28:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7761E10E91E;
	Tue, 16 Dec 2025 09:28:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FQvdDR2/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36A1E10E91D;
 Tue, 16 Dec 2025 09:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765877310; x=1797413310;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=QSwaQ1SPaWEmB/2Fi0gLPoFC4CznaAOha9tKIEoel/U=;
 b=FQvdDR2/D+Yakp7+ANkeCN55iS099k4yW3FcQ+ATSTRGuHPlDrSMSZvM
 5X1E5sq5A5nSsj3MjfHqU8eM22Oefgz9GYOD/oBdKwzp3GKa1rN1G3pvS
 8Y/1BBYaxehqKUAFBiqWLbgzwnax9MuqI/J18JF4NzMeIA7/+g4Z9/+WY
 EGsNMNN35fMyO5AAz31Qb/czG7Xtc5lcogP7fe7BJhIkE2fV+U8MKQG6U
 yoTwj/ykgqAlxFAzn/GNqWLZeLasmBWdA0ZERwAHOuHHHyjMtRckNjzaT
 POyUp2jMTbcgMq06nMQIgOOiBUPtoWIOisViwqhAAzcnaojWNyJL0CeTC Q==;
X-CSE-ConnectionGUID: jbtPKwjVR2Cof12pb2kGxg==
X-CSE-MsgGUID: txL9BGDKThqll6M7qXeMeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="85203571"
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; d="scan'208";a="85203571"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 01:28:29 -0800
X-CSE-ConnectionGUID: XoZakjIPSA6Qf6tThxCUYg==
X-CSE-MsgGUID: d3V7dnnZSuywRB0cXZudvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; d="scan'208";a="197952603"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO fedora)
 ([10.245.244.249])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 01:28:26 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>,
 David Airlie <airlied@redhat.com>, Simona Vetter <simona.vetter@ffwll.ch>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Felix Kuehling <felix.kuehling@amd.com>,
 Alistair Popple <apopple@nvidia.com>,
 Dri Development Mailing List <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/gpusvm: Assign maintainers to the DRM GPUSVM helpers
Date: Tue, 16 Dec 2025 10:28:00 +0100
Message-ID: <20251216092800.199824-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.51.1
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

Document maintainers and reviewers of the DRM GPUSVM helpers

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>
Cc: David Airlie <airlied@redhat.com>
Cc: Simona Vetter <simona.vetter@ffwll.ch>
Cc: Christian König <christian.koenig@amd.com>
Cc: Felix Kuehling <felix.kuehling@amd.com>
Cc: Alistair Popple <apopple@nvidia.com>
Cc: Dri Development Mailing List <dri-devel@lists.freedesktop.org>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 MAINTAINERS | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index dd2970833dff..f6353315f216 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8714,6 +8714,18 @@ T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	drivers/gpu/drm/drm_gpuvm.c
 F:	include/drm/drm_gpuvm.h
 
+DRM GPUSVM
+M:	Matthew Brost <matthew.brost@intel.com>
+R:	Thomas Hellström <thomas.hellstrom@linux.intel.com>
+R:	Ghimiray Himal Prasad <himal.prasad.ghimiray@intel.com>
+L:	dri-devel@lists.freedesktop.org
+S:	Supported
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
+F:	drivers/gpu/drm/drm_gpusvm.c
+F:	drivers/gpu/drm/drm_pagemap.c
+F:	include/drm/drm_gpusvm.h
+F:	include/drm/drm_pagemap.h
+
 DRM LOG
 M:	Jocelyn Falempe <jfalempe@redhat.com>
 M:	Javier Martinez Canillas <javierm@redhat.com>
-- 
2.51.1

