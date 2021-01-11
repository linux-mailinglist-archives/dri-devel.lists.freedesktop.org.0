Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F3B92F0E22
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jan 2021 09:27:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30DB66E062;
	Mon, 11 Jan 2021 08:27:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 354EE6E062;
 Mon, 11 Jan 2021 08:27:21 +0000 (UTC)
IronPort-SDR: xCtLS397b3RNKsMiLMXNmJoXu/cso6AGgGAo8uD9x2jU9rpGvUAYjRQJhapdE7aQOgWxwLES24
 PXfqfavn1DoA==
X-IronPort-AV: E=McAfee;i="6000,8403,9860"; a="177046256"
X-IronPort-AV: E=Sophos;i="5.79,338,1602572400"; d="scan'208";a="177046256"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2021 00:27:21 -0800
IronPort-SDR: J+uUH+5al0/oz7t9SFHNEoM0oZPKC+vsodDCfqHVOttwxuGZBnpN2/8rIPAN3DOLs/r5Abce7K
 Wj5UyQjmSpWg==
X-IronPort-AV: E=Sophos;i="5.79,338,1602572400"; d="scan'208";a="464094124"
Received: from unknown (HELO genxfsim-desktop.iind.intel.com) ([10.223.74.179])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2021 00:27:17 -0800
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v9 19/19] drm/i915/hdcp: Enable HDCP 2.2 MST support
Date: Mon, 11 Jan 2021 13:41:20 +0530
Message-Id: <20210111081120.28417-20-anshuman.gupta@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210111081120.28417-1-anshuman.gupta@intel.com>
References: <20210111081120.28417-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
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
Cc: jani.nikula@intel.com, Karthik B S <karthik.b.s@intel.com>,
 uma.shankar@intel.com, seanpaul@chromium.org,
 Anshuman Gupta <anshuman.gupta@intel.com>, juston.li@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Enable HDCP 2.2 MST support till Gen12.

Cc: Ramalingam C <ramalingam.c@intel.com>
Reviewed-by: Ramalingam C <ramalingam.c@intel.com>
Tested-by: Karthik B S <karthik.b.s@intel.com>
Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 drivers/gpu/drm/i915/display/intel_hdcp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c b/drivers/gpu/drm/i915/display/intel_hdcp.c
index 576c3777c52f..db8dff2eeb0a 100644
--- a/drivers/gpu/drm/i915/display/intel_hdcp.c
+++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
@@ -2233,7 +2233,7 @@ int intel_hdcp_init(struct intel_connector *connector,
 	if (!shim)
 		return -EINVAL;
 
-	if (is_hdcp2_supported(dev_priv) && !connector->mst_port)
+	if (is_hdcp2_supported(dev_priv))
 		intel_hdcp2_init(connector, dig_port, shim);
 
 	ret =
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
