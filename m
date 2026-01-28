Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IKgBJ8ZGemk+5AEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 18:26:30 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F2EDA6DC8
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 18:26:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6150810E74C;
	Wed, 28 Jan 2026 17:26:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="U8HhN0an";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1223E10E742
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 17:26:07 +0000 (UTC)
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 510422813;
 Wed, 28 Jan 2026 18:25:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1769621129;
 bh=UdDzA52TKl45mei5bdLdm5Kee90d3cZZUGKd3QBEtME=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=U8HhN0anf3MeQckAjmiF+Op+8Mi7j/5uKQpdJjEHkKm/xlfF0AkCUlk+9aEXbb6rF
 5KpaTcX85LLOTaPitjSp6T7tklqLGfKdFPIKRoGjtUmUhRjyiHYEFXQndBIZ5KQFoa
 07KRCpRFG+keIZhP1x9G7HKxqYrzTBTdRWzOFv/8=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 28 Jan 2026 19:25:31 +0200
Subject: [PATCH v8 06/11] drm/fourcc: Add DRM_FORMAT_XVUY2101010
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260128-xilinx-formats-v8-6-9ea8adb70269@ideasonboard.com>
References: <20260128-xilinx-formats-v8-0-9ea8adb70269@ideasonboard.com>
In-Reply-To: <20260128-xilinx-formats-v8-0-9ea8adb70269@ideasonboard.com>
To: Vishal Sagar <vishal.sagar@amd.com>, 
 Anatoliy Klymenko <anatoliy.klymenko@amd.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Michal Simek <michal.simek@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Geert Uytterhoeven <geert@linux-m68k.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Pekka Paalanen <ppaalanen@gmail.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2347;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=UdDzA52TKl45mei5bdLdm5Kee90d3cZZUGKd3QBEtME=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBpekakGLx5O67vHi3+kVGDNTWlVeg7//CZPVia+
 byCJzEfog6JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaXpGpAAKCRD6PaqMvJYe
 9enBD/4uoedvPCXL7DrVHTtZU/bEt5cI98bIySQVvairB77KkqCGinlPSC6bUkjtEsw5KD4Sqk3
 PmDvHNUoMPtxK2dgOb3ZSxzbd3KaX55sKubKuBSsn1Hmhc+A0kDPWqrLZhyMe/XPFFNh8wmcN1n
 uLjYsnWJvfGFql5YENX7/Xbv3rk1NxI07SgrVazxT57lViR7IqWLGTZvGuaeeASr03Sc7tJ0kEy
 Q7CogivhqhbWGJB96Fwg4IUY19ianyotT6sIJ6B4+piobRrxdoZKBAcqpDCBMqykUDR/t1IDBU8
 NJX+dZdIKiAzyj0FZ5gaYQrC5L9LdtSJysXCSexrz9bx7+cRBB9BfXSgyJ7nT0VdsqPY1Rjoa63
 q9mHNNzv1vXf9rV/OvES+XiRrfGwOSI71JnXZQrXYYTbtpfMNzb6aLSICKFwm3hNwXOkDWyFWHi
 qY55wYZP2t5SBqttc+S1CXpK+W17JaLWuHt5/6bSGz8qmBQVRDyTN2dXXMd9aK8XJlHK4+lOPea
 1Rc6OSXrtQ/UTPE/wwZvGywJZQh+L6QOYQCs5OHCADShtFIlQ5gtuG9biQGUGrQQmc0pXN65LUV
 i3+mGhEi+Y1iMsA70UM4fol9u6r57GE0RYYy+kbU7DcpWABokvmi3rIvMg0lFQglJi5WJYf4+1N
 n439CT2cWDLOd7Q==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:vishal.sagar@amd.com,m:anatoliy.klymenko@amd.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:laurent.pinchart@ideasonboard.com,m:michal.simek@amd.com,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:geert@linux-m68k.org,m:dmitry.baryshkov@oss.qualcomm.com,m:ppaalanen@gmail.com,m:tomi.valkeinen@ideasonboard.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[tomi.valkeinen@ideasonboard.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,lists.infradead.org,linux-m68k.org,oss.qualcomm.com,gmail.com,ideasonboard.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_TO(0.00)[amd.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,ideasonboard.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[tomi.valkeinen@ideasonboard.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 4F2EDA6DC8
X-Rspamd-Action: no action

Add XVUY2101010, a 10 bits per component YCbCr format in a 32 bit
container.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Vishal Sagar <vishal.sagar@amd.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/drm_fourcc.c  | 1 +
 include/uapi/drm/drm_fourcc.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fourcc.c
index ab643dedd6d4..a736df2de3fc 100644
--- a/drivers/gpu/drm/drm_fourcc.c
+++ b/drivers/gpu/drm/drm_fourcc.c
@@ -288,6 +288,7 @@ const struct drm_format_info *__drm_format_info(u32 format)
 		{ .format = DRM_FORMAT_VYUY,		.depth = 0,  .num_planes = 1, .cpp = { 2, 0, 0 }, .hsub = 2, .vsub = 1, .is_yuv = true },
 		{ .format = DRM_FORMAT_XYUV8888,	.depth = 0,  .num_planes = 1, .cpp = { 4, 0, 0 }, .hsub = 1, .vsub = 1, .is_yuv = true },
 		{ .format = DRM_FORMAT_VUY888,          .depth = 0,  .num_planes = 1, .cpp = { 3, 0, 0 }, .hsub = 1, .vsub = 1, .is_yuv = true },
+		{ .format = DRM_FORMAT_XVUY2101010,     .depth = 0,  .num_planes = 1, .cpp = { 4, 0, 0 }, .hsub = 1, .vsub = 1, .is_yuv = true },
 		{ .format = DRM_FORMAT_AYUV,		.depth = 0,  .num_planes = 1, .cpp = { 4, 0, 0 }, .hsub = 1, .vsub = 1, .has_alpha = true, .is_yuv = true },
 		{ .format = DRM_FORMAT_Y210,            .depth = 0,  .num_planes = 1, .cpp = { 4, 0, 0 }, .hsub = 2, .vsub = 1, .is_yuv = true },
 		{ .format = DRM_FORMAT_Y212,            .depth = 0,  .num_planes = 1, .cpp = { 4, 0, 0 }, .hsub = 2, .vsub = 1, .is_yuv = true },
diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index 0128398b7936..13e3c57046be 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -264,6 +264,7 @@ extern "C" {
 #define DRM_FORMAT_XVUY8888	fourcc_code('X', 'V', 'U', 'Y') /* [31:0] X:Cr:Cb:Y 8:8:8:8 little endian */
 #define DRM_FORMAT_VUY888	fourcc_code('V', 'U', '2', '4') /* [23:0] Cr:Cb:Y 8:8:8 little endian */
 #define DRM_FORMAT_VUY101010	fourcc_code('V', 'U', '3', '0') /* Y followed by U then V, 10:10:10. Non-linear modifier only */
+#define DRM_FORMAT_XVUY2101010	fourcc_code('X', 'Y', '3', '0') /* [31:0] x:Cr:Cb:Y 2:10:10:10 little endian */
 
 /*
  * packed Y2xx indicate for each component, xx valid data occupy msb

-- 
2.43.0

