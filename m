Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oAu/A8FJk2mi3AEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 17:45:53 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B26341465A5
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 17:45:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA76F10E3C3;
	Mon, 16 Feb 2026 16:45:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Hl8e2TC/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9615110E3CE
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 16:45:44 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-b8f7fd33bd2so48126266b.3
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 08:45:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771260343; x=1771865143; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=64IsVCE74snW/ULFFs+5rGbGOSbjn54hzMpEOh8RMo0=;
 b=Hl8e2TC/EO1xYf0gsV2ZFYi3SyfRCiFPruOg5VWRTMexdj+SS8bbl6ty+y/3HBg/h0
 Rr9VImn3wSSlCDYabF4Q2EBlQywn9Pp8+GPwjF4SciNqguID7G8+bD5c/o2osunj1NpA
 S8OeFLWN5WCVoiYUgyGZb8QG5P5uqtipk8s42TIKOxhBfBH7uiemjWhKsf/73hjeCeju
 E9tcieFtaZUNXxUDubKGBpQxs+EeUpWvvZ6ffPPLn8chRHY1j2D9vIfQEgg5UGpvDF4R
 bonRB+5Ma08Ny7fadqYkidcl+IufK49K8q6NAMXA3trHXbXNqPdhkNdigWyx3pAvkhMs
 YxDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771260343; x=1771865143;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=64IsVCE74snW/ULFFs+5rGbGOSbjn54hzMpEOh8RMo0=;
 b=w6n+WzyUyWIoO0DJeNfRQ64+8rwFCEpDPJKvOvFcqfIKfl+csHTWT/92x10d5H7Fv/
 xv++0+URwCrtlaFiUDndBG0+tYVo9r8i5QChbzTTCI1xTBtyoVq/CVuHSGHnU1p8YnV6
 NG2RyEtMRhu2nkiLeG71xrEtWwuRf4tdKhmxTbtqqe+XYpcNUGYVrsFw3p77ISnYhXqP
 Dw3U022Mf4NQ8TyifWmZ9hBvpCmiXoBxIDrGvvEhMf1o6uHqjs2aQMWKgCmcJyvH6Wpt
 TK8w1WgA6P3XmOFGV+CuSZp8ngZpE8F24n5ULwocMlOaqVKVrloqc1sto9bSkNG+bN8p
 P2lw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWbH0UGTHWFKYzds/yBvKgT9WGSkEbRpYxZgE8sdSNKOWDNWFFQ7Nw8AzQuUhF5QHzlbBW7Xj/4Jco=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyG8rTqThzcIOn/E8Z3kbcw+76b/+KEALYnxBh2W6cwVhzUS3PU
 FIG9+CleHHZdLciUASJxL65vjjlTZU6YenskwNLSjPcM4wI3ZQ1kd1YR
X-Gm-Gg: AZuq6aIcdjSpBz3ELkudrk28TByw/UZ/dL8uo93Szouj8Ia+pMspIA+PSIV1RvDpKN6
 aGxgxcVtF3tJyNnwdFiUP7gEIHYXxN6lZ5qK3LcGaqwgv0hjn/4aKAmeD06Oos4FNgX/Wskbufl
 MDzxAs4lwP8d869/T8qx+k22OJtJV6xL0Tg+RS4UlqPh52ycOvCsNjpDNpqkrgtA9yFmmOSTAQ3
 GJ5gUHCEtgrcy1+S3ijg8BxQb1NqrKdDcmZVapAfyY99ZwHPJ5Rp3Tbspwfh3HYO4X+Rv5/GOkC
 /OKb5rruDrOqq/q+JN+uC7+nNJ4Joe2iDcncz3iKUpnYvOLm1rNOKWoHxm4fCHWEJv0G0LgECGl
 K80bJ8oadkV9b1GChhYvyNh0jKtLxpXerF/r77p50M5rSy5f9jGy4yvvTtFZAep7WkMOmPNzzN5
 TXzCQXpBsoQWIMByUTOicWGm7ao9j++P2HhCcgNaKTTI1jnSIw5/37qat8DWVNX1JCzsIduXg0I
 gU7
X-Received: by 2002:a17:907:7f90:b0:b8a:f2d7:9942 with SMTP id
 a640c23a62f3a-b8face51f34mr360017366b.3.1771260342969; 
 Mon, 16 Feb 2026 08:45:42 -0800 (PST)
Received: from laptok.lan (87-205-5-123.static.ip.netia.com.pl. [87.205.5.123])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8fc735d185sm264683866b.14.2026.02.16.08.45.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Feb 2026 08:45:42 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: alexander.deucher@amd.com,
	harry.wentland@amd.com,
	sunpeng.li@amd.com
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, siqueira@igalia.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, tomasz.pakula.oficjalny@gmail.com,
 bernhard.berger@gmail.com, michel.daenzer@mailbox.org, daniel@fooishbar.org
