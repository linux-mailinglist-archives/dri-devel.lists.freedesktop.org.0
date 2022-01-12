Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3078048CA33
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jan 2022 18:47:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C09A10E749;
	Wed, 12 Jan 2022 17:46:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com
 [210.160.252.171])
 by gabe.freedesktop.org (Postfix) with ESMTP id 92BB610E742
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jan 2022 17:46:57 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.88,282,1635174000"; d="scan'208";a="106270383"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
 by relmlie5.idc.renesas.com with ESMTP; 13 Jan 2022 02:46:57 +0900
Received: from localhost.localdomain (unknown [10.226.92.38])
 by relmlir5.idc.renesas.com (Postfix) with ESMTP id E3BDA4000A94;
 Thu, 13 Jan 2022 02:46:54 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>
Subject: [RFC 15/28] drm: rcar_du: Add RCAR_DU_FEATURE_GROUP feature bit
Date: Wed, 12 Jan 2022 17:45:59 +0000
Message-Id: <20220112174612.10773-16-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220112174612.10773-1-biju.das.jz@bp.renesas.com>
References: <20220112174612.10773-1-biju.das.jz@bp.renesas.com>
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
Cc: Chris Paterson <Chris.Paterson2@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 dri-devel@lists.freedesktop.org, Biju Das <biju.das@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Biju Das <biju.das.jz@bp.renesas.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

R-Car has supports DU groups in DU HW, where as it is not supported
in RZ/G2L.

Add RCAR_DU_FEATURE_GROUP feature bit to support RZ/G2L.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_drv.c | 17 +++++++++++++++++
 drivers/gpu/drm/rcar-du/rcar_du_drv.h |  1 +
 2 files changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
