Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1798F635F00
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 14:09:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC64810E547;
	Wed, 23 Nov 2022 13:09:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EE5B10E3D3;
 Wed, 23 Nov 2022 13:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669208980; x=1700744980;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=FCsCsiNtomw6pBCxzkQrhJj9GHqXBUy9OGr/g/SulqM=;
 b=U1LERYoeHFnS9VKoHrQ0BfZVwGyWyipoZ+FF49FvrNfe8XyYiIgV08Xb
 akCmV/JE4a9uC9FcQ8j9gneiM8nlk4Nv9KVxfVbjgowvY07c51lZ1LO/r
 gwS7HS1+ioRiKlQYD5X+dou8jqb+WsT1DsTKQeMY2jqw+0nfPUZpPT7b7
 p3Odk3jAtVgoNZNrRsq9XIiRfMymy79DG+X0ysCxw2dWfdrvBNvQkdc4/
 mgWAztgLejG7XShQB8mY/GYdbeqKn9wepiJv8NdIwY2j5WjmfeZ97r3W3
 liCbbSSzfXVcpySQbFfb7ilqKHBktaYkcDyIhjjmBqCInbfHeDAebaTG2 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10539"; a="293769800"
X-IronPort-AV: E=Sophos;i="5.96,187,1665471600"; d="scan'208";a="293769800"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2022 05:09:39 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10539"; a="592513960"
X-IronPort-AV: E=Sophos;i="5.96,187,1665471600"; d="scan'208";a="592513960"
Received: from jgronski-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.16.163])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2022 05:09:37 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/audio: make drm_audio_component.h self-contained
Date: Wed, 23 Nov 2022 15:09:32 +0200
Message-Id: <20221123130932.3863985-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.34.1
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

The file uses bool and struct completion, include the relevant headers.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 include/drm/drm_audio_component.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/drm/drm_audio_component.h b/include/drm/drm_audio_component.h
index 0d36bfd1a4cd..5a4cd1fa8e2a 100644
--- a/include/drm/drm_audio_component.h
+++ b/include/drm/drm_audio_component.h
@@ -4,6 +4,9 @@
 #ifndef _DRM_AUDIO_COMPONENT_H_
 #define _DRM_AUDIO_COMPONENT_H_
 
+#include <linux/completion.h>
+#include <linux/types.h>
+
 struct drm_audio_component;
 struct device;
 
-- 
2.34.1

