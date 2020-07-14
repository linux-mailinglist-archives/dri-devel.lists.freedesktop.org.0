Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAC5221FF61
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jul 2020 23:00:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD84A6E9ED;
	Tue, 14 Jul 2020 20:59:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FBD66E9A0;
 Tue, 14 Jul 2020 20:58:48 +0000 (UTC)
IronPort-SDR: 7vsU3Trq6MA8RIpHJZex+xb1YccwI/1/2jn6AdpMx8Jsh779t640XNqJS874/+6E0PWa+N0+jQ
 NdtMYqvtRnYQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9682"; a="150444627"
X-IronPort-AV: E=Sophos;i="5.75,352,1589266800"; d="scan'208";a="150444627"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2020 13:58:48 -0700
IronPort-SDR: //oBjOSUB9jRt2wNCsW48CXGhxIs4CiET7pc3rsUmyq/Mlg5qWR+3ELLfK97X3XihOijVF7DbG
 G/Vr5WetZ5iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,352,1589266800"; d="scan'208";a="316504310"
Received: from ahanamuk-mobl.amr.corp.intel.com (HELO
 achrisan-DESK2.amr.corp.intel.com) ([10.251.155.61])
 by orsmga008.jf.intel.com with ESMTP; 14 Jul 2020 13:58:47 -0700
From: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
To: dri-devel@lists.freedesktop.org, anitha.chrisanthus@intel.com,
 bob.j.paauwe@intel.com, edmund.j.dea@intel.com
Subject: [PATCH v2 54/59] drm/kmb: Initialize uninitialized variables
Date: Tue, 14 Jul 2020 13:57:40 -0700
Message-Id: <1594760265-11618-55-git-send-email-anitha.chrisanthus@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1594760265-11618-1-git-send-email-anitha.chrisanthus@intel.com>
References: <1594760265-11618-1-git-send-email-anitha.chrisanthus@intel.com>
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
Cc: daniel.vetter@intel.com, intel-gfx@lists.freedesktop.org,
 rodrigo.vivi@intel.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

general cleaning

Signed-off-by: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
---
 drivers/gpu/drm/kmb/kmb_dsi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/kmb/kmb_dsi.c b/drivers/gpu/drm/kmb/kmb_dsi.c
index 6e38f16..2599ed2 100644
--- a/drivers/gpu/drm/kmb/kmb_dsi.c
+++ b/drivers/gpu/drm/kmb/kmb_dsi.c
@@ -307,7 +307,7 @@ static struct kmb_dsi_host *kmb_dsi_host_init(struct drm_device *drm,
 
 struct drm_bridge *kmb_dsi_host_bridge_init(struct device *dev)
 {
-	struct drm_bridge *bridge;
+	struct drm_bridge *bridge = NULL;
 #ifndef FCCTEST
 	struct device_node *encoder_node;
 #endif
@@ -815,7 +815,7 @@ static void mipi_tx_hs_tp_gen(struct kmb_drm_private *dev_p, int vc,
 static u32 mipi_tx_init_cntrl(struct kmb_drm_private *dev_p,
 			      struct mipi_ctrl_cfg *ctrl_cfg)
 {
-	u32 ret;
+	u32 ret = 0;
 	u8 active_vchannels = 0;
 	u8 frame_id, sect;
 	u32 bits_per_pclk = 0;
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
