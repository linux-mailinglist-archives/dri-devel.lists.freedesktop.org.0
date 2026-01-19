Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A4FD39BCB
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 02:12:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEC7F10E312;
	Mon, 19 Jan 2026 01:12:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GZPv+di2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EFCF10E313
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 01:12:14 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-64d0da6019fso364304a12.2
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Jan 2026 17:12:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768785133; x=1769389933; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1/v14AdAvKdOYKZOFFftRQMfCxKt3hfYMcPs2TGZb9c=;
 b=GZPv+di2LAGRT+JQtOiwkqtHPVylxk3WBFZndQ3R8aslBPRae67B+psnQoL1jOGCkR
 CZGPKHAQLf5245PjS4WPlgh/58O0alIVAuigY7uzZ6hjHmT85bhe5egOCjP/wYDsTL1X
 Xfs67hHddLD+oxbWXXZJyGINKwqoSVkS2qkZ7bYvTLVq/QNABiwuyPqOC55yLMiG05+8
 ebz7TTOwK14z1pT6K2LHJXj/YGqztOpKaZqySefyxyjo37GeD06Ey+Q7wzWMej/vCrvN
 +OLXicfMcRlsBIJzscZg1kZZjthh4AN2vrCTj3QmhoB/RIhdP1inpJD0hgng9h0Dm0jz
 6B1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768785133; x=1769389933;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=1/v14AdAvKdOYKZOFFftRQMfCxKt3hfYMcPs2TGZb9c=;
 b=JmX32CcOcq/ATpoj/6xaaZlNmhc2+OV6LMOmkkaoBDYUOxWLfShddDtJYGmJ3YmIHZ
 xZiqYfdKI3Co0iIblJi5QkzqMT2UZOPQoEJkAPyCW12clc01Uy+QmefmzRSYKmcCrPK1
 TEI3lKi2vDJFbbvDSlXTlLMSrJBod35+k3jPatMg3KPjs08+ARvxFPnJFNIe5NJBloD7
 Qta8bIVFvEtzVt/M0sTFYEDLag8CgF5qII1+6EXb61ks3IJ4tNZlwiQK0LDzyuqjzNGs
 3LwiQfov1guYpWyU1xyMa0mblljf+aB6eQgGGbRVYqONK2TedRlH1B/vQuXn5KhtSBqf
 LA+A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVGiJpOax/9DTmh1ibSAbVGEwnE2kNm0EQmKQ7N92NwH6AAuZHdibcttn72fhC7Uf5vI1evU0Bkp2A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzbH39h59ooD1BIm+SkY/wv6WnUkfVJoHvB240R4qUAm32LnbLF
 MCCyf882brV6nBAbtv0pjfdxsbkAs27xlvQ/Pt35O5EYQ/sa5YGAkckf
X-Gm-Gg: AY/fxX5K2j/x7RyKQHiQ3Cv0Mdoqs4ft55zOzd92C/9eW592f/MkfK61DDM4j0ivmiq
 VNsgUmOf8Xl+3SNnDeu4AYtFlWJvvrGs8Sh9XWB8VJq3QbL0k29iaDFlSv6RiZbePf1ZNGwkV7d
 +suXlVPVA7EG9xRO9nxI4TtEc/2E3tv8vaPoM0E0MsgHzBzszFKBZIcznrM3ri1pul6POc/ujJA
 /9dnFqlYP9d8aMAl8bE8D+5TvKPsPGpYscWGd0uwiQobzEAfLA3++/yIr8d3NXP+soElkL+PNFO
 252qJmp+C4m1tqwyQvXePXvjA3C3mIajyVZr/dyk+7StcLFPI7b7L6nIu/NPOpw78Ai6qC6hZye
 9h8ynjYwT4EyFh8HXQzPOw7LlYqJiz9jtv1zbzHyT4mYOqnHl9y0veIcW6BP8O0a/Ltc8EV9NEe
 GOKCuQYrjGEpkyVi5DWZnIME3ujOg3DmM9YOoBdn83sbQATHJQ8AegkFbz+gzHm8hoteEDpwb7Y
 ZA=
