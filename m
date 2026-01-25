Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KIDrNIpjdmmVQAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jan 2026 19:40:10 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88A2F81C17
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jan 2026 19:40:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC2E910E381;
	Sun, 25 Jan 2026 18:40:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ib+6uaRR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AFDD10E378
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jan 2026 18:39:37 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-b8845a47e39so63020966b.3
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jan 2026 10:39:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769366376; x=1769971176; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZSHN2Af/L95S4Os5yYFaV1hvvj2RmaOdeVqj+0nIWBY=;
 b=ib+6uaRRl/3b/q6WIQGhXS2sR6+UYihW99kbSNrdZ7WMNCYILfZ08xuT+ogDvwUHnb
 24Y/erCaoxzAXIcW//5axviBnR4u/ZdPXwXf1O1kIKLqxY9GC3KdMSTHajtyXcJ30/yX
 4IQCU5+n5YVzd7t8UmSRftTa1dzHs34Nt5fcPQpQexURLxzQIXrn+SE2GR8JG0IJyVLz
 cNLmcTQTrhIoepXwRm/jT9vYNqnpIMpWtnxtXw9Pwbjoli8zBH8P4Jy7tZnEJXOmk5jR
 +bfuYfL22KnC+mMWWSFtn1Y1qOscgQOT3stvi8kqb//GIg2XIX4uHUc41PCzbWWG1iAz
 M2wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769366376; x=1769971176;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ZSHN2Af/L95S4Os5yYFaV1hvvj2RmaOdeVqj+0nIWBY=;
 b=MR96531YOAoqdYsGxsvJM1cmVxMHk1j9m9EiIpWlLR3sliAG0trgNgrR8lW+e6vL+b
 Dby7SDuZJmqf6+vJsKMrwuvKqy/J9iPWUUDUaWYgtrIqvCVnc4l1GznJjBTdpCd+K+4K
 obnISGtwzb0OVl6ES0XzS3xwfLvN6qANbG0KNDdxyYddt1eFsESFxJufup+zyBA8DwSb
 uvN2jfynuXTF8YRBPuCtnzUrcZLxeOX6xfbW4kQ/nTdoEvU6LnUTb6eK9IrxzO9L8b26
 tpLR3Y4qUwiMDztYdU83QCnNN9QFihXDqvlju9JyOQOv1a8qet7pPX1yt+wSYXe5YdGE
 8hYw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVGycMSU6ghGLmX7gJ0VdKpwyHx/HjRHCkaj9wKjMqu/pKi/kGo1HU7kvXXNzMqTBPEf8cEzKzbL6Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzlAJUwoMBJAPu0svFo7dwldoVBs6x6A4mOwcIrqkYY1uoYHPUZ
 7OU26Xs3KS2IoNrDyCCLt7kwwnvjaxjKanGagfZ6DEmEycAFv2GE9qQk
X-Gm-Gg: AZuq6aKagWLu/DMCeZjpHADShE1zhabNHPfHdTALaYY9Gkivj7bYc0c41qqd1HlqVAC
 wFnVcsioUMrmyn4khn/RVLpXuaCRutcxfTos6SZguS3GOb8WGKyMRCa+AcvU11NGqY1QajaO0pE
 zn1g5HCygGALeE/t7n3/CC3N8dtXBwhV3FiHlmDeeZdvwuKOu+o70ZUMVpvFj4OMrC4F602kmq3
 AW6/RZpEIXUmumIfP96QagiBWQyzdNQpc9x2DesUq7rt7RLqIejXDHVxqmmnDvhwVrVjqnJjpU/
 lK15a9wt954UrJwQUlJ56CKC+Dxgm2wlOrXvRzujWS7xaiQkBMhCI6dKP3W9yrNXBdzh7n44DG7
 jQrEFhVV7rmJk9avjykvf4PBwwZAtdbJdYvWXOc+qc9UL3Pt9oIGIzTkxF1KEzGJPBxPP4F2Me0
 0MWEttY5u8DerB1eNrxjYSz1aYG9MHGGG3M7+dJjoAPt+iXfMFn+iN8AbpP6CaQrlQZiVfOu3z4
 og=
X-Received: by 2002:a17:906:7955:b0:b87:515e:654a with SMTP id
 a640c23a62f3a-b8d2e8fb72emr80881766b.2.1769366375441; 
 Sun, 25 Jan 2026 10:39:35 -0800 (PST)
Received: from laptok.lan (87-205-5-123.static.ip.netia.com.pl. [87.205.5.123])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b885b3dad3asm499133766b.12.2026.01.25.10.39.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Jan 2026 10:39:35 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: alexander.deucher@amd.com,
	harry.wentland@amd.com,
	sunpeng.li@amd.com
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, siqueira@igalia.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, tomasz.pakula.oficjalny@gmail.com,
 bernhard.berger@gmail.com, michel.daenzer@mailbox.org, daniel@fooishbar.org
Subject: [PATCH v2 14/19] drm/amd/display: Restore ALLM support in HDMI vsif
Date: Sun, 25 Jan 2026 19:39:09 +0100
Message-ID: <20260125183914.459228-15-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260125183914.459228-1-tomasz.pakula.oficjalny@gmail.com>
References: <20260125183914.459228-1-tomasz.pakula.oficjalny@gmail.com>
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
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[tomaszpakulaoficjalny@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:alexander.deucher@amd.com,m:harry.wentland@amd.com,m:sunpeng.li@amd.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:siqueira@igalia.com,m:amd-gfx@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:tomasz.pakula.oficjalny@gmail.com,m:bernhard.berger@gmail.com,m:michel.daenzer@mailbox.org,m:daniel@fooishbar.org,m:tomaszpakulaoficjalny@gmail.com,m:bernhardberger@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tomaszpakulaoficjalny@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,igalia.com,lists.freedesktop.org,vger.kernel.org,mailbox.org,fooishbar.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 88A2F81C17
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
 .../display/modules/info_packet/info_packet.c | 112 ++++++++++++------
 1 file changed, 73 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/modules/info_packet/info_packet.c b/drivers/gpu/drm/amd/display/modules/info_packet/info_packet.c
index 294f56d20062..1a1ddcdb4362 100644
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
@@ -496,9 +499,28 @@ void mod_build_vsc_infopacket(const struct dc_stream_state *stream,
 	}
 }
 
+static bool is_hdmi_vic_mode(const struct dc_stream_state *stream)
+{
+	bool allm = stream->link->local_sink->edid_caps.allm;
+	bool stereo = stream->view_format != VIEW_3D_FORMAT_NONE;
+
+	if (stream->timing.hdmi_vic == 0)
+		return false;
+
+	if (stream->timing.h_total < 3840 ||
+	    stream->timing.v_total < 2160)
+		return false;
+
+	if (stereo || allm)
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
@@ -506,63 +528,75 @@ void mod_build_vsc_infopacket(const struct dc_stream_state *stream,
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
+		info_packet->sb[1] = oui & 0xff;
+		info_packet->sb[2] = (oui >> 8) & 0xff;
+		info_packet->sb[3] = (oui >> 16) & 0xff;
 
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
+			info_packet->sb[5] = allm << HF_VSIF_ALLM_BIT;
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
2.52.0

