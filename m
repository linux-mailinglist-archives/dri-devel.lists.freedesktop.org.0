Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4744EA11CCA
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2025 10:04:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B20DB10E4EC;
	Wed, 15 Jan 2025 09:04:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="wIjUOXoT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC17610E570
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 09:04:00 +0000 (UTC)
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5C22413DE;
 Wed, 15 Jan 2025 10:03:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1736931782;
 bh=mf5laTsJQS47wTWaPVq+HhwOLi61DaR3sotP+bSFleI=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=wIjUOXoTrCAsZyIy6oVy/itUfwQu9oNqpBayUzZ+kYXDQRFzwAZN1uo0dQxq5ZjvO
 l/1S5T4qpNqtLdiuPHQ61LcoEqmOoOujugrnbMr4yoa7RzFNQHooG8YDFgySB4Ii4p
 GrdJKp0l25VnPxV5+grBzfXNGh4aBhF3SnQeYku8=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 15 Jan 2025 11:03:32 +0200
Subject: [PATCH v2 03/10] drm/fourcc: Add DRM_FORMAT_Y8
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250115-xilinx-formats-v2-3-160327ca652a@ideasonboard.com>
References: <20250115-xilinx-formats-v2-0-160327ca652a@ideasonboard.com>
In-Reply-To: <20250115-xilinx-formats-v2-0-160327ca652a@ideasonboard.com>
To: Vishal Sagar <vishal.sagar@amd.com>, 
 Anatoliy Klymenko <anatoliy.klymenko@amd.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Michal Simek <michal.simek@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1945;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=mf5laTsJQS47wTWaPVq+HhwOLi61DaR3sotP+bSFleI=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnh3n5zvpecihnBOCdSx1weKiME2DEAayx1A2jv
 fA/3PoFUBOJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ4d5+QAKCRD6PaqMvJYe
 9QbID/9GekFdMW0H18lXJ9fm5qUiNHHc+Iyzp1+DxUB6NtlHy9niKCNSrBZWEd4r4z6qTOAbURi
 hwUMsuIp8nDWiNdX/XvLmGRTHzrGtyDtvVzodr3xfw5PVFGCqfzHvnpthMdYf2KhjzcBLTiUaA2
 ovvdKHS3MqrgQh7fau3JIDk718kEM4a7yIcboLyzaNYMLtgj6HAPo5JKQyGuccP3AXFHLTzUOXt
 UUe0Rh56/dq7MDi/dIR1Ds+ynsFj5E8jmu39uUTUmQykEE7mDEBn8P5rxsXz48NNaBSeblQscoO
 0kUnLH0xhWwmwACTJ9AZbL+FCfYxj01AX1TJN+ACY9K+DjPKUOWdBvvQGYk2RnA4OWdyIEmM9F2
 NO2yD+SECjt5+cTx4VJ0/olpnmVSEgW3KzMefluX3QuzOVFNKDkRWG93is0FEKY0eEKE1qsbmEn
 uJI9NJzskJuYNTyJw7D5REmCHvd6Yr/7JdiDPINHhJuEgZornrYEX0tZ1bVyk5K3+F+5j8Mhlgt
 OSWALRQtm65G/lJgZ+1YJ4DW0KMXOJ1taHtWh+Rs0nmtk8uRfXst5RJSnvC9+JkZKcUhLTpT3oS
 TrABXctCqUs7Vla74JbQJTvrq3hHZbvTxDPciZCuh9VTRGHUVpQ7f8YxUiaELAS8NblSNiiyGMv
 aPv5VoocYqvqopw==
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

Add greyscale Y8 format.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/drm_fourcc.c  | 1 +
 include/uapi/drm/drm_fourcc.h | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fourcc.c
index adb2d44630ee..d721d9fdbe98 100644
--- a/drivers/gpu/drm/drm_fourcc.c
+++ b/drivers/gpu/drm/drm_fourcc.c
@@ -239,6 +239,7 @@ const struct drm_format_info *__drm_format_info(u32 format)
 		{ .format = DRM_FORMAT_YVU422,		.depth = 0,  .num_planes = 3, .cpp = { 1, 1, 1 }, .hsub = 2, .vsub = 1, .is_yuv = true },
 		{ .format = DRM_FORMAT_YUV444,		.depth = 0,  .num_planes = 3, .cpp = { 1, 1, 1 }, .hsub = 1, .vsub = 1, .is_yuv = true },
 		{ .format = DRM_FORMAT_YVU444,		.depth = 0,  .num_planes = 3, .cpp = { 1, 1, 1 }, .hsub = 1, .vsub = 1, .is_yuv = true },
+		{ .format = DRM_FORMAT_Y8,		.depth = 8,  .num_planes = 1, .cpp = { 1, 0, 0 }, .hsub = 1, .vsub = 1, .is_yuv = true },
 		{ .format = DRM_FORMAT_NV12,		.depth = 0,  .num_planes = 2, .cpp = { 1, 2, 0 }, .hsub = 2, .vsub = 2, .is_yuv = true },
 		{ .format = DRM_FORMAT_NV21,		.depth = 0,  .num_planes = 2, .cpp = { 1, 2, 0 }, .hsub = 2, .vsub = 2, .is_yuv = true },
 		{ .format = DRM_FORMAT_NV16,		.depth = 0,  .num_planes = 2, .cpp = { 1, 2, 0 }, .hsub = 2, .vsub = 1, .is_yuv = true },
diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index 2a00adcfb1ff..f79ee3b93f09 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -405,6 +405,9 @@ extern "C" {
 #define DRM_FORMAT_YUV444	fourcc_code('Y', 'U', '2', '4') /* non-subsampled Cb (1) and Cr (2) planes */
 #define DRM_FORMAT_YVU444	fourcc_code('Y', 'V', '2', '4') /* non-subsampled Cr (1) and Cb (2) planes */
 
+/* Greyscale formats */
+
+#define DRM_FORMAT_Y8		fourcc_code('G', 'R', 'E', 'Y')  /* 8-bit Y-only */
 
 /*
  * Format Modifiers:

-- 
2.43.0

