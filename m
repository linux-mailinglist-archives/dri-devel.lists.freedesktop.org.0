Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 145D4C60E0B
	for <lists+dri-devel@lfdr.de>; Sun, 16 Nov 2025 01:27:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4501210E08B;
	Sun, 16 Nov 2025 00:27:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=rocketmail.com header.i=@rocketmail.com header.b="Bm/u36Ea";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sonic315-21.consmr.mail.ne1.yahoo.com
 (sonic315-21.consmr.mail.ne1.yahoo.com [66.163.190.147])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82F6C10E08B
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Nov 2025 00:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rocketmail.com; s=s2048;
 t=1763252855; bh=Ks8oA+v8U4GnV5JtinNSiCl0jK6wTktXlBSnGIl6EOI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject:Reply-To;
 b=Bm/u36Ear56AQ28uUfe6GYqobwphfLbfIQFKYdeUQL1A6fHZuFFkDwsukjE2NBVTVjUiq8rawM403VcoWrUpnGAiLJe1D1jP0Q6WbFEKxjDPX7LaAgxuBrbaZQvDQY5GUlFkenU0dL+2Y8mfb0nZ69OPJcmXuwNNyxUZ9suy/BrJU/ZyeWNt8oVy2rOij8iGGZ2pwRsBYXdVqr5J3R+ct1kB9d6+1J6xYLVHZXopLEpHxcXE+dvQ7v8j+AB4fkhipEcbvgVB2C1Z60vykhcGngX+mlFYNbkNTLPJEJP4K8dUCIO8tDIPYcwYmutDp0TGIFJ/1E4lAEeCEvkgqRhLSw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1763252855; bh=Q1Q+hgnJwnY6YD8StGSid56kzoUdHaOK50Fa+PNlu+i=;
 h=X-Sonic-MF:From:To:Subject:Date:From:Subject;
 b=QI9QEiEHOrCoyg6k8XqRwaGsJUMgfO3mPuXZGg9AxTMjfkr2SwB11oXD1bIk5GRU2S77gumjeapxPQd/glYLd6DldAdrnboRV1/0e2CsxFurTzTKbX0Pzjmi7oB2X00uJ8EGwcR3+jVy9mbPJQALpu5AaFB+/zYSbXXOBTn0lA+YCrlTp1Ia/yi+jqhKhMziuxAIjHmUa3Wy8pOXxwjwWkyOyUVAdfZ0pya/jjlS06erZSF3TB4yDarZ6RQAHKxyJ6ml7og1ptPU7nzuTiePNlFOaTL8AjJebVJJEndiS2+uxA0fDZR+FsWu5v+ygltGgrqTcLO5xWO9WLfHMg7VSQ==
