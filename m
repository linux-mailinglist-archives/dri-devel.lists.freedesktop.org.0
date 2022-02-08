Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4F164ADC1E
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 16:13:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DDE710E1D8;
	Tue,  8 Feb 2022 15:13:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C61A10E1D8;
 Tue,  8 Feb 2022 15:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644333184; x=1675869184;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=V/YxQaxEhtmPb7R1Bm6BroNBWC5GJXMuSUzPFRzoc98=;
 b=SBUuC05vrZW8C5Ygiyq9xVDs48lSW9fyH0TYmL7xhcMz/SHzAEO4on1P
 X7pu5yr9TuFchf2rRvy4Qyo6roJm02xP2bcxl2pKY03JsH+hMmXkClCKZ
 pmBFzKzpQkpspc/mU5QbKH18ZQu739oqTDmlFCNVansvOgXb0DuCjewdv
 E4VKEfwpdT9CKC5Y9RD5poxoXfVdUBPoWfVw6YutXj0V6P/dOehY3HsQW
 K/Y893nqyF0e/4J9L/6J2b0TWSWQV87gKCkNyTtIVCxJ0W3LBrM53eCcv
 nYr5A9/w3qC8OAdGkIBkmJmgI8vVl5cPFhYKnsOtVRDEjPwWgH2Bpy1Vh Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10252"; a="248729104"
X-IronPort-AV: E=Sophos;i="5.88,353,1635231600"; d="scan'208";a="248729104"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2022 07:13:02 -0800
X-IronPort-AV: E=Sophos;i="5.88,353,1635231600"; d="scan'208";a="499589061"
Received: from amcgrat2-mobl1.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.10.21])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2022 07:13:00 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/doc: pull in drm_buddy.c
Date: Tue,  8 Feb 2022 15:12:28 +0000
Message-Id: <20220208151228.344997-1-matthew.auld@intel.com>
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
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, Arunpravin <Arunpravin.PaneerSelvam@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Make sure we pull in the kernel-doc for this.

Reported-by: Daniel Vetter <daniel@ffwll.ch>
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
Cc: Christian König <christian.koenig@amd.com>
---
 Documentation/gpu/drm-mm.rst | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/gpu/drm-mm.rst b/Documentation/gpu/drm-mm.rst
index 198bcc1affa1..f32ccce5722d 100644
--- a/Documentation/gpu/drm-mm.rst
+++ b/Documentation/gpu/drm-mm.rst
@@ -466,6 +466,15 @@ DRM MM Range Allocator Function References
 .. kernel-doc:: drivers/gpu/drm/drm_mm.c
    :export:
 
+DRM Buddy Allocator
+===================
+
+DRM Buddy Function References
+-----------------------------
+
+.. kernel-doc:: drivers/gpu/drm/drm_buddy.c
+   :export:
+
 DRM Cache Handling and Fast WC memcpy()
 =======================================
 
-- 
2.34.1

