Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C5B43E9A23
	for <lists+dri-devel@lfdr.de>; Wed, 11 Aug 2021 22:59:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60E6D6E1B8;
	Wed, 11 Aug 2021 20:59:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 730576E1B8
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Aug 2021 20:59:07 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10073"; a="300807740"
X-IronPort-AV: E=Sophos;i="5.84,313,1620716400"; d="scan'208";a="300807740"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2021 13:59:06 -0700
X-IronPort-AV: E=Sophos;i="5.84,313,1620716400"; d="scan'208";a="507216690"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2021 13:59:05 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: airlied@redhat.com,
	Simon Ser <contact@emersion.fr>
Subject: [PATCH] drm/edid: fix edid field name
Date: Wed, 11 Aug 2021 13:58:18 -0700
Message-Id: <20210811205818.156100-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.31.1
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

Byte 26 in a edid struct is supposed to be "Blue and white
least-significant 2 bits", not "black and white". Rename the field
accordingly. This field is not used anywhere, so just renaming it here
for correctness.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 include/drm/drm_edid.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
index 759328a5eeb2..deccfd39e6db 100644
--- a/include/drm/drm_edid.h
+++ b/include/drm/drm_edid.h
@@ -336,7 +336,7 @@ struct edid {
 	u8 features;
 	/* Color characteristics */
 	u8 red_green_lo;
-	u8 black_white_lo;
+	u8 blue_white_lo;
 	u8 red_x;
 	u8 red_y;
 	u8 green_x;
-- 
2.31.1

