Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 109771EF81C
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jun 2020 14:40:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 809926E8D0;
	Fri,  5 Jun 2020 12:40:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F20C6E10E
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jun 2020 12:40:35 +0000 (UTC)
IronPort-SDR: B1b5E+/Sp2gcfrXpsQfPzE7+NxAYLOip32uFYoqJ8b+eClemjLx9VnkaH3+TFfbgrOW/djQEqm
 WxpQq+TISxBA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2020 05:40:35 -0700
IronPort-SDR: sDOYn15cBfhwuOGgO6mknbZHeHzpFFZR/KHuB9eU9upDCTkrxxCIJGQbL8aNjQsu5Q7VzXtU8v
 nShX9H+IvumQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,476,1583222400"; d="scan'208";a="417262516"
Received: from ramaling-i9x.iind.intel.com ([10.99.66.154])
 by orsmga004.jf.intel.com with ESMTP; 05 Jun 2020 05:40:34 -0700
From: Ramalingam C <ramalingam.c@intel.com>
To: dri-devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH 2/2] drm: Fix kdoc typo for drm_properties
Date: Fri,  5 Jun 2020 18:10:37 +0530
Message-Id: <20200605124037.2918-2-ramalingam.c@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200605124037.2918-1-ramalingam.c@intel.com>
References: <20200605124037.2918-1-ramalingam.c@intel.com>
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Typo in the KDoc for the DRM_MODE_PROP_SIGNED_RANGE type of
drm_properties is fixed.

Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
---
 include/drm/drm_property.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/drm/drm_property.h b/include/drm/drm_property.h
index 4a0a80d658c7..5d1874b6ccfc 100644
--- a/include/drm/drm_property.h
+++ b/include/drm/drm_property.h
@@ -94,7 +94,7 @@ struct drm_property {
 	 *     drm_property_create_range().
 	 *
 	 * DRM_MODE_PROP_SIGNED_RANGE
-	 *     Range properties report their minimum and maximum admissible unsigned values.
+	 *     Range properties report their minimum and maximum admissible signed values.
 	 *     The KMS core verifies that values set by application fit in that
 	 *     range. The range is signed. Range properties are created using
 	 *     drm_property_create_signed_range().
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