X-Received: by 2002:a05:6402:510c:b0:649:b47b:2ef7 with SMTP id
 4fb4d7f45d1cf-65452acc99bmr4627883a12.3.1768785132818; 
 Sun, 18 Jan 2026 17:12:12 -0800 (PST)
Received: from laptok.lan (87-205-5-123.static.ip.netia.com.pl. [87.205.5.123])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-654535c4912sm8989806a12.30.2026.01.18.17.12.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Jan 2026 17:12:12 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: alexander.deucher@amd.com,
	harry.wentland@amd.com,
	sunpeng.li@amd.com
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, siqueira@igalia.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, tomasz.pakula.oficjalny@gmail.com,
 bernhard.berger@gmail.com
Subject: [PATCH 16/17] drm/amd/display: Reintroduce VTEM info frame
Date: Mon, 19 Jan 2026 02:11:45 +0100
Message-ID: <20260119011146.62302-17-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260119011146.62302-1-tomasz.pakula.oficjalny@gmail.com>
References: <20260119011146.62302-1-tomasz.pakula.oficjalny@gmail.com>
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

[Why]
VTEM info fram building was removed back in: commit a9f54ce3c603
("drm/amd/display: Refactoring VTEM"), but it's needed to support
HDMI VRR signalling.

[How]
Build completely new and more robust functions to build out the VTEM
infopacket. Many values are defined but could have added logic in the
future, that's shy they are not static values but already value + bit
position in it's byte.

Reduced blanking detection was previously missing. The standards for
RB and RBv2 use a fixed 160 or 80 lines for the horizontal blank period.
RB v3 can use either 160 or 80. Use this to detect if the current timing
mode uses reduced blankinig.

It doesn't hurt that the new functions look better and cleaner

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 .../amd/display/modules/inc/mod_info_packet.h |   4 +
 .../display/modules/info_packet/info_packet.c | 173 ++++++++++++------
 2 files changed, 116 insertions(+), 61 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/modules/inc/mod_info_packet.h b/drivers/gpu/drm/amd/display/modules/inc/mod_info_packet.h
