Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 13527549E56
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 22:04:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5888610F7C8;
	Mon, 13 Jun 2022 20:03:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7616B10F77A;
 Mon, 13 Jun 2022 20:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655150628; x=1686686628;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tS06BcvypgjxnelkTtQd1M3b8kxbqo45e2v8MH6O85w=;
 b=oEcVHGEGeeeSRQrRdlP9vkOLv5I3EtyAPiJmZ5wHRrKe4ndi7W7BN2oN
 sxFdZPD+WgqIrt8U1sKFwy4/OzgWgev4RWTJkJjMg6Tq1WWr8fD2ofFXf
 5gQKWbIPDnOVoyzIC7Qvy0irJCAHrqrw2ZJM6KSQXV0LX2OkRrr2Ckjgp
 3gTbLkvN8GwnkjaPDQmQCKTUdbXG1IPNw1iQRN1N2ej3ZO8iAtU/4dVUs
 LtQn6w1kZdIFSiXNZcBNXKauh9XOoe5UcLyfcxmACpRKZizBx3rOkkjDA
 q+ussvqbcWYCxg1s2EUoslPXhKmh0vlPzbRWbqAthDPAFtFvUW3rFy7Aq Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10377"; a="279119131"
X-IronPort-AV: E=Sophos;i="5.91,297,1647327600"; d="scan'208";a="279119131"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2022 13:03:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,297,1647327600"; d="scan'208";a="726438141"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.163])
 by fmsmga001.fm.intel.com with SMTP; 13 Jun 2022 13:03:30 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 13 Jun 2022 23:03:29 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 4/8] drm: Drop drm_connector.h from drm_crtc.h
Date: Mon, 13 Jun 2022 23:03:13 +0300
Message-Id: <20220613200317.11305-5-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220613200317.11305-1-ville.syrjala@linux.intel.com>
References: <20220613200317.11305-1-ville.syrjala@linux.intel.com>
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
Cc: intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

drm_crtc.h has no need for drm_connector.h, so don't include it.
Avoids useless rebuilds of the entire universe when
touching drm_connector.h.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 include/drm/drm_crtc.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
index 7fbccbe8b4c6..c404b6e81220 100644
--- a/include/drm/drm_crtc.h
+++ b/include/drm/drm_crtc.h
@@ -37,7 +37,6 @@
 #include <drm/drm_rect.h>
 #include <drm/drm_mode_object.h>
 #include <drm/drm_modes.h>
-#include <drm/drm_connector.h>
 #include <drm/drm_device.h>
 #include <drm/drm_property.h>
 #include <drm/drm_plane.h>
@@ -45,6 +44,7 @@
 #include <drm/drm_debugfs_crc.h>
 #include <drm/drm_mode_config.h>
 
+struct drm_connector;
 struct drm_device;
 struct drm_framebuffer;
 struct drm_mode_set;
-- 
2.35.1