X-YMail-OSG: 3uT89z8VM1kyAB675ZTQfMyFO8tT8G1wsz_D_Ra2tZoUsr6nCzGa09XtY7UgEeb
 tnQlR9BhOixnD2.oyWt4CDQPHL6QsKQblYW4roO_FORxXuO58Wc59gxm_tPo6fqMqr4i36JUnPq4
 JKJpnrTvtZu_JsRaUojsTeOzWZaKMZXQbJzEiZwQSejHX_3u.pSS_RVVmbq7ierBaa2aYvhWPjZ0
 HGKvAxviY234dVKVv1AH9LPVJCzqnkuwLzMCSt7TFU9b.Rn5vTU2jTKcQybmrnjzo89FWCREEYDD
 h9LlXBlS9xGVqnfZgp_N65Em_FgK2g9O1mZOsPMW_hR.KE4RtHnJnsxiP_1rvuj8eH37jup_TYZi
 z8nTgfwLYpPZTrVS.CPPXwuELwjec6yQfwTtde7CF7fnSwCnYASFJ5.O1L5zs1bG2g1KDMyzGd9V
 PsTdZkbMybiIQXqluaQe79MibYRK0sfkXPdbiDqqZzOHnCQDoEdrxQ6T89lw5.MC9CXumah.d8fn
 sLVPJxWVWWelcDNgdD436uCPuzo1jqPxEA1mum8DVL36KYtqxnoI0GoyZGUMBbu2S8qAS4BFP0uS
 .db11xyav50E.PA1JPTcv9pSViBovIxDZzvVLODLOPJg438CEQyy0ORwHjmrPqLEWOUcDFt.vOAD
 5aOz_hUQnbXHMJm0znsv5EkP1V5IqrX6v70Z3K9LliW3OFDWx3lAburHfUzR0TaAwVbgPJAfKYoW
 VwIEmKMtTAZB73UuaLvUbYzOjisKeEl2fRXAZIvdesyJ2ayl6WxzQQe1FsgZeSgoEaMNmELlv.Yu
 Pztag._1Nn3_pzTHY2XLIyuwTZatSEulXq3raDSBXN3PgIYDFkF0ik2Dp5uJ7Eax8LiHPREYKNWs
 MHm0Kb8pxFOkGaPurbKWASJiRpvMfxQ2CwxmhqZ0JuSaheHsihamC60dHhNKeKxim0WkV5peDNeI
 3jtK8hxf7OGwMn1PMk98X6QAi2FJ4UhvSOWrvIT.arPgKQfinJlNnb_YSyMWu0NgjSHAxJXXrwyO
 BIjdtHF0A_9QFiCYzfibojUv4t0kRq8jJLzEQZCGMzINgAAma_81V4wsV70D8YiuYv3cIpmFZL6R
 Q9WioQ2nKFWLzEHscC3aI5amJaaerNM8tQkc22KB3iw0sSOoIsxGXdn55FVk0ZtVo8CMj1KdU2rO
 Pgm2esbZyHsD55oykhh4WHVHS1ZrFvmGCNLKS76rRGInveo6Kr4asvayY5nlSZTozhc9kGIGxFTE
 pvMH7cdYTCZQmY6aPcCJErILbD7NKD4FO.f2NI.ArmOQ50VSTPHrWOBJCUSSGxm6Cu8RPRnaA6eE
 2Rtifzh5LrDPQLYEu2WEUdXY0Vyn0Rc.6ahTjPwmg2E85AD5bbUahZPrr86ck_Yc1vkGuNwvg0gx
 E8gHVrwbafxvL5.TnPrLyoV1D5BUq_ChNTtZwBOyS0O_Zeu8fUpeYpxYZr0eyyGJ6RwikGGjKpjy
 n6GMOA2Ia6nY.SLI0huW8f_Ht9o8sZd2zL1Ier8dEqQdDp7pEcUqIL1V6T2fSwnSVnTvP9PEafOo
 lbUCRrU_KLdSdnxd9RmvFjWd75Xgwy0Hr_MLKkYUSeT6OjF3HtKHV962yUWGCglLGrk6QnYmcxyp
 Pd8hUyB4AZ2fw_6DCrhP6xWDT5A3kWgIugKcW8D1wwUnLpUjzKYej07AXss_uwTHlWjudrb0KVgm
 _e6GOVFn1wFaZdF7nDUcVsatgwmk8c8WvXtuTrmgK.xl66yWs5DeAfhhZXRz.Vz6VCEHrDITSDyl
 kxC1rAxbRpYMO9ptyUfsbHWKL2wg49JASi4Ubj7N.t0tzZHxzEiCxKuxVtPtX1C7r8iQWeHJ7N9D
 bvFapA3ojs3omEmlL95jqUucmqJvGKC9SUBL4bocoZhUocVqv1x6PGrOoqFUJiGmTcVrQTyjtlRB
 ZxinL2gblky3dHWjvKnragkVHrNGpUlIjviunfpmrbsopRl.423ci8T3dcmWsYu8wJ5qqfnWus3o
 RSUNjyIUy78mFRJy0xaYqj81.Lg6HWnjSwdxUQfXqS.3Fg6M1W7DRszYy30YvMa6W7eXE8l3jm0p
 5lZGLrhsGu2Iz6LBmb6fq_Ern6441iTIP6WIxWG20sIPMWOsWoVWQ5VUpRtSSIKFpmrALQ_WXMxt
 5B_pUBuvyFR5fTQ.o4GpEX0rFB7oKU744ZX1wsLpj4mdn7yF9V6Q9vXUw1lipMZEd66RQNI._zDC
 .ZUBFHck8IYYU4CxM1Tj7FO_Y6BoBf2WdfOSzL5usltqFUpABWFsWBnxjH2ZGNlaKadaJRcIErF0
 UzbOaSX._bZqPSHWM4wH9K3Bb5JVuiPpzU4vg_1gg_TSVIw--