index 67274ce129bd..7bca0541443c 100644
--- a/drivers/gpu/drm/amd/display/modules/inc/mod_info_packet.h
+++ b/drivers/gpu/drm/amd/display/modules/inc/mod_info_packet.h
@@ -49,6 +49,10 @@ void mod_build_vsc_infopacket(const struct dc_stream_state *stream,
 void mod_build_hf_vsif_infopacket(const struct dc_stream_state *stream,
 		struct dc_info_packet *info_packet);
 
+void mod_build_vtem_infopacket(const struct dc_stream_state *stream,
+		const struct mod_vrr_params *vrr,
+		struct dc_info_packet *infopacket);
+
 enum adaptive_sync_type {
 	ADAPTIVE_SYNC_TYPE_NONE             = 0,
 	ADAPTIVE_SYNC_TYPE_DP               = 1,
diff --git a/drivers/gpu/drm/amd/display/modules/info_packet/info_packet.c b/drivers/gpu/drm/amd/display/modules/info_packet/info_packet.c
index 0db2db7a197f..42a736a5509a 100644
--- a/drivers/gpu/drm/amd/display/modules/info_packet/info_packet.c
+++ b/drivers/gpu/drm/amd/display/modules/info_packet/info_packet.c
@@ -48,80 +48,59 @@ enum vsc_packet_revision {
 	vsc_packet_rev7 = 7,
 };
 
+#define HDMI_INFOFRAME_TYPE_EMP    0x7F
 #define HDMI_INFOFRAME_TYPE_VENDOR 0x81
 #define HDMI_INFOFRAME_LENGTH_MASK 0x1F
 #define HF_VSIF_VERSION  1
 #define HF_VSIF_3D_BIT   0
 #define HF_VSIF_ALLM_BIT 1
 
-// VTEM Byte Offset
-#define VTEM_PB0		0
-#define VTEM_PB1		1
-#define VTEM_PB2		2
-#define VTEM_PB3		3
-#define VTEM_PB4		4
-#define VTEM_PB5		5
-#define VTEM_PB6		6
+#define VTEM_ORG_ID          1
+#define VTEM_DATA_SET_TAG    1
+#define VTEM_DATA_SET_LENGTH 4
 
-#define VTEM_MD0		7
-#define VTEM_MD1		8
-#define VTEM_MD2		9
-#define VTEM_MD3		10
+#define VTEM_M_CONST    0
+#define VTEM_FVA_FACTOR 0
 
+#define VTEM_BRR_MASK_UPPER 0x03
+#define VTEM_BRR_MASK_LOWER 0xFF
 
-// VTEM Byte Masks
-//PB0
-#define MASK_VTEM_PB0__RESERVED0  0x01
-#define MASK_VTEM_PB0__SYNC       0x02
-#define MASK_VTEM_PB0__VFR        0x04
-#define MASK_VTEM_PB0__AFR        0x08
-#define MASK_VTEM_PB0__DS_TYPE    0x30
-	//0: Periodic pseudo-static EM Data Set
-	//1: Periodic dynamic EM Data Set
-	//2: Unique EM Data Set
-	//3: Reserved
-#define MASK_VTEM_PB0__END        0x40
-#define MASK_VTEM_PB0__NEW        0x80
+/* VTEM Byte Offset */
+#define VTEM_PB0 0
+#define VTEM_PB1 1
+#define VTEM_PB2 2
+#define VTEM_PB3 3
+#define VTEM_PB4 4
+#define VTEM_PB5 5
+#define VTEM_PB6 6
 
-//PB1
-#define MASK_VTEM_PB1__RESERVED1 0xFF
+#define VTEM_MD0 7
+#define VTEM_MD1 8
+#define VTEM_MD2 9
+#define VTEM_MD3 10
 
-//PB2
-#define MASK_VTEM_PB2__ORGANIZATION_ID 0xFF
-	//0: This is a Vendor Specific EM Data Set
-	//1: This EM Data Set is defined by This Specification (HDMI 2.1 r102.clean)
-	//2: This EM Data Set is defined by CTA-861-G
-	//3: This EM Data Set is defined by VESA
-//PB3
-#define MASK_VTEM_PB3__DATA_SET_TAG_MSB    0xFF
-//PB4
-#define MASK_VTEM_PB4__DATA_SET_TAG_LSB    0xFF
-//PB5
-#define MASK_VTEM_PB5__DATA_SET_LENGTH_MSB 0xFF
-//PB6
-#define MASK_VTEM_PB6__DATA_SET_LENGTH_LSB 0xFF
+/* Extended Metadata Packet */
+/* Header */
+#define EMP_LAST_BIT  6
+#define EMP_FIRST_BIT 7
+/* PB0 */
+#define EMP_SNC_BIT 1
+#define EMP_VFR_BIT 2
+#define EMP_AFR_BIT 3
+#define EMP_DST_BIT 4
+#define EMP_END_BIT 6
+#define EMP_NEW_BIT 7
+/* PB7 = MD0 */
+#define VTEM_VRR_BIT     0
+#define VTEM_M_CONST_BIT 1
+#define VTEM_FVA_BIT     4
+/* MD1 Base_Vfront */
+/* MD2 */
+#define VTEM_BRR_UPPER_BIT 0
+#define VTEM_RB_BIT        2
+/* MD3 BRR Lower */
 
 
-
-//PB7-27 (20 bytes):
-//PB7 = MD0
-#define MASK_VTEM_MD0__VRR_EN         0x01
-#define MASK_VTEM_MD0__M_CONST        0x02
-#define MASK_VTEM_MD0__QMS_EN         0x04
-#define MASK_VTEM_MD0__RESERVED2      0x08
-#define MASK_VTEM_MD0__FVA_FACTOR_M1  0xF0
-
-//MD1
-#define MASK_VTEM_MD1__BASE_VFRONT    0xFF
-
-//MD2
-#define MASK_VTEM_MD2__BASE_REFRESH_RATE_98  0x03
-#define MASK_VTEM_MD2__RB                    0x04
-#define MASK_VTEM_MD2__NEXT_TFR              0xF8
-
-//MD3
-#define MASK_VTEM_MD3__BASE_REFRESH_RATE_07  0xFF
-
 enum ColorimetryRGBDP {
 	ColorimetryRGB_DP_sRGB               = 0,
 	ColorimetryRGB_DP_AdobeRGB           = 3,
@@ -611,6 +590,78 @@ void mod_build_hf_vsif_infopacket(const struct dc_stream_state *stream,
 		info_packet->valid = true;
 }
 
+static void build_vtem_infopacket_header(struct dc_info_packet *infopacket)
+{
+	uint8_t pb0 = 0;
+
+	/* might need logic in the future */
+	pb0 |= 0 << EMP_SNC_BIT;
+	pb0 |= 1 << EMP_VFR_BIT;
+	pb0 |= 0 << EMP_AFR_BIT;
+	pb0 |= 0 << EMP_DST_BIT;
+	pb0 |= 0 << EMP_END_BIT;
+	pb0 |= 1 << EMP_NEW_BIT;
+
+	infopacket->hb0 = HDMI_INFOFRAME_TYPE_EMP;
+	infopacket->hb1 = (1 << EMP_FIRST_BIT) | (1 << EMP_LAST_BIT);
+	infopacket->hb2 = 0; // sequence
+
+	infopacket->sb[VTEM_PB0] = pb0;
+	infopacket->sb[VTEM_PB2] = VTEM_ORG_ID;
+	infopacket->sb[VTEM_PB4] = VTEM_DATA_SET_TAG;
+	infopacket->sb[VTEM_PB6] = VTEM_DATA_SET_LENGTH;
+}
+
+static void build_vtem_infopacket_data(const struct dc_stream_state *stream,
+		const struct mod_vrr_params *vrr,
+		struct dc_info_packet *infopacket)
+{
+	unsigned int brr = 0;
+	bool hdmi_vic_mode = false;
+	bool vrr_active = false;
+	bool rb = false;
+
+	hdmi_vic_mode = is_hdmi_vic_mode(stream);
+	vrr_active = vrr->state == VRR_STATE_ACTIVE_VARIABLE ||
+		     vrr->state == VRR_STATE_ACTIVE_FIXED;
+
+	infopacket->sb[VTEM_MD0] = VTEM_M_CONST << VTEM_M_CONST_BIT;
+	infopacket->sb[VTEM_MD0] |= VTEM_FVA_FACTOR << VTEM_FVA_BIT;
+	infopacket->sb[VTEM_MD0] |= vrr_active << VTEM_VRR_BIT;
+
+	infopacket->sb[VTEM_MD1] = 0;
+	infopacket->sb[VTEM_MD2] = 0;
+	infopacket->sb[VTEM_MD3] = 0;
+
+	if (hdmi_vic_mode || !vrr_active)
+		return;
+	/*
+	 * Reduced Blanking standard defines a fixed value of
+	 * 160 for hblank, further reduced to 80 in RB2
+	 */
+	rb = (stream->timing.h_total - stream->timing.h_addressable) <= 160;
+	brr = mod_freesync_calc_nominal_field_rate(stream) / 1000000;
+
+	if (brr > VTEM_BRR_MAX) {
+		infopacket->valid = false;
+		return;
+	}
+
+	infopacket->sb[VTEM_MD1] = (uint8_t) stream->timing.v_front_porch;
+	infopacket->sb[VTEM_MD2] = rb << VTEM_RB_BIT;
+	infopacket->sb[VTEM_MD2] |= (brr & VTEM_BRR_MASK_UPPER) >> 8;
+	infopacket->sb[VTEM_MD3] = brr & VTEM_BRR_MASK_LOWER;
+}
+
+void mod_build_vtem_infopacket(const struct dc_stream_state *stream,
+		const struct mod_vrr_params *vrr,
+		struct dc_info_packet *infopacket)
+{
+	infopacket->valid = true;
+	build_vtem_infopacket_header(infopacket);
+	build_vtem_infopacket_data(stream, vrr, infopacket);
+}
+
 void mod_build_adaptive_sync_infopacket(const struct dc_stream_state *stream,
 		enum adaptive_sync_type asType,
 		const struct AS_Df_params *param,
-- 
2.52.0

