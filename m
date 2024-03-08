Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E34388763C3
	for <lists+dri-devel@lfdr.de>; Fri,  8 Mar 2024 12:56:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F7DF11388C;
	Fri,  8 Mar 2024 11:56:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WDymRn06";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14E2811388C;
 Fri,  8 Mar 2024 11:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709899004; x=1741435004;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=veV3equEGpYJ2h8Ax6fu9UAn5vO9DE9popUiEGr9tjo=;
 b=WDymRn06FxzjiTRdeyPNnaoSBMgIMDaMv2rw8ANh0rx17ecA0sFzbCF0
 Y4LvdNoThS4ZiyVBCwplrMxuMPeLqbfite47TbJTfNph0fB56HSkiCTbo
 JDRTZoFlL+OWUlkBo2JJ5LiZ8Im7LFUIFHMNLMMWSIAFIkJCU/erF0pfq
 r7OWNrOVJBS1rxvjR+1W9GH6XYAFwQgK+epblkRKeNhm2sO9Wx6zTxsk0
 RDvhzPt8NSbclaiblLZMRuMwohbVHa1gBz//19ELpHXonslkw9LT2c95A
 dsxrfjTaxdYHr3y+n1oCns0m8DZ++BAd2rJF99jx/pURoh4oN/NOjkQD1 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="4794515"
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; 
   d="scan'208";a="4794515"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2024 03:56:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; d="scan'208";a="10378505"
Received: from unknown (HELO localhost) ([10.252.34.187])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2024 03:56:40 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 jani.nikula@intel.com, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Masahiro Yamada <masahiroy@kernel.org>, lucas.demarchi@intel.com
Subject: [PATCH v2 05/16] drm/i915: fix i915_gsc_proxy_mei_interface.h
 kernel-doc
Date: Fri,  8 Mar 2024 13:55:43 +0200
Message-Id: <a84bd76162290940f709f5cb6e432e5e1f75a3b9.1709898638.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1709898638.git.jani.nikula@intel.com>
References: <cover.1709898638.git.jani.nikula@intel.com>
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

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
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

