Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E156830D2
	for <lists+dri-devel@lfdr.de>; Tue, 31 Jan 2023 16:06:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A45610E37F;
	Tue, 31 Jan 2023 15:06:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56B0B10E37A;
 Tue, 31 Jan 2023 15:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675177572; x=1706713572;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vHDge1yJK6lq3uXa5xb4BTQ1eopWsqz1tJIA+5zdtnM=;
 b=SRxBw8G7hHux6311b0onKo/uckEWs+VHQWvO4jkgBZcjVclIkhme0QMC
 e1c6vYNePzVyw1tUNxhzLIgOe/TSwJ7FXQQLMplGPErMqYExZeZSM/5wY
 BTuxP04eiv33bIPa2cBdjzS4mLzwn2D42VLUxy6/5AVpjmgzYk7dNPaeQ
 3jrLXqfi80wnpgAvpODa2tPVzUbTZiP9dhFzeNY40CDlqvPTR5CD+/GIs
 OcyvJOUZJdDQryuORTdcA4xH1NgdxerPeiCr/WuT7tzwvzDCwnnJU11rn
 etDcSsftaMbeQiI2/4CK/xklbcobDuGTBvwFXpIWpYs21mpkHuOiYQ6iz w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="308205606"
X-IronPort-AV: E=Sophos;i="5.97,261,1669104000"; d="scan'208";a="308205606"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2023 07:06:12 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="807155347"
X-IronPort-AV: E=Sophos;i="5.97,261,1669104000"; d="scan'208";a="807155347"
Received: from ideak-desk.fi.intel.com ([10.237.72.58])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2023 07:06:10 -0800
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 13/17] drm/display/dp_mst: Export the DP_PAYLOAD_TABLE_SIZE
 definition
Date: Tue, 31 Jan 2023 17:05:44 +0200
Message-Id: <20230131150548.1614458-14-imre.deak@intel.com>
X-Mailer: git-send-email 2.31.1.189.g2e36527f23
In-Reply-To: <20230131150548.1614458-1-imre.deak@intel.com>
References: <20230131150548.1614458-1-imre.deak@intel.com>
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

In a follow-up workaround for a payload allocation problem the driver
uses DP_PAYLOAD_TABLE_SIZE to determine when the workaround is needed,
so export the definition.

Cc: Lyude Paul <lyude@redhat.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/display/drm_dp_mst_topology.c | 2 --
 include/drm/display/drm_dp.h                  | 2 ++
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
index 47605f67578ad..d0e929df7d088 100644
--- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
@@ -4771,8 +4771,6 @@ static void drm_dp_mst_dump_mstb(struct seq_file *m,
 	}
 }
 
-#define DP_PAYLOAD_TABLE_SIZE		64
-
 static bool dump_dp_payload_table(struct drm_dp_mst_topology_mgr *mgr,
 				  char *buf)
 {
diff --git a/include/drm/display/drm_dp.h b/include/drm/display/drm_dp.h
index bcc5183188a68..8f18f66ff5bc3 100644
--- a/include/drm/display/drm_dp.h
+++ b/include/drm/display/drm_dp.h
@@ -932,6 +932,8 @@
 # define DP_PAYLOAD_ID_SLOT0_6		    (1 << 7)
 # define DP_PAYLOAD_ID_MASK		    0x7f
 
+#define DP_PAYLOAD_TABLE_SIZE		    64
+
 /* Source Device-specific */
 #define DP_SOURCE_OUI			    0x300
 
-- 
2.37.1

