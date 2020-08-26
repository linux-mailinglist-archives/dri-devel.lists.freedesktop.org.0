Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B6DD2533A1
	for <lists+dri-devel@lfdr.de>; Wed, 26 Aug 2020 17:27:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 761C76E3B2;
	Wed, 26 Aug 2020 15:27:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4366E6E3B2
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Aug 2020 15:27:04 +0000 (UTC)
IronPort-SDR: ha+qeuHjewGSoGOO+edeOS6aeIRO6K4j2dvcsLDwB7OhxAHrUR2NtCUehxZ3VHv6d9n1w4vXV6
 DMm9Ji/HD2OQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9725"; a="153882812"
X-IronPort-AV: E=Sophos;i="5.76,356,1592895600"; d="scan'208";a="153882812"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2020 08:27:03 -0700
IronPort-SDR: 30Kph97pUpKGcNSyq3TZZ9VzqD4m8UP6nCYKoJChephViFIXQF/hbDyRrReCarWcEgubbk2dso
 f83wPX5qP91g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,356,1592895600"; d="scan'208";a="499760309"
Received: from lkp-server01.sh.intel.com (HELO 4f455964fc6c) ([10.239.97.150])
 by fmsmga006.fm.intel.com with ESMTP; 26 Aug 2020 08:27:01 -0700
Received: from kbuild by 4f455964fc6c with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1kAxKG-0001Uv-FS; Wed, 26 Aug 2020 15:27:00 +0000
Date: Wed, 26 Aug 2020 23:26:08 +0800
From: kernel test robot <lkp@intel.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, dri-devel@lists.freedesktop.org
Subject: [RFC PATCH] drm/plane: __drm_universal_plane_init() can be static
Message-ID: <20200826152608.GA73547@f29f2f458ad9>
References: <20200826123506.19560-3-p.zabel@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200826123506.19560-3-p.zabel@pengutronix.de>
X-Patchwork-Hint: ignore
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: kbuild-all@lists.01.org, Thomas Zimmermann <tzimmermann@suse.de>,
 kernel@pengutronix.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Signed-off-by: kernel test robot <lkp@intel.com>
---
 drm_plane.c |   14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
index 0a565d97650cb..0f1d8589ab6c7 100644
--- a/drivers/gpu/drm/drm_plane.c
+++ b/drivers/gpu/drm/drm_plane.c
@@ -153,13 +153,13 @@ static int create_in_format_blob(struct drm_device *dev, struct drm_plane *plane
 	return 0;
 }
 
-int __drm_universal_plane_init(struct drm_device *dev, struct drm_plane *plane,
-			       uint32_t possible_crtcs,
-			       const struct drm_plane_funcs *funcs,
-			       const uint32_t *formats, unsigned int format_count,
-			       const uint64_t *format_modifiers,
-			       enum drm_plane_type type,
-			       const char *name, va_list ap)
+static int __drm_universal_plane_init(struct drm_device *dev, struct drm_plane *plane,
+				      uint32_t possible_crtcs,
+				      const struct drm_plane_funcs *funcs,
+				      const uint32_t *formats, unsigned int format_count,
+				      const uint64_t *format_modifiers,
+				      enum drm_plane_type type,
+				      const char *name, va_list ap)
 {
 	struct drm_mode_config *config = &dev->mode_config;
 	unsigned int format_modifier_count = 0;
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
