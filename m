Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E5D580ED76
	for <lists+dri-devel@lfdr.de>; Tue, 12 Dec 2023 14:26:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E28C10E601;
	Tue, 12 Dec 2023 13:26:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64EDE10E5D0;
 Tue, 12 Dec 2023 13:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702387568; x=1733923568;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Q+cRZuvzaMQMuQhSiQQwRNyaof4/1dN/QwN4oF0Fj9Y=;
 b=M6lAMXcTJhULejSzm3lhS4APAlonwg/EpMVXBybhuw90T4kEe1Fw3Vss
 iqgmLCpVSdY5UtqtwHREWW7DxidoVxQJdGC4grkN7M/+djhHRYUQvPo3P
 jhvo3WSyrpZaCWsGX00bnYcgb2v7rJffPdxZb/s1wS6RjFZ5tv5hPuFqz
 y8XIvHeN93A6RlvV9pF1/ATiV1VzZz4a/joS8phiVJh8Spx+X/o0D1Yzb
 4bkGxvNR1KxlwFV8uQjqc+tuaM95sy1cCokUXVlw8taGThxoXqaQaXSOL
 JgsLw+doLlfBPmHCuauPT9WDPvP10ULW61XeJe04C6kBM6NGlTx+ZpLc3 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="459121075"
X-IronPort-AV: E=Sophos;i="6.04,270,1695711600"; d="scan'208";a="459121075"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2023 05:26:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="946758003"
X-IronPort-AV: E=Sophos;i="6.04,270,1695711600"; d="scan'208";a="946758003"
Received: from ggilardi-mobl1.amr.corp.intel.com (HELO localhost)
 ([10.252.49.147])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2023 05:26:06 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm/ioc32: replace __attribute__((packed)) with __packed
Date: Tue, 12 Dec 2023 15:25:57 +0200
Message-Id: <20231212132557.3777281-2-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231212132557.3777281-1-jani.nikula@intel.com>
References: <20231212132557.3777281-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

__packed is preferred over __attribute__((packed)).

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_ioc32.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_ioc32.c b/drivers/gpu/drm/drm_ioc32.c
index 129e2b91dbfe..e6b5b06de148 100644
--- a/drivers/gpu/drm/drm_ioc32.c
+++ b/drivers/gpu/drm/drm_ioc32.c
@@ -229,7 +229,7 @@ typedef struct drm_update_draw32 {
 	unsigned int num;
 	/* 64-bit version has a 32-bit pad here */
 	u64 data;	/**< Pointer */
-} __attribute__((packed)) drm_update_draw32_t;
+} __packed drm_update_draw32_t;
 
 static int compat_drm_update_draw(struct file *file, unsigned int cmd,
 				  unsigned long arg)
@@ -296,7 +296,7 @@ typedef struct drm_mode_fb_cmd232 {
 	u32 pitches[4];
 	u32 offsets[4];
 	u64 modifier[4];
-} __attribute__((packed)) drm_mode_fb_cmd232_t;
+} __packed drm_mode_fb_cmd232_t;
 
 static int compat_drm_mode_addfb2(struct file *file, unsigned int cmd,
 				  unsigned long arg)
-- 
2.39.2