X-Sonic-MF: <lxrmrz732@rocketmail.com>
X-Sonic-ID: d62da9a3-a96f-444a-a676-a9bdb67a3c9c
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic315.consmr.mail.ne1.yahoo.com with HTTP; Sun, 16 Nov 2025 00:27:35 +0000
Received: by hermes--production-bf1-58477f5468-k9hpl (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 3a3c42801977728ceadb395fe82b8b03; 
 Sun, 16 Nov 2025 00:27:33 +0000 (UTC)
From: lxrmrz732@rocketmail.com
To: lyude@redhat.com,
	dakr@kernel.org,
	airlied@gmail.com
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 Alex Ramirez <lxrmrz732@rocketmail.com>
Subject: [PATCH v3 1/2][RESEND] drm/nouveau: add missing DCB connector types
Date: Sat, 15 Nov 2025 19:21:16 -0500
Message-ID: <20251116002628.21930-2-lxrmrz732@rocketmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251116002628.21930-1-lxrmrz732@rocketmail.com>
References: <20251116002628.21930-1-lxrmrz732@rocketmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Alex Ramirez <lxrmrz732@rocketmail.com>

* Add missing DCB connectors in conn.h as per the NVIDIA DCB specification.

A lot of connector logic was rewritten for Linux v6.5; some display connector types
went unaccounted-for which caused kernel warnings on devices with the now-unsupported
DCB connectors. This patch adds all of the DCB connectors as defined by NVIDIA to the
dcb_connector_type enum to bring back support for these connectors to the new logic.

Fixes: 8b7d92cad953 ("drm/nouveau/kms/nv50-: create connectors based on nvkm info")
Link: https://download.nvidia.com/open-gpu-doc/DCB/1/DCB-4.0-Specification.html#_connector_table_entry
Signed-off-by: Alex Ramirez <lxrmrz732@rocketmail.com>
---
 .../nouveau/include/nvkm/subdev/bios/conn.h   | 84 ++++++++++++++-----
 1 file changed, 63 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/bios/conn.h b/drivers/gpu/drm/nouveau/include/nvkm/subdev/bios/conn.h
index d1beaad0c82b..538306522d9a 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/subdev/bios/conn.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/bios/conn.h
@@ -1,28 +1,70 @@
 /* SPDX-License-Identifier: MIT */
 #ifndef __NVBIOS_CONN_H__
 #define __NVBIOS_CONN_H__
+
 enum dcb_connector_type {
-	DCB_CONNECTOR_VGA = 0x00,
-	DCB_CONNECTOR_TV_0 = 0x10,
-	DCB_CONNECTOR_TV_1 = 0x11,
-	DCB_CONNECTOR_TV_3 = 0x13,
-	DCB_CONNECTOR_DVI_I = 0x30,
-	DCB_CONNECTOR_DVI_D = 0x31,
-	DCB_CONNECTOR_DMS59_0 = 0x38,
-	DCB_CONNECTOR_DMS59_1 = 0x39,
-	DCB_CONNECTOR_LVDS = 0x40,
-	DCB_CONNECTOR_LVDS_SPWG = 0x41,
-	DCB_CONNECTOR_DP = 0x46,
-	DCB_CONNECTOR_eDP = 0x47,
-	DCB_CONNECTOR_mDP = 0x48,
-	DCB_CONNECTOR_HDMI_0 = 0x60,
-	DCB_CONNECTOR_HDMI_1 = 0x61,
-	DCB_CONNECTOR_HDMI_C = 0x63,
-	DCB_CONNECTOR_DMS59_DP0 = 0x64,
-	DCB_CONNECTOR_DMS59_DP1 = 0x65,
-	DCB_CONNECTOR_WFD	= 0x70,
-	DCB_CONNECTOR_USB_C = 0x71,
-	DCB_CONNECTOR_NONE = 0xff
+	/* Analog outputs */
+	DCB_CONNECTOR_VGA = 0x00,		// VGA 15-pin connector
+	DCB_CONNECTOR_DVI_A = 0x01,		// DVI-A
+	DCB_CONNECTOR_POD_VGA = 0x02,		// Pod - VGA 15-pin connector
+	DCB_CONNECTOR_TV_0 = 0x10,		// TV - Composite Out
+	DCB_CONNECTOR_TV_1 = 0x11,		// TV - S-Video Out
+	DCB_CONNECTOR_TV_2 = 0x12,		// TV - S-Video Breakout - Composite
+	DCB_CONNECTOR_TV_3 = 0x13,		// HDTV Component - YPrPb
+	DCB_CONNECTOR_TV_SCART = 0x14,		// TV - SCART Connector
+	DCB_CONNECTOR_TV_SCART_D = 0x16,	// TV - Composite SCART over D-connector
+	DCB_CONNECTOR_TV_DTERM = 0x17,		// HDTV - D-connector (EIAJ4120)
+	DCB_CONNECTOR_POD_TV_3 = 0x18,		// Pod - HDTV - YPrPb
+	DCB_CONNECTOR_POD_TV_1 = 0x19,		// Pod - S-Video
+	DCB_CONNECTOR_POD_TV_0 = 0x1a,		// Pod - Composite
+
+	/* DVI digital outputs */
+	DCB_CONNECTOR_DVI_I_TV_1 = 0x20,	// DVI-I-TV-S-Video
+	DCB_CONNECTOR_DVI_I_TV_0 = 0x21,	// DVI-I-TV-Composite
+	DCB_CONNECTOR_DVI_I_TV_2 = 0x22,	// DVI-I-TV-S-Video Breakout-Composite
+	DCB_CONNECTOR_DVI_I = 0x30,		// DVI-I
+	DCB_CONNECTOR_DVI_D = 0x31,		// DVI-D
+	DCB_CONNECTOR_DVI_ADC = 0x32,		// Apple Display Connector (ADC)
+	DCB_CONNECTOR_DMS59_0 = 0x38,		// LFH-DVI-I-1
+	DCB_CONNECTOR_DMS59_1 = 0x39,		// LFH-DVI-I-2
+	DCB_CONNECTOR_BNC = 0x3c,		// BNC Connector [for SDI?]
+
+	/* LVDS / TMDS digital outputs */
+	DCB_CONNECTOR_LVDS = 0x40,		// LVDS-SPWG-Attached [is this name correct?]
+	DCB_CONNECTOR_LVDS_SPWG = 0x41,		// LVDS-OEM-Attached (non-removable)
+	DCB_CONNECTOR_LVDS_REM = 0x42,		// LVDS-SPWG-Detached [following naming above]
+	DCB_CONNECTOR_LVDS_SPWG_REM = 0x43,	// LVDS-OEM-Detached (removable)
+	DCB_CONNECTOR_TMDS = 0x45,		// TMDS-OEM-Attached (non-removable)
+
+	/* DP digital outputs */
+	DCB_CONNECTOR_DP = 0x46,		// DisplayPort External Connector
+	DCB_CONNECTOR_eDP = 0x47,		// DisplayPort Internal Connector
+	DCB_CONNECTOR_mDP = 0x48,		// DisplayPort (Mini) External Connector
+
+	/* Dock outputs (not used) */
+	DCB_CONNECTOR_DOCK_VGA_0 = 0x50,	// VGA 15-pin if not docked
+	DCB_CONNECTOR_DOCK_VGA_1 = 0x51,	// VGA 15-pin if docked
+	DCB_CONNECTOR_DOCK_DVI_I_0 = 0x52,	// DVI-I if not docked
+	DCB_CONNECTOR_DOCK_DVI_I_1 = 0x53,	// DVI-I if docked
+	DCB_CONNECTOR_DOCK_DVI_D_0 = 0x54,	// DVI-D if not docked
+	DCB_CONNECTOR_DOCK_DVI_D_1 = 0x55,	// DVI-D if docked
+	DCB_CONNECTOR_DOCK_DP_0 = 0x56,		// DisplayPort if not docked
+	DCB_CONNECTOR_DOCK_DP_1 = 0x57,		// DisplayPort if docked
+	DCB_CONNECTOR_DOCK_mDP_0 = 0x58,	// DisplayPort (Mini) if not docked
+	DCB_CONNECTOR_DOCK_mDP_1 = 0x59,	// DisplayPort (Mini) if docked
+
+	/* HDMI? digital outputs */
+	DCB_CONNECTOR_HDMI_0 = 0x60,		// 3-Pin DIN Stereo Connector [for real?]
+	DCB_CONNECTOR_HDMI_1 = 0x61,		// HDMI-A connector
+	DCB_CONNECTOR_SPDIF = 0x62,		// Audio S/PDIF connector
+	DCB_CONNECTOR_HDMI_C = 0x63,		// HDMI-C (Mini) connector
+
+	/* Misc. digital outputs */
+	DCB_CONNECTOR_DMS59_DP0 = 0x64,		// LFH-DP-1
+	DCB_CONNECTOR_DMS59_DP1 = 0x65,		// LFH-DP-2
+	DCB_CONNECTOR_WFD = 0x70,		// Virtual connector for Wifi Display (WFD)
+	DCB_CONNECTOR_USB_C = 0x71,		// [DP over USB-C; not present in docs]
+	DCB_CONNECTOR_NONE = 0xff		// Skip Entry
 };
 
 struct nvbios_connT {
-- 
2.51.1

