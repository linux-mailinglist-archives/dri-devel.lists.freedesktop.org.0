Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 95B19822B09
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jan 2024 11:12:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9AE110E2F3;
	Wed,  3 Jan 2024 10:12:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 356AF10E2F3
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jan 2024 10:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704276722; x=1735812722;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eesg6+lfrgBW7TYet6kYNJpTpyzqGjIHgxWV/Am2Lzg=;
 b=W8k7puO4/y2SEgvAUKgusPrQZLCuJDn/v90W7KzdC79ri+U7DaTNsRQh
 XRViLC6FJ+9iJ0R9EXy/r4UTdx6EYJQ1vikqN+XqvU5R2skG+g8NIWdNS
 IOm4TAqaIt5APxlTbhOJkDcJFC2Mn4VwqcHejGAplqv1+z90datug5Fl4
 VnQfUSQy9/vPrI4gMI1Fa8inqvTfR7Vfe1x0Xv1WQVDdTacjQpvAA27rC
 lxVFYTK31SnyaGZy8wPidQpS7pVF5a6xQ1rHHzfkoowtRG/2U603DS6h/
 iJgYexEOn2pua9V9Na3P+iK0iD6ctKWH+zDs0TGNeodU2HWUtIj2j0wGJ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="428159645"
X-IronPort-AV: E=Sophos;i="6.04,327,1695711600"; d="scan'208";a="428159645"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2024 02:12:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="783463957"
X-IronPort-AV: E=Sophos;i="6.04,327,1695711600"; d="scan'208";a="783463957"
Received: from lwenners-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.35.39])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2024 02:11:58 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v2 28/39] drm/msm/hdmi: fix indent
Date: Wed,  3 Jan 2024 12:08:42 +0200
Message-Id: <6cce077f9ee87e5b5440682134919ca7f52e7417.1704276309.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1704276309.git.jani.nikula@intel.com>
References: <cover.1704276309.git.jani.nikula@intel.com>
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
Cc: Jani Nikula <jani.nikula@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove the excess leading tabs.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index f5e01471b0b0..f28c61570533 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -290,12 +290,12 @@ static enum drm_mode_status msm_hdmi_bridge_mode_valid(struct drm_bridge *bridge
 }
 
 static const struct drm_bridge_funcs msm_hdmi_bridge_funcs = {
-		.pre_enable = msm_hdmi_bridge_pre_enable,
-		.post_disable = msm_hdmi_bridge_post_disable,
-		.mode_set = msm_hdmi_bridge_mode_set,
-		.mode_valid = msm_hdmi_bridge_mode_valid,
-		.get_edid = msm_hdmi_bridge_get_edid,
-		.detect = msm_hdmi_bridge_detect,
+	.pre_enable = msm_hdmi_bridge_pre_enable,
+	.post_disable = msm_hdmi_bridge_post_disable,
+	.mode_set = msm_hdmi_bridge_mode_set,
+	.mode_valid = msm_hdmi_bridge_mode_valid,
+	.get_edid = msm_hdmi_bridge_get_edid,
+	.detect = msm_hdmi_bridge_detect,
 };
 
 static void
-- 
2.39.2

