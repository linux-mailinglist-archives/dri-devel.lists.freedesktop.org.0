Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 396E378C37E
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 13:40:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12A5B10E35F;
	Tue, 29 Aug 2023 11:40:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B83610E2E1;
 Tue, 29 Aug 2023 11:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693309207; x=1724845207;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=F3x+jH0w2Ly/lHP8KITK9TJNBV0ZG19g8AUSRUN2LRQ=;
 b=L/C1NAwX/W3F2hxJ+ondEj4EvI/PUDCBItAKbKVOv9wZqcRrZFqEWOOY
 yZlUfI1MfPTuw3OOTqxMDMXB/DwU9sh7iOw8qoZ9Su8EhP9jFkBWMGGU1
 MnRSONVXrCvKH8IqsSuY4psxpjXOEgwDt+c7QlaP11+4cnSpAsnpUC0xw
 OCT6OT5vTGyUo8H+s61iFKIimdt5yeJX1yuv8GGUc7VZFP+xmUvZJigKH
 z1oCIsx7nbWcJHSB4OIRbrtrOxOY2bTNZSxqWANp0OJdkL8P5O4NE/jF4
 nLypZD1K/5UqLq3HkiVSUyXL4YJSctO0MNXOT82LSISw9y0XNEN6KlTNL g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="365548923"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; d="scan'208";a="365548923"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2023 04:40:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="768040409"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; d="scan'208";a="768040409"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.153])
 by orsmga008.jf.intel.com with SMTP; 29 Aug 2023 04:40:04 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 29 Aug 2023 14:40:04 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 12/12] drm/i915/sdvo: Constify mapping structs
Date: Tue, 29 Aug 2023 14:39:20 +0300
Message-ID: <20230829113920.13713-13-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230829113920.13713-1-ville.syrjala@linux.intel.com>
References: <20230829113920.13713-1-ville.syrjala@linux.intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

We aren't intending to mutate the SDVO device mapping structs,
so make them const.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_sdvo.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_sdvo.c b/drivers/gpu/drm/i915/display/intel_sdvo.c
index b988e05274c1..0bd815bf2e69 100644
--- a/drivers/gpu/drm/i915/display/intel_sdvo.c
+++ b/drivers/gpu/drm/i915/display/intel_sdvo.c
@@ -2579,7 +2579,7 @@ intel_sdvo_select_ddc_bus(struct intel_sdvo *sdvo,
 			  struct intel_sdvo_connector *connector)
 {
 	struct drm_i915_private *dev_priv = to_i915(sdvo->base.base.dev);
-	struct sdvo_device_mapping *mapping;
+	const struct sdvo_device_mapping *mapping;
 	int ddc_bus;
 
 	if (sdvo->base.port == PORT_B)
@@ -2602,7 +2602,7 @@ static void
 intel_sdvo_select_i2c_bus(struct intel_sdvo *sdvo)
 {
 	struct drm_i915_private *dev_priv = to_i915(sdvo->base.base.dev);
-	struct sdvo_device_mapping *mapping;
+	const struct sdvo_device_mapping *mapping;
 	u8 pin;
 
 	if (sdvo->base.port == PORT_B)
@@ -2647,7 +2647,7 @@ static u8
 intel_sdvo_get_slave_addr(struct intel_sdvo *sdvo)
 {
 	struct drm_i915_private *dev_priv = to_i915(sdvo->base.base.dev);
-	struct sdvo_device_mapping *my_mapping, *other_mapping;
+	const struct sdvo_device_mapping *my_mapping, *other_mapping;
 
 	if (sdvo->base.port == PORT_B) {
 		my_mapping = &dev_priv->display.vbt.sdvo_mappings[0];
-- 
2.41.0

