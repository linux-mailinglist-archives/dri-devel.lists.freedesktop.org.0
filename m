Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D60C3477A5
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 12:47:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4002A6E9D8;
	Wed, 24 Mar 2021 11:47:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BD266E9C7;
 Wed, 24 Mar 2021 11:47:07 +0000 (UTC)
IronPort-SDR: zzCHHhrduiUhyfA2IVWqXGLVl9toJuPYWvSER7pg8VrHixmI7qfmPeM0YjOkO9IkHOjREZQUBi
 mBdDpX4iP0TQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9932"; a="190714449"
X-IronPort-AV: E=Sophos;i="5.81,274,1610438400"; d="scan'208";a="190714449"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2021 04:47:07 -0700
IronPort-SDR: i2ZKQkdIzdGMeGLTHeYYvzbRjnrIOFVsdUoMAhM2zrC/h8M9kEJPqgkBhy5Vnxy5EpGWXPKA+t
 6bOb7wQ2YpiA==
X-IronPort-AV: E=Sophos;i="5.81,274,1610438400"; d="scan'208";a="442938023"
Received: from unknown (HELO genxfsim-desktop.iind.intel.com) ([10.223.74.179])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2021 04:47:04 -0700
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 2/2] drm/hdcp: DP HDCP2.2 errata LC_Send_L_Prime=16
Date: Wed, 24 Mar 2021 17:00:12 +0530
Message-Id: <20210324113012.7564-3-anshuman.gupta@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210324113012.7564-1-anshuman.gupta@intel.com>
References: <20210324113012.7564-1-anshuman.gupta@intel.com>
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
Cc: Anshuman Gupta <anshuman.gupta@intel.com>, ankit.k.nautiyal@intel.com,
 maarten.lankhorst@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix LC_Send_L_Prime message timeout to 16 as documented
in DP HDCP 2.2 errata page 3.

https://www.digital-cp.com/sites/default/files/HDCP%202_2_DisplayPort_Errata_v3_0.pdf

Cc: Ramalingam C <ramalingam.c@intel.com>
Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 include/drm/drm_hdcp.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/drm/drm_hdcp.h b/include/drm/drm_hdcp.h
index 2b165a0f434f..0b1111e3228e 100644
--- a/include/drm/drm_hdcp.h
+++ b/include/drm/drm_hdcp.h
@@ -231,7 +231,7 @@ struct hdcp2_rep_stream_ready {
 #define HDCP_2_2_PAIRING_TIMEOUT_MS		200
 #define HDCP_2_2_DP_PAIRING_READ_TIMEOUT_MS	5
 #define	HDCP_2_2_HDMI_LPRIME_TIMEOUT_MS		20
-#define HDCP_2_2_DP_LPRIME_TIMEOUT_MS		7
+#define HDCP_2_2_DP_LPRIME_TIMEOUT_MS		16
 #define HDCP_2_2_RECVID_LIST_TIMEOUT_MS		3000
 #define HDCP_2_2_STREAM_READY_TIMEOUT_MS	100
 
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