index 2c1454731df4..314e865ae67e 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
@@ -42,6 +42,7 @@ static const struct rcar_du_device_info rzg1_du_r8a7743_info = {
 		  | RCAR_DU_FEATURE_INTERLACED
 		  | RCAR_DU_FEATURE_TVM_SYNC
 		  | RCAR_DU_FEATURE_PLANE,
+		  | RCAR_DU_FEATURE_GROUP,
 	.channels_mask = BIT(1) | BIT(0),
 	.routes = {
 		/*
@@ -69,6 +70,7 @@ static const struct rcar_du_device_info rzg1_du_r8a7745_info = {
 		  | RCAR_DU_FEATURE_INTERLACED
 		  | RCAR_DU_FEATURE_TVM_SYNC
 		  | RCAR_DU_FEATURE_PLANE,
+		  | RCAR_DU_FEATURE_GROUP,
 	.channels_mask = BIT(1) | BIT(0),
 	.routes = {
 		/*
@@ -95,6 +97,7 @@ static const struct rcar_du_device_info rzg1_du_r8a77470_info = {
 		  | RCAR_DU_FEATURE_INTERLACED
 		  | RCAR_DU_FEATURE_TVM_SYNC
 		  | RCAR_DU_FEATURE_PLANE,
+		  | RCAR_DU_FEATURE_GROUP,
 	.channels_mask = BIT(1) | BIT(0),
 	.routes = {
 		/*
@@ -127,6 +130,7 @@ static const struct rcar_du_device_info rcar_du_r8a774a1_info = {
 		  | RCAR_DU_FEATURE_INTERLACED
 		  | RCAR_DU_FEATURE_TVM_SYNC
 		  | RCAR_DU_FEATURE_PLANE,
+		  | RCAR_DU_FEATURE_GROUP,
 	.channels_mask = BIT(2) | BIT(1) | BIT(0),
 	.routes = {
 		/*
@@ -161,6 +165,7 @@ static const struct rcar_du_device_info rcar_du_r8a774b1_info = {
 		  | RCAR_DU_FEATURE_INTERLACED
 		  | RCAR_DU_FEATURE_TVM_SYNC
 		  | RCAR_DU_FEATURE_PLANE,
+		  | RCAR_DU_FEATURE_GROUP,
 	.channels_mask = BIT(3) | BIT(1) | BIT(0),
 	.routes = {
 		/*
@@ -193,6 +198,7 @@ static const struct rcar_du_device_info rcar_du_r8a774c0_info = {
 		  | RCAR_DU_FEATURE_CRTC_CLOCK
 		  | RCAR_DU_FEATURE_VSP1_SOURCE
 		  | RCAR_DU_FEATURE_PLANE,
+		  | RCAR_DU_FEATURE_GROUP,
 	.channels_mask = BIT(1) | BIT(0),
 	.routes = {
 		/*
@@ -226,6 +232,7 @@ static const struct rcar_du_device_info rcar_du_r8a774e1_info = {
 		  | RCAR_DU_FEATURE_INTERLACED
 		  | RCAR_DU_FEATURE_TVM_SYNC
 		  | RCAR_DU_FEATURE_PLANE,
+		  | RCAR_DU_FEATURE_GROUP,
 	.channels_mask = BIT(3) | BIT(1) | BIT(0),
 	.routes = {
 		/*
@@ -282,6 +289,7 @@ static const struct rcar_du_device_info rcar_du_r8a7790_info = {
 		  | RCAR_DU_FEATURE_INTERLACED
 		  | RCAR_DU_FEATURE_TVM_SYNC
 		  | RCAR_DU_FEATURE_PLANE,
+		  | RCAR_DU_FEATURE_GROUP,
 	.quirks = RCAR_DU_QUIRK_ALIGN_128B,
 	.channels_mask = BIT(2) | BIT(1) | BIT(0),
 	.routes = {
@@ -317,6 +325,7 @@ static const struct rcar_du_device_info rcar_du_r8a7791_info = {
 		  | RCAR_DU_FEATURE_INTERLACED
 		  | RCAR_DU_FEATURE_TVM_SYNC
 		  | RCAR_DU_FEATURE_PLANE,
+		  | RCAR_DU_FEATURE_GROUP,
 	.channels_mask = BIT(1) | BIT(0),
 	.routes = {
 		/*
@@ -345,6 +354,7 @@ static const struct rcar_du_device_info rcar_du_r8a7792_info = {
 		  | RCAR_DU_FEATURE_INTERLACED
 		  | RCAR_DU_FEATURE_TVM_SYNC
 		  | RCAR_DU_FEATURE_PLANE,
+		  | RCAR_DU_FEATURE_GROUP,
 	.channels_mask = BIT(1) | BIT(0),
 	.routes = {
 		/* R8A7792 has two RGB outputs. */
@@ -369,6 +379,7 @@ static const struct rcar_du_device_info rcar_du_r8a7794_info = {
 		  | RCAR_DU_FEATURE_INTERLACED
 		  | RCAR_DU_FEATURE_TVM_SYNC
 		  | RCAR_DU_FEATURE_PLANE,
+		  | RCAR_DU_FEATURE_GROUP,
 	.channels_mask = BIT(1) | BIT(0),
 	.routes = {
 		/*
@@ -397,6 +408,7 @@ static const struct rcar_du_device_info rcar_du_r8a7795_info = {
 		  | RCAR_DU_FEATURE_INTERLACED
 		  | RCAR_DU_FEATURE_TVM_SYNC
 		  | RCAR_DU_FEATURE_PLANE,
+		  | RCAR_DU_FEATURE_GROUP,
 	.channels_mask = BIT(3) | BIT(2) | BIT(1) | BIT(0),
 	.routes = {
 		/*
@@ -435,6 +447,7 @@ static const struct rcar_du_device_info rcar_du_r8a7796_info = {
 		  | RCAR_DU_FEATURE_INTERLACED
 		  | RCAR_DU_FEATURE_TVM_SYNC
 		  | RCAR_DU_FEATURE_PLANE,
+		  | RCAR_DU_FEATURE_GROUP,
 	.channels_mask = BIT(2) | BIT(1) | BIT(0),
 	.routes = {
 		/*
@@ -469,6 +482,7 @@ static const struct rcar_du_device_info rcar_du_r8a77965_info = {
 		  | RCAR_DU_FEATURE_INTERLACED
 		  | RCAR_DU_FEATURE_TVM_SYNC
 		  | RCAR_DU_FEATURE_PLANE,
+		  | RCAR_DU_FEATURE_GROUP,
 	.channels_mask = BIT(3) | BIT(1) | BIT(0),
 	.routes = {
 		/*
@@ -503,6 +517,7 @@ static const struct rcar_du_device_info rcar_du_r8a77970_info = {
 		  | RCAR_DU_FEATURE_INTERLACED
 		  | RCAR_DU_FEATURE_TVM_SYNC
 		  | RCAR_DU_FEATURE_PLANE,
+		  | RCAR_DU_FEATURE_GROUP,
 	.channels_mask = BIT(0),
 	.routes = {
 		/*
@@ -530,6 +545,7 @@ static const struct rcar_du_device_info rcar_du_r8a7799x_info = {
 		  | RCAR_DU_FEATURE_CRTC_CLOCK
 		  | RCAR_DU_FEATURE_VSP1_SOURCE
 		  | RCAR_DU_FEATURE_PLANE,
+		  | RCAR_DU_FEATURE_GROUP,
 	.channels_mask = BIT(1) | BIT(0),
 	.routes = {
 		/*
@@ -561,6 +577,7 @@ static const struct rcar_du_device_info rcar_du_r8a779a0_info = {
 	.features = RCAR_DU_FEATURE_CRTC_IRQ
 		  | RCAR_DU_FEATURE_VSP1_SOURCE
 		  | RCAR_DU_FEATURE_PLANE,
+		  | RCAR_DU_FEATURE_GROUP,
 	.channels_mask = BIT(1) | BIT(0),
 	.routes = {
 		/* R8A779A0 has two MIPI DSI outputs. */
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.h b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
index 020814e80f50..e28c2df66f8e 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_drv.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
@@ -32,6 +32,7 @@ struct rcar_du_device;
 #define RCAR_DU_FEATURE_INTERLACED	BIT(3)	/* HW supports interlaced */
 #define RCAR_DU_FEATURE_TVM_SYNC	BIT(4)	/* Has TV switch/sync modes */
 #define RCAR_DU_FEATURE_PLANE		BIT(5)	/* HW supports DU planes */
+#define RCAR_DU_FEATURE_GROUP		BIT(6)	/* HW supports DU groups */
 
 #define RCAR_DU_QUIRK_ALIGN_128B	BIT(0)	/* Align pitches to 128 bytes */
 
-- 
2.17.1

