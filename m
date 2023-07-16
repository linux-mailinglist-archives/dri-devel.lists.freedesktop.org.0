Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C2E6754CEF
	for <lists+dri-devel@lfdr.de>; Sun, 16 Jul 2023 02:46:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D431D10E0CC;
	Sun, 16 Jul 2023 00:46:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56B3210E0CC;
 Sun, 16 Jul 2023 00:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=vCDJzaPXRVCO/UvhiEs9IHkx1kgQ8KEzMrH/C6KGEU0=; b=b7ClRTC6xGPUfPjg3DfYY1xxDk
 J3IwUzmdemoCyRwI1hiw/UFxBG9Nc9tqI1e9ahGdgGni3OdqfAzU9D4rBjo2f8a14GXaWFTL8AKC6
 g3XXKCTByv78lQYd7LRpHmjSHdcZGBGa+7YYhXofQUKQnxBjv7vhd5ruCbnV1wghR5/jU07soME/F
 bCfM2LI+RaQxuigE+wISZEqQ/cu3zBOpOexyddGJldJndOS7P27AFORezLol2tj7RFy6Fw5sOvvZz
 bUMDZLVEqz2oe0IS5BCGSt6NRku+WjGsNbyj9wWo9dMgm/hfCZBrKB93jcPgX27lj5OeMa7nEnBYe
 tWxamYXg==;
Received: from 50-198-160-193-static.hfc.comcastbusiness.net ([50.198.160.193]
 helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1qKptx-009lWB-2x; Sun, 16 Jul 2023 00:46:18 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] drm/connector: mark enum counter value as private
Date: Sat, 15 Jul 2023 17:46:16 -0700
Message-ID: <20230716004616.21838-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.41.0
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
Cc: amd-gfx@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Randy Dunlap <rdunlap@infradead.org>, Maxime Ripard <mripard@kernel.org>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Mark the DRM_MODE_COLORIMETRY_COUNT enum value as private in
kernel-doc to prevent a build warning:

include/drm/drm_connector.h:527: warning: Enum value 'DRM_MODE_COLORIMETRY_COUNT' not described in enum 'drm_colorspace'

Fixes: c627087cb164 ("drm/connector: Use common colorspace_names array")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: amd-gfx@lists.freedesktop.org
---
 include/drm/drm_connector.h |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20230714.orig/include/drm/drm_connector.h
+++ linux-next-20230714/include/drm/drm_connector.h
@@ -522,7 +522,7 @@ enum drm_colorspace {
 	DRM_MODE_COLORIMETRY_RGB_WIDE_FIXED	= 13,
 	DRM_MODE_COLORIMETRY_RGB_WIDE_FLOAT	= 14,
 	DRM_MODE_COLORIMETRY_BT601_YCC		= 15,
-	/* not a valid value; merely used for counting */
+	/* private: not a valid value; merely used for counting */
 	DRM_MODE_COLORIMETRY_COUNT
 };
 
