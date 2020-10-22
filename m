Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 221EE295BFC
	for <lists+dri-devel@lfdr.de>; Thu, 22 Oct 2020 11:36:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D91F6F59A;
	Thu, 22 Oct 2020 09:36:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 588546F59A;
 Thu, 22 Oct 2020 09:36:37 +0000 (UTC)
IronPort-SDR: NkJGvovjYmgsMEfSieAsgtClk1M+fQgnRPUTlAxShrE1PYimiifantAH94CRdd441a8hmEJMWY
 xOjfDu2XVZ7g==
X-IronPort-AV: E=McAfee;i="6000,8403,9781"; a="164905565"
X-IronPort-AV: E=Sophos;i="5.77,404,1596524400"; d="scan'208";a="164905565"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2020 02:36:37 -0700
IronPort-SDR: bfDewxQvkxoIMWWjVBX/FpMhg9EPFiqDFD+ol7k1Kj0ceM14fx0mVVYytPpPCRYVGRD3NPeDDL
 ETM4qGj+nc/Q==
X-IronPort-AV: E=Sophos;i="5.77,404,1596524400"; d="scan'208";a="359807480"
Received: from genxfsim-desktop.iind.intel.com ([10.223.74.178])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2020 02:36:34 -0700
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v3 11/16] drm/hdcp: Max MST content streams
Date: Thu, 22 Oct 2020 14:25:47 +0530
Message-Id: <20201022085552.18353-12-anshuman.gupta@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201022085552.18353-1-anshuman.gupta@intel.com>
References: <20201022085552.18353-1-anshuman.gupta@intel.com>
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
Cc: jani.nikula@intel.com, uma.shankar@intel.com, seanpaul@chromium.org,
 Anshuman Gupta <anshuman.gupta@intel.com>, juston.li@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Let's define Maximum MST content streams up to four
generically which can be supported by modern display
controllers.

Cc: Sean Paul <seanpaul@chromium.org>
Cc: Ramalingam C <ramalingam.c@intel.com>
Acked-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 include/drm/drm_hdcp.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/drm/drm_hdcp.h b/include/drm/drm_hdcp.h
index fe58dbb46962..ac22c246542a 100644
--- a/include/drm/drm_hdcp.h
+++ b/include/drm/drm_hdcp.h
@@ -101,11 +101,11 @@
 
 /* Following Macros take a byte at a time for bit(s) masking */
 /*
- * TODO: This has to be changed for DP MST, as multiple stream on
- * same port is possible.
- * For HDCP2.2 on HDMI and DP SST this value is always 1.
+ * TODO: HDCP_2_2_MAX_CONTENT_STREAMS_CNT is based upon actual
+ * H/W MST streams capacity.
+ * This required to be moved out to platform specific header.
  */
-#define HDCP_2_2_MAX_CONTENT_STREAMS_CNT	1
+#define HDCP_2_2_MAX_CONTENT_STREAMS_CNT	4
 #define HDCP_2_2_TXCAP_MASK_LEN			2
 #define HDCP_2_2_RXCAPS_LEN			3
 #define HDCP_2_2_RX_REPEATER(x)			((x) & BIT(0))
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
