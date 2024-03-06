Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57277873F4D
	for <lists+dri-devel@lfdr.de>; Wed,  6 Mar 2024 19:32:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D854113440;
	Wed,  6 Mar 2024 18:32:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fYQm8jks";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 326E811343C;
 Wed,  6 Mar 2024 18:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709749970; x=1741285970;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=u+oqZJ3ddeNcJWH5qiQlFgL3bPm11GUIWVweQoYyMOo=;
 b=fYQm8jksW9Q0ei27IZEbQPZOKVYsReC2w0CLyNy2+qnV7RiZXIsZfmgU
 8/Zr9d6pf4heRdwtM0Ez17bsCRi1at1f7iwfiN59yX9CdOXL4DCn4og99
 x4rBR5F49QaibTyqvSkbqkfWm8hnhr6MJH6xrcD/Nvrr9VGz5nK1Y2eDQ
 ZlHpM3rjbf4ll2jEisQlFi5OOFWvcOhNel6maNtKZvH8BYZDYV6jfx681
 Y43w+K2unphjh7pfpDacBlo9s1jRzsUh6jjOIEqohV9ykYMhlLsrRbIJg
 vEJytXDNkYtXirSclPjqlJgh5DrzV8t8ugnG+iKrOF+9pSs8sbNydQ7H4 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11005"; a="8195789"
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; 
   d="scan'208";a="8195789"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 10:32:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; d="scan'208";a="14496671"
Received: from rjongalo-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.33.211])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 10:32:47 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 jani.nikula@intel.com
Subject: [PATCH 15/22] drm/i915: fix i915_gsc_proxy_mei_interface.h kernel-doc
Date: Wed,  6 Mar 2024 20:31:20 +0200
Message-Id: <5093112670715dbc37b73dffc5ba26a911047e05.1709749576.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1709749576.git.jani.nikula@intel.com>
References: <cover.1709749576.git.jani.nikula@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There's no proper way to document function pointer members, but at least
silence the warnings.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 include/drm/i915_gsc_proxy_mei_interface.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/drm/i915_gsc_proxy_mei_interface.h b/include/drm/i915_gsc_proxy_mei_interface.h
index 9462341d3ae1..850dfbf40607 100644
--- a/include/drm/i915_gsc_proxy_mei_interface.h
+++ b/include/drm/i915_gsc_proxy_mei_interface.h
@@ -21,7 +21,7 @@ struct i915_gsc_proxy_component_ops {
 	struct module *owner;
 
 	/**
-	 * send - Sends a proxy message to ME FW.
+	 * @send: Sends a proxy message to ME FW.
 	 * @dev: device struct corresponding to the mei device
 	 * @buf: message buffer to send
 	 * @size: size of the message
@@ -30,7 +30,7 @@ struct i915_gsc_proxy_component_ops {
 	int (*send)(struct device *dev, const void *buf, size_t size);
 
 	/**
-	 * recv - Receives a proxy message from ME FW.
+	 * @recv: Receives a proxy message from ME FW.
 	 * @dev: device struct corresponding to the mei device
 	 * @buf: message buffer to contain the received message
 	 * @size: size of the buffer
-- 
2.39.2