Subject: [PATCH v4 18/27] drm/amd/display: Restore ALLM support in HDMI vsif
Date: Mon, 16 Feb 2026 17:45:07 +0100
Message-ID: <20260216164516.36803-19-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260216164516.36803-1-tomasz.pakula.oficjalny@gmail.com>
References: <20260216164516.36803-1-tomasz.pakula.oficjalny@gmail.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alexander.deucher@amd.com,m:harry.wentland@amd.com,m:sunpeng.li@amd.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:siqueira@igalia.com,m:amd-gfx@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:tomasz.pakula.oficjalny@gmail.com,m:bernhard.berger@gmail.com,m:michel.daenzer@mailbox.org,m:daniel@fooishbar.org,m:tomaszpakulaoficjalny@gmail.com,m:bernhardberger@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[16];
	ARC_NA(0.00)[];
	TAGGED_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[tomaszpakulaoficjalny@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tomaszpakulaoficjalny@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,igalia.com,lists.freedesktop.org,vger.kernel.org,mailbox.org,fooishbar.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: B26341465A5
X-Rspamd-Action: no action

[Why]
Support for triggering ALLM in modern TVs is missing.

When HDMI vsif was added in 2019:
commit 3c2381b92cba ("drm/amd/display: add support for VSIP info packet")
it was improperly handeled as HDMI actually has two separate vsifs. The
implementation was based on H14b-vsif and ALLM bit was messing it up
because H14b-vsif doesn't support ALLM. It was later removed in:
commit 75f77aafe281 ("drm/amd/display: Send H14b-VSIF specified in HDMI")

ALLM is supported by hf-vsif (HDMI Forum) instead.

[How]
Add proper logic to construct either h14b-vsif or hf-vsif based on
required capabilities. Currently, only ALLM from hf-vsif is supported.

Turns out, hf-vsif is almost identical to h14b-vsif, BUT has additional
two bytes of data after OUI. First byte is static and seems like
a version supported by leftover define. Second byte consists of 3D and
ALLM bits.

Implement logic to offset 3D data if building hf-vsif.

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 .../display/modules/info_packet/info_packet.c | 113 ++++++++++++------
 1 file changed, 74 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/modules/info_packet/info_packet.c b/drivers/gpu/drm/amd/display/modules/info_packet/info_packet.c
index 294f56d20062..8e110c86bdd4 100644
--- a/drivers/gpu/drm/amd/display/modules/info_packet/info_packet.c
+++ b/drivers/gpu/drm/amd/display/modules/info_packet/info_packet.c
@@ -49,7 +49,10 @@ enum vsc_packet_revision {
 };
 
 #define HDMI_INFOFRAME_TYPE_VENDOR 0x81
-#define HF_VSIF_VERSION 1
+#define HDMI_INFOFRAME_LENGTH_MASK 0x1F
+#define HF_VSIF_VERSION  1
+#define HF_VSIF_3D_BIT   0
+#define HF_VSIF_ALLM_BIT 1
 
 // VTEM Byte Offset
 #define VTEM_PB0		0
@@ -496,9 +499,29 @@ void mod_build_vsc_infopacket(const struct dc_stream_state *stream,
 	}
 }
 
