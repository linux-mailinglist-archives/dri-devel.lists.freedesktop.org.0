Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CB8020FF05
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jun 2020 23:30:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A2C16E455;
	Tue, 30 Jun 2020 21:29:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC2CA6E33F;
 Tue, 30 Jun 2020 21:28:56 +0000 (UTC)
IronPort-SDR: wEspbtm5iruCuwnCaorruCZJIQU/zi857cpf9lfwj+u+EP6hlou4zr1Uk909IgmgNBle/LzyEz
 lQIRMM7k6xig==
X-IronPort-AV: E=McAfee;i="6000,8403,9668"; a="143867593"
X-IronPort-AV: E=Sophos;i="5.75,298,1589266800"; d="scan'208";a="143867593"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2020 14:28:56 -0700
IronPort-SDR: sguDhdCat+/LA4+hg8NXaPGq6sUy/veAgm2f77ptytWt/V26FP0E/rtg437j81Jdk4BBS81xx7
 jTKa8q46BsNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,298,1589266800"; d="scan'208";a="481066855"
Received: from hdwiyono-mobl.amr.corp.intel.com (HELO
 achrisan-DESK2.amr.corp.intel.com) ([10.254.176.225])
 by fmsmga006.fm.intel.com with ESMTP; 30 Jun 2020 14:28:55 -0700
From: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
To: dri-devel@lists.freedesktop.org, anitha.chrisanthus@intel.com,
 bob.j.paauwe@intel.com, edmund.j.dea@intel.com
Subject: [PATCH 54/59] drm/kmb: Initialize uninitialized variables
Date: Tue, 30 Jun 2020 14:28:06 -0700
Message-Id: <1593552491-23698-55-git-send-email-anitha.chrisanthus@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1593552491-23698-1-git-send-email-anitha.chrisanthus@intel.com>
References: <1593552491-23698-1-git-send-email-anitha.chrisanthus@intel.com>
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
index 977fcb8..8a12d6d 100644
--- a/drivers/gpu/drm/kmb/kmb_dsi.c
+++ b/drivers/gpu/drm/kmb/kmb_dsi.c
@@ -330,7 +330,7 @@ static struct kmb_dsi_host *kmb_dsi_host_init(struct drm_device *drm,
 
 struct drm_bridge *kmb_dsi_host_bridge_init(struct device *dev)
 {
-	struct drm_bridge *bridge;
+	struct drm_bridge *bridge = NULL;
 #ifndef FCCTEST
 	struct device_node *encoder_node;
 #endif
@@ -838,7 +838,7 @@ static void mipi_tx_hs_tp_gen(struct kmb_drm_private *dev_p, int vc,
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
