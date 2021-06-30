Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 975DC3B8AE6
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jul 2021 01:22:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 084CC6EA97;
	Wed, 30 Jun 2021 23:22:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9B566EA96
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jun 2021 23:22:16 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10031"; a="294078125"
X-IronPort-AV: E=Sophos;i="5.83,312,1616482800"; d="scan'208";a="294078125"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2021 16:22:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,312,1616482800"; d="scan'208";a="626174884"
Received: from lkp-server01.sh.intel.com (HELO 4aae0cb4f5b5) ([10.239.97.150])
 by orsmga005.jf.intel.com with ESMTP; 30 Jun 2021 16:22:13 -0700
Received: from kbuild by 4aae0cb4f5b5 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1lyjX2-000A7j-Ap; Wed, 30 Jun 2021 23:22:12 +0000
Date: Thu, 1 Jul 2021 07:21:19 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, kraxel@redhat.com,
 daniel@ffwll.ch, airlied@linux.ie, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
Subject: [RFC PATCH] drm/bochs: bochs_mode_funcs can be static
Message-ID: <20210630232119.GA13084@179610431da4>
References: <20210630140659.17623-2-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210630140659.17623-2-tzimmermann@suse.de>
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
Cc: kbuild-all@lists.01.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drivers/gpu/drm/tiny/bochs.c:542:36: warning: symbol 'bochs_mode_funcs' was not declared. Should it be static?

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: kernel test robot <lkp@intel.com>
---
 bochs.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tiny/bochs.c b/drivers/gpu/drm/tiny/bochs.c
index edcd31db5b9ce..067e043de437d 100644
--- a/drivers/gpu/drm/tiny/bochs.c
+++ b/drivers/gpu/drm/tiny/bochs.c
@@ -539,7 +539,7 @@ bochs_gem_fb_create(struct drm_device *dev, struct drm_file *file,
 	return drm_gem_fb_create(dev, file, mode_cmd);
 }
 
-const struct drm_mode_config_funcs bochs_mode_funcs = {
+static const struct drm_mode_config_funcs bochs_mode_funcs = {
 	.fb_create = bochs_gem_fb_create,
 	.mode_valid = drm_vram_helper_mode_valid,
 	.atomic_check = drm_atomic_helper_check,