+static bool is_hdmi_vic_mode(const struct dc_stream_state *stream)
+{
+	if (stream->timing.hdmi_vic == 0)
+		return false;
+
+	if (stream->timing.h_total < 3840 ||
+	    stream->timing.v_total < 2160)
+		return false;
+
+	/* 3D/ALLM forces HDMI VIC -> CTA VIC translation */
+	if (stream->view_format != VIEW_3D_FORMAT_NONE)
+		return false;
+
+	if (stream->link->local_sink->edid_caps.allm)
+		return false;
+
+	return true;
+}
+
 /**
  *  mod_build_hf_vsif_infopacket - Prepare HDMI Vendor Specific info frame.
  *                                 Follows HDMI Spec to build up Vendor Specific info frame
+ *                                 Conforms to h14b-vsif or hf-vsif based on the capabilities
  *
  *  @stream:      contains data we may need to construct VSIF (i.e. timing_3d_format, etc.)
  *  @info_packet: output structure where to store VSIF
@@ -506,63 +529,75 @@ void mod_build_vsc_infopacket(const struct dc_stream_state *stream,
 void mod_build_hf_vsif_infopacket(const struct dc_stream_state *stream,
 		struct dc_info_packet *info_packet)
 {
-		unsigned int length = 5;
 		bool hdmi_vic_mode = false;
+		bool allm = false;
+		bool stereo = false;
 		uint8_t checksum = 0;
-		uint32_t i = 0;
+		uint8_t offset = 0;
+		uint8_t i = 0;
+		uint8_t length = 5;
+		uint32_t oui = HDMI_IEEE_OUI;
 		enum dc_timing_3d_format format;
 
 		info_packet->valid = false;
+
 		format = stream->timing.timing_3d_format;
 		if (stream->view_format == VIEW_3D_FORMAT_NONE)
 			format = TIMING_3D_FORMAT_NONE;
+		stereo = format != TIMING_3D_FORMAT_NONE;
+		hdmi_vic_mode = is_hdmi_vic_mode(stream);
 
-		if (stream->timing.hdmi_vic != 0
-				&& stream->timing.h_total >= 3840
-				&& stream->timing.v_total >= 2160
-				&& format == TIMING_3D_FORMAT_NONE)
-			hdmi_vic_mode = true;
-
-		if ((format == TIMING_3D_FORMAT_NONE) && !hdmi_vic_mode)
+		if (!stereo && !hdmi_vic_mode && !allm)
 			return;
 
-		info_packet->sb[1] = 0x03;
-		info_packet->sb[2] = 0x0C;
-		info_packet->sb[3] = 0x00;
+		if (allm)
+			oui = HDMI_FORUM_IEEE_OUI;
 
-		if (format != TIMING_3D_FORMAT_NONE)
-			info_packet->sb[4] = (2 << 5);
+		info_packet->sb[1] = oui & 0xFF;
+		info_packet->sb[2] = (oui >> 8) & 0xFF;
+		info_packet->sb[3] = (oui >> 16) & 0xFF;
 
-		else if (hdmi_vic_mode)
-			info_packet->sb[4] = (1 << 5);
-
-		switch (format) {
-		case TIMING_3D_FORMAT_HW_FRAME_PACKING:
-		case TIMING_3D_FORMAT_SW_FRAME_PACKING:
-			info_packet->sb[5] = (0x0 << 4);
-			break;
-
-		case TIMING_3D_FORMAT_SIDE_BY_SIDE:
-		case TIMING_3D_FORMAT_SBS_SW_PACKED:
-			info_packet->sb[5] = (0x8 << 4);
-			length = 6;
-			break;
-
-		case TIMING_3D_FORMAT_TOP_AND_BOTTOM:
-		case TIMING_3D_FORMAT_TB_SW_PACKED:
-			info_packet->sb[5] = (0x6 << 4);
-			break;
-
-		default:
-			break;
+		if (oui == HDMI_FORUM_IEEE_OUI) {
+			offset = 2;
+			length += 2;
+			info_packet->sb[4] = HF_VSIF_VERSION;
+			info_packet->sb[5] = stereo << HF_VSIF_3D_BIT;
+			info_packet->sb[5] |= allm << HF_VSIF_ALLM_BIT;
 		}
 
-		if (hdmi_vic_mode)
+		if (stereo) {
+			info_packet->sb[4 + offset] = (2 << 5);
+
+			switch (format) {
+			case TIMING_3D_FORMAT_HW_FRAME_PACKING:
+			case TIMING_3D_FORMAT_SW_FRAME_PACKING:
+				info_packet->sb[5 + offset] = (0x0 << 4);
+				break;
+
+			case TIMING_3D_FORMAT_SIDE_BY_SIDE:
+			case TIMING_3D_FORMAT_SBS_SW_PACKED:
+				info_packet->sb[5 + offset] = (0x8 << 4);
+				++length;
+				break;
+
+			case TIMING_3D_FORMAT_TOP_AND_BOTTOM:
+			case TIMING_3D_FORMAT_TB_SW_PACKED:
+				info_packet->sb[5 + offset] = (0x6 << 4);
+				break;
+
+			default:
+				break;
+			}
+
+		/* Doesn't need the offset as it can't be used with hf-vsif */
+		} else if (hdmi_vic_mode) {
+			info_packet->sb[4] = (1 << 5);
 			info_packet->sb[5] = stream->timing.hdmi_vic;
+		}
 
 		info_packet->hb0 = HDMI_INFOFRAME_TYPE_VENDOR;
 		info_packet->hb1 = 0x01;
-		info_packet->hb2 = (uint8_t) (length);
+		info_packet->hb2 = length & HDMI_INFOFRAME_LENGTH_MASK;
 
 		checksum += info_packet->hb0;
 		checksum += info_packet->hb1;
-- 
2.53.0

