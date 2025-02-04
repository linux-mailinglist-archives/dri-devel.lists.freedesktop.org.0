Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 318E6A278E5
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2025 18:45:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79C9F10E6D3;
	Tue,  4 Feb 2025 17:45:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="KXIWKy+u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78B2C10E6D3
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Feb 2025 17:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1738691097;
 bh=h2/YGk8VZ37fpLjVEucFjFjkFTBQFTSrdvXH3Dn6gIs=;
 h=From:Date:Subject:To:Cc:From;
 b=KXIWKy+unJTR2OsMm11t/yA64BOeI3hA1ZTIJoNUomwzekdUEliMmTMLgQ0Ff1e2s
 82FnPlyOCqTcCwv7bjc3VaoGSg+/8ebHW4O2PIBOxz0q3ECAE3feS2xESDHAdNOAfI
 /8uoMK2QNfCYgtCJrlhduSBeunbONZ2ko2dqj6TVTzPNoNwTRVr85nkyRew0tbptUp
 U2EzHmdqVxjcO+q0cOhv3ZiAbC0ekdrtQg6gC1Ed/tBEXIfnIC1VA1zj2eGB4uGvGA
 ANufh/IQgYkViBgYfr2IvPdSKYk+Mi34C/fqDlsJPmwcnA5peU4qsIEZHw6iDj/X+1
 CRYHMImr2NLHg==
Received: from localhost (unknown [188.27.43.189])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id A528C17E0FDF;
 Tue,  4 Feb 2025 18:44:57 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 04 Feb 2025 19:44:38 +0200
Subject: [PATCH v2] drm/bridge: dw-hdmi: Sync comment block with actual bus
 formats order
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250204-dw-hdmi-bus-fmt-order-v2-1-d0aaeb7a697a@collabora.com>
X-B4-Tracking: v=1; b=H4sIAAVSomcC/4WNQQ6CMBBFr0Jm7Zi2CgZX3sOw6NBWJgFKpogaw
 t2tXMDle8l/f4XkhX2Ca7GC+IUTxzGDORTQdnZ8eGSXGYwyZ61PCt0LOzcw0jNhGGaM4rzgJVS
 OSkcmKAt5O4kP/N679yZzx2mO8tlvFv2z/4qLRo2lVlQGqqiu1a2NfW8pij22cYBm27YvavKhM
 L4AAAA=
X-Change-ID: 20241130-dw-hdmi-bus-fmt-order-7f6db5db2f0a
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
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

Commit d3d6b1bf85ae ("drm: bridge: dw_hdmi: fix preference of RGB modes
over YUV420") changed the order of the output bus formats, but missed to
update accordingly the "Possible output formats" comment section above
dw_hdmi_bridge_atomic_get_output_bus_fmts().

Fix the misleading comment block and a context related typo.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
Changes in v2:
- Reverted the changes related to "Default 8bit RGB fallback" (Neil)
- Updated slightly the commit subject and description
- Link to v1: https://lore.kernel.org/r/20241130-dw-hdmi-bus-fmt-order-v1-1-510b5fb6b990@collabora.com
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 996733ed2c004c83a989cb8da54d8b630d9f2c02..d1256c82de96a43211af64ad70848cd18d5044e5 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -2621,6 +2621,7 @@ static int dw_hdmi_connector_create(struct dw_hdmi *hdmi)
  * - MEDIA_BUS_FMT_UYYVYY12_0_5X36,
  * - MEDIA_BUS_FMT_UYYVYY10_0_5X30,
  * - MEDIA_BUS_FMT_UYYVYY8_0_5X24,
+ * - MEDIA_BUS_FMT_RGB888_1X24,
  * - MEDIA_BUS_FMT_YUV16_1X48,
  * - MEDIA_BUS_FMT_RGB161616_1X48,
  * - MEDIA_BUS_FMT_UYVY12_1X24,
@@ -2631,7 +2632,6 @@ static int dw_hdmi_connector_create(struct dw_hdmi *hdmi)
  * - MEDIA_BUS_FMT_RGB101010_1X30,
  * - MEDIA_BUS_FMT_UYVY8_1X16,
  * - MEDIA_BUS_FMT_YUV8_1X24,
- * - MEDIA_BUS_FMT_RGB888_1X24,
  */
 
 /* Can return a maximum of 11 possible output formats for a mode/connector */
@@ -2669,7 +2669,7 @@ static u32 *dw_hdmi_bridge_atomic_get_output_bus_fmts(struct drm_bridge *bridge,
 	}
 
 	/*
-	 * If the current mode enforces 4:2:0, force the output but format
+	 * If the current mode enforces 4:2:0, force the output bus format
 	 * to 4:2:0 and do not add the YUV422/444/RGB formats
 	 */
 	if (conn->ycbcr_420_allowed &&

---
base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
change-id: 20241130-dw-hdmi-bus-fmt-order-7f6db5db2f0a

