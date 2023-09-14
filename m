Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B9417A056D
	for <lists+dri-devel@lfdr.de>; Thu, 14 Sep 2023 15:20:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AE9C10E270;
	Thu, 14 Sep 2023 13:20:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0607A10E275
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Sep 2023 13:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694697600; x=1726233600;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ihyT6FgKas55qGA/LG6gHTbvZOGbWFoKByYLZaxZ9gk=;
 b=Uhxqvz3OVRs2ppefgH2aa9PO5BkLnHW40lOiEjIC0udllSuBxai+w/EU
 iPoB+0jGCJ1gYS8OL/PW5gVbFqYcJEhkwPETfmXoGxHX8Md0nyovJIDmq
 yTB31DEe9uRSRGkatQdyCPtnNIdF4cFtMwqOWv9T0DTRWXWrFREoBCHYB
 oLJ+KO677b3WWdCOOWRWZd3fkJMcvWqhFIwcbis3Cs3jRkJNbigCxbNxl
 oxHgNWBQuNMtrN2lB6L64v8OIuv6SAOQfNZPGx988OTkwIRoDRBjUiAYh
 YokGZNYP5lMWFVQ3BO5XcXtQMLp4hM0uHJUf6HY8Wb/PEtzEXqeuHffz7 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="378867720"
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000"; d="scan'208";a="378867720"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2023 06:20:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="744528130"
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000"; d="scan'208";a="744528130"
Received: from jnikula-mobl4.fi.intel.com (HELO localhost) ([10.237.66.162])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2023 06:19:57 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] MAINTAINERS: add drm_bridge_connector.[ch] files under bridge
 chips
Date: Thu, 14 Sep 2023 16:19:51 +0300
Message-Id: <20230914131951.2473844-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
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
Cc: jani.nikula@intel.com, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Clearly this should be under bridge chips.

Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Robert Foss <rfoss@kernel.org>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 354ac7ef553d..c331f2ea89d7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6909,7 +6909,9 @@ T:	git git://anongit.freedesktop.org/drm/drm-misc
 F:	Documentation/devicetree/bindings/display/bridge/
 F:	drivers/gpu/drm/bridge/
 F:	drivers/gpu/drm/drm_bridge.c
+F:	drivers/gpu/drm/drm_bridge_connector.c
 F:	include/drm/drm_bridge.h
+F:	include/drm/drm_bridge_connector.h
 
 DRM DRIVERS FOR EXYNOS
 M:	Inki Dae <inki.dae@samsung.com>
-- 
2.39.2

